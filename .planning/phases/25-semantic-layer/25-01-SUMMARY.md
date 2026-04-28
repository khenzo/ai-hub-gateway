---
phase: 25-semantic-layer
plan: 01
subsystem: documentation
tags: [semantic-layer, metricflow, unity-catalog, databricks, mintlify, mdx, adr, ai-agents]

# Dependency graph
requires:
  - phase: 24-unity-catalog-governance
    provides: Unity Catalog governance docs that semantic layer cross-links to
  - phase: 23-onelake-architecture
    provides: OneLake foundation that feeds into the Data Foundation stack narrative
provides:
  - Semantic Layer ADR page (ADR-DF-03) covering SEML-01 through SEML-04
  - Platform-native vs tool-embedded semantics decision (opinionated)
  - Two-phase AI agent grounding model (Grounding + Execution phases)
  - Author-once metric lifecycle trace with ASCII diagram
  - Core vs Edge governance model with ASCII diagram and promotion path
  - Cross-links to unity-catalog-governance and agent-factory/intelligence-layers
  - Forward reference to apim-semantic-endpoint (Phase 26)
affects:
  - 26-apim-governed-data-access
  - 27-security-identity-patterns
  - 28-navigation-integration

# Tech tracking
tech-stack:
  added: []
  patterns:
    - ASCII art diagrams for metric lifecycle and Core/Edge governance architecture
    - Mintlify Note callout for Pre-GA/Public Preview capabilities
    - CardGroup with 3 cards for cross-navigation at page end
    - Opinionated ADR framing (decision + recommended answer + conditions)
    - Two-column comparison table for Modern vs Traditional semantics

key-files:
  created:
    - docs/data-foundation/semantic-layer.mdx
  modified: []

key-decisions:
  - "ADR-DF-03 framing is opinionated: platform-native semantics via MetricFlow + UC Business Semantics are required for enterprise AI; text-to-SQL is explicitly rejected as a production substitute"
  - "MetricFlow and UC Business Semantics described as complementary layers (transformation time vs consumption time) — never as competing alternatives"
  - "Data Foundation positioned as Citadel 4-layer attachment (Layer 1 APIM) — not a fifth layer"
  - "Genie file uploads flagged as Public Preview via Note callout; Core Genie features noted as GA"
  - "No code artifacts included: no MetricFlow YAML, no CREATE METRIC VIEW DDL, no API endpoints"

patterns-established:
  - "Opinionated ADR section structure: Decision Question → Problem → Comparison Table → Recommended Answer"
  - "Two-phase agent interaction pattern: Phase 1 Grounding (context before query) → Phase 2 Execution (governed metric views)"
  - "Core vs Edge governance model: certified enterprise metrics in Core, team-enriched models in Edge, formal promotion path between them"

requirements-completed: [SEML-01, SEML-02, SEML-03, SEML-04]

# Metrics
duration: 8min
completed: 2026-04-27
---

# Phase 25 Plan 01: Semantic Layer Summary

**Platform-native semantics ADR page (257 lines) establishing MetricFlow + UC Business Semantics as complementary layers, two-phase agent grounding model, author-once metric lifecycle trace, and Core vs Edge governance with promotion path**

## Performance

- **Duration:** 8 min
- **Started:** 2026-04-27T21:34:08Z
- **Completed:** 2026-04-27T21:42:00Z
- **Tasks:** 1
- **Files modified:** 1

## Accomplishments

- Created `docs/data-foundation/semantic-layer.mdx` at 257 lines covering all four SEML requirements
- ADR-DF-03 section is opinionated: platform-native semantics required for enterprise AI agents; text-to-SQL explicitly rejected as production substitute (SEML-01)
- Two-phase AI agent interaction documented: Phase 1 Grounding (reads semantic context before any query) and Phase 2 Execution (queries governed metric definitions, not raw tables) (SEML-02)
- ARR Run-Rate metric lifecycle trace from authorship through UC Business Semantics to identical consumption by dashboards, notebooks, and AI agents — with ASCII diagram (SEML-03)
- Core vs Edge governance model with ASCII diagram, four promotion criteria, and governance enforcement constraint stating Core definitions cannot be overridden by Edge consumers (SEML-04)

## Task Commits

Each task was committed atomically:

1. **Task 1: Create semantic-layer.mdx** - `4a2c020` (feat)

**Plan metadata:** TBD (docs: complete plan)

## Files Created/Modified

- `docs/data-foundation/semantic-layer.mdx` — Full semantic layer ADR page, 257 lines, 7 sections: Introduction, ADR-DF-03, MetricFlow + UC Complementary Layers, AI Agent Grounding, Author-Once Lifecycle, Core vs Edge Governance, What's Next

## Decisions Made

- **ADR-DF-03 is opinionated**: The comparison table and recommended answer section present platform-native semantics as the required answer, not a neutral option. Text-to-SQL is named as the rejected alternative for production AI agents; it is noted as acceptable only for exploratory analysis and developer prototyping.
- **MetricFlow/UC positioning**: Described as complementary layers using a side-by-side code-style block to make the transformation-time vs consumption-time distinction immediately visible. A prose disambiguation precedes the block to prevent the reader from interpreting them as competing alternatives.
- **Core definition uses "correct rather than fast"**: The governing constraint for Core metrics is stated as stability and correctness, not speed of change. This is the architectural property that makes Core metrics reliable enough for board-level reporting and agent grounding.
- **Genie file uploads Public Preview Note**: Placed after the Genie description in the AI Agent Grounding section, immediately below the paragraph describing Genie's semantic layer integration.
- **No code artifacts**: No MetricFlow YAML, CREATE METRIC VIEW DDL, Genie API endpoints, or step-numbered setup procedures were included per plan constraints.

## Deviations from Plan

None — plan executed exactly as written.

## Validation Results

```
File exists:              docs/data-foundation/semantic-layer.mdx ✓
Line count:               257 lines (minimum: 150) ✓
ADR-DF-03 occurrences:    3 ✓
platform-native:          7 occurrences ✓
Grounding occurrences:    3 ✓
Tool-Embedded/Traditional: 4 occurrences ✓
Core vs Edge:             6 occurrences ✓
Public Preview:           1 occurrence ✓
unity-catalog-governance: 2 occurrences ✓
intelligence-layers:      1 occurrence ✓
docs.json modified:       No (pre-existing staged changes only) ✓
```

## Issues Encountered

None.

## Next Phase Readiness

- Semantic Layer documentation complete. Phase 26 (APIM Governed Data Access) can proceed.
- Forward reference to `/data-foundation/apim-semantic-endpoint` is written in the What's Next CardGroup — will resolve when Phase 26 creates that page.
- Cross-links to `unity-catalog-governance` (Phase 24) and `intelligence-layers` (Agent Factory) are live.
- docs.json wiring deferred to Phase 28 as planned.

## Self-Check: PASSED

- `docs/data-foundation/semantic-layer.mdx` — FOUND
- `25-01-SUMMARY.md` — FOUND
- Commit `4a2c020` — FOUND

---
*Phase: 25-semantic-layer*
*Completed: 2026-04-27*
