---
phase: 21-refactor-operations-docs
plan: 01
subsystem: docs
tags: [mintlify, docs, navigation, ai-landing-zone, citadel-hub]

requires: []
provides:
  - Restructured Guides section with ALZ and Citadel Hub subsections
  - New introduction and quickstart pages linking to official GitHub repositories
  - Complete removal of Operations tab content and runbooks
  - Updated docs.json navigation reflecting the new two-section guide architecture
affects:
  - 21-refactor-operations-docs

tech-stack:
  added: []
  patterns:
    - CardGroup navigation for section landing pages
    - Two-section guide architecture separating foundational infrastructure (ALZ) from gateway capabilities (Citadel)

key-files:
  created:
    - docs/guides/index.mdx
    - docs/guides/ai-landing-zone/index.mdx
    - docs/guides/citadel-hub/index.mdx
  modified:
    - docs/docs.json
    - docs/guides/ai-landing-zone/network-approach.mdx
    - docs/guides/ai-landing-zone/llm-routing-architecture.md
    - docs/guides/ai-landing-zone/networking.mdx
    - docs/guides/ai-landing-zone/llm-routing.mdx
    - docs/guides/citadel-hub/deployment/quick-start.mdx
    - docs/guides/citadel-hub/deployment/full-deployment.mdx
    - docs/guides/citadel-hub/deployment/parameters.mdx
    - docs/guides/citadel-hub/features/pii-masking.mdx
    - docs/guides/citadel-hub/features/throttling-handling.mdx
    - docs/guides/citadel-hub/features/llm-backend-onboarding.mdx
    - docs/guides/citadel-hub/operations/citadel-sizing.mdx
    - docs/guides/citadel-hub/operations/estimation-guide.mdx
    - docs/guides/citadel-hub/operations/power-bi-dashboard.mdx
    - docs/guides/citadel-hub/operations/scripts-reference.mdx
    - docs/guides/citadel-hub/operations/usage-analytics.mdx
    - docs/guides/citadel-hub/reference/entraid-auth.mdx
    - docs/guides/citadel-hub/reference/governance-benefits.mdx
    - docs/guides/citadel-hub/development/shared-resources.mdx
    - docs/guides/citadel-hub/development/testing-tools.mdx
    - docs/guides/citadel-hub/best-practices.mdx
    - docs/guides/citadel-hub/bicep-modules.mdx
    - docs/guides/citadel-hub/common-issues.mdx
    - docs/guides/citadel-hub/configuration-examples.mdx
    - docs/guides/citadel-hub/deployment-checklist.mdx
    - docs/guides/citadel-hub/deployment-guide.mdx
    - docs/guides/citadel-hub/entraid-auth-validation.md
    - docs/guides/citadel-hub/full-deployment-guide.md
    - docs/guides/citadel-hub/governance-hub-benefits.md
    - docs/guides/citadel-hub/LLM-Backend-Onboarding-Guide.md
    - docs/guides/citadel-hub/parameters-usage-guide.md
    - docs/guides/citadel-hub/pii-masking-apim.md
    - docs/guides/citadel-hub/power-bi-dashboard.md
    - docs/guides/citadel-hub/put-estimation-guide.md
    - docs/guides/citadel-hub/quick-deployment-guide.md
    - docs/guides/citadel-hub/throttling-events-handling.md
    - docs/guides/citadel-hub/troubleshooting.mdx
    - docs/guides/citadel-hub/validation-checklist.mdx

key-decisions:
  - Consolidated all remaining how-to guides under Citadel Hub since they relate to the APIM-based AI gateway accelerator
  - Removed the Operations tab entirely rather than merging, since the standalone Operations section was redundant with Citadel Hub operations guides and runbooks
  - Preserved implementation/ paths in docs.json navigation under Citadel Hub since they were outside the Guides directory restructure scope

requirements-completed: [REFACTOR-01, REFACTOR-02]

duration: 4min
completed: 2026-04-15
---

# Phase 21 Plan 01: Restructure Guides into ALZ and Citadel Hub Summary

**Restructured Mintlify Guides into two clear subsections (AI Landing Zone and Citadel Hub) with new landing pages linking to official GitHub repositories, and completely removed the redundant Operations tab and runbooks.**

## Performance

- **Duration:** 4 min
- **Started:** 2026-04-15T10:49:26Z
- **Completed:** 2026-04-15T10:53:45Z
- **Tasks:** 4
- **Files modified:** 45+

## Accomplishments

- Created new Guides introduction page (`docs/guides/index.mdx`) with CardGroup navigation to both AI Landing Zone and Citadel Hub sections, plus direct links to both official GitHub repositories
- Created AI Landing Zone section (`docs/guides/ai-landing-zone/`) with quickstart page and moved all ALZ-related networking and routing guides into it
- Created Citadel Hub section (`docs/guides/citadel-hub/`) with quickstart page and consolidated all remaining deployment, feature, operations, reference, and development guides under it
- Updated `docs/docs.json` navigation to remove the Operations tab and restructure the Guides tab into AI Landing Zone and Citadel Hub subsections
- Completely removed `docs/operations/` directory and all runbook content

## Task Commits

Each task was committed atomically:

1. **Task 1: Create Guides introduction page** - `acf354f` (docs)
2. **Task 2: Create AI Landing Zone section and quickstart** - `c3ca043` (docs)
3. **Task 3: Create Citadel Hub section and quickstart** - `4d5d863` (docs)
4. **Task 4: Remove Operations tab content and runbooks** - `1f283ef` (docs)
5. **Fix: Stage deletions of moved guide files** - `4da289c` (fix)

**Plan metadata:** *pending*

## Files Created/Modified

- `docs/guides/index.mdx` — New Guides landing page with ALZ/Citadel explanations and repo links
- `docs/guides/ai-landing-zone/index.mdx` — AI Landing Zone quickstart with official repo link
- `docs/guides/citadel-hub/index.mdx` — Citadel Hub quickstart with official repo link
- `docs/docs.json` — Removed Operations tab, restructured Guides navigation into ALZ and Citadel Hub sections
- `docs/guides/ai-landing-zone/network-approach.mdx` — Moved from guides root
- `docs/guides/ai-landing-zone/llm-routing-architecture.md` — Moved from guides root
- `docs/guides/ai-landing-zone/networking.mdx` — Moved from guides/architecture
- `docs/guides/ai-landing-zone/llm-routing.mdx` — Moved from guides/architecture
- `docs/guides/citadel-hub/deployment/*` — Moved from guides/deployment
- `docs/guides/citadel-hub/development/*` — Moved from guides/development
- `docs/guides/citadel-hub/features/*` — Moved from guides/features
- `docs/guides/citadel-hub/operations/*` — Moved from guides/operations
- `docs/guides/citadel-hub/reference/*` — Moved from guides/reference
- All remaining individual guide files moved to `docs/guides/citadel-hub/`
- Deleted `docs/operations/index.mdx`, `maintenance.mdx`, `monitoring.mdx`, `runbooks.mdx`, `troubleshooting.mdx`, and `runbooks/` subdirectory

## Decisions Made

- Consolidated all remaining how-to guides under Citadel Hub since they relate to the APIM-based AI gateway accelerator
- Removed the Operations tab entirely rather than merging, since the standalone Operations section was redundant with Citadel Hub operations guides and runbooks
- Preserved `implementation/` paths in `docs.json` navigation under Citadel Hub since they were outside the Guides directory restructure scope

## Deviations from Plan

### Auto-fixed Issues

**1. [Rule 1 - Bug] Staged deletions of moved guide files from old locations**
- **Found during:** Post-execution verification
- **Issue:** The `mv` commands in Tasks 2 and 3 moved files to new directories, but `git add` only staged the new locations. The old file paths were deleted on disk but not staged for deletion, leaving them as unstaged deletions in the working tree.
- **Fix:** Ran `git add -u docs/guides/` to stage all 39 deleted files from their old locations, then committed the deletions.
- **Files modified:** All old paths in `docs/guides/` root and subdirectories that were moved to `ai-landing-zone/` or `citadel-hub/`
- **Verification:** `git status --short` returned clean for the docs/guides/ directory
- **Committed in:** `4da289c`

---

**Total deviations:** 1 auto-fixed (1 bug)
**Impact on plan:** No scope creep. The fix was necessary for repository correctness after file moves.

## Issues Encountered

None.

## User Setup Required

None - no external service configuration required.

## Next Phase Readiness

- Guides restructure is complete and navigation is updated
- docs.json has been validated as proper JSON
- All old paths have been migrated; no broken internal links from the Guides section
- Ready for Phase 21 Plan 02 (if any) or milestone completion

## Self-Check: PASSED

- All key files exist on disk
- All task commits verified in git history
- docs/operations/ successfully removed
- docs.json validated as proper JSON

---
*Phase: 21-refactor-operations-docs*
*Completed: 2026-04-15*
