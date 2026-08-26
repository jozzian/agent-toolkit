---
type: Index
title: Agent Configuration
description: Optional, tool-specific discovery, automation, and enforcement for this toolkit's canonical artifacts.
timestamp: 2026-08-26
---

# Agent Configuration

Agent configuration is optional, tool-specific wiring: a hook, a skill
file, a settings block, anything a particular local coding agent needs to
discover or enforce a canonical artifact automatically. It is kept
separate from the canonical artifacts themselves for one reason: it
points to them, it does not redefine them. A canonical instruction must
never exist only inside `agent-config/`; if it does, the tool-specific
file has become the source of truth by accident, and the fact needs to
move back to its proper artifact type with `agent-config/` reduced to a
pointer again.

The absence of an adapter for a given tool does not prevent a human or an
AI from reading or using the canonical Markdown artifacts directly. Every
artifact under `rules/`, `approaches/`, `routines/`, `conventions/`, and
`outputs/` is ordinary Markdown, readable and usable with no tooling at
all.

| Adapter | Status |
|---|---|
| [Claude](claude/index.md) | Implemented. `settings.json` plus a session-start hook, and a `design-pipeline` skill wrapper. |

A Codex or an OpenCode integration gets its own sibling directory,
`agent-config/codex/` or `agent-config/opencode/`, only once there is a
concrete, verified mechanism to add, not as a speculative placeholder
ahead of one existing.
