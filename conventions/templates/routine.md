---
type: Convention
title: Routine Template
description: Starting skeleton for a routine file, derived from routines/sharpen.md, including the self-containment requirement that separates a routine from an approach.
timestamp: 2026-09-11
tags: [template, routines]
---

# Routine Template

A routine is a self-contained, task-specific instruction set. It
carries everything it needs in one file so it can be invoked by a local
coding agent or pasted directly into an AI chat that has no access to
this repository. This skeleton is derived from
[routines/sharpen.md](../../routines/sharpen.md), the canonical example.

The self-containment rule is the load-bearing constraint: a routine's
body does not depend on an approach, a rule, or another routine to make
sense, and it does not require the reader to open any other file. Where
a routine relates to the rest of the toolkit, that link is stated in
the other file, not in the routine.

## Template

```markdown
---
type: Routine
title: <Name>
description: <One sentence: what the routine does to its input, and that it is portable enough to paste into any chat.>
timestamp: <YYYY-MM-DD, the date of the last material edit>
tags: [<relevant tags>]
status: <adopted | draft, plus any note such as "canonical, tool-neutral version; do not fork a per-tool copy">
---

# <Name>

<One or two sentences, addressed to whoever executes the routine: what
input it applies to, and the instruction to follow every step below on
the content given. No context from outside this file.>

## What to do

<An ordered list of instructions, each one executable as written by an
agent with nothing but this file. State what to do, not what to
consider. Where a category of thing to catch or avoid exists, give the
concrete members inline as examples.>

## Invocation

<How the routine gets started: what an explicit invocation applies it
to, how a consuming project or agent configuration may make it a
default, and what pasting this file into a chat does and does not
guarantee.>
```

## Filling it in

- **Write for a cold reader.** Someone pointed at this file with no
  access to the rest of the repository must be able to execute it. No
  links out of the body, no "see rule N", no assumed project context.
- **Instructions, not descriptions.** Every numbered step is something
  the executing agent does to its input. Background and rationale
  belong in an approach, not here.
- **Invocation states the limits honestly.** The file itself cannot
  make the routine run automatically anywhere; whether it runs by
  default is a property of each tool's or chat's own configuration.
  `sharpen.md`'s Invocation section is the model for saying this.
- **Register the new file** in the
  [routines/index.md](../../routines/index.md) catalog table in the
  same change, and add a `CHANGELOG.md` entry.
- The template guidance in this file does not apply to the routine's
  own body: the body follows the house prose style, but the routine may
  not even mention that style, since mentioning it would be a
  dependency on a file the pasted-into chat cannot open. Bake the style
  into the instructions instead.
