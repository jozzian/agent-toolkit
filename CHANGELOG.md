# Changelog

All notable changes to this repo are documented here. Format follows
[Keep a Changelog](https://keepachangelog.com/en/1.1.0/), versioning
follows [Semantic Versioning](https://semver.org/).

## [Unreleased]

## [1.0.0] - 2026-08-26

### Added
- An explicit artifact model with six kinds: rules, approaches, routines,
  conventions, outputs, and agent configuration. `README.md` states the
  model; each kind has its own catalog under `rules/index.md`,
  `approaches/index.md`, `routines/index.md`, `conventions/index.md`,
  `outputs/index.md`, and `agent-config/index.md`.
- `approaches/product-use-learning-loop.md`, replacing the earlier
  Papercuts pattern: exercise the product, capture friction as it is
  found, triage each finding into an immediate fix, planned work, an
  explicit deferral, or an accepted gap, apply the response, then revisit
  the affected experience to check whether it helped.
- `approaches/working-method-learning-loop.md`: a conservative loop for
  observing, recording, and promoting a lesson about how work itself gets
  planned, prompted, built, reviewed, handed off, coordinated, or
  documented, kept distinct from product-use friction.
- `approaches/toolkit-intake.md`: the general front door for a new
  impulse about the toolkit itself, capturing it verbatim before it is
  reshaped and routing it to the correct artifact or to one of the two
  learning loops above.
- `routines/sharpen.md`: a self-contained, tool-neutral editing routine,
  portable enough to paste into an AI chat with no access to this
  repository. `routines/index.md` catalogs it.
- `outputs/artifact-adoption-ledger.md`: a specification and template for
  a project-local, optionally tracked Markdown file recording which
  toolkit artifacts a project has adopted, adapted, found not
  applicable, or flagged for review, with totals derived from its own
  entries.
- `agent-config/index.md` and `agent-config/claude/index.md`, documenting
  agent configuration as optional and tool-specific, Claude as the one
  currently implemented adapter, and the concrete condition for adding a
  Codex or OpenCode sibling.

### Changed
- `patterns/` renamed to `approaches/`, since the kind now covers
  coordination methods and continuous practices, not only staged
  sequences. Every internal path, link, and description updated to
  match.
- `conventions/okf.md` corrected to match this repository's actual
  artifacts: a closed list of `type` values (`Rule`, `Approach`,
  `Routine`, `Convention`, `Output`, `Index`, `Plan`), an explicit
  exemption for `README.md` and `CHANGELOG.md`, and an explicit rule for
  which directories require an `index.md`. Every in-scope Markdown file
  in the repository brought into compliance with the corrected
  convention.
- `rules/prototyping-system.md`: the rules-versus-patterns explanation
  replaced with the artifact model and a link to `rules/index.md`. Rule 1
  now points to `approaches/design-pipeline.md`. Rule 3 reworded to state
  the session-boundary check as tool-independent, with the Claude Code
  hook named as one implementation rather than the rule's substance.
  Rule 8 reworded so it no longer claims one filename is universal across
  every local agent and AI chat, while keeping its single-canonical-file
  intent. No rule number changed.
- `README.md` restructured around the six-kind artifact model, the three
  ways this toolkit gets used, and setup guidance that does not assume
  Claude Code.
- `claude-config/` moved to `agent-config/claude/` in a prior pass; this
  change adds its index and updates the `design-pipeline` skill wrapper
  to point at `approaches/design-pipeline.md`.

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

[Unreleased]: https://github.com/jozzian/agent-toolkit/compare/v1.0.0...HEAD
[1.0.0]: https://github.com/jozzian/agent-toolkit/compare/v0.3.0...v1.0.0
[0.3.0]: https://github.com/jozzian/agent-toolkit/compare/v0.2.0...v0.3.0
[0.2.0]: https://github.com/jozzian/agent-toolkit/compare/v0.1.0...v0.2.0
[0.1.0]: https://github.com/jozzian/agent-toolkit/releases/tag/v0.1.0
