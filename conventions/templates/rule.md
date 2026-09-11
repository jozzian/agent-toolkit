---
type: Convention
title: Rule Template
description: Starting skeleton for a rule file, derived from the actual structure of rules/prototyping-system.md, with the numbering contract stated up front.
timestamp: 2026-09-11
tags: [template, rules]
---

# Rule Template

A rule is a stable, numbered invariant that governs work regardless of
stage or task. This skeleton is derived from
`rules/prototyping-system.md`, the canonical example. In this toolkit,
new rules are added to that file rather than started as new files; use
this skeleton when a consuming project needs its own rule file, or when
reading the structure a rule entry must have.

The canonical example to study before writing:
[rules/prototyping-system.md](../../rules/prototyping-system.md).

## Template

```markdown
---
type: Rule
title: <Short title for the rule set>
description: <One sentence: what these rules govern, and where they were derived from.>
tags: [<relevant tags>]
timestamp: <YYYY-MM-DD, the date of the last material edit>
status: <Adoption note. Where rules may be cited by number, state that numbers are stable and must not be renumbered when editing.>
---

# <Short title for the rule set>

<One paragraph: where these rules came from and what they generalize.
Name the shape of the problem, not a specific product, repo, or
incident; that detail stays in the product's own notes.>

## Why this exists

<One paragraph: the goal every rule below is read against, and the test
a rule must pass to belong here: does it survive being applied to a
second, unrelated project with none of the first one's context. If a
rule only makes sense because of one product's facts, it belongs in
that product's own process notes instead.>

## <N>. <Rule title, stated as the invariant itself>

<The invariant in one or two sentences: what must hold, stated so it
survives contact with a second, unrelated project.>

<The rationale: the failure mode this rule answers, generalized. Where
the rule could be mistaken for an instance of another rule in the same
file, say explicitly why it is its own rule.>

## Learnings

<Dated entries, newest first. Each entry: what happened, which rule it
touched, what changed as a result. Never silently patch a rule's text
without a record here of why it changed.>
```

## Filling it in

- **Numbering contract.** A rule's number never changes once adopted,
  even if its content is later revised, replaced by a pointer to
  another artifact, or superseded in substance. A retired number stays
  reserved, stating the pointer, because a consuming project may
  already cite it. Add new rules at the next free number. See
  [rules/index.md](../../rules/index.md).
- **One invariant per numbered section.** If a section needs two
  unrelated invariants, it is two rules.
- **Generalize or leave it out.** Concrete incidents that produced a
  rule stay in the product's own repo; the rule file keeps the
  generalized lesson only.
- **Record the reason in Learnings.** When a rule's text changes, add a
  Learnings entry in the same edit, per
  [approaches/working-method-learning-loop.md](../../approaches/working-method-learning-loop.md).
- **Adding a rule to this toolkit** means three edits in one change:
  the numbered section in `rules/prototyping-system.md`, a Learnings
  entry in the same file, and a catalog line in `rules/index.md`.
- Follow the house prose style (see
  [routines/sharpen.md](../../routines/sharpen.md)): lead with the
  point, no contractions, no em dashes, no filler.
