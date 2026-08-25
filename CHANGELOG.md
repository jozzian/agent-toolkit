# Changelog

All notable changes to this repo are documented here. Format follows
[Keep a Changelog](https://keepachangelog.com/en/1.1.0/), versioning
follows [Semantic Versioning](https://semver.org/).

## [Unreleased]

### Added
- `patterns/` directory and `patterns/index.md` catalog — repeatable,
  staged processes, distinct from the invariant rules in
  `rules/prototyping-system.md`.
- `patterns/idea-to-mvp.md` — a growable phase-gate process (Idea →
  Discovery → Delivery) for taking an idea to a shippable MVP, abstracted
  from a team checklist and deliberately minimal to start.
- `patterns/multi-agent-collaboration.md` — splitting work across more
  than one AI-agent session without them silently working from different
  facts, generalized from a real multi-repo build.
- `patterns/papercuts.md` — capturing small usage friction found only by
  actually using the built thing, without losing it or letting it
  derail planned work.

### Changed
- `skills/design-pipeline/SKILL.md`'s content moved to
  `patterns/design-pipeline.md`; the skill file is now a thin pointer to
  it (rule 4: single source of truth per fact).
- `rules/prototyping-system.md` rule 1 now states a pointer to
  `patterns/design-pipeline.md` rather than the content itself. Rule 10's
  heading changed from "Patterns worth watching" to "Practices worth
  watching" to stop colliding with the new, more specific meaning
  "pattern" gets from this split. Rule numbers unchanged.
- `README.md` restructured around the rules-vs-patterns split, with an
  updated repo map and usage steps.
- `claude-config/` moved to `agent-config/claude/`, and the skill wrapper
  moved with it to `agent-config/claude/skills/design-pipeline/SKILL.md`
  — everything Claude-Code-specific now lives under one tool-named
  folder, leaving room for `agent-config/codex/` or
  `agent-config/opencode/` alongside it without the top level implying
  Claude is the only supported agent.

## [0.3.0] - 2026-08-19

### Added
- `rules/prototyping-system.md` rule 12 — before every commit, check for
  secrets/credentials, files that don't belong in version control, and
  leftover debug/scratch files; ask before committing rather than
  guessing whether to include or drop something found.

## [0.2.0] - 2026-08-19

### Added
- `conventions/okf.md` — Open Knowledge Format documentation convention
  (frontmatter spec, linking strategy, file naming, quality checklist),
  extracted from a prior product's documentation guidelines and
  generalized. Missed in the initial 0.1.0 import — flagged by review.

## [0.1.0] - 2026-08-19

### Added
- `rules/prototyping-system.md` — general rules 2-11 for AI-supported
  prototyping and coding, extracted from a prior product's process notes
  and generalized (product-specific incident detail left behind in that
  product's own repo).
- `skills/design-pipeline/SKILL.md` — staged design-artifact pipeline
  (Stage 0 initiative framing through Hi-fi v2 and ongoing iteration),
  reconstructed from a prior product's actual folder layout and
  documentation rules after the original skill file was found missing.
- `conventions/repo-structure.md` — multi-repo workspace convention
  (docs / design system / app(s) / backend(s), flat, one role per repo).
- `conventions/release-process.md` — VERSION + CHANGELOG + SemVer tag
  convention and the release-cutting sequence, adopted by this repo
  starting with this release.
- `claude-config/` — Claude Code `SessionStart` hook implementing the
  session-boundary state check (rule 3), auto-discovering sibling repos
  instead of a hardcoded list.

[Unreleased]: https://github.com/jozzian/agent-toolkit/compare/v0.3.0...HEAD
[0.3.0]: https://github.com/jozzian/agent-toolkit/compare/v0.2.0...v0.3.0
[0.2.0]: https://github.com/jozzian/agent-toolkit/compare/v0.1.0...v0.2.0
[0.1.0]: https://github.com/jozzian/agent-toolkit/releases/tag/v0.1.0
