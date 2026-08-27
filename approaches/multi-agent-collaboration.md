---
type: Approach
title: Multi-Agent Collaboration
description: How to split work across more than one AI-agent session on the same product without them silently working from different facts.
timestamp: 2026-08-26
tags: [process, multi-agent, prototyping]
status: draft — v1, first pass at generalizing a real multi-repo/multi-session setup
---

# Multi-Agent Collaboration

**Kind:** coordination.

## Purpose

An approach for when a product is being built by more than one AI-agent
session at once, whether one per repo, one per subsystem, or simply more
than one running in parallel, rather than a single continuous session
doing everything in order.

## When it applies

More than one AI-agent session works on the same product at the same
time, and each session risks acting on a fact another session already
changed.

## Human and AI responsibilities

The human draws the scope boundary between sessions and decides what
counts as the one shared fact each session must defer to. An AI session
works within its own scope's `AGENTS.md`, references the shared fact by
name or ID instead of re-deciding it locally, and states plainly when its
own environment cannot verify a change rather than reporting it as done.

## Scope by boundary, not by task

Give each agent session a scope that matches a real structural boundary —
one repo (see `conventions/repo-structure.md`), one subsystem, one
service — not an arbitrary slice of a shared codebase. Each scope gets
its own `AGENTS.md` stating the rules that apply only there. A session
confined to a real boundary can be trusted with the rules stated in its
own `AGENTS.md`; a session working across an arbitrary task-shaped slice
of a shared codebase has no such natural fence, and needs a human to
define one before parallelizing further.

## One fact, one hub, referenced by ID

Anything true across more than one session's scope — a cross-cutting
plan, a shared vocabulary, a terminology decision — is stated once, in
one place (often a docs repo or scope), and every other session
references it by name or ID rather than restating or re-deciding it
locally (rule 4 of `rules/prototyping-system.md`). This is what lets
independent sessions, each with no visibility into the others' history,
stay coherent: they share a written fact, not a memory.

## Integrate through a real boundary, verify the boundary itself

Sessions integrate through whatever real interface already separates
their scopes — a package dependency, an HTTP API, a shared file — not by
reading each other's uncommitted state. Check the boundary mechanism
itself before trusting that a cross-session fix landed: a dependency
pinned to a commit or tag, for instance, does not pick up another
session's push until it's actually re-resolved — a fix can be real,
committed, and still invisible to a consumer session that hasn't
re-pulled it. When something "still looks broken" after a fix, checking
whether the boundary actually updated is a real diagnostic step, not a
formality.

## Name environment asymmetry, don't assume it away

Different sessions can have genuinely different capabilities — one has a
runtime available to run and verify a change, another doesn't. A session
that can't verify its own change must say so plainly (e.g. "written
blind, not yet run") rather than reporting the change as done — this is
rule 2 (propose before executing, when the result can't be verified
first) applied at multi-session scale: another session or a human with
the missing capability has to close the loop before that work is trusted.

## Related artifacts

- `conventions/repo-structure.md`: the boundary this approach assumes
  already exists.
- `rules/prototyping-system.md` rules 2 and 4: the two invariants this
  approach applies at multi-session scale.
