---
type: Index
title: Templates
description: Catalog of starting skeletons for each artifact kind, derived from the canonical example of that kind.
timestamp: 2026-09-11
---

# Templates

Each template captures the actual structure of one artifact kind,
derived from the best existing example of that kind rather than
idealized. Templates are typed `Convention` and live under
`conventions/` because they are shared standards for how a file of each
kind gets structured; they are not a seventh artifact kind, and adding
one would have meant reopening the closed `type` list in
`conventions/okf.md`. See `CHANGELOG.md` under [Unreleased] for the
full reasoning.

To write a new artifact: open the matching template, copy the fenced
skeleton, fill every slot, register the new file in its kind's
`index.md`, and add a `CHANGELOG.md` entry in the same change.

| Template | For writing | Derived from |
|---|---|---|
| [Rule](rule.md) | A stable, numbered invariant | `rules/rules-for-prototyping.md` |
| [Approach](approach.md) | A reusable way of working, any of the four kinds | `approaches/review-protocol.md`, `approaches/idea-to-mvp.md` |
| [Routine](routine.md) | A self-contained instruction set, pasteable into any chat | `routines/sharpen.md` |
| [Convention](convention.md) | A shared standard, including the spec-shaped variant | `conventions/repo-structure.md`, `conventions/okf.md` |
| [Output](output.md) | A required shape for a recurring deliverable | `outputs/findings-log.md`, `outputs/artifact-adoption-ledger.md` |

No template exists for `agent-config/`: its files carry whatever
format the tool they adapt demands, not an OKF skeleton, per
`conventions/okf.md`'s exemption.
