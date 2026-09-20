---
type: Rule
title: Rules for Prototyping
description: Product-agnostic rules for AI-supported prototyping and coding, derived from real process postmortems. General mechanics only — no product-specific naming or content.
tags: [prototyping, coding-agent, process]
timestamp: 2026-09-20
status: adopted — general, cross-cutting rules. Rule numbers are stable and may be cited by number from consuming projects; do not renumber when editing.
---

# Rules for Prototyping

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

This file holds one artifact type in this toolkit's model: *rules*,
invariants that hold regardless of what stage a project is in. The other
artifact types (approaches, routines, conventions, outputs, agent
configuration) are cataloged from the repository's own `README.md`; see
`rules/index.md` for this file's own numbering contract and a one-line
catalog of the rules below.

`rules/` is a directory, not a single file: this is the general,
cross-cutting set, scoped to prototyping and coding. A different domain
with its own postmortem history and its own invariants — project
management, for one candidate — earns its own sibling file (for example
`rules-for-project-management.md`) with its own name and its own
numbering, rather than being folded into this one just because it also
produces rules. `rules/index.md` catalogs every file in the directory,
not only this one.

A repeatable way of working that a human and an AI apply together,
whether staged, continuous, or coordination-shaped, is an *approach*
instead, and lives in `approaches/`. See `approaches/index.md` for the
catalog. Rule 1 below is the one rule here that is actually a pointer to
an approach rather than a rule itself, kept at that number rather than
removed, since it may already be cited by number from a consuming
project.

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
is an *approach*, not a rule — it lives in `approaches/design-pipeline.md`
rather than here, since it is a staged way of working with steps to go
through, not an invariant. This rule's number stays reserved as a pointer
rather than being removed, since it may already be cited by number from a
consuming project. Packaged for Claude Code as the `design-pipeline`
skill (`agent-config/claude/skills/design-pipeline/SKILL.md`), which
points at the same file rather than duplicating it (rule 4).

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
proceeding. This holds regardless of which tool runs the session; the
invariant is the check itself, not any one tool's way of triggering it.

`agent-config/claude/` in this toolkit is one working implementation, a
Claude Code `SessionStart` hook that runs this check automatically. A
different local agent needs its own equivalent trigger under a sibling
`agent-config/<tool>/`; a chat session with no hook mechanism at all still
carries the rule, it just falls back to being a step the human or the AI
has to remember to run manually, which is the weaker form this rule
exists to avoid wherever a stronger form is available.

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

## 8. Agent-facing instructions have one canonical file per project; README stays for humans

A project's agent-facing rules and instructions live in one canonical
file, kept separate from the human-facing orientation doc (`README.md`),
which continues to serve its own purpose: what this is, how to run it,
published alongside the code.

`AGENTS.md` is a common choice for that canonical file and is not itself
guaranteed to be present or read by every local agent or AI chat; a
project may instead use a tool-specific file such as `CLAUDE.md`, or more
than one, if more than one tool needs its own discovery path. What this
rule requires is not one specific filename, but that the project decide
which file is canonical and make every other tool-specific instruction
file a pointer to it rather than a second copy kept in sync by hand. A
symlink is one way to enforce that; a short "see X" line at the top of the
tool-specific file is another.

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

## 11. Work is scoped against a goal, decomposed into milestones and tasks

The planning vocabulary itself — what an Initiative, Goal, Milestone,
and Task each are, how they nest, what an outcome is and when it is
required, and a worked example — is
defined in `conventions/project-management.md` rather than here, since
it's a shared naming standard applied consistently across projects (the
`conventions/` artifact type), not an invariant. This rule's number stays
reserved as a pointer rather than being removed, since it may already be
cited by number from a consuming project — the same treatment rule 1
gives the design pipeline.

What stays here, because it's a behavior requirement rather than a
definition:

Every milestone states what is explicitly **not** in scope, not just what
is. The non-scope list is the load-bearing half: it's what stops a
milestone from silently absorbing adjacent work until it can no longer be
finished, and it's what makes "done" a decision made in advance rather than
a judgement call made once everyone is tired of the milestone.

A milestone whose outcome can't be checked is
not a milestone yet — sharpen it or cut it. The outcome need not be a
deliverable (an inspectable output); it may be a state that holds or a
decision that was made, but it must be checkable either way. A sequence
of numbered phases
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

## 13. An ID is never referenced without its title

A milestone, deliverable, phase, or any other planning-unit ID (`M1`,
`DV-2`, `kickoff-M3`, `Phase 9`, or any other scheme a project uses) is
meaningless on its own to anyone who isn't holding the full index in
their head. State the title alongside the ID every time it's introduced
or referenced — in prose, a proposal, a review entry, a status update, a
handoff — not just "DV-2" but "DV-2, Hosted Apertus path proven and
provider economics decided." A table row where the title already sits in
an adjacent column is the one place a bare ID is fine.

This matters most exactly where it's easiest to get wrong: a workspace
running several numbering schemes at once (see the disposition-table
practice of qualifying every source-specific ID, e.g. `kickoff-M3`, so
schemes don't collide) is also the workspace where a human tracking a
multi-agent session has the least chance of holding every scheme's titles
in memory. Re-pairing the title costs one clause; making a human stop and
ask "which one was that again" costs the whole thread of the conversation.

**Why this is its own rule, not folded into rule 11:** rule 11 defines
what a milestone *is*; this rule is about how it's
*referred to* once it exists — a different failure mode (context lost
through compression in conversation, not scope lost through ambiguity in
definition).

## 14. Never write a real secret to a file

When a task requires a credential that has to live in a plaintext file
(an FTP password, a database URL, an API key a tool reads from disk
rather than a header), do not type the real value into that file. Create
the file with a placeholder instead (`FTP_PASSWORD=changeme`, or a
`.env.example` with no real `.env` alongside it), and ask the human to
fill in the real value in their own editor. The real value should never
pass through the agent's context or a tool call.

A credential-injection proxy can protect HTTP-header-based authentication
without the raw secret touching agent context, but that only covers
HTTP. Protocols with no header to inject into (FTP, `.pgpass`, SSH
config) have no equivalent, so the human has to be the one who types the
real value.

Treat "create the template and tell the human what to fill in" as the
deliverable whenever a task needs a credential file, not "create the
finished file."

## 15. Verify decommissioned artifacts are actually gone

When removing a feature or integration because it is no longer used, do
not stop at removing the code or config that referenced it. Check
explicitly whether the artifact itself (the credential file, the
generated output, the cache) still exists on disk, and remove or flag it
too.

This happened concretely: an FTP-deploy setup was removed and its
`.gitignore` entry for `.env` was removed along with it, on the reasoning
that no credential file existed anymore. The actual `.env` file, holding
a real password, was never deleted, and sat ungitignored for over a
week.

Add "confirm the artifact is gone, not just its reference" as an
explicit checklist item whenever a task involves removing or migrating
away from something that touched secrets, generated files, or external
services.

## 16. New code runs through a build-versus-reuse ladder before it is written

**Rule:** before writing new code to meet a need, work through this
ladder in order, and stop at the first step that resolves it:

1. Is it needed at all?
2. Does this codebase already do it?
3. Does the language or platform standard library already do it?
4. Does a native platform feature already do it (a CSS rule instead
   of JavaScript, a database constraint instead of application code)?
5. Does an already-installed dependency already do it?
6. Can it be done in one line, as a simple, direct expression of the
   need rather than a clever or dense one?
7. Otherwise, write the minimum code the need actually requires.

Whichever step the ladder stops at, that exit states what was skipped
and when to revisit it. "Skipped a config option because one call
site covers today's case, revisit if a second call site needs a
different value," stated at the moment of the decision, is the part
of this rule that cannot be dropped even when the rest of the ladder
is worked through loosely. The failure mode this answers is not extra
code by itself; it is a shortcut that was never named, so a later
reviewer has no way to tell a deliberate simplification from an
oversight.

Without a forced order, the default path is step 7 first: write new
code before checking whether an earlier step already meets the need.
That is how a codebase ends up with a hand-rolled version of
something the standard library, the platform, or an already-installed
dependency already provided.

**Why this is its own rule, not rule 9:** the two rules differ in
scope, not in when they run. Rule 9 governs a project's adopted
building-block vocabulary, a closed, inventoried list; its check
("before introducing a new element, check whether something already
on the list serves the need") is scoped to that inventory. This rule
reaches past that inventory entirely, to whether the need exists at
all, to the standard library, to native platform features, and to
dependencies already installed but never adopted into any inventory.
It also carries a requirement rule 9 does not: every exit names what
was skipped and when to revisit it. The "does this codebase already
do it" step overlaps rule 9's check; this rule extends reuse-checking
beyond the adopted inventory; it does not replace rule 9.

---

## Learnings — evolving, not fixed

This section keeps concise, rule-specific rationale for why a rule's text
changed. The general process for observing, recording, and promoting a
working-method lesson, whether or not it ends up here, is
`approaches/working-method-learning-loop.md`; this section is where that
process's output lands when the promoted artifact is a rule.

**2026-09-20 — Rule 11 pointer re-aimed: four units, deliverable demoted
to a kind of outcome.** The vocabulary this rule points to
(`conventions/project-management.md`) was reworked around four units,
Initiative, Goal, Milestone, and Task, with an outcome required for
every goal, milestone, and task. Deliverable stopped being a planning
unit of its own: it is now defined as an outcome that is an inspectable
output, while an outcome may equally be a state that holds or a
decision that was made. The old sentence rejecting a milestone "that
has no deliverable" would have wrongly rejected a milestone whose
outcome is a checkable state, so it now requires a checkable outcome
and treats the deliverable as one shape an outcome can take. The rule
number and its behavior requirements (non-scope stated per milestone)
are unchanged.

**2026-09-15: Rule 16 added, a build-versus-reuse ladder that reaches
past this project's adopted vocabulary.** Distinct from rule 9, which
governs a closed, inventoried list of building blocks this project
has already adopted: this rule extends reuse-checking to the need
itself, the standard library, native platform features, and
already-installed dependencies never adopted into any inventory. The
"does this codebase already do it" step overlaps rule 9's check; the
two rules differ in scope, not in when they run. The part of the rule
that must survive even when the ladder itself is followed loosely:
every exit states what was skipped and when to revisit it, so a
shortcut is named at decision time rather than discovered later in
review.

**2026-09-06 — Rules 14 and 15 added: secret files need a human in the
loop, and decommissioning needs to check the disk, not just the
references.** Both trace to the same category of incident: a real
credential written into a plaintext file by an agent, and a stale
credential file left behind after its feature was decommissioned because
only the code referencing it was checked, not the filesystem. Rule 14
states that a credential requiring a plaintext file (no HTTP header to
inject into) has to be typed by the human, not the agent. Rule 15 states
that removing a feature requires checking whether the artifact it
produced, especially a credential file, still exists on disk, not just
whether anything still references it. See `routines/secret-scan.md` for
the self-contained check these rules point to.

**2026-08-31 — File renamed to `rules-for-prototyping.md`; rule 11
becomes a pointer; vocabulary extended with Goal and Task.** Two separate
problems, fixed together because the second was found while fixing the
first. First: this file's old name, `prototyping-system.md`, didn't say
which of the toolkit's several rule domains it held, and read as if
`rules/` could only ever hold one file — the wrong signal for a directory
meant to gain sibling files (e.g. a project-management rules set) over
time. Renamed to name the domain instead of implying there's only one.
Second: rule 11 defined Initiative, Milestone, and Deliverable inline and
then stopped, the same shape rule 1 had before it became a pointer — a
definition-heavy rule with nowhere to grow, decided at the time nobody
had asked to grow it. Given the same treatment: the vocabulary moved to
`conventions/project-management.md`, extended with Goal (the long-term
outcome Initiatives serve) and Task (the durable-work unit beneath
Deliverable, previously left as an unnamed gap between "deliverable" and
"a phase, task, or ticket list" in the old text), and this repository's
own artifact-model migration (`CHANGELOG.md`'s `[1.0.0]` entry) used as
the worked example instead of an invented one. Rule 11 keeps the one part
of its old text that was actually an invariant, not a definition: every
milestone must state its non-scope.

**2026-08-27 — Rule 13 added: bare IDs lose a human tracking a
multi-agent session.** A human collaborator reviewing a fast-moving
sequence of milestone/deliverable handoffs across several colliding
numbering schemes at once reported losing track whenever an ID was
mentioned bare, with no title attached — correctly: a bare ID is only
legible to whoever is holding the full index in memory, and a human
reading a running conversation isn't. This was a clean, generalizable
working-method observation on first occurrence, not something that
needed a second instance to compare against, since the underlying cause
(compression of a reference down to an opaque token) applies to any
project using this toolkit's Initiative/Milestone/Deliverable model, not
just the one where it was noticed.

**2026-08-26: Patterns become Approaches inside a full artifact model.**
The rules-versus-patterns split from the previous entry turned out to be
the first two artifact types of a larger model: rules, approaches,
routines, conventions, outputs, and agent configuration (see this
repository's `README.md`). `patterns/` was renamed to `approaches/`
because "approach" covers coordination methods and continuous practices,
such as the new working-method learning loop, that are not staged
sequences the way "pattern" implied. Rule 1 now points to
`approaches/design-pipeline.md`. Rule 3 was reworded to state the
session-boundary check as tool-independent, with the Claude Code hook
named explicitly as one implementation rather than the rule's substance.
Rule 8 was reworded because it claimed `AGENTS.md` as a universal
filename; the single-canonical-file intent is preserved, but the rule no
longer asserts one filename works across every local agent and AI chat.
No rule number changed.

**2026-08-25 — Rules vs. patterns split; rule 1 becomes a pointer.**
Rule 1 already deferred its content to
`agent-config/claude/skills/design-pipeline/SKILL.md` rather than
stating it here — a sign, on a second look, that it was never
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
