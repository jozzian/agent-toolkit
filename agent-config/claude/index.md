# Claude adapter

Wiring that makes the canonical method automatic inside Claude Code. It
points at `AGENTS.md` and the repo root; it duplicates nothing.

- `settings.json`: registers a SessionStart hook (15 second timeout)
  that runs the check script below.
- `session-start-repo-check.sh`: read-only script that auto-discovers
  every git repo one level below the workspace root and reports, per
  repo: working-tree state, unpushed commits, and whether `AGENTS.md`
  and `PROJECT.md` are present and when they were last touched. This
  implements the session-start drift check from `AGENTS.md`. It writes
  nothing.
- `skills/analytical-essayist-tone/SKILL.md`: thin discovery wrapper so
  the tone routine in `routines/tone-analytical-essayist.md` fires
  automatically in Claude Code. The wrapper carries only the trigger
  description; the content lives in the routine.

Skill directories under this adapter hold only `SKILL.md`. Other tools
reading this repository need no adapter: every canonical file is plain
Markdown.
