---
type: Approach
title: Product Use Learning Loop
description: Capturing friction found by actually using a prototype or shipped product, and giving every finding an explicit outcome instead of losing it.
timestamp: 2026-08-27
tags: [process, quality, prototyping]
status: draft, v1; replaces the earlier Papercuts pattern; operational via `outputs/findings-log.md`
---

# Product Use Learning Loop

**Kind:** continuous practice.

## Purpose

Friction found only by using a prototype or shipped product as a real
user would, not by reading code, a spec, or a doc, is cheap, plentiful,
and unplanned. Without an explicit place for it, a finding goes one of two
ways, both bad: fixed quietly with no record, invisible later and easy to
regress unnoticed; or noticed and never written down, a known annoyance
nobody named, rediscovered repeatedly by the next person who trips over
it. This approach gives every such finding one of a small set of explicit
outcomes.

## When it applies

The product or prototype gets used through real use, at any point: a
demo, a testing session, a stakeholder walkthrough, day-to-day operation.
It applies continuously, not at one fixed gate.

## Human and AI responsibilities

- The human reports friction found through their own use, and decides
  priority or scope wherever the triage step below requires judgment.
- An AI records friction it observes during testing or operation, prompts
  for a product-use review at suitable boundaries (a milestone review, a
  release readiness check), and makes sure a finding is not silently
  fixed with no record or silently dropped.
- An AI must not claim to have experienced real use when it only reviewed
  code or documentation. Reading a screen's markup is not using the
  screen; say which one actually happened.

## Method

1. **Exercise the product through real use.** A real click-through, a
   real session, a real operational period, not a code review.
2. **Observe and capture friction as it occurs.** Log it as found, before
   it is forgotten or rationalized away.
3. **Triage each finding** into exactly one of:
   - **Immediate fix**: cheap, safe, and within what is already being
     touched.
   - **Planned work**: folded into a milestone (rule 11 of
     `rules/prototyping-system.md`) if it is actually part of that
     milestone's scope, not a new one invented on the spot.
   - **Explicit deferral**: named, with a reason it is not being picked
     up now.
   - **Accepted gap**: stated plainly (rule 6: every stage names its own
     open questions) rather than left to be rediscovered later.
4. **Apply the selected response.**
5. **Revisit the affected experience** to determine whether the response
   helped, rather than assuming a fix worked because it shipped.

A real-use pass that ends with a finding not sorted into one of the four
triage outcomes is the exact failure mode this approach exists to
prevent.

## Outputs

A dated log of findings, each carrying its triage outcome and, once step 5
runs, a note on whether the response actually helped. Recorded concretely
in `findings/product-use.md`, per `outputs/findings-log.md`'s shared shape.
This loop's own `Status` values, one entry moving left to right as it
clears each step above:

- `open` — step 1 (Exercise) and step 2 (Observe/capture) done; not yet
  triaged.
- `immediate-fix`, `planned-work`, `deferred`, or `accepted-gap` — the
  step 3 triage outcome, verbatim as one of these four values. An entry
  that reaches step 3 without landing on exactly one of these is the
  failure mode this loop exists to prevent — don't leave it untriaged.
- `applied` — step 4 done, for **any** of the four outcomes, not just
  `immediate-fix`/`planned-work`: "applying" a `deferred` response means
  the deferral and its reason are recorded somewhere a reader would
  actually find it (this entry, or folded into a roadmap/future-ideas
  doc); "applying" an `accepted-gap` response means the gap is stated
  plainly where a reader would find it (e.g. a "Known gaps" section) —
  the recording itself is the response for these two, not a code change,
  but it still has to actually happen, not be assumed done at the moment
  of triage.
- `closed` — step 5 (Revisit) confirmed the response helped. For
  `immediate-fix`/`planned-work`, that means the friction is actually
  gone. For `deferred`/`accepted-gap`, that means the deferral or
  acceptance is still the right call when revisited, not stale (its
  blocker still holds, or the gap still doesn't matter) — every outcome
  gets a real revisit, none are exempt.
- `reopened` — step 5 found the response didn't help, or found a
  `deferred`/`accepted-gap` no longer holds (its blocker cleared, or the
  gap now actually matters). The entry stays (append-only), `Updates`
  records what changed, and a fresh triage (back to one of the four
  step-3 outcomes) follows from there.

## Completion or review condition

There is no single end state; this loop runs for as long as the product
is used. A given finding is closed once step 5 confirms the response
helped, or explicitly reopened if it did not.

## Not the same as the Delivery ready-to-ship check

`approaches/idea-to-mvp.md`'s Delivery phase ends in a checklist gate
before release. This loop's findings show up continuously, at any point
something real gets used, not only at that gate, and most will not
warrant a milestone of their own. Treat this as the ongoing counterpart
to that one-time check, not a duplicate of it.

## Related artifacts

- `outputs/findings-log.md`: the concrete file shape (`findings/product-
  use.md`) and shared append-only/update-in-place mechanics this loop's
  status values above operate inside.
- `approaches/toolkit-intake.md`: the general front door a friction
  report may arrive through before it is recognized as belonging to this
  loop specifically.
- `rules/prototyping-system.md` rules 6 and 11.
- `approaches/idea-to-mvp.md`: the Delivery phase this loop feeds small,
  real findings into.
- `approaches/design-pipeline.md`: ongoing iteration on a shipped screen
  is one place this loop's findings land.
- `approaches/working-method-learning-loop.md`: the sibling loop for
  friction in how work gets done, rather than in the product itself. Keep
  the two separate even when both surface in the same session.
