---
type: Index
title: Approaches
description: Catalog of reusable ways of working that a human and an AI apply together across this toolkit.
timestamp: 2026-08-26
---

# Approaches

An approach is a reusable way of working that a human and an AI apply
together. An approach may be a lifecycle, a staged workflow, a continuous
practice, or a coordination method. It does not need to be a fixed
sequence; the shared trait is that it names when it applies and what each
side is responsible for, not that it always has numbered steps.

| Approach | Kind | Trigger | Purpose |
|---|---|---|---|
| [Idea to MVP](idea-to-mvp.md) | Lifecycle | An idea is proposed for real evaluation. | Take an idea through discovery to a shippable MVP, phase by phase. |
| [Design Pipeline](design-pipeline.md) | Staged workflow | A new screen or flow needs a design artifact before or alongside code. | Take a screen or flow from initiative framing through two hi-fi rounds to ongoing iteration. |
| [Multi-Agent Collaboration](multi-agent-collaboration.md) | Coordination | More than one AI-agent session works on the same product at once. | Split work across sessions without them silently working from different facts. |
| [Review Protocol](review-protocol.md) | Coordination | A milestone or deliverable is about to be implemented, or a chunk of it just was. | Route a plan or a diff through a genuinely separate agent session before work proceeds, so an agent never approves its own work. |
| [Product Use Learning Loop](product-use-learning-loop.md) | Continuous practice | The built product or prototype is used for real, at any point. | Capture friction found through real use and give every finding an explicit outcome. |
| [Working Method Learning Loop](working-method-learning-loop.md) | Continuous practice | A working-method problem or a useful practice shows up while planning, prompting, building, reviewing, or handing off work. | Decide whether a working-method observation is isolated or worth promoting into a durable artifact, without over-fitting to one incident. |
| [Toolkit Intake](toolkit-intake.md) | Continuous practice | The human or the AI has a new idea, a learned lesson, or a noticed gap for the toolkit itself. | Capture the raw impulse before it is reshaped, and route it to the correct artifact or to one of the two learning loops above. |

Each approach file uses a consistent practical structure where it applies:
Purpose, When it applies, Human responsibilities, AI responsibilities,
Method or cadence, Outputs, Completion or review condition, and Related
artifacts. A heading is only used where it adds information; not every
approach needs every heading.

Approaches are expected to be fed and refined over time, not written
complete on day one. `rules/prototyping-system.md` states the invariants
these approaches operate under; an approach that only restates a rule
should link to it instead.
