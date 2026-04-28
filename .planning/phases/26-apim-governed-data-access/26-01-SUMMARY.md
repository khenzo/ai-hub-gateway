---
phase: 26-apim-governed-data-access
plan: "01"
subsystem: data-foundation
tags:
  - apim
  - databricks-sql
  - semantic-endpoint
  - governance
  - policy-fragments
  - adr
dependency_graph:
  requires:
    - 25-01 (semantic-layer.mdx — the endpoint being governed)
    - 24-01 (unity-catalog-governance.mdx — row/column policy context)
  provides:
    - docs/data-foundation/apim-semantic-endpoint.mdx
    - ADR-DF-04 (AI agents route through APIM, not directly to Databricks SQL)
  affects:
    - docs/architecture/layer-1-governance-hub.mdx (semantic endpoint callout added)
    - Phase 27 (Security & Identity Patterns — builds on governed endpoint established here)
    - Phase 28 (Navigation — docs.json wiring for apim-semantic-endpoint.mdx)
tech_stack:
  added: []
  patterns:
    - APIM backend registration for non-LLM endpoints (Databricks SQL REST API)
    - Dedicated data access policy fragment (frag-semantic-usage.xml) vs LLM fragment reuse
    - QPM rate limiting pattern for SQL REST traffic vs TPM for LLM traffic
    - query_count + warehouse_id usage schema for Event Hub emission
key_files:
  created:
    - docs/data-foundation/apim-semantic-endpoint.mdx
  modified:
    - docs/architecture/layer-1-governance-hub.mdx
decisions:
  - "ADR-DF-04: AI agents must never call Databricks SQL directly — three concrete risks (no Entra validation, no usage tracking, no rate limiting)"
  - "Data access policy fragment is architecturally distinct from LLM policy fragments — three structural differences: risk surface (data exfiltration vs token cost overrun), throttling model (QPM vs TPM), failure mode (warehouse cold start vs LLM timeout)"
  - "Semantic endpoint integration attaches at Layer 1 (APIM) — not a fifth Citadel layer; explicit framing prevents fifth-layer creep"
  - "SQL warehouse cold start is an operational consideration, not a Pre-GA callout — addressed with extended backend timeout and keep-alive query patterns"
metrics:
  duration_seconds: 793
  completed_date: "2026-04-28"
  tasks_completed: 2
  tasks_total: 2
  files_created: 1
  files_modified: 1
---

# Phase 26 Plan 01: APIM Governed Data Access Summary

**One-liner:** Citadel APIM governed semantic endpoint pattern — ADR-DF-04, QPM rate limiting with `frag-semantic-usage.xml`, and three-dimension LLM vs data access policy fragment comparison.

## Objective

Close the governance gap between Phase 25's semantic layer and the Citadel enforcement plane by establishing ADR-DF-04 (AI agents route through APIM, not directly to Databricks SQL) and documenting why a dedicated data access policy fragment is architecturally required.

## Tasks Completed

| # | Name | Commit | Key Output |
|---|------|--------|------------|
| 1 | Create apim-semantic-endpoint.mdx | 9af4ab8, 9055c87 | 170-line page: ADR-DF-04, ASCII diagram, policy fragment comparison table, Layer 1 attachment |
| 2 | Surgical update to layer-1-governance-hub.mdx | dd7271c | Note callout with semantic endpoint registration, cross-link to new page |

## Artifacts Produced

### docs/data-foundation/apim-semantic-endpoint.mdx (NEW — 170 lines)

Complete APIM governed data access page covering:

- **Opening Note callout** — explicit Layer 1 attachment, no fifth-layer framing
- **ADR-DF-04** — Three concrete risks of direct agent→SQL calls: (a) no Entra validation, (b) no usage tracking, (c) no rate limiting
- **Governed Semantic Endpoint Pattern** — ASCII architecture diagram with fragment names inline (frag-semantic-entra-auth, rate-limit-by-key, frag-semantic-usage, frag-pii-anonymization)
- **Usage Tracking** — query_count + warehouse_id schema vs token_count + model_id; emits to same Event Hub namespace
- **Rate Limiting** — QPM (queries-per-minute) per subscription key, product-level quota model
- **Policy Fragment Comparison Table** — 7-row structural comparison: traffic unit, throttle metric, risk surface, failure mode, usage schema, PII handling, fragment names
- **SQL Warehouse Cold Start** — 30–90s operational consideration with two mitigation patterns
- **Layer 1 Attachment Table** — Three attachment points: Layer 1 (APIM), Layer 2 (telemetry), Layer 4 (identity, Phase 27)
- **CardGroup** — Semantic Layer, Unity Catalog Governance, Layer 1 Governance Hub

### docs/architecture/layer-1-governance-hub.mdx (MODIFIED)

Added surgical Note callout in new "Data Access: Semantic Endpoint Registration" subsection before Implementation Reference. Content:
- Databricks SQL REST API registers as APIM backend
- Inherits all Layer 1 governance capabilities
- Links to apim-semantic-endpoint for full integration pattern
- Existing page structure fully preserved

## Requirements Satisfied

| Requirement | Status | Evidence |
|-------------|--------|----------|
| DSEC-01 — Governed semantic endpoint pattern (Entra validation, QPM rate limiting, query-count usage tracking) | Complete | Sections: Entra Token Validation, Usage Tracking, Rate Limiting; ASCII diagram with fragment names |
| DSEC-02 — Dedicated data access policy fragment with all three structural differences | Complete | Comparison table rows: risk surface, throttling model, failure mode + dedicated prose for each |

## Deviations from Plan

**1. [Rule 2 - Missing Content] Added semantic-layer cross-link in additional commit**
- Found during: Post-Task-1 verification
- Issue: Plan's `key_links` frontmatter specified a required link from apim-semantic-endpoint → semantic-layer.mdx; initial write added Unity Catalog and Layer 4 cards but not semantic-layer
- Fix: Replaced Layer 4 card (Phase 27 content) with Semantic Layer card; added inline link from opening paragraph to semantic-layer.mdx
- Files modified: docs/data-foundation/apim-semantic-endpoint.mdx
- Commit: 9055c87

No other deviations — plan executed as written.

## Self-Check

**Files exist:**
- [x] docs/data-foundation/apim-semantic-endpoint.mdx — 170 lines
- [x] docs/architecture/layer-1-governance-hub.mdx — updated with callout

**Commits exist:**
- [x] 9af4ab8 — Task 1 (create apim-semantic-endpoint.mdx)
- [x] dd7271c — Task 2 (Layer 1 callout)
- [x] 9055c87 — Deviation fix (semantic-layer cross-links)
