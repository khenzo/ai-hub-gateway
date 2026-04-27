---
phase: 23
slug: onelake-architecture
status: draft
nyquist_compliant: false
wave_0_complete: false
created: 2026-04-27
---

# Phase 23 — Validation Strategy

> Per-phase validation contract for feedback sampling during execution.

---

## Test Infrastructure

| Property | Value |
|----------|-------|
| **Framework** | Mintlify docs build (content validation) |
| **Config file** | docs/docs.json |
| **Quick run command** | `mintlify dev --port 3333` (visual check) |
| **Full suite command** | `mintlify build` |
| **Estimated runtime** | ~30 seconds |

---

## Sampling Rate

- **After every task commit:** Verify file exists and frontmatter is valid
- **After every plan wave:** Run `mintlify build` to confirm no broken links
- **Before `/gsd:verify-work`:** Full build must pass; all success criteria reviewed
- **Max feedback latency:** 60 seconds

---

## Per-Task Verification Map

| Task ID | Plan | Wave | Requirement | Test Type | Automated Command | File Exists | Status |
|---------|------|------|-------------|-----------|-------------------|-------------|--------|
| 23-01-01 | 01 | 1 | LAKE-01 | content | `grep -c "shortcut" docs/data-foundation/onelake-architecture.mdx` | ❌ W0 | ⬜ pending |
| 23-01-02 | 01 | 1 | LAKE-02 | content | `grep -c "universal namespace" docs/data-foundation/onelake-architecture.mdx` | ❌ W0 | ⬜ pending |
| 23-01-03 | 01 | 1 | LAKE-03 | content | `grep -c "row-level\|column-level" docs/data-foundation/onelake-architecture.mdx` | ❌ W0 | ⬜ pending |
| 23-01-04 | 01 | 1 | LAKE-01/02/03 | build | `mintlify build` | ✅ | ⬜ pending |

*Status: ⬜ pending · ✅ green · ❌ red · ⚠️ flaky*

---

## Wave 0 Requirements

- [ ] `docs/data-foundation/onelake-architecture.mdx` — stub file with frontmatter created before content tasks

*Existing docs.json infrastructure covers navigation registration.*

---

## Manual-Only Verifications

| Behavior | Requirement | Why Manual | Test Instructions |
|----------|-------------|------------|-------------------|
| Decision matrix helps reader choose shortcut vs mirror | LAKE-01 | Judgment call — content quality | Read decision matrix; confirm criteria are concrete and actionable for a real scenario |
| GA/Preview callouts are visually prominent | LAKE-03 | Visual rendering | Load in Mintlify dev server; confirm `<Warning>` callout renders for OneLake security Preview status |
| Universal namespace URI example is syntactically correct | LAKE-02 | Data accuracy | Verify `abfss://{workspace_id}@onelake.dfs.fabric.microsoft.com/...` matches official docs |

---

## Validation Sign-Off

- [ ] All tasks have `<automated>` verify or Wave 0 dependencies
- [ ] Sampling continuity: no 3 consecutive tasks without automated verify
- [ ] Wave 0 covers all MISSING references
- [ ] No watch-mode flags
- [ ] Feedback latency < 60s
- [ ] `nyquist_compliant: true` set in frontmatter

**Approval:** pending
