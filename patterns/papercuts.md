---
type: Guideline
title: Papercuts
description: Small usage friction found only by actually using the built thing — how to capture it without letting it derail planned work or get lost.
timestamp: 2026-08-25
tags: [process, quality, prototyping]
status: draft — v1
---

# Papercuts

A papercut is a small piece of friction — a misaligned element, a
confusing label, a rough edge — found only by actually using the built
thing as a real user would. Not visible from reading code, a spec, or a
doc; only from clicking through it for real.

## Why this needs its own pattern

Papercuts are cheap, plentiful, and unplanned. Without an explicit place
for them, they go one of two ways, both bad: fixed quietly off to the
side with no record (invisible later, easy to regress unnoticed), or
noticed and never written down anywhere (a known annoyance nobody named,
rediscovered repeatedly by the next person who trips over it).

## The practice

Run an actual real-use pass — a real click-through end to end, not a code
review — whenever the built thing gets used for real: a demo, a testing
session, a stakeholder walkthrough. Log what's found as it's found, then
give each item exactly one of these outcomes, on the record:

- **Fixed immediately** — cheap, safe, and within what's already being
  touched. Note it briefly in whatever changelog tracks that scope's work.
- **Folded into a planned milestone** (`rules/prototyping-system.md` rule
  11) — if it turns out to actually be part of that milestone's scope,
  not a new one invented on the spot.
- **Deferred, explicitly** — named, with a reason it's not being picked up
  now. Not silently dropped.
- **Accepted as a known gap** — stated plainly (rule 6: every stage names
  its own open questions) rather than left to be rediscovered later.

A real-use pass that ends with an item not sorted into one of the four
above is the exact failure mode this pattern exists to prevent.

## Not the same as the Delivery ready-to-ship check

`patterns/idea-to-mvp.md`'s Delivery phase ends in a checklist gate before
release. Papercuts show up continuously, at any point something real gets
used, not only at that gate — and most of them won't warrant a milestone
of their own. Treat this as the ongoing counterpart to that one-time
check, not a duplicate of it.

## Related

- `rules/prototyping-system.md` rules 6 and 11.
- `patterns/idea-to-mvp.md` — the Delivery phase this pattern feeds small,
  real findings into.
