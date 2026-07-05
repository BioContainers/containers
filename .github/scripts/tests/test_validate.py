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
    assert tag == "v2.1.5-7-deb_cv1"
    assert errors == []


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


def test_check_tag_defaults_cv1_when_version_blank(tmp_path, monkeypatch):
    _no_network(monkeypatch)
    df = tmp_path / "Dockerfile"
    df.write_text("FROM x\n")
    labels = _good_labels()
    labels["version"] = ""
    ok, _, tag, errors, _ = validate.check_labels("abyss", "2.1.5-7-deb", labels, str(df))
    # version label blank is itself an error, but the tag still falls back to _cv1
    assert tag == "v2.1.5-7-deb_cv1"
    assert ok is False
