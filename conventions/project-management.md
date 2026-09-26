---
type: Convention
title: Work structure
description: The planning vocabulary this toolkit uses to scope and track work (Intent, Theme, Goal, Milestone, Task), built on a required outcome for every Goal, Milestone, and Task.
tags: [planning, process]
timestamp: 2026-09-26
---

# Work structure

```
(Theme)
 └── Goal
      └── Milestone
           └── Task
```

Goal, Milestone and Task are the three main levels to work with. A Theme is an optional grouping above them.

## Intent

Intent is the reason the work exists at all, before any Goal is chosen. It answers: what change is wanted in the world, for whom, and why does it matter. Intent is broader than any single Goal or feature, and outliving both is expected.

- Intent should be written down once per project or effort, in one short paragraph. An intent that exists only in someone's head is unknown, and every decision below it will be guessed at.
- The test of a known intent is that someone else can read it and judge whether a proposed Goal fits it, without asking the author.
- Intent flows downward through the structure. A Theme aligns a set of Goals to the intent. A Goal's Objective states what the intent looks like for that one Goal. A feature that does not trace back to the intent is a signal to question the feature, not to stretch the intent.
- Intent is revised deliberately, not drifted into. If a Goal no longer fits, first check whether the Goal is wrong; only change the intent if the reason the work exists has genuinely changed, and record that decision.

## Theme (optional)

A Theme is a strategic direction that work aligns to. It names an ambition, not a fact to check. It can be mentioned, but doesn't have to be.

- A Theme doesn't have to be "reached" and has no outcome of its own.
- Wording is present tense and aspirational.
- A Theme groups a set of Goals and explains why they were chosen together. An Objective states the intent of one Goal. A Theme explains what several Goals have in common.

## Goal

- Wording is in the completed form, as if it had already happened. Examples are "has reached conformance with the spec" or "was accepted by the repository owner". This makes the Goal a fact that is either true or not.
- SMART is the ambition here. A Goal can fall short on a letter or two, as long as the gap is known.
- A Goal breaks down into Milestones and is reached once every Milestone is reached. The Milestones together must fully cover the Goal, so that reaching all of them proves the Goal is true.
- State explicitly what is out of scope.
- Each Goal needs an explicitly stated Objective. The Objective states the intent of the Goal in one or two sentences: the change it is meant to bring about, why that matters, for whom, and by when. It is the Goal's share of the project Intent, so it must trace back to one; a Goal whose Objective cannot be connected to a written intent is a signal that the intent is unknown or the Goal does not belong. Stating it separately makes it possible to pull the Objectives out later and rename the Goals as Key Results to form OKRs. For now, only the three levels are used. An Objective that cannot name a beneficiary or a time frame is a signal to revisit the Goal itself, not a license to pad the sentence.

## Milestone

A Milestone is a step toward a Goal, smaller and more concrete than the Goal itself. Milestones can build on each other or run in parallel. If one depends on another, state the dependency.

- A Milestone is either reached or not. There is no partial credit.
- Wording uses the same completed form as a Goal.
- Unlike a Goal, a Milestone must be fully SMART. A Milestone that cannot be checked cannot prove that the Goal is getting closer.
- State explicitly what is out of scope, within the scope of the Goal. A Milestone narrows the Goal's scope and never redefines it.

## Task

A Task is the unit of execution. It is a single piece of work that one person or one agent session can finish in one sitting.

- Wording starts with a verb in the imperative, such as Create, Add, Rename, Migrate or Remove.
- A Task belongs to a Milestone and has an outcome, but does not need to be SMART.

## Outcomes

Every Goal, Milestone and Task must have a clear outcome. A Theme does not.

An outcome is what will be true once the work is done. State it so that someone other than the person who did the work can verify it without asking them.

An outcome is one of three kinds.

- Deliverable. A concrete output, such as a document, a file or a running tool.
- State. A condition that can be checked, such as a test suite passing or a risk being retired.
- Decision. A choice that was made and recorded, such as a proposal being accepted.

Every outcome must meet three rules.

- Describe the result, not the activity. Write "the migration guide was published", not "worked on the migration guide".
- Be binary. The outcome is either true or not. Words like "improved", "better" or "more stable" need a threshold, or they don't count.
- Name how it is verified. Give a link to the deliverable, the check to run, or where the decision is recorded and who made it.

How strict this is depends on the level. A Task outcome is usually a single deliverable or state. A Milestone outcome must be fully SMART. A Goal outcome is proven by its Milestones, so it can be broader, as long as the Milestones fully cover it.
