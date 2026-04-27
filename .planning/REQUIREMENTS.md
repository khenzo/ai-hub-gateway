# Requirements: v2.0 — Enterprise Data Foundation

**Defined:** 2026-04-27
**Core Value:** Enable organizations to deploy enterprise-grade AI infrastructure with confidence

## v2.0 Requirements

### OneLake Universal Storage (LAKE)

- [ ] **LAKE-01**: User can understand when to use OneLake shortcuts vs mirroring — decision criteria, security enforcement surface differences, and when each pattern applies
- [ ] **LAKE-02**: User can understand how OneLake provides a universal storage namespace connecting ADLS, Dataverse, and SharePoint sources without data movement
- [ ] **LAKE-03**: User can understand how OneLake enforces uniform table-, row-, and column-level security across all compute engines reading the same Delta/Iceberg files

### Databricks + Unity Catalog (UCAT)

- [x] **UCAT-01**: User can understand how Unity Catalog separates compute from governance — lineage, column masks, and row filters persist across table rebuilds and cluster changes
- [x] **UCAT-02**: User can understand the Unity Catalog ABAC design pattern — attribute-based access control using tags and conditions that scales across teams and schemas
- [x] **UCAT-03**: User can understand the three-level namespace (catalog.schema.table) as the governance contract layer between raw storage and downstream consumers
- [x] **UCAT-04**: User can understand the Unity Catalog Open API + Iceberg REST Catalog integration with OneLake, including its Public Preview status and the currently-GA baseline path

### dbt Medallion Architecture (MEDA)

- [ ] **MEDA-01**: User can understand the Bronze/Silver/Gold medallion tier patterns — what belongs in each layer, naming conventions, and data promotion criteria
- [ ] **MEDA-02**: User can understand the Lakeflow Jobs orchestration pattern — why dbt as a first-class task type replaces external orchestrators (Beta callout included)
- [ ] **MEDA-03**: User can understand how persist_docs writes dbt YAML descriptions directly into Unity Catalog — single source of documentation truth across transformation and governance layers

### Semantic Layer (SEML)

- [x] **SEML-01**: User can understand why platform-native semantics (MetricFlow + Unity Catalog Business Semantics as complementary layers) are required vs tool-embedded semantics — flagship ADR of the milestone
- [x] **SEML-02**: User can understand how AI agents query the semantic layer instead of raw tables — grounding vs text-to-SQL distinction; semantic layer is required, not optional, for production AI agents
- [x] **SEML-03**: User can understand the author-once-reuse-everywhere principle — a single metric definition serving dashboards, notebooks, and AI agents from a governed source
- [x] **SEML-04**: User can understand Core vs Edge semantic model — enterprise-wide certified metrics (core) vs team-specific enrichment (edge) with a promotion path back to core

### APIM Integration & Security (DSEC)

- [ ] **DSEC-01**: User can understand how Citadel APIM fronts the Databricks SQL REST API semantic endpoint — Entra token validation, usage tracking, and rate limiting (governed semantic endpoint pattern)
- [ ] **DSEC-02**: User can understand why a dedicated data access policy fragment is needed vs reusing LLM policy fragments — different risk surface, different throttling model
- [ ] **DSEC-03**: User can understand the Entra Managed Identity chain for agent→APIM→Databricks SQL→OneLake — zero secrets in Key Vault for the data path
- [ ] **DSEC-04**: User can understand how Unity Catalog column masks propagate through the APIM PII policy to AI agent responses — governance by construction, not procedural enforcement

### Navigation (DNAV)

- [ ] **DNAV-01**: Data Foundation documentation section exists in docs.json as a new tab with all content pages wired and existing Citadel pages cross-linked into the new section

## Future Requirements

*(None defined for v2.1 at this time)*

## Out of Scope

| Feature | Reason |
|---------|--------|
| Any IaC code (Bicep, Terraform) | v2.0 is patterns and ADRs only — no implementation artifacts |
| dbt model code / YAML snippets | No code deliverables; document patterns not implementations |
| GitHub Actions pipeline YAML | No code deliverables |
| SAP Datasphere mirroring | Public preview — defer to v2.1 |
| Snowflake bidirectional integration | Not in current Azure Landing Zone topology |
| Power BI Direct Lake setup | BI layer separate from agentic data layer |
| Multi-region OneLake replication | Single-region pattern for v2.0 |
| Real-time streaming ingestion (Event Hub → Delta) | Batch-first for v2.0 |
| Custom ML model training pipelines | Covered by Azure ML / Foundry layer separately |
| OneLake identity delegation ADR (DirectLake governance gap) | Deferred — specialist edge case for v2.1 |
| Auto Loader / dbt division of labour ADR | Implicit in MEDA tier definitions — separate ADR deferred |

## Traceability

Which phases cover which requirements. Updated during roadmap creation.

| Requirement | Phase | Status |
|-------------|-------|--------|
| LAKE-01 | Phase 23 | Pending |
| LAKE-02 | Phase 23 | Pending |
| LAKE-03 | Phase 23 | Pending |
| UCAT-01 | Phase 24 | Complete |
| UCAT-02 | Phase 24 | Complete |
| UCAT-03 | Phase 24 | Complete |
| UCAT-04 | Phase 24 | Complete |
| MEDA-01 | Phase 25 | Pending |
| MEDA-02 | Phase 25 | Pending |
| MEDA-03 | Phase 25 | Pending |
| SEML-01 | Phase 25 | Complete |
| SEML-02 | Phase 25 | Complete |
| SEML-03 | Phase 25 | Complete |
| SEML-04 | Phase 25 | Complete |
| DSEC-01 | Phase 27 | Pending |
| DSEC-02 | Phase 27 | Pending |
| DSEC-03 | Phase 28 | Pending |
| DSEC-04 | Phase 28 | Pending |
| DNAV-01 | Phase 29 | Pending |

**Coverage:**
- v2.0 requirements: 19 total
- Mapped to phases: 19
- Unmapped: 0 ✓

---
*Requirements defined: 2026-04-27*
*Last updated: 2026-04-27 after initial definition*
