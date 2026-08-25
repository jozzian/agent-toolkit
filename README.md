# agent-toolkit

A transferable, product-agnostic process layer for AI-supported
prototyping and coding — the rules, patterns, and conventions that
shouldn't be reinvented (or silently drift) per project. Explicit files
under version control, not stashed in an assistant's memory.

This repo contains **process**, not any specific product's content. If
something only makes sense with one product's names, repo layout, or
incidents attached, it doesn't belong here — it belongs in that product's
own docs.

## Rules vs. patterns

Two different kinds of process live here, deliberately kept apart:

- **Rules** (`rules/prototyping-system.md`) are invariants — true
  regardless of what stage a project is in or what's being built. "Check
  current state against last known state before assuming they match" is a
  rule: it has no steps, it's just always true.
- **Patterns** (`patterns/`) are staged procedures — a fixed sequence of
  steps to go through, that recurs every time a certain kind of work comes
  up. "Take a screen from idea to shipped" is a pattern: it has an order,
  and the agent's job is to recognize when one applies and walk through
  it.

Rules are cited by number and don't get renumbered once adopted (see
`rules/prototyping-system.md`'s own header — a rule can still become a
pointer to a pattern without losing its number, which is what happened to
rule 1). Patterns are cataloged in `patterns/index.md` and are expected to
be fed and refined over time rather than written complete on day one.

## What's in here

- `rules/prototyping-system.md` — the invariant rules for working with an
  AI coding agent across a session and across a project's lifetime (when
  to propose vs. execute, single source of truth, how work is scoped as
  initiatives/milestones/deliverables, and more).
- `patterns/` — staged, repeatable processes. See `patterns/index.md` for
  the catalog: taking a screen from idea through hi-fi design
  (`design-pipeline.md`), taking an idea through discovery to a shippable
  MVP (`idea-to-mvp.md`), splitting work across more than one agent
  session (`multi-agent-collaboration.md`), and capturing small usage
  friction without losing it (`papercuts.md`).
- `skills/design-pipeline/SKILL.md` — a thin Claude Code skill wrapper
  that points at `patterns/design-pipeline.md` rather than duplicating
  it, so Claude Code can discover the pattern as a skill.
- `conventions/repo-structure.md` — how to split a product into several
  small, independently-replaceable repos (docs / design system / app(s) /
  backend(s)) instead of one repo or an unstructured monorepo — the
  boundary `patterns/multi-agent-collaboration.md` assumes already exists.
- `conventions/okf.md` — Open Knowledge Format: the documentation
  convention (frontmatter spec, linking rules, file naming, quality
  checklist) used across a project's docs, including this repo's own.
- `conventions/release-process.md` — the VERSION + CHANGELOG + SemVer tag
  convention this repo itself uses (see `VERSION` / `CHANGELOG.md`).
- `claude-config/` — a working `settings.json` + hook script that
  implements the session-boundary state check (`rules/prototyping-system.md`
  rule 3) by auto-discovering sibling git repos in the workspace.

## Using this in a new project

1. Clone this repo as a sibling of your product repos, e.g.
   `<workspace>/agent-toolkit` next to `<workspace>/my-product-app`.
2. Copy `claude-config/settings.json` and
   `claude-config/session-start-repo-check.sh` into your workspace's own
   `.claude/` folder (workspace root, not inside any one product repo) —
   the hook auto-discovers whatever git repos sit alongside it, no
   per-project repo list to maintain.
3. Point your workspace or product `AGENTS.md`/`CLAUDE.md` at
   `agent-toolkit/rules/prototyping-system.md` instead of restating its
   rules — reference it, don't copy it (rule 4: single source of truth).
4. Skim `patterns/index.md` and adopt whichever patterns actually apply —
   not all of them will, on day one. `design-pipeline` is also installable
   as a Claude Code skill directly (`skills/design-pipeline/`) wherever
   your setup looks for project or user skills.

## Updating

This repo evolves independently of any one product. Pull it for updates;
if you're proposing a change, edit and commit here directly rather than
in a product session, then pull the update into consuming projects. Rule
numbers in `prototyping-system.md` are stable and may be cited by number
from consuming projects — a citing project should note which
`agent-toolkit` version (`VERSION` / git tag) it was written against, since
rule *numbers* don't shift but rule *content* can evolve. Patterns carry
no such numbering contract and can be revised more freely. See
`CHANGELOG.md` for what changed between versions.
