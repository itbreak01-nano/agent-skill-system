---
trigger: always_on
---

# Master Operational Disciplines & Iron Laws

These rules are non-negotiable operational principles synthesized from industry-leading agent methodologies (`superpowers`, `agent-skills`, `ECC`). They govern every interaction, code edit, and tool call.

---

## 1. The Iron Law of Systematic Debugging

> **NO FIXES WITHOUT ROOT CAUSE INVESTIGATION FIRST**

When encountering any error, bug, test failure, or unexpected behavior:
1. **Never guess or patch symptoms**: Proposing a fix before identifying the root cause is strictly forbidden.
2. **Phase 1 — Investigation**:
   - Read the complete error messages and stack traces. Note exact line numbers, paths, and error codes.
   - Trace the exact data flow up to the failure point.
   - Reproduce the failure consistently with a minimal reproduction case.
3. **Phase 2 — Root Cause Isolation**:
   - Formulate a testable hypothesis explaining *why* the failure occurred.
   - Validate the hypothesis against code and data before making changes.
4. **Phase 3 — Minimal, Targeted Remediation**:
   - Apply the fix that resolves the root cause.
   - Avoid unrelated refactoring or "shotgun debugging".
5. **Phase 4 — Regression Protection**:
   - Add a targeted test that fails without the fix and passes with it.

---

## 2. The Iron Law of Verification Before Completion

> **NO COMPLETION CLAIMS WITHOUT FRESH VERIFICATION EVIDENCE**

Never state that a task is done, a bug is fixed, tests pass, or a build succeeds without executing the verification command and inspecting the fresh output:
1. **Identify the proof**: Determine the exact command that proves the assertion (e.g. unit test suite, linter, typecheck, build).
2. **Execute fully**: Run the command fresh (do not rely on prior runs or assumptions).
3. **Inspect output**: Read the full output, check exit codes, and count failures.
4. **Evidence before assertions**: Quote or cite the actual output in your response before stating success.
5. **Forbidden words before verification**: Never use "should work", "probably fixed", "seems right", or premature congratulations ("Done!", "Great!") before running verification.

---

## 3. Strict Test-Driven Development (Red-Green-Refactor)

When writing new features or fixing bugs:
1. **Red**: Write a minimal failing test that specifies the expected behavior. Execute it and confirm it fails for the expected reason.
2. **Green**: Write the minimal code necessary to make the test pass. Verify all tests pass.
3. **Refactor**: Clean up the implementation while keeping tests green (following DRY, YAGNI, and single-responsibility principles).

---

## 4. Antigravity Execution & Task Tracking

1. **Task Tracking**:
   - Antigravity's `manage_task` tool is strictly for background system processes, *not* for todo lists.
   - For multi-step tasks, maintain a markdown task artifact (`task_tracking.md` or checklist in `<Artifact Directory>`). Update it dynamically (`- [x]`) as each milestone completes.
2. **Subagent Orchestration**:
   - Use `invoke_subagent` for parallel exploration, heavy isolated refactoring, or independent code reviews.
   - Keep parent agent focused on orchestration, quality gates, and final synthesis.
3. **Preserve Documentation Integrity**:
   - Always retain existing comments, licenses, and docstrings unless explicitly instructed otherwise.
