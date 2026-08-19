---
name: design-pipeline
description: Fixed, ordered set of design-artifact stages for building a new screen or flow — from initiative framing through two hi-fi rounds to ongoing iteration.
---

# Design Pipeline

A product-agnostic sequence for taking a new screen or flow from "we think
we need this" to "it's live and iterating." Each stage after Stage 0
produces an artifact; each artifact folder is a frozen, point-in-time
snapshot once superseded — never edited again, kept as historical record.
The always-latest working folder (e.g. `current/`) is the one exception:
edited in the same pass as whatever change it describes, never left stale
"for later."

## Stage 0 — Initiative framing

Before any design artifact gets created, write a short Initiative note.
Two tiers of fields — the first tier gates the start of Stage 1; the
second fills in as it becomes real rather than being fabricated up front
(rule 6 of `prototyping-system.md`: every stage names its own open
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

## Related principles

This skill implements rule 1 of `prototyping-system.md` (design pipeline
is local and sequential, before or alongside code) — see that file for
the general rules (2-11) this stage sequence operates under, including
why every stage's own output must name its open questions (rule 6), why
the always-latest folder staying in sync is treated as structural, not
optional, and why Stage 0's fields map onto the Initiative/Milestone/
Deliverable hierarchy in rule 11.
