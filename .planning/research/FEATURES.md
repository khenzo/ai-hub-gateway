# Feature Landscape: Enterprise Data Foundation Documentation (v2.0)

**Domain:** Architecture documentation for data engineering + AI governance patterns
**Researched:** 2026-04-27
**Sources:** Project reference materials in `docs/data-foundation/`, existing Citadel architecture docs, Databricks official blog

---

## Table Stakes

Features an architect expects when reading Enterprise Data Foundation documentation. Missing any of these = the section feels incomplete and untrustworthy.

| Feature | Why Expected | Complexity | Dependencies on Existing Content |
|---------|--------------|------------|----------------------------------|
| Shortcut vs mirror decision framework | This is the first question every Fabric architect asks. Without it the OneLake section has no opinionated value. | Medium | None — OneLake is a new section |
| Unity Catalog governance model overview | Architects need to understand compute/governance separation before any ABAC or lineage patterns make sense. | Medium | Cross-links to Layer 4 (Purview) and Layer 3 (Entra) in existing Citadel docs |
| Medallion architecture tier definitions | Bronze/silver/gold is the vocabulary the entire section uses. Must be defined before dbt patterns, lineage, or quality patterns can be introduced. | Low | None — purely new content |
| MetricFlow vs raw SQL for AI agents | The semantic layer reference (`docs/data-foundation/semantic-layer-architecture.md`) directly answers this. This is the flagship ADR of the semantic layer section. | Medium | Cross-links to Agent Factory intelligence-layers.mdx (already references "semantic layer for agent operations") |
| APIM policy design for data endpoints | Citadel is the existing gateway. Architects must see how APIM fronts semantic endpoints or the data foundation never connects to the existing architecture. | High | Hard dependency: requires Layer 1 (Governance Hub), Layer 2 (Control Plane) Citadel docs |
| Entra Managed Identity for data access | PII propagation starts here. Every other security pattern in the section inherits from this. | Medium | Cross-links to Layer 4 Security Fabric and Layer 3 Agent Identity |
| OneLake unified namespace concept | Zero-copy architecture is the fundamental premise. Without this framing, shortcut vs mirror, and the ADLS/DFS/Table API surface don't cohere. | Low | None |
| dbt-to-Unity Catalog lineage flow | `persist_docs` surfacing column descriptions into UC is a key governance pattern that connects the dbt and Unity Catalog sections. | Medium | Internal dependency: requires Unity Catalog section to be read first |

---

## Differentiators

Features that go beyond what an architect can find in vendor docs, and that are specific to this platform's integration story.

| Feature | Value Proposition | Complexity | Dependency |
|---------|-------------------|------------|------------|
| Citadel-to-semantic-layer integration pattern | Nowhere in the Databricks or Microsoft docs is there a pattern showing APIM Gateway fronting a MetricFlow/Business Semantics endpoint with policy enforcement. This is the unique integration thesis of this milestone. | High | Requires APIM policy section + semantic layer section to be complete first |
| Shortcut transformation as medallion substitute | Shortcut transformations (CSV-to-Delta, format conversion) can eliminate bronze-layer pipeline steps. This is a design option most architects miss. | Medium | None |
| Unity Catalog Open API + OneLake bidirectional pattern | The November 2025 announcement (expanding-onelake-unity-catalog.md) documents that OneLake now supports the Unity Catalog Open API standard. This bidirectional federation story is new and not yet widely understood. | Medium | None |
| Entra MI chain through APIM to semantic endpoint | The full identity propagation pattern — agent identity (Entra MI) → APIM subscription key + MI token → Databricks SQL endpoint → Unity Catalog ABAC — does not exist as a documented pattern anywhere. | High | Hard dependency: Citadel Layer 3 (Agent Identity) and Layer 4 (Security Fabric) |
| Core/edge semantic model governance design | The Databricks blog articulates core (certified enterprise metrics) vs edge (per-team, per-agent) semantic model structure. Documenting this in the context of Citadel-governed AI agents is differentiated content. | Medium | Requires semantic layer section |
| Query tag cost attribution for dbt pipelines | Attaching business context to dbt runs and tracking spend by team through System Tables is a governance pattern most docs treat as an afterthought. It fits naturally as a cost governance ADR. | Low | Requires Unity Catalog section |
| Lakeflow as unified orchestration plane | Lakeflow Jobs treating dbt as a first-class task type (removing the external orchestrator) is a simplification pattern worth documenting as an ADR against "dbt Cloud + separate scheduler" alternatives. | Medium | None |

---

## Anti-Features

Features to explicitly NOT build for this milestone. The audience is architects. The constraint is no code.

| Anti-Feature | Why Avoid | What to Do Instead |
|--------------|-----------|-------------------|
| Step-by-step connection setup (Databricks secrets, client credentials, token acquisition) | The `integrate-onelake-azure-databricks.md` source file is a developer how-to with Python code. This is out of scope per project constraints. | Reference the Microsoft Learn URL; describe the pattern (Entra MI token → ADLS DFS endpoint) architecturally without code |
| Spark notebook patterns as medallion alternative | Spark notebooks are a valid Databricks workflow, but the project has already established that dbt on Databricks is the recommended path. Documenting notebook-based medallion as equal would undermine the ADR. | Document notebook-based patterns only in the "Alternatives Considered" sidebar of the dbt ADR |
| Benchmarking tables (Photon 12x speedup, 20x query improvement) | These figures from the dbt-on-Databricks source are marketing claims without context. Including them in architecture documentation undermines credibility with architects. | Reference performance characteristics qualitatively ("Photon provides vectorized execution; Predictive Optimization automates table maintenance") |
| Multi-cloud data foundation patterns | AWS S3, GCP BigQuery, and cross-cloud federation are explicitly out of scope per PROJECT.md. | Acknowledge that OneLake shortcuts support S3/GCS, but frame it as hybrid/migration pattern only — not a first-class architecture option |
| Pricing/cost calculator content | PROJECT.md explicitly excludes pricing. | Reference architectural cost drivers (shortcut storage = no data copy = reduced egress costs) as design principles, not numbers |
| Implementation runbooks for Data Factory pipelines | Data Factory ETL is the legacy path OneLake shortcuts are designed to replace. Documenting both equally would create confusion. | Position shortcuts/mirroring as the recommended path; mention Data Factory only as the "from-state" in migration context |
| Detailed DAX/LookML/MDX comparisons | The semantic layer source material contextualizes these as historical alternatives. Extensive treatment would distract from the platform-native recommendation. | Use the Modern vs Traditional table from the source material; limit to one ADR section |

---

## Feature Dependencies

These are ordering constraints that must be respected within the documentation section and across the milestone phases.

```
OneLake Unified Namespace Concept
  → Shortcut vs Mirror ADR (can't discuss without namespace framing)
  → OneLake Security Model (security roles require namespace understanding)
  → OneLake Catalog Governance (catalog discovers items within the namespace)

Unity Catalog Governance Model
  → ABAC Design Patterns (ABAC requires understanding of securable objects)
  → Column Masks + Row Filters (fine-grained controls build on the base model)
  → dbt-to-UC Lineage (persist_docs requires UC to exist conceptually first)
  → Catalog Federation via Open API (federation extends the base model)

Medallion Architecture Tier Definitions (Bronze/Silver/Gold)
  → dbt Model Patterns (dbt materializations map to medallion tiers)
  → Lakeflow Orchestration (pipelines span tiers; requires tier definitions)
  → Metadata-Driven Lineage (lineage traces data across tiers)

Semantic Layer Concepts (Dimensions, Measures, Joins, Filters)
  → Platform-Native vs Tool-Bound Semantics ADR
  → MetricFlow vs Raw SQL for AI Agents ADR
  → Agent Grounding Pattern (agents must understand available metrics before querying)
  → Core/Edge Model Governance

APIM Policy Design (existing Citadel docs)
  → APIM-to-Semantic-Endpoint Governed Access Pattern [NEW DEPENDENCY]

Entra Identity Model (existing Layer 3/4 Citadel docs)
  → Entra MI for Databricks access [NEW DEPENDENCY]
  → PII Propagation Pattern [NEW DEPENDENCY]
```

**Key cross-section dependencies (must be sequenced in phases):**
- Semantic layer section cannot be written before Unity Catalog section (policy inheritance context)
- APIM integration section cannot be written before both Unity Catalog AND semantic layer sections
- Security/Identity section can be written in parallel with Unity Catalog, but must cross-reference it

---

## ADR Scoping (Key Decisions Architects Need)

These are the architectural decision records this milestone must produce or document the rationale for.

### ADR-DF-01: OneLake Shortcut vs Mirroring

**Decision question:** When does an architect choose a OneLake shortcut vs mirroring for Databricks Unity Catalog data?

**Recommended answer (from source materials):**
- Use **shortcut** when source data is already in open format (ADLS, Delta Lake, Iceberg). Zero metadata overhead. No replication.
- Use **mirroring** when source uses a closed storage system (Azure SQL, Cosmos DB, operational databases) or when you need CDC synchronization.
- For **Databricks Unity Catalog specifically**: mirroring automatically creates shortcuts for Delta/Iceberg tables (no replication occurs). The "Databricks Catalog" mirroring option is GA as of late 2025.
- Mirroring to OneLake from Databricks is the recommended path when Fabric workloads need to consume Citadel-governed AI outputs stored in Unity Catalog.

**Complexity:** Medium. The decision tree is simple once the format-vs-catalog distinction is clear.

### ADR-DF-02: dbt vs Spark Notebooks for Medallion Transformation

**Decision question:** When does an architect recommend dbt on Databricks vs Spark notebook-based transformation for the medallion layers?

**Recommended answer:**
- Use **dbt** when: transformation logic must be version-controlled, tested, and documented; when governance (column descriptions via persist_docs, schema-level grants) must flow to Unity Catalog automatically; when Lakeflow unified orchestration is desired.
- Use **Spark notebooks** when: schema-on-read is required for unstructured bronze ingestion; when streaming tables with Auto Loader are the ingest pattern; when transformation logic is deeply Spark-native (complex window functions, streaming joins).
- In practice: dbt owns silver and gold tiers; Spark/Auto Loader owns bronze ingestion. This is not either/or.

**Complexity:** Medium. The hybrid nature is the key insight. Positioning it as a choice rather than a spectrum is the common mistake.

### ADR-DF-03: MetricFlow (Platform-Native Semantic Layer) vs Raw SQL for AI Agents

**Decision question:** Should AI agents query raw Unity Catalog tables via generated SQL, or query through MetricFlow/Business Semantics governed metric views?

**Recommended answer:** MetricFlow (platform-native) is mandatory for production AI agents that produce auditable analytics output. Pure text-to-SQL against raw tables produces results that are inconsistent across agents, ungoverned, and not auditable. The semantic layer approach inverts this: the agent generates queries against governed metric definitions, not raw tables. Filters, joins, and access controls travel with the metric definition. The same metric definition serves dashboards, notebooks, and AI agents.

Text-to-SQL is acceptable only for: exploratory data science workloads in notebooks, development/testing environments, and cases where the query is bounded and verified by a human before action.

**Complexity:** Low to articulate, High to implement (requires semantic model authoring investment). Document the "start small" principle from the source material.

### ADR-DF-04: Citadel APIM as Gateway for Semantic Endpoints

**Decision question:** How does the existing Citadel APIM governance layer extend to front semantic data endpoints?

**Recommended answer:** APIM policy fragments enforce: (1) Entra MI token validation before any semantic endpoint call, (2) subscription-key-based attribution for cost tracking per agent/team, (3) rate limiting to prevent runaway agent query costs, (4) response caching for common metric reads. The semantic endpoint (Databricks SQL warehouse exposed via REST) sits behind APIM as a backend service. Agents never call Databricks directly — all calls route through Citadel. This is the architectural extension that connects the data foundation to the existing 4-layer Citadel model.

**Complexity:** High. This is the most novel pattern in the milestone and requires the most careful design. It should be documented as an integration pattern with an explicit call-out that it extends the existing Citadel architecture.

---

## MVP Recommendation

Prioritize for first documentation pass (most value, clearest source material):

1. **OneLake Unified Namespace + Shortcut vs Mirror ADR** — Source material is comprehensive; decision tree is clear; no dependency on other new sections.
2. **Medallion Architecture Tier Definitions** — Vocabulary prerequisite for everything else. Short page, high leverage.
3. **Unity Catalog Governance Model** — ABAC, column masks, row filters, schema-level grants, lineage. Required before semantic layer and APIM sections.
4. **MetricFlow vs Raw SQL ADR (Semantic Layer)** — The flagship ADR. Source material from `semantic-layer-architecture.md` is excellent and publication-ready.
5. **dbt Medallion Patterns + Lakeflow Orchestration** — Source material from `open-platform-dbt-databricks.md` is comprehensive.

Defer to second pass (higher complexity, more integration surface):

- **APIM Governed Data Access Patterns** — Requires alignment with existing Citadel policy fragment documentation. Most novel, highest risk of needing revision.
- **Entra MI + PII Propagation** — Requires careful cross-referencing with Layer 4 Security Fabric docs to avoid duplication.
- **Core/Edge Semantic Model Governance** — Advanced topic; better as a "deep dive" addendum after the core semantic layer page is published.

---

## Complexity Assessment by Section

| Section | Articulation Complexity | Source Material Quality | Integration Complexity | Notes |
|---------|------------------------|------------------------|----------------------|-------|
| OneLake Namespace + Shortcuts | Low | High | Low | Source covers all dimensions; just needs architect framing |
| Shortcut vs Mirror ADR | Medium | High | Low | Decision tree is clear from sources |
| Shortcut Transformations | Low | High | Low | Useful differentiator; don't over-document |
| Unity Catalog ABAC | Medium | Medium | Medium | Need to bridge from source material to Citadel Security Fabric cross-link |
| Unity Catalog Lineage | Low | High | Low | Column-level lineage from dbt source is well-documented |
| Catalog Federation / Open API | Medium | High | Low | Nov 2025 announcement is the key source |
| Medallion Tier Definitions | Low | High | Low | Standard industry pattern; brief page |
| dbt Patterns (Silver/Gold) | Medium | High | Low | Source material comprehensive |
| Lakeflow Orchestration ADR | Medium | High | Low | "dbt as first-class task type" is the key framing |
| MetricFlow vs Raw SQL | Medium | High | Low | Source material directly answers the question |
| Platform-Native vs Tool-Bound | Low | High | Low | Comparison table from source is publishable |
| Agent Grounding Pattern | Medium | High | Medium | Must connect to Agent Factory intelligence-layers.mdx |
| Core/Edge Model Governance | Medium | Medium | Low | Well-described in source; secondary priority |
| APIM Semantic Endpoint | High | Low | High | No direct source material; must be synthesized from Citadel + semantic layer concepts |
| Entra MI Data Access Chain | High | Medium | High | Partial source in integrate-onelake-azure-databricks.md; needs architectural synthesis |
| PII Propagation Pattern | High | Low | High | No direct source; must be inferred from Unity Catalog column masking + Purview integration |

---

## Sources

- `docs/data-foundation/semantic-layer-architecture.md` — Databricks Blog, April 2026. Platform-native semantic layer architecture, AI agent integration patterns, MetricFlow design principles. HIGH confidence.
- `docs/data-foundation/microsoft-onelake-unified-data-lake.md` — ITNEXT / Azure MVP, April 2026. OneLake shortcuts, mirroring, shortcut transformations, OneLake catalog, security model. MEDIUM confidence (community article, verified against Microsoft Learn URLs cited within).
- `docs/data-foundation/expanding-onelake-unity-catalog.md` — Databricks Blog, November 2025. Unity Catalog Open API integration with OneLake, bidirectional federation, catalog federation standard. HIGH confidence (official Databricks announcement).
- `docs/data-foundation/open-platform-dbt-databricks.md` — Databricks Blog, April 2026. dbt on Databricks: open foundations, Lakeflow orchestration, Unity Catalog governance, Predictive Optimization. HIGH confidence.
- `docs/data-foundation/integrate-onelake-azure-databricks.md` — Microsoft Learn official documentation, April 2026. Databricks serverless connectivity to OneLake, Entra SP token flow, DFS endpoint pattern. HIGH confidence (official Microsoft source). Note: contains code; for pattern extraction only.
- `docs/architecture/` (existing Citadel docs) — Integration dependency surface for APIM policy, Layer 3 Agent Identity, Layer 4 Security Fabric cross-links.
- `docs/agent-factory/intelligence-layers.mdx` — Existing doc establishing "semantic layer for agent operations" as a concept; must be cross-linked from new semantic layer section.
