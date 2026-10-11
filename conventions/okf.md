---
type: Convention
title: Open Knowledge Format (OKF)
description: How docs are written and filed in the toolkit and in every product and capability repo. Plain Markdown, YAML frontmatter, one concept per file.
timestamp: 2026-10-11
---

# Open Knowledge Format (OKF)

Docs stay readable, linkable and diffable without special tools. Each doc is a Markdown file in version control, with a short YAML block on top and free Markdown below. The file path is the concept's identity.

## Which files

OKF applies to every Markdown doc in a repo, with these exceptions. Root files with their own shape: README.md, CHANGELOG.md, AGENTS.md, PROJECT.md. Files whose shape a tool dictates, such as a SKILL.md, a settings file or a PR template.

## Frontmatter

```yaml
---
type: one value from the list below
title: Short title, matching the H1
description: One sentence saying what the doc is for
timestamp: YYYY-MM-DD of the last material edit
status: optional. proposed, approved YYYY-MM-DD, or superseded by <path>
---
```

## Types

| Type | Used for | Where |
|---|---|---|
| Convention | A shared standard | toolkit conventions/ |
| Routine | A self-contained instruction set | toolkit routines/ |
| Flow | One user journey: entry, happy path, error paths, exit | docs/flows/ |
| Surface | One surface, in the shape AGENTS.md gives | docs/surfaces/ |
| Decision | One expensive decision, its options and the choice | docs/decisions/ |
| Design system | The adopted design system and its components | docs/design-system.md |
| Learning | Dated surprises worth carrying forward | docs/learnings.md |
| Index | A catalog of a directory | index.md |

Do not use a value outside this list. A doc that fits none of them is either in the wrong place or should not exist. Changing the list is a toolkit change.

## Rules

- One concept per file. Name it in kebab-case after the concept, never after a ticket, milestone, batch or date. "jobs.md", not "m0-jobs-board-sketch.md". Tickets are linked from the doc, not encoded in its name.
- A directory with more than five docs gets an index.md that names each one in a line.
- Links: relative paths inside a repo, the repository name and doc title across repos, full URLs for external pages.
- Material that must not be committed: scratch files, session logs, build notes, review prompts, agent plans and handovers. Add their patterns to .gitignore. Anything an approval depends on, such as a mockup, is committed beside the doc that records the approval, never left in /tmp.

## Checklist

- [ ] Frontmatter present with a valid type.
- [ ] The file covers one concept and is named after it.
- [ ] No claim contradicts the thing it describes. Check the code or the running app before writing the claim.
- [ ] The timestamp reflects the last material edit.
