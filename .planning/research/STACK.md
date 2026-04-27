# Technology Stack: Enterprise Data Foundation Reference Documentation

**Project:** SOF1A 2.0 — AI Governance Platform (Mintlify site)
**Milestone:** v2.0 Enterprise Data Foundation
**Researched:** 2026-04-27
**Research type:** Documentation reference stack — authoritative sources for Mintlify MDX pages

---

## Purpose

This file identifies the correct documentation sources, current versions, GA/Preview status, and key integration points for each technology pair in the Enterprise Data Foundation layer. Documentation authors must cite these sources accurately and flag any capability that is still in Public Preview.

---

## Layer 1: Microsoft OneLake (Microsoft Fabric)

### What to Document

OneLake is the universal storage namespace for Microsoft Fabric. Documentation should cover two distinct patterns — **shortcuts** and **mirroring** — because they have fundamentally different data-movement semantics and governance implications.

### Shortcuts

**GA Status:** Generally Available (last updated 2026-01-08 per Microsoft Learn)

**Authoritative reference:**
- Overview: `https://learn.microsoft.com/en-us/fabric/onelake/onelake-shortcuts`
- Security model: `https://learn.microsoft.com/en-us/fabric/onelake/onelake-shortcut-security`
- REST API for programmatic shortcut management: `https://learn.microsoft.com/en-us/rest/api/fabric/core/onelake-shortcuts`

**Key capabilities for docs:**
- Shortcuts are objects (symbolic links) in OneLake that point to data without copying it. They appear as folders.
- Internal shortcut targets: KQL databases, Lakehouses, Mirrored Azure Databricks Catalogs, Mirrored Databases, Semantic Models, SQL Databases, Warehouses.
- External shortcut targets: ADLS Gen2, Azure Blob Storage, Amazon S3, Amazon S3-compatible, Google Cloud Storage, Dataverse, Iceberg (via Iceberg shortcuts), OneDrive/SharePoint.
- Shortcut caching: available for GCS, S3, S3-compatible, and on-premises gateway shortcuts. Configurable 1-28 day retention. Files > 1 GB are not cached.
- Shortcuts in the `Tables/` folder: only at top level; Delta Parquet format auto-registers as table. Space characters in table names are not supported by Delta format.
- Limits: up to 100,000 shortcuts per item; max 10 shortcuts per single OneLake path; max 5 levels of shortcut-to-shortcut links.

**Security model (critical for ADR docs):**
- Two auth modes: **passthrough** (OneLake-to-OneLake; user identity is passed through) and **delegated** (multicloud shortcuts; intermediate credential used).
- Exception: Power BI DirectLake over SQL and T-SQL in Delegated identity mode use the item owner's identity, not the calling user's identity. This must be documented as a governance consideration.
- OneLake security (RBAC on tables/folders within a Fabric item): currently in **Preview** per the security doc (last updated 2026-04-10).

**NOT to reference:**
- Do not conflate OneLake shortcuts with ADLS Gen2 direct access. Shortcuts are a Fabric concept.
- OneLake security roles (data access control) are still in Preview — flag clearly.

### Mirroring

**GA Status:** Three distinct types with different GA states:
- **Database mirroring** (Azure SQL DB, Cosmos DB, PostgreSQL, SQL Server, Snowflake, Oracle, SAP, BigQuery, SQL MI): Generally Available for most sources.
- **Metadata mirroring** (Azure Databricks / Unity Catalog): Generally Available. No data is moved — only catalog structure is mirrored; underlying data accessed through OneLake shortcuts.
- **Open mirroring** (developer-written change data): Generally Available.
- **Azure Database for MySQL mirroring**: Public Preview — flag clearly.
- **Google BigQuery mirroring**: Public Preview — flag clearly.

**Authoritative reference:**
- Overview: `https://learn.microsoft.com/en-us/fabric/mirroring/overview`
- Azure Databricks (metadata mirroring): `https://learn.microsoft.com/en-us/fabric/mirroring/azure-databricks`
- Tutorial (Databricks): `https://learn.microsoft.com/en-us/fabric/mirroring/azure-databricks-tutorial`

**Key capabilities for docs (metadata mirroring — the relevant pattern here):**
- Mirrors Unity Catalog structure (catalog names, schemas, tables) from Azure Databricks into Fabric. No data movement.
- Changes to source data appear via shortcuts, not replication. Propagation time: seconds to minutes.
- Materialized views and streaming tables are excluded from mirroring.
- External tables that do not support Delta format are excluded.
- Automatic sync of future catalog changes can be toggled.
- Creates a SQL analytics endpoint in Fabric for T-SQL querying of Databricks-managed data.
- Enables Direct Lake mode for Power BI reports against Databricks data.

**Key ADR point:** Metadata mirroring (Databricks) is not the same as database mirroring (transactional replication). Documents should make this distinction explicit when explaining the shortcut vs. mirror decision.

---

## Layer 2: Azure Databricks + Unity Catalog

### Unity Catalog

**GA Status:** Unity Catalog is Generally Available. Managed Delta tables: GA. Managed Iceberg tables: **Public Preview** (Databricks Runtime 16.4 LTS and above, released May 2025).

**Authoritative reference:**
- Unity Catalog overview: `https://learn.microsoft.com/en-us/azure/databricks/data-governance/unity-catalog/`
- Managed tables (Delta + Iceberg): `https://learn.microsoft.com/en-us/azure/databricks/tables/managed`
- External access overview: `https://learn.microsoft.com/en-us/azure/databricks/external-access/`

**Object model (document this for ABAC ADR):**
- Three-level namespace: `catalog.schema.object`
- Securable objects: tables, views, volumes, functions, models, storage credentials, external locations, connections, shares.
- Principle of least privilege enforced by default.
- GRANT/REVOKE via ANSI SQL, Catalog Explorer, CLI, or REST APIs.
- Workspace-catalog binding for environment isolation (dev/staging/prod separation).
- Tags and descriptions as metadata governance primitives.

**ABAC design note:** Unity Catalog uses attribute-based access through row filters and column masks (dynamic views), not a separate ABAC framework. The distinction from role-only RBAC should be documented.

**Key compute requirements:**
- Databricks Runtime 11.3 LTS minimum for Unity Catalog support.
- Databricks Runtime 16.4 LTS required for managed Iceberg tables and Iceberg REST Catalog API.
- Clusters must use Standard or Dedicated access mode; Shared access mode (Hive metastore legacy) cannot access Unity Catalog.

**Open-source Unity Catalog:**
- Unity Catalog is open-sourced. GitHub: `https://github.com/unitycatalog/unitycatalog`
- Announce blog: `https://www.databricks.com/blog/open-sourcing-unity-catalog`
- This is distinct from the Azure Databricks Unity Catalog managed service. Do not conflate.

### Unity Catalog Open API (Unity REST API)

**GA Status:** Unity REST API for Delta clients: Generally Available for reads. Creating and writing to managed tables from Delta clients: **Beta** — flag clearly.

**Authoritative reference:**
- External access with Delta clients: `https://learn.microsoft.com/en-us/azure/databricks/external-access/unity-rest`
- External access overview: `https://learn.microsoft.com/en-us/azure/databricks/external-access/`
- Integrations list: `https://learn.microsoft.com/en-us/azure/databricks/external-access/integrations`

**Key capability:** The Unity REST API enables external engines (Trino, DuckDB, Apache Spark, Daft) to read, write, and create Unity Catalog managed and external tables backed by Delta Lake using credential vending — temporary, scoped credentials that inherit the requesting principal's privileges.

### Iceberg REST Catalog Protocol

**GA Status:** **Public Preview** (Databricks Runtime 16.4 LTS and above). This is the recommended endpoint for Iceberg clients. A legacy read-only Iceberg REST Catalog endpoint also exists — do not cite the legacy endpoint in new documentation.

**Authoritative reference:**
- Iceberg REST Catalog (current): `https://learn.microsoft.com/en-us/azure/databricks/external-access/iceberg`
- Apache Iceberg REST Catalog spec: `https://github.com/apache/iceberg/blob/master/open-api/rest-catalog-open-api.yaml`
- Legacy read-only endpoint (do not recommend): `https://learn.microsoft.com/en-us/azure/databricks/archive/legacy/external-access-iceberg`

**Key endpoint:** `POST <workspace-url>/api/2.1/unity-catalog/iceberg-rest`

**Access matrix (document this):**

| Table Type | Read | Write |
|------------|------|-------|
| Managed Iceberg | Yes | Yes (Public Preview) |
| Foreign Iceberg | Yes | No |
| Managed Delta (UniForm/Iceberg reads enabled) | Yes | No |
| External Delta (UniForm enabled) | Yes | No |

**Supported external engines (verified):** Apache Spark, Apache Flink, Trino, Snowflake, PyIceberg, Dremio.

**Snowflake on Azure note (critical):** Snowflake with Entra service principal OAuth must authenticate directly against the Entra token endpoint (`https://login.microsoftonline.com/<tenant-id>/oauth2/v2.0/token`), NOT the Azure Databricks OIDC endpoint. The required scope is `2ff814a6-3304-4ab8-85cb-cd0e6f879c1d/.default`. This is a common integration pitfall.

**Credential vending:** Both Delta and Iceberg clients support credential vending via Unity Catalog. For SAS token responses, the default expiration is 1 hour. Clients should cache credentials until expiry.

**NOT to reference:**
- The legacy read-only Iceberg REST Catalog endpoint — deprecated in favor of `/api/2.1/unity-catalog/iceberg-rest`.
- Do not state that managed Iceberg tables are GA — they are Public Preview.

---

## Layer 3: dbt-databricks Adapter + Lakeflow Jobs

### dbt-databricks Adapter

**Recommended version:** 1.8.0 or greater (per Microsoft Learn doc, last updated 2026-01-20).

**Authoritative reference:**
- Databricks dbt Core integration: `https://learn.microsoft.com/en-us/azure/databricks/partners/prep/dbt`
- dbt-databricks on PyPI: `https://pypi.org/project/dbt-databricks/`
- dbt Cloud on Databricks: `https://learn.microsoft.com/en-us/azure/databricks/partners/prep/dbt-cloud`
- dbt official docs for Databricks setup: `https://docs.getdbt.com/docs/core/connect-data-platform/databricks-setup`

**Key capabilities for documentation:**
- Use `dbt-databricks` (not `dbt-spark`) for all new Databricks projects. `dbt-databricks` is purpose-built for Databricks and supports Unity Catalog natively.
- Unity Catalog integration: when initializing a project, select "use Unity Catalog" to write to a three-level namespace (`catalog.schema.model`).
- Supports both Databricks compute (all-purpose clusters) and SQL Warehouses. SQL Warehouses are recommended for production transformations.
- Authentication: OAuth (recommended) or personal access token. For service principals, use OAuth M2M.
- dbt models compile to SQL executed on Databricks; no data extraction or loading.

**MetricFlow / dbt Semantic Layer:**
- MetricFlow is the semantic modeling framework embedded in dbt (dbt Labs product). It defines semantic models, metrics, dimensions, and entities in YAML alongside dbt models.
- The dbt Semantic Layer exposes MetricFlow-defined metrics via a hosted query API (JDBC/GraphQL) to downstream tools.
- Authoritative dbt MetricFlow docs: `https://docs.getdbt.com/docs/build/about-metricflow` — note this is at getdbt.com, not Microsoft Learn. WebFetch was restricted for this domain during research; confidence is MEDIUM based on training data + context from the semantic-layer-architecture.md source document.
- MetricFlow is distinct from Unity Catalog Business Semantics (Databricks' platform-native semantic layer). They serve complementary roles — MetricFlow for transformation-time metric definition, Unity Catalog Business Semantics for platform-native AI agent grounding.

**Medallion architecture note for docs:**
- dbt-databricks enables Bronze → Silver → Gold layered transformation with models targeting Delta Lake tables managed by Unity Catalog.
- Lakeflow Jobs can trigger dbt runs as a job task type.

### Lakeflow Jobs

**GA Status:** Generally Available. This is the current name for what was previously called "Databricks Jobs" / "Databricks Workflows." The branding change to "Lakeflow Jobs" is reflected in official Microsoft Learn docs as of 2026-04-07.

**Authoritative reference:**
- Lakeflow Jobs overview: `https://learn.microsoft.com/en-us/azure/databricks/jobs/`
- Jobs REST API reference: `https://docs.databricks.com/api/azure/workspace/jobs`
- Orchestrate with Airflow: `https://learn.microsoft.com/en-us/azure/databricks/jobs/how-to/use-airflow-with-jobs`

**Key capabilities for documentation:**
- Lakeflow Jobs orchestrates tasks as a DAG (Directed Acyclic Graph). Supports notebooks, Python scripts, Spark jobs, SQL tasks, dbt tasks, pipeline tasks (Lakeflow Spark Declarative Pipelines), and external tool tasks.
- Supports if/else branching and for-each looping in the visual authoring UI.
- Trigger types: scheduled (cron), file-arrival (event-based), manual.
- Built-in monitoring via system tables (`system.lakeflow.job_runs`, `system.lakeflow.task_runs`) — verify exact table names against current docs.
- Limits: 2,000 concurrent task runs per workspace; 12,000 saved jobs per workspace; 1,000 tasks per job.
- Programmatic management: Databricks CLI, Declarative Automation Bundles (asset bundles), SDKs, REST API.
- Integration with Azure Data Factory and Apache Airflow for external orchestration.

**NOT to reference:**
- "Databricks Workflows" or "Databricks Jobs" as distinct product names — the current official name is Lakeflow Jobs. The REST API path `/api/2.1/jobs/` is still the underlying endpoint.

---

## Layer 4: Semantic Layer — MetricFlow + Unity Catalog Business Semantics

### MetricFlow (dbt Semantic Layer)

**Status:** Generally Available in dbt Cloud; available in dbt Core as `dbt-metricflow` package.

**Authoritative reference (MEDIUM confidence — WebFetch to getdbt.com was blocked during this research session; these URLs are from training data + the semantic-layer-architecture.md source):**
- MetricFlow overview: `https://docs.getdbt.com/docs/build/about-metricflow`
- Semantic models: `https://docs.getdbt.com/docs/build/semantic-models`
- Metrics reference: `https://docs.getdbt.com/docs/build/metrics-overview`
- dbt Semantic Layer overview: `https://docs.getdbt.com/docs/use-dbt-semantic-layer/dbt-sl`

**Verify before citing:** Authors should directly load `https://docs.getdbt.com/docs/build/about-metricflow` to confirm current syntax and GA status before writing MetricFlow-specific content.

**Key YAML primitives to document:**
- `semantic_model`: defines the semantic view of a dbt model (primary entity, dimensions, measures).
- `metric`: references a semantic model and defines a computation (simple, ratio, cumulative, derived).
- `entity`: specifies join keys for cross-model metric queries.
- Dimension types: `categorical`, `time`.
- Measure types: `simple` (SUM, COUNT, etc.), `ratio`, `cumulative`, `derived`.

**Integration with Databricks:**
- MetricFlow generates optimized SQL against the Databricks SQL Warehouse.
- dbt Semantic Layer query results can be served through the dbt-hosted JDBC endpoint or GraphQL API to BI tools (Tableau, Hex, Mode) and AI agents.

### Unity Catalog Business Semantics (Metric Views + Genie)

**Status:** Metric Views are available in Databricks SQL (GA status not explicitly confirmed in docs reviewed — treat as GA for standard Unity Catalog features, but verify the `CREATE METRIC VIEW` DDL against current docs).

**Genie:** Generally Available for core natural language query features. File uploads in Genie: **Public Preview**.

**Authoritative reference:**
- Genie spaces overview: `https://learn.microsoft.com/en-us/azure/databricks/genie/`
- Genie knowledge store: `https://learn.microsoft.com/en-us/azure/databricks/genie/knowledge-store`
- Genie setup and management: `https://learn.microsoft.com/en-us/azure/databricks/genie/set-up`
- Databricks semantic layer blog (source document in this repo): `https://www.databricks.com/blog/semantic-layer-architecture-components-design-patterns-and-ai-integration`

**Key capabilities to document (Business Semantics for AI agents):**

Genie is the Databricks AI/BI natural language interface built on Unity Catalog Business Semantics. It uses:
- Unity Catalog table metadata (names, descriptions, PK/FK relationships) as grounding context.
- Column names, descriptions, and sample values for query generation.
- Space-level knowledge store (author-curated metadata, JOIN instructions, sample SQL).
- Row-level security and column masks from Unity Catalog are enforced per calling user automatically.

For AI agent integration, document the two modes:
1. **Grounding**: Agent reads Unity Catalog metadata (table/column descriptions, metric definitions) before generating any query.
2. **Execution**: Agent queries against governed metric definitions (metric views) rather than raw tables — same path as Genie queries.

**Integration point with APIM:** Databricks SQL REST API (Statement Execution API, see below) is the mechanism through which APIM can front governed semantic queries. Genie itself also exposes an API endpoint — verify current docs for `/api/2.0/genie/spaces/{space_id}/start-conversation` before documenting.

---

## Layer 5: Azure APIM Integration for Governed Semantic Endpoints

### Databricks SQL Statement Execution API

**GA Status:** Generally Available. API version: **2.0** (`/api/2.0/sql/statements/`).

**Authoritative reference:**
- Tutorial: `https://learn.microsoft.com/en-us/azure/databricks/dev-tools/sql-execution-tutorial`
- REST API reference: `https://docs.databricks.com/api/azure/workspace/statementexecution`
- Query History API: `https://docs.databricks.com/api/azure/workspace/queryhistory`

**Key endpoint pattern:**

```
POST https://<workspace-url>/api/2.0/sql/statements/
Authorization: Bearer <PAT or OAuth token>
Content-Type: application/json

{
  "warehouse_id": "<warehouse-id>",
  "catalog": "<catalog>",
  "schema": "<schema>",
  "statement": "SELECT ...",
  "parameters": [...]
}
```

**Key capabilities for APIM ADR documentation:**
- Parameterized queries via named parameters (`:param_name` syntax) — prevents SQL injection for APIM-fronted endpoints.
- Result formats: `JSON_ARRAY` (inline, ≤ 25 MiB), `ARROW_STREAM` (chunked, via `EXTERNAL_LINKS` disposition for large results).
- Async execution: API returns statement ID immediately if result not ready within `wait_timeout` (5–50 seconds, default 10 seconds).
- `EXTERNAL_LINKS` disposition returns SAS URLs (short-lived, ~1 hour) pointing to ADFS result chunks. APIM policy must strip the `Authorization` header when proxying SAS URL download requests.
- Query tags: `query_tags` array for cost attribution and filtering via `system.query.history` — in **Public Preview**.
- Authentication: PAT or OAuth (service principal OAuth M2M recommended for APIM backend auth).
- `EXTERNAL_LINKS` disposition can be disabled by Databricks support — note this constraint for compliance-sensitive deployments.

**APIM integration pattern for docs:**
APIM acts as the governed API surface; the Statement Execution API is the backend. APIM policies handle:
- Token exchange (Entra MI → Databricks OAuth or PAT)
- Rate limiting and quota enforcement per AI Access Contract
- Request parameter validation before forwarding to Databricks
- Response caching for repeated semantic queries

### Lakeflow Jobs REST API

**Authoritative reference:** `https://docs.databricks.com/api/azure/workspace/jobs`

**API version:** 2.1 (`/api/2.1/jobs/`)

---

## Alternatives Considered

| Category | Recommended | Alternative | Why Not |
|----------|-------------|-------------|---------|
| Iceberg catalog endpoint | `/api/2.1/unity-catalog/iceberg-rest` | Legacy read-only Iceberg endpoint | Legacy endpoint is deprecated for new implementations |
| dbt adapter | `dbt-databricks >= 1.8.0` | `dbt-spark` | `dbt-spark` lacks Unity Catalog native support and Databricks-specific optimizations |
| Orchestration naming | Lakeflow Jobs | Databricks Workflows / Databricks Jobs | Former names are deprecated in official docs as of 2026 |
| Semantic layer grounding | Unity Catalog metadata + Metric Views | Text-to-SQL directly against raw tables | Text-to-SQL produces inconsistent, ungoverned results; semantic grounding inherits Unity Catalog access policies |
| Mirroring for Databricks | Metadata mirroring (no data movement) | Database mirroring (full replication) | Metadata mirroring preserves Unity Catalog as the governance plane; database mirroring duplicates data and splits governance |

---

## Pre-GA / Preview Items — Mandatory Flagging in Documentation

| Feature | Status | Doc Action Required |
|---------|--------|-------------------|
| Unity Catalog managed Iceberg tables | Public Preview (DBR 16.4 LTS+) | Add `<Warning>` callout in Mintlify MDX |
| Iceberg REST Catalog API (`/api/2.1/unity-catalog/iceberg-rest`) | Public Preview | Add `<Warning>` callout |
| Writing to managed Unity Catalog tables from Delta clients (Unity REST API) | Beta | Add `<Note>` callout |
| OneLake data access roles / OneLake security (RBAC) | Preview | Add `<Warning>` callout |
| Genie file uploads | Public Preview | Add `<Note>` callout |
| Query tags in Statement Execution API | Public Preview | Add `<Note>` callout |
| Azure Database for MySQL mirroring | Public Preview | Add `<Warning>` callout |
| Google BigQuery mirroring | Public Preview | Add `<Warning>` callout |

---

## Documentation URL Index

**Microsoft OneLake:**
- Shortcuts: `https://learn.microsoft.com/en-us/fabric/onelake/onelake-shortcuts`
- Shortcut security: `https://learn.microsoft.com/en-us/fabric/onelake/onelake-shortcut-security`
- Mirroring overview: `https://learn.microsoft.com/en-us/fabric/mirroring/overview`
- Databricks metadata mirroring: `https://learn.microsoft.com/en-us/fabric/mirroring/azure-databricks`

**Unity Catalog:**
- Overview: `https://learn.microsoft.com/en-us/azure/databricks/data-governance/unity-catalog/`
- Managed tables: `https://learn.microsoft.com/en-us/azure/databricks/tables/managed`
- External access: `https://learn.microsoft.com/en-us/azure/databricks/external-access/`
- Iceberg REST Catalog: `https://learn.microsoft.com/en-us/azure/databricks/external-access/iceberg`
- Credential vending: `https://learn.microsoft.com/en-us/azure/databricks/external-access/credential-vending`
- Integrations list: `https://learn.microsoft.com/en-us/azure/databricks/external-access/integrations`

**dbt + Lakeflow:**
- dbt Core on Databricks: `https://learn.microsoft.com/en-us/azure/databricks/partners/prep/dbt`
- dbt-databricks PyPI: `https://pypi.org/project/dbt-databricks/`
- MetricFlow (verify before citing): `https://docs.getdbt.com/docs/build/about-metricflow`
- Lakeflow Jobs: `https://learn.microsoft.com/en-us/azure/databricks/jobs/`
- Jobs REST API: `https://docs.databricks.com/api/azure/workspace/jobs`

**Semantic Layer / Business Semantics:**
- Genie: `https://learn.microsoft.com/en-us/azure/databricks/genie/`
- Databricks semantic layer blog: `https://www.databricks.com/blog/semantic-layer-architecture-components-design-patterns-and-ai-integration`

**SQL REST API:**
- Statement Execution tutorial: `https://learn.microsoft.com/en-us/azure/databricks/dev-tools/sql-execution-tutorial`
- Statement Execution API reference: `https://docs.databricks.com/api/azure/workspace/statementexecution`

**Apache Iceberg spec (external):**
- REST Catalog OpenAPI spec: `https://github.com/apache/iceberg/blob/master/open-api/rest-catalog-open-api.yaml`

---

## Confidence Assessment

| Area | Confidence | Basis |
|------|------------|-------|
| OneLake shortcuts | HIGH | Official Microsoft Learn docs fetched directly (2026-01-08 / 2026-04-10) |
| OneLake mirroring (Databricks metadata mirroring) | HIGH | Official Microsoft Learn docs fetched directly (2026-02-17 / 2026-03-18) |
| Unity Catalog overview and object model | HIGH | Official Microsoft Learn docs fetched directly (2026-04-02 / 2026-04-21) |
| Unity Catalog managed Iceberg tables | HIGH | Official Microsoft Learn docs fetched directly (2026-03-31) |
| Iceberg REST Catalog API | HIGH | Official Microsoft Learn docs fetched directly (2026-04-20) |
| Unity Catalog credential vending | HIGH | Official Microsoft Learn docs fetched directly (2026-04-13) |
| dbt-databricks adapter version | HIGH | Official Microsoft Learn docs fetched directly (2026-01-20) |
| Lakeflow Jobs (naming + capabilities) | HIGH | Official Microsoft Learn docs fetched directly (2026-04-07) |
| SQL Statement Execution API | HIGH | Official Microsoft Learn docs fetched directly (2026-02-27) |
| MetricFlow YAML syntax | MEDIUM | dbt official docs domain was blocked during this research session; syntax based on training data + semantic-layer source doc |
| Unity Catalog Business Semantics / Metric Views | MEDIUM | Genie docs fetched (HIGH), but specific `CREATE METRIC VIEW` DDL page returned 404 — verify against current Databricks SQL language manual |
| Genie API endpoint for AI agent integration | LOW | URL pattern known from training data but not verified this session — verify `https://learn.microsoft.com/en-us/azure/databricks/genie/api` before documenting |

---

## Gaps to Address Before Writing

1. **MetricFlow semantic model syntax:** Fetch `https://docs.getdbt.com/docs/build/about-metricflow` directly to confirm current YAML syntax for `semantic_model`, `metric`, and `entity` blocks. dbt Labs updates MetricFlow syntax regularly.

2. **`CREATE METRIC VIEW` DDL:** The Databricks SQL language manual page for metric views returned 404 during this research session. Search `https://learn.microsoft.com/en-us/azure/databricks/sql/language-manual/` for the current metric view syntax before writing the Business Semantics ADR.

3. **Genie API for AI agents:** Verify whether Databricks exposes a programmatic Genie API (conversation endpoint) suitable for APIM integration. Search `https://docs.databricks.com/api/azure/workspace/` for `genie`.

4. **dbt Lakeflow Jobs task type:** Confirm current dbt task configuration syntax in Lakeflow Jobs UI vs REST API — the Lakeflow Jobs overview mentioned dbt as a task type but did not provide syntax detail.

5. **Databricks Runtime version requirement for dbt-databricks 1.8+:** Confirm minimum DBR version required for dbt-databricks 1.8.x against dbt Labs changelog.
