---
phase: 20-attention-points-recommendations
plan: 01
subsystem: docs
tags: [mintlify, ey-framework, gap-analysis, mdx]

requires:
  - phase: 19-mcp-a2a-agent-discovery
    provides: Navigation patterns and EY alignment section structure
  - phase: 18-security-governance-at-scale
    provides: Governance content and guardrail patterns to reference

provides:
  - Consolidated gap analysis page for EY framework alignment
  - Categorized gap table with process/tool/out-of-scope classifications
  - Supplemental tool recommendations for observability and guardrails
  - Actionable next steps with Steps component
  - Cross-links to alignment map, governance, and getting started

affects:
  - ey-framework-alignment
  - governance
  - getting-started

tech-stack:
  added: []
  patterns:
    - CardGroup navigation for next-step guidance
    - Mintlify Steps component for actionable checklists
    - Gap analysis table with categorized recommendations

key-files:
  created:
    - docs/ey-framework-alignment/gaps-and-recommendations.mdx
  modified:
    - docs/ey-framework-alignment/index.mdx
    - docs/ey-framework-alignment/alignment-map.mdx

key-decisions:
  - "Fixed broken attention-points links in index.mdx and alignment-map.mdx to route to gaps-and-recommendations.mdx"

patterns-established:
  - "Gap analysis pages use three-category taxonomy: Process Change Required, Supplemental Tool Recommended, Out of Scope"
  - "Supplemental tool sections include comparison tables and integration patterns rather than vendor marketing"

requirements-completed: [GAPS-01]

duration: 6min
completed: "2026-04-15"
---

# Phase 20 Plan 01: Attention Points & Recommendations Summary

**Consolidated EY framework gap analysis page with categorized attention points, supplemental tool recommendations, and actionable next-step guidance**

## Performance

- **Duration:** 6 min
- **Started:** 2026-04-15T09:51:13Z
- **Completed:** 2026-04-15T09:57:15Z
- **Tasks:** 2
- **Files modified:** 3

## Accomplishments

- Created `gaps-and-recommendations.mdx` with complete gap analysis structure (121 lines)
- Documented all five known gaps with plain-language explanations and categorized actions
- Included supplemental tool deep-dives for governance process, observability, and guardrails
- Fixed broken `/ey-framework-alignment/attention-points` links in index.mdx and alignment-map.mdx
- Verified Mintlify build passes with no MDX/component errors

## Task Commits

1. **Task 1: Create gaps-and-recommendations.mdx page structure** — `94fb409` (feat)
2. **Task 2: Verify Mintlify build succeeds** — `5b6ed0f` (chore)

**Plan metadata:** `docs(20-01): complete attention-points-recommendations plan`

## Files Created/Modified

- `docs/ey-framework-alignment/gaps-and-recommendations.mdx` — Gap analysis and recommendations page with categorized gaps, supplemental tools, and actionable next steps
- `docs/ey-framework-alignment/index.mdx` — Fixed attention-points CardGroup href to point to gaps-and-recommendations
- `docs/ey-framework-alignment/alignment-map.mdx` — Fixed attention-points CardGroup href to point to gaps-and-recommendations

## Decisions Made

- Fixed broken `attention-points` links in existing pages to route to the new `gaps-and-recommendations.mdx` rather than leaving them pointing to a non-existent route.

## Deviations from Plan

### Auto-fixed Issues

**1. [Rule 1 - Bug] Fixed broken attention-points navigation links in existing EY alignment pages**
- **Found during:** Task 1 (page creation)
- **Issue:** `index.mdx` and `alignment-map.mdx` both linked to `/ey-framework-alignment/attention-points`, which did not exist. The new page was created at `gaps-and-recommendations.mdx`.
- **Fix:** Updated both CardGroup hrefs to `/ey-framework-alignment/gaps-and-recommendations`.
- **Files modified:** `docs/ey-framework-alignment/index.mdx`, `docs/ey-framework-alignment/alignment-map.mdx`
- **Verification:** Confirmed the hrefs resolve to the newly created page
- **Committed in:** `94fb409` (Task 1 commit)

**2. [Rule 3 - Blocking] Mintlify `build` script does not match available CLI commands**
- **Found during:** Task 2 (build verification)
- **Issue:** `npm run build` invoked `mintlify build`, which is not a valid Mintlify CLI command.
- **Fix:** Used `npx mintlify validate` instead to verify the documentation compiles without errors.
- **Files modified:** None
- **Verification:** `mintlify validate` returned "success build validation passed"
- **Committed in:** `5b6ed0f` (Task 2 commit)

---

**Total deviations:** 2 auto-fixed (1 bug, 1 blocking)
**Impact on plan:** Both fixes necessary for correctness. No scope creep.

## Issues Encountered

- Pre-existing parsing error in `ey-ai_agent-development_framework/ey_ai_agent_development_framework.md` unrelated to this plan; validation still passed.

## User Setup Required

None - no external service configuration required.

## Next Phase Readiness

- Phase 20 (Attention Points & Recommendations) is complete.
- Milestone v1.3 (EY Framework Alignment) is now complete.
- Ready for milestone transition or v1.4 planning.

## Self-Check: PASSED

- [x] `docs/ey-framework-alignment/gaps-and-recommendations.mdx` exists on disk
- [x] `.planning/phases/20-attention-points-recommendations/20-01-SUMMARY.md` exists on disk
- [x] Commit `94fb409` (Task 1) found in git history
- [x] Commit `5b6ed0f` (Task 2) found in git history

---
*Phase: 20-attention-points-recommendations*
*Completed: 2026-04-15*
