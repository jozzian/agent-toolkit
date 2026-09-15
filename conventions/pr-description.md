---
type: Convention
title: PR Description
description: House style for pull request descriptions in this repo, covering mandatory What, Verification, and Metadata sections, a conditional Decisions section, and the division of labor between PR body, commit message, and Linear issue.
timestamp: 2026-09-15
---

# PR Description

The convention for what a pull request description in this repo
carries, and for which of the three records (PR body, commit message,
Linear issue) each fact belongs in. Generalized from PR #1, which was
written ad hoc with sections What / Placement decision / Verification
and passed review: the shape worked, but nothing defined it, so every
future PR would reinvent it. This file is spec-shaped, like
[okf.md](okf.md), because its deliverable is a copyable format rather
than an organizational layout; the copyable skeleton lives at
`.github/pull_request_template.md`, where GitHub prefills it into
every new PR body.

## Which PRs this applies to

Every pull request opened against this repo, including changes that
touch documentation only. The prefilled skeleton lives at
`.github/pull_request_template.md`. That file is a tool-required
format at a tool-required path: it sits outside the directories
[okf.md](okf.md) declares in scope, the same situation as the
`agent-config/` files, so it carries no OKF frontmatter and needs no
index of its own. Editing the skeleton is a material change to this
convention and goes through a PR that updates both files together.

## Division of labor

Three records, three jobs. A fact lives where its job is; duplication
is allowed only where the audiences genuinely differ.

- **PR body: the reviewer's copy, now.** Orientation, the change at
  the unit of decision, contested decisions, and verification
  evidence. It may duplicate commit-message rationale, because
  reviewers work in the PR interface, and it must stand on its own
  without the diff UI, because it gets quoted into the Linear result
  block and read through `gh pr view` in a terminal.
- **Commit message: the permanent record.** It must stand alone in
  git history after the branch is deleted and the PR interface is
  unreachable. Imperative subject, prose body carrying the rationale,
  `Linear: JOZ-NNN` trailer. See the commit message section below.
- **Linear issue: the work order.** It carries the four-part agent
  brief that scoped the work, and after the PR it gets a dated result
  block appended, recording what shipped and the PR number, so a
  reader months later learns the outcome without opening the diff.

Decision rationale therefore appears in both the PR body and the
commit message. That duplication is deliberate: one serves the review,
the other survives it.

## Disclosure boundary

PR bodies and commit messages are public artifacts, written for a
reviewer of this repository. They carry repo-facing facts, per the
content requirements above, and nothing else. What they do not carry
is incidental internal session detail: which tools happened to build
or review the change, how review findings were triaged or rejected,
plan or rate-limit particulars, host names, or personal workflow.
That material belongs in the Linear issue's result block. A reviewer
needs to know that an independent check ran and what it found, not
the roster of tools that ran it, so the Verification section phrases
checks tool-neutrally.

One boundary case this repo hits regularly: process facts that are
themselves the documented change. A finding entry about an agent
tool's behavior, or a rule describing a specific hook, publishes
those details as content, and the PR describing that change names
them too. The exclusion targets session history leaking out beside
the change, not the substance of the change.

## PR body spec

Section order is fixed. The skeleton:

```markdown
## What

<The change at the unit of decision, not file by file. State what the
diff cannot show: provenance, intent, deliberate non-goals.>

## Decisions

<Conditional. Present only when the PR makes a contestable placement
or model-level choice.>

## Verification

<The checks actually run, with real output pasted where a claim
depends on it.>

## Metadata

- Linear: JOZ-NNN
- Branch: <head branch>
- Commit range: <base>..<head>
- Diff stat: <N files changed, N insertions(+), N deletions(-)>
```

What each section must do, and why it is mandatory or conditional:

- **What: mandatory.** Lead with the change as a whole, then cover it
  at the unit of decision. Do not restate the diff file by file; the
  diff already lists every file. Add only what the diff cannot show:
  where content was derived from, why a piece exists, and what the PR
  deliberately does not do. PR #1's provenance notes ("derived from
  `rules/rules-for-prototyping.md`") earn this rule: that fact appears
  nowhere in the diff itself.
- **Decisions: conditional.** Include the section when, and only
  when, the PR makes a placement or model-level choice a reviewer
  could reasonably contest: where a new artifact lives, whether the
  type list or index structure changes, whether an existing standard
  is reinterpreted. State the decision, the reasoning that earns it,
  and the rejected alternative. Omit the section entirely otherwise;
  a ritual "no decisions" line is noise, and mandatory-when-empty is
  how templates get filled with filler. PR #1's "Placement decision"
  section is the model: it defended a choice against the closed
  `type` list in [okf.md](okf.md) and named what the alternative
  would have cost.
- **Verification: mandatory.** List what was actually run or checked,
  and paste real output where a claim depends on it. "All internal
  links resolve" is a claim; the command and its clean exit are the
  verification. Separate what was verified from what is assumed, the
  same rule [release-process.md](release-process.md) applies to
  CHANGELOG entries. This section is what makes a review rest on
  evidence rather than trust, so it never gets dropped for being
  inconvenient.
- **Metadata: mandatory.** Four lines, fixed order. GitHub's own UI
  already shows the branch and the diff stat, but the PR body must
  stand alone outside that UI (terminal, Linear result block, a
  printed review), and the four lines cost less than the checking
  they replace. The diff stat also lets a reviewer catch a
  description that drifted from the actual change: if the body says
  twelve files and the stat says twenty, one of them is wrong.

## Prose style

PR bodies are prose in this repo and follow house style.
[routines/sharpen.md](../routines/sharpen.md) applies in full: lead
with the point, no contractions, no em or en dashes, no filler. Do
not hard-wrap PR body paragraphs: GitHub renders the body with
newlines preserved, so a 72-character wrap designed for terminal
readers arrives looking chopped in the browser, which is where a PR
body is actually read. Keep one sentence flow per paragraph and let
the browser wrap it. The hard wrap belongs in commit messages (see
below), which are read in `git log` and on the terminal.

The description itself is subject to the style it reports on. PR #1's
Verification section claimed "No em/en dashes or contractions in new
files" while its own bullet list used em dashes: the claim was true
of the files and false of the description. House style binds both.

## Commit message

- **Subject:** imperative mood ("Add templates for every toolkit
  artifact type"), readable in `git log --oneline`.
- **Body:** prose carrying the what and the why, including the
  decision rationale. Written to stand alone: a reader of `git log`
  in a year, with no access to the PR or the issue, gets the full
  account. Hard-wrap at roughly 72 characters: the commit message
  lives in the terminal, where the wrap is the formatting.
- **Trailer:** `Linear: JOZ-NNN` as the final line, linking the
  permanent record back to the work order.
- **Identity:** commits are authored as the GitHub noreply identity
  (`jozzian <jozzian@users.noreply.github.com>`), never a personal
  name or a personal email address. Commit authorship is permanent
  public history, and this repo has no local git identity set, so
  every commit passes the identity explicitly rather than inheriting
  whatever the machine happens to carry.

## Linear issue

The issue carries the four-part agent brief that scoped the work and
is the record of intent. After the PR, append a dated result block:
what shipped, the PR number, and any deviation from the brief. The
result block is appended, not edited into the original brief, so the
issue preserves what was asked alongside what was delivered.

## Quality checklist

Before requesting review on a PR:

- [ ] Body carries repo-facing facts only; incidental internal
      session detail (builder/reviewer tool names, triage specifics,
      hosts, plans) stays out, per the disclosure boundary section.
- [ ] Body contains What, Verification, and Metadata, in that order,
      with Decisions present only if the PR makes a contestable
      placement or model-level choice.
- [ ] What describes the change at the unit of decision and adds
      provenance or intent the diff cannot show, rather than
      restating the file list.
- [ ] Every verification claim is backed by something actually run,
      with real output pasted where the claim depends on it.
- [ ] The Metadata diff stat matches `git diff --stat` against the
      base branch at the time of writing.
- [ ] House prose style applied to the description itself: no
      contractions, no em or en dashes, paragraphs not hard-wrapped.
- [ ] The commit message stands alone, with an imperative subject,
      rationale in the body wrapped at roughly 72 characters, and the
      `Linear:` trailer.
- [ ] After the PR: a dated result block is appended to the Linear
      issue.
