---
trigger: always_on
---

# Automated Skill Orchestration & Multi-Skill Routing Rule

> **Never execute a task in isolation or by guessing.** Every incoming user task MUST automatically pass through the 4-Layer Skill Composition Pipeline before modifying code or taking action.

---

## 1. The 4-Layer Skill Composition Pipeline

When the user gives any instruction, prompt, or task, automatically resolve and announce the active skill stack:

```
┌────────────────────────────────────────────────────────────────────────┐
│                        USER TASK / PROMPT                              │
└──────────────────────────────────┬─────────────────────────────────────┘
                                   │
                                   ▼
┌────────────────────────────────────────────────────────────────────────┐
│ 1. PROCESS LAYER (How to think & execute)                              │
│    • New Feature / Project → brainstorming + writing-plans             │
│    • Bug / Crash / Issue   → systematic-debugging                      │
│    • Audit / Review        → requesting-code-review + subagents        │
├────────────────────────────────────────────────────────────────────────┤
│ 2. ARCHITECTURE & STANDARDS LAYER (Engineering best practices)         │
│    • Web / UI / Frontend   → react-best-practices + web-design        │
│    • Security / Auth       → security-scanning + security-review       │
│    • Docs / Prose          → writing-guidelines                        │
├────────────────────────────────────────────────────────────────────────┤
│ 3. DOMAIN & TECHNOLOGY LAYER (Exact technical playbooks)               │
│    • Documents / Office    → docx, pdf, pptx, xlsx                     │
│    • Cloud / Containers    → docker-patterns, kubernetes-operations    │
│    • Languages & Stacks    → python-development, jvm, systems          │
│    • Niche / 12,000+ Skills→ Dynamic search via .\scripts\find-skill   │
├────────────────────────────────────────────────────────────────────────┤
│ 4. QUALITY GATE & VERIFICATION LAYER (Evidence & acceptance)           │
│    • All Code Changes      → test-driven-development                   │
│    • All Completion Claims → verification-before-completion           │
└────────────────────────────────────────────────────────────────────────┘
```

---

## 2. Automated Execution Routine

For every substantive request:

1. **Resolve Intent**:
   - Run `powershell -ExecutionPolicy Bypass -File .\scripts\resolve-skills.ps1 -Task "<User Task>"` if the stack involves complex or niche domain requirements.
2. **Stack Declaration**:
   - Explicitly announce to the user the resolved stack:
     > 🎯 **Resolved Skill Stack**:
     > - **Process**: `[Skill]`
     > - **Architecture**: `[Skill]`
     > - **Domain**: `[Skill]`
     > - **Quality Gate**: `[Skill]`
3. **Progressive Skill Loading**:
   - Read the exact `SKILL.md` instructions for the selected domain before drafting or applying code.
4. **Enforce the Chain of Custody**:
   - Strictly follow the resolved procedural steps (e.g., failing test -> code -> fresh verification command).
