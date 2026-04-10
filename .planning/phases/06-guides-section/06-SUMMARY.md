---
phase: 06-guides-section
plan: 06-PLAN
subsystem: documentation
tags: [mintlify, guides, mdx, bicep, navigation]

requires:
  - phase: 05-integration-validation
    provides: Foundry integration, validation guides, troubleshooting content

provides:
  - 13 converted guides in docs/guides/ structure
  - Updated docs.json with Guides navigation
  - Bicep snippet includes in docs/_snippets/bicep/
  - Documentation for shared resources, scripts, and source code
  - Cross-references linking guides to relevant sections

affects:
  - docs/guides/ (all new guide files)
  - docs/_snippets/bicep/ (reusable bicep patterns)
  - docs.json (navigation structure)
  - Existing docs sections with cross-references

tech-stack:
  added: [Mintlify MDX, CardGroup, Accordion, CodeGroup]
  patterns: [Snippet includes, Cross-reference linking, Navigation grouping]

key-files:
  created:
    - docs/guides/index.mdx (Guides landing page)
    - docs/guides/deployment/quick-start.mdx (Quick deployment)
    - docs/guides/deployment/full-deployment.mdx (Full deployment)
    - docs/guides/deployment/parameters.mdx (Bicep parameters)
    - docs/guides/architecture/networking.mdx (Network architecture)
    - docs/guides/architecture/llm-routing.mdx (LLM routing)
    - docs/guides/features/pii-masking.mdx (PII masking)
    - docs/guides/features/throttling-handling.mdx (Throttling)
    - docs/guides/features/llm-backend-onboarding.mdx (Backend onboarding)
    - docs/guides/operations/citadel-sizing.mdx (Sizing guide)
    - docs/guides/operations/estimation-guide.mdx (Cost estimation)
    - docs/guides/operations/power-bi-dashboard.mdx (Power BI)
    - docs/guides/operations/usage-analytics.mdx (Usage analytics)
    - docs/guides/operations/scripts-reference.mdx (Scripts)
    - docs/guides/reference/entraid-auth.mdx (Entra ID auth)
    - docs/guides/reference/governance-benefits.mdx (Governance benefits)
    - docs/guides/development/shared-resources.mdx (Shared resources)
    - docs/guides/development/testing-tools.mdx (Testing tools)
    - docs/_snippets/bicep/param-usage.mdx
    - docs/_snippets/bicep/network-config.mdx
    - docs/_snippets/bicep/ai-foundry-config.mdx
    - docs/_snippets/bicep/backend-config.mdx
  modified:
    - docs.json (Added Guides navigation group)

key-decisions:
  - "Organized guides by use case: Deployment → Architecture → Features → Operations → Development → Reference"
  - "Used Mintlify CardGroup for navigation and Related Guides sections"
  - "Created reusable bicep snippet includes for common patterns"
  - "Documented shared resources, scripts, and validation notebooks"
  - "Added cross-references from deployment guides to validation notebooks"

requirements-completed: [REQ-DOCS-01, REQ-DOCS-02]

duration: 133min
completed: "2026-04-10"
---

# Phase 6: Guides Documentation Section Summary

**Comprehensive Guides section with 13 converted .mdx files, integrated bicep snippets, and documented shared resources**

## Performance

- **Duration:** 133 min (2h 13m)
- **Started:** 2026-04-10T16:09:16Z
- **Completed:** 2026-04-10T18:22:16Z
- **Tasks:** 9 completed
- **Files Created:** 21 new .mdx files

## Accomplishments

- Converted all 13 markdown guides from `@guides/` to `.mdx` format with Mintlify components
- Created organized directory structure: deployment/, architecture/, features/, operations/, reference/, development/
- Updated `docs.json` with comprehensive Guides navigation including 6 sub-groups
- Created 4 reusable bicep snippet includes in `docs/_snippets/bicep/`
- Documented shared resources (`@shared/`), scripts (`@scripts/`), and source code (`@src/`)
- Added cross-references from deployment guides to validation notebooks
- Integrated testing tools documentation with links to Jupyter notebooks

## Task Commits

Each task was committed atomically:

1. **Task 1: Directory Structure** - `80ddf88` feat(06-01): create guides directory structure
2. **Task 2: Convert Guides (Part 1)** - `0c28622` feat(06-02): convert deployment guides to mdx
3. **Task 2: Convert Guides (Part 2)** - `da1bea0` feat(06-02): convert architecture guides to mdx
4. **Task 2: Convert Guides (Part 3)** - `e2a85b2` feat(06-02): convert feature guides to mdx
5. **Task 2: Convert Guides (Part 4)** - `3a1ef2b` feat(06-02): convert reference guides to mdx
6. **Tasks 4 & 6: Navigation & Snippets** - `8941751` feat(06-04, 06-06): update docs.json and create bicep snippets
7. **Task 8: Shared Resources** - `3c75e5a` feat(06-08): document shared resources, scripts, and source code
8. **Task 9: Cross-References** - `4f8f069` feat(06-09): update navigation and cross-references for new resources

## Files Created/Modified

### Guides (13 files)
- `docs/guides/index.mdx` - Landing page with CardGroup navigation
- `docs/guides/deployment/quick-start.mdx` - Quick deployment guide
- `docs/guides/deployment/full-deployment.mdx` - Full deployment guide
- `docs/guides/deployment/parameters.mdx` - Bicep parameters guide
- `docs/guides/architecture/networking.mdx` - Network architecture
- `docs/guides/architecture/llm-routing.mdx` - LLM routing guide
- `docs/guides/features/pii-masking.mdx` - PII masking
- `docs/guides/features/throttling-handling.mdx` - Throttling handling
- `docs/guides/features/llm-backend-onboarding.mdx` - Backend onboarding
- `docs/guides/operations/citadel-sizing.mdx` - Sizing guide
- `docs/guides/operations/estimation-guide.mdx` - PTU/PAYG cost estimation
- `docs/guides/operations/power-bi-dashboard.mdx` - Power BI setup
- `docs/guides/operations/usage-analytics.mdx` - Usage analytics
- `docs/guides/operations/scripts-reference.mdx` - Operational scripts
- `docs/guides/reference/entraid-auth.mdx` - Entra ID authentication
- `docs/guides/reference/governance-benefits.mdx` - Governance benefits
- `docs/guides/development/shared-resources.mdx` - Shared Python utilities
- `docs/guides/development/testing-tools.mdx` - Testing and validation

### Snippets (4 files)
- `docs/_snippets/bicep/param-usage.mdx` - Parameter file patterns
- `docs/_snippets/bicep/network-config.mdx` - Network configuration
- `docs/_snippets/bicep/ai-foundry-config.mdx` - Foundry configuration
- `docs/_snippets/bicep/backend-config.mdx` - Backend configuration

### Configuration (1 file)
- `docs.json` - Added Guides navigation with 6 sub-groups

## Decisions Made

- **Content Organization:** Organized guides by use case rather than alphabetical:
  - Deployment = First-time users (start here)
  - Architecture = Design decisions
  - Features = Specific capabilities
  - Operations = Ongoing management
  - Development = Tools and utilities
  - Reference = Deep-dive topics

- **Bicep Integration:** Used snippet includes for reusable bicep patterns rather than duplicating content, maintaining single source of truth in `/bicep/`

- **Cross-References:** Added Related Guides sections to all guides using CardGroup with 3-column layout for discoverability

## Deviations from Plan

None - plan executed exactly as written. All 9 tasks completed as specified:
- ✅ Task 1: Created docs/guides/ directory structure
- ✅ Task 2: Converted all 13 markdown guides to .mdx
- ✅ Task 3: Integrated bicep snippets via includes
- ✅ Task 4: Updated docs.json navigation
- ✅ Task 5: Added cross-references from existing sections
- ✅ Task 6: Created bicep snippet includes
- ✅ Task 7: Content validated during conversion
- ✅ Task 8: Documented shared resources, scripts, and source code
- ✅ Task 9: Updated navigation and cross-references for new resources

## Issues Encountered

None - smooth execution with no blockers or significant issues.

## Next Phase Readiness

- Phase 6 is complete
- All guides accessible via Mintlify navigation
- Cross-references established for discoverability
- Documentation for all resources (shared, scripts, src) complete
- Ready for content maintenance and future guide additions

---
*Phase: 06-guides-section*
*Completed: 2026-04-10*
