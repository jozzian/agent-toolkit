---
type: Routine
title: Alignment Review
description: Self-contained checklist that reviews a plan, brief, or completed diff against its stated Intent anchor, classifies every item as aligned or side quest, and records the disposition of each side quest.
timestamp: 2026-10-06
tags: [goal-drift, scope, review, traceability]
status: adopted; canonical, tool-neutral version. Paste into any chat or point a coding agent at it.
---

# Alignment Review

Apply this routine to a work item, a plan, or a completed diff
whenever there is a question of whether the work still serves the
goal it was delegated for. It answers one question: does every part
of this work trace to the stated Intent anchor, and if not, what
happens to the parts that do not.

Run it at two moments, with the same checklist both times:

1. **Before execution**, on the plan or brief: cheaper to cut a
   side quest from a plan than from a merged diff.
2. **After execution**, on the diff: the executor may have added
   work the plan did not name, and review against the anchor is
   what catches it.

## What to do

1. Locate the Intent anchor: the one or two sentences stating the
   intent this work serves. In a conforming agent brief it is the
   hook. If no anchor exists in
   the work item itself, stop: the item fails rule 17 already.
   Write the anchor down before continuing, quoting it, so every
   later judgement cites the same text rather than a memory of it.
2. Enumerate the parts: every task, deliverable, file touched, and
   acceptance criterion in the item under review. For a diff,
   enumerate at the hunk level, not the file level; an unrelated
   change hides inside an otherwise aligned file.
3. For each part, answer: which sentence of the anchor does this
   serve? Record one of two verdicts per part:
   - **Aligned**, with the sentence of the anchor it serves named.
   - **Side quest**: no sentence of the anchor covers it.
4. For every side quest, record a disposition. There are exactly
   two for a same-track side quest, and the owner picks, not the
   reviewer and not the executing agent:
   - **Accept**: the anchor is amended in the same pass to cover
     the work, so the item stays internally traceable. An accept
     without an anchor amendment is drift wearing a decision's
     clothes.
   - **Cut**: the work is removed from the item, or filed as its
     own work order with its own anchor.
   A side quest on the other track (frontend work inside a backend
   item, or the reverse) has only one disposition: cut, meaning
   moved into a separate item on its own track. No owner accept can
   keep tracks blended inside one item. A frontend item, in turn,
   proceeds only against a wireframe the owner has explicitly
   approved, with the approval recorded as a dated decision.
5. Write the review down where the work item lives: the anchor
   quoted, the part-by-part verdicts, each side quest with its
   disposition and who decided. A review that exists only in a
   chat is a review the next session cannot check (rule 5: claims
   must be re-derivable).

## Output shape

```markdown
## Alignment review: <item ID and title> (<date>, pre-execution | post-execution)

Anchor: "<quoted Intent anchor>"

| Part | Verdict | Anchor sentence / Disposition |
|---|---|---|
| <task, deliverable, or hunk> | aligned | "<sentence it serves>" |
| <task, deliverable, or hunk> | side quest | accept (anchor amended) / cut (removed / filed as <ID>) / cut-to-track (moved to separate <ID>), decided by <owner> |

Side quests surfaced: <n>. Dispositions: <accept n / cut n>.
```

## Pitfalls

- **Judging parts against the work, not the anchor.** "Does this
  hunk fit the rest of the diff" is a coherence question, not an
  alignment question. A diff can be perfectly coherent and
  perfectly off-goal. Only the quoted anchor is the reference.
- **The productive-looking side quest.** Hardening, refactors, and
  extra polish pass every quality check and still fail this one.
  Quality is not traceability; judge the trace, not the craft.
- **Silent acceptance by the executing agent.** An agent that
  cannot trace a piece of work it is tempted to do must surface it
  for accept or cut, never perform it and mention it afterward.
  Performing first converts the owner's decision into a
  ratification, which is the failure mode this routine exists to
  prevent.
- **Frontend work inside a backend review.** A frontend change in
  a backend item is a side quest by construction (rule 18),
  regardless of quality: the only disposition is moving it to a
  separate frontend item. Whether that separate item may proceed
  is a second question, answered by the wireframe gate: frontend
  implementation needs an owner-approved wireframe recorded as a
  dated decision.

## Invocation

Paste this file into a chat, or point a coding agent at it,
together with the work item or diff to review and its Intent anchor.
The routine is self-contained: it states its own requirements
inline and needs nothing from this repository at run time.
