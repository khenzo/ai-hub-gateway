---
phase: 18-security-governance-at-scale
plan: 02
subsystem: governance
tags: [apim, azure, content-safety, pii, prompt-shield, guardrails, ey-framework]

requires:
  - phase: 18-security-governance-at-scale
    provides: EY framework alignment context and governance structure

provides:
  - Step-by-step AI guardrails configuration guide for EY framework alignment
  - APIM policy XML snippets for Content Safety filtering
  - APIM policy XML snippets for PII blocking via Azure AI Language
  - APIM policy XML snippets for jailbreak/injection detection via Prompt Shield
  - Combined access contract composition pattern showing all three guardrails

affects:
  - docs/ey-framework-alignment

tech-stack:
  added: []
  patterns:
    - Mintlify Steps component for procedural configuration guidance
    - APIM policy XML snippets embedded in documentation
    - Cross-linking to existing governance pages for extended context

key-files:
  created:
    - docs/ey-framework-alignment/guardrails-config.mdx
  modified: []

key-decisions:
  - "Followed existing content-safety.mdx APIM XML patterns for consistency"
  - "Used inline policy snippets rather than fragment references to keep the guide self-contained"
  - "Added Tip callouts linking to full governance guides for readers needing deeper context"

patterns-established:
  - "EY guardrail configuration docs use Steps + XML snippets + threshold tuning tables"
  - "Cross-reference pattern: concise inline guide with links to comprehensive governance docs"

requirements-completed:
  - GOVN-02

duration: 1 min
completed: 2026-04-14
---

# Phase 18 Plan 02: AI Guardrails Configuration Summary

**Step-by-step guardrail configuration guide with APIM policy XML snippets for Content Safety filtering, PII blocking, and jailbreak/injection detection via Prompt Shield**

## Performance

- **Duration:** 1 min
- **Started:** 2026-04-14T13:14:41Z
- **Completed:** 2026-04-14T13:16:22Z
- **Tasks:** 1
- **Files modified:** 1

## Accomplishments

- Created `docs/ey-framework-alignment/guardrails-config.mdx` with complete MDX content
- Documented Content Safety filtering with deployable APIM `send-request` policy XML
- Documented PII blocking using Azure AI Language service entity recognition
- Documented jailbreak/injection detection via Azure AI Content Safety Prompt Shield
- Showed combined access contract composition pattern with all three guardrails
- Added cross-links to existing `content-safety` and `pii-protection` governance guides

## Task Commits

Each task was committed atomically:

1. **Task 1: Create guardrails-config.mdx — AI guardrails configuration guide with APIM policy snippets** - `ef927d0` (feat)

**Plan metadata:** To be committed after summary creation

## Files Created/Modified

- `docs/ey-framework-alignment/guardrails-config.mdx` — EY AI guardrails configuration guide with APIM policy XML snippets for Content Safety, PII blocking, and jailbreak detection

## Decisions Made

- Followed existing `content-safety.mdx` APIM XML patterns for consistency
- Used inline policy snippets rather than fragment references to keep the guide self-contained
- Added `Tip` callouts linking to full governance guides for readers needing deeper context

## Deviations from Plan

None - plan executed exactly as written.

## Issues Encountered

None.

## User Setup Required

None - no external service configuration required.

## Next Phase Readiness

- Guardrails configuration guide is complete and ready for reader use
- Phase 18 can proceed to next plan (Plan 03) for remaining governance topics
- No blockers

## Self-Check: PASSED

- [x] `docs/ey-framework-alignment/guardrails-config.mdx` exists on disk
- [x] `18-02-SUMMARY.md` exists on disk
- [x] Task commit `ef927d0` found in git history
- [x] Metadata commit `a51f136` found in git history

---
*Phase: 18-security-governance-at-scale*
*Completed: 2026-04-14*
