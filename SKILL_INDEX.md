# Master Skill Index & Agent Knowledge Codex

This workspace houses 7 premier agent skill repositories comprising over 12,000+ skills, 250+ specialized agent roles, and comprehensive engineering rules. This index organizes these capabilities by operational domain and guides on-demand dynamic retrieval.

---

## 1. Fast Skill Discovery CLI

To locate any skill across the entire 12,000+ repository library in under 200ms:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\find-skill.ps1 -Query "<keyword>" [-Repo <name>] [-Limit <N>]
```

**Examples:**
- `.\scripts\find-skill.ps1 -Query "debugging"`
- `.\scripts\find-skill.ps1 -Query "react" -Repo "agent-skills"`
- `.\scripts\find-skill.ps1 -Query "pdf"`
- `.\scripts\find-skill.ps1 -Query "security"`

---

## 2. Core Methodology & Execution Disciplines (`superpowers`)

These meta-skills form the core procedural operating system for elite engineering execution:

| Skill | Primary Location | Purpose & Trigger |
| :--- | :--- | :--- |
| **`using-superpowers`** | [`superpowers/skills/using-superpowers`](file:///C:/Users/User/Documents/skill/superpowers/skills/using-superpowers/SKILL.md) | Universal gateway: checks for and enforces skill usage before taking action. |
| **`brainstorming`** | [`superpowers/skills/brainstorming`](file:///C:/Users/User/Documents/skill/superpowers/skills/brainstorming/SKILL.md) | Socratic design exploration, teasing out requirements before writing any code. |
| **`writing-plans`** | [`superpowers/skills/writing-plans`](file:///C:/Users/User/Documents/skill/superpowers/skills/writing-plans/SKILL.md) | Creating bite-sized, step-by-step implementation plans with strict testing criteria. |
| **`executing-plans`** | [`superpowers/skills/executing-plans`](file:///C:/Users/User/Documents/skill/superpowers/skills/executing-plans/SKILL.md) | Disciplined execution of multi-step plans with batching and checkpointing. |
| **`test-driven-development`** | [`superpowers/skills/test-driven-development`](file:///C:/Users/User/Documents/skill/superpowers/skills/test-driven-development/SKILL.md) | Strict red/green/refactor cycle. Zero code written without a prior failing test. |
| **`systematic-debugging`** | [`superpowers/skills/systematic-debugging`](file:///C:/Users/User/Documents/skill/superpowers/skills/systematic-debugging/SKILL.md) | 4-phase root cause discovery before proposing any fix. Eliminates symptom patching. |
| **`verification-before-completion`** | [`superpowers/skills/verification-before-completion`](file:///C:/Users/User/Documents/skill/superpowers/skills/verification-before-completion/SKILL.md) | Fresh command execution and evidence inspection before asserting completion. |
| **`subagent-driven-development`** | [`superpowers/skills/subagent-driven-development`](file:///C:/Users/User/Documents/skill/superpowers/skills/subagent-driven-development/SKILL.md) | Orchestrating autonomous subagents for task delegation, review, and validation. |
| **`requesting-code-review`** | [`superpowers/skills/requesting-code-review`](file:///C:/Users/User/Documents/skill/superpowers/skills/requesting-code-review/SKILL.md) | Generating self-reviews, diff analysis, and verification summaries for human review. |
| **`receiving-code-review`** | [`superpowers/skills/receiving-code-review`](file:///C:/Users/User/Documents/skill/superpowers/skills/receiving-code-review/SKILL.md) | Incorporating review feedback methodically without defensive or hasty changes. |

---

## 3. Web & Full-Stack Engineering (`agent-skills` & `ECC`)

Production-grade web development rules curated by Vercel and enterprise contributors:

| Skill / Rule | Location | Key Capabilities |
| :--- | :--- | :--- |
| **`react-best-practices`** | [`agent-skills/skills/react-best-practices`](file:///C:/Users/User/Documents/skill/agent-skills/skills/react-best-practices/SKILL.md) | 70+ performance rules: eliminates waterfalls, optimizes bundles, Server Actions caching. |
| **`composition-patterns`** | [`agent-skills/skills/composition-patterns`](file:///C:/Users/User/Documents/skill/agent-skills/skills/composition-patterns/SKILL.md) | Clean component composition, inversion of control, compound components. |
| **`web-design-guidelines`** | [`agent-skills/skills/web-design-guidelines`](file:///C:/Users/User/Documents/skill/agent-skills/skills/web-design-guidelines/SKILL.md) | 100+ rules covering accessibility (WCAG), focus states, form UX, reduced motion. |
| **`writing-guidelines`** | [`agent-skills/skills/writing-guidelines`](file:///C:/Users/User/Documents/skill/agent-skills/skills/writing-guidelines/SKILL.md) | Vercel engineering prose standard: active voice, descriptive headings, documentation purity. |
| **`vercel-optimize`** | [`agent-skills/skills/vercel-optimize`](file:///C:/Users/User/Documents/skill/agent-skills/skills/vercel-optimize/SKILL.md) | Cost, compute, caching, and ISR optimization audits. |
| **`ECC Language Rules`** | [`ECC/rules/`](file:///C:/Users/User/Documents/skill/ECC/rules/) | 22 comprehensive language rulesets: TypeScript, Python, Go, Rust, Java, C++, React, Vue. |

---

## 4. Document Engineering & Content Creation (`skills`)

Official production skills from Anthropic:

| Skill | Location | Key Capabilities |
| :--- | :--- | :--- |
| **`docx`** | [`skills/skills/docx`](file:///C:/Users/User/Documents/skill/skills/skills/docx/SKILL.md) | Professional Microsoft Word document generation, styling, tables, callout blocks. |
| **`pdf`** | [`skills/skills/pdf`](file:///C:/Users/User/Documents/skill/skills/skills/pdf/SKILL.md) | PDF extraction, form filling, text extraction, visual analysis, page assembly. |
| **`pptx`** | [`skills/skills/pptx`](file:///C:/Users/User/Documents/skill/skills/skills/pptx/SKILL.md) | High-impact PowerPoint deck design, typography, layout grids, visual cards. |
| **`xlsx`** | [`skills/skills/xlsx`](file:///C:/Users/User/Documents/skill/skills/skills/xlsx/SKILL.md) | Excel workbook creation, financial modeling, dynamic formulas, data visualization. |
| **`canvas-design`** | [`skills/skills/canvas-design`](file:///C:/Users/User/Documents/skill/skills/canvas-design/SKILL.md) | Visual canvas layout, SVG artwork, diagrammatic compositions. |
| **`mcp-builder`** | [`skills/skills/mcp-builder`](file:///C:/Users/User/Documents/skill/skills/skills/mcp-builder/SKILL.md) | Step-by-step scaffolding and testing for Model Context Protocol servers. |
| **`webapp-testing`** | [`skills/skills/webapp-testing`](file:///C:/Users/User/Documents/skill/skills/skills/webapp-testing/SKILL.md) | Playwright test suites, headless browser verification, visual regression testing. |

---

## 5. Enterprise Plugins & Multi-Harness Agents (`agents` & `ECC`)

94 production plugins and 200+ specialized subagent profiles:

| Category | Example Plugins / Roles | Repositories |
| :--- | :--- | :--- |
| **Language Stacks** | `python-development`, `javascript-typescript`, `jvm-languages`, `systems-programming` | `agents/plugins/`, `ECC/agents/` |
| **Cloud & DevOps** | `kubernetes-operations`, `observability-monitoring`, `incident-response` | `agents/plugins/`, `ECC/skills/` |
| **Security & Audits** | `security-scanning`, `security-compliance`, `signed-audit-trails`, `security-reviewer` | `agents/plugins/`, `ECC/agents/` |
| **AI & LLM Ops** | `llm-application-dev`, `llm-finetuning`, `machine-learning-ops`, `rag-pipeline-reviewer` | `agents/plugins/`, `ECC/agents/` |

---

## 6. External Tool Automations (`awesome-claude-skills` & `agentic-awesome-skills`)

- **Composio Integrations (`awesome-claude-skills`)**: Over 864 connectors for GitHub, Slack, Jira, Gmail, Salesforce, Notion, Supabase, Vercel, and cloud infrastructure.
- **AAS Core Catalog (`agentic-awesome-skills`)**: 2,705+ community skills indexed in `agentic-awesome-skills/data/catalog.json`.
