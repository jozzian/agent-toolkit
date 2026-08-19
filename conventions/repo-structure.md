---
title: Multi-Repo Workspace Structure
description: Convention for splitting a product's docs, design system, frontend(s), and backend(s) into separate, independently-replaceable repos under one flat workspace.
---

# Multi-Repo Workspace Structure

A convention for organizing a product family as several small repos under
one workspace root, rather than one repo per product or one big monorepo.

## The convention

- **One repo, one clear role.** Each repo does exactly one job (docs,
  design system, an application, a backend service) and states that role
  explicitly for itself.
- **Cross-repo integration through a real interface, not shared code or
  monorepo build coupling.** A design system consumed as an npm/git
  dependency; a backend consumed as a service over a real network
  boundary (HTTP, open CORS, or equivalent). Every repo stays
  independently replaceable — swappable without touching its neighbors.
- **Naming: `<product>-<role>`, flat, no wrapper folders.** Every repo
  sits directly under the workspace root.
- **Roles:** a docs repo (tech-agnostic source of truth, meant to outlive
  a full rewrite of anything else), a design/component-library repo, one
  or more application repos (a product can have more than one — e.g.
  public vs. admin), and one or more backend service repos, named for
  what they do.
- **Every repo has git + a remote from day one**, even experimental ones.
- **A lifecycle-stage suffix (e.g. "-poc") is not a permanent identity.**
  A repo drops that naming once another repo in the family starts
  depending on it for real.
- **Workspace-level config lives once, at the workspace root** —
  sandbox/devcontainer config, shared lint/CI config, or any other
  tooling that would otherwise need duplicating per-project. Not
  duplicated per-repo unless a given repo is meant to be cloned and
  opened fully standalone outside the multi-project workspace.

## Why this granularity, not more or fewer repos

- **Docs vs. everything else** — the docs repo is explicitly
  technology-agnostic and must outlive a full rewrite of the design
  system, a frontend, or a backend. Bundling it into any of those ties
  the one thing meant to be stable to the things meant to be replaceable.
- **Design system vs. app** — a design system needs to be swappable
  independently and consumable by more than one frontend if a second one
  ever exists. Embedded in the first app that used it, it gets neither
  property.
- **Frontend vs. backend** — split along a real network boundary, the
  most conventional split available, and the one that lets a second
  frontend or backend reuse the other side without touching it.
- **Not merged further** — each repo typically runs a genuinely different
  stack with its own install/test story; a monorepo would still need the
  same internal boundary, just nested instead of flat.

This explains why *some* split along these lines is useful, not that a
given repo count is provably optimal for every product — revisit the
boundary if a repo's own internal engine/product split hardens into two
things that change on different schedules (a real signal to split
further), and record that decision explicitly (rule 7 of
`prototyping-system.md`) rather than letting it accrete.

## Applying this to a new product

1. Decide the roles this product actually needs (docs is almost always
   one; design system and multiple apps/backends only if genuinely
   separate concerns exist yet).
2. Name each repo `<product>-<role>`, create it with a remote immediately.
3. Record the per-product inventory (which repos exist, their GitHub
   remotes, local paths) once, in the product's own docs repo — not here.
   This file states the convention; the product states its own facts
   (rule 4 of `prototyping-system.md`: single source of truth per fact).
