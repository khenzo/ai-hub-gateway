# Phase 23: OneLake Architecture - Research

**Researched:** 2026-04-27
**Domain:** Microsoft OneLake (Microsoft Fabric) — shortcuts, mirroring, universal namespace, uniform security enforcement
**Confidence:** HIGH

---

<phase_requirements>
## Phase Requirements

| ID | Description | Research Support |
|----|-------------|-----------------|
| LAKE-01 | User can understand when to use OneLake shortcuts vs mirroring — decision criteria, security enforcement surface differences, and when each pattern applies | Shortcut vs mirror ADR decision tree fully documented; security enforcement surface differences (passthrough vs delegated auth; Fabric workspace security vs source-system security) are precisely characterized from official Microsoft Learn docs |
| LAKE-02 | User can understand how OneLake provides a universal storage namespace connecting ADLS, Dataverse, and SharePoint sources without data movement | Universal namespace architecture, shortcut types, and ADLS DFS endpoint path pattern are all GA and documented; SharePoint/OneDrive shortcuts are Public Preview (flag required) |
| LAKE-03 | User can understand how OneLake enforces uniform table-, row-, and column-level security across all compute engines reading the same Delta/Iceberg files | OneLake security (Preview) architecture documented — defines-once-enforces-everywhere model, authorized engine model, and compute permission vs OneLake security distinction are all sourced from official Microsoft Learn docs |
</phase_requirements>

---

## Summary

Phase 23 produces the OneLake Architecture documentation page(s) for the Enterprise Data Foundation section. The content must enable architects to reason about OneLake as a universal storage substrate — with enough precision to apply the shortcut vs mirror decision to real scenarios, understand how the universal namespace eliminates data movement, and explain how table/row/column security is enforced uniformly across compute engines.

The source material for this phase is strong: Microsoft Learn official documentation (updated April 2026) provides authoritative GA/Preview status for all capabilities. Project pre-research files (`docs/data-foundation/`, `.planning/research/`) have already synthesized the key patterns. The planner's main task is to structure this material into architect-facing documentation following the established Citadel/SOF1A 2.0 Mintlify patterns.

**Critical constraint:** This is documentation-only content. No code, no YAML, no step-by-step instructions. The audience is architects, not developers. Every section should answer a design decision question, not a setup question.

**Primary recommendation:** Produce one primary OneLake architecture page covering all three requirements (LAKE-01, LAKE-02, LAKE-03), structured around three decision frameworks: (1) the shortcut vs mirror ADR, (2) the universal namespace model, and (3) the security enforcement architecture. A single well-structured page avoids navigation overhead for content that is conceptually unified.

---

## User Constraints

No CONTEXT.md exists for this phase. The following constraints are drawn from STATE.md and REQUIREMENTS.md project decisions.

### Locked Decisions (from STATE.md Architectural Context)

- **Data Foundation is NOT a fifth Citadel layer** — it attaches at three existing points: Layer 1 (APIM), Layer 2 (observability), Layer 4 (Security Fabric). Phase 23 content must reinforce this framing.
- **Scope: documentation only** — no Bicep, no dbt YAML, no GitHub Actions, no code artifacts of any kind. This is an absolute constraint.
- **8 Pre-GA capabilities require Warning callouts** — OneLake security (table/row/column level) is currently in Public Preview. SharePoint/OneDrive shortcuts are in Public Preview. These MUST be flagged.
- **SAP Datasphere mirroring: out of scope** — explicitly deferred to v2.1 per REQUIREMENTS.md Out of Scope table.
- **Multi-region OneLake replication: out of scope** — single-region pattern for v2.0.
- **Real-time streaming ingestion (Event Hub → Delta): out of scope** — batch-first for v2.0.
- **OneLake identity delegation ADR (DirectLake governance gap): out of scope** — deferred specialist edge case for v2.1.

### Claude's Discretion

- Page count and structure within the phase: one comprehensive page vs two focused pages.
- Depth of treatment for shortcut transformation capability (format conversion, AI-powered enrichments) — include as a differentiator or defer.
- Whether to include the "authorized engine model" for third-party enforcement in the security section or cross-link only.

### Deferred Ideas (OUT OF SCOPE)

- Power BI Direct Lake setup
- Multi-region OneLake replication
- Real-time streaming ingestion
- SAP Datasphere mirroring
- OneLake identity delegation ADR (DirectLake governance gap)
- Snowflake bidirectional integration (out of scope per REQUIREMENTS.md)

---

## Standard Stack

This phase produces Mintlify MDX documentation pages, not software. The "stack" is the documentation platform and content structure.

### Core Documentation Platform
| Component | Version/Status | Purpose | Why Standard |
|-----------|---------------|---------|--------------|
| Mintlify | Current (docs.json schema) | Documentation site | Project standard — all existing pages use this |
| MDX | Standard | Page format | All docs use .mdx with Mintlify components |
| Mintlify CardGroup + Card | Built-in | Navigation and cross-links | Established project pattern (see Phase 9, 12 decisions) |
| Mintlify Warning/Note callout | Built-in | Pre-GA flags | Required for all Public Preview capabilities |
| ASCII art diagrams | None | Architecture visuals | Project standard — decided in Phase 3 (ASCII chosen for clarity, maintainability, VCS compatibility) |

### Source Technologies Being Documented
| Technology | Version/Status | Official Docs |
|------------|---------------|---------------|
| Microsoft OneLake | GA (shortcuts + metadata mirroring); Preview (security roles) | https://learn.microsoft.com/en-us/fabric/onelake/onelake-overview |
| OneLake Shortcuts | GA (updated 2026-01-08) | https://learn.microsoft.com/en-us/fabric/onelake/onelake-shortcuts |
| OneLake Mirroring (Databricks metadata) | GA | https://learn.microsoft.com/en-us/fabric/mirroring/azure-databricks |
| OneLake Mirroring (database CDC) | GA for Azure SQL, Cosmos DB, PostgreSQL, Snowflake, Oracle, SQL Server; Preview for MySQL, BigQuery | https://learn.microsoft.com/en-us/fabric/mirroring/overview |
| OneLake Security (table/row/column) | **Public Preview** (updated 2026-04-10) | https://learn.microsoft.com/en-us/fabric/onelake/security/get-started-security |
| OneLake Shortcut Security | GA (updated 2026-04-10) | https://learn.microsoft.com/en-us/fabric/onelake/onelake-shortcut-security |
| SharePoint/OneDrive shortcuts | **Public Preview** | https://learn.microsoft.com/en-us/fabric/onelake/shortcuts/create-onedrive-sharepoint-shortcut |

### Installation
Not applicable — this phase produces documentation pages, not code.

---

## Architecture Patterns

### Recommended Page Structure

```
docs/data-foundation/
└── onelake-architecture.mdx     # Primary page for Phase 23 (all three requirements)
```

Page internal structure:
```
1. Introduction — OneLake as universal storage substrate (namespace concept)
2. The Universal Namespace (LAKE-02)
   - What the namespace provides (ADLS, Dataverse, SharePoint, OneLake-to-OneLake)
   - ADLS DFS endpoint URI pattern
   - Implications for agents querying across sources
3. Shortcut vs Mirroring Decision (LAKE-01 — primary ADR)
   - Shortcut: what it is, when to use, security surface
   - Mirroring: what it is, three types, when to use, security surface
   - Decision matrix table
4. Security Enforcement Architecture (LAKE-03)
   - OneLake security (Preview) — define-once, enforce-everywhere model
   - Table / row / column level granularity
   - Compute engine coverage (Spark, SQL Analytics, AI agent)
   - Security surface difference: shortcut (passthrough vs delegated) vs mirroring
5. GA vs Preview Status Callout (success criterion 4)
6. Connection to Citadel Architecture
   - Where OneLake attaches to the 4-layer model
   - Cross-links to Layer 4 Security Fabric
```

### Pattern 1: Shortcut — Pure Metadata Pointer

**What:** A shortcut is a symbolic link object in OneLake that points to data without copying it. The data stays in its original location (ADLS Gen2, S3, GCS, Dataverse, SharePoint, another OneLake location). It appears as a native folder or table within a Fabric lakehouse.

**When to use:**
- Source data is already in an open format (Delta, Parquet, Iceberg, CSV)
- Zero data movement is the firm requirement
- Source system security must be the authoritative enforcement point (passthrough mode for OneLake-to-OneLake shortcuts)
- Cross-cloud or hybrid data needs to appear in the same Fabric workspace without replication
- Data is in ADLS Gen2 — this is the canonical shortcut use case (GA, lowest friction)

**Security surface for shortcuts:**
- **Internal OneLake shortcuts (OneLake-to-OneLake):** Always passthrough mode. The calling user's identity is forwarded to the target location. Source system security controls what the user sees. OneLake security roles on the shortcut path further filter access. Critical: cannot override source security.
- **External shortcuts (S3, GCS, ADLS from another tenant, etc.):** Always delegated mode. An intermediate credential (cloud connection) is used to access the external system. OneLake security roles defined on the delegated shortcut control what end users can see.
- **DirectLake over SQL / T-SQL Delegated identity mode exception:** These engines do NOT pass through the calling user's identity. They use the item owner's identity for the target access, then apply OneLake security roles to filter results. This is a governance gap: row/column filters in the target system bypass the end user's identity. Architects must be aware of this when choosing DirectLake over SQL for governed scenarios.

**Source:** Microsoft Learn — `learn.microsoft.com/en-us/fabric/onelake/onelake-shortcuts` (updated 2026-04-13) and `learn.microsoft.com/en-us/fabric/onelake/onelake-shortcut-security` (updated 2026-04-10)

### Pattern 2: Metadata Mirroring — Catalog Sync Without Data Copy (Databricks)

**What:** Metadata mirroring synchronizes the Unity Catalog structure (catalog names, schemas, tables) from Azure Databricks into Fabric. No data is moved. OneLake creates and manages shortcuts automatically for the underlying Delta/Iceberg data that lives in ADLS. The result: Fabric compute engines can query Databricks-managed tables via a SQL analytics endpoint without any manual ETL.

**When to use:**
- Source is Azure Databricks with Unity Catalog
- Need to expose Databricks-managed Delta tables to Fabric workloads (Spark, T-SQL, Power BI)
- Source data already resides in ADLS-backed Delta files (the most common Databricks pattern)
- Want Unity Catalog governance to remain authoritative for Databricks-side access

**Security surface:**
- Databricks Unity Catalog security (GRANT/REVOKE, row filters, column masks) applies when Databricks engines query the data
- When Fabric engines query via shortcuts created by metadata mirroring, Fabric workspace security + OneLake security roles apply — NOT Unity Catalog policies
- This is the critical governance split: the same physical data has two separate security enforcement surfaces depending on which engine reads it. The page must make this explicit.

**GA status:** Generally Available (confirmed in mirroring overview, updated 2026-03-31)

### Pattern 3: Database Mirroring — CDC Replication for Closed-Format Sources

**What:** Database mirroring performs CDC (change data capture) replication for sources that use closed or proprietary storage systems (Azure SQL, Cosmos DB, Snowflake, Oracle, SQL Server). Data is replicated into OneLake storage in open Delta Parquet format. Fabric manages the replication process; replicated storage is free up to capacity-based limits.

**When to use:**
- Source is an operational database (Azure SQL, Cosmos DB, Postgres, SQL Server)
- Source uses closed storage format (not Delta/Iceberg backed by ADLS)
- Near real-time analytics on operational data without touching the source system
- CDC changelog analysis required

**Security surface:** The replicated Delta copy in OneLake is governed entirely by Fabric workspace roles + OneLake security roles. The source system's security model does NOT propagate to the copy. This is architecturally distinct from shortcuts.

**GA status by source:**
- GA: Azure SQL DB, Azure SQL MI, Azure Cosmos DB, Azure Database for PostgreSQL, Snowflake, Oracle, SQL Server
- **Public Preview:** Azure Database for MySQL, Google BigQuery
- **Out of scope for v2.0:** SAP Datasphere (explicitly deferred)

### Decision Matrix — Shortcut vs Mirroring

```
SOURCE TYPE                    RECOMMENDED PATTERN          SECURITY SURFACE
──────────────────────────────────────────────────────────────────────────────
ADLS Gen2 / Azure Blob         Shortcut (external)          Fabric workspace +
                                                            OneLake roles (delegated)
OneLake / another Fabric item  Shortcut (internal)          Source system (passthrough)
Dataverse                      Shortcut (external)          Fabric workspace +
                                                            OneLake roles (delegated)
SharePoint / OneDrive          Shortcut (external, Preview) Fabric workspace +
                                                            OneLake roles (delegated)
Azure Databricks / UC          Metadata mirroring (GA)      Split surface — see note
Azure SQL DB / Cosmos DB       Database mirroring (GA)      Fabric only (replica)
Snowflake / Oracle             Database mirroring (GA)      Fabric only (replica)
Azure DB for MySQL             Database mirroring (Preview) Fabric only (replica)
```

**Note on split security surface (Databricks metadata mirroring):** When Fabric engines (Spark, T-SQL, Power BI) read data via the shortcuts created by Databricks metadata mirroring, they are reading from the original ADLS-backed Delta files through Fabric-managed shortcuts. Unity Catalog access controls (row filters, column masks) are NOT enforced on the Fabric side. Architects integrating Databricks and Fabric must document this boundary explicitly.

### Anti-Patterns to Avoid

- **Describing mirroring as "zero-copy" uniformly:** Only metadata mirroring is zero-copy (uses shortcuts). Database mirroring DOES copy data via CDC replication. Using "zero-copy" for both is technically incorrect and misleads architects designing security models.
- **Asserting Unity Catalog security applies to Fabric shortcut reads:** It does not. The security surface splits at the Fabric/Databricks boundary. The page must make this explicit.
- **Describing OneLake security roles as GA:** They are Public Preview as of 2026-04-10. Always pair with a Warning callout.
- **Describing SharePoint/OneDrive shortcuts as GA:** They are Public Preview. Always pair with a Warning callout.
- **Presenting ADO-style step-by-step connection setup:** Out of scope. Describe the pattern (Entra MI token → ADLS DFS endpoint path) architecturally; do not reproduce the Python code from `integrate-onelake-azure-databricks.md`.

---

## Don't Hand-Roll

| Problem | Don't Build | Use Instead | Why |
|---------|-------------|-------------|-----|
| Universal namespace diagram | Custom Fabric topology diagram | ASCII art following project conventions | ASCII is the established project pattern; version-control friendly |
| Pre-GA capability list | Researching from scratch each phase | The GA/Preview status table in this RESEARCH.md (sourced from official docs April 2026) | Status verified against Microsoft Learn; re-verification needed after ~30 days |
| Shortcut security model explanation | Own synthesis | Direct synthesis from `onelake-shortcut-security` official doc | Official doc (updated 2026-04-10) is precise and complete on passthrough/delegated distinction |
| Fabric workspace role table | Own creation | Reference the existing workspace roles table from the official doc | Already in official Microsoft Learn docs; paraphrase, don't duplicate |

---

## Common Pitfalls

### Pitfall 1: Collapsing Shortcut vs Mirror into a Single "No-Copy" Claim

**What goes wrong:** Page describes both shortcuts and metadata mirroring as "zero-copy" without distinguishing that database mirroring replicates data. Architects design security models on the wrong assumption.

**Why it happens:** The `microsoft-onelake-unified-data-lake.md` source article uses "zero-copy" loosely. Microsoft marketing uses it for both. The author reads the headline and writes the page from it.

**How to avoid:** The shortcut vs mirror section must explicitly state:
- Shortcuts: data never moves, source-system security applies (passthrough) or source accessed via delegated credential (external)
- Metadata mirroring (Databricks): no data moves, but the security surface splits at the Fabric boundary
- Database mirroring: CDC replication; data DOES move into OneLake storage; Fabric security model applies to the copy

**Warning signs:** Any paragraph that says "data never moves" when describing all three patterns together. Any ADR that treats all three as equivalent for governance purposes.

### Pitfall 2: Stating OneLake Security Roles Are GA

**What goes wrong:** The page describes table/row/column security enforcement without flagging the Public Preview status of the OneLake security feature itself.

**Why it happens:** The capability (table/row/column security) is real and functional. The author describes what it does correctly but omits the Preview flag.

**How to avoid:** OneLake security — the feature that provides table, row, and column security roles enforced across all Fabric compute engines — is in **Public Preview** as of 2026-04-10 (confirmed from Microsoft Learn official doc). Every mention of this capability in the page MUST include a Warning callout. Use the Mintlify `<Warning>` component.

**Warning signs:** Any section on security enforcement that doesn't include a Preview warning.

### Pitfall 3: Claiming DirectLake Provides Full Identity Passthrough

**What goes wrong:** The page describes shortcut security as always passing through the calling user's identity, without noting the DirectLake over SQL / T-SQL Delegated identity mode exception.

**Why it happens:** The passthrough model is the general rule. The exception is buried in the shortcut security official doc.

**How to avoid:** Include an explicit callout: "When Power BI semantic models use DirectLake over SQL, or T-SQL engines operate in Delegated identity mode, the item owner's identity is used to access the shortcut target — not the calling user's identity. OneLake security roles still filter results, but source-system policies see the item owner, not the end user."

**Warning signs:** Any security section that describes shortcuts as always passing through the calling user without the DirectLake exception.

### Pitfall 4: Describing the Unity Catalog Open API as the Recommended GA Path for Databricks-to-OneLake

**What goes wrong:** The November 2025 Databricks announcement describes "Reading from OneLake in Azure Databricks via Unity Catalog Open APIs" as an EOY 2025 capability. If documented without a current GA verification, the page may describe a capability that has changed.

**How to avoid:** The currently verified GA path for Databricks-to-OneLake integration is metadata mirroring (Azure Databricks mirroring in Fabric — GA). The Unity Catalog Open API reading OneLake in Databricks is a newer path announced for EOY 2025; its production readiness should be flagged as "verify current status." Do not present it as the primary recommended path in Phase 23.

**Warning signs:** Any section presenting Unity Catalog Open API integration as the recommended production path without a verification callout.

---

## Code Examples

This phase produces no code. The following are architecture description patterns (not code) that the page should express.

### Universal Namespace URI Pattern

The OneLake ADLS DFS endpoint follows this pattern:
```
abfss://{workspace_id}@onelake.dfs.fabric.microsoft.com/{item_id}.lakehouse/Tables/{table_name}
```

This is the same API surface as ADLS Gen2 — any tool that reads ADLS can read OneLake data at this path. This is the mechanism for "connecting ADLS, Dataverse, and SharePoint sources without copying data" (LAKE-02): tools that speak ADLS DFS simply point at this endpoint and receive OneLake data through shortcuts or native tables.

Source: `learn.microsoft.com/en-us/fabric/onelake/onelake-azure-databricks` (Microsoft Learn, updated 2026-04-25)

### ASCII Diagram — OneLake Universal Namespace

```
Agents / Fabric Compute Engines
  Spark  |  SQL Analytics  |  KQL  |  Analysis Services
         |                 |       |
         +─────────────────+───────+
                           |
                    OneLake Namespace
            onelake.dfs.fabric.microsoft.com
                           |
          +────────────────+────────────────+
          |                |                |
    Shortcuts          Metadata         Database
    (pointers,         Mirroring        Mirroring
     no copy)        (catalog sync,     (CDC copy,
          |           no data copy)     Delta in OL)
    ┌─────┴─────┐
    │  ADLS Gen2│
    │  Dataverse│  ← source security applies (passthrough)
    │  S3 / GCS │  ← delegated credential applies
    │  SharePoint│  ← Public Preview
    └───────────┘
```

---

## State of the Art

| Old Approach | Current Approach | When Changed | Impact |
|--------------|-----------------|--------------|--------|
| ETL pipeline to centralize data | OneLake shortcuts (metadata pointer, no copy) | GA since Fabric launch 2023, accelerating 2024-2026 | Eliminates ETL for open-format sources; no pipeline, no latency, no copy |
| Per-engine security configuration | OneLake security roles (define-once, enforce-everywhere) | Public Preview as of 2025-2026 | Single governance point for all Fabric engines; still Preview — monitor for GA |
| Manual table registration | Auto-registration of Delta shortcuts in Tables/ folder | GA | Delta Parquet shortcuts in Tables/ auto-register as managed tables |
| Database mirroring = replication | Metadata mirroring (Databricks) = shortcuts + catalog sync | GA 2025 | No data movement for Databricks Unity Catalog integration |

**Deprecated/outdated:**
- Custom ADLS-to-Fabric pipelines: replaced by shortcuts for open-format sources
- Per-engine RLS configuration: superseded by OneLake security roles (Preview)
- Legacy Iceberg REST Catalog endpoint (`/api/2.1/unity-catalog/iceberg` read-only): deprecated in favor of `/api/2.1/unity-catalog/iceberg-rest`

---

## Open Questions

1. **Unity Catalog Open API for reading OneLake in Databricks — current GA status**
   - What we know: announced "EOY 2025" in November 2025 Databricks blog; uses Unity Catalog Open API standard
   - What's unclear: whether it shipped GA or in Preview; required workspace tier; any limitations vs the service principal + MSAL path
   - Recommendation: Phase 23 documents the metadata mirroring (GA) as primary pattern; adds a note that the Unity Catalog Open API native path announced in 2025 should be verified before production adoption. Do not block Phase 23 on this — it is a Phase 24 concern.

2. **OneLake security — GA timeline**
   - What we know: Public Preview as of 2026-04-10; no GA date announced in the official docs read
   - What's unclear: GA date
   - Recommendation: Include Warning callout on every reference; advise architects to assess production readiness based on Preview status at time of planning

3. **OneLake security enforcement for AI agents querying via Databricks SQL REST API**
   - What we know: OneLake security roles apply to Fabric compute engines (Spark, T-SQL, KQL, Analysis Services) and authorized third-party engines via the authorized engine model
   - What's unclear: Whether the Databricks SQL REST API semantic endpoint (used in Phase 27) is an "authorized engine" for OneLake security enforcement, or whether the security enforcement for that path is Unity Catalog-side only
   - Recommendation: LAKE-03 should describe the Fabric-native compute engine coverage precisely; note that the agent→APIM→Databricks SQL path (Phase 27) has Unity Catalog as its security enforcement point, not OneLake security roles. This distinction is important for the overall security architecture story.

---

## Validation Architecture

Per `.planning/config.json` (not found — treating nyquist_validation as enabled by default).

This phase produces Mintlify MDX documentation pages only. There is no application code to unit-test.

### Phase Gate Validation (Manual)

All validation for Phase 23 is manual documentation review:

| Req ID | Behavior | Validation Type | Check |
|--------|----------|-----------------|-------|
| LAKE-01 | Shortcut vs mirror decision criteria present; security enforcement surface differences documented | Manual content review | Decision matrix table present; passthrough vs delegated distinction documented; Databricks security split surface documented |
| LAKE-02 | Universal namespace concept explained; ADLS, Dataverse, SharePoint sources covered; agent implications stated | Manual content review | Namespace section present; all three source types mentioned; agent querying implication stated |
| LAKE-03 | Table/row/column security enforcement described across Spark, SQL Analytics, AI agent paths | Manual content review | Security section covers all three granularity levels; all three engine paths covered |
| Success criterion 4 | Pre-GA warning callout present | Manual check | At minimum one Mintlify `<Warning>` component for OneLake security (Preview) and one for SharePoint shortcuts (Preview) |

### Structural Validation (Automated)

```bash
# Verify page exists in expected location
ls docs/data-foundation/onelake-architecture.mdx

# Verify minimum content length (architecture pages should be substantive)
wc -l docs/data-foundation/onelake-architecture.mdx
# Expect: > 100 lines

# Verify no broken internal links (once docs.json is wired in Phase 29)
# This check deferred to Phase 29 per phase dependency chain
```

### Wave 0 Gaps

- [ ] `docs/data-foundation/` directory — does not yet exist as a docs/ subdirectory (only exists in project root as research material). Must be created in Phase 23 Wave 1.
- [ ] `docs/data-foundation/onelake-architecture.mdx` — does not exist; Wave 1 creates it.
- Note: docs.json wiring for the Data Foundation tab is explicitly Phase 29 scope. Phase 23 should NOT touch docs.json.

---

## Sources

### Primary (HIGH confidence)

- Microsoft Learn — OneLake shortcuts overview: `https://learn.microsoft.com/en-us/fabric/onelake/onelake-shortcuts` (updated 2026-04-13). GA/Preview status, shortcut types, security behavior, limitations.
- Microsoft Learn — OneLake shortcut security: `https://learn.microsoft.com/en-us/fabric/onelake/onelake-shortcut-security` (updated 2026-04-10). Passthrough vs delegated auth, DirectLake exception, OneLake security role interaction.
- Microsoft Learn — OneLake data security overview: `https://learn.microsoft.com/en-us/fabric/onelake/security/get-started-security` (updated 2026-04-10). OneLake security Public Preview status, workspace roles, item permissions, table/row/column security model.
- Microsoft Learn — Mirroring overview: `https://learn.microsoft.com/en-us/fabric/mirroring/overview` (updated 2026-03-31). Three mirroring types, GA/Preview status by source, CDC replication architecture, metadata mirroring distinction.
- Microsoft Learn — Integrate OneLake with Azure Databricks: `https://learn.microsoft.com/en-us/fabric/onelake/onelake-azure-databricks` (updated 2026-04-25). ADLS DFS URI pattern, serverless connectivity.
- Project pre-research — `.planning/research/STACK.md` (2026-04-27). Synthesized GA/Preview status table for all v2.0 technologies including OneLake-specific details.
- Project pre-research — `.planning/research/PITFALLS.md` (2026-04-27). Shortcut vs mirror pitfall, DirectLake exception, security surface split.
- Project pre-research — `.planning/research/ARCHITECTURE.md` (2026-04-27). Integration points with existing Citadel 4-layer model.

### Secondary (MEDIUM confidence)

- `docs/data-foundation/microsoft-onelake-unified-data-lake.md` — ITNEXT / Azure MVP community article, April 2026. OneLake scale metrics (28,000 customers, 6M shortcuts, 80% Fortune 500), shortcut transformations capability. Verified against Microsoft Learn URLs cited within.
- `docs/data-foundation/expanding-onelake-unity-catalog.md` — Databricks Blog, November 2025. Unity Catalog Open API integration with OneLake, bidirectional federation announcement, Reading from OneLake in Databricks EOY 2025 roadmap item.
- `docs/data-foundation/integrate-onelake-azure-databricks.md` — Microsoft Learn official, April 2026 (captured as project research). ADLS DFS endpoint URI pattern, Entra service principal token acquisition for pattern reference. HIGH source authority; note: contains developer code — extract architectural pattern only.

### Tertiary (LOW confidence — needs verification before publication)

- Unity Catalog Open API reading OneLake in Databricks GA status: announced EOY 2025 per Databricks blog; not confirmed in official Microsoft Learn docs read for this research. Flag in page.

---

## Metadata

**Confidence breakdown:**
- Shortcut architecture and security model: HIGH — sourced directly from Microsoft Learn official docs, multiple documents cross-referenced, updated within last 30 days
- Mirroring architecture and GA/Preview status: HIGH — sourced from Microsoft Learn mirroring overview, updated 2026-03-31
- OneLake security (table/row/column): HIGH for architecture description; HIGH for Preview status; LOW for GA date
- Databricks integration: HIGH for metadata mirroring (GA, official docs); MEDIUM for Unity Catalog Open API reading OneLake in Databricks (announced, not GA-confirmed)
- Shortcut transformations capability: MEDIUM — sourced from community article with Microsoft Learn URL citations

**Research date:** 2026-04-27
**Valid until:** 2026-05-27 (30 days — stable platform; OneLake security Preview status may change)

**Key caveat:** OneLake security (Preview) is the most operationally sensitive finding. Its Preview status is explicitly confirmed in the official doc updated 2026-04-10. Any promotion to GA would change the framing of LAKE-03.
