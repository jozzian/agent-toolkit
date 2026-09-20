---
type: Index
title: Claude Agent Configuration
description: Claude Code adapter for this toolkit, currently the only implemented agent-config integration.
timestamp: 2026-09-19
---

# Claude Agent Configuration

Claude is the only currently implemented adapter in `agent-config/`. This
directory holds everything specific to running this toolkit under Claude
Code; it does not redefine any canonical artifact, it points to one.

| File | Purpose |
|---|---|
| `settings.json` | Registers the `SessionStart` hook below with Claude Code. |
| `session-start-repo-check.sh` | Implements rule 3 of `rules/rules-for-prototyping.md` for Claude Code: a read-only repo-state check that runs automatically at the start of every session. |
| `skills/design-pipeline/SKILL.md` | A thin wrapper so Claude Code discovers `approaches/design-pipeline.md` as a skill. It points to that file rather than duplicating it. |
| `skills/analytical-essayist-tone/SKILL.md` | A thin wrapper so Claude Code discovers `routines/tone-analytical-essayist.md` as a skill. It points to that file rather than duplicating it. |

The `skills/<name>/` directories have no `index.md` of their own. Claude
Code requires the `SKILL.md` file at that exact path, and each directory
holds nothing else to catalog.

A future Codex or OpenCode adapter belongs in a sibling
`agent-config/codex/` or `agent-config/opencode/` directory, not inside
this one, once there is a concrete, verified mechanism for it.
