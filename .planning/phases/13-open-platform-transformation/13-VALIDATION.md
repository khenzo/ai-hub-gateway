---
phase: 13
slug: open-platform-transformation
status: completed
nyquist_compliant: true
wave_0_complete: true
completed: 2026-04-13
---

# Phase 13 — Validation Strategy

> Per-phase validation contract for feedback sampling during execution.

---

## Test Infrastructure

| Property | Value |
|----------|-------|
| **Framework** | Manual grep / Mintlify MDX lint |
| **Config file** | none — content-only phase |
| **Quick run command** | `grep -r "Work IQ\|Fabric IQ\|Foundry IQ\|Microsoft Agent Factory\|Forward Deployed" docs/agent-factory/ \|\| echo "CLEAN"` |
| **Full suite command** | `grep -rn "Work IQ\|Fabric IQ\|Foundry IQ\|Copilot Studio\|Microsoft Foundry\|(Foundry)" docs/agent-factory/ \|\| echo "ALL CLEAN"` |
| **Estimated runtime** | ~5 seconds |

---

## Sampling Rate

- **After every task commit:** Run quick grep (FR-01 terms absent)
- **After every plan wave:** Run full suite grep
- **Before `/gsd:verify-work`:** Full suite must return "ALL CLEAN"
- **Max feedback latency:** 5 seconds

---

## Per-Task Verification Map

| Task ID | Plan | Wave | Requirement | Test Type | Automated Command | File Exists | Status |
|---------|------|------|-------------|-----------|-------------------|-------------|--------|
| 13-01-01 | 01 | 1 | FR-01 | grep-absent | `grep "Work IQ\|Fabric IQ\|Foundry IQ" docs/agent-factory/overview.mdx \|\| echo "CLEAN"` | ✅ | ✅ green |
| 13-01-02 | 01 | 1 | FR-02 | grep-present | `grep "Microsoft Agent Framework\|agent-framework" docs/agent-factory/overview.mdx` | ✅ | ✅ green |
| 13-01-03 | 01 | 1 | FR-01 | grep-absent | `grep "(Foundry)" docs/agent-factory/citadel-mapping.mdx \|\| echo "CLEAN"` | ✅ | ✅ green |
| 13-01-04 | 01 | 1 | FR-02 | grep-present | `grep "Microsoft Agent Framework\|agent-framework" docs/agent-factory/citadel-mapping.mdx` | ✅ | ✅ green |
| 13-01-05 | 01 | 2 | FR-01,FR-02 | grep-full | `grep -rn "Work IQ\|Fabric IQ\|Foundry IQ\|Copilot Studio\|Microsoft Foundry" docs/agent-factory/ \|\| echo "ALL CLEAN"` | ✅ | ✅ green |

*Status: ⬜ pending · ✅ green · ❌ red · ⚠️ flaky*

---

## Wave 0 Requirements

*Existing infrastructure covers all phase requirements — this is a content-only (MDX editing) phase with no test framework needed. Validation is purely grep-based.*

---

## Manual-Only Verifications

| Behavior | Requirement | Why Manual | Test Instructions |
|----------|-------------|------------|-------------------|
| ASCII diagram alignment preserved after label change | FR-01 | Character alignment requires visual inspection | Open citadel-mapping.mdx, verify diagram columns align after `(Foundry)` → `(Observ.)` replacement |
| Framework list reads naturally in prose | FR-02 | Tone/coherence check | Read builder-personas and overview framework paragraphs; confirm Microsoft Agent Framework is positioned as multi-provider peer, not Microsoft-specific tool |

---

## Validation Architecture

### Dimensions Covered

1. **FR-01 automated**: grep-absent checks confirm no Microsoft-specific product names remain
2. **FR-02 automated**: grep-present checks confirm framework additions landed
3. **Nyquist sampling**: every task has an automated or manual verification step
4. **Diagram integrity**: manual check for ASCII alignment

---

## Validation Sign-Off

- [x] All tasks have `<automated>` verify or Wave 0 dependencies
- [x] Sampling continuity: no 3 consecutive tasks without automated verify
- [x] Wave 0 covers all MISSING references
- [x] No watch-mode flags
- [x] Feedback latency < 10s
- [x] `nyquist_compliant: true` set in frontmatter

**Approval:** Approved — Phase 13 validated and closed on 2026-04-13
