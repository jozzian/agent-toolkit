---
type: Routine
title: Write Handover
description: Turns the current session state into a structured handover block that a fresh session, a different agent, or the owner can pick up cold, portable enough to paste into any chat.
timestamp: 2026-10-07
tags: [handover, sessions, delegation]
status: adopted; canonical, tool-neutral version. Do not fork a per-tool copy of this content.
---

# Write Handover

Apply this routine when a session is about to end, when context is about
to be compacted, or when the owner asks for a handover: produce one
fenced block, holding a human-readable main section (TITLE, TIME &
DATE, INTENT/GOAL, DONE LAST, REPOS UPDATED, REPOS ARE UP-TO-DATE, DO
NEXT) plus a compact machine-oriented detail block below it, that lets a
fresh session or a different agent continue the work with no access to
this conversation. Follow every instruction below on the state of the
session as it actually is, verified with real commands, not recalled
from memory.

## What to do

1. Verify state before writing. Run the checks the handover will claim:
   the current branch and its relation to the remote (ahead, behind,
   equal), whether the working tree is clean, whether pushes actually
   landed, and whether anything exists only locally. A handover that
   asserts unverified state propagates errors into the next session. If
   a claim cannot be verified, say so in the handover instead of
   guessing.
2. Emit the block inside a fenced code block, with the exact field
   structure below, in this order. Each field is one to four short
   lines, written for a human reader first. No field may be left out;
   write None or Not applicable where a field genuinely does not apply.

   ```
   HANDOVER
   TITLE: <project or workstream, one line>
   TIME & DATE: <UTC date and approximate time of writing>
   INTENT/GOAL: <what the work is for, one or two sentences; the change it brings and for whom>
   DONE LAST: <tracker issue ID first if applicable, then a short summary of the most recent completed work>
   REPOS UPDATED: <repo ID or path and one-line description of what changed; every repo touched this session>
   REPOS ARE UP-TO-DATE: <Yes or No; if No or partially, name exactly what is local-only, unpushed, or uncommitted>
   DO NEXT: <tracker issue ID first if applicable, then bullets on what remains; ordered; each bullet executable by someone with no other context>
   ```

3. Start DONE LAST and every DO NEXT bullet with the tracker issue ID
   when the work is tracked in an issue tracker (for example a Linear
   issue ID), followed by its title in parentheses, then the summary.
   Untracked work says so plainly (No tracker ID for this work) rather
   than inventing one.
4. Keep the main block human-readable. Short declarative lines, one
   fact per line, no run-on semicolon chains, no command output pasted
   inline. The owner reads this block; dense operational detail does not
   belong in it.
5. Put machine-oriented detail in a separate compact block below the
   main one, clearly labeled (for example AI-ONLY BLOCK). This block may
   carry absolute paths, restart commands, ports, token variable names
   (never token values), test counts, commit SHAs, and known pitfalls.
   One long line per fact is acceptable here; readability by a human is
   not the goal, executability by an agent is. Shape it like this:

   ```
   AI-ONLY BLOCK
   repo: <absolute path>; remote: <id>; branch: <name> == origin/<name> == <sha>; tree: <clean or dirty>
   tests: <command> -> <count> pass
   run: <exact start command>
   creds: <variable or config key names only, never values>
   pitfalls: <known traps the next session would otherwise rediscover the hard way>
   ```
6. Never put secrets in either block: no token values, no passwords, no
   private keys, no personal data from local-only vaults. Reference
   credentials by the name of the variable or config key that holds
   them.
7. Record honest corrections. If an earlier claim in the session turned
   out to be wrong (a feature believed shipped that does not exist, a
   test believed passing that failed), state the correction in DONE LAST
   or DO NEXT explicitly. A handover that hides a known error hands the
   next session a trap.
8. End DO NEXT with a feedback line telling the reader how to respond
   (reply with corrections, a chosen next step, or a new direction), so
   the handover doubles as a decision request when one is pending.
9. After writing the block, re-read it against the verified state from
   step 1. Every repo, branch, ID, and count it names must match what
   the commands returned; items step 1 marked as unverified stay
   labeled as such. Fix mismatches before delivering.

## Invocation

An explicit request (write the handover, wrap up, hand this to the next
session) applies this routine to the whole current session state. A
consuming agent configuration may make the routine the default shape for
any end-of-session summary. Pasting this file into a chat may establish
the format for that chat, subject to how that interface handles pasted
instructions; this file by itself cannot guarantee that any tool runs it
automatically.
