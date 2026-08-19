# agent-toolkit

A transferable, product-agnostic process layer for AI-supported
prototyping and coding — the rules, conventions, and Claude Code wiring
that shouldn't be reinvented (or silently drift) per project. Explicit
files under version control, not stashed in an assistant's memory.

This repo contains **process**, not any specific product's content. If a
rule only makes sense with one product's names, repo layout, or incidents
attached, it doesn't belong here — it belongs in that product's own docs.

## What's in here

- `rules/prototyping-system.md` — the general rules for working with an
  AI coding agent across a session and across a project's lifetime
  (when to propose vs. execute, single source of truth, how work is
  scoped as initiatives/milestones/deliverables, and more).
- `skills/design-pipeline/SKILL.md` — a Claude Code skill: the staged
  process for taking a new screen or flow from initiative framing through
  two hi-fi rounds to ongoing iteration.
- `conventions/repo-structure.md` — how to split a product into several
  small, independently-replaceable repos (docs / design system / app(s) /
  backend(s)) instead of one repo or an unstructured monorepo.
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
4. Install `skills/design-pipeline/` wherever your Claude Code setup looks
   for project or user skills, if you want the staged design process.

## Updating

This repo evolves independently of any one product. Pull it for updates;
if you're proposing a rule change, edit and commit here directly rather
than in a product session, then pull the update into consuming projects.
Rule numbers in `prototyping-system.md` are stable and may be cited by
number from consuming projects — a citing project should note which
`agent-toolkit` version (`VERSION` / git tag) it was written against, since
rule *numbers* don't shift but rule *content* can evolve. See
`CHANGELOG.md` for what changed between versions.
