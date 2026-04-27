---
phase: 12
slug: agent-security-observability
status: draft
nyquist_compliant: false
wave_0_complete: false
created: 2026-04-13
---

# Phase 12 — Validation Strategy

> Per-phase validation contract for feedback sampling during execution.

---

## Test Infrastructure

| Property | Value |
|----------|-------|
| **Framework** | Manual (documentation-only phase) |
| **Config file** | none |
| **Quick run command** | `ls docs/agent-factory/agent-security-blueprint.mdx docs/agent-factory/agent-observability.mdx 2>/dev/null && echo "FILES_EXIST"` |
| **Full suite command** | `grep -r "agent-security-blueprint\|agent-observability" docs.json && echo "NAV_WIRED"` |
| **Estimated runtime** | ~5 seconds |

---

## Sampling Rate

- **After every task commit:** Run quick file existence check
- **After every plan wave:** Verify nav wiring in docs.json
- **Before `/gsd:verify-work`:** Both MDX files exist, docs.json updated, cross-links verified
- **Max feedback latency:** 5 seconds

---

## Per-Task Verification Map

| Task ID | Plan | Wave | Requirement | Test Type | Automated Command | File Exists | Status |
|---------|------|------|-------------|-----------|-------------------|-------------|--------|
| 12-01-01 | 01 | 1 | Security Blueprint | file_exists | `ls docs/agent-factory/agent-security-blueprint.mdx` | ❌ W0 | ⬜ pending |
| 12-01-02 | 01 | 1 | Identity/Controls | content_check | `grep -c "identity\|controls" docs/agent-factory/agent-security-blueprint.mdx` | ❌ W0 | ⬜ pending |
| 12-01-03 | 01 | 1 | Nav wiring | nav_check | `grep "agent-security-blueprint" docs.json` | ❌ W0 | ⬜ pending |
| 12-02-01 | 02 | 2 | Observability page | file_exists | `ls docs/agent-factory/agent-observability.mdx` | ❌ W0 | ⬜ pending |
| 12-02-02 | 02 | 2 | Monitoring cross-link | content_check | `grep "agent-observability" docs/operations/monitoring.mdx` | ❌ W0 | ⬜ pending |
| 12-02-03 | 02 | 2 | Nav wiring | nav_check | `grep "agent-observability" docs.json` | ❌ W0 | ⬜ pending |

*Status: ⬜ pending · ✅ green · ❌ red · ⚠️ flaky*

---

## Wave 0 Requirements

- [ ] `docs/agent-factory/agent-security-blueprint.mdx` — target file for Plan 12-01
- [ ] `docs/agent-factory/agent-observability.mdx` — target file for Plan 12-02

*Existing infrastructure (docs.json, Mintlify MDX) covers all phase requirements.*

---

## Manual-Only Verifications

| Behavior | Requirement | Why Manual | Test Instructions |
|----------|-------------|------------|-------------------|
| MDX renders without errors | All | Mintlify build required | Run `mintlify dev` and navigate to new pages |
| Entra Agent ID caveat present | Security | Content review needed | Check for `<Note>` component on Entra Agent ID section |
| Cross-links to existing governance pages work | Security | Link resolution | Verify href targets exist (security-compliance, identity-management, layer-4-security-fabric) |
| Monitoring.mdx cross-reference correct | Observability | Content review | Confirm monitoring.mdx points to agent-observability page |

---

## Validation Sign-Off

- [ ] All tasks have `<automated>` verify or Wave 0 dependencies
- [ ] Sampling continuity: no 3 consecutive tasks without automated verify
- [ ] Wave 0 covers all MISSING references
- [ ] No watch-mode flags
- [ ] Feedback latency < 5s
- [ ] `nyquist_compliant: true` set in frontmatter

**Approval:** pending
