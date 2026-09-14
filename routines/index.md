---
type: Index
title: Routines
description: Catalog of self-contained, task-specific instruction sets that can be invoked in a local agent or pasted into an AI chat.
timestamp: 2026-09-11
---

# Routines

A routine is a self-contained, task-specific instruction set. It carries
everything it needs in one file, so it can be invoked by a local coding
agent or pasted directly into an AI chat that has no access to this
repository.

| Routine | What it does |
|---|---|
| [Sharpen](sharpen.md) | Cuts redundancy, filler, and AI-writing tells out of a piece of prose, and asks whether a proposed document needs to exist at all. |
| [Secret Scan](secret-scan.md) | Scans a working tree for secret-shaped content at any point in a session, not just before a commit; prefers repo-guardian's `rg-scan` when available, falls back to a pattern grep, and checks whether each match is gitignored and whether it has ever been committed. |

A routine does not depend on an approach, a rule, or another routine to
make sense on its own. Where a routine's output feeds into a staged
approach, or a rule names a routine as its enforcement mechanism, that
link is stated in the other file; the routine itself stays self-contained.

To write a new routine, start from
[conventions/templates/routine.md](../conventions/templates/routine.md).
