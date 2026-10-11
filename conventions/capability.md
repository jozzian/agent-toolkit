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

- No product concepts, and everything outside the logic is passed in. The Capabilities section of AGENTS.md states the rule. In this repository it means: code and docs never name a product, its records or its words, except that the Consumers section of the README registers each consuming product and its pinned version. Storage, network fetch, model client and clock arrive as parameters. A product passes plain data in and maps the result back in a thin adapter module of its own.
- Standards over ad hoc labels. Taxonomy data files live in the repository with their source and edition, and one module owns each taxonomy.
- Every external signal reports its outcome, so a failure is never silent.
- Tests follow the Tests rule in AGENTS.md. The behavior rules above are the minimum test list.
- Releases are git tags with semantic versions and a CHANGELOG line. A product pins a tag and upgrades on purpose.
- The Docs rule in AGENTS.md applies to this repository too: a learning about the capability goes to its own docs/learnings.md, not to a consuming product's.
