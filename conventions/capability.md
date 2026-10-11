---
type: Convention
title: Capability repository
description: The shape of a repository that holds one capability shared by several products.
timestamp: 2026-10-11
---

# Capability repository

A capability is logic that is not about one product, kept in its own repository so several products can use it. AGENTS.md says when to create one. This file says what the repository contains.

## README shape

The README is the contract. A product team or agent reads only this to decide whether to use the capability.

```
## Purpose
One paragraph. What problem it solves, for which kind of input.
## Behavior
Numbered rules the code keeps, each with the reason. These are what the tests protect.
## Not included
What a product must do itself.
## Interface
Each entry point with an example input and output.
## States
Every state a record or field can be in, and what moves it.
## Consumers
Each product using it and the version it pins.
## Open questions
```

## Rules

- No product concepts. Code and docs never name a product, its records or its words. A product passes plain data in and maps the result back in a thin adapter module of its own.
- Everything outside the logic is passed in: storage, network fetch, model client, clock. The capability never reads a product's files or settings.
- Standards over ad hoc labels. Taxonomy data files live in the repository with their source and edition, and one module owns each taxonomy.
- Every external signal reports its outcome, so a failure is never silent.
- Tests follow the Tests rule in AGENTS.md. The behavior rules above are the minimum test list.
- Releases are git tags with semantic versions and a CHANGELOG line. A product pins a tag and upgrades on purpose.
- Learnings about the capability go to its own docs/learnings.md, not to the product's.
