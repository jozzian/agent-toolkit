---
title: Open Knowledge Format (OKF)
description: Documentation format convention — plain markdown, YAML frontmatter, one concept per file, no special tooling required.
---

# Open Knowledge Format (OKF)

A convention for writing documentation that stays readable, linkable, and
diffable without any special tooling — three principles:

- **Just Markdown.** Readable in any editor, renders on GitHub, needs no
  special viewer.
- **Just Files.** Lives in version control. Each concept is one file. The
  file path *is* the concept's identity — no database, no separate CMS.
- **Just YAML Frontmatter.** Structured metadata at the top of the file;
  the body is free-form markdown underneath it.

## Frontmatter spec

Required on every doc:

```yaml
---
type: Component | Flow | Screen | Convention | Guideline | Index
title: [Short, descriptive title]
description: [One sentence summary]
timestamp: [ISO 8601 timestamp]
---
```

Optional: `resource` (path to a source file this doc describes, if
applicable), `tags` (array of relevant tags).

This field spec is defined once, here — a project adopting OKF should
reference this file rather than restating the field list in its own
guidelines (single source of truth per fact).

## Body structure

- Start with an H1 title matching the frontmatter `title`
- H2 for major sections, H3 for subsections
- Code blocks for examples, tables for structured data

## One concept per file

Each file covers one concept — one flow, one screen, one component, one
convention. Use `index.md` files to catalog related concepts rather than
combining multiple concepts into one file.

## Linking strategy

- **Same repo:** relative paths — `[ProcedureSelector](../components/procedure-selector.md)`
- **Cross-repo (in a multi-repo workspace, see `repo-structure.md`):**
  descriptive text, not a relative path that would break the moment either
  repo moves — `ProcedureSelector (see the ProcedureSelector component
  documentation in the design-system repo)`, not
  `[ProcedureSelector](../../other-repo/docs/components/procedure-selector.md)`
- **External resources:** full URLs

## File naming

- kebab-case: `procedure-selector.md`
- File name matches the concept it documents where one exists (a
  component named `ProcedureSelector` → `procedure-selector.md`)
- Plural directory names for catalogs: `components/`, `flows/`,
  `conventions/`
- `index.md` for every catalog directory

## Quality checklist

Before publishing a doc:
- [ ] Required frontmatter fields present
- [ ] File covers exactly one concept
- [ ] Links use the right strategy for same-repo vs. cross-repo
- [ ] No claim in the file contradicts the thing it documents — if
      unsure, check the actual code/behavior before writing the doc, not
      after
- [ ] Timestamp is current as of the last real edit, not copy-pasted from
      another file

## Maintaining

Update the timestamp when making a real change (not on typo fixes).
Review docs alongside the code change they describe, not on a separate
schedule — a doc reviewed only "sometimes later" is exactly how it drifts
from what's actually true (see `prototyping-system.md`'s root-cause
discussion of doc/app drift).
