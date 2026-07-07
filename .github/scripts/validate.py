#!/usr/bin/env python3
"""BioContainers CI validation — replaces the label/structure checks that used to
live in the `biocontainersci` engine, with zero third-party dependencies.

Two sub-commands:

  detect  — from the list of files changed in a PR / merge commit, work out the
            single container being touched and enforce the repo's PR rules.
  check   — given a built image's LABELs, validate the required metadata, compute
            the DockerHub tag, and run advisory (non-fatal) checks.

Both write a `report.json` that the reporter workflow turns into a commit status
and a PR comment. `check` and structural failures in `detect` exit non-zero so the
job fails; advisory findings only populate `warnings`.
"""
import argparse
import json
import os
import re
import sys
import urllib.error
import urllib.request

# Files matching these fragments must never be reachable from a submitted Dockerfile.
FORBIDDEN_DOCKERFILE_FRAGMENTS = (".aws", "etc/biocontainers-ci")

# Required LABELs and the human message emitted when they are missing/invalid.
REQUIRED_LABELS = ("software", "base_image", "software.version", "version", "about.summary",
                   "about.home", "about.license")

# Container dir names, version dir names and the computed tag all end up as Docker
# tags, filesystem paths, S3 keys and a commit-status context, and some are consumed
# by shell steps — so they must be strictly safe. A legal Docker tag is already a
# subset of this, so rejecting anything else is free.
SAFE_TOKEN_RE = re.compile(r"^[A-Za-z0-9._-]+$")

# --- Dockerfile risk surface -------------------------------------------------
# A submitted Dockerfile is arbitrary contributor input. These patterns lift the
# lines a human reviewer must look at up into the PR comment, so nothing risky is
# ever merged without an explicit sign-off. Two tiers:
#   SECRET_RULES  — high-confidence embedded credentials. These BLOCK the PR (the
#                   secret is already in git history and must be rotated). Kept
#                   deliberately narrow (structured tokens) so a legitimate PR is
#                   never blocked by a false positive.
#   REVIEW_RULES  — "please verify this" heuristics. These NEVER block (plenty of
#                   legitimate containers do `curl | sh`); they populate an advisory
#                   reviewer checklist. The middle field is show_snippet: whether it
#                   is safe to echo the matched line back into the public PR comment
#                   (False for the credential heuristic, so we never leak a value).
SECRET_RULES = (
    (re.compile(r"\bAKIA[0-9A-Z]{16}\b"), "an AWS access key ID"),
    (re.compile(r"\bASIA[0-9A-Z]{16}\b"), "an AWS temporary access key ID"),
    (re.compile(r"-----BEGIN (?:RSA |EC |OPENSSH |DSA |PGP )?PRIVATE KEY-----"), "a private key"),
    (re.compile(r"\bghp_[A-Za-z0-9]{36}\b"), "a GitHub personal access token"),
    (re.compile(r"\bgho_[A-Za-z0-9]{36}\b"), "a GitHub OAuth token"),
    (re.compile(r"\bgithub_pat_[A-Za-z0-9_]{22,}\b"), "a GitHub fine-grained token"),
    (re.compile(r"(?i)aws_secret_access_key(?:\s*[=:]\s*|\s+)[\"']?[A-Za-z0-9/+]{40}\b"), "an AWS secret access key"),
    (re.compile(r"\bxox[baprs]-[A-Za-z0-9-]{10,}\b"), "a Slack token"),
)

# Dockerfile instructions that actually fetch or execute content; the download
# heuristics only fire inside these, so an http:// homepage in a LABEL is never
# mistaken for an insecure download. Each REVIEW rule is
# (regex, show_snippet, scope, message); scope=None means "any instruction".
FETCH_INSTR = ("RUN", "ADD", "COPY")

REVIEW_RULES = (
    (re.compile(r"(?:curl|wget)\b[^|]*\|\s*(?:sudo\s+)?(?:ba)?sh\b"), True, ("RUN",),
     "runs a remote script straight through a shell (`curl … | sh`) — confirm you trust the "
     "source; prefer a pinned download + checksum"),
    (re.compile(r"(?i)\bADD\s+https?://"), True, ("ADD",),
     "uses `ADD <url>` (no checksum, bypasses the layer cache) — prefer `curl`/`wget` with a "
     "verified checksum, or `COPY`"),
    (re.compile(r"http://[^\s\"']+"), True, FETCH_INSTR,
     "downloads over insecure `http://` — use `https://`"),
    (re.compile(r"(?i)https?://(?:pastebin\.com|[a-z0-9.-]*gist\.github|bit\.ly|tinyurl\.com|t\.co)/"),
     True, FETCH_INSTR,
     "fetches from a paste site or URL shortener — confirm what is actually being downloaded"),
    (re.compile(r"https?://\d{1,3}(?:\.\d{1,3}){3}"), True, FETCH_INSTR,
     "downloads from a bare IP address — confirm this endpoint is trusted"),
    (re.compile(r"(?i)chmod\s+(?:-R\s+)?0?777\b"), True, ("RUN",),
     "sets world-writable permissions (`chmod 777`) — scope permissions more tightly"),
    (re.compile(r"(?i)(?:--insecure|--no-check-certificate)\b"), True, ("RUN",),
     "disables TLS certificate verification (`--insecure` / `--no-check-certificate`)"),
    (re.compile(r"(?i)(?:password|passwd|secret|token|api[_-]?key)(?:\s*[=:]\s*|\s+)[\"']?\S{6,}"),
     False, ("ENV", "ARG", "RUN"),
     "may embed a credential/secret — verify that no real secret is committed"),
)

# Approved base-image prefixes; any other FROM is surfaced for a look (advisory only).
APPROVED_BASE_RE = re.compile(r"(?i)^(?:docker\.io/)?(?:quay\.io/)?biocontainers/")


def _safe(value):
    return bool(value) and SAFE_TOKEN_RE.match(value) is not None


def _write_report(path, report):
    with open(path, "w") as fh:
        json.dump(report, fh, indent=2, sort_keys=True)


def _set_output(**kwargs):
    """Expose values to later workflow steps via $GITHUB_OUTPUT (no-op locally).

    Uses the heredoc form so a value can never inject extra output lines even if it
    contained a newline (values are also charset-validated before reaching here)."""
    out = os.environ.get("GITHUB_OUTPUT")
    if not out:
        return
    with open(out, "a") as fh:
        for key, value in kwargs.items():
            value = "" if value is None else str(value)
            fh.write("%s<<__GHEOF__\n%s\n__GHEOF__\n" % (key, value))


def detect_container(changed_files, workdir="."):
    """Apply the one-container-per-PR rules. Returns (container, version, errors)."""
    errors = []
    containers = set()
    for path in changed_files:
        path = path.strip()
        if not path:
            continue
        if path.split("/")[0] == ".github":
            errors.append("Cannot modify GitHub CI files (%s)." % path)
            continue
        parts = path.split("/")
        if len(parts) < 2:
            errors.append("File not inside a container directory: %s (expected "
                          "<software>/<version>/...)." % path)
            continue
        containers.add((parts[0], parts[1]))

    if errors:
        return None, None, errors
    if len(containers) == 0:
        return None, None, ["No container files changed."]
    if len(containers) > 1:
        listed = ", ".join(sorted("%s/%s" % c for c in containers))
        return None, None, ["A pull request may only modify one container; found: %s." % listed]

    container, version = next(iter(containers))
    if not _safe(container) or not _safe(version):
        return container, version, [
            "Container and version directory names must match [A-Za-z0-9._-] "
            "(got '%s/%s')." % (container, version)]
    dockerfile = os.path.join(workdir, container, version, "Dockerfile")
    if not os.path.exists(dockerfile):
        return container, version, [
            "No Dockerfile at %s/%s/Dockerfile. The layout must be "
            "<software>/<version>/Dockerfile." % (container, version)]
    return container, version, []


def list_containers(changed_files, workdir="."):
    """All distinct <container>/<version> dirs (with a Dockerfile) touched by a
    push/merge. Unlike detect() this does not enforce one-container-per-PR — a
    direct push to master may legitimately touch several. Non-container paths and
    .github edits are ignored here (they were already gated at PR time)."""
    found = []
    for path in changed_files:
        path = path.strip()
        if not path or path.split("/")[0] == ".github":
            continue
        parts = path.split("/")
        if len(parts) < 2:
            continue
        container, version = parts[0], parts[1]
        if not _safe(container) or not _safe(version):
            continue
        key = "%s/%s" % (container, version)
        if key in found:
            continue
        if os.path.exists(os.path.join(workdir, container, version, "Dockerfile")):
            found.append(key)
    return found


def _spdx_licenses():
    url = "https://raw.githubusercontent.com/sindresorhus/spdx-license-list/main/spdx.json"
    try:
        with urllib.request.urlopen(url, timeout=20) as resp:
            return json.load(resp)
    except Exception:
        return None


def _http_status(url):
    req = urllib.request.Request(url, method="GET")
    try:
        with urllib.request.urlopen(req, timeout=20) as resp:
            return resp.status
    except urllib.error.HTTPError as exc:
        return exc.code
    except Exception:
        return None


def check_labels(container, version, labels, dockerfile):
    """Validate labels. Returns (ok, software, tag, errors, warnings)."""
    errors = []
    warnings = []

    # Static Dockerfile scan for forbidden private-path access.
    if dockerfile and os.path.exists(dockerfile):
        with open(dockerfile) as fh:
            for line in fh:
                for fragment in FORBIDDEN_DOCKERFILE_FRAGMENTS:
                    if fragment in line:
                        errors.append("Forbidden access to private path '%s' in Dockerfile." % fragment)

    labels = labels or {}

    software = labels.get("software") or ""
    if not software:
        errors.append("software label not present")
    elif re.match(r"^([a-z0-9_-])+$", software) is None:
        # Invalid characters: fall back to the directory name, like the old engine did.
        software = container

    if not labels.get("base_image"):
        errors.append("base_image label not present")

    software_version = (labels.get("software.version") or "").strip()
    if not software_version:
        errors.append("software.version label not present (upstream code version)")
    elif software_version != version:
        errors.append("software.version label ('%s') does not match the directory version ('%s')."
                      % (software_version, version))

    container_version = (labels.get("version") or "").strip()
    if not container_version:
        errors.append("version label not present (Dockerfile/container revision)")

    summary = labels.get("about.summary") or ""
    if not summary or len(summary) < 20:
        errors.append("about.summary label not present or too short (min 20 chars)")
    elif len(summary) > 200:
        warnings.append("about.summary is quite long; please keep it under 200 chars.")

    if not labels.get("about.home"):
        errors.append("about.home label not present")

    license_id = labels.get("about.license") or ""
    if not license_id:
        errors.append("about.license label not present")

    # The tag uses the version the author put in the Dockerfile, verbatim:
    # <software.version>_cv<container-version>. We do NOT force a 'v' prefix — the
    # conventional form is v<version>_cv<n> (e.g. v1.2.38-2-deb_cv1), so if it is
    # missing we recommend it below, but the container can still be merged.
    tag = "%s_cv%s" % (version, container_version or "1")
    # The tag becomes a Docker tag and is consumed by shell steps in publish.yml, so
    # it must contain only Docker-tag-safe characters. Reject anything else (a stray
    # quote/space/newline in a LABEL would otherwise be a shell-injection vector).
    if not _safe(tag) or len(tag) > 128:
        errors.append("Computed tag '%s' is not a valid Docker tag (allowed: [A-Za-z0-9._-], "
                      "max 128 chars). Check the version directory and the 'version' LABEL." % tag[:60])
    elif version and not version.startswith("v"):
        warnings.append(
            "Recommended: use the conventional 'v'-prefixed version tag "
            "(e.g. v%s_cv%s). The container can still be merged without it." % (version, container_version or "1"))

    # Advisory (non-fatal) checks — only run when the required set is otherwise fine.
    if not errors:
        if license_id.startswith("http"):
            warnings.append("about.license is a URL; it should be an SPDX identifier (e.g. GPL-3.0).")
        if "about.license_file" not in labels:
            warnings.append("Consider adding about.license_file (path in container or URL to the license).")
        else:
            spdx = _spdx_licenses()
            normalized = license_id.replace("SPDX:", "").replace("spdx:", "")
            if spdx is not None and license_id != "Custom License" and normalized not in spdx:
                warnings.append("about.license '%s' is not in the SPDX list (https://spdx.org/licenses/). "
                                "If custom, use 'Custom License' + about.license_file." % license_id)

        biotools = labels.get("extra.identifiers.biotools")
        if biotools:
            entry = biotools.strip().rstrip("/").split("/")[-1]
            if _http_status("https://bio.tools/api/tool/%s/?format=json" % entry) == 404:
                warnings.append("The declared bio.tools entry '%s' was not found; please check it." % entry)
        elif software:
            status = _http_status("https://bio.tools/api/tool/%s/?format=json" % software)
            if status is not None and status != 404:
                warnings.append("A bio.tools entry may match this software (https://bio.tools/%s); "
                                "add extra.identifiers.biotools if it is the same tool." % software)

        if software and _http_status(
                "https://bioconda.github.io/recipes/%s/README.html" % software) == 200:
            warnings.append("A bioconda package already exists for '%s'; if it is the same tool, prefer "
                            "updating the recipe there to avoid duplicates." % software)

    ok = not errors
    return ok, (software or container), tag, errors, warnings


def scan_dockerfile_risks(dockerfile_path):
    """Scan a submitted Dockerfile for content a reviewer must see.

    Returns (secrets, checklist):
      secrets   — [{line, msg}]           high-confidence embedded credentials (blocking)
      checklist — [{line, snippet, msg}]  advisory 'please verify' items (never blocking;
                  snippet is '' when it is not safe to echo the line into a public comment).
    Comment/blank lines are ignored; only the first FROM is policy-checked.
    """
    secrets, checklist = [], []
    if not (dockerfile_path and os.path.exists(dockerfile_path)):
        return secrets, checklist
    with open(dockerfile_path, errors="replace") as fh:
        raw_lines = fh.read().splitlines()

    # Fold each Dockerfile instruction into one logical unit: both backslash
    # continuations AND heredoc bodies (`RUN <<EOF … EOF`) are attached to their
    # instruction, so neither a split `curl … \`↵`| sh` nor a heredoc'd
    # `curl … | sh` can slip past the scoped regexes. Each entry is
    # (start_line, INSTRUCTION, joined_text).
    heredoc_re = re.compile(r"<<[-~]?\s*[\"']?([A-Za-z_][A-Za-z0-9_]*)[\"']?")
    logical = []
    i, n = 0, len(raw_lines)
    while i < n:
        raw = raw_lines[i]
        stripped = raw.strip()
        if not stripped or stripped.startswith("#"):
            i += 1
            continue
        m = re.match(r"([A-Za-z]+)", stripped)
        instr = m.group(1).upper() if m else ""
        start = i + 1
        parts = [raw]
        # heredocs are only valid on RUN/COPY/ADD; ignore `<<` elsewhere
        terms = heredoc_re.findall(raw) if instr in FETCH_INSTR else []
        while raw.rstrip().endswith("\\") and i + 1 < n:   # backslash continuations
            i += 1
            raw = raw_lines[i]
            parts.append(raw)
            if instr in FETCH_INSTR:
                terms += heredoc_re.findall(raw)
        for term in terms:                                  # consume heredoc bodies
            while i + 1 < n:
                i += 1
                raw = raw_lines[i]
                parts.append(raw)
                if raw.strip() == term:
                    break
        logical.append((start, instr, "\n".join(parts)))
        i += 1

    stage_names, flagged_bases = set(), set()
    for start, instr, text in logical:
        snippet = text.splitlines()[0].strip()[:160]
        has_secret = False
        for rx, what in SECRET_RULES:
            if rx.search(text):
                has_secret = True
                secrets.append({"line": start, "msg": "line %d appears to contain %s" % (start, what)})
        for rx, show, scope, msg in REVIEW_RULES:
            if scope is not None and instr not in scope:
                continue
            if rx.search(text):
                # never echo a line that also tripped a secret rule (no token leak)
                safe = show and not has_secret
                checklist.append({"line": start, "snippet": snippet if safe else "", "msg": msg})
        if instr == "FROM":
            first = re.sub(r"(?i)^\s*FROM\s+", "", text.splitlines()[0].strip())
            toks = [t for t in first.split() if not t.startswith("--")]  # drop --platform= etc
            if not toks:
                continue
            image = toks[0]
            # flag every stage whose base is neither approved nor a prior build stage
            if (image.lower() not in stage_names and image.lower() not in flagged_bases
                    and not APPROVED_BASE_RE.match(image)):
                flagged_bases.add(image.lower())
                checklist.append({"line": start, "snippet": snippet,
                                  "msg": "base image `%s` is not an official `biocontainers/*` image "
                                         "— confirm it is an approved base" % image[:80]})
            if len(toks) >= 3 and toks[1].upper() == "AS":
                stage_names.add(toks[2].lower())
    return secrets, checklist


def _fmt_checklist(item):
    """Render one advisory checklist item as a single sanitizable string for the report."""
    if item.get("snippet"):
        return "%s  _(line %d: `%s`)_" % (item["msg"], item["line"], item["snippet"])
    return "%s  _(line %d)_" % (item["msg"], item["line"])


def cmd_detect(args):
    with open(args.changed_files) as fh:
        changed = fh.read().splitlines()
    container, version, errors = detect_container(changed, args.workdir)
    checklist = []
    if container and version and not errors:
        dockerfile = os.path.join(args.workdir, container, version, "Dockerfile")
        secrets, checklist = scan_dockerfile_risks(dockerfile)
        for s in secrets:
            errors.append(s["msg"] + " — remove it and rotate the credential before resubmitting.")
    report = {
        "container": container,
        "version": version,
        "ok": not errors,
        "errors": errors,
        "warnings": [],
        "review_checklist": [_fmt_checklist(c) for c in checklist],
        "pr_number": os.environ.get("PR_NUMBER") or None,
        "head_sha": os.environ.get("HEAD_SHA") or None,
        "software": container,
        "tag": None,
    }
    _write_report(args.out, report)
    if container and version:
        _set_output(container=container, version=version,
                    dockerfile="%s/%s/Dockerfile" % (container, version))
    if errors:
        for e in errors:
            print("ERROR: " + e, file=sys.stderr)
        return 1
    print("Detected container %s version %s" % (container, version))
    return 0


def cmd_check(args):
    with open(args.labels) as fh:
        raw = fh.read().strip()
    labels = json.loads(raw) if raw and raw != "null" else {}
    ok, software, tag, errors, warnings = check_labels(
        args.container, args.version, labels, args.dockerfile)
    secrets, checklist = scan_dockerfile_risks(args.dockerfile)
    for s in secrets:
        errors.append(s["msg"] + " — remove it and rotate the credential before resubmitting.")
    if secrets:
        ok = False
    report = {
        "container": args.container,
        "version": args.version,
        "software": software,
        "tag": tag,
        "ok": ok,
        "errors": errors,
        "warnings": warnings,
        "review_checklist": [_fmt_checklist(c) for c in checklist],
        "pr_number": os.environ.get("PR_NUMBER") or None,
        "head_sha": os.environ.get("HEAD_SHA") or None,
    }
    _write_report(args.out, report)
    _set_output(software=software, tag=tag, ok=str(ok).lower())
    for w in warnings:
        print("WARNING: " + w, file=sys.stderr)
    for e in errors:
        print("ERROR: " + e, file=sys.stderr)
    if not ok:
        return 1
    print("Labels OK for %s -> tag %s" % (software, tag))
    return 0


def cmd_list(args):
    with open(args.changed_files) as fh:
        changed = fh.read().splitlines()
    containers = list_containers(changed, args.workdir)
    matrix = [{"path": c, "container": c.split("/")[0], "version": c.split("/", 1)[1]}
              for c in containers]
    _set_output(matrix=json.dumps(matrix))
    if args.out:
        with open(args.out, "w") as fh:
            json.dump(matrix, fh)
    print("Containers in this push: %s" % (containers or "none"))
    return 0


def build_parser():
    parser = argparse.ArgumentParser(description="BioContainers CI validation")
    sub = parser.add_subparsers(dest="command", required=True)

    lst = sub.add_parser("list", help="List all changed containers in a push (for a build matrix)")
    lst.add_argument("--changed-files", required=True)
    lst.add_argument("--workdir", default=".")
    lst.add_argument("--out", default="")
    lst.set_defaults(func=cmd_list)

    d = sub.add_parser("detect", help="Detect the single changed container and enforce PR rules")
    d.add_argument("--changed-files", required=True)
    d.add_argument("--workdir", default=".")
    d.add_argument("--out", default="report.json")
    d.set_defaults(func=cmd_detect)

    c = sub.add_parser("check", help="Validate labels and compute the DockerHub tag")
    c.add_argument("--container", required=True)
    c.add_argument("--version", required=True)
    c.add_argument("--labels", required=True, help="JSON file with the image's .Config.Labels")
    c.add_argument("--dockerfile", required=True)
    c.add_argument("--out", default="report.json")
    c.set_defaults(func=cmd_check)
    return parser


def main(argv=None):
    args = build_parser().parse_args(argv)
    return args.func(args)


if __name__ == "__main__":
    sys.exit(main())
