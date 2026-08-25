---
name: design-pipeline
description: Fixed, ordered set of design-artifact stages for building a new screen or flow — from initiative framing through two hi-fi rounds to ongoing iteration.
---

# Design Pipeline

This is Claude Code's discovery wrapper for the `design-pipeline`
pattern. The actual process — Stage 0 problem framing through Flows,
Screens, Wireframes, and two hi-fi rounds — is defined once, at
`patterns/design-pipeline.md` in this toolkit, not here (rule 4 of
`rules/prototyping-system.md`: single source of truth per fact). Read
that file for the stage sequence itself; this wrapper exists only
because Claude Code's skill system looks for a file at exactly this
path (`agent-config/claude/skills/<name>/SKILL.md`) and wouldn't
otherwise discover the pattern at all.

Other agent tooling (Codex, OpenCode, or anything else) should read
`patterns/design-pipeline.md` directly. If a tool needs its own
discovery mechanism the way Claude Code does, give it its own thin
wrapper under a sibling `agent-config/<tool>/` folder rather than
extending this one.
