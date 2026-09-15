---
type: Convention
title: Agent Brief
description: Convention for writing an agent-executable work-order brief, covering the four-part anatomy and the writing rules that keep it grounded in the real repository.
timestamp: 2026-09-15
---

# Agent Brief

A convention for writing a work-order brief that a coding agent can
execute cold, from the brief and the target repository alone,
rather than from context accumulated in a chat. The alternative, a
free-form description of what to build, works for a human who
already holds the missing context in their head; it does not
survive being handed to an agent that starts with nothing but the
words on the ticket.

## Which briefs this applies to

Every work order intended for cold execution by a coding agent in
this workflow. A one-line human todo or a task tracked only inside
a conversation does not need it.

## The convention

A conforming brief has four parts, in order:

```markdown
<1-2 sentence hook: why this exists, linking source material or prior work orders by identifier>

**Repo deliverable (<repo-name>):**
- Concrete file(s) to create or amend, exact paths from the real repository tree.
- The repository's bookkeeping artifacts (changelog, index updates, findings-log entry) where its conventions define them.

**Agent brief:** Clone <owner>/<repo>, read <specific files>, produce <specific output>, add the bookkeeping entries, open a pull request.

**Learning goal:** <one line: what the human understands after doing this>.
```

- **Hook.** One to two sentences on why the task exists. Link the
  source material, an article, a tool, or a prior work order, by
  identifier rather than restating it.
- **Repo deliverable.** The concrete file or files to create or
  amend, with exact paths from the real repository tree. Always
  include the repository's own bookkeeping artifacts, a changelog
  entry, an index update, a findings-log entry, wherever that
  repository's own conventions define them as part of shipping a
  change.
- **Agent brief.** One paragraph that points an agent at the work
  cold: clone the repository, read the named files, produce the
  named output, open a pull request.
- **Learning goal.** One line: what the human understands after the
  task is done, not what the agent produces.

Writing rules that keep a brief executable:

- **Ground every path in the real repository tree.** Clone first,
  read the README and the indexes, cite actual paths. An invented
  path makes the executing agent hallucinate a deliverable that
  does not belong where the brief said it would.
- **Titles are verb-first and capitalized.** "Add X," "Build Y,"
  not a noun phrase describing the eventual state.
- **Cross-link related work by identifier.** A work-order system
  typically resolves an identifier into a rich link on its own;
  writing out a URL by hand is unnecessary and goes stale.
- **At least one committed repository deliverable per task.** A
  learning task still produces a committed artifact, not only
  notes in a chat that nobody else can read later. A findings-log
  entry, where the target repository keeps one, is a byproduct
  nearly any task can produce.

Optional extras, included only where they earn their place:

- **Acceptance criteria**, for a task with a verifiable end state:
  one line stating what "done" means in checkable terms.
- **Sources list**, for a study task: what the agent should read
  before writing anything.
- **Pairing note**, for a task that forms a natural duo with
  another, for example a training half and an inference half of
  one feature: name the paired identifier so neither half ships
  without the other.

## Why this, not the alternatives

Four parts, not one free-form paragraph, because each part answers
a different question a cold agent needs answered before starting:
why this, what file, what exact action, and what the task teaches.
Collapsing them into prose leaves an agent guessing which sentence
was the actual instruction.

The repo deliverable rule names bookkeeping artifacts explicitly
because they are the easiest part of a task to skip under time
pressure, and the part most valuable to keep: a changelog entry or
a findings entry is what lets a reader months later reconstruct
why a change happened without reopening the diff.

Grounding every path in the real tree, rather than trusting the
brief author's memory of the repository's layout, matters because
a brief is often written once and handed to an agent that has
never seen the conversation that produced it. A path that turns
out not to exist is not a rounding error; it is where the agent
starts inventing structure that does not match anything else in
the repository.

## Applying this

1. Before writing a brief, clone or open the target repository and
   read its top-level index or README, so every path named in the
   brief either actually exists or is a clearly new path under an
   existing directory the repository's own conventions define.
2. Write the hook, then the repo deliverable, then the agent brief
   paragraph, then the learning goal, in that order.
3. Add optional extras only where the task genuinely has a
   verifiable end state, a study component, or a paired sibling.
4. Downstream of the brief: the executing agent's pull request
   follows the target repository's own PR-description convention,
   and, once the pull request merges, a dated result block is
   appended to the work order. That division of labor, what the PR
   body carries, what the commit message carries, what the work
   order carries, is defined once; see
   [conventions/pr-description.md](pr-description.md). A brief
   should not restate it.
5. A brief written before this convention, or before the target
   repository's own PR-description convention existed, may lack
   that vocabulary. A new brief should anticipate that the
   resulting pull request will conform to the target repository's
   PR convention regardless (mandatory body sections, an unwrapped
   body, a hard-wrapped commit message with its own trailer
   mechanics), rather than specifying PR shape itself; see
   [conventions/pr-description.md](pr-description.md) for the
   actual spec.

## Examples

**Example 1, a study-and-build task.** Hook: "Work orders that
dispatch coding agents need to themselves be agent-executable
briefs; recent tasks already follow an informal pattern, codify it
as PROJ-161." Repo deliverable (owner/repo): conventions/agent-brief.md,
the new convention file for the brief format; routines/write-agent-brief.md,
the new routine file that turns an idea into a conforming brief;
the entries for both in conventions/index.md and routines/index.md;
and the CHANGELOG.md entry. Agent brief: "Clone owner/repo, read
the artifact-format convention and its templates plus one shipped
example of each kind, produce the two new files, update both
indexes and the changelog, open a pull request." Learning goal:
"Prompt and spec engineering for an agentic consumer is the skill
that compounds across every other task."

**Example 2, a tool task with acceptance criteria.** Hook: one
sentence linking the incident that motivated the tool, codify it as
PROJ-152, one of the follow-ups tracked under PROJ-150..154. Repo
deliverable (owner/repo): tools/scanner/, the scanner tool; the
fixtures under tests/fixtures/; and a findings-log entry.
Acceptance criteria: the acceptance suite passes, and every
redaction claim re-derives from evidence the tool itself did not
produce. Agent brief: "Clone the repository, read its environment
section, build the tool, run the acceptance suite, open a pull
request." Learning goal: "A verification claim only counts once it
re-derives from evidence the tool itself did not produce, not from
the tool's own report of what it did."

## Quality checklist

Before handing off a brief:

- [ ] All four parts present, in order: hook, repo deliverable,
      agent brief, learning goal.
- [ ] Every path in the repo deliverable exists in the real
      repository tree, or is a clearly new path under an existing
      directory the repository's own conventions define.
- [ ] The repo deliverable includes the target repository's own
      bookkeeping artifacts, wherever its conventions call for
      them.
- [ ] The title is verb-first and capitalized.
- [ ] Related work is cross-linked by identifier, not a
      hand-written URL.
- [ ] At least one committed repository deliverable, not notes
      alone.
- [ ] Optional extras included only where they earn their place.
- [ ] No PR-shape detail duplicated from the target repository's
      own PR-description convention.
