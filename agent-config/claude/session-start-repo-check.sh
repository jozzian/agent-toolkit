#!/usr/bin/env bash
# Read-only repo-state check for prototyping-system.md rule 3 (session-boundary
# check as a skill precondition, not a memory rule). Never writes, never runs
# a destructive git command.
#
# Auto-discovers every git repo one level below the workspace root — no
# hardcoded repo list to keep in sync (rule 4: single source of truth per
# fact; the filesystem is the fact here). Assumes this script lives at
# <workspace-root>/.claude/session-start-repo-check.sh; override with
# WORKSPACE_ROOT if installed elsewhere.
set -uo pipefail

WORKSPACE_ROOT="${WORKSPACE_ROOT:-$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)}"
report="Repo state check (rule 3 — current vs. last known state):"
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
  report+="$section"
done

if [ "$found_any" -eq 0 ]; then
  report+=$'\n\n'"no git repos found directly under $WORKSPACE_ROOT"
fi

jq -n --arg ctx "$report" '{hookSpecificOutput: {hookEventName: "SessionStart", additionalContext: $ctx}}'
