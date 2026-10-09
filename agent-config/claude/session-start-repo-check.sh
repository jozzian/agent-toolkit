#!/usr/bin/env bash
# Read-only repo-state check implementing the session-start drift check from
# AGENTS.md ("Every session starts the same way"). Never writes, never runs a
# destructive git command.
#
# Auto-discovers every git repo one level below the workspace root — no
# hardcoded repo list to keep in sync (one home per fact; the filesystem is
# the fact here). For each repo it reports working-tree state, unpushed
# commits, and whether AGENTS.md and PROJECT.md are present and when they
# were last touched, so a stale or missing method doc is visible before work
# starts. Assumes this script lives at <workspace-root>/.claude/
# session-start-repo-check.sh; override with WORKSPACE_ROOT if installed
# elsewhere.
set -uo pipefail

WORKSPACE_ROOT="${WORKSPACE_ROOT:-$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)}"
report="Repo state check (AGENTS.md session-start drift check: current vs. last known state):"
found_any=0

for dir in "$WORKSPACE_ROOT"/*/; do
  [ -d "$dir/.git" ] || continue
  found_any=1
  repo=$(basename "$dir")
  short=$(git -C "$dir" status --short 2>/dev/null)
  unpushed=$(git -C "$dir" log '@{u}..HEAD' --oneline 2>/dev/null)
  section=$'\n\n'"### $repo"
  if [ -z "$short" ]; then
    section+=$'\n'"clean working tree"
  else
    section+=$'\n'"$short"
  fi
  if [ -n "$unpushed" ]; then
    section+=$'\n'"unpushed commits:"$'\n'"$unpushed"
  fi
  for doc in AGENTS.md PROJECT.md; do
    if [ -f "$dir$doc" ]; then
      touched=$(date -r "$dir$doc" '+%Y-%m-%d %H:%M' 2>/dev/null || echo unknown)
      section+=$'\n'"$doc present (last touched $touched)"
    else
      section+=$'\n'"$doc MISSING — AGENTS.md requires it at repo root"
    fi
  done
  report+="$section"
done

if [ "$found_any" -eq 0 ]; then
  report+=$'\n\n'"no git repos found directly under $WORKSPACE_ROOT"
fi

jq -n --arg ctx "$report" '{hookSpecificOutput: {hookEventName: "SessionStart", additionalContext: $ctx}}'
