---
type: Convention
title: Project Management Vocabulary
description: The planning vocabulary this toolkit uses to scope and track work (Initiative, Goal, Milestone, Task), built on a required outcome for every goal, milestone, and task.
tags: [planning, process]
timestamp: 2026-09-20
---

# Project Management Vocabulary

A shared naming standard for the units used to scope and track work,
referenced by rule 11 of rules/rules-for-prototyping.md rather than
defined inline there. It is a vocabulary, applied consistently across
projects, not an invariant.

## The terms

Four units, each nested in the one above, and one idea that runs
through the lower three: the outcome.

```
Initiative   (optional, soft grouping of goals)
└── Goal
    └── Milestone
        └── Task
```

| Term       | SMART                              | Outcome      |
| ---------- | ---------------------------------- | ------------ |
| Initiative | Not required                       | Not required |
| Goal       | The ambition, not always possible  | Required     |
| Milestone  | Required, and more concrete        | Required     |
| Task       | Not required                       | Required     |

## Outcome

Every goal, milestone, and task has an outcome, defined before the work
starts. The outcome is what is true once the work is done, stated so
that someone other than the person who did the work can check it.

An outcome may be an output: something that exists afterwards and can be
inspected, such as a document, a file, or a running tool. An outcome
that is an output is called a deliverable. An outcome does not have
to be an output. It can also be a state that holds (a check passes, a
risk is retired) or a decision that was made (a proposal was accepted).
In that case there is no deliverable, and the outcome is checked
directly.

## Achieved wording and SMART

Goals and milestones are written in past-tense, achieved wording, as if
the outcome had already happened. The statement then reads as a fact
that is either true or not, which is what makes it checkable. Two shapes
cover most cases:

- has reached: "Every convention file has reached conformance with
  the OKF frontmatter spec."
- was accepted: "The restructure proposal was accepted by the
  repository owner."

The wording is meant to be SMART:

- Specific: it names exactly what is reached or accepted, and by
  whom, with no room for a second reading.
- Measurable: it states how anyone can check that it holds.
- Achievable: it is within reach given the time, people, and tools
  available.
- Relevant: it traces back to the item above it, or for a goal, to
  the reason the work exists.
- Time-bound: it carries the date by which it must hold.

For a goal, SMART is the ambition. It is not always possible, and a goal
may fall short on one or more letters, as long as the gap is known
rather than hidden. For a milestone, SMART is required.

## Goal

The end state the work is for. A goal follows the achieved wording above
and has an outcome. It is broken down into milestones: when every
milestone has been reached, the goal has been reached. If that would not
be true, a milestone is missing.

## Milestone

A section of a goal, smaller and more concrete than the goal itself,
that is either reached or not, with no partial credit. A milestone
follows the achieved wording, has an outcome, and is fully SMART: a
milestone that cannot be checked cannot show that the goal is getting
closer. Every milestone also states what is explicitly not in scope,
the requirement that rule 11 of rules/rules-for-prototyping.md holds.

## Task

The smallest unit of execution: a single piece of work that one person
or one agent session can pick up and finish in one sitting. A task has
an outcome and belongs to a milestone. SMART is not required. A piece of
work that cannot be finished in one sitting is split into several tasks.

## Initiative
A soft grouping of goals that belong together, for example by theme or
by period of work. Through its goals, an initiative is associated with
their milestones and tasks by hierarchy. It is deliberately loose: it
has no required wording, no SMART requirement, no required outcome, and
a goal can exist without one. An initiative orients; it does not hold
anyone accountable. When a group of work needs a checkable end, that end
is a goal.

## Example

The toolkit's own restructure, written in this form. The dates are
illustrative.

- Initiative: Restructure the toolkit around an artifact model.
  - Goal: By 2026-09-14, the restructure was accepted by the
    repository owner, with every file classified into one of the six
    artifact kinds.
    - Outcome: the merged restructure pull request (a deliverable).
    - Milestone: By 2026-09-07, the six-kind model has been
      defined in README.md and every existing file has been
      reclassified into it.
      - Outcome: the six-kind section in README.md and the per-kind
        catalogs (deliverables).
      - Not in scope: changing what any rule says.
      - Task: Rename patterns/ to approaches/. Outcome:
        patterns/ no longer exists and its files live in
        approaches/ (a deliverable).
    - Milestone: By 2026-09-10, every rule, approach, and
      convention file has reached conformance with the corrected OKF
      frontmatter spec.
      - Outcome: every file passes the frontmatter check. This is a
        state, not an output, so no deliverable exists.
      - Not in scope: changing the spec itself.
      - Task: Add the frontmatter block to each file that lacks
        one. Outcome: every such file has the block (a deliverable).
