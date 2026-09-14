---
type: Index
title: Rules
description: Stable numbering contract and concise catalog for the invariant rules in this directory's rule files.
timestamp: 2026-08-31
---

# Rules

Rules are stable, numbered invariants that govern work regardless of stage
or task. They live in one or more files in this directory, grouped by
domain rather than all forced into one file — see `rules-for-prototyping.md`'s
own note on when a domain earns a sibling file (e.g. a future
`rules-for-project-management.md`) instead of being folded into the
general set. Numbering is per file, not shared across files.

## Numbering contract

A rule's number does not change once adopted, even if the rule's content
is later revised, replaced by a pointer to another artifact, or superseded
in substance. A consuming project may cite a rule by number; that citation
must keep resolving to the same concern across revisions. Record why a
rule's text changed in the owning file's own "Learnings" section rather
than silently editing it away.

## Inline or pointer

Most rules state their invariant directly, in a paragraph or two, and
stay that way — most of the catalog below does exactly this. A rule
becomes a pointer to a dedicated file instead, the way rules 1 and 11 do,
when either is true:

- **It defines a vocabulary or a staged sequence rather than a single
  behavior.** A term set (Goal, Initiative, Milestone...) or an ordered
  set of stages (Stage 0 through ongoing iteration) has room to grow,
  gain examples, or need its own revision history independent of the
  rule that cites it — a rule statement isn't the right shape for that,
  a `conventions/` or `approaches/` file is.
- **The content doesn't survive being stated once.** If a rule's
  definition would need restating, even partially, anywhere else in the
  toolkit, rule 4 (single source of truth per fact) applies to the rule
  file's own content too.

When a rule already reads as "here's a short definition, and then we
never mention it again" (the state rule 11 was in before this file's
2026-08-31 revision), that's usually a sign it's a definition pretending
to be an invariant. Check it against the two conditions above before
adding more to it in place.

## Catalog

| # | Rule | File |
|---|---|---|
| 1 | Design pipeline is a pointer to `approaches/design-pipeline.md`, not an invariant stated here. | `rules-for-prototyping.md` |
| 2 | Propose before executing, when the result cannot be verified first. | `rules-for-prototyping.md` |
| 3 | The session-boundary state check is a tooling precondition, not a memory rule. | `rules-for-prototyping.md` |
| 4 | Single source of truth per fact, not per file. | `rules-for-prototyping.md` |
| 5 | Verified claims are re-derivable, not hardcoded. | `rules-for-prototyping.md` |
| 6 | Every stage names its own open questions. | `rules-for-prototyping.md` |
| 7 | Naming and structural splits are decided at Ideation, not discovered mid-build. | `rules-for-prototyping.md` |
| 8 | One tool-neutral file carries agent-facing instructions; README stays human-facing. | `rules-for-prototyping.md` |
| 9 | A shared building-block vocabulary is a closed, audited list. | `rules-for-prototyping.md` |
| 10 | Practices worth watching, not yet rules. | `rules-for-prototyping.md` |
| 11 | Work is scoped against a goal, decomposed into initiatives, milestones, deliverables, and tasks — vocabulary defined in `conventions/project-management.md`. | `rules-for-prototyping.md` |
| 12 | Before every commit, check for what should not be in it. | `rules-for-prototyping.md` |
| 13 | An ID is never referenced without its title. | `rules-for-prototyping.md` |
| 14 | Never write a real secret to a file; give the human a placeholder to fill in themselves. | `rules-for-prototyping.md` |
| 15 | Verify decommissioned artifacts (credential files, generated output, caches) are actually gone, not just their references. | `rules-for-prototyping.md` |

Full text, rationale, and each file's own evolving "Learnings" record live
in the file named in the table above. This index does not restate rule
content; if a one-line summary above drifts from a file's actual text,
that file is authoritative.

To write a new rule, start from
[conventions/templates/rule.md](../conventions/templates/rule.md).
