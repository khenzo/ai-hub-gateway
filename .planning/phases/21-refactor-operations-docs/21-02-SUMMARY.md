---
phase: 21-refactor-operations-docs
plan: 02
subsystem: docs

tags: [mintlify, navigation, cross-references, docs-json]

requires:
  - phase: 21-refactor-operations-docs
    provides: "Restructured guide directories into AI Landing Zone and Citadel Hub sections"

provides:
  - "Updated docs.json with flattened Citadel Hub navigation"
  - "Fixed cross-references across architecture, implementation, getting-started, and guide pages"
  - "Valid JSON navigation with no broken internal links to old guide paths"

affects:
  - 21-refactor-operations-docs

tech-stack:
  added: []
  patterns:
    - "Navigation paths aligned with directory structure (guides/citadel-hub/* and guides/ai-landing-zone/*)"
    - "Implementation pages kept under Implementation tab, not mixed into Guides"

key-files:
  created: []
  modified:
    - docs/docs.json
    - docs/architecture/layer-1-governance-hub.mdx
    - docs/architecture/layer-integration.mdx
    - docs/architecture/citadel-4-layer-model.mdx
    - docs/architecture/hub-spoke-overview.mdx
    - docs/architecture/vnet-peering.mdx
    - docs/architecture/network-topology.mdx
    - docs/architecture/network-security.mdx
    - docs/architecture/deployment-patterns.mdx
    - docs/implementation/index.mdx
    - docs/getting-started/quick-start.mdx
    - docs/guides/citadel-hub/**/*.mdx
    - docs/guides/ai-landing-zone/**/*.mdx

key-decisions:
  - "Flattened Citadel Hub navigation by removing Integrations and Validation subgroups (those pages belong under the Implementation tab)"
  - "Moved troubleshooting and checklist pages to the root of the Citadel Hub pages array for simpler navigation"
  - "Preserved Operations as a Citadel Hub subgroup since operational guides still exist under guides/citadel-hub/operations/"

patterns-established:
  - "All internal guide links use the full prefixed path (/guides/citadel-hub/... or /guides/ai-landing-zone/...)"
  - "Architecture pages reference ALZ paths for networking content"

requirements-completed: [REFACTOR-03, REFACTOR-04]

duration: 8min
completed: 2026-04-15
---

# Phase 21 Plan 02: Update Navigation and Fix Cross-References Summary

**Mintlify navigation restructured with Guides simplified into AI Landing Zone and Citadel Hub sections, plus all broken internal links to old guide paths fixed across the documentation site.**

## Performance

- **Duration:** 8 min
- **Started:** 2026-04-15T10:58:17Z
- **Completed:** 2026-04-15T11:07:11Z
- **Tasks:** 5
- **Files modified:** 54+

## Accomplishments

- Restructured `docs.json` Guides navigation: removed Integrations and Validation subgroups from Citadel Hub, moved `llm-backend-onboarding` into Features, and flattened troubleshooting pages to the Citadel Hub root
- Fixed cross-references in 8 architecture pages (`/guides/network-approach` → `/guides/ai-landing-zone/network-approach`)
- Fixed cross-references in implementation and getting-started pages (old `/guides/deployment-guide`, `/guides/bicep-modules`, `/guides/troubleshooting`, etc. → `/guides/citadel-hub/...`)
- Fixed internal cross-references in 19 guide pages under `docs/guides/citadel-hub/` and `docs/guides/ai-landing-zone/`
- Validated `docs.json` passes JSON syntax checks and contains no Operations tab

## Task Commits

Each task was committed atomically:

1. **Task 1: Fix cross-references in architecture pages** - `df1dba8` (fix)
2. **Task 2: Fix cross-references in implementation and getting-started pages** - `f073f0f` (fix)
3. **Task 3: Fix internal cross-references within moved guide pages** - `7398a4c` (fix)
4. **Task 4: Remove Operations tab and restructure Guides in docs.json** - `a056bfe` (feat)
5. **Task 5: Validate docs.json structure** - `438d986` (chore)

**Plan metadata:** *pending* (docs)

## Files Created/Modified

- `docs/docs.json` — Restructured Guides navigation, removed redundant subgroups, flattened Citadel Hub structure
- `docs/architecture/layer-1-governance-hub.mdx` — Updated network-approach link
- `docs/architecture/layer-integration.mdx` — Updated network-approach and operations links
- `docs/architecture/citadel-4-layer-model.mdx` — Updated network-approach link
- `docs/architecture/hub-spoke-overview.mdx` — Updated network-approach links
- `docs/architecture/vnet-peering.mdx` — Updated network-approach link
- `docs/architecture/network-topology.mdx` — Updated network-approach link
- `docs/architecture/network-security.mdx` — Updated network-approach link
- `docs/architecture/deployment-patterns.mdx` — Updated network-approach link
- `docs/implementation/index.mdx` — Updated deployment-guide, bicep-modules, troubleshooting, best-practices, validation-checklist, configuration-examples, deployment-checklist links
- `docs/getting-started/quick-start.mdx` — Updated deployment-guide links
- `docs/guides/citadel-hub/**/*.mdx` and `docs/guides/ai-landing-zone/**/*.mdx` — Updated all old internal guide paths to new prefixed locations

## Decisions Made

- **Flattened Citadel Hub navigation:** Removed Integrations and Validation subgroups because those pages live under the Implementation tab (e.g., `implementation/integration/...` and `implementation/validation/...`). Keeping them in Guides created duplicate navigation paths.
- **Preserved Operations subgroup:** The Citadel Hub still contains operational guides (`guides/citadel-hub/operations/...`), so the Operations subgroup was retained.
- **Troubleshooting pages flattened:** `validation-checklist`, `troubleshooting`, and `common-issues` are root-level files in `guides/citadel-hub/`, so they were moved to the root pages array rather than nested in a subgroup.

## Deviations from Plan

None - plan executed exactly as written.

## Issues Encountered

None.

## User Setup Required

None - no external service configuration required.

## Next Phase Readiness

- Phase 21 is complete. The Mintlify documentation navigation is fully restructured with Guides organized into AI Landing Zone and Citadel Hub, the Operations tab is removed, and no broken internal links remain.
- Ready for milestone v1.3 completion and transition.

## Self-Check: PASSED

- [x] SUMMARY.md created at `.planning/phases/21-refactor-operations-docs/21-02-SUMMARY.md`
- [x] All task commits verified in git history (`df1dba8`, `f073f0f`, `7398a4c`, `a056bfe`, `438d986`)
- [x] docs.json is valid JSON and contains no Operations tab
- [x] No broken internal links to old guide paths remain

---
*Phase: 21-refactor-operations-docs*
*Completed: 2026-04-15*
