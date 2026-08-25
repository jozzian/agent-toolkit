---
type: Guideline
title: Idea to MVP Process
description: A generic, growable phase-gate process for taking an idea through discovery to a shippable MVP — deliberately minimal to start.
timestamp: 2026-08-25
tags: [process, product, prototyping]
status: draft — v1, deliberately minimal; see Open questions for what's left out on purpose
---

# Idea to MVP Process

Three phases an idea should pass through before it becomes a shippable MVP.
Each phase ends in a gate — a question that must be answerable, not just
hoped, before moving to the next phase. This is a first, minimal version:
start here and grow it (see Open questions) rather than backfilling every
possible field up front.

**Relationship to other files in this toolkit:** an "idea" here is the same
thing as an Initiative in rule 11 of `rules/prototyping-system.md` — this
file is the lifecycle view of what an initiative passes through; rule 11
is what its planning units (milestones, deliverables) look like once
you're inside a phase. When Discovery's work includes building a
prototype, that work is handed off to the `design-pipeline` skill (Stage 0
onward) rather than re-described here.

## Overview

| Phase | Gate question | Main deliverable |
|-------|----------------|-------------------|
| **Idea** | Is this worth a real look — is the problem real, and worth spending discovery time on? | A clear, evidenced idea |
| **Discovery** | Is there a solution whose gain justifies the effort, defined well enough to estimate the cost? | A cost/benefit go or no-go |
| **Delivery** | Is it actually ready to ship? | A finished MVP |

## Two lenses, not necessarily two people

Every idea needs both of these asked explicitly:

- **Problem lens** — why this matters, who it's for, what the right
  solution actually is.
- **Feasibility lens** — whether and how it can be built, and what it
  costs.

In a solo or small prototyping context one person holds both lenses at
once. The split exists so both questions get asked out loud, not to
require two different humans — don't invent a second role just to fill
this table in.

## Idea

**Goal:** decide whether this is worth spending real discovery time on,
before that time is spent.

| Item | Captures |
|------|----------|
| Name | A name specific enough to scope the idea, not a category label |
| Current situation | The present state and context |
| Problem or opportunity | The issue faced, or the opening to improve |
| Target users | Who is affected, or who would benefit |
| Expected impact | The anticipated benefit, if known yet |
| Evidence | Why this is believed real — can be thin at this stage, but should be named, not assumed |
| Known dependencies | Prerequisites or blockers already visible |
| Rough size/effort signal | A first gut call on how big this is, optional and revisited in Discovery — not a commitment |

**Exit:** if the gate question is a real yes, move to Discovery. If it's a
maybe, the honest move is to say so and park it, not to carry a soft yes
forward as if it were a hard one.

## Discovery

**Goal:** define the problem and a solution well enough that the estimated
gain can be weighed against the estimated cost.

Two threads, which can interleave:

- **Problem & solution** — refine the problem statement; confirm who's
  actually affected; define scope (in vs. explicitly out); describe the
  smallest version that delivers real value (as value, not as a technical
  spec); name risks; define what success looks like. If the idea would
  benefit from being seen or tried before committing further, this is
  where that happens — see the `design-pipeline` skill for a staged way
  to take a screen or flow from framing through wireframes to a
  higher-fidelity prototype.
- **Feasibility & estimate** — sketch how this would actually be built,
  well enough to size the effort realistically: rough approach, what
  testing would involve, a plan draft. Re-confirm or revise the size
  signal from Idea against what was actually learned.

**Exit:** does the estimated gain still justify the estimated effort? If
yes, with a plan and a size, move to Delivery. If no, park or kill it
explicitly and record why — an idea that quietly stops getting mentioned
is not the same as one that was deliberately closed.

## Delivery

**Goal:** turn the go decision into a shipped MVP.

- **Planning** — turn Discovery's plan into real tasks and milestones (see
  rule 11 of `rules/prototyping-system.md` for the
  initiative/milestone/deliverable breakdown).
- **Build & verify** — implement, test, review.
- **Ready-to-ship check** — before calling it done: does it meet the
  acceptance criteria named in Discovery; do the tests that matter pass;
  are the risks and non-functional needs flagged in Discovery actually
  addressed (not just still on a list); is anything a user or teammate
  needs to know documented.

**Exit:** is it really ready to release? This file stops here — see Open
questions for what comes after.

## Open questions / not yet covered

- **Launch.** Releasing, and making sure people know about and can use
  the result, is a real fourth phase — deliberately left out of this
  first version because it wasn't needed to unblock idea-through-MVP
  work. Add it once it's real, not speculatively.
- **Named gates.** The three gates above are stated as plain questions on
  purpose, not given short acronym names — that naming should earn its
  keep through actual use here before being adopted, rather than being
  carried over wholesale from wherever this pattern was abstracted from.
- **Sizing scale.** No S/M/L (or similar) definition is included yet —
  add one once there's a repeated, real need to calibrate how much of
  this process an idea's size warrants.
- **Rules vs. patterns.** This file is a first instance of a "pattern" — a
  repeating staged process — as distinct from a "rule" (an invariant) in
  `rules/prototyping-system.md`. If that file is later split along that
  line, this note should move or be removed so the two don't drift apart.
