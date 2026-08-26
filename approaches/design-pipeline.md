---
type: Approach
title: Design Pipeline
description: Fixed, ordered set of design-artifact stages for building a new screen or flow — from initiative framing through two hi-fi rounds to ongoing iteration.
timestamp: 2026-08-26
tags: [process, design, prototyping]
status: adopted — also packaged for Claude Code as the `design-pipeline` skill (`agent-config/claude/skills/design-pipeline/SKILL.md`), which points here rather than duplicating this content.
---

# Design Pipeline

**Kind:** staged workflow.

## Purpose

A product-agnostic sequence for taking a new screen or flow from "we think
we need this" to "it's live and iterating." Each stage after Stage 0
produces an artifact; each artifact folder is a frozen, point-in-time
snapshot once superseded, never edited again, kept as historical record.
The always-latest working folder (e.g. `current/`) is the one exception:
edited in the same pass as whatever change it describes, never left stale
"for later."

## When it applies

A new screen or flow needs a design artifact before or alongside code, or
an existing screen's documentation has drifted from its actual behavior
and needs to be brought back in sync.

## Human and AI responsibilities

Both sides read and write the same stage artifacts; there is no stage
here that only one side touches. The human owns judgment calls that
require product context: whether a required Stage 0 field can honestly be
answered, whether feedback on a wireframe or hi-fi round warrants another
iteration, when a screen is done drifting and ready to freeze. An AI
carries out drafting and updates inside a stage, and must flag rather
than guess when a stage's own gate cannot yet be answered (rule 6 of
`rules/prototyping-system.md`).

## Stage 0 — Initiative framing

Before any design artifact gets created, write a short Initiative note.
Two tiers of fields — the first tier gates the start of Stage 1; the
second fills in as it becomes real rather than being fabricated up front
(rule 6 of `rules/prototyping-system.md`: every stage names its own open
questions — leaving a field explicitly open is better than a guessed
answer).

**Required before Stage 1:**
- **Initiative name** — scoped in the name itself, not left open-ended
  (e.g. "Cross-platform backups for local backups," not "Backups")
- **Current situation** — the present state and context
- **Problem or opportunity** — the issue faced, or the opening to improve
- **Target users** — who is affected, or who would benefit
- **Scope & boundaries** — what is in vs. explicitly out
- **MVP specification** — the smallest version that delivers meaningful
  value, described as value, not as a technical spec

**Filled in as it becomes real, not blocking Stage 1:**
- Expected impact — the anticipated benefit or outcome
- Evidence — why this is believed real (feedback, data, observation)
- Known dependencies — prerequisites or blockers already visible
- Legal check — early check with legal if there are implications to address
- Product design validation — feedback from prototypes, interviews, or
  testing, including happy path and exceptions
- Acceptance criteria — how QA/engineering will validate the work
- Success metrics — what success means, measured where possible
- Risks & mitigations — technical, operational, legal, or product risks

If any required field can't be answered in a sentence or two, that's a
sign the work isn't scoped enough to move to Stage 1 yet.

## Stage 1 — Flows

Lives in the always-latest flows folder. Describes the journey across
steps — entry point, happy path, error paths, exit point — without naming
specific UI composition yet. Always-editable, never frozen: a flow doc
must reflect the app as it actually behaves, updated in the same pass as
any change that affects it.

## Stage 2 — Screens

Lives in the always-latest screens folder. The layer between a flow step
and its components: what a given screen actually contains, in what
minimal set, in what states. Also always-editable, never frozen.

**Why this is its own stage, not folded into Flows:** a flow doc reads as
high-level enough that it doesn't obviously go stale the way a missing or
wrong screen description does. Every flow step must be able to name a
real screen; every screen doc must reflect actual current behavior, not a
plausible-sounding description that quietly drifted from the code.

Template shape:
```
## Purpose
## Appears in
## Minimal components
## States / variants
## Open questions / gaps
## Related
```

## Stage 3 — Wireframes

Own folder, frozen once superseded. Text/ASCII layout — no visual design,
no real components — one file per screen or flow. Purpose: settle
structure and content priority before spending effort on visual fidelity.

Template shape:
```
## Screen / flow
## Layout (ASCII or structural description)
## Content priority (what matters most, top to bottom)
## Interactions (what's actionable, and what happens)
## Explicitly deferred (visual design, undecided states, etc.)
## Related
```

## Stage 4 — Hi-fi v1

Own folder, frozen once superseded. First higher-fidelity pass, using the
project's actual design system (not a generic mockup tool) — this is why
there's no separate "low-fi visual" round: v1 already applies real
components. Moves here once a wireframe has had a feedback round.

## Stage 5 — Hi-fi v2

Own folder, frozen once superseded. Second iteration, after v1's feedback
round.

If a third full redesign round is needed after this, add a `hifi-v3`
folder rather than editing v2 — don't renumber or overwrite a frozen
round.

## Ongoing iteration

After Stage 5, further changes land directly in the always-latest folder
(updating the flow/screen docs in place), not in a new numbered hifi
folder. Numbered folders are for full redesign rounds; the always-latest
folder is for the normal drift-free maintenance every shipped screen
needs afterward.

## Outputs

Per stage: a frozen artifact folder (Wireframes, Hi-fi v1, Hi-fi v2), or
an always-editable folder kept in sync with actual behavior (Flows,
Screens, the post-v2 always-latest folder).

## Completion or review condition

A stage is done, and the next stage's work can start, once its own gate
question is answered: Stage 0's required fields are all answerable, a
wireframe has had a feedback round before moving to Hi-fi v1, a hi-fi
round has had its own feedback round before moving to the next. There is
no single end state after Hi-fi v2; ongoing iteration continues for as
long as the screen exists.

## Related artifacts

This approach implements rule 1 of `rules/prototyping-system.md` (design
pipeline is local and sequential, before or alongside code); see that
file for the general rules this stage sequence operates under, including
why every stage's own output must name its open questions (rule 6), why
the always-latest folder staying in sync is treated as structural, not
optional, and why Stage 0's fields map onto the Initiative/Milestone/
Deliverable hierarchy in rule 11.

Once a project's discovery work reaches the point of needing this
sequence, see `approaches/idea-to-mvp.md`'s Discovery phase for where
this approach is handed off from.
