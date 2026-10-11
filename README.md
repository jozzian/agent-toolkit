# agent-toolkit

The working method for one person and their AI agents, plus the few
supporting files the method still needs. It holds process, not any
product's content. If something only makes sense with one product's
names, repository layout, or incidents attached, it belongs in that
product's own docs, not here.

## Layout

- **AGENTS.md**: the canonical method. One file, read in full by agents
  at the start of every session. It carries the principle, the four-phase
  path (Frame / Design / Build / Learn), the task brief template, the
  reuse ladder, the review and commit rules, and the inventory model.
- **README.md**: this file, for humans.
- **CHANGELOG.md**: what changed and why. The Learn loop in AGENTS.md
  lands lessons here before they are promoted into the method.
- **conventions/okf.md**: how docs are written and filed, here and in
  every product and capability repo.
- **conventions/capability.md**: the shape of a repository that holds a
  capability shared by several products.
- **conventions/pr-description.md**: the house style for pull request
  descriptions, commit messages, and Linear result blocks. AGENTS.md
  states the rule; this file carries the copyable format.
- **.github/pull_request_template.md**: the PR skeleton GitHub prefills,
  matching the convention above.
- **routines/**: self-contained instruction sets that can be pasted into
  any chat with no access to this repository. `sharpen.md` (prose
  editing), `secret-scan.md` (finding secrets in a working tree),
  `write-handover.md` (session-end handover block),
  `tone-analytical-essayist.md` (a personal publishing voice).
- **agent-config/**: optional, tool-specific wiring that points at the
  canonical files and never redefines them. Claude is the one
  implemented adapter; a new tool gets a sibling directory only once
  there is a working, verified integration.

## Setting this up in a new project

1. Copy `AGENTS.md` into the product repository. Agents read it there.
   Make its first line `Copied from agent-toolkit at <commit>, <date>.`
2. Check out this repository beside the product repository, so agents
   can read the conventions AGENTS.md names.
3. Add a `PROJECT.md` beside it, using the Frame, planning, and
   inventory sections of AGENTS.md as the shape.
4. Adopt `conventions/pr-description.md` and the PR template if the
   project opens pull requests.
5. Paste routines into a chat when needed; nothing in `routines/`
   self-activates.

## Capabilities

Shared logic used by several products, one repository each. See the
Capabilities section of AGENTS.md.

| Capability | Repository | Status |
|---|---|---|
| Organisation intake and taxonomy enrichment | not created yet | proposed, extracted from CareerOS |

## Updating

The method evolves in AGENTS.md. A lesson about how we work changes the
rule there, with a line in CHANGELOG.md saying why. Promote a lesson
only if it happened twice or cost a lot. This repository is the home of
the method; product-specific findings live in the product's own repo.
