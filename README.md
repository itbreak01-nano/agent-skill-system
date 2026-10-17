# Master AI Agent Skill System & 4-Layer Orchestrator

[![Antigravity](https://img.shields.io/badge/Antigravity-Level_5_Agent-blue?style=for-the-badge)](https://antigravity.google)
[![OpenAI Codex](https://img.shields.io/badge/OpenAI_Codex-Multi--Agent-green?style=for-the-badge)](https://github.com/openai/codex)
[![Skills](https://img.shields.io/badge/Skills-12%2C000%2B-gold?style=for-the-badge)](#skill-ecosystems)
[![License: MIT](https://img.shields.io/badge/License-MIT-purple?style=for-the-badge)](LICENSE)

An enterprise-grade meta-system that elevates **Google Antigravity** and **OpenAI Codex** into **Principal Software Engineers & Autonomous Architects (Level 5 Agents)**. 

Synthesizes over **12,000+ skills**, **250+ specialized agent roles**, **94 plugin suites**, and **22 framework rulesets** into an automated 4-layer composition engine.

---

## Quickstart: 1-Click Setup on Any Machine

To configure this complete skill system and elevate Antigravity and Codex on any computer, run:

```powershell
# 1. Clone the repository
git clone https://github.com/itbreak01-nano/agent-skill-system.git

# 2. Enter directory
cd agent-skill-system

# 3. Run the automated 1-click setup
powershell -ExecutionPolicy Bypass -File .\setup.ps1
```

### What `setup.ps1` does automatically:
- Syncs the 7 underlying skill repositories.
- Configures **Antigravity** globally (`~/.gemini/`) with rules, codex, and 17 foundational skills.
- Configures **OpenAI Codex** globally (`~/.codex/`) with `multi_agent = true`, foundational skills, and specialized subagents.
- Deploys the sub-second search CLI (`find-skill.ps1`) and dynamic orchestrator (`resolve-skills.ps1`).

---

## 4-Layer Skill Composition Architecture

Never execute a task in isolation or by guessing. Every incoming task automatically passes through the **4-Layer Skill Composition Pipeline**:

```
┌────────────────────────────────────────────────────────────────────────┐
│                        USER TASK / PROMPT                              │
│  e.g., "Build an authenticated Next.js dashboard with Excel exports"   │
└──────────────────────────────────┬─────────────────────────────────────┘
                                   │
                                   ▼
┌────────────────────────────────────────────────────────────────────────┐
│ LAYER 1: PROCESS & SEQUENCING (How to think & coordinate)              │
│   • New Feature  → brainstorming + writing-plans + executing-plans     │
│   • Bug / Error  → systematic-debugging                                │
│   • Audit / PR   → subagent-driven-development + requesting-review     │
├────────────────────────────────────────────────────────────────────────┤
│ LAYER 2: ARCHITECTURE & STANDARDS (Engineering principles)             │
│   • Web / UI     → react-best-practices + web-design-guidelines        │
│   • Security     → security-scanning + security-review                 │
│   • Performance  → eliminating waterfalls, bundle size optimization   │
├────────────────────────────────────────────────────────────────────────┤
│ LAYER 3: DOMAIN & TECHNOLOGY IMPLEMENTATION (Exact playbooks)          │
│   • Documents    → xlsx, pdf, docx, pptx (Anthropic production schemas)│
│   • Containers   → docker-patterns, kubernetes-operations              │
│   • Stacks       → python-development, javascript-typescript, rust     │
│   • 12,000+ AAS  → Dynamic vector-like keyword matching                │
├────────────────────────────────────────────────────────────────────────┤
│ LAYER 4: QUALITY GATE & VERIFICATION (The Iron Laws)                   │
│   • Implementation: test-driven-development (Red/Green/Refactor)       │
│   • Pre-Completion: verification-before-completion (Fresh test proof)  │
│   • Error Defense:  silent-failure-hunter (Zero swallowed exceptions)  │
└────────────────────────────────────────────────────────────────────────┘
```

---

## The 3 Iron Laws of Autonomous Engineering

### 1. The Iron Law of Systematic Debugging
> **NO FIXES WITHOUT ROOT CAUSE INVESTIGATION FIRST**
- For any bug, crash, or unexpected behavior: read complete stack traces, trace data flow, reproduce minimally, isolate root cause, and never guess or patch symptoms.

### 2. The Iron Law of Verification Before Completion
> **NO COMPLETION CLAIMS WITHOUT FRESH VERIFICATION EVIDENCE**
- Never assert a task is "done" or tests "pass" without running the verification command in the current turn and inspecting exit code 0 and 0 failures.

### 3. Strict Red/Green/Refactor TDD
- **Red**: Write a minimal failing test defining desired behavior. Confirm failure.
- **Green**: Write minimal implementation code to turn the test green.
- **Refactor**: Clean code and eliminate duplication while keeping tests passing.

---

## CLI Utilities & Dynamic Skill Search

### Instant Skill Search (`<200ms`)
Search across all 12,000+ skills in the local catalog:
```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\find-skill.ps1 -Query "docker"
powershell -ExecutionPolicy Bypass -File .\scripts\find-skill.ps1 -Query "react" -Repo "agent-skills"
powershell -ExecutionPolicy Bypass -File .\scripts\find-skill.ps1 -Query "pdf"
```

### Multi-Skill Recipe Resolver
Auto-resolve the complete 4-layer stack for any prompt:
```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\resolve-skills.ps1 -Task "<your task prompt>"
```

---

## Specialized Subagent Roster

Included in `.agents/agents/` and deployed to `~/.codex/agents/`:

| Agent Profile | Role |
| :--- | :--- |
| **`silent-failure-hunter`** | Audits code for empty `catch {}` blocks, swallowed errors, and dangerous fallbacks. |
| **`security-reviewer`** | OWASP Top 10, secrets leakage, authorization bypass, and input sanitization. |
| **`performance-optimizer`** | Eliminates async waterfalls, N+1 query patterns, and bundle bloat. |
| **`database-reviewer`** | SQL indexing, schema design, migration safety, and transaction isolation. |
| **`spec-miner`** | Extracts specifications, edge cases, and boundary constraints before coding. |
| **`type-design-analyzer`** | Enforces strict type safety and eliminates loose/any typing. |
| **`refactor-cleaner`** | Eliminates dead code, DRY violations, and reduces complexity. |
| **`e2e-runner`** | Generates and executes headless browser end-to-end tests (Playwright). |

---

## Enabling Full Autonomous Mode (Bypass Yes/No Approvals)

If you want the agent to execute code and terminal commands autonomously without prompting for "yes/no" approval:

- **Antigravity Chat UI**: Change the execution mode dropdown beside the input box from **"Ask for approval"** to **"Always Allow" / "Autonomous Mode"**.
- **Antigravity Settings (<kbd>Ctrl+,</kbd>)**: Set `Terminal Execution Approval` to `never`.
- **Codex CLI**: Run with `codex -a never` (or set `sandbox = "elevated"` in `~/.codex/config.toml`).

---

## Included Skill Ecosystems

1. **`superpowers`**: Core software development methodology (TDD, systematic debugging, subagent orchestration).
2. **`agent-skills` (Vercel Labs)**: Production web engineering rules (eliminating waterfalls, bundle optimization).
3. **`skills` (Anthropic Official)**: Production document engineering (`docx`, `pdf`, `pptx`, `xlsx`), visual design, and `mcp-builder`.
4. **`ECC` (Enterprise Harness)**: 1,077 enterprise skills, 50+ reviewer/resolver agents, and 22 framework rulesets.
5. **`agents` (wshobson)**: 94 plugins and 202 agent roles covering Python, TypeScript, DevOps, and Security.
6. **`awesome-claude-skills` (Composio)**: 864+ API and external tool automation skills.
7. **`agentic-awesome-skills` (AAS Core)**: 2,705+ community skills across full-stack engineering, databases, cloud, and AI/ML.

---

## License

MIT License. Feel free to use, modify, and distribute across your engineering teams.
