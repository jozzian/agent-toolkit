---
type: Output
title: Artifact Adoption Ledger
description: Specification and template for a project-local Markdown file recording which toolkit artifacts a project uses, and how.
timestamp: 2026-08-26
tags: [output, adoption, governance]
status: draft, v1
---

# Artifact Adoption Ledger

## Purpose

A lightweight, project-local Markdown file that records which of this
toolkit's artifacts a given project actually uses, and how. It exists so
that adoption is a checked fact, not an assumption: a project can state
plainly which rules, approaches, routines, conventions, and outputs it
follows, which it has adapted, and which do not apply.

## Where it lives

Inside the consuming project, not inside this toolkit. This toolkit does
not generate or track a ledger for itself unless a project explicitly
decides this repository consumes its own artifacts and there is a clear
need to record that; absent that decision, this repository has no
generated ledger of its own.

## Whether it is tracked

The consuming project decides whether its ledger is committed to version
control or left local and ignored. This specification does not require
either choice.

## Required fields

Each entry in the ledger records:

- **Toolkit version or revision reviewed**: the `agent-toolkit` `VERSION`
  or git commit the entry was last checked against.
- **Date last reviewed**: when the entry was last confirmed accurate.
- **Artifact**: the artifact's identifier or relative path within this
  toolkit, for example `rules/prototyping-system.md#3` or
  `approaches/design-pipeline.md`.
- **Status**: one of `adopted`, `adapted`, `not-applicable`, or
  `review-needed`.
- **Where or how applied**: the file, process, or team practice that
  applies the artifact.
- **Deviation**: any deliberate deviation or local adaptation from the
  toolkit's own text, and why.
- **Last used or verified**: a date, where meaningful for that artifact.

## Status vocabulary

- `adopted`: applied as written, with no deviation.
- `adapted`: applied with a stated, deliberate deviation.
- `not-applicable`: does not apply to this project, with a reason.
- `review-needed`: last reviewed against an older toolkit revision, or
  flagged as possibly stale.

## Derived totals

The ledger ends with a totals section counting entries by status,
including how many are `adopted` or `adapted`. These counts are derived
from the entries above every time the ledger is reviewed. A count that
does not match the entries it summarizes is wrong; do not maintain the
totals as a separate, independently edited fact.

## Template

```markdown
# Artifact Adoption Ledger

Toolkit revision reviewed: <VERSION or commit>
Date last reviewed: <YYYY-MM-DD>

| Artifact | Status | Where/how applied | Deviation | Last verified |
|---|---|---|---|---|
| rules/prototyping-system.md#3 | adopted | .claude/settings.json SessionStart hook | none | 2026-08-26 |
| approaches/design-pipeline.md | adapted | docs/design/ | v2 hi-fi round skipped for low-risk screens | 2026-08-20 |
| conventions/repo-structure.md | not-applicable | n/a | single-repo project | 2026-08-19 |

## Totals

- adopted: 1
- adapted: 1
- not-applicable: 1
- review-needed: 0
```
