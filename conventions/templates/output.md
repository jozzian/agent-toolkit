---
type: Convention
title: Output Template
description: Starting skeleton for an output specification file, derived from outputs/findings-log.md and outputs/artifact-adoption-ledger.md.
timestamp: 2026-09-11
tags: [template, outputs]
---

# Output Template

An output specifies the required structure and format of a recurring
deliverable. It states the shape only; this toolkit does not generate
the deliverables, and each consuming project owns its own generated
files. This skeleton is derived from
[outputs/findings-log.md](../../outputs/findings-log.md) and
[outputs/artifact-adoption-ledger.md](../../outputs/artifact-adoption-ledger.md).

The two canonical examples differ in one instructive way: the findings
log specifies a shape whose lifecycle details (status values,
classification) are owned by the approaches that produce it, while the
adoption ledger specifies every field itself. Pick deliberately which
facts this specification owns and which the producing approach owns,
and point at the owner rather than restating (rule 4 of
`rules/prototyping-system.md`: single source of truth per fact).

## Template

```markdown
---
type: Output
title: <Name of the deliverable>
description: <One sentence: the required shape, and which approach or practice produces the file.>
timestamp: <YYYY-MM-DD, the date of the last material edit>
---

# <Name of the deliverable>

<One paragraph: the concrete file this specification covers, which
approaches or practices produce it, and what this file specifies versus
what the producing approach's own file specifies.>

## Where it lives

<The path or paths of the generated file, relative to the adopting
project or workspace, and the rule for choosing between candidates when
more than one location is plausible.>

## <Mechanics heading, named for what the shape requires>

<The load-bearing rules of the file's upkeep: append-only versus
overwrite, entries updated in place versus replaced, which counts are
derived from which entries. One heading per distinct mechanic where
there is more than one.>

## Required fields

<Each field an entry or the file itself must carry, as a bolded list,
with one line saying what goes in it. Omit this section where the
template block below makes every field self-evident.>

## Template

<A fenced code block holding the literal skeleton of the generated
file, with placeholder text in angle brackets where the producer fills
in, and short guidance inside the placeholders where a choice exists.>

## Closure

<How a reader tells a settled entry or file from an open one, and where
that state is recorded. Where closure is defined by the producing
approach's own Method, point at it rather than redefining it.>

## Related artifacts

<Repo-relative paths to the approaches that produce this file, each
with one line saying how.>
```

## Filling it in

- **The Template block is the point of the file.** Everything else
  exists to make that block usable by a producer who has read nothing
  else. Keep placeholders self-explanatory.
- **Sections are used only where they add information**, the same rule
  the approaches follow: `findings-log.md` has no "Required fields"
  section because its entry template carries the fields; the adoption
  ledger has no "Closure" section because its lifecycle is a review
  date plus derived totals.
- **Derived counts stay derived.** Where the shape includes totals,
  say they are recomputed from the entries every review, never
  maintained as an independent fact.
- **Register the new file** in the
  [outputs/index.md](../../outputs/index.md) catalog table in the same
  change, and add a `CHANGELOG.md` entry.
- Follow the house prose style (see
  [routines/sharpen.md](../../routines/sharpen.md)): lead with the
  point, no contractions, no em dashes, no filler.
