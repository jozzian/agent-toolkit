---
type: Routine
title: Secret Scan
description: Finds secret-shaped content sitting in a working tree, runnable at any point in a session, not gated on a commit ever happening. Prefers repo-guardian's rg-scan when available; falls back to a plain pattern grep otherwise.
tags: [security, secrets, git]
timestamp: 2026-09-14
status: adopted; canonical, tool-neutral version. Do not fork a per-tool copy of this content.
---

# Secret Scan

A self-contained routine any agent can run at any point in a session:
not gated on a commit ever happening, not a one-time pre-push check. Run
it right after writing any file that could plausibly hold a credential,
whenever picking up a project the agent has not worked in recently, and
any time before telling a human "safe to push or share this."

## What to do

1. Prefer a real scanner over the pattern grep below when one is on
   PATH: `rg-scan` (from
   [repo-guardian](https://github.com/jozzian/repo-guardian)) wraps
   gitleaks with a redaction guarantee (no secret value ever reaches its
   output, even partially), stable fingerprints that dedupe the same
   leak across the working tree and full commit history, and a
   scanner-owned allowlist a scanned repo cannot weaken from inside
   itself. Run `rg-scan <path>` (add `--mode working-tree` to skip
   history for a quick check). Exit code 0 means clean, 1 means findings
   are present (go to step 3 below for each), 2 means the scanner itself
   failed (missing repo, missing gitleaks) — fall through to the manual
   steps rather than reporting a false clean.
2. If `rg-scan` is not available, fall back to the manual check:
   1. List everything in the working tree that is not gitignored:
      `git status --porcelain --ignored=no` (or, with no git repo yet,
      walk the tree directly).
   2. Grep that file set for secret-shaped content, not just filenames
      like `.env`, since a secret can land anywhere:
      - Assignment patterns:
        `(?i)(password|passwd|secret|token|api[_-]?key|access[_-]?key)\s*[:=]\s*['"]?[A-Za-z0-9+/_-]{8,}`
      - Cloud key prefixes: `AKIA[0-9A-Z]{16}`, `AIza[0-9A-Za-z_-]{35}`,
        `xox[baprs]-`, `ghp_[0-9A-Za-z]{36}`
      - Private key headers:
        `-----BEGIN (RSA |EC |OPENSSH )?PRIVATE KEY-----`
      - Generic filenames commonly used for credentials: `.env`,
        `.env.*` (not `.env.example`), `credentials.json`, `*.pem`,
        `id_rsa*`, `*.key`
   This fallback has no redaction guarantee, no history coverage, and a
   higher false-positive rate than rg-scan — treat it as a stopgap for
   when the real scanner is not installed, not an equally good
   substitute.
3. For every finding (from either path), check two things, not one:
   - Is this file covered by `.gitignore`? If not, that is the finding.
     Fix `.gitignore` before doing anything else, even if nothing has
     been committed yet.
   - Is the file staged or already committed (`git log --all -- <file>`,
     `git diff --cached -- <file>`)? If yes, this is a live incident, not
     a preventable one. Flag it to the human explicitly and recommend
     rotating the credential, not just untracking the file.
4. Report findings plainly: file, which pattern or rule matched, whether
   it is gitignored, whether it has ever been committed. Do not silently
   fix and move on if a live commit is involved; that needs the human's
   explicit awareness, not just a quiet patch.

## Why this exists as a routine, not just a commit-time rule

Rule 12 in `rules/rules-for-prototyping.md` ("before every commit, check
for what shouldn't be in it") only fires at the moment someone runs
`git commit`. A secret can sit exposed in a working tree for an
arbitrary amount of time before that ever happens. This routine exists
to be run proactively, independent of git state.

## Invocation

Explicit invocation applies this routine to the current working tree,
right now. A consuming project or an agent configuration may wire it in
as an automatic trigger (for example, right after any file write in a
session, or alongside rule 3's session-start state check) so it runs
without being asked each time.

This file, by itself, cannot make that automatic. It states what the
routine does once invoked; whether it runs by default in a given tool is
a property of that tool's own configuration, not of this file.
