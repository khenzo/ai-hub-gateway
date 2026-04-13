---
phase: 10-enterprise-use-cases
plan: "01"
subsystem: docs
tags: [mdx, mintlify, agent-factory, use-cases, citadel]

requires:
  - phase: 09-agentic-design-patterns
    provides: "Agentic design patterns and orchestration context"
  - phase: 08-agentic-web-stack
    provides: "Agentic web stack architecture and Citadel mapping"

provides:
  - Employee self-service use case documentation with Citadel integration
  - Data analytics agents use case documentation with Citadel integration
  - Updated docs.json navigation for Agent Factory group

affects:
  - 10-enterprise-use-cases
  - docs.json

tech-stack:
  added: []
  patterns:
    - "Mintlify MDX documentation with CardGroup navigation"
    - "Use case structure: Challenge → Opportunity → Personas → IQ Mapping → Citadel Placement → Example → Fit"

key-files:
  created:
    - docs/agent-factory/use-case-employee-self-service.mdx
    - docs/agent-factory/use-case-data-analytics.mdx
  modified:
    - docs.json

key-decisions:
  - "Linked data analytics Next Steps to existing employee-self-service page instead of non-existent sales-lead-engagement page to maintain valid navigation"

patterns-established:
  - "Use case documents follow consistent 8-section structure aligned with white paper scenarios"
  - "CardGroup next-step navigation cross-links related Agent Factory content"

requirements-completed:
  - 10-01

duration: 2min
completed: 2026-04-13
---

# Phase 10 Plan 01: Enterprise Use Cases (Employee Self-Service & Data Analytics) Summary

**Two comprehensive MDX use case documents mapping Agent Factory scenarios to Citadel governance, with updated navigation**

## Performance

- **Duration:** 2 min
- **Started:** 2026-04-13T13:59:00Z
- **Completed:** 2026-04-13T14:01:05Z
- **Tasks:** 3
- **Files modified:** 3

## Accomplishments

- Created employee self-service use case with Challenge, Opportunity, Builder Personas, IQ Mapping, Citadel Placement, Customer Example, and Buying Pattern Fit sections
- Created data analytics agents use case with the same comprehensive structure
- Updated docs.json Agent Factory navigation group to include both new use case pages

## Task Commits

Each task was committed atomically:

1. **Task 1: Create employee self-service use case document** — `9b8b6de` (feat)
2. **Task 2: Create data analytics use case document** — `24307af` (feat)
3. **Task 3: Update docs.json navigation** — `af780bc` (chore)

**Deviation fix:** `9813e20` (fix: correct broken CardGroup link in data analytics doc)

**Plan metadata:** _pending_

## Files Created/Modified

- `docs/agent-factory/use-case-employee-self-service.mdx` — Employee self-service use case with Citadel integration (85 lines)
- `docs/agent-factory/use-case-data-analytics.mdx` — Data analytics agents use case with Citadel integration (86 lines)
- `docs.json` — Added two new use case entries to Agent Factory navigation group

## Decisions Made

- Linked the data analytics doc's Next Steps CardGroup to the employee-self-service page (which was created in the same plan) rather than the sales-lead-engagement page, which does not yet exist. This ensures all navigation links are valid at completion time.

## Deviations from Plan

### Auto-fixed Issues

**1. [Rule 1 - Bug] Fixed broken CardGroup link in data analytics doc**
- **Found during:** Task 2 verification
- **Issue:** Data analytics Next Steps CardGroup linked to `/agent-factory/use-case-sales-lead-engagement`, which does not exist yet (scheduled for 10-02)
- **Fix:** Changed the link to `/agent-factory/use-case-employee-self-service`, a valid page created in the same plan
- **Files modified:** `docs/agent-factory/use-case-data-analytics.mdx`
- **Verification:** Confirmed no links to non-existent use-case-sales-lead-engagement page remain in the new documents
- **Committed in:** `9813e20`

---

**Total deviations:** 1 auto-fixed (1 bug)
**Impact on plan:** Minimal — maintained navigation validity without scope creep.

## Issues Encountered

None

## User Setup Required

None - no external service configuration required.

## Next Phase Readiness

- Phase 10, Plan 01 is complete
- Ready for 10-02: Document sales lead engagement and customer support scenarios
- Both use case documents establish the structural pattern for remaining enterprise use cases

## Self-Check: PASSED

- All created files exist on disk
- All task commits are present in git history
- docs.json is valid JSON and contains both new navigation entries
- Both MDX documents exceed 80 lines and contain all required sections
- No broken CardGroup links remain

---
*Phase: 10-enterprise-use-cases*
*Completed: 2026-04-13*
