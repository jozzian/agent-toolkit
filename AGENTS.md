# How we work

This file is the one place that says how one person and their AI agents build products together. It applies to any product, with or without a screen. Agents read it in full at the start of every session. README.md stays for humans.

## The one principle

Keep as few elements as we can and as many as we need.

An element is anything that has to be maintained. That includes a page, button, action, field, status, concept, word, document, rule, file or dependency. Before adding one, show that no existing element can be reused, extended or merged. When an element stops earning its place, remove it in the same change. A task that ends with more elements than it started with must say why.

## Who does what

You decide. The agent drafts, checks and flags.

When the agent cannot answer a gate question, it says so. It does not fill the gap with a plausible guess. When it meets work outside its brief, it stops and asks you to accept or cut it. It never builds the extra thing quietly.

## Every session starts the same way

Before anything else, read this file and the project's PROJECT.md. Then compare the repo with the last known state and report what you find. Look for uncommitted changes, work that no doc mentions, and docs that disagree with the app. If anything has drifted, wait for your reply before continuing.

A tool with startup hooks can run this check automatically. In a plain chat, the agent runs it by hand.

## The path

Every idea passes four phases. Each ends in a gate question that you answer.

| Phase | Gate question | What it produces |
|---|---|---|
| Frame | Is the problem real, and is this first version worth building? | A framing note |
| Design | Do you approve the sketch of each surface? | Flows, surfaces, sketches, inventory |
| Build | Is each milestone's outcome true? | The working product |
| Learn | What did real use tell us, and what changes? | A decision to iterate, park or stop |

A maybe at any gate means park it, and say that it is parked. Stopping an idea is a recorded decision with a reason. An idea that is never mentioned again is not a closed one.

A change to one existing surface that adds no element skips Frame and Design. It needs only a task brief.

Backend work can run while Design advances. Anything a user or another system sees waits for an approved sketch.

## Frame

One note per initiative, kept in PROJECT.md. Ask both questions out loud. Why does this matter and for whom, and can it be built at a cost worth paying.

Required before Design. If one cannot be answered in a sentence or two, the idea is not ready.

- Name. Specific enough to scope the work. "Backups" is a category, "cross-platform backups for local backups" is a name.
- Problem. The issue faced or the opening to improve.
- Target users. Who is affected.
- First audience and what we learn from them. Who gets the first version and which question their use should answer.
- Scope. What is in, and what is explicitly out.
- Smallest version. Described as value to the user, not as a technical spec.
- Dependencies. Anything the flows cannot work without. A missing dependency is a blocker now, not a note for later.
- Decisions that are expensive to change. Naming, how the system is divided, which design system. Make each one on purpose and record it.
- Later list. Things that came up and are deliberately not in this version.

Filled in when real, never invented. Evidence, success signal, risks, privacy check. A field left open is better than a guessed one.

## Design

Design happens in documents that always describe the app as it is now. Edit them in the same change as the app.

**Start from what exists.** If a prototype exists, take screenshots and mark every element keep, change or remove before drawing anything new.

**Vocabulary.** One word per concept, defined once in the inventory. If two words mean the same thing, pick one and rename the other everywhere.

**Flows.** Entry, happy path, error paths and exit. Also state what a first-time user sees when the system holds no data, and what a user sees when nothing matches. When several entries lead to the same place, name the one rule they share instead of describing each path in full.

**Surfaces.** A surface is anything a user or another system touches. That is a screen, an endpoint, a command or a document. Every flow step names a real surface. One short doc per surface, using this shape.

```
## Purpose
## Appears in
## Minimal contents
## States
## Open questions
```

**Sketches.** The cheapest layout that settles structure and content priority. For a screen it is a text layout. For an API it is an example request and response. For a document it is an outline with sample text. Each sketch lists what is deferred. Your approval is a dated line in the surface doc, for example "Approved 2026-10-12".

**Checks before approval.**
- Every visible word is one the user would use. No internal IDs, internal terms or maintenance buttons.
- State names are sorted into the user's decisions and facts about the thing. A posting that closed is a fact, so it is a flag and not a status.
- Anything made by AI is labeled and can be corrected. Unknown is never one state. The interface tells apart not tried, tried and found nothing, in conflict and needs review, and failed, each with a reason.
- Pasted or typed input is never rejected. It always produces a record, even if everything after it fails, and the failure is visible with a way to retry.
- Nothing in the interface stands for a feature that does not exist.

**Polish rounds.** After the sketch is approved, a polish round applies the chosen design system. Record the system and its component inventory before the first round. Each round gets feedback before the next. The current doc is edited in place. Save a frozen copy of a round only when you want to compare it with the next one.

## Build

**Planning.** Intent is the reason the work exists, in one paragraph in PROJECT.md, so that someone else can judge whether a goal fits it.

- Goal. One fact worded as if it already happened, with one sentence on why it matters that traces to the Intent.
- Milestone. A step toward a goal that is either reached or not. It is checkable and it states what is out of scope. Milestones together must prove the goal.
- Task. One piece of work finishable in one sitting. It starts with an imperative verb.

Every goal, milestone and task has an outcome, which is either a deliverable, a state that holds, or a decision that was recorded. An outcome describes the result and not the activity. It is true or false, with a threshold if the wording is relative. It names how it is verified.

**Task brief.** Every delegated task carries this inside the task itself, because the agent may never read the parent doc.

```
## Intent anchor
One or two sentences on what the work is for.
## Task
## Reuses
Existing elements this builds on.
## Adds
Each new element, the flow step that needs it, and why no existing element can be extended.
Empty is the good case.
## Removes
## Outcome
What is true when done, and how it is verified.
## Not in scope
```

Every part of the task must trace to a sentence of the Intent anchor. Anything that does not is a side quest. Surface it for accept or cut.

**Reuse ladder.** Before writing anything new, whether code, a page, an action or a word, work down this list and stop at the first step that settles it.

1. Is it needed at all?
2. Does something here already do it?
3. Can an existing element be extended or merged?
4. Does the standard library, the platform or the design system do it?
5. Does an installed dependency do it?
6. Can it be done in one simple line?
7. Otherwise write the minimum the need requires.

Every exit states what was skipped and when to revisit it.

**Done means live.** A user-facing outcome is accepted when a person clicks through a running instance, following a short written list of checks. Passing tests are necessary and never enough.

**Propose before executing** when the result cannot be checked first. If a test or an independent check exists, run it and show the result. If none exists, describe the change and wait.

**Frontend and backend** are separate tracks with separate tasks. An agent that meets a frontend need during backend work stops and says so.

**Review.** A separate agent session reviews a plan or a diff before work proceeds. An agent never approves its own work. For elements, the reviewer checks only the inventory diff, meaning what the task added and removed.

**Before every commit,** check what is staged. Look for secrets, files that do not belong in version control and leftover scratch files. If anything shows up, ask.

**Secrets.** Never type a real secret into a file. Create the file with a placeholder and ask the human to fill it in.

**Removing a feature.** Check that the files it produced are gone from disk, not only that nothing references them.

## Docs

- One home per fact. State it once and let other files point to it.
- Update the doc in the same change as the app.
- A claim like "all tests pass" gives the command that produces it, or a date.
- Every doc that describes work lists its own open questions.

**Raw input.** When a batch of notes arrives, save it verbatim before touching it. Then sort each item.

- Fix to an existing surface. Goes to that surface's doc.
- New surface or step. Needs Frame or a milestone.
- Naming change. Check it against the inventory first.
- Affects several surfaces. Gets its own milestone.
- Blocked. Say exactly what is missing and who acts on it. Do not skip or guess.

If an item conflicts with something already recorded, name the conflict and the resolution in the same change.

## Learn

Use the product for real. Write down friction exactly as found. Every finding gets one outcome, which is fix now, later list, or drop with a reason.

A lesson about how we work changes the rule in this file, with a line in CHANGELOG saying why. Promote a lesson only if it happened twice or cost a lot. Otherwise a CHANGELOG line is enough.

## Inventory

Every project keeps one in PROJECT.md. It is read at the start of every session and changed in the same task that changes the app.

| List | Columns |
|---|---|
| Concepts | the word, what it means, words it replaces |
| Surfaces | name, flow step that needs it |
| Actions | name, the one place it lives |
| States | name, whether it is a user decision or a fact |
| Fixed lists | field, the allowed values |
| Design system | which, which components are adopted |
