# Architecture Patterns: Enterprise Data Foundation (v2.0)

**Domain:** Adding Enterprise Data Foundation documentation to existing SOF1A 2.0 Mintlify site
**Researched:** 2026-04-27
**Mode:** Ecosystem — how the new data layer integrates with existing Citadel 4-layer architecture

---

## Recommended Architecture

The Enterprise Data Foundation is not a fifth layer in the Citadel model. It is a **substrate** that sits beneath all four layers and integrates at three specific attachment points. The integration thesis is: governed data surfaces from OneLake + Unity Catalog + dbt medallion + semantic layer are exposed through the existing Citadel APIM Gateway, observable through the existing Event Hub → Log Analytics stack, and secured through the existing Entra + Purview fabric.

```
┌─────────────────────────────────────────────────────────────────┐
│  Layer 4: Security Fabric  (Defender · Purview · Entra)         │
│   ↑ Integration Point 3: Entra MI auth · Purview label          │
│   ↑ propagation · Private Endpoints on hub VNet                 │
├─────────────────────────────────────────────────────────────────┤
│  Layer 3: Agent Identity (Agent 365)                            │
│   [No direct data foundation integration — passes through L4]   │
├─────────────────────────────────────────────────────────────────┤
│  Layer 2: AI Control Plane (Event Hub → Log Analytics)          │
│   ↑ Integration Point 2: dbt pipeline health · Unity Catalog    │
│   ↑ lineage events · OneLake freshness checks stream in         │
├─────────────────────────────────────────────────────────────────┤
│  Layer 1: Governance Hub (APIM)                                 │
│   ↑ Integration Point 1: Semantic endpoints as governed APIM    │
│   ↑ products · Entra token validation · usage tracking ·        │
│   ↑ rate limiting · PII masking policy fragments                │
└─────────────────────────────────────────────────────────────────┘
                    ↑  ↑  ↑
┌─────────────────────────────────────────────────────────────────┐
│  Enterprise Data Foundation (the grounded intelligence substrate)│
│                                                                 │
│  OneLake          Unity Catalog      dbt Medallion              │
│  Shortcuts        Three-level NS     Bronze / Silver / Gold     │
│  Mirroring        ABAC · Lineage     Lakeflow Orchestration     │
│  Delta/Iceberg    Column Masking     persist_docs → UC          │
│                   Row Filters                                   │
│                                                                 │
│  Semantic Layer                                                 │
│  MetricFlow + UC Business Semantics                             │
│  Databricks SQL REST endpoint                                   │
│  AI agent grounding interface                                   │
└─────────────────────────────────────────────────────────────────┘
```

---

## Integration Point Mapping

### Integration Point 1 — Layer 1 (APIM Governance Hub)

**What integrates:** Databricks SQL REST semantic endpoint registered as a backend service behind the existing APIM instance. The MetricFlow / Unity Catalog Business Semantics query surface becomes an APIM-managed API product.

**Mechanism:**
- Semantic endpoint (Databricks SQL warehouse REST API) added as an APIM backend, identical to how LLM backends are registered today
- Existing `frag-entra-auth.xml` policy fragment enforces Entra MI token validation before any semantic query reaches Databricks
- Existing `frag-llm-usage.xml` / `frag-ai-usage.xml` pattern extended: a new `frag-semantic-usage.xml` policy fragment tracks query count and cost by agent subscription key via Event Hub (same usage ingestion path already operational for LLM calls)
- Rate limiting applied at the APIM product level, same as LLM rate limiting today
- PII masking policy fragments (`frag-pii-anonymization.xml`) applied on response if semantic query results contain personal data

**Existing pages that must be updated:**
- `docs/architecture/layer-1-governance-hub.mdx` — Add a "Data Foundation Integration" callout section noting that semantic endpoints register as APIM backend services and inherit all existing governance capabilities
- `docs/ai-patterns/apim-reference.mdx` — Add a reference note: "For data-layer APIM patterns, see Enterprise Data Foundation → APIM Governed Data Access"

**New pages this integration requires:**
- `docs/data-foundation/apim-semantic-endpoint.mdx` — The primary page for this integration point (Phase 27)

**Key architectural decision embedded here (ADR-DF-04):** AI agents never call Databricks SQL directly. All semantic queries route through Citadel APIM. This is the pattern that closes the governance loop from data substrate to agent interaction.

---

### Integration Point 2 — Layer 2 (AI Control Plane / Observability)

**What integrates:** Operational signals from the data layer stream into the existing Event Hub → Log Analytics pipeline that Layer 2 already uses for LLM observability.

**Three signal streams:**

| Signal | Source | Destination | What it enables |
|--------|--------|-------------|-----------------|
| dbt pipeline health | Lakeflow Jobs task-level execution status | Event Hub (existing namespace) | Alert when silver or gold model runs fail; feed into compliance dashboards |
| Unity Catalog lineage events | UC REST API audit log (lineage events emitted on read/write) | Log Analytics (existing workspace) | Trace which AI agent consumed which certified metric; end-to-end data lineage from bronze table to agent response |
| OneLake freshness checks | Fabric capacity metrics / OneLake monitor | Event Hub or Log Analytics | Alert agents and dashboards when a shortcut source is stale or a mirror sync has failed |

**Integration mechanism:** All three use the existing Event Hub namespace and Log Analytics workspace already provisioned for Citadel. No new infrastructure is required. New Diagnostic Setting configurations point Databricks / Fabric signals at the existing sinks.

**Existing pages that must be updated:**
- `docs/architecture/layer-2-control-plane.mdx` — Add "Data Foundation Observability" section noting the three new signal streams and how they appear in the existing observability stack. Extend the Observability Layers table.

**New pages this integration requires:**
- `docs/data-foundation/observability-integration.mdx` — Dedicated page describing the three signal streams, how to configure the Diagnostic Settings, and what queries to run in Log Analytics to see dbt health + lineage (Phase 28, can be included inline in the dbt medallion page instead if the phase gets consolidated)

**What this does NOT require:** New monitoring infrastructure, new dashboards, new alerting rules. The existing Power BI usage dashboard (`guides/citadel-hub/operations/power-bi-dashboard.mdx`) would be the natural place to extend — but that is operational content, not architecture content.

---

### Integration Point 3 — Layer 4 (Security Fabric)

**What integrates:** Three security mechanisms that connect the data foundation to the existing Entra + Purview + Private Endpoint fabric.

**Three sub-patterns:**

| Sub-Pattern | Mechanism | Citadel Layer 4 Component |
|-------------|-----------|--------------------------|
| Entra Managed Identity for Databricks→OneLake | Databricks compute uses a system-assigned or user-assigned Managed Identity (not service principal with secret) to authenticate to OneLake ADLS DFS endpoint. MI token acquired via Azure Instance Metadata Service; no credential stored. | Entra (managed identity platform) |
| Purview sensitivity label propagation | Unity Catalog column-level sensitivity classifications (set via `ALTER TABLE ... SET TAGS`) are surfaced in Microsoft Purview as data assets. Purview labels (e.g., "Confidential", "PII") then propagate into APIM policy evaluation: the `frag-pii-anonymization.xml` fragment reads the label and applies masking before data reaches the agent. | Purview (data governance and labeling) |
| Private Endpoint network enforcement | Databricks serverless compute and OneLake DFS endpoints are placed behind Private Endpoints in the hub VNet (the same hub VNet Citadel already uses). No data traffic crosses the public internet. DNS resolution for `*.dfs.fabric.microsoft.com` and `*.azuredatabricks.net` resolves to private IP via the existing Private DNS Zones. | Hub VNet + Private DNS Zones (network layer of Security Fabric) |

**Existing pages that must be updated:**
- `docs/architecture/layer-4-security-fabric.mdx` — Add "Data Foundation Security Integration" section. Extend the Entra and Purview component tables to reference the new data foundation patterns. Add a sub-section on Private Endpoint extension for Databricks/OneLake.

**New pages this integration requires:**
- `docs/data-foundation/security-identity.mdx` — Full treatment of Entra MI chain, Purview label propagation into APIM, and Private Endpoint placement (Phase 28)

**Sequencing constraint:** The Purview label → APIM policy path described in Integration Point 3 cannot be fully documented until the APIM Semantic Endpoint page (Integration Point 1) is written. These two pages must be written in the same phase or in direct sequence.

---

## Component Boundaries

| Component | Responsibility | Communicates With | Owns |
|-----------|---------------|-------------------|------|
| OneLake | Storage layer, shortcut namespace, mirroring CDC | Unity Catalog (via Open API federation), ADLS DFS endpoint, Fabric workloads | No compute; pure storage + metadata |
| Unity Catalog | Governance layer, three-level namespace, ABAC, lineage, column masking, row filters | OneLake (as external location or federated catalog), Databricks compute, APIM (as query target) | Policy enforcement at query time |
| dbt (on Databricks) | Transformation logic, medallion tier models, lineage metadata via persist_docs | Unity Catalog (model output registered as UC tables/views), Lakeflow Jobs (orchestration), Event Hub (health signals) | SQL transformation code only |
| Lakeflow Jobs | Orchestration of dbt runs and non-dbt tasks as unified pipeline | dbt task type, Databricks notebooks, Event Hub (pipeline events) | Scheduling, retry, task sequencing |
| MetricFlow / Business Semantics | Semantic layer definition (dimensions, measures, joins, filters) | Unity Catalog (tables as data sources), Databricks SQL warehouse (query execution), APIM (as REST backend) | Metric definitions only |
| Databricks SQL Warehouse | Query execution for semantic layer REST endpoint | MetricFlow, Unity Catalog, APIM (as caller) | Compute for SQL execution |
| APIM (Citadel Layer 1) | Gateway, policy enforcement, rate limiting, usage tracking, PII masking | Databricks SQL warehouse (backend), Event Hub (usage signals), Entra (token validation) | No data; enforcement only |
| Event Hub + Log Analytics (Citadel Layer 2) | Signal ingestion, observability, lineage correlation | Lakeflow (dbt health), Unity Catalog (lineage events), OneLake (freshness), APIM (usage telemetry) | Storage and query of operational signals |

---

## Data Flow

### AI Agent → Semantic Query Path (Integration Point 1)

```
AI Agent (spoke)
  → APIM Gateway (hub) [Entra token validation → rate limit check → usage tracking]
    → Databricks SQL Warehouse (private endpoint)
      → MetricFlow query engine
        → Unity Catalog [row filters + column masks applied]
          → Delta tables in OneLake or Databricks-managed storage
              → response to MetricFlow
            → response to Databricks SQL
          → PII mask applied if Purview label = sensitive
        → response to APIM
      → usage event emitted to Event Hub
    → response to AI Agent
```

### dbt Pipeline → Observability Path (Integration Point 2)

```
Lakeflow Job triggers dbt run
  → dbt executes SQL transformations on Databricks compute
    → output tables registered in Unity Catalog (with column-level lineage via persist_docs)
    → task-level health event emitted → Event Hub
      → Log Analytics workspace [existing Citadel sink]
        → Log Analytics query surfaces dbt health in Citadel dashboards
  → Unity Catalog lineage event emitted on table write
    → Log Analytics workspace [direct ingestion from UC audit log]
      → lineage correlation: which agent consumed metric derived from this dbt model
```

### Databricks → OneLake Security Path (Integration Point 3)

```
Databricks serverless compute
  → Azure Instance Metadata Service: acquire Managed Identity token
    → OneLake DFS endpoint (private, via hub VNet Private Endpoint)
      → ADLS DFS operation
      → Unity Catalog column mask evaluated (PII columns returned as [REDACTED] for non-privileged MI)
  → Purview scans Unity Catalog assets
    → sensitivity label set on column (e.g., PII:GDPR)
      → APIM `frag-pii-anonymization.xml` reads label from response metadata
        → PII masking applied in APIM policy before response reaches agent
```

---

## New Pages to Create vs Existing Pages to Modify

### New Pages (all under `docs/data-foundation/`)

| Page | Path | Phase | Description |
|------|------|-------|-------------|
| Data Foundation Overview | `data-foundation/index.mdx` | 23 | Section landing page — what this layer is, how it connects to Citadel, navigation map |
| OneLake Architecture | `data-foundation/onelake-architecture.mdx` | 23 | Unified namespace, shortcut vs mirror ADR (ADR-DF-01), shortcut transformations, Delta/Iceberg, security model |
| Unity Catalog Governance | `data-foundation/unity-catalog-governance.mdx` | 24 | Three-level namespace, compute/governance separation, ABAC, column masks, row filters, lineage, Open API federation |
| Medallion Architecture | `data-foundation/medallion-architecture.mdx` | 25 | Bronze/silver/gold tier definitions, dbt model patterns, dbt vs Spark notebook ADR (ADR-DF-02), Lakeflow orchestration ADR, metadata-driven lineage |
| Semantic Layer Patterns | `data-foundation/semantic-layer.mdx` | 26 | Platform-native vs tool-bound ADR, MetricFlow vs raw SQL ADR (ADR-DF-03), AI agent grounding pattern, core/edge governance model |
| APIM Governed Data Access | `data-foundation/apim-semantic-endpoint.mdx` | 27 | ADR-DF-04, semantic endpoint as APIM backend, policy fragments for data, Citadel Layer 1 integration point detail |
| Security and Identity | `data-foundation/security-identity.mdx` | 28 | Entra MI chain for Databricks→OneLake, Purview label propagation into APIM, Private Endpoint placement in hub VNet |
| Data Foundation Navigation | `docs/docs.json` update | 29 | Add "Data Foundation" tab and navigation group in docs.json |

### Existing Pages to Modify (surgical additions only — no rewrites)

| Page | Path | What Changes | Phase |
|------|------|--------------|-------|
| Layer 1: Governance Hub | `architecture/layer-1-governance-hub.mdx` | Add "Data Foundation Integration" callout: semantic endpoints register as APIM backends and inherit all existing governance capabilities. Link to `data-foundation/apim-semantic-endpoint`. | 27 |
| Layer 2: AI Control Plane | `architecture/layer-2-control-plane.mdx` | Add "Data Foundation Observability" sub-section: three signal streams (dbt health, UC lineage, OneLake freshness) enter the existing Event Hub → Log Analytics stack. Extend Observability Layers table. | 25 |
| Layer 4: Security Fabric | `architecture/layer-4-security-fabric.mdx` | Add "Data Foundation Security Integration" sub-section: Entra MI for Databricks, Purview label propagation, Private Endpoint extension. Extend Entra + Purview component tables. | 28 |
| Citadel 4-Layer Model | `architecture/citadel-4-layer-model.mdx` | Add one sentence to "Relationship to Azure Landing Zones" noting that the Enterprise Data Foundation connects to all four layers as a governed intelligence substrate. Link to `data-foundation/index`. | 23 |

---

## Build Order for Phases 23–29

### Phase 23 — Data Foundation Overview + OneLake Architecture

**Pages:** `data-foundation/index.mdx`, `data-foundation/onelake-architecture.mdx`
**Minor update:** `architecture/citadel-4-layer-model.mdx` (one-line callout + link)

**Why first:** The index page is the entry point and must exist before any other data foundation page. OneLake has zero dependencies on other new sections (the shortcut vs mirror ADR requires only namespace understanding, not Unity Catalog or dbt knowledge). This phase produces the foundational framing that all subsequent phases reference.

**Source material:** `docs/data-foundation/microsoft-onelake-unified-data-lake.md` (ITNEXT/MVP), `docs/data-foundation/expanding-onelake-unity-catalog.md` (Databricks blog, Nov 2025), `docs/data-foundation/integrate-onelake-azure-databricks.md` (Microsoft Learn).

**Dependency:** None. Can be written from source materials alone.

---

### Phase 24 — Unity Catalog Governance

**Pages:** `data-foundation/unity-catalog-governance.mdx`

**Why second:** Unity Catalog is the governance backbone for everything downstream. The dbt medallion section (Phase 25) references `persist_docs → UC`, column grants at schema level, and ABAC — all of which require Unity Catalog to be established first. The semantic layer section (Phase 26) references UC Business Semantics and policy inheritance. Both later phases are weaker without this foundation in place.

**Source material:** `docs/data-foundation/expanding-onelake-unity-catalog.md` (UC Open API federation), `docs/data-foundation/open-platform-dbt-databricks.md` (UC governance in dbt workflows), `docs/data-foundation/semantic-layer-architecture.md` (UC Business Semantics).

**Dependency:** Phase 23 (OneLake) must be complete so the catalog federation section can reference the OneLake integration accurately.

---

### Phase 25 — Medallion Architecture + dbt Patterns

**Pages:** `data-foundation/medallion-architecture.mdx`
**Minor update:** `architecture/layer-2-control-plane.mdx` (add dbt health + lineage signal streams)

**Why third:** Medallion defines the vocabulary (bronze/silver/gold) used throughout the rest of the documentation and establishes the dbt Lakeflow orchestration pattern that the observability integration (Layer 2 update) references. The Layer 2 update is included here because it is triggered by Lakeflow — the data pipeline observability story and the pipeline architecture story are tightly coupled.

**Source material:** `docs/data-foundation/open-platform-dbt-databricks.md` (Databricks blog, Apr 2026) — covers all four pillars: open foundations, orchestration, governance, performance.

**Dependency:** Phase 24 (Unity Catalog) must be complete so the `persist_docs → Unity Catalog` lineage pattern can reference the UC governance page.

---

### Phase 26 — Semantic Layer Patterns

**Pages:** `data-foundation/semantic-layer.mdx`

**Why fourth:** The semantic layer section depends on Unity Catalog (Business Semantics is a UC capability; ABAC policies travel with metric definitions). It also depends on the medallion section because it references gold-tier dbt models as the tables backing MetricFlow metric definitions. The semantic layer page is the conceptual climax of the data foundation — all prior sections feed into it.

**Source material:** `docs/data-foundation/semantic-layer-architecture.md` (Databricks blog, Apr 2026) — primary source. The source material is publication-quality and maps directly to the ADR structure. The agent grounding pattern section also requires cross-linking to `agent-factory/intelligence-layers.mdx` (existing page).

**Dependency:** Phase 24 (Unity Catalog) + Phase 25 (Medallion) must be complete.

---

### Phase 27 — APIM Governed Data Access

**Pages:** `data-foundation/apim-semantic-endpoint.mdx`
**Minor update:** `architecture/layer-1-governance-hub.mdx` (add data foundation integration callout + link)

**Why fifth:** This is the integration point that connects the entire data foundation to the existing Citadel platform. It cannot be written until the semantic layer is established (Phase 26) because it describes how APIM fronts the semantic endpoint. The Layer 1 update belongs here because it is triggered by this integration point.

**Source material:** No single source covers this pattern. Must be synthesized from: existing APIM policy fragment files (`bicep/infra/citadel-access-contracts/base-access-contract-request/snippets/`), existing Layer 1 governance hub documentation, and the semantic layer REST API surface described in the Databricks blog. This is the highest-synthesis phase in the milestone.

**Dependency:** Phase 26 (Semantic Layer) must be complete. The APIM backend registration pattern requires understanding what is being fronted.

**Research flag:** This phase has no direct source material for the Databricks SQL REST API registration as an APIM backend. The implementation pattern must be inferred from existing APIM backend registration patterns in the project Bicep modules. Needs validation before writing.

---

### Phase 28 — Security and Identity

**Pages:** `data-foundation/security-identity.mdx`
**Minor updates:** `architecture/layer-4-security-fabric.mdx` (add data foundation security section)

**Why sixth:** The security page depends on three prior sections: OneLake (for the Entra MI → DFS endpoint path), Unity Catalog (for column masking and sensitivity tag propagation), and APIM (for the Purview label → APIM policy evaluation path). It cannot be written coherently until those integration stories are established. The Layer 4 update belongs here.

**Source material:** `docs/data-foundation/integrate-onelake-azure-databricks.md` (Microsoft Learn — Entra SP/MI authentication to OneLake), existing Layer 4 documentation (Purview sensitivity labels, Entra MI pattern), existing APIM policy fragments (`frag-pii-anonymization.xml`, `frag-entra-auth.xml`).

**Dependency:** Phase 23 (OneLake), Phase 24 (Unity Catalog), Phase 27 (APIM patterns) must be complete. The Purview label → APIM policy path is the most complex dependency chain.

---

### Phase 29 — Navigation and docs.json Integration

**Changes:** Add "Data Foundation" tab and navigation group in `docs/docs.json`. Wire all seven new pages into the navigation. Add cross-links in relevant existing pages that don't already have them (architecture overview, agent factory intelligence layers).

**Why last:** Navigation wiring requires all pages to exist with their final paths. Doing this last prevents the Navigation from referencing pages that may have their paths adjusted during writing. This phase also includes a link integrity check across all new pages.

**Dependency:** All prior phases (23–28) must be complete.

---

## Patterns to Follow

### Pattern 1: Existing Policy Fragment Extension

**What:** New data foundation APIM policy needs are satisfied by authoring new policy fragment XML files that follow the exact same structure as `frag-entra-auth.xml`, `frag-llm-usage.xml`, and `frag-pii-anonymization.xml`. Fragment names follow `frag-[function]-[direction].xml` naming convention.

**When:** Any time the APIM semantic endpoint page (Phase 27) describes a policy behavior, it should reference the equivalent existing fragment as a pattern anchor, then describe what a `frag-semantic-usage.xml` or `frag-semantic-entra-auth.xml` would look like architecturally — without providing code (out of scope).

**Why this matters for documentation:** The audience (architects) will recognize the fragment pattern from the existing Layer 1 docs. Anchoring new data foundation policies to the existing fragment model makes the extension feel native rather than bolted on.

---

### Pattern 2: Cross-Link over Duplicate

**What:** The existing Citadel documentation defines Entra MI, Purview labels, APIM product subscriptions, and Event Hub ingestion comprehensively. The new data foundation pages must reference these via cross-links (`/architecture/layer-4-security-fabric`, `/architecture/layer-1-governance-hub`) rather than repeating the capability description.

**When:** Every time a data foundation page references a Citadel capability.

**Example pattern:**
```
Data foundation pages describe: how the capability is applied to data
Citadel layer pages describe: what the capability does in general
```

Not following this pattern causes content drift — the same capability described differently in two places becomes a maintenance problem.

---

### Pattern 3: ADR Structure Consistency

**What:** Each ADR section follows: Decision Question → Context → Recommended Answer → Conditions for Alternative → Sources.

**When:** Every ADR-DF-01 through ADR-DF-04 section within the new pages.

**Why:** The existing project has established a pattern for design decision documentation (Key Decisions table in PROJECT.md). The ADR sections should follow the same opinionated, justified format — not present multiple equivalent options.

---

## Anti-Patterns to Avoid

### Anti-Pattern 1: Describing the Data Foundation as a New Citadel Layer

**What goes wrong:** Writing introductory content that positions OneLake + Unity Catalog as "Layer 5" or "a fifth layer added to the Citadel model."

**Why bad:** The Citadel 4-layer model is an established, referenceable architecture with documented integration surfaces at each layer. Adding a fifth layer would require rewriting the 4-layer model documentation, the architecture overview, and all cross-references. It would also misrepresent the technical relationship — the data foundation is a substrate that connects at three integration points, not a governance layer in the Citadel sense.

**Instead:** Position it explicitly as the "grounded intelligence substrate" that integrates with Citadel at three specific points. The index page (`data-foundation/index.mdx`) must establish this framing in the first paragraph.

---

### Anti-Pattern 2: Duplicating Citadel Capability Descriptions

**What goes wrong:** The security-identity page describes what Purview sensitivity labels are, how Entra Managed Identity works, or what Private Endpoints do — content that already exists in Layer 4 docs.

**Why bad:** Duplicate content drifts. When Layer 4 documentation is updated, the data foundation page becomes stale. Architects reading both pages in the same session notice the inconsistency.

**Instead:** One sentence of context, then a cross-link. "Purview sensitivity labels (see Layer 4: Security Fabric) propagate into the APIM policy evaluation path as follows: [specific data foundation pattern]."

---

### Anti-Pattern 3: Conflating Shortcut and Mirror as "Zero-Copy"

**What goes wrong:** The OneLake architecture page describes both shortcuts and mirroring under a "zero-copy integration" heading, implying they have the same security and governance properties.

**Why bad:** Shortcuts leave data in the source system and apply source-side security. Mirroring replicates data into OneLake and applies Fabric-side security to the copy. An architect who designs a security model on the assumption that Unity Catalog row-level security applies at query time for a mirrored table will be wrong — the Fabric-side copy has its own access control surface.

**Instead:** Separate the two primitives explicitly. Shortcut = metadata pointer; mirror = replication with Fabric governance. The ADR table must show this distinction as the primary decision criterion.

---

### Anti-Pattern 4: Presenting Text-to-SQL and Semantic Layer as Equivalent Options

**What goes wrong:** The semantic layer page offers text-to-SQL (LLM generates raw SQL against base Unity Catalog tables) as a comparable alternative to MetricFlow-backed semantic queries.

**Why bad:** The source material (Databricks semantic layer blog) is unambiguous: for enterprise analytics where consistency and auditability are requirements, the semantic layer is not optional. Text-to-SQL produces inconsistent results across surfaces because business logic is re-implemented by each LLM call rather than enforced by the platform.

**Instead:** ADR-DF-03 must state the asymmetry: MetricFlow is the required pattern for production AI agents producing auditable analytics. Text-to-SQL is acceptable only for exploratory, low-stakes use cases where a human validates the output before action.

---

## Scalability Considerations

These considerations inform how the documentation should frame architectural decisions at scale.

| Concern | At 10 agents | At 100 agents | At 1000 agents |
|---------|-------------|---------------|----------------|
| APIM rate limiting for semantic queries | Product-level rate limit sufficient | Per-subscription rate limits required; agent subscription keys map to team cost centers | Hierarchical rate limiting: product → subscription → per-operation |
| Unity Catalog ABAC complexity | Role-per-team is manageable | Group-based ABAC required; dynamic attribute assignment for AI agents | Automated provisioning of UC entitlements via Entra group sync |
| dbt model governance | Manual certification review is feasible | Automated certification gates via CI/CD | Full semantic contract testing required before gold-tier promotion |
| Semantic model core vs edge | Single core model acceptable | Edge models per business unit; promotion process required | Formal semantic model versioning and deprecation workflow |
| Event Hub throughput | Default tier sufficient | Standard tier required for parallel signal streams | Dedicated throughput units; partitioned consumption by signal type |

---

## Sources

| Source | Type | Confidence | Relevant To |
|--------|------|-----------|-------------|
| `docs/data-foundation/semantic-layer-architecture.md` — Databricks Blog, Apr 2026 | Official vendor blog | HIGH | Phase 26, ADR-DF-03, agent grounding pattern, core/edge governance |
| `docs/data-foundation/microsoft-onelake-unified-data-lake.md` — ITNEXT/Azure MVP, Apr 2026 | Community (verified against MS Learn URLs) | MEDIUM | Phase 23, shortcut vs mirror, OneLake catalog, security model |
| `docs/data-foundation/expanding-onelake-unity-catalog.md` — Databricks Blog, Nov 2025 | Official vendor announcement | HIGH | Phase 23 (mirroring), Phase 24 (UC Open API federation) |
| `docs/data-foundation/open-platform-dbt-databricks.md` — Databricks Blog, Apr 2026 | Official vendor blog | HIGH | Phase 25, Lakeflow orchestration, UC governance in dbt |
| `docs/data-foundation/integrate-onelake-azure-databricks.md` — Microsoft Learn | Official Microsoft documentation | HIGH | Phase 28, Entra authentication path for Databricks→OneLake |
| `docs/architecture/layer-1-governance-hub.mdx` — Existing Citadel doc | Authoritative project source | HIGH | Integration Point 1, Phase 27 update surface |
| `docs/architecture/layer-2-control-plane.mdx` — Existing Citadel doc | Authoritative project source | HIGH | Integration Point 2, Phase 25 update surface |
| `docs/architecture/layer-4-security-fabric.mdx` — Existing Citadel doc | Authoritative project source | HIGH | Integration Point 3, Phase 28 update surface |
| `bicep/infra/citadel-access-contracts/base-access-contract-request/snippets/` — Existing policy fragments | Authoritative project source (implementation) | HIGH | Phase 27 policy fragment naming convention, existing PII + Entra + usage fragments |
| `docs/docs.json` — Existing navigation config | Authoritative project source | HIGH | Phase 29, tab structure, navigation group patterns |
