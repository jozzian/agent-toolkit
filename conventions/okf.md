---
type: Convention
title: Open Knowledge Format (OKF)
description: Documentation convention for this toolkit's artifacts — plain Markdown, YAML frontmatter, one concept per file, no special tooling required.
timestamp: 2026-08-26
---

# Open Knowledge Format (OKF)

A convention for writing documentation that stays readable, linkable, and
diffable without special tooling. Three principles:

- **Just Markdown.** Readable in any editor, renders on GitHub, needs no
  special viewer.
- **Just Files.** Lives in version control. Each concept is one file. The
  file path is the concept's identity, not a database record or a separate
  CMS entry.
- **Just YAML Frontmatter.** Structured metadata at the top of the file; the
  body is free-form Markdown underneath it.

## Which files this applies to

OKF frontmatter applies to canonical artifacts: files under `rules/`,
`approaches/`, `routines/`, `conventions/`, `outputs/`, and `agent-config/`
(including its per-tool subdirectories), plus a top-level implementation
plan if one exists in the public tree.

It does not apply to:

- `README.md` and `CHANGELOG.md`. Both are root operational files governed
  by their own established conventions (a project README; Keep a Changelog
  for `CHANGELOG.md`, see `release-process.md`) rather than by OKF.
- `VERSION` and other non-Markdown files.
- A tool's own required file format inside `agent-config/`, such as a
  Claude Code `SKILL.md` or a `settings.json`. These carry whatever
  frontmatter or shape that tool demands, not an OKF block. Where a skill
  file also states OKF-relevant facts (what it points to, why it exists),
  that content is still expected to be accurate; only the frontmatter
  format itself is exempt.

## Metadata types

The `type` field identifies which kind of artifact a file is. Values are
capitalized exactly as listed:

| Type | Used for |
|---|---|
| `Rule` | A stable, numbered invariant in `rules/`. |
| `Approach` | A reusable way of working in `approaches/`. |
| `Routine` | A self-contained, task-specific instruction set in `routines/`. |
| `Convention` | A shared standard in `conventions/`. |
| `Output` | A required shape for a recurring deliverable in `outputs/`. |
| `Index` | A catalog file (`index.md`) for any of the directories above. |
| `Plan` | An implementation plan, if one remains in the public tree. |

Do not use a value outside this list. If a file does not fit one of these
types, it belongs in a different directory, or the artifact model itself
needs revisiting before the file is written.

## Frontmatter spec

Required on every file this convention applies to:

```yaml
---
type: Rule | Approach | Routine | Convention | Output | Index | Plan
title: [Short, descriptive title]
description: [One sentence summary]
timestamp: [ISO 8601 date, the date of the last material edit]
---
```

Optional: `tags` (array of relevant tags), `status` (adoption or maturity
note), `resource` (path to a source file this doc describes, if
applicable).

This field spec is defined once, here. A project adopting OKF should
reference this file rather than restating the field list in its own
guidelines.

## Indexes

Every directory listed under "Which files this applies to" that catalogs
more than one canonical artifact requires an `index.md`, typed `Index`,
naming and briefly describing each artifact inside it.

An implementation-only path dictated by a tool's own layout, such as
`agent-config/claude/skills/<name>/`, does not need its own index. Its
only content is the single file the tool requires at that exact path, and
a one-entry index adds a lookup step without adding information. The
directory one level up, `agent-config/claude/`, still gets an index, since
it can catalog more than one adapter.

## Body structure

- Start with an H1 title matching the frontmatter `title`.
- Use H2 for major sections, H3 for subsections.
- Use code blocks for examples, tables for structured data.

## One concept per file

Each file covers one concept: one rule's number, one approach, one
routine, one convention, one output. Use `index.md` files to catalog
related concepts rather than combining several into one file.

## Linking strategy

- **Same repo:** relative paths, for example
  `[Design Pipeline](../approaches/design-pipeline.md)`.
- **Cross-repo**, in a multi-repo workspace (see `repo-structure.md`):
  descriptive text, not a relative path that breaks the moment either repo
  moves, for example "the ProcedureSelector component (see the
  design-system repo's own documentation)," not a relative link that
  reaches across repos.
- **External resources:** full URLs.

## File naming

- kebab-case: `design-pipeline.md`.
- The file name matches the concept it documents.
- Plural directory names for catalogs: `rules/`, `approaches/`,
  `routines/`, `conventions/`, `outputs/`.
- `index.md` for every catalog directory, per the indexing rule above.

## Quality checklist

Before publishing a file this convention applies to:

- [ ] Required frontmatter fields present, with a valid `type`.
- [ ] The file covers exactly one concept.
- [ ] Links use the right strategy for same-repo versus cross-repo.
- [ ] No claim in the file contradicts the thing it documents. If unsure,
      check the actual behavior before writing the claim, not after.
- [ ] The timestamp reflects the last material edit, not a copy-pasted
      date from another file.

## Maintaining

Update the timestamp when making a material change, not on a typo fix.
Review a file alongside the change it describes, not on a separate
schedule. A file reviewed only "sometimes later" is how documentation
drifts from what is actually true (see `rules/prototyping-system.md` on
the doc-versus-app drift this convention exists partly to prevent).
