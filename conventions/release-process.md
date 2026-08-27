---
type: Convention
title: Release Process
description: VERSION + CHANGELOG + SemVer tag convention, and the five-edit two-push sequence for cutting a release.
timestamp: 2026-08-19
---

# Release Process

## Layout

`VERSION` at repo root — one line, bare number, no `v` prefix.
`CHANGELOG.md` at repo root, Keep a Changelog format, SemVer. Tags are
v-prefixed (`v0.2.2`); the tag carries the `v`, the VERSION file doesn't.

## CHANGELOG structure

Header, then `## [Unreleased]` always present even when empty, then
`## [X.Y.Z] - YYYY-MM-DD` sections newest first. Within a section only
`### Added / Changed / Deprecated / Removed / Fixed / Security`, in that
order, omitting empties. File ends with link definitions:

```
[Unreleased]: https://github.com/OWNER/REPO/compare/vX.Y.Z...HEAD
[X.Y.Z]: https://github.com/OWNER/REPO/compare/vPREV...vX.Y.Z
```

## Before applying this to a repo for the first time

Fill in `OWNER/REPO` for the compare URLs, and check whether the repo's
existing tag history is already consistent (a tag per release, in order,
none reused or moved). If it already has gaps, the first `[Unreleased]`
compare link will 404 the same way — fix the tag history, or start the
convention from the current point forward and say so in the CHANGELOG
header, rather than shipping a link that's broken on day one.

## Cutting a release — five edits and two pushes

1. Pick the number: breaking → major, additive → minor, fixes only → patch
2. Write the new number to `VERSION`
3. Insert `## [X.Y.Z] - YYYY-MM-DD` directly below `## [Unreleased]`, so
   accumulated entries fall under it; leave `[Unreleased]` in place and
   empty
4. Repoint the `[Unreleased]` link to the new tag, add the `[X.Y.Z]` line
5. Commit both files together — subject `Release X.Y.Z`, body explaining
   why it exists and what consumers must do
6. `git tag vX.Y.Z` then `git push origin main` and `git push origin
   vX.Y.Z` — a plain push does not send tags

## Rules that matter, each earned from something that went wrong

- VERSION, CHANGELOG section, and tag move together or not at all.
  Bumping without tagging is how a repo ends up with releases whose
  changelog links 404.
- Never reuse or move a pushed tag.
- If tooling reads the version file to detect stale deployed copies, the
  bump *is* the notification mechanism — shipping a fix without bumping
  means nobody is ever told to take it.
- If picking up a release needs a manual step, put that command at the
  top of the version's section, above the `###` headings, where someone
  chasing the notice reads it first.
- Write entries for someone hitting the problem: symptom, then cause,
  then what changed. If something was established by testing, say how.
  Don't assert a fix works if that wasn't confirmed — separate what's
  verified from what's a theory.
