# BioContainers — Copilot review & chat instructions

This repository accepts **community pull requests that each add or update exactly one
container**, laid out as `<tool>/<version>/Dockerfile` (an optional
`<tool>/<version>/test-cmds.txt` holds one smoke-test command per line). Contributors
are trusted only as far as review can verify, so when you review a PR here, **treat the
Dockerfile as untrusted input and prioritise security and provenance over style.**

## What to flag on every container PR

Call these out explicitly, cite the **exact line**, and explain the risk in one sentence:

- **Remote code execution at build time** — `curl … | sh`, `wget … | bash`, or any
  pipe of a downloaded script into an interpreter. Name the domain and ask the author to
  justify trusting it; prefer a pinned release download verified with a checksum.
- **Insecure or unverifiable downloads** — plain `http://`, URL shorteners
  (`bit.ly`, `t.co`, …), pastebins/gists, bare IP addresses, `ADD <url>` (no checksum),
  or `--insecure` / `--no-check-certificate`.
- **Embedded secrets** — any AWS key, GitHub/Slack token, private key, or
  `password=`/`api_key=` value. This must block the PR; the credential is already in
  git history and must be rotated.
- **Base image** — the `FROM` should be an official `biocontainers/*` (or
  `quay.io/biocontainers/*`) image. Anything else warrants an explicit justification.
- **Package provenance** — installs without a pinned version, or package names that look
  typosquatted or unrelated to the tool being packaged.
- **Excess privilege / footprint** — `chmod 777`, `sudo`, opening ports, writing outside
  the build, running as root without returning to `USER biodocker`, or anything that
  "phones home".

## Metadata the CI already enforces (reinforce, don't duplicate)

Required LABELs: `software`, `software.version` (must equal the version directory),
`version`, `base_image`, `about.summary` (≥ 20 chars), `about.home`, `about.license`
(an SPDX id). The image tag is `<version>_cv<version-label>`. If any of these look wrong
or implausible, mention it, but the Python validator (`.github/scripts/validate.py`) is
the source of truth for pass/fail — your job is the judgement calls it cannot encode.

## Style

Keep comments specific and actionable. Prefer one precise comment on the risky line over
a general summary. Do not rewrite the whole Dockerfile; suggest the minimal safer form.
