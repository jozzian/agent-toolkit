---
type: Routine
title: Write Agent Brief
description: Turns a vague task idea into a conforming four-part agent-executable brief, portable enough to paste into any chat.
timestamp: 2026-09-15
tags: [work-orders, briefs, delegation]
status: adopted; canonical, tool-neutral version. Do not fork a per-tool copy of this content.
---

# Write Agent Brief

Apply this routine to a vague task idea: a rough description, a
one-line ask, or a half-formed ticket. Follow every instruction
below to turn it into a self-contained brief that a coding agent
can execute cold, with nothing but the brief and the target
repository.

## What to do

1. Identify the target repository and, if you have not already,
   read its top-level index or README, so every path you cite
   below either actually exists or is a clearly new path under an
   existing directory the repository's own conventions define. Do
   not invent a path from memory; an invented path makes the
   executing agent hallucinate a deliverable that does not belong
   where the brief says it does.
2. Write a hook: one to two sentences stating why this task
   exists. Link the source, an article, a tool, a prior work
   order, by its identifier, not by restating its content.
3. Write the repo deliverable: the concrete file or files to
   create or amend, with exact paths from the real repository
   tree. Always include the repository's own bookkeeping
   artifacts, a changelog entry, an index update, a findings-log
   entry, wherever that repository's own conventions define them
   as part of shipping a change. List at least one committed
   deliverable; a learning task still produces an artifact, not
   only notes nobody else can read later.
4. Write the agent brief itself: one paragraph that points an
   agent at the work cold: clone the repository, read the named
   files, produce the named output, add the bookkeeping entries
   from step 3, open a pull request.
5. Write the learning goal: one line stating what the human
   understands after the task is done, not what the agent
   produces.
6. Give the title a verb-first, capitalized form: "Add X," "Build
   Y," not a noun phrase describing the eventual state.
7. Add an optional extra only where it earns its place: an
   acceptance-criteria line for a task with a verifiable end
   state, a sources list for a study task, a pairing note naming
   the paired identifier for a task that forms a natural duo with
   another (for example, a training half and an inference half of
   one feature).
8. Cross-link related work by identifier rather than a
   hand-written URL; most work-order systems resolve an
   identifier into a link on their own, and a hand-written URL
   goes stale.
9. Write the whole brief in plain, direct prose: no contractions,
   no em dashes or en dashes (use a period, a comma, a colon, or
   "and" instead), no filler phrases, no inflated words where a
   plain one would do, no stacked hedging, lead with the point in
   every sentence.
10. Before handing off the brief, check it against this list: all
    four parts present and in order; every deliverable path
    grounded in the real repository tree; the repository's own
    bookkeeping artifacts included; the title verb-first; related
    work cross-linked by identifier; at least one committed
    deliverable; optional extras present only where they earn
    their place.

## Kickoff message

Once a brief exists in the work-order system, a fresh chat session
or a different agent may need to execute it without access to
whatever conversation produced the brief. Post a kickoff message
that is self-contained: every fact in it is either already in the
work-order system, already in the target repository, or stated
inline in the message itself. Never write "as we discussed."

The fenced skeletons below are templates to copy and fill in for
each run, not finished messages. A reference inside one of them, to
the target repository's own conventions, to a stored template
location, is an instruction for the agent executing the kickoff at
that time, in that repository. It is not a file a reader of this
routine needs to open.

### Full form

Use the full form when no shorter template already exists for the
invariant steps, or when the session receiving it cannot load one.
Post it as a single fenced code block so it is easy to copy whole,
never buried in surrounding prose, and do not hard-wrap lines
inside the block: one long line per step, and let the reading
client wrap it, since a hard wrap chosen for a terminal shows up
as odd mid-sentence breaks in a chat client.

```text
1. Read <ID> in the work-order system for the full agent brief. Move it to In Progress.
2. Clone or update <owner>/<repo> using the credential mechanism the host environment provides; never echo a credential in output. Route work-order status updates through whatever tool the session has for that; do not hand-roll API calls against the work-order system.
3. Read the target repository's own PR-description convention and follow its house style exactly: its mandatory body sections, its conditional sections, its prose rules, and the repository's documentation-format rules (a closed frontmatter type list, for example) where those apply to the artifacts the brief touches. Use the repository's designated bot or noreply commit identity if it has one, never a personal name or email.
4. <Issue-specific study or placement step: prior art to read, a decision to make and justify. If a placement decision exists, present the recommendation before building anything.>
5. <Issue-specific deliverables, condensed from the work-order brief, including any acceptance-criteria test setup.>
6. Delegate the build to a coding agent that is not the orchestrating session itself, so the orchestrator stays free to review. Give it a self-contained brief. Where more than one coding agent is available, rotate which one builds and have a different model family cross-review the result. Then review the work independently: run the acceptance checks yourself, and check house style and frontmatter with a scripted check where one exists. A coding agent's own self-report is not evidence on its own.
7. The operator reviews the full working tree before any push. Show a diff summary and the review verdict, then wait for explicit go-ahead before pushing anything.
8. After approval: push, open a pull request with a body that follows the target repository's own PR-description convention, including its metadata block. Post the pull request link to <ID>. Move the work order to whatever state means "awaiting merge" in that workflow, or leave it In Progress if no such state exists.
9. After merge: append a dated result block to <ID> recording what shipped, the acceptance-criteria outcomes, and any side findings. Then move the work order to Done.
10. Close with a findings-log entry about this run, if the target repository keeps one, answering one concrete question: <the one thing this run teaches that a prior run did not>.
```

Steps 2, 3, 6, 7, 8, and 9 do not change from one work order to
the next: they are the environment facts, the house style, the
review gates, and the closeout loop. Steps 4, 5, and 10 are
written fresh for each work order.

### Short form

Once the invariant steps above are themselves stored somewhere
any session can load them, for example a template file the
session knows how to fetch, prefer the short form:

```text
Kick off <ID> (<repo>) using the default delegation loop (load <template location> for the invariant steps). Issue-specific: <deliverables and decisions>, <any placement decision that needs operator input first>, <any non-default bookkeeping specifics>, findings question for this run: <the one thing this run teaches>.
```

The executing agent is expected to expand the short form into the
full ten-step loop on its own, applying every invariant gate, not
to treat the short form as the whole instruction.

Step 10 always carries one concrete question about what the run
teaches. A generic instruction to "write a findings entry" invites
a filler entry that teaches nothing; naming the question up front
is what makes the entry worth writing.

## Invocation

Paste this file into a chat, or point a coding agent at it,
together with the vague idea to turn into a brief. The routine
then applies to that idea: producing the four-part brief is the
routine's job, not preparing to produce one.

A consuming project or an agent configuration may designate this
routine as its default for turning ideas into work orders, so it
runs without being asked each time a new task is proposed.

This file, by itself, cannot make that happen automatically.
Whether pasting it establishes it for the rest of a conversation
depends on how that chat interface handles pasted instructions;
some interfaces hold them for the remainder of the conversation,
others do not. This file states what the routine does once
invoked; whether it runs by default in a given tool or chat is a
property of that tool's or that chat's own configuration, not of
this file.
