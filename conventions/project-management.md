---
type: Convention
title: Project Management Vocabulary
description: The planning vocabulary this toolkit uses to scope and track work — Goal, Initiative, Milestone, Deliverable, Task — with this repository's own artifact-model migration as a worked example.
tags: [planning, process]
timestamp: 2026-08-31
---

# Project Management Vocabulary

A shared naming standard for the units used to scope and track work,
referenced by rule 11 of `rules/rules-for-prototyping.md` rather than
defined inline there — this is a vocabulary, applied consistently across
projects, not an invariant.

Loosely inspired by how Asana distinguishes milestones from tasks, goals,
and deliverables (asana.com/resources/project-milestones); adapted and
extended here rather than reproduced, with Task and Goal added as named
terms of their own instead of left as background concepts the milestone
definition leans on without naming.

## The five terms

Five nested units, longest-lived to shortest-lived:

```
Goal
└── Initiative
    └── Milestone
        └── Deliverable
            └── Task
```

**Goal** — the long-term outcome the work is ultimately for. Ongoing, not
something with a finish date; you don't "complete" a goal so much as keep
serving it. A goal doesn't get a checkbox, an owner, or a deadline — it
gets initiatives that move toward it, and it's the thing that tells you
whether a proposed initiative is worth starting at all.

**Initiative** — a scoped body of work taken on right now to advance a
goal, named specifically enough that the name itself states the
boundary (rule 7 of `rules-for-prototyping.md`: naming and structural
splits are decided at Ideation, not discovered mid-build). An initiative
is where "we should really improve X" turns into a thing with an actual
edge — what's in, what's deliberately left for later or for a different
initiative.

**Milestone** — a zero-duration checkpoint inside an initiative: a named
point that is either reached or not, with no partial credit, proven by at
least one deliverable that demonstrates it. A milestone has no duration
of its own — it marks a moment, not a stretch of work — which is exactly
what makes it legible to someone who only wants to know "where are we,"
not "what's everyone doing today." Every milestone states what is
explicitly **not** in scope, not just what is (the invariant rule 11
keeps stated directly, since it's a requirement, not a definition).

**Deliverable** — the concrete, reviewable output that proves a milestone
was reached. A milestone decomposes into one or more deliverables;
producing a deliverable takes real time, unlike the milestone it proves.
A deliverable is evidence, not the achievement itself — the achievement
is the milestone; the deliverable is how anyone other than the person who
did the work can check it actually happened.

**Task** — the smallest unit of execution: a single, boundable piece of
work that one person or one agent session can pick up and finish in one
sitting, that a deliverable decomposes into. This is where duration
actually lives day to day. A milestone or deliverable only stays a fixed
target if the tasks under it don't quietly expand past what was named —
task-level scope creep is how a "zero-duration checkpoint" ends up taking
three times as long as planned without anyone deciding that it should.

## Why five levels, not three

The toolkit's planning vocabulary originally stopped at Initiative →
Milestone → Deliverable. Two gaps showed up in practice: nothing named
*why* an initiative was worth starting in the first place (so initiatives
justified themselves in isolation, with no way to check whether one still
served anything), and nothing named the actual unit of daily work below a
deliverable (so "deliverable" was sometimes used to mean a single edit,
other times an entire reviewable output, depending on who was writing).
Goal closes the first gap; Task closes the second. Neither changes what a
Milestone or a Deliverable is — they bookend the existing three rather
than replacing them.

## Comparison

| Term | Duration | Answers | Proven by |
|---|---|---|---|
| Goal | Ongoing, no end date | What are we ultimately trying to achieve? | A trend of initiatives that keep serving it |
| Initiative | Weeks to months, scoped by its own name | What are we taking on right now to move toward the goal? | Its milestones, reached over time |
| Milestone | Zero — a checkpoint, not a stretch | Have we reached a specific, named point of progress? | At least one deliverable |
| Deliverable | As long as producing it actually takes | What tangible thing proves the milestone was reached? | Being reviewable independent of the person who built it |
| Task | A single sitting | What is the next concrete thing someone does? | Being done or not — no partial states |

**Milestone vs. Task.** A task has duration and represents work; a
milestone has none and represents a checkpoint. Tasks accumulate into a
deliverable; the milestone is the moment that deliverable's completion is
recognized. Using "milestone" for something with a duration, or treating
a milestone as a container you assign tasks *to* rather than a checkpoint
those tasks lead *toward*, is the most common way this vocabulary gets
muddled in practice.

**Milestone vs. Deliverable.** The deliverable is the thing; the
milestone is the moment. Two different deliverables can prove the same
milestone (belt and suspenders); one deliverable can also be the sole
proof of more than one milestone if it happens to close out two threads
at once, though that's a sign worth double-checking rather than the
common case.

**Milestone vs. Goal.** A goal looks forward and never quite arrives; a
milestone looks back at a specific, already-crossed line. An initiative
without at least one milestone gives a goal nothing to check itself
against; a milestone that doesn't trace back to any initiative's goal is
probably busywork that happened to get organized.

## Worked example: this repository

This toolkit's own history gives a real instance rather than an invented
one.

- **Goal** — a repeatable, AI-supported system for prototyping and
  coding products, stated in this repository's own `README.md`.
- **Initiative** — "Restructure the toolkit around an artifact model"
  (`CHANGELOG.md`'s `[1.0.0]` entry): scoped by its own name, not just
  "improve the toolkit."
- **Milestones** inside that initiative included "the six-kind artifact
  model is defined and every existing file is reclassified into it" and
  "every rule, approach, and convention file conforms to the corrected
  OKF frontmatter spec" — each one binary (reached or not), each backed
  by deliverables that prove it rather than a description of intended
  effort.
- **Deliverables** proving the first milestone: `README.md`'s six-kind
  section, and the five per-kind catalogs (`rules/index.md`,
  `approaches/index.md`, `routines/index.md`, `conventions/index.md`,
  `outputs/index.md`) plus `agent-config/index.md`. Each is independently
  reviewable; together they add up to "yes, the model is in place."
- **Tasks** underneath those deliverables: renaming `patterns/` to
  `approaches/`, updating each cross-reference to the new path, adding
  the frontmatter block to each file that was missing one, writing each
  index entry. None of these is independently interesting; each is the
  unit an actual editing session finished in one pass.

## Related artifacts

Rule 11 of `rules/rules-for-prototyping.md` states the one invariant this
vocabulary doesn't cover on its own: every milestone must name its own
non-scope. Stage 0 of `approaches/design-pipeline.md` is where an
initiative gets its own definition doc before design work starts, gated
on the field list stated there. `approaches/idea-to-mvp.md` covers the
lifecycle an initiative moves through before it reaches Stage 0 at all.
