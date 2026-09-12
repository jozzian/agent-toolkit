---
type: Convention
title: Convention Template
description: Starting skeleton for a convention file, derived from conventions/repo-structure.md and conventions/okf.md.
timestamp: 2026-09-11
tags: [template, conventions]
---

# Convention Template

A convention is a shared standard for structuring, naming, documenting,
or releasing work, applied consistently rather than decided fresh each
time. This skeleton is derived from
[conventions/repo-structure.md](../../conventions/repo-structure.md),
with
[conventions/okf.md](../../conventions/okf.md) as the example of the
spec-shaped variant: a convention that defines a format rather than a
layout carries its spec, its scope ("which files this applies to"), and
its quality checklist in place of the sections below.

A convention states the standard once, here, and consumers reference
this file rather than restating it (rule 4 of
`rules/prototyping-system.md`: single source of truth per fact).

## Template

```markdown
---
type: Convention
title: <Name of the standard>
description: <One sentence: what the convention governs, and the shape of what it prescribes.>
timestamp: <YYYY-MM-DD, the date of the last material edit>
---

# <Name of the standard>

<One or two sentences: what this is a convention for, and the choice it
makes against the obvious alternatives.>

## The convention

<The standard itself, as a list of bolded prescriptions, each one to
three sentences. Every item is a decision someone would otherwise make
fresh each time; state the decision, not the deliberation.>

## Why this, not the alternatives

<The reasoning that earns each significant boundary in the convention:
why this granularity, this split, this name shape, rather than the
plausible alternative. This section is what lets a future reader revise
the convention deliberately instead of drifting from it.>

## Applying this

<Numbered steps for adopting the convention in a new project or file,
including what the adopting project records for itself and what stays
here as the single source of truth.>
```

## Filling it in

- **One standard per file.** If a file would carry two standards with
  different scopes, it is two convention files.
- **State facts here, instances there.** The convention states the
  standard; each adopting project states its own inventory, paths, or
  exceptions in its own docs, per the "Applying this" section's
  boundary.
- **The why section is not optional in spirit.** A convention with no
  recorded rationale gets silently abandoned the first time it is
  inconvenient. Where a boundary was decided deliberately, say what
  decided it.
- **Spec-shaped conventions** (a format, a frontmatter spec, a release
  sequence) replace "The convention" with the spec itself in a fenced
  code block, add an explicit scope section naming what the spec
  applies to and what is exempt, and end with a quality checklist. See
  [conventions/okf.md](../../conventions/okf.md) and
  [conventions/release-process.md](../../conventions/release-process.md).
- **Register the new file** in the
  [conventions/index.md](../../conventions/index.md) catalog table in
  the same change, and add a `CHANGELOG.md` entry.
- Follow the house prose style (see
  [routines/sharpen.md](../../routines/sharpen.md)): lead with the
  point, no contractions, no em dashes, no filler.
