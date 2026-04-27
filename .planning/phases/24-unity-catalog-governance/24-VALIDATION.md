---
phase: 24
slug: unity-catalog-governance
status: draft
nyquist_compliant: false
wave_0_complete: false
created: 2026-04-27
---

# Phase 24 — Validation Strategy

> Per-phase validation contract for feedback sampling during execution.

---

## Test Infrastructure

| Property | Value |
|----------|-------|
| **Framework** | Bash structural checks (no code test framework — docs-only phase) |
| **Config file** | none |
| **Quick run command** | `ls docs/data-foundation/unity-catalog-governance.mdx && wc -l docs/data-foundation/unity-catalog-governance.mdx` |
| **Full suite command** | `ls docs/data-foundation/unity-catalog-governance.mdx && wc -l docs/data-foundation/unity-catalog-governance.mdx && grep -c "<Warning>" docs/data-foundation/unity-catalog-governance.mdx` |
| **Estimated runtime** | ~2 seconds |

---

## Sampling Rate

- **After every task commit:** Run `ls docs/data-foundation/unity-catalog-governance.mdx`
- **After every plan wave:** Run full suite command above
- **Before `/gsd:verify-work`:** Full suite must pass (file exists, >100 lines, >=2 Warning callouts)
- **Max feedback latency:** 5 seconds

---

## Per-Task Verification Map

| Task ID | Plan | Wave | Requirement | Test Type | Automated Command | File Exists | Status |
|---------|------|------|-------------|-----------|-------------------|-------------|--------|
| 24-01-01 | 01 | 1 | UCAT-01 | structural | `ls docs/data-foundation/unity-catalog-governance.mdx` | ❌ W0 | ⬜ pending |
| 24-01-02 | 01 | 1 | UCAT-01 | structural | `grep -c "metastore" docs/data-foundation/unity-catalog-governance.mdx` | ❌ W0 | ⬜ pending |
| 24-01-03 | 01 | 1 | UCAT-02 | structural | `grep -c "<Warning>" docs/data-foundation/unity-catalog-governance.mdx` | ❌ W0 | ⬜ pending |
| 24-01-04 | 01 | 1 | UCAT-03 | structural | `grep -c "catalog.schema.table" docs/data-foundation/unity-catalog-governance.mdx` | ❌ W0 | ⬜ pending |
| 24-01-05 | 01 | 1 | UCAT-04 | structural | `grep -c "Public Preview" docs/data-foundation/unity-catalog-governance.mdx` | ❌ W0 | ⬜ pending |

*Status: ⬜ pending · ✅ green · ❌ red · ⚠️ flaky*

---

## Wave 0 Requirements

- [ ] Confirm `docs/data-foundation/` directory exists (created in Phase 23)
- [ ] `docs/data-foundation/unity-catalog-governance.mdx` — does not exist; Wave 1 creates it

*Note: docs.json wiring is Phase 29 scope — do NOT touch docs.json in this phase.*

---

## Manual-Only Verifications

| Behavior | Requirement | Why Manual | Test Instructions |
|----------|-------------|------------|-------------------|
| Lineage, column masks, and row filters described as persisting independently of cluster lifecycle; metastore as architectural explanation | UCAT-01 | Content correctness cannot be automated | Review section: does it explain why governance survives cluster termination and table rebuilds? Is metastore introduced as control-plane service? |
| ABAC scheme using tags described; scaling argument present; Public Preview Warning callout | UCAT-02 | Content correctness cannot be automated | Check: ABAC Warning callout present; DBR 16.4 requirement stated; tag inheritance for ABAC described; per-table vs schema-level contrast present |
| Three-level namespace described as governance contract; downstream consumer isolation from storage changes explained | UCAT-03 | Content correctness cannot be automated | Check namespace section: does it explain storage-independence guarantee? Is workspace-catalog binding mentioned? |
| Iceberg REST Catalog Public Preview flagged; GA baseline path (OneLake mirroring) identified; access matrix present | UCAT-04 | Content correctness cannot be automated | Check: Warning callout for Iceberg REST Catalog; GA baseline clearly differentiated from Preview path; access matrix table present |

---

## Validation Sign-Off

- [ ] All tasks have `<automated>` verify or Wave 0 dependencies
- [ ] Sampling continuity: no 3 consecutive tasks without automated verify
- [ ] Wave 0 covers all MISSING references
- [ ] No watch-mode flags
- [ ] Feedback latency < 5s
- [ ] `nyquist_compliant: true` set in frontmatter

**Approval:** pending
