---
type: Output
title: Findings Log
description: Required shape for the append-only, update-in-place log each of the two learning-loop approaches keeps per adopting repository.
timestamp: 2026-08-27
---

# Findings Log

The concrete file both `approaches/product-use-learning-loop.md` and
`approaches/working-method-learning-loop.md` produce once a project adopts
either loop. This file specifies the shared mechanics only; each loop's own
file states which status values and classification apply to it, rather than
restating this shape (rule 4 of `rules/prototyping-system.md`: single source
of truth per fact).

## Where it lives

One file per loop, per adopting repository: `findings/product-use.md` and
`findings/working-method.md`, inside the repository the finding is actually
about — never at a workspace root with no repository of its own
(`approaches/toolkit-intake.md`'s capture rule applies here too). This
toolkit keeps its own two logs, under `findings/` here, as the reference
implementation: a working-method finding about using this toolkit itself
belongs in this repo's own log, the same way a product's finding belongs in
that product's own repo, never duplicated into a second copy at a
workspace root (rule 4 again).

Two separate files, not one shared log — the two loops stay distinct (a
product-use finding and a working-method finding are a different kind of
signal) even when a session produces both at once.

## Append-only, entries updated in place

The file is append-only at the entry level: an entry is never deleted, and a
new entry is never opened just to record a status change on an existing
finding. Within one entry, `Status` and any other lifecycle field are edited
in place as the finding moves through its loop, and an `Updates` list inside
that same entry accumulates one short dated line per change — so an entry's
history is visible directly, without hunting through file history for a repo
that may not even be versioned yet.

## Entry template

```
## [YYYY-MM-DD] <short title>
Status: <see the adopting loop's own status values>
<Loop-specific classification field(s) — e.g. Category, or which artifact
an observation was Promoted to>
Context: <which milestone/deliverable/initiative this came up in, or
"general">

<Body: what happened, why it matters. As short as a papercut-style 1-3
sentences, or as long as the finding actually needs — a real bug-shaped
finding may need its own Environment/Reproduction/Acceptance-gate
subsections. Don't force a rich finding into a terse template just to
match a short one, and don't pad a short one out to look thorough.>

### Updates
- [YYYY-MM-DD] <status change and reason>
```

`Category` is deliberately not fixed at this level. A project may adopt a
closed category set if that's useful to it (`docverify-backend/PAPERCUT.md`'s
`agent`/`system`/`application` split, for instance, predates this spec and
remains a reasonable pattern to reuse) — but that choice is product-specific
and does not belong here (the same single-source-of-truth boundary that kept
`PAPERCUT.md`'s concrete entries out of this toolkit applies to inventing a
universal category scheme too).

## Closure

Each loop's own Method already defines what "closed" means for its entries
(`product-use-learning-loop.md` step 5; `working-method-learning-loop.md`
step 7) — this file does not redefine it, only requires that an entry's
`Status` field and `Updates` list are where closure gets recorded, so a
reader can tell a settled finding from an open one without reading every
`Updates` line to reconstruct it.

## Related artifacts

- `approaches/product-use-learning-loop.md`
- `approaches/working-method-learning-loop.md`
- `approaches/toolkit-intake.md`: the capture discipline for an unfiled
  impulse before it becomes a findings-log entry.
