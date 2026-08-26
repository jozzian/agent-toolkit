# agent-toolkit

A transferable, product-agnostic working approach for a human working
with AI, and a process layer for AI-supported prototyping and coding. It
holds structures, guides, and processes that should not be reinvented or
allowed to drift silently from project to project. They live in explicit
files under version control, not in an assistant's memory.

This repository contains process, not any specific product's content. If
something only makes sense with one product's names, repository layout,
or incidents attached, it belongs in that product's own docs, not here.

## Artifacts

Six kinds of artifact live here, each with its own catalog:

- **[Rules](rules/index.md)**: stable, numbered invariants that govern
  work regardless of stage or task.
- **[Approaches](approaches/index.md)**: reusable ways of working that a
  human and an AI apply together. An approach may be a lifecycle, a
  staged workflow, a continuous practice, or a coordination method; it
  does not need to be a fixed sequence.
- **[Routines](routines/index.md)**: self-contained, task-specific
  instruction sets that can be invoked in a local agent or pasted into an
  AI chat.
- **[Conventions](conventions/index.md)**: shared standards for
  structuring, naming, documenting, or releasing work.
- **[Outputs](outputs/index.md)**: required structure and format for
  recurring deliverables, with a template where one adds practical value.
- **[Agent configuration](agent-config/index.md)**: optional,
  tool-specific discovery, automation, and enforcement. It points to
  canonical artifacts; it does not redefine them.

Each catalog's own index explains its artifacts in more depth than this
overview does; this file states the model, not the governance detail
behind each type.

## Three ways this gets used

- **A human reads a file directly.** Every canonical artifact is plain
  Markdown, readable in any editor with no tooling.
- **A local coding agent reads or is pointed at a file.** Where the
  agent's own project can reference this repository, point it there
  instead of copying content into the project (rule 4 of
  `rules/prototyping-system.md`: single source of truth per fact).
- **An AI chat session uses an artifact with no access to this
  repository.** A self-contained routine (see `routines/index.md`) can be
  pasted directly into the chat. This is why routines carry everything
  they need in one file rather than linking out to the rest of the
  toolkit.

## Tool-neutral by default

Canonical content is ordinary, tool-neutral Markdown under `rules/`,
`approaches/`, `routines/`, `conventions/`, and `outputs/`. Any tool, or a
human with no tool at all, can read it directly.

`agent-config/` holds optional adapters that make a canonical artifact
easier to discover or enforce inside one specific tool. Claude is the one
currently implemented example, under `agent-config/claude/`, not this
repository's default identity. A Codex, OpenCode, or any other adapter
gets its own sibling directory once there is a working, verified
integration to add, not ahead of one existing.

## Setting this up in a new project

1. Clone this repository as a sibling of your product repositories, for
   example `<workspace>/agent-toolkit` next to
   `<workspace>/my-product-app`.
2. Point your workspace or product's own agent-facing instruction file
   (see rule 8 of `rules/prototyping-system.md`) at
   `agent-toolkit/rules/prototyping-system.md` instead of restating its
   rules. Reference it; do not copy it.
3. Skim `approaches/index.md`, `conventions/index.md`, and
   `outputs/index.md`, and adopt whichever artifacts actually apply. Not
   all of them will, on day one; see `outputs/artifact-adoption-ledger.md`
   for a way to track which ones your project has adopted.
4. If a routine such as `routines/sharpen.md` should run by default in
   your project, say so in your project's own agent configuration; the
   routine itself does not make that automatic.

Using Claude Code specifically: `agent-config/claude/index.md` documents
the implemented adapter, including the settings and hook that enforce
rule 3 automatically and the `design-pipeline` skill wrapper. Using a
different tool: there is nothing tool-specific to install yet beyond the
plain Markdown artifacts above, which any tool can read directly; see
`agent-config/index.md` for how a new adapter gets added.

## Updating

This repository evolves independently of any one product. Pull it for
updates. If you are proposing a change, edit and commit here directly
rather than in a product session, then pull the update into consuming
projects.

Rule numbers in `rules/prototyping-system.md` are stable and may be cited
by number from consuming projects; a citing project should note which
`agent-toolkit` version (`VERSION` or git tag) it was written against,
since rule numbers do not shift but rule content can evolve. Other
artifact types carry no such numbering contract and can be revised more
freely. See `CHANGELOG.md` for what changed between versions, and
`conventions/release-process.md` for how a release is cut.
