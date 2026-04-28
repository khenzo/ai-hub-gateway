---
phase: 14
slug: deep-agents-architecture
status: passed
nyquist_compliant: true
wave_0_complete: true
created: 2026-04-13
validated: 2026-04-13
---

# Phase 14 — Validation Strategy

> Per-phase validation contract for feedback sampling during execution.

---

## Test Infrastructure

| Property | Value |
|----------|-------|
| **Framework** | Manual content verification (MDX documentation project — no automated test suite) |
| **Config file** | none |
| **Quick run command** | `grep -c "Citadel" docs/agent-factory/agent-harness.mdx docs/agent-factory/context-engineering.mdx` |
| **Full suite command** | `node -e "require('fs'); ['docs/agent-factory/agent-harness.mdx','docs/agent-factory/context-engineering.mdx'].forEach(f => { const c = require('fs').readFileSync(f,'utf8'); console.log(f, c.length > 1000 ? 'OK' : 'TOO SHORT'); })"` |
| **Estimated runtime** | ~2 seconds |

---

## Sampling Rate

- **After every task commit:** Run quick content existence check
- **After every plan wave:** Run full suite command
- **Before `/gsd:verify-work`:** Full suite must be green
- **Max feedback latency:** 5 seconds

---

## Per-Task Verification Map

| Task ID | Plan | Wave | Requirement | Test Type | Automated Command | File Exists | Status |
|---------|------|------|-------------|-----------|-------------------|-------------|--------|
| 14-01-01 | 01 | 1 | FR-03 | manual | `wc -l docs/agent-factory/agent-harness.mdx` | ✅ | ⬜ pending |
| 14-01-02 | 01 | 1 | FR-03 | manual | `wc -l docs/agent-factory/context-engineering.mdx` | ✅ | ⬜ pending |
| 14-01-03 | 01 | 1 | FR-03, FR-04 | manual | `grep -c "Layer [1-4]\|Citadel" docs/agent-factory/agent-harness.mdx` | ✅ | ⬜ pending |
| 14-01-04 | 01 | 1 | FR-03, FR-04 | manual | `grep -c "Layer [1-4]\|Citadel" docs/agent-factory/context-engineering.mdx` | ✅ | ⬜ pending |

*Status: ⬜ pending · ✅ green · ❌ red · ⚠️ flaky*

---

## Wave 0 Requirements

*Existing infrastructure covers all phase requirements — both target files exist, no stubs needed.*

---

## Manual-Only Verifications

| Behavior | Requirement | Why Manual | Test Instructions |
|----------|-------------|------------|-------------------|
| agent-harness.mdx covers all FR-03 harness topics | FR-03 | Content quality review | Read page, verify: tool-gated execution, middleware chain, HITL hooks, 4-layer security model, sandbox providers all present with depth |
| context-engineering.mdx covers all FR-03 context topics | FR-03 | Content quality review | Read page, verify: filesystem working memory, progressive skill disclosure, 3-tier loading, automatic summarization, skills vs memory distinction all present |
| Open-platform framing (no LangChain-specific APIs as prescriptive) | FR-02 | Tone/framing check | Scan for vendor lock-in language; concepts should be framework-agnostic |
| Citadel placement sections present in both pages | FR-04 | Structure check | Verify each page has a section mapping to Citadel 4-layer architecture |

---

## Validation Sign-Off

- [x] All tasks have `<automated>` verify or Wave 0 dependencies
- [x] Sampling continuity: no 3 consecutive tasks without automated verify
- [x] Wave 0 covers all MISSING references
- [x] No watch-mode flags
- [x] Feedback latency < 5s
- [x] `nyquist_compliant: true` set in frontmatter

**Approval:** COMPLETED — Phase 14 validated and closed 2026-04-13
