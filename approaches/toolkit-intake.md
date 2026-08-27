---
type: Approach
title: Toolkit Intake
description: Capturing a new impulse for the toolkit itself, a learned lesson or a fresh idea, before it is reshaped, and routing it to the correct artifact or loop.
timestamp: 2026-08-26
tags: [process, intake, governance]
status: draft, v1
---

# Toolkit Intake

**Kind:** continuous practice.

## Purpose

Whenever the human or the AI learns something new, or wants to add or
change something in this toolkit itself, the raw impulse needs to be
captured before it gets reshaped, and then placed correctly. Without
this, three failure modes recur: an underspecified or cut-off impulse
gets silently dropped or guessed at; a naming or scope change gets
absorbed without checking whether it conflicts with something already
decided; or a vague idea gets padded with plausible-sounding detail
nobody actually stated. This approach is the front door that catches all
three before an impulse reaches `rules/`, `approaches/`, `routines/`,
`conventions/`, or `outputs/`.

## When it applies

Any time the human or the AI has a new idea, learns something worth
keeping, or notices a gap or an opportunity in this toolkit's own rules,
approaches, routines, conventions, outputs, or agent configuration. It
does not require a specific friction to have occurred first, the way the
two learning loops below do.

## Human and AI responsibilities

The human states the raw impulse and holds final judgment on where it
lands, especially for anything touching a numbered rule. An AI captures
it verbatim before reshaping it, classifies it, checks it against what
already exists, and proposes the smallest edit rather than inventing
scope beyond what was actually said.

## Method

1. **Capture verbatim.** Record the impulse as given, unedited, before
   any classification or rewriting starts. This is what a later
   placement can be checked against if it is ever challenged. A capture
   that cannot be filed immediately still needs a home: a dated note
   inside a real repository, this toolkit or the relevant product
   repository, not a loose file at a workspace root with no repository
   of its own. Triage it promptly rather than letting it stand; a pile
   of unfiled captures is this approach not being run, not a second kind
   of artifact.
2. **Route by kind.** Friction found by using the product itself hands
   off to `approaches/product-use-learning-loop.md`. Friction or a
   lesson about how the work itself gets planned, prompted, built,
   reviewed, handed off, coordinated, or documented hands off to
   `approaches/working-method-learning-loop.md`. Anything else, a fresh
   idea, a noticed gap, a fact learned with no specific friction behind
   it, continues through this approach.
3. **Check against what exists.** Search the relevant catalog's
   `index.md` for an artifact that already covers it. A duplicate gets
   linked to the existing artifact, not re-added. A conflict with
   something already recorded gets named explicitly, with the resolution
   chosen stated in the same change, rather than silently overriding the
   older fact.
4. **Classify the target artifact type**: rule, approach, routine,
   convention, output, or agent configuration, per this repository's own
   `README.md`. If a required detail is missing, a referenced screenshot
   not in the repo, a decision only someone else can make, the rest of a
   cut-off note, record the item as explicitly blocked, naming the
   specific missing piece, rather than guessing past it or dropping it.
5. **Propose the smallest edit** that files the impulse correctly: a new
   file only where no existing one fits, otherwise an addition or an
   amendment to an existing artifact.
6. **Apply the change, and record why.** For a rule, that means an entry
   in `rules/prototyping-system.md`'s own "Learnings" section, since rule
   numbers are stable and never renumbered. For any other artifact type,
   a short line in that file's own history, or in the toolkit's
   `CHANGELOG.md`, is enough.

## Outputs

A verbatim capture of the impulse, and exactly one of: a filed artifact
change, an explicit hand-off to one of the two learning loops, or an
explicitly blocked item naming what is missing.

## Completion or review condition

An impulse closes once it is filed, handed off, or explicitly blocked
with a named next action. Nothing captured under this approach should be
left unclassified.

## Related artifacts

- `approaches/product-use-learning-loop.md` and
  `approaches/working-method-learning-loop.md`: the two friction-specific
  loops this approach routes to once an impulse turns out to fit one of
  them.
- `rules/prototyping-system.md` rule 11: an impulse that becomes a new
  initiative still needs its own Stage 0 framing; this approach only
  covers getting the raw impulse safely to that point, not the framing
  itself.
- `approaches/design-pipeline.md` Stage 0: where a new-surface impulse
  lands once it has been classified.
