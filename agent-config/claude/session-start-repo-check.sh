#!/usr/bin/env bash
# Read-only repo-state check covering the mechanical part of the session-start
# drift check from AGENTS.md ("Every session starts the same way"). Never
# writes, never runs a destructive git command. The qualitative part of the
# rule (docs that disagree with the app, work no doc mentions) is the agent's
# job, not this script's.
#
# Auto-discovers every git repo one level below the workspace root — no
# hardcoded repo list to keep in sync (one home per fact; the filesystem is
# the fact here). For each repo it reports working-tree state, unpushed
# commits, whether AGENTS.md and PROJECT.md are present and when they were
# last touched, and, when AGENTS.md is a product copy naming a toolkit
# commit, whether the agent-toolkit repo beside it has moved past that
# commit. Assumes this script lives at <workspace-root>/.claude/
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
  # Product-copy toolkit drift: if AGENTS.md first line names a toolkit
  # commit and agent-toolkit sits beside this repo, say whether the toolkit
  # has moved past that commit.
  if [ "$repo" != "agent-toolkit" ] && [ -f "$dir/AGENTS.md" ]; then
    first_line=$(head -n 1 "$dir/AGENTS.md")
    case "$first_line" in
      *"Copied from agent-toolkit at "*)
        pin=$(printf '%s' "$first_line" | sed -n 's/.*Copied from agent-toolkit at \([0-9a-f]\{7,40\}\).*/\1/p')
        toolkit_dir="$WORKSPACE_ROOT/agent-toolkit"
        if [ -n "$pin" ] && [ -d "$toolkit_dir/.git" ]; then
          if git -C "$toolkit_dir" cat-file -e "$pin^{commit}" 2>/dev/null; then
            if git -C "$toolkit_dir" merge-base --is-ancestor "$pin" HEAD 2>/dev/null; then
              if [ "$(git -C "$toolkit_dir" rev-parse HEAD)" = "$(git -C "$toolkit_dir" rev-parse "$pin")" ]; then
                section+=$'\n'"agent-toolkit at pinned commit $pin (copy current)"
              else
                behind=$(git -C "$toolkit_dir" rev-list --count "$pin..HEAD" 2>/dev/null)
                section+=$'\n'"agent-toolkit is $behind commit(s) past pinned $pin: copy may be stale"
              fi
            else
              section+=$'\n'"pinned toolkit commit $pin is not an ancestor of agent-toolkit HEAD"
            fi
          else
            section+=$'\n'"pinned toolkit commit $pin not found in agent-toolkit"
          fi
        fi
        ;;
    esac
  fi
  report+="$section"
done

if [ "$found_any" -eq 0 ]; then
  report+=$'\n\n'"no git repos found directly under $WORKSPACE_ROOT"
fi

jq -n --arg ctx "$report" '{hookSpecificOutput: {hookEventName: "SessionStart", additionalContext: $ctx}}'
