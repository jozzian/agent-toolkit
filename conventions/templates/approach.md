---
type: Convention
title: Approach Template
description: Starting skeleton for an approach file, derived from the section structure the existing approaches actually share, accommodating all four kinds.
timestamp: 2026-09-11
tags: [template, approaches]
---

# Approach Template

An approach is a reusable way of working that a human and an AI apply
together. It may be a lifecycle, a staged workflow, a continuous
practice, or a coordination method. This skeleton lists the sections the
existing approaches actually share; per
[approaches/index.md](../../approaches/index.md), a heading is used only
where it adds information, so delete any section that does not apply
rather than filling it with filler.

The canonical examples to study before writing:
[approaches/review-protocol.md](../../approaches/review-protocol.md)
(coordination) and
[approaches/idea-to-mvp.md](../../approaches/idea-to-mvp.md)
(lifecycle).

## Template

```markdown
---
type: Approach
title: <Name>
description: <One sentence: the reusable way of working, and the failure it prevents or the outcome it produces.>
timestamp: <YYYY-MM-DD, the date of the last material edit>
tags: [<relevant tags>]
status: <draft, v1 | adopted, plus a one-line note on maturity or where it was exercised for real>
---

# <Name>

**Kind:** <lifecycle | staged workflow | continuous practice |
coordination>

## Purpose

<The problem or failure mode this approach answers, in two to four
sentences. State what goes wrong without it, concretely enough that a
reader can recognize the situation.>

## When it applies

<The trigger: an event, a condition, or a cadence, stated so a reader
can recognize the moment. Name where the boundary with a neighboring
approach sits when that boundary is easy to miss.>

## Human and AI responsibilities

<One paragraph: what the human decides or holds final judgment on, what
the AI drafts or executes, and what the AI must say plainly rather than
guess at.>

## Method

<The way of working itself. Numbered steps for a sequential method. For
a staged workflow, one H2 section per stage instead of this heading.
For a coordination method, the handoff mechanics and any file shapes
they use, in a fenced code block. For a lifecycle, the phases and their
gate questions.>

## Outputs

<The files or entries this approach produces and where they live. If a
produced file has a required shape specified under outputs/, point at
that file rather than restating the shape (rule 4 of
rules/prototyping-system.md: single source of truth per fact). Where
entries carry a status, list the closed set of status values here,
derived from the Method steps.>

## Completion or review condition

<The checkable condition that closes one run of this approach: a gate
question answered, a verdict landed, a status reached.>

## Related artifacts

<Repo-relative paths to the rules, approaches, and outputs this one
depends on or feeds, each with one line saying how.>
```

## Filling it in

- **Kind is mandatory and picked from the four values.** It tells a
  reader which shape to expect: a lifecycle has phases and gates, a
  staged workflow has ordered stages, a continuous practice has a
  trigger and a cadence, a coordination method has parties and handoff
  files. See the Kind column in
  [approaches/index.md](../../approaches/index.md).
- **Purpose, When it applies, and Human and AI responsibilities appear
  in every existing approach.** Keep all three even for a short file.
- **Method adapts to the kind.** `review-protocol.md` uses numbered
  steps plus a fenced review-entry shape; `idea-to-mvp.md` uses one
  section per phase, each ending in a gate question and an Exit;
  `multi-agent-collaboration.md` uses named mechanism sections instead
  of steps. All three are valid; pick the one that matches the kind.
- **Outputs and Completion or review condition may be omitted** where
  an approach produces no file and has no closing condition, but say so
  deliberately rather than leaving the heading out by accident.
- **An approach that only restates a rule should link to the rule
  instead** (see the closing note of
  [approaches/index.md](../../approaches/index.md)).
- **Register the new file** in the
  [approaches/index.md](../../approaches/index.md) catalog table in the
  same change, and add a `CHANGELOG.md` entry.
- Approaches are expected to grow through use, not be written complete
  on day one; `status: draft, v1` with an "Open questions" section is
  the honest starting state.
- Follow the house prose style (see
  [routines/sharpen.md](../../routines/sharpen.md)): lead with the
  point, no contractions, no em dashes, no filler.
