---
name: analytical-essayist-tone
description: Apply this tone whenever writing essays, explainers, LinkedIn/Medium-style articles, or analytical think-pieces that examine a concept, compare systems (countries, regulations, technologies), or question the use of a popular term. Use this skill whenever the user asks to write "in my style," "in Julian's voice," or requests an analytical, comparative, or explainer piece and no other tone is specified. Not for casual chat, marketing copy, or short social posts.
---

# Analytical Essayist Tone

This is Claude Code's discovery wrapper for the
`tone-analytical-essayist` routine. The full tone (voice, rules,
structure, sentence-level habits, vocabulary register, examples, and the
finalizing checklist) is defined once, at
`routines/tone-analytical-essayist.md` in this toolkit, not here (rule 4
of `rules/rules-for-prototyping.md`: single source of truth per fact).
Read that file and follow every section of it when this skill applies;
this wrapper exists only because Claude Code's skill system looks for a
file at exactly this path
(`agent-config/claude/skills/<name>/SKILL.md`) and would not otherwise
discover the routine at all.

Other agent tooling (Codex, OpenCode, or anything else) should read
`routines/tone-analytical-essayist.md` directly. If a tool needs its own
discovery mechanism the way Claude Code does, give it its own thin
wrapper under a sibling `agent-config/<tool>/` folder rather than
extending this one.
