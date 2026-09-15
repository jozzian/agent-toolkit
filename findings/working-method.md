# Working-method findings — agent-toolkit

This toolkit's own log, per `approaches/working-method-learning-loop.md`
and `outputs/findings-log.md`. Append-only; entries are updated in place as
they move through that loop's `Status` values, not replaced or removed.

---

## [2026-08-21] Codex `apply_patch` fails inside devbox when unprivileged user namespaces are unavailable
Status: recurring
Context: general — first hit during a `docverify-backend` kickoff session, then again repeatedly during the DocVerify Swiss Private Staging plan's DV-0 milestone (deliverable 3B and deliverable 4)

Codex can inspect the workspace and run commands through its elevated
command path, but its required `apply_patch` file-editing mechanism fails
inside this devbox. Claude Code can edit the same bind-mounted workspace
successfully, so the problem is specific to the interaction between
Codex's patch sandbox and devbox's container restrictions, not a general
filesystem permission problem. This blocks Codex from making any
compliant local file change. Retrying `apply_patch` through an elevated
command does not help, because the patch helper still attempts to create
its own bubblewrap namespace.

### Environment

- Project runs through <https://github.com/jozzian/devbox>.
- Host: macOS (inferred from `sysctl` reporting an unknown OID for the
  Linux-only `kernel.unprivileged_userns_clone` setting).
- Container: Debian Bookworm-based devcontainer.
- Workspace: bind-mounted at `/workspaces/app`.
- Devbox deliberately drops all capabilities, then adds only `CHOWN`,
  `SETGID`, `SETUID`, `NET_ADMIN`, and `NET_RAW`.
- Devbox documentation already notes that Codex's normal bubblewrap
  sandbox cannot create Linux user namespaces under these restrictions
  and should fall back to a bundled helper.
- Claude Code can edit files in the same running container.

### Reproduction

1. Start the project with devbox on the host: `devbox /absolute/path/to/project`.
2. Start Codex inside the devbox.
3. Ask Codex to create or update any workspace file using `apply_patch`.
4. Codex's patch operation fails before applying the patch.

Minimal conceptual patch:

```diff
*** Begin Patch
*** Add File: test.txt
+test
*** End Patch
```

### Actual result

```text
apply_patch verification failed: Failed to read /workspaces/app/...:
fs sandbox helper failed with status exit status: 1:
bwrap: No permissions to create a new namespace, likely because the kernel
does not allow non-privileged user namespaces. On e.g. debian this can be
enabled with 'sysctl kernel.unprivileged_userns_clone=1'.
```

The failure occurs both when invoking the dedicated patch tool and when
invoking `apply_patch` through an otherwise elevated command. In the
latter case, the outer command is allowed to run, but `apply_patch`
starts its own sandbox helper and fails at the same namespace-creation
step. Ordinary read-only commands initially encounter the same bubblewrap
failure, but Codex's elevated command execution path can run them
successfully — there is no equivalent escalation control exposed for the
patch helper.

### Expected result

Codex should be able to edit files under the already-scoped workspace
root without requiring the devbox container to enable broadly privileged
nested sandboxing. At minimum, one of these should work: Codex detects
that bubblewrap namespaces are unavailable and uses its documented
bundled fallback for `apply_patch` as well as command execution; the
patch tool honors the same approved/elevated execution path available to
ordinary commands; or devbox exposes a narrowly scoped, documented
setting that enables the specific namespace operation Codex needs without
disabling the container's entire seccomp profile or granting
`SYS_ADMIN`.

### Why this appears Codex-specific

- The workspace itself is writable.
- Elevated Codex command execution can read the workspace.
- Claude Code successfully edits the same files from the same devbox.
- The reported failure is from Codex's `fs sandbox helper`/`bwrap`, before
  the requested filesystem mutation occurs.

This points to Codex's nested sandbox/fallback behavior rather than
ownership, bind-mount, Git, or general devbox filesystem configuration.

### Incorrect workaround to avoid

Do not tell macOS users to run `sudo sysctl -w kernel.unprivileged_userns_clone=1`
— that is a Linux kernel setting. macOS reports
`sysctl: unknown oid 'kernel.unprivileged_userns_clone'`. The relevant
Linux kernel is inside the Docker Desktop/OrbStack VM, and the immediate
restriction is the container runtime/security configuration, not a Darwin
host sysctl.

### Workarounds and risks

- **Use Claude Code for the edit.** Confirmed to work repeatedly in this
  environment, including for real DV-0 deliverables (3B's post-review
  typo fixes, and all of deliverable 4). This is the safest current
  workaround, but it prevents Codex from completing implementation
  autonomously and, when Claude Code is also the reviewer on the same
  thread, removes the review-protocol independence that mechanism exists
  for — noted explicitly at the point it happened (workspace-root
  `reviews/log.md`, `2026-08-27T05:59:49Z` entry).
- **Edit through an unrestricted shell command.** Technically possible
  when Codex command escalation is approved, but violates Codex sessions
  that require `apply_patch` for local edits, bypasses the intended
  patch-specific audit path, and should not be the default fix.
- **Disable Docker seccomp filtering**
  (`"--security-opt=seccomp=unconfined"` in `runArgs`) may permit nested
  namespace creation. Not verified as minimal or sufficient, and weakens
  a meaningful devbox isolation layer — too broad to recommend without
  further testing.
- **Add `CAP_SYS_ADMIN`.** May also enable namespace operations, but is
  an extremely broad capability conflicting with devbox's least-privilege
  design. Should not be adopted merely to make Codex's nested sandbox
  work.

### Investigation suggestions

1. Reproduce on both Docker Desktop and OrbStack on macOS.
2. Capture the exact Codex version and whether the failure changes with
   Codex sandbox configuration.
3. Determine which syscall/flag is rejected (`unshare`, `clone`, or
   `clone3` with a namespace flag) and whether Docker's seccomp profile
   or missing capabilities cause the rejection.
4. Compare the execution path used by ordinary elevated commands with the
   path used by Codex's filesystem patch helper.
5. Verify why the fallback described in devbox's README handles command
   execution but not this patch operation.
6. Test a custom seccomp profile that permits only the required namespace
   syscall/flags before considering `seccomp=unconfined`.
7. Test whether a Codex configuration option can disable only its
   redundant inner sandbox, since devbox already supplies the outer
   filesystem, network, capability, and credential boundaries.
8. Add an automated devbox smoke test that starts Codex non-interactively
   and applies a one-line patch inside a disposable workspace.

### Acceptance gate

- Codex can create and update files within `/workspaces/app` using
  `apply_patch` in the default devbox configuration.
- Files outside the mounted project remain inaccessible.
- The outbound firewall and credential proxy continue to work.
- The fix does not require `--privileged`, `CAP_SYS_ADMIN`, or globally
  disabling seccomp.
- Claude Code behavior remains unchanged.
- A regression test covers the Codex patch path, not only ordinary shell
  commands.

### Next action

Unowned as of this migration. Whoever picks this up next should start
from investigation suggestion 3 (which syscall/flag is actually
rejected) — everything else here is downstream of that answer.

### Related documentation

Both paths below are workspace-root paths (`/workspaces/app/.devcontainer/`),
not inside this toolkit repository:

- `.devcontainer/README.md`, section **Codex CLI**, currently says the
  bubblewrap startup warning is expected and that Codex falls back to its
  bundled helper. The observed patch failure shows that statement is not
  true for every Codex filesystem operation, or that the fallback itself
  is failing in this configuration.
- `.devcontainer/devcontainer.json`, `runArgs`, defines the intentionally
  restricted capability set involved in this interaction.

### Updates

- [2026-08-27] Migrated from the workspace root's `BUGS.md` (removed) into
  this toolkit's working-method findings log, per the new
  `outputs/findings-log.md` mechanism and rule 4 (single source of truth
  per fact) — this was exactly the kind of loose, ungoverned
  workspace-root file `approaches/toolkit-intake.md` already says an
  unfiled impulse shouldn't stay as. Status set to `recurring` on
  migration: this has now blocked real implementation work at least three
  separate times (documented above), which is itself evidence for
  `working-method-learning-loop.md` step 3 (Determine) — a `promoted`
  status (e.g. a documented standing routine for "apply_patch fails →
  hand off to Claude Code, note the review-independence cost explicitly")
  is a reasonable next step once someone has capacity to draft it, not
  done as part of this migration.

---

## [2026-09-12] The issue execution loop holds up when the deliverable is a runnable tool, but review shifts from prose to behavior
Status: open
Context: general, observed on the third run of the delegation loop (JOZ-179, the Repo Guardian scanner core); prior runs JOZ-170 and JOZ-177 delivered convention and template documents

The linear-project-management skill's issue execution loop (clone,
parent reads canonical files first, delegate with a self-contained
brief, parent verifies independently, commit after approval) ran a
third time, and for the first time the deliverable was software: a
scanner CLI with generated test fixtures, acceptance assertions, and
a redaction guarantee, rather than an OKF document. The loop's shape
survived unchanged; what changed is the content of each step.

What carried over without modification:

- Naming the key design decision in the brief (wrap gitleaks versus
write detection from scratch) produced a written, argued decision
record with the rejected alternative named, the same effect it had
on JOZ-170's closed-enum decision.
- The parent-reads-first rule still applied, but the canonical files
to read moved: for a tool, the prior art (gitleaks, truffleHog v3,
GitHub secret scanning) and the engine's actual `--help` output
replace README and conventions as the ground truth the review is
judged against.
- The subagent self-report remained a self-report. Its structural
claims were re-verified with independent commands, exactly as the
loop prescribes.

What changed when the deliverable became runnable:

- Verification became executable rather than textual. The review
re-ran the acceptance suite from a clean fixture regeneration
(25 of 25 assertions passed) and re-derived the redaction proof
independently: planted values were extracted from the fixture's own
git history and grepped against every byte of scanner output. For a
document, review is grep plus reading; for a tool, review is
running the thing and checking its output against evidence the tool
itself did not produce. The bar is higher and cheaper to meet at the
same time, because a passing suite is stronger evidence than a
well-argued paragraph.
- The brief needed an environment section a document brief never
needed: which engine version was installed where, which Python,
PEP 668 constraints, what must not be installed. Ambiguity about
the environment turns into wasted subagent cycles, while ambiguity
about prose turns into a rewording.
- A negative guarantee (never emit the secret value) is a first-class
acceptance criterion for a tool, and it must be verified twice:
behaviorally (grep the output) and structurally (read the code path
that could leak). Documents have no equivalent failure mode.
- Test fixtures with secret-shaped content required an explicit
generation strategy (scripted, seeded, gitignored) so the main repo
never holds files that a future scanner run would flag. A tool's
test data is itself part of the tool's threat model.

Open question for the Determine step: whether any of this generalizes
into the loop's own reference material (a short "when the deliverable
is a tool" addendum to the execution-loop notes in the
linear-project-management skill), or whether one data point is not
yet enough. Recorded now, triaged later per the loop's own rule: do
not promote off one instance.

### Updates
- [2026-09-12] Recorded during the JOZ-179 run itself, before commit,
per the loop's step 8 (close the learning loop in the same run).

---

## [2026-09-15] External briefs must be screened against the actual repo structure before building
Status: open
Context: general, observed during JOZ-184

The JOZ-184 issue brief pointed to a `skills/` path that does not
exist in this repository. The mismatch surfaced at the placement
step, deciding where the new content should go, rather than at the
build step, so build effort had already gone into a brief resting on
a wrong assumption.

Lesson: a screening pass over the brief against the actual repository
tree before the build starts looks like the cheap fix, treating a
mismatch as an intake defect to resolve first rather than a detail
to paper over during placement. Recorded now, triaged later per the
loop's own rule about not promoting off one instance.

### Updates
- [2026-09-15] Recorded during the run itself, before commit.

---

## [2026-09-15] A second CLI agent reviewing prose drafts catches drift that style scripts cannot
Status: open
Context: general, observed across JOZ-183 and JOZ-184

Two consecutive runs show that an independent second-model review of
prose catches issue classes that automated style checks miss. In
JOZ-183 the reviewer caught a factual mischaracterization of
rules/rules-for-prototyping.md rule 9: its own text says "Before
introducing a new element, check whether something already on the
list serves the need," but the draft described it as an after-the-fact
rule. In JOZ-184 the reviewer caught a Claude-specific adapter trigger
embedded in canonical, tool-neutral content, along with voice and
wording drift.

Style scripts check characters and line wrapping; they do not check
whether new text accurately describes other repository files, or
whether it stays tool-neutral.

Lesson: cross-review staying mandatory for prose changes is already
supported by approaches/review-protocol.md. Briefing reviewers to
check every factual claim the new text makes about other files looks
like a candidate addition; recorded now, triaged later per the loop's
own rule about not promoting off one instance.

### Updates
- [2026-09-15] Recorded during the run itself, before commit.
