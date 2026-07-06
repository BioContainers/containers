---
applyTo: "**/Dockerfile"
---

# Reviewing a BioContainers Dockerfile

When the diff touches a `Dockerfile`, review it as **untrusted contributor input** and
lead with security. For each concern, cite the exact line and give the safer alternative.

Hard stops (should block the PR):
- Any embedded credential — AWS key (`AKIA…`), GitHub token (`ghp_…`), Slack token,
  private key block, or a real-looking `password=` / `secret=` / `api_key=` value.

Always question (comment, don't necessarily block):
- `curl … | sh` / `wget … | bash` — a remote script executed at build time. Which domain?
  Is it pinned? Prefer downloading a tagged release and verifying a checksum.
- `http://` downloads, `ADD <url>`, URL shorteners, pastebins/gists, bare-IP hosts,
  `--insecure` / `--no-check-certificate`.
- `FROM` that is not `biocontainers/*` or `quay.io/biocontainers/*`.
- Unpinned or typosquatted package installs; `chmod 777`; `sudo`; running as root without
  a final `USER biodocker`.

Also confirm the required LABELs are present and coherent: `software`,
`software.version` (= the version directory name), `version`, `base_image`,
`about.summary`, `about.home`, `about.license` (SPDX id).

Prefer one precise comment on the offending line over a broad summary.
