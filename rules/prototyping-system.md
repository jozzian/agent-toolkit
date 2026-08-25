---
type: system
title: Prototyping & Coding System — Rules
description: Product-agnostic rules for AI-supported prototyping and coding, derived from real process postmortems. General mechanics only — no product-specific naming or content.
tags: [prototyping, coding-agent, process]
timestamp: 2026-08-19
status: adopted — general, cross-cutting rules. Rule numbers are stable and may be cited by number from consuming projects — don't renumber when editing.
---

# Prototyping & Coding System — Rules

Derived from process postmortems (not code reviews) of real AI-coding-agent
sessions. Each postmortem asked what should have been done differently in
the *approach*, not what should be fixed in the code. These rules are the
answer, generalized to apply to any product — no product-specific naming,
repo names, or tooling choices live here. Concrete incidents that produced
a rule stay in whichever product's own repo they happened in; this file
keeps the generalized lesson only.

## Why this exists

The goal is a **repeatable, AI-supported system for prototyping and coding
products** — not a one-off fix for one product. Each rule below should be
read against that goal: does it survive being applied to a second,
unrelated product with none of the first one's context? If a rule only
makes sense because of one product's specific facts, it doesn't belong
here — it belongs in that product's own process notes instead.

This file holds *rules* — invariants that hold regardless of what stage a
project is in. A repeatable, staged procedure (a fixed sequence of steps
to go through) is a *pattern* instead, and lives in `patterns/` — see
`patterns/index.md` for the catalog. Rule 1 below is the one rule here
that is actually a pointer to a pattern rather than a rule itself, kept
at that number rather than removed, since it may already be cited by
number from a consuming project.

A recurring root cause underneath several unrelated-looking failures:
**no structural tripwire between what the docs say and what the app
actually does.** Docs describing a feature that was never built, and
mocked data that had quietly become real, undetected for a long time —
not because anyone was careless in the moment, but because nothing forced
a check. Rules 3-6 below are answers to that one failure showing up in
different forms.

The single instruction that has paid off most across these postmortems:
*update the doc in the same pass as the code change, and check current
state against last known state at the start of every session before
assuming they match.*

---

## 1. Design pipeline is local and sequential, before or alongside code

The fixed, ordered set of design-artifact stages (Stage 0 problem framing
→ Flows → Screens → Wireframes → Hi-fi v1 → Hi-fi v2 → ongoing iteration)
is a *pattern*, not a rule — it lives in `patterns/design-pipeline.md`
rather than here, since it's a staged procedure with steps to go through,
not an invariant. This rule's number stays reserved as a pointer rather
than being removed, since it may already be cited by number from a
consuming project. Packaged for Claude Code as the `design-pipeline`
skill (`skills/design-pipeline/SKILL.md`), which points at the same file
rather than duplicating it (rule 4).

## 2. Propose before executing, when the result can't be verified first

**The trigger is verifiability, not size or complexity.** If an action
produces something that can be checked before the human sees it — a test
exists and runs, output is checkable independent of the human's read — it
can be executed directly, shown alongside its verification. If it *can't*
be checked first — no test, no way to run it, no independent check — it
must be proposed (a description of what will change) before being
executed.

This is stricter than "always ask first" and cheaper than "ask whenever a
decision fork exists" (forks exist constantly; most don't need a stop).
It targets the actual failure mode: code written and shown as done when it
was never actually checkable.

## 3. Session-boundary check is a skill precondition, not a memory rule

Don't rely on remembering to run a state check at the start of a session —
that's exactly the kind of manual discipline that erodes under load
(confirmed failure mode: weeks of real, uncommitted work with no forcing
function to notice).

**Rule:** the coding-agent's first action, every session, before anything
else: check current state against last known state (uncommitted changes,
undocumented work, drift between docs and code) and report it back before
proceeding. Baked into tooling (see `claude-config/` in this toolkit for a
working implementation), not a separate step the human has to remember to
invoke.

## 4. Single source of truth per fact, not per file

A fact that's true across multiple files (an inventory, a role list, a
convention) gets stated once, in one file, and every other file references
it rather than restating it. Restating the same fact in multiple places is
how it goes stale in some of them and not others, silently.

Applies to: repo/component inventories, naming conventions, environment
variables, anything else that's a fact about the system rather than
content specific to one file's own subject.

## 5. Verified claims are re-derivable, not hardcoded

A claim like "all tests pass" or "N/N passing" goes stale the moment the
suite changes size. Don't hardcode the number in prose docs. Either state
the command that produces the current number, or timestamp the claim
clearly enough that staleness is visually obvious.

## 6. Every stage names its own open questions

A stage's output document explicitly lists what's unverified, stubbed, or
not yet checked — not as an afterthought, but as a required section. A doc
that reads as complete when parts of it are actually unverified is worse
than one that names its own gaps.

## 7. Naming and structural splits are decided at Ideation, not discovered mid-build

Anything expensive to rename or restructure later — the boundary between
reusable/shared components and product-specific ones, file/repo naming
conventions, how a system is divided into parts — gets decided as an
explicit question at the start (Ideation), not left to accrete session by
session. This doesn't mean the decision is permanent; it means it's a
decision, made and recorded, not a default nobody chose.

## 8. AGENTS.md is the agent-instruction file; README is for humans

One file for agent-facing rules and instructions (AGENTS.md), kept
separate from the human-facing orientation doc (README.md), which
continues to serve its own purpose (what this is, how to run it, published
alongside the code). If a tool-specific instruction file is also needed
(e.g. Claude Code's own convention), it should point at AGENTS.md rather
than duplicating its content — a symlink, not a second copy to keep in
sync by hand.

## 9. A shared building-block vocabulary is a closed, audited list

Whenever a product is built on a component library, pattern set, or any
other reusable vocabulary (UI components, API endpoint conventions, icon
sets, terminology) — maintain an explicit inventory of what's actually
adopted and what each element is for, not just what's technically
available upstream. Before introducing a new element, check whether
something already on the list serves the need. When a genuinely new one
is required, add it to the inventory in the same change — the list must
never silently drift out of sync with the code (a specific case of rule
4: "what do we use for X" is a fact, and it lives in exactly one place).

**Why this is its own rule, not just an instance of rule 4:** rule 4 is
about a fact going stale in some copies and not others. This is about a
different failure mode — no fact is wrong anywhere, there just isn't one
yet, so each session or contributor picks independently and plausibly,
and the choices never converge. A custom-built element next to a library
that already ships one, the same kind of behavior wired a slightly
different way in several places, a new tag or category invented for a
meaning that already had one — none of these are wrong in isolation. They
just don't add up to one coherent system, and nothing forces the question
"does something here already do this?" to even get asked.

---

## 10. Practices worth watching, not yet rules

Two things that worked well in practice but aren't mature enough to be
stated as rules — noted here so they aren't lost, not to be treated as
mandatory yet.

- **Scoped subagent delegation.** A subagent given a narrow task, no
  inherited memory of the parent session's history, and an explicit
  instruction to stop and ask rather than guess, performed well. Unclear
  yet whether this generalizes or was specific to that task's shape.
- **Parallel-model verification.** Running a second, different model
  alongside the primary agent on the same task, as a check rather than a
  replacement, caught things a single model missed. Same caveat — one
  data point, not yet a rule.

Revisit both once there's more than one instance to compare.

---

## 11. Work is scoped as initiatives, decomposed into milestones and deliverables

Three nested planning units, largest to smallest:

```
Initiative
└── Milestone
    └── Deliverable
```

- **Initiative** — the general topic or iteration being worked on, scoped
  implicitly in its own name rather than left open-ended (e.g. "Cross-
  platform backups for local backups," not "Backups"). Framed with a
  short definition doc before work starts — see Stage 0 of the
  `design-pipeline` skill for the field list and which fields gate the
  start of design work versus which are filled in as they become real.
- **Milestone** — a moment of delivered value inside an initiative: a
  named outcome that can be checked yes-reached or no-not-yet without
  ambiguity, backed by at least one deliverable that would prove it. An
  initiative produces one or more.
- **Deliverable** — the concrete, reviewable output the team builds on
  the way to a milestone. A milestone decomposes into one or more.
  Deliverables are the execution slice (what a phase, task, or ticket
  list actually tracks) — not the planning unit itself.

Every milestone states what is explicitly **not** in scope, not just what
is. The non-scope list is the load-bearing half: it's what stops a
milestone from silently absorbing adjacent work until it can no longer be
finished, and it's what makes "done" a decision made in advance rather than
a judgement call made once everyone is tired of the milestone.

A milestone whose outcome can't be checked, or that has no deliverable, is
not a milestone yet — sharpen it or cut it. A sequence of numbered phases
with no stated outcome is a useful artifact, but it isn't a plan.

## 12. Before every commit, check for what shouldn't be in it

Staging changes (especially a broad `git add`) and committing is not
verifiable the way a test run is — nothing catches a mistake here except a
look before it happens. Before running `git commit`, review what's
actually staged (`git status`, `git diff --cached` for anything non-obvious)
and check specifically for:

- Secrets or credentials — even in a file whose name looks innocuous;
  check contents, not just the filename, before committing anything that
  could plausibly hold one
- Files that don't belong in version control — build output, local config,
  editor/OS artifacts, anything a `.gitignore` should have caught but
  didn't yet
- Debug/scratch files left over from the session that aren't part of the
  actual change being committed

If anything turns up, ask before committing rather than silently dropping
it from the commit or committing anyway — the human may want it excluded,
gitignored going forward, or handled some other way, and guessing wrong in
either direction (leaking a secret, or silently losing a file the human
meant to keep) is worse than a short pause to confirm.

---

## Learnings — evolving, not fixed

**2026-08-25 — Rules vs. patterns split; rule 1 becomes a pointer.**
Rule 1 already deferred its content to `skills/design-pipeline/SKILL.md`
rather than stating it here — a sign, on a second look, that it was never
really an invariant, but a staged procedure with steps to go through.
Made that distinction explicit: a `patterns/` directory now holds staged
procedures generally, `design-pipeline`'s content moved there
(`patterns/design-pipeline.md`), and the Claude Code skill file became a
thin pointer to it instead of the canonical copy. Rule 1's number stays,
now stating the pointer itself rather than the content, since a consuming
project may already cite it by number. Rule 10's heading changed from
"Patterns worth watching" to "Practices worth watching" so it stops
colliding with the new, more specific meaning "pattern" gets from this
split.

This section is expected to grow. Add an entry whenever a rule above turns
out incomplete, wrong, or insufficient in practice — don't silently patch
the rule above without a record of why it changed. Each entry: what
happened, which rule it touched, what changed as a result. Keep entries
generalized — if a lesson came from a specific product's incident, name
the shape of the problem, not the product, repo, or commit it happened in
(that detail belongs in that product's own process notes).

**2026-08-19 — Rule 11 extended with Initiative and Deliverable.**
Rule 11 originally defined only Milestone, with "phases, tasks, and
tickets" named loosely as the execution layer beneath it. A more complete
planning vocabulary — Initiative above Milestone, Deliverable as the named
execution unit below it — closed that gap and gave Stage 0 of the design
pipeline a real field list to gate on, instead of an invented stub.

**Rule 1's stage list vs. actual practice.** An audit against a real
product found the design pipeline actually in use folded an intended
separate low-fidelity round into the first hi-fi pass, because that pass
already applied the real design system rather than minimal styling. See
the `design-pipeline` skill's own notes for the resolved shape — noted
here only as an example of why rule 1 points there instead of stating the
stage list twice (rule 4).

**Rule 9's origin.** A user-reported batch of UI bugs traced back to the
same underlying shape more than once: a component library default never
audited because nobody had checked which defaults were actually being
relied on, a hand-rolled element sitting next to a library that already
shipped an equivalent, the same kind of call wired independently in
several places, and a visual convention that was already accidentally
consistent but had never been written down. None of these were "wrong" in
the sense of contradicting a stated rule — there was no rule yet saying
the vocabulary itself needed to be a closed, deliberate list.

**Rule 11's origin.** A continuous numbered-phase list worked while each
phase was "build the next obvious thing," but a reconciliation pass found
it had stopped answering "what are we aiming at": phases deferred
indefinitely with no criterion for picking them back up, phases that were
pure bug-fix rounds rather than forward progress, one written entirely
blind with no way to check it, and real committed work that shipped with
no phase entry at all until a later pass added one. None of that is
visible from reading the phase list itself. Fixed by introducing
milestones as the planning unit one level above phases, with a mandatory
non-scope list per milestone so scope creep has to be named out loud
rather than absorbed silently.
