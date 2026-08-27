---
type: Index
title: Rules
description: Stable numbering contract and concise catalog for the invariant rules in prototyping-system.md.
timestamp: 2026-08-26
---

# Rules

Rules are stable, numbered invariants that govern work regardless of stage
or task. They live in `prototyping-system.md`.

## Numbering contract

A rule's number does not change once adopted, even if the rule's content
is later revised, replaced by a pointer to another artifact, or superseded
in substance. A consuming project may cite a rule by number; that citation
must keep resolving to the same concern across revisions. Record why a
rule's text changed in that file's own "Learnings" section rather than
silently editing it away.

## Catalog

| # | Rule |
|---|---|
| 1 | Design pipeline is a pointer to `approaches/design-pipeline.md`, not an invariant stated here. |
| 2 | Propose before executing, when the result cannot be verified first. |
| 3 | The session-boundary state check is a tooling precondition, not a memory rule. |
| 4 | Single source of truth per fact, not per file. |
| 5 | Verified claims are re-derivable, not hardcoded. |
| 6 | Every stage names its own open questions. |
| 7 | Naming and structural splits are decided at Ideation, not discovered mid-build. |
| 8 | One tool-neutral file carries agent-facing instructions; README stays human-facing. |
| 9 | A shared building-block vocabulary is a closed, audited list. |
| 10 | Practices worth watching, not yet rules. |
| 11 | Work is scoped as initiatives, decomposed into milestones and deliverables. |
| 12 | Before every commit, check for what should not be in it. |
| 13 | An ID is never referenced without its title. |

Full text, rationale, and the evolving "Learnings" record live in
`prototyping-system.md`. This index does not restate rule content; if a
one-line summary above drifts from that file's actual text, the file is
authoritative.
