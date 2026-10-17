---
trigger: always_on
---

# Performance, Architecture & Engineering Standards

These standards synthesize best practices from Vercel Labs (`agent-skills`), Anthropic Production Skills (`skills`), and Enterprise Harness Rules (`ECC`).

---

## 1. Web & Full-Stack Performance Standards (Vercel Core)

### A. Eliminating Waterfalls (Critical)
- **Parallelize Independent Operations**: Never sequentially `await` independent promises. Use `Promise.all()` or `Promise.allSettled()`.
- **Deferred Awaiting**: Move `await` calls inside the conditional branches where their values are actually consumed, rather than at the top of the function.
- **Cheap Checks First**: Evaluate fast synchronous checks, in-memory caches, or local validations before dispatching remote network or database calls.
- **Streaming & Suspense**: In modern React/Next.js architectures, wrap slow data fetches in `<Suspense>` boundaries to stream UI to the client immediately.

### B. Bundle Size & Code Splitting (Critical)
- **Avoid Barrel Imports**: Never import large libraries via deep wildcard or monolithic barrel files (`import { x } from 'lucide-react'` -> import directly from subpath where applicable, or ensure bundler tree-shaking is verified).
- **Dynamic Imports**: Use dynamic imports (`next/dynamic` or `React.lazy`) for heavy widgets, modal dialogs, complex charts, and admin panels that are not needed on initial paint.
- **Third-Party Script Deferral**: Defer non-critical analytics, logging, and marketing trackers until after client hydration.

### C. Server-Side Execution & Caching
- **Server Action Authorization**: Treat server actions with the same security rigor as public API endpoints. Always authenticate and validate inputs before mutations.
- **Request Deduplication**: Use memoization (`React.cache()`) for per-request deduplication and persistent caches (LRU/Redis) for cross-request caching.

---

## 2. UI/UX, Design & Accessibility Guidelines

- **Semantic HTML First**: Use `<button>`, `<nav>`, `<main>`, `<article>`, `<header>`, `<footer>` instead of unsemantic `<div>` click handlers.
- **Keyboard Navigation & Focus**: Ensure all interactive elements have visible `:focus-visible` styles and are reachable via Tab.
- **Accessible Forms & Inputs**: Pair every input with a `<label>`, specify explicit `autocomplete` attributes, and declare `aria-invalid` and `aria-describedby` on error states.
- **Reduced Motion**: Respect `@media (prefers-reduced-motion: reduce)` for CSS animations and transitions.

---

## 3. Defensive Engineering & Security

- **Input Validation**: Never trust external or user input. Validate schemas strictly (e.g. Zod, Pydantic, TypeScript strict types).
- **Zero Hardcoded Secrets**: Ensure API keys, tokens, and credentials are never placed in source code or committed to VCS.
- **Sanitize Dynamic Output**: Protect against XSS, SQL injection, and command injection by using parameterized queries and proper context-aware escaping.
- **Dependency Health**: Periodically audit dependencies for vulnerabilities (`npm audit`, `pip audit`, `cargo audit`).
