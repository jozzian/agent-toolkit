---
type: Approach
title: Review Protocol
description: A file-based handoff protocol for a genuinely separate agent session to review a plan or a diff before work proceeds, so an agent never approves its own work.
timestamp: 2026-08-26
tags: [process, review, multi-agent]
status: adopted; generalized from a real multi-session deployment where both of its original open questions were resolved by use.
---

# Review Protocol

**Kind:** coordination.

## Purpose

An agent reviewing a plan or a diff it produced itself shares the exact
blind spots it had while producing it: the same assumptions, the same
"good enough for now" calls, carried straight into the review. The fix
is not a better prompt. It is a genuinely separate context, a different
agent session that never saw how the work came to be, reviewing only the
artifact, the plan or the diff, against the project's own stated
requirements and conventions.

## When it applies

Before implementing any milestone or deliverable (a plan review), and
after a chunk of implementation, before starting the next chunk (a code
review). Both are mandatory. Neither agent approves its own plan or its
own diff.

## Human and AI responsibilities

The human sets up the two genuinely separate sessions, or two separate
tools, and resolves anything a review blocks on. The implementing agent
writes what it is about to do, or what it just did, then stops and waits
rather than proceeding on its own judgment. The reviewing agent reads
only the handoff file, never a paraphrase of it, and reviews the actual
plan text or the actual diff.

## Method

1. The implementing agent writes `reviews/next-to-execute.md`: what it
   is about to do (a plan), or what it just did (a diff, or a summary of
   changes and why). This file is overwritten each time; it is a
   mailbox, not a log.
2. The implementing agent stops. It does not proceed to implementation,
   or to the next chunk, until a response appears.
3. The reviewing agent reads that file and appends a review to
   `reviews/log.md` (append only; this file is the actual history). That
   append is the signal the implementing agent watches for.
4. A `changes-requested` verdict blocks progress. The implementing agent
   addresses the issues and writes a new `reviews/next-to-execute.md`
   for a follow-up review rather than proceeding anyway.

Every review appended to `reviews/log.md` follows this shape:

```
## [timestamp] Review by <model name>
Type: plan | code
Subject: <one line, which milestone or deliverable>

Summary: <what was reviewed, in 1 to 3 sentences>
Verdict: approved | approved-with-notes | changes-requested

Issues:
- <concrete issue, or "none">

What to verify:
- <anything the implementing agent should double check itself,
   not a restatement of Issues>
```

The model name is required. Different models reviewing the same project
over time is useful signal to keep; do not paraphrase it away as "the
reviewer."

## What makes a review real, not a rubber stamp

- The reviewing agent needs the actual content, not a paraphrase: the
  full plan text, or the actual diff.
- A plan review checks assumptions that are not stated as assumptions,
  failure modes, testability, compatibility with what already exists,
  and whether the plan is bigger than the milestone needs.
- A code review checks whether the diff matches what the reviewed plan
  said it would do, whether tests exist, and whether anything is an
  unrelated drive-by change that should have been its own reviewed step.

## Outputs

`reviews/next-to-execute.md`, the current handoff, and `reviews/log.md`,
the append-only review history. Both live at the workspace level rather
than duplicated per repo when a single review spans more than one repo.

## Completion or review condition

A plan or a diff clears once its review lands with `approved` or
`approved-with-notes`. A `changes-requested` verdict reopens the same
step; it does not close it.

## Related artifacts

- `approaches/multi-agent-collaboration.md`: this protocol is one
  concrete mechanism for the environment-asymmetry and boundary-check
  concerns that approach raises at multi-session scale, specialized to
  the review moment specifically.
- `rules/prototyping-system.md` rule 2: proposing before executing is
  what makes a plan review possible in the first place. This protocol is
  how that proposal actually gets checked by a second party.
