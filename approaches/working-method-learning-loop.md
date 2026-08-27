---
type: Approach
title: Working Method Learning Loop
description: Deciding whether friction or a useful practice in how work gets planned, prompted, built, reviewed, or handed off is worth promoting into a durable artifact.
timestamp: 2026-08-27
tags: [process, learning, prototyping]
status: draft, v1 — operational via `outputs/findings-log.md`
---

# Working Method Learning Loop

**Kind:** continuous practice.

## Purpose

Friction and useful lessons in how a human and an AI plan, prompt, build,
review, hand off, coordinate, or document work are a different kind of
signal than friction in the product itself. This loop keeps that
distinction explicit, and gives a working-method observation a
conservative path to becoming a durable rule, approach, routine,
convention, output, or agent configuration, without turning every
preference or isolated event into a permanent artifact.

See `approaches/product-use-learning-loop.md` for the sibling loop
covering friction found by using the product or prototype itself. Keep
the two separate even when both surface in the same session.

## When it applies

A working-method problem or a useful practice shows up while planning,
prompting, building, reviewing, handing off, coordinating, or documenting
work. It is most worth running after a material process failure, a
repeated correction, a difficult handoff, or a review that exposes a
general working weakness, but it can run any time an observation is
worth recording.

## Human and AI responsibilities

The human decides whether an observation is worth acting on now, and
holds final judgment on promoting anything to a rule, since rules carry a
stable-numbering contract. An AI should remind the human to run this loop
after the triggers named above, record the observation without waiting
to be asked, and resist promoting a single event to a permanent artifact
before there is a second instance to compare it against.

## Method

1. **Observe** a working-method problem or a useful practice. Record it
   as it happens, not at session wrap-up; noticing the thought "I should
   remember this for next time" mid-task is itself the trigger to stop
   and write it down, not a cue to keep going and reconstruct it later.
2. **Record** the observation without product-specific detail in the
   toolkit. Keep concrete incident detail in the product's own
   documentation; the toolkit keeps the generalized shape of the lesson.
3. **Determine** whether the observation is isolated, recurring, or
   already covered by an existing artifact.
4. **Propose** the smallest appropriate change; do not reach for a new
   rule when an edit to an existing approach or convention already
   covers it.
5. **Promote** a mature lesson to the correct artifact type: rule,
   approach, routine, convention, output, or agent configuration.
6. **Apply** the change, and record why it changed in the artifact's own
   rationale mechanism (for rules, the "Learnings" section of
   `rules/prototyping-system.md`).
7. **Check** future use before treating the lesson as established. A
   promotion is provisional until it has been used again.

## Outputs

A recorded observation, and, where step 5 applies, a change to the correct
artifact together with a rationale note explaining why it changed. Recorded
concretely in `findings/working-method.md`, per `outputs/findings-log.md`'s
shared shape. This loop's own `Status` values, one per genuinely distinct
outcome the Method above can produce — not a strict one-status-per-step
mapping: steps 1 (Observe) and 2 (Record) happen as one action in practice
(the Method's own trigger is "notice the thought mid-task, stop and write
it down immediately"), so they share a single starting status rather than
needing two.

- `open` — steps 1-2 done; not yet determined.
- `isolated` — step 3 (Determine) found no recurrence and no existing
  coverage. Stays here; most entries end at this status, closed without
  ever needing promotion. Revisit only if a second instance shows up
  later — don't promote off one data point.
- `already-covered` — step 3 found this matches an existing artifact.
  Name which one in the entry body. Closed: no new promotion needed, but
  the match is worth recording so the next occurrence finds it faster.
- `recurring` — step 3 found this is neither isolated nor already
  covered — a genuine candidate for step 4 (Propose).
- `proposed` — step 4 done: a specific, smallest-appropriate change has
  been named in the entry body, not yet promoted.
- `promoted` — step 5 done. Name which artifact type and file it became
  (a rule, approach, routine, convention, output, or agent configuration)
  in the entry body, not just the status word.
- `provisional` — step 6 (Apply) done. This is the resting status for a
  change that hasn't yet been used again.
- `confirmed` — step 7 (Check) passed: the change held up under a second
  real instance. Closed.
- `reverted` — step 7 found the change didn't hold up. The entry stays
  (append-only), `Updates` records why, and a fresh `open` entry starts
  if a better fix is still worth pursuing — don't silently re-edit the
  original promoted artifact back without a record of what was tried and
  didn't work.

## Completion or review condition

An observation triaged `isolated` or `already-covered` at step 3 closes
there. One triaged `recurring` stays open through `proposed`, `promoted`,
and `provisional`, closing only once step 7 (Check) confirms it held up
under a second real instance. The loop as a whole has no end state; it
runs for as long as the human and the AI work together.

## Related artifacts

- `outputs/findings-log.md`: the concrete file shape (`findings/working-
  method.md`) and shared append-only/update-in-place mechanics this loop's
  status values above operate inside.
- `approaches/toolkit-intake.md`: the general front door an observation
  may arrive through before it is recognized as belonging to this loop
  specifically.
- `rules/prototyping-system.md`: the "Learnings" section is where a
  promoted rule's rule-specific rationale lives; this approach is the
  general process that produces that entry, and the canonical place to
  look for how a working-method lesson gets captured and promoted,
  whichever artifact type it lands in.
- `approaches/product-use-learning-loop.md`: the sibling loop for
  friction found in the product itself, not in how the work was done.
