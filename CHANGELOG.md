# Changelog

All notable changes to this repo are documented here. Format follows
[Keep a Changelog](https://keepachangelog.com/en/1.1.0/), versioning
follows [Semantic Versioning](https://semver.org/).

## [Unreleased]

### Added
- `approaches/design-pipeline.md`: an optional Caliper pointer in
  "Related artifacts" for regression evals when a skill adapter for
  the pipeline changes.
- `rules/rules-for-prototyping.md` rule 16: a build-versus-reuse ladder
  run before new code is written (need, existing codebase, standard
  library, native platform feature, already-installed dependency, one
  line, minimum code), with every exit stating what was skipped and
  when to revisit it. Distinct from rule 9, which governs a project's
  adopted building-block vocabulary, a closed, inventoried list; this
  rule reaches past that inventory to the standard library, native
  platform features, and dependencies never adopted into any
  inventory.
- `conventions/project-management.md`: the Goal / Initiative / Milestone /
  Deliverable / Task planning vocabulary, moved out of rule 11 of
  `rules/rules-for-prototyping.md` and extended with Goal and Task (rule
  11 previously stopped at Initiative/Milestone/Deliverable with nowhere
  to grow), using this repository's own `[1.0.0]` artifact-model
  migration as the worked example instead of an invented one.
- `routines/secret-scan.md`: a self-contained routine for finding
  secret-shaped content in a working tree at any point in a session, not
  gated on a commit ever happening. Prefers repo-guardian's `rg-scan`
  when available, falls back to a pattern grep otherwise.
- `rules/rules-for-prototyping.md` rules 14 and 15: a credential that must
  live in a plaintext file (no HTTP header to inject into) is typed by
  the human, never the agent; and removing a feature requires checking
  whether the artifact it produced (a credential file, generated output,
  a cache) is actually gone from disk, not just whether anything still
  references it.
- `findings/working-method.md`: a new entry, recording what changed
  in the issue execution loop on its third run, when the deliverable
  was a runnable tool (the JOZ-179 Repo Guardian scanner) instead
  of a convention document: verification becomes executable (re-run
  the acceptance suite, re-derive redaction proofs from evidence
  the tool did not produce), the brief needs an environment section,
  negative guarantees need both behavioral and structural
  verification, and secret-shaped test fixtures need a scripted,
  gitignored generation strategy. Status `open`; promotion decision
  deliberately deferred (do not promote off one instance).
- `conventions/pr-description.md`: the house style for pull request
  descriptions, generalized from PR #1, which was written ad hoc with
  sections What / Placement decision / Verification and passed review
  without the structure being defined anywhere. Mandatory sections are
  What (the change at the unit of decision, plus provenance the diff
  cannot show), Verification (claims backed by checks actually run,
  with real output), and Metadata (Linear ID, branch, commit range,
  diff stat, so the body stands alone outside GitHub's UI, which does
  not survive into the Linear result block or a terminal view).
  Decisions is mandatory only when the PR makes a contestable
  placement or model-level choice; a ritual empty
  section is how templates get filled with filler. The file also fixes
  the division of labor between the three records: the PR body serves
  the reviewer now, the commit message (imperative subject, rationale
  prose, `Linear:` trailer, and the GitHub noreply commit identity,
  never a personal name or email, after a real identity leaked into
  this repo's history) is the permanent record in git history,
  and the Linear issue carries the four-part agent brief plus a dated
  result block appended after the PR. Written spec-shaped, like
  `conventions/okf.md` and `conventions/release-process.md`, rather
  than standard-shaped like `conventions/repo-structure.md`: its
  deliverable is a copyable format with an explicit scope and
  exemptions, not an organizational layout, and a convention defining
  a format should carry the format as its spec.
- `.github/pull_request_template.md`: the copyable skeleton the
  convention above prescribes, at the path GitHub prefills into every
  new PR body. It is a tool-required format at a tool-required path,
  exempt from OKF frontmatter the same way `agent-config/` tool files
  are, and `conventions/pr-description.md` states that exemption
  explicitly. Guidance lives in HTML comments so the filled-in body
  stays clean; every line earns its place, since a skeleton long
  enough to be a chore gets filled with noise instead of information.
- `conventions/templates/`: a starting skeleton for each of the five
  authored artifact kinds (`rule.md`, `approach.md`, `routine.md`,
  `convention.md`, `output.md`, plus `templates/index.md`), each derived
  from the section structure the canonical example of that kind actually
  uses rather than an idealized invention, with filling-in guidance and
  links back to the examples. Placement decision: templates live under
  `conventions/`, typed `Convention`, instead of a new top-level
  `templates/` artifact kind. A template is a shared standard for how a
  file of each kind gets structured, which is exactly what a convention
  is; making it a seventh kind would have reopened the closed `type`
  list in `conventions/okf.md` (which explicitly routes non-fitting
  files to an existing directory before growing the model), forced the
  README's six-kind model to seven, and added model surface for content
  that no consumer cites or adopts the way they adopt a rule or an
  approach. No template exists for `agent-config/`, whose files carry
  their own tool's format, not an OKF skeleton.
- `approaches/review-protocol.md`: a file-based handoff protocol
  (`reviews/next-to-execute.md`, `reviews/log.md`) for a genuinely
  separate agent session to review a plan or a diff before work
  proceeds, generalized from a real multi-session deployment where it
  was exercised across four milestones with no format changes needed.
- `approaches/design-pipeline.md` gained a "Before Stage 0: raw impulse
  intake" section: classify a raw, unstructured batch of findings
  (screen fix, new surface, naming or terminology, cross-cutting
  decision, or blocked) before any of it is decomposed into Stage 0
  notes or milestone entries, so nothing is silently dropped, silently
  renamed, or silently padded with invented scope.
- `outputs/findings-log.md`: the concrete, shared file shape
  (`findings/product-use.md`, `findings/working-method.md`) that makes
  the two learning-loop approaches operational rather than only
  descriptive — append-only, entries updated in place through an explicit
  set of lifecycle statuses derived from each loop's own Method steps.
- `findings/working-method.md` and `findings/product-use.md`: this
  toolkit's own two logs, as the reference implementation. The former's
  first entry migrates the Codex `apply_patch`/bubblewrap-namespace
  finding from the workspace root's `BUGS.md` (now removed — one durable
  source of truth inside a real repository, not a loose root file).

### Changed
- `conventions/pr-description.md` and `.github/pull_request_template.md`:
  the wrap rule now distinguishes the medium each record is read in. PR
  body paragraphs are not hard-wrapped, because GitHub renders the body in
  a browser with newlines preserved, so a terminal-oriented 72-character
  wrap arrives looking chopped; commit message bodies keep the wrap,
  because they live in `git log` and on a terminal. Surfaced by
  repo-guardian PR #1, whose first body followed the old rule and read as
  "weird breaks" in the browser.
- `rules/prototyping-system.md` renamed to `rules/rules-for-prototyping.md`,
  naming the domain it actually covers (prototyping and coding) instead of
  implying `rules/` can only ever hold one file. Every in-repo and
  cross-repo reference to the old filename updated to match. Rule numbers
  did not change.
- `rules/rules-for-prototyping.md` rule 11: now a pointer to
  `conventions/project-management.md` for the Initiative/Milestone/
  Deliverable/Goal/Task definitions, following the same treatment rule 1
  already gives the design pipeline. Kept inline: the one part of the old
  rule that was an invariant rather than a definition — every milestone
  must state its own non-scope.
- `rules/index.md`, `approaches/index.md`, `routines/index.md`,
  `outputs/index.md`, and `conventions/index.md`: each gained a pointer
  to its kind's template under `conventions/templates/`, so a reader who
  lands in any catalog can find the skeleton without hunting for it.
- `approaches/working-method-learning-loop.md` and `approaches/product-
  use-learning-loop.md` each gained a concrete `Status` value list in
  their Outputs section, derived from and explicitly mapped to their
  existing Method steps and outcomes, and now point at
  `outputs/findings-log.md` for the file they produce.
- `approaches/working-method-learning-loop.md`'s Method now states the
  immediacy trigger for step 1 explicitly: record an observation as it
  happens, not at session wrap-up.
- `approaches/toolkit-intake.md`'s capture step now states where an
  unfiled impulse belongs while it waits: a dated note inside a real
  repository, never a loose file at a workspace root with no repository
  of its own.
- `rules/rules-for-prototyping.md` rule 13: an ID (milestone, deliverable,
  phase, or any other planning-unit reference) is never mentioned bare —
  its title goes with it every time, not just at first definition. Added
  after a human collaborator lost track of a fast-moving multi-agent
  handoff sequence because IDs kept appearing without their titles.

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
- `rules/rules-for-prototyping.md`: the rules-versus-patterns explanation
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
- `rules/rules-for-prototyping.md` rule 12 — before every commit, check for
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
- `rules/rules-for-prototyping.md` — general rules 2-11 for AI-supported
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
