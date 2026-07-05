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
import urllib.request

# Files matching these fragments must never be reachable from a submitted Dockerfile.
FORBIDDEN_DOCKERFILE_FRAGMENTS = (".aws", "etc/biocontainers-ci")

# Required LABELs and the human message emitted when they are missing/invalid.
REQUIRED_LABELS = ("software", "base_image", "software.version", "version", "about.summary",
                   "about.home", "about.license")


def _write_report(path, report):
    with open(path, "w") as fh:
        json.dump(report, fh, indent=2, sort_keys=True)


def _set_output(**kwargs):
    """Expose values to later workflow steps via $GITHUB_OUTPUT (no-op locally)."""
    out = os.environ.get("GITHUB_OUTPUT")
    if not out:
        return
    with open(out, "a") as fh:
        for key, value in kwargs.items():
            fh.write("%s=%s\n" % (key, value))


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

    # Conventional BioContainers tag: v<software.version>_cv<container-version>
    # (matches the historical tags on DockerHub, e.g. v1.2.38-2-deb_cv1).
    tag = "v%s_cv%s" % (version, container_version or "1")

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
            if _http_status("https://bio.tools/api/tool/%s/?format=json" % software) != 404:
                warnings.append("A bio.tools entry may match this software (https://bio.tools/%s); "
                                "add extra.identifiers.biotools if it is the same tool." % software)

        if software and _http_status(
                "https://bioconda.github.io/recipes/%s/README.html" % software) == 200:
            warnings.append("A bioconda package already exists for '%s'; if it is the same tool, prefer "
                            "updating the recipe there to avoid duplicates." % software)

    ok = not errors
    return ok, (software or container), tag, errors, warnings


def cmd_detect(args):
    with open(args.changed_files) as fh:
        changed = fh.read().splitlines()
    container, version, errors = detect_container(changed, args.workdir)
    report = {
        "container": container,
        "version": version,
        "ok": not errors,
        "errors": errors,
        "warnings": [],
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
    report = {
        "container": args.container,
        "version": args.version,
        "software": software,
        "tag": tag,
        "ok": ok,
        "errors": errors,
        "warnings": warnings,
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
