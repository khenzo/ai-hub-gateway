# Phase 24: Unity Catalog Governance - Research

**Researched:** 2026-04-27
**Domain:** Azure Databricks Unity Catalog — compute/governance separation, ABAC, three-level namespace as governance contract, Iceberg REST Catalog + OneLake integration path
**Confidence:** HIGH

---

<phase_requirements>
## Phase Requirements

| ID | Description | Research Support |
|----|-------------|-----------------|
| UCAT-01 | User can understand how Unity Catalog separates compute from governance — lineage, column masks, and row filters persist across table rebuilds and cluster changes | Fully documented: governance objects (lineage, filters, masks) are stored in the Unity Catalog metastore — a control-plane service independent of compute. Schema-level GRANT, row filters, column masks, and lineage all persist when tables are dropped and recreated. Source: official Microsoft Learn docs updated 2026-04-22 and 2026-04-23. |
| UCAT-02 | User can understand the Unity Catalog ABAC design pattern — attribute-based access control using tags and conditions that scales across teams and schemas without requiring per-table ACL updates | Fully documented: ABAC is in Public Preview (flag required). Tags applied at catalog/schema level inherit down to child objects. Policies attach at catalog, schema, or table level and automatically apply to all tables within that scope. Requires DBR 16.4+ or serverless. Source: official Microsoft Learn ABAC doc updated 2026-03-23. |
| UCAT-03 | User can understand the three-level namespace (catalog.schema.table) as the governance contract layer between raw storage and downstream consumers | Fully documented: the namespace is the governance contract because all Unity Catalog securable objects — GRANT, REVOKE, row filters, column masks, tags, lineage — are attached to the logical namespace, not to physical storage paths. Storage reorganizations (changing ADLS paths, cluster changes) do not break the governance contract because it lives in the metastore. Source: official Microsoft Learn docs updated 2026-04-02. |
| UCAT-04 | User can understand the Unity Catalog Open API + Iceberg REST Catalog integration with OneLake, including its Public Preview status and the currently-GA baseline path | Fully documented: Iceberg REST Catalog API is in Public Preview (DBR 16.4+). Endpoint: `/api/2.1/unity-catalog/iceberg-rest`. OneLake mirroring of Azure Databricks is the currently-GA baseline path. Reading OneLake data in Databricks via Unity Catalog Open APIs was roadmap for EOY 2025 — needs GA verification before production guidance. Source: official Microsoft Learn Iceberg doc updated 2026-04-20. |
</phase_requirements>

---

## Summary

Phase 24 produces the Unity Catalog Governance documentation page (`docs/data-foundation/unity-catalog-governance.mdx`). It must answer four architectural decision questions that enable architects to design a Unity Catalog governance model for enterprise AI workloads: how governance persists independently of compute (UCAT-01), how ABAC using tags scales without per-table ACL updates (UCAT-02), how the three-level namespace acts as the downstream consumer contract (UCAT-03), and what the current GA vs Preview status is for the Iceberg REST + OneLake integration path (UCAT-04).

Research is sourced from official Microsoft Learn documentation updated in April 2026, covering the Unity Catalog overview, tags, ABAC, row filters and column masks, lineage, privileges, and the Iceberg REST Catalog API. All four requirements have strong research support. The critical ABAC finding is that it is in **Public Preview** — this must be flagged clearly in the documentation.

The central architectural insight for this page: Unity Catalog achieves compute/governance separation because governance metadata — privileges, row filters, column masks, tags, lineage, column descriptions — is stored in the metastore, a control-plane service that is entirely independent of cluster lifecycle. When a cluster terminates, when a dbt model drops and recreates a table, or when ADLS storage paths are reorganized, the governance contract expressed through the `catalog.schema.table` namespace remains intact. Downstream consumers never need to know about physical storage reorganizations.

**Primary recommendation:** Produce one page (`docs/data-foundation/unity-catalog-governance.mdx`) structured around four sections that map directly to UCAT-01 through UCAT-04. Use the ADR structure from prior phases. Cross-link to Layer 4 (Security Fabric) for Purview/Entra context; do not duplicate those descriptions.

---

## User Constraints

No CONTEXT.md exists for Phase 24. The following constraints are drawn from STATE.md and REQUIREMENTS.md.

### Locked Decisions (from STATE.md Architectural Context)

- **Data Foundation is NOT a fifth Citadel layer** — it connects at three attachment points (Layer 1 APIM, Layer 2 observability, Layer 4 Security Fabric). Unity Catalog must be positioned as the governance substrate, not a new architectural layer.
- **Scope: documentation only** — no Bicep, no dbt YAML, no GitHub Actions, no code artifacts of any kind.
- **8 Pre-GA capabilities require Warning callouts** — ABAC in Unity Catalog is in **Public Preview**; Iceberg REST Catalog API is in **Public Preview**. Both MUST have Mintlify `<Warning>` components.
- **Phase 23 (OneLake) is the dependency** — this page builds on the OneLake architecture established in Phase 23. The catalog federation + OneLake integration section can reference the OneLake mirroring pattern from Phase 23 without re-explaining it.

### Claude's Discretion

- Whether to include workspace-catalog binding as a section or as an architecture note within the namespace section.
- Depth of treatment for the Snowflake Iceberg integration note (include as an architecture callout or omit as out-of-scope).
- Whether the ABAC UDF pattern merits a brief example description or is too implementation-specific for architect documentation.

### Deferred Ideas (OUT OF SCOPE)

- Any IaC code (Bicep, Terraform)
- dbt model code / YAML snippets
- SAP Datasphere mirroring
- Snowflake bidirectional integration details
- Multi-region OneLake replication
- Power BI Direct Lake setup
- OneLake identity delegation ADR

---

## Standard Stack

This phase produces Mintlify MDX documentation pages, not software. The "stack" is the documentation platform and the source technologies being documented.

### Core Documentation Platform

| Component | Version/Status | Purpose | Why Standard |
|-----------|---------------|---------|--------------|
| Mintlify | Current (docs.json schema) | Documentation site | Project standard — all existing pages use this |
| MDX | Standard | Page format | All docs use .mdx with Mintlify components |
| Mintlify Warning/Note callout | Built-in | Pre-GA flags | Required for all Public Preview capabilities |
| ASCII art diagrams | None | Architecture visuals | Project standard (decided Phase 3) |
| Mintlify CardGroup + Card | Built-in | Cross-links and navigation | Established pattern (Phase 9, 12) |

### Source Technologies Being Documented

| Technology | Version/Status | Key Doc URL |
|------------|---------------|-------------|
| Unity Catalog | GA | `https://learn.microsoft.com/en-us/azure/databricks/data-governance/unity-catalog/` (updated 2026-04-02/2026-04-21) |
| Unity Catalog row filters and column masks | GA (DBR 12.2+) | `https://learn.microsoft.com/en-us/azure/databricks/data-governance/unity-catalog/filters-and-masks/` (updated 2026-04-23) |
| Unity Catalog data lineage | GA | `https://learn.microsoft.com/en-us/azure/databricks/data-governance/unity-catalog/data-lineage` (updated 2026-04-22) |
| Unity Catalog tags (standard) | GA (DBR 13.3+ for SQL SET TAGS; DBR 16.1+ for SET TAG) | `https://learn.microsoft.com/en-us/azure/databricks/database-objects/tags` (updated 2026-04-02) |
| Unity Catalog ABAC | **Public Preview** (DBR 16.4+ or serverless) | `https://learn.microsoft.com/en-us/azure/databricks/data-governance/unity-catalog/abac/` (updated 2026-03-23) |
| Unity Catalog privileges (inheritance model) | GA | `https://learn.microsoft.com/en-us/azure/databricks/data-governance/unity-catalog/manage-privileges/` (updated 2026-03-23) |
| Iceberg REST Catalog API (`/api/2.1/unity-catalog/iceberg-rest`) | **Public Preview** (DBR 16.4+) | `https://learn.microsoft.com/en-us/azure/databricks/external-access/iceberg` (updated 2026-04-20) |
| OneLake metadata mirroring (Azure Databricks) | GA | `https://learn.microsoft.com/en-us/fabric/mirroring/azure-databricks` |

### Installation

Not applicable — this phase produces documentation pages, not code.

---

## Architecture Patterns

### Recommended Page Structure

```
docs/data-foundation/
└── unity-catalog-governance.mdx     # Primary page for Phase 24 (all four requirements)
```

Page internal structure:

```
1. Introduction — Unity Catalog as the governance backbone
   - Compute/governance separation thesis: the metastore is not the cluster
2. Compute vs Governance Separation (UCAT-01)
   - What "separated" means: metastore = control plane; cluster = data plane
   - What persists in the metastore: lineage, GRANT, row filters, column masks, tags
   - What happens at table rebuild: schema-level grants survive; row filters survive
   - The downstream consumer guarantee: consumers query the same namespace regardless of cluster lifecycle
3. ABAC Design Pattern (UCAT-02)
   - ABAC Public Preview Warning callout
   - Tags as governance attributes: catalogs, schemas, tables, table columns
   - Tag inheritance for ABAC policies: catalog tag → schema → tables (not columns)
   - Policies at catalog/schema level = no per-table ACL updates for new tables
   - Two ABAC policy types: row filter policies and column mask policies
   - How new teams onboard: tag the schema with the new team's region/domain attribute;
     existing policies apply automatically
   - Contrast with RBAC: RBAC requires per-grant updates; ABAC requires only tag updates
4. Three-Level Namespace as Governance Contract (UCAT-03)
   - catalog.schema.table as the stable consumer surface
   - Storage isolation model: ADLS paths can change; the namespace stays
   - Workspace-catalog binding: environment isolation without breaking the namespace
   - What downstream consumers depend on: the logical name, not the physical path
   - How dbt rebuilds work: table is dropped and recreated; schema GRANT persists
5. Open API + Iceberg REST Catalog Integration with OneLake (UCAT-04)
   - Current GA baseline: OneLake mirroring (reads UC from Fabric — GA)
   - Iceberg REST Catalog API Warning callout (Public Preview)
   - Endpoint: /api/2.1/unity-catalog/iceberg-rest
   - Access matrix: what reads/writes are supported by table type
   - Reading OneLake data in Databricks via UC Open APIs: announced EOY 2025; verify GA before production
   - The production-safe path today: metadata mirroring + Iceberg REST for read-only external engines
6. Connection to Citadel Architecture
   - Where Unity Catalog connects to the 4-layer model
   - Cross-links to Layer 4 (Security Fabric) for Purview + Entra patterns
```

### Pattern 1: Compute/Governance Separation via Metastore

**What:** Unity Catalog stores all governance metadata — privileges (GRANT/REVOKE), row filters, column masks, tags, column descriptions, and lineage — in the metastore. The metastore is a control-plane service managed by Databricks, entirely independent of cluster lifecycle. Compute resources (clusters, SQL warehouses) query the metastore at runtime to determine what a user can see. When a cluster terminates, governance metadata is unaffected.

**Architectural guarantee for downstream consumers:** Downstream consumers (AI agents, dashboards, dbt models) that query `catalog.schema.table` receive the same row filters and column masks regardless of which cluster processed the last table write, whether the table was rebuilt by a dbt run, or whether the underlying ADLS path was reorganized. The governance contract is the logical namespace, not the physical location.

**When to use in documentation:** This is the central architectural narrative of the page. Every other section (ABAC, namespace, Iceberg) connects back to this premise.

**Source:** Microsoft Learn Unity Catalog overview (updated 2026-04-02/2026-04-21); row filters and column masks (updated 2026-04-23); data lineage (updated 2026-04-22).

### Pattern 2: Schema-Level GRANT Surviving Table Rebuilds

**What:** Privileges in Unity Catalog use an inheritance model: granting `SELECT` on a schema grants it on all current AND future tables within that schema. When dbt drops and recreates a table (the standard dbt incremental rebuild pattern), the table is a new object, but it inherits the schema-level `GRANT`. No re-grant is required.

**Architectural guarantee:** The governance documentation source (`open-platform-dbt-databricks.md`) explicitly states: "You don't need to re-run grant statements every time dbt recreates a table. Permissions are managed at the schema level and persist across table rebuilds."

**Key quote for documentation:** Schema-level grants are the mechanism by which Unity Catalog separates the data governance lifecycle from the data pipeline lifecycle.

**Source:** Databricks Blog (open-platform-dbt-databricks.md, April 2026) — HIGH confidence; Microsoft Learn manage-privileges (updated 2026-03-23).

### Pattern 3: ABAC Tag Inheritance for Scale

**What:** ABAC policies attach at catalog, schema, or table level. Governed tags applied to a catalog or schema automatically apply to all child objects for ABAC policy evaluation (note: tag inheritance is for ABAC evaluation only, not general tag inheritance). This means an admin defines a policy once at the catalog level and it applies to every table — current and future — in that catalog.

**How new teams onboard without per-table ACL updates:**
1. New team joins; they own schema `catalog.team_a_silver`
2. Admin tags the schema: `SET TAG ON SCHEMA catalog.team_a_silver 'domain' = 'team_a'`
3. The catalog-level ABAC policy already has a condition: `IF tag 'domain' = 'team_a' THEN allow region 'EMEA' users`
4. All tables in `team_a_silver` are now governed automatically — no table-level policy update needed

**When to use in documentation:** This is the scaling argument for ABAC. The comparison with per-table RBAC (which requires `GRANT SELECT ON TABLE` for every new table a team creates) demonstrates why ABAC is the recommended governance model for multi-team environments.

**IMPORTANT flag:** ABAC is in **Public Preview**. Requires DBR 16.4 or above, or serverless compute. Users not subject to the policy can use any runtime.

**Source:** Microsoft Learn ABAC overview (updated 2026-03-23); Tags doc (updated 2026-04-02).

### Pattern 4: The Three-Level Namespace as Governance Contract

**What:** Every securable object in Unity Catalog lives under `catalog.schema.object`. All governance operations — GRANT, REVOKE, row filter assignment, column mask assignment, tag assignment, lineage tracking — use this logical name. Physical storage (the ADLS path where Delta/Iceberg files are stored) is an implementation detail that Unity Catalog manages internally.

**Architectural guarantee for downstream consumers:** When a downstream consumer — an AI agent, a dashboard, a dbt model — holds a reference to `analytics.gold.customer_metrics`, that reference remains valid regardless of:
- Which cluster last wrote to the table
- Whether the underlying ADLS storage account was reorganized
- Whether the table was rebuilt (CTAS, dbt rebuild, CLONE)
- Whether the Databricks workspace version was upgraded

The consumer's dependency is on the governance contract, not on a physical file path.

**Workspace-catalog binding:** Unity Catalog allows binding specific catalogs to specific workspaces. This provides environment isolation (dev/staging/prod) without changing the namespace. A downstream consumer that only has access to the `prod` workspace will only see catalogs bound to that workspace. The namespace is the same; binding controls visibility.

**Source:** Microsoft Learn Unity Catalog overview (updated 2026-04-02/2026-04-21); manage-privileges (updated 2026-03-23).

### Pattern 5: Iceberg REST Catalog + OneLake Integration Path

**What:** Two integration paths exist for connecting Unity Catalog to external consumers (including OneLake workloads):

1. **OneLake metadata mirroring** (GA): Fabric mirrors the Unity Catalog structure into OneLake, creating shortcuts for Delta/Iceberg tables. Fabric engines can query Databricks-managed tables via a SQL analytics endpoint. This is the currently-GA baseline.

2. **Iceberg REST Catalog API** (Public Preview, DBR 16.4+): Endpoint `/api/2.1/unity-catalog/iceberg-rest`. External Iceberg clients (Apache Spark, Apache Flink, Trino, Snowflake, PyIceberg, Dremio) can read from and write to Unity Catalog-registered Iceberg tables using this endpoint.

3. **Reading OneLake data in Databricks via Unity Catalog Open APIs** (announced EOY 2025, GA status unverified): Databricks customers create Unity Catalog Connections to OneLake using Entra Managed Identity. This is the bidirectional federation path. Must verify current GA status before documenting as a production-ready path.

**Access matrix for Iceberg REST Catalog:**

| Table Type | Read | Write |
|------------|------|-------|
| Managed Iceberg | Yes | Yes (Public Preview) |
| Foreign Iceberg | Yes | No |
| Managed Delta (UniForm/Iceberg reads enabled) | Yes | No |
| External Delta (UniForm enabled) | Yes | No |

**Production guidance for UCAT-04:** The GA baseline path today is OneLake metadata mirroring. The Iceberg REST Catalog is the correct technical path for Iceberg client interoperability, but its Public Preview status means architects should validate it in non-production before committing to it for production workloads.

**Source:** Microsoft Learn Iceberg REST Catalog (updated 2026-04-20); Databricks Blog expanding-onelake-unity-catalog.md (November 2025).

### Anti-Patterns to Avoid

- **Describing cluster permissions as equivalent to Unity Catalog governance:** Cluster-level access controls (IAM on ADLS, cluster ACLs) are NOT the same as Unity Catalog governance. The page must establish that the metastore is the authoritative governance plane, not the cluster configuration.
- **Describing ABAC as GA:** ABAC is in Public Preview. Always pair with a Mintlify `<Warning>` component. Requires DBR 16.4+ or serverless.
- **Describing the Iceberg REST Catalog as the recommended production path without a Preview flag:** The endpoint is Public Preview. The currently-GA production path is OneLake metadata mirroring.
- **Conflating tag inheritance (general) with ABAC tag inheritance:** Tag inheritance only applies during ABAC policy evaluation. Tags do NOT generally inherit to child objects. This distinction is explicit in the official doc — getting it wrong would mislead architects designing ABAC schemes.
- **Describing row filters and column masks as cluster-level features:** They are stored in the Unity Catalog metastore and evaluated at query time regardless of which cluster or compute resource is querying.
- **Presenting workspace-catalog binding as a namespace change:** Workspace-catalog binding restricts which workspaces can see a catalog. The namespace (`catalog.schema.table`) is unchanged; binding controls visibility, not naming.

---

## Don't Hand-Roll

| Problem | Don't Build | Use Instead | Why |
|---------|-------------|-------------|-----|
| ABAC policy design | Custom tag-to-ACL mapping tables | Unity Catalog ABAC with governed tags and catalog/schema-level policies | ABAC policies inherit down the object hierarchy automatically; mapping tables require per-table maintenance |
| Governance persistence across table rebuilds | Re-grant automation scripts on table creation | Schema-level GRANT with Unity Catalog inheritance model | Schema grants apply to all current and future tables in the schema automatically |
| Row/column security | Custom views or application-layer filtering | Unity Catalog row filters and column masks | Filters and masks enforce at query time regardless of query engine; application-layer filtering is bypassable |
| Cross-engine governance | Per-engine security configuration | Unity Catalog + Iceberg REST Catalog or credential vending | Unity Catalog governance applies to Delta and Iceberg clients via the catalog API |
| Environment isolation | Separate metastores per environment | Workspace-catalog binding | Single metastore with catalog-level environment bindings; simpler governance surface |

**Key insight:** Unity Catalog's value is that governance is NOT co-located with compute. Any pattern that co-locates governance with a specific cluster or application layer loses the persistence guarantee that UCAT-01 requires.

---

## Common Pitfalls

### Pitfall 1: Asserting ABAC Scales Without Noting the DBR 16.4 Requirement

**What goes wrong:** The page describes ABAC as the recommended scaling pattern for Unity Catalog governance without noting that it requires Databricks Runtime 16.4 or above (or serverless compute). Architects plan deployments on existing DBR 14.x clusters and discover they cannot use ABAC.

**Why it happens:** The ABAC benefits are compelling and well-documented. The compute requirement is in the Limitations section of the ABAC doc and is easy to miss when synthesizing the main content.

**How to avoid:** In the ABAC section, immediately after the `<Warning>` callout for Public Preview status, state the compute requirement: "ABAC policies require Databricks Runtime 16.4 or above, or serverless compute, to enforce. Users not subject to the policy can use any runtime."

**Warning signs:** Any ABAC section that doesn't mention DBR 16.4.

### Pitfall 2: Describing Row Filters and Column Masks as Requiring ABAC

**What goes wrong:** Row filters and column masks can be applied in two ways: (1) ABAC policies (Public Preview, centralized), or (2) manually per table (GA, table-by-table). The page conflates these and implies row filters/column masks are only available via ABAC.

**Why it happens:** The ABAC docs prominently feature row filter and column mask policies. It is easy to read "row filter" and assume "ABAC" when they are distinct features.

**How to avoid:** Distinguish the two application methods explicitly. Row filters and column masks via direct table assignment (the `ALTER TABLE SET ROW FILTER` syntax) are GA as of DBR 12.2+. ABAC-managed row filters and column masks are Public Preview. The page should describe both, with ABAC flagged as Preview and the direct-assignment path flagged as the GA baseline.

**Warning signs:** Any section that implies row filters require ABAC, or that row-level security is only available in Public Preview.

### Pitfall 3: Describing Tag Inheritance as General Behavior

**What goes wrong:** The page says "tags applied to a catalog automatically apply to all schemas and tables in that catalog." This is incorrect for general tag inheritance. Tag inheritance only occurs during ABAC policy evaluation. General tag queries (e.g., `INFORMATION_SCHEMA.TABLE_TAGS`) do NOT show inherited tags from parent catalogs.

**Why it happens:** The ABAC doc uses the phrase "implicit tag inheritance" which sounds like a general property. The tags doc clarifies that "implicit tag inheritance occurs when evaluating ABAC policies only."

**How to avoid:** When describing tag inheritance, always qualify it: "Tags applied at the catalog or schema level are implicitly inherited by child objects when Unity Catalog evaluates ABAC policies. This inheritance does not apply to general tag queries or the information schema tag tables."

**Warning signs:** Any sentence that asserts tag inheritance without the "for ABAC policy evaluation" qualifier.

### Pitfall 4: Presenting the Iceberg REST Catalog as the Recommended Production Path for OneLake Integration

**What goes wrong:** The Iceberg REST Catalog endpoint (`/api/2.1/unity-catalog/iceberg-rest`) is presented as the recommended path for OneLake integration without flagging its Public Preview status. An architect adopts this path in production and encounters instability or breaking changes.

**Why it happens:** The endpoint is technically the correct architectural answer for Iceberg client interoperability. Its Public Preview status is easy to overlook when the capability is otherwise well-documented.

**How to avoid:** UCAT-04 must clearly separate the two paths:
- **GA baseline** (use now): OneLake metadata mirroring for Fabric engines; direct Delta client access via Unity REST API (reads — GA)
- **Public Preview** (evaluate, not production commitment): Iceberg REST Catalog API; managed Iceberg table writes

**Warning signs:** Any sentence describing the Iceberg REST Catalog as the recommended production path without a Warning callout.

### Pitfall 5: Omitting the Lineage Retention and Persistence Guarantee

**What goes wrong:** The UCAT-01 section describes lineage as a Unity Catalog feature without noting that lineage data is retained indefinitely (all lineage captured after September 1, 2024 is available). Architects assume lineage is ephemeral and don't plan AI agent audit trails that depend on it.

**Why it happens:** Lineage retention policy is in the lineage doc but is framed as an operational detail rather than an architectural guarantee.

**How to avoid:** Explicitly state the architectural guarantee: "Unity Catalog captures lineage at runtime across all supported compute interfaces. Lineage data is retained indefinitely and is accessible across all workspaces attached to the same metastore. This means that the AI agent's access to a certified metric — including which table version was queried — is permanently auditable through the lineage system tables, independent of cluster lifecycle."

**Warning signs:** Any lineage section that doesn't mention retention or cross-workspace visibility.

---

## Code Examples

This phase produces no code. The following are architecture description patterns the page should express.

### Three-Level Namespace Governance Contract Pattern (ASCII)

```
                DOWNSTREAM CONSUMERS
          AI Agents │ Dashboards │ dbt models
                    │
                    ▼
         analytics.gold.customer_metrics
         ──────────────────────────────
         GOVERNANCE CONTRACT (metastore)
         • GRANT SELECT on SCHEMA analytics.gold
           → applies to this table AND all future tables
         • Row filter: region = current_user_region()
           → evaluated at query time regardless of cluster
         • Column mask: SSN → [REDACTED] unless pii_access=true
           → evaluated at query time regardless of cluster
         • Lineage: upstream bronze tables and dbt model version
           → captured in metastore, retained indefinitely
         ──────────────────────────────
                    │
                    ▼
         PHYSICAL STORAGE (ADLS)
         abfss://account.dfs.core.windows.net/path/...
         (Can be reorganized without breaking the contract above)
```

### ABAC Tag Inheritance Pattern (ASCII)

```
CATALOG: analytics   [tag: env=prod]
  │
  ├─ SCHEMA: silver  [tag: domain=finance]
  │    │
  │    ├─ TABLE: transactions   (inherits both tags for ABAC evaluation)
  │    └─ TABLE: invoices       (inherits both tags for ABAC evaluation)
  │
  └─ SCHEMA: gold    [tag: domain=executive]
       │
       └─ TABLE: executive_metrics  (inherits env=prod, domain=executive)

ABAC POLICY (defined once at catalog level):
  IF tag domain=finance THEN apply row_filter(region = user_region)
  IF tag domain=executive THEN apply column_mask(salary → [REDACTED] unless exec_role)

New table added to silver schema → automatically governed.
New schema added to analytics catalog → automatically governed at catalog level.
No per-table GRANT or policy update required.
```

### Iceberg REST Catalog Endpoint Reference Pattern

```
Endpoint: <workspace-url>/api/2.1/unity-catalog/iceberg-rest

Access matrix:
┌─────────────────────────────────────────────┬──────┬───────┐
│ Table Type                                  │ Read │ Write │
├─────────────────────────────────────────────┼──────┼───────┤
│ Managed Iceberg                             │ Yes  │ Yes*  │
│ Foreign Iceberg                             │ Yes  │ No    │
│ Managed Delta (UniForm/Iceberg reads on)    │ Yes  │ No    │
│ External Delta (UniForm on)                 │ Yes  │ No    │
└─────────────────────────────────────────────┴──────┴───────┘
* Write to Managed Iceberg: Public Preview

GA baseline path for OneLake integration:
  OneLake metadata mirroring → exposes UC tables to Fabric engines via shortcuts
  (no Iceberg REST required; uses Fabric SQL analytics endpoint)
```

---

## State of the Art

| Old Approach | Current Approach | When Changed | Impact |
|--------------|-----------------|--------------|--------|
| Per-engine security configuration (cluster ACLs, ADLS RBAC per engine) | Unity Catalog metastore as single governance plane evaluated at query time for all engines | GA with Unity Catalog launch; accelerating 2024-2026 | Any engine that supports Unity Catalog honors the same row filters, column masks, and GRANT policies without re-configuration |
| Per-table GRANT for every new table a team creates | Schema-level GRANT with inheritance model covering current and future tables | GA | Teams grant once at schema creation; dbt rebuilds, new model additions, table replacements require no re-grant |
| RBAC only (role-based, fixed permissions per role) | ABAC (attribute-based, policies tied to tags that inherit down the object hierarchy) | Public Preview 2026 | New schemas and tables covered automatically when tagged; governance scales without administrator overhead per-table |
| Legacy Iceberg REST Catalog endpoint (read-only) | Current Iceberg REST Catalog API (`/api/2.1/unity-catalog/iceberg-rest`) with read+write support | Public Preview DBR 16.4+ | External Iceberg clients can read and write managed Iceberg tables; legacy endpoint is deprecated for new implementations |
| Manual ETL to expose Databricks data to Fabric | OneLake metadata mirroring (catalog structure sync without data movement) | GA 2025 | Fabric engines query Unity Catalog-managed Delta tables via shortcuts without any data replication or pipeline |

**Deprecated/outdated:**
- Legacy read-only Iceberg REST Catalog endpoint: replaced by `/api/2.1/unity-catalog/iceberg-rest`
- Per-cluster GRANT statements for Hive metastore tables: replaced by Unity Catalog schema-level grants
- "Workspace-level groups" in GRANT statements: deprecated; must use account-level groups for cross-workspace governance consistency

---

## Open Questions

1. **Reading OneLake data in Azure Databricks via Unity Catalog Open APIs — current GA status**
   - What we know: announced as "EOY 2025" capability in November 2025 Databricks blog; uses Unity Catalog Connections to OneLake based on Entra Managed Identity
   - What's unclear: whether it shipped GA or in Public Preview; workspace tier requirements (may require Premium); specific limitations vs the metadata mirroring path
   - Recommendation: Document as "verify current status before production adoption." Phase 24 documents the OneLake metadata mirroring (GA) as the primary path; adds a Note callout that the Unity Catalog Open API native path announced for EOY 2025 should be verified. Matches Phase 23's treatment of this open question.

2. **ABAC Public Preview GA timeline**
   - What we know: Public Preview as of 2026-03-23 (last updated date of the ABAC overview); requires DBR 16.4+ or serverless
   - What's unclear: GA date; whether standard DBR < 16.4 will be supported when GA ships
   - Recommendation: Include Warning callout; note the DBR 16.4 requirement; advise architects to validate ABAC on target runtime before committing to it as the primary governance model

3. **Multiple ABAC policies resolving to the same user/table combination**
   - What we know: Only one distinct row filter can resolve at runtime for a given user and table; Azure Databricks blocks access and throws an error if multiple distinct row filters apply to the same user and table
   - What's unclear: how architects design multi-team ABAC schemes that avoid this collision (the docs mention "multiple policies allowed if they result in the same filter")
   - Recommendation: Note the single-filter-per-user-per-table constraint in the ABAC section as an architectural consideration. Recommend defining policies at the highest applicable level (usually catalog) to minimize the risk of conflicting filter resolution.

---

## Validation Architecture

This phase produces Mintlify MDX documentation pages only. There is no application code to unit-test.

### Phase Gate Validation (Manual)

| Req ID | Behavior | Validation Type | Check |
|--------|----------|-----------------|-------|
| UCAT-01 | Lineage, column masks, and row filters described as persisting independently of cluster lifecycle; metastore as the architectural explanation | Manual content review | Section explains why governance survives cluster termination and table rebuilds; metastore concept introduced |
| UCAT-02 | ABAC scheme using tags described; scaling argument (no per-table ACL updates) present; Public Preview Warning callout | Manual content review | ABAC Warning callout present; DBR 16.4 requirement stated; tag inheritance for ABAC evaluation described; per-table vs schema-level contrast present |
| UCAT-03 | Three-level namespace described as governance contract; downstream consumer isolation from storage changes explained | Manual content review | Namespace section explains the storage independence guarantee; workspace-catalog binding mentioned |
| UCAT-04 | Iceberg REST Catalog Public Preview flagged; GA baseline path (OneLake mirroring) identified; access matrix present | Manual content review | Warning callout for Iceberg REST Catalog; GA baseline clearly differentiated from Preview path; access matrix table present |

### Structural Validation (Automated)

```bash
# Verify page exists in expected location
ls /home/khenzo/projects/ai-hub-gateway/docs/data-foundation/unity-catalog-governance.mdx

# Verify minimum content length
wc -l /home/khenzo/projects/ai-hub-gateway/docs/data-foundation/unity-catalog-governance.mdx
# Expect: > 100 lines

# Verify Warning callouts present (at minimum two: ABAC and Iceberg REST)
grep -c "<Warning>" /home/khenzo/projects/ai-hub-gateway/docs/data-foundation/unity-catalog-governance.mdx
# Expect: >= 2
```

### Wave 0 Gaps

- [ ] `docs/data-foundation/unity-catalog-governance.mdx` — does not exist; Wave 1 creates it.
- [ ] `docs/data-foundation/` directory — should exist from Phase 23 (created in Phase 23 Wave 1). Confirm before writing.
- Note: docs.json wiring for the Data Foundation tab is explicitly Phase 29 scope. Phase 24 should NOT touch docs.json.

---

## Sources

### Primary (HIGH confidence)

- Microsoft Learn — Unity Catalog overview: `https://learn.microsoft.com/en-us/azure/databricks/data-governance/unity-catalog/` (updated 2026-04-02, fetched 2026-04-27). Object model hierarchy, three-level namespace, metastore architecture, managed vs external tables, workspace-catalog binding, compute requirements (DBR 11.3+ minimum).
- Microsoft Learn — Row filters and column masks: `https://learn.microsoft.com/en-us/azure/databricks/data-governance/unity-catalog/filters-and-masks/` (updated 2026-04-23, fetched 2026-04-27). GA status (DBR 12.2+), query-time enforcement, ABAC vs manual assignment, performance recommendations, limitations (no time travel with row filters, no vector search index on filtered tables).
- Microsoft Learn — Unity Catalog ABAC: `https://learn.microsoft.com/en-us/azure/databricks/data-governance/unity-catalog/abac/` (updated 2026-03-23, fetched 2026-04-27). **Public Preview status confirmed.** Tag inheritance for ABAC evaluation only. DBR 16.4+ requirement. Row filter and column mask ABAC policy types. Single-filter-per-user-per-table constraint.
- Microsoft Learn — Data lineage: `https://learn.microsoft.com/en-us/azure/databricks/data-governance/unity-catalog/data-lineage` (updated 2026-04-22, fetched 2026-04-27). GA status. Lineage retained indefinitely (all data from September 1, 2024). Column-level lineage. Cross-workspace visibility. Metastore as the storage for lineage events.
- Microsoft Learn — Tags: `https://learn.microsoft.com/en-us/azure/databricks/database-objects/tags` (updated 2026-04-02, fetched 2026-04-27). Supported securable objects (catalogs, schemas, tables, columns, volumes, views, models). ABAC policy evaluation inheritance model. Governed tags. SQL syntax (`SET TAG` DBR 16.1+, `SET TAGS` DBR 13.3+). Constraints (50 tags max per object, key length 255 chars).
- Microsoft Learn — Manage privileges: `https://learn.microsoft.com/en-us/azure/databricks/data-governance/unity-catalog/manage-privileges/` (updated 2026-03-23, fetched 2026-04-27). GA inheritance model: GRANT on schema applies to all current and future tables. ANSI SQL GRANT/REVOKE syntax.
- Microsoft Learn — Iceberg REST Catalog: `https://learn.microsoft.com/en-us/azure/databricks/external-access/iceberg` (updated 2026-04-20, fetched 2026-04-27). **Public Preview status confirmed (DBR 16.4+).** Endpoint `/api/2.1/unity-catalog/iceberg-rest`. Access matrix by table type. Credential vending. Snowflake Entra OAuth path (must use Entra token endpoint, not Databricks OIDC endpoint; scope `2ff814a6-3304-4ab8-85cb-cd0e6f879c1d/.default`).
- Project pre-research — `.planning/research/STACK.md` (2026-04-27). Previously verified GA/Preview status table for all v2.0 technologies including Unity Catalog-specific details.
- Project pre-research — `.planning/research/PITFALLS.md` (2026-04-27). ABAC workspace tier requirements, scope creep from patterns to implementation steps.
- Project pre-research — `.planning/research/ARCHITECTURE.md` (2026-04-27). Unity Catalog component boundaries, integration points with Citadel 4-layer model.

### Secondary (MEDIUM confidence)

- Databricks Blog — `docs/data-foundation/open-platform-dbt-databricks.md` (April 2026). "You don't need to re-run grant statements every time dbt recreates a table. Permissions are managed at the schema level and persist across table rebuilds." Key confirmation of UCAT-01 dbt scenario. HIGH source authority for the schema-level grant persistence claim.
- Databricks Blog — `docs/data-foundation/expanding-onelake-unity-catalog.md` (November 2025). Unity Catalog Open API integration with OneLake. "Reading from OneLake in Azure Databricks" announced for EOY 2025 — GA status not confirmed. OneLake mirroring described as GA. MEDIUM confidence for the Unity Catalog → OneLake read path GA status.

### Tertiary (LOW confidence — needs verification before publication)

- Reading OneLake data in Azure Databricks via Unity Catalog Open APIs GA status: announced EOY 2025 in Databricks blog; not confirmed in any official Microsoft Learn docs fetched for this research. Document as "verify current GA status before production adoption."

---

## Metadata

**Confidence breakdown:**
- Unity Catalog object model and three-level namespace: HIGH — sourced from official Microsoft Learn, updated 2026-04-02/2026-04-21
- Row filters and column masks (GA path): HIGH — sourced from official Microsoft Learn, updated 2026-04-23; DBR 12.2+ requirement verified
- ABAC (Public Preview): HIGH for Public Preview status and DBR 16.4 requirement; sourced from official Microsoft Learn, updated 2026-03-23
- Tag inheritance for ABAC evaluation: HIGH — explicitly stated in official tags doc (updated 2026-04-02)
- Data lineage and retention guarantee: HIGH — sourced from official Microsoft Learn, updated 2026-04-22
- Schema-level GRANT persistence across table rebuilds: HIGH — inheritance model in official privileges doc (2026-03-23) + explicit confirmation in Databricks dbt blog (April 2026)
- Iceberg REST Catalog (Public Preview, endpoint): HIGH — sourced from official Microsoft Learn, updated 2026-04-20
- OneLake mirroring as GA baseline: HIGH — verified in Phase 23 research; STACK.md pre-research
- Reading OneLake data in Databricks via Unity Catalog Open APIs GA status: LOW — announced EOY 2025 in Databricks blog; not confirmed GA in official Microsoft Learn docs

**Research date:** 2026-04-27
**Valid until:** 2026-05-27 (30 days — Unity Catalog is stable; ABAC Public Preview could promote to GA before this date; verify ABAC status before writing if more than 30 days have passed since this research)

**Key caveats:**
1. ABAC is Public Preview — this is the most operationally sensitive finding. DBR 16.4 requirement means some existing clusters cannot use it. GA promotion would change the framing of UCAT-02.
2. Iceberg REST Catalog is Public Preview — the GA baseline for OneLake integration is metadata mirroring. Do not invert this in the page.
3. Tag inheritance applies only during ABAC policy evaluation, not generally. Getting this wrong would lead architects to design incorrect ABAC schemes.
