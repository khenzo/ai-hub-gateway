# Domain Pitfalls: Enterprise Data Foundation Documentation

**Domain:** Adding data foundation patterns documentation to existing enterprise AI platform docs (SOF1A 2.0 / Citadel)
**Researched:** 2026-04-27
**Mode:** Pitfalls — specific to adding documentation, not building technology

---

## Critical Pitfalls

These mistakes cause rewrites, break user trust, or orphan content.

---

### Pitfall 1: Misrepresenting the Shortcut vs. Mirror Distinction in the ADR

**What goes wrong:** The ADR for OneLake integration mode collapses "shortcuts" and "mirroring" into a single "no-copy" decision, losing the key architectural trade-off. Shortcuts are pure metadata pointers (zero movement, live source query, no Unity Catalog enforcement). Mirroring is a replication mechanism that makes Unity Catalog-managed data available in OneLake as a managed copy — still no manual ETL, but data does move into OneLake storage under Fabric governance. Calling both "zero-copy" is technically defensible for shortcuts and completely wrong for mirroring.

**Why it happens:** The source materials (expanding-onelake-unity-catalog.md) use "zero-copy" loosely. Microsoft and Databricks marketing conflate the two patterns. The author reads the headline and writes the ADR from the headline.

**Consequences:** Architects design security models on the wrong assumption. A team that uses mirroring expecting live Unity Catalog row-level security applied at query time will be surprised that the Fabric-side copy has its own security surface. An ADR that doesn't surface this forces a rework when security requirements are validated against actual behavior.

**Prevention:**
- The ADR must separate the two primitives explicitly: Shortcut = pointer, data stays in source, source security applies; Mirror = replication into OneLake, Fabric security model applies to the copy.
- The "shortcut transformations" capability (processing layer added to a shortcut without a separate pipeline) is a third pattern that must not be silently merged with either.
- Confidence anchor: Microsoft Learn docs at `learn.microsoft.com/en-us/fabric/onelake/onelake-shortcuts` and `onelake-azure-databricks` document these as distinct integration paths.

**Detection warning signs:** Any ADR text that says "data never moves" when describing mirroring. Any text that says Unity Catalog policies automatically apply to Fabric-side mirror reads without stating that Fabric workspace roles also apply.

---

### Pitfall 2: Asserting Text-to-SQL and Semantic Layer Are Equivalent for AI Agents

**What goes wrong:** Documentation presents text-to-SQL (LLM generates raw SQL against base tables) and semantic layer grounding (LLM queries governed metric definitions) as interchangeable options. The reference source (semantic-layer-architecture.md from Databricks) is unambiguous: these are architecturally distinct with different governance, auditability, and consistency properties. In a platform-native semantic layer, access controls and row-level security travel with the metric definition and are enforced at query time. In pure text-to-SQL, the LLM re-implements business logic from table descriptions, producing results that are inconsistent across surfaces and ungoverned.

**Why it happens:** "Text-to-SQL" is a well-known pattern and appears frequently in AI documentation. It's tempting to include it as an "option" alongside the semantic layer approach. The reference source explicitly argues against this framing for enterprise contexts.

**Consequences:** Architects reading the ADR see two equivalent options and choose text-to-SQL for simplicity, then discover governance gaps when auditors require traceability from agent responses to certified metric definitions. The documentation failed to carry the trade-off.

**Prevention:**
- The ADR must state the asymmetry: semantic layer is the recommended pattern for enterprise AI agents where consistency and auditability are requirements; text-to-SQL is acceptable only for exploratory or low-stakes use cases.
- Cite the specific distinction from the reference material: "For enterprise analytics, where consistency and auditability are non-negotiable, the semantic layer is not optional."
- Do not balance the comparison artificially. This is one of the places where the documentation must be opinionated, not neutral.

**Detection warning signs:** ADR text that says "choose text-to-SQL for simplicity" without qualifying the governance implications. Any framing that makes the two approaches symmetrical.

---

### Pitfall 3: Describing Unity Catalog Open API Integration as Production-Ready When It Was Pre-GA

**What goes wrong:** The "Reading from OneLake in Azure Databricks via Unity Catalog Open APIs" capability was announced as "EOY 2025" in the November 2025 Databricks blog (expanding-onelake-unity-catalog.md). Documentation that describes this integration pattern without flagging the GA timeline or verifying current status will describe a capability that may have shipped with limitations, changed API surface, or requires specific Databricks workspace tier (Premium) that changes the ADR framing.

**Why it happens:** Source materials are a mix of blog posts announcing future roadmap items and Microsoft Learn documentation describing current capabilities. Authors read across them without checking publication dates or GA status.

**Consequences:** An architect implements a pattern described in the docs, discovers the Unity Catalog → OneLake read path requires configuration not documented here, and loses confidence in the accuracy of the entire Data Foundation section.

**Prevention:**
- Every integration capability referenced in ADRs must include a confidence qualifier: "GA as of [date]" or "verify current status before implementation."
- The Databricks serverless compute + OneLake integration documented in `integrate-onelake-azure-databricks.md` is the currently GA path (uses MSAL + service principal). The Unity Catalog Open API native path is the newer, simpler path that requires GA verification.
- This does not mean avoiding the topic. It means the ADR records the decision to use the GA path now and notes when to revisit for the native path.

**Detection warning signs:** Integration pattern described without a date anchor. Any statement that "Databricks can seamlessly read OneLake data via Unity Catalog" without noting what configuration and workspace tier is required.

---

### Pitfall 4: Documentation Drifts from Patterns to Implementation Steps

**What goes wrong:** A section titled "Medallion Architecture Patterns" begins documenting what belongs in bronze vs. silver vs. gold layers (correct — a design decision), then gradually adds dbt model naming conventions, dbt YAML tag structures, Lakeflow job configuration, and finally a step-by-step pipeline setup. The out-of-scope constraint is explicit: no code, no dbt YAML, no GitHub Actions. This constraint exists because the target audience is architects, not developers, and because the Citadel documentation platform is already scoped to patterns and ADRs.

**Why it happens:** Source material (open-platform-dbt-databricks.md) is a Databricks partner blog with practical implementation details. When synthesizing it, it is easy to carry specifics into pattern documentation under the assumption that "more detail is better."

**Consequences:** The Data Foundation tab becomes a hybrid of two documentation types — patterns for architects and tutorials for developers — satisfying neither. Navigation users expecting ADRs find tutorial content. Navigation users expecting tutorials find patterns. Mintlify's search surfaces the wrong content for the wrong intent.

**Prevention:**
- For every paragraph in draft, ask: "Is this a decision principle or a configuration instruction?" Configuration instructions go out.
- The signal is usually the verb: "Use Delta Lake format" = principle. "Set delta.autoOptimize.optimizeWrite = true in your cluster config" = configuration. Configuration-level content is out of scope.
- Use the project's established pattern: the Citadel architecture docs describe what each layer does and how it connects — they do not describe how to deploy it. Apply the same discipline here.

**Detection warning signs:** Any mention of specific parameter names, YAML keys, file paths, package versions, or step-numbered setup procedures. Any paragraph that requires the reader to have a running environment to apply.

---

## Moderate Pitfalls

---

### Pitfall 5: APIM Data Access ADR Duplicates Existing Citadel Governance Content

**What goes wrong:** The "APIM Governed Data Access" patterns section re-describes how APIM policy fragments work, how access contracts are structured, and how PII propagation operates — content already documented in the Governance tab (governance/access-contracts, governance/pii-protection) and the Architecture tab (layer-1-governance-hub). This creates two sources of truth for the same APIM behavior and guarantees they drift.

**Why it happens:** The Data Foundation author writes the section from scratch without reading what the existing Citadel docs say about APIM. The connection between data access governance and AI request governance feels architecturally distinct enough to warrant its own treatment.

**Consequences:** Architects reading the Data Foundation section form different mental models of APIM policy behavior than architects who start from the Governance tab. The first maintenance cycle reveals contradictions, and there is no clear owner for which page is authoritative.

**Prevention:**
- Before writing any APIM-related content in the Data Foundation section, read the existing governance/access-contracts and architecture/layer-1-governance-hub pages to map what is already documented.
- The Data Foundation APIM section should explain what is specific to data access patterns — governed SQL endpoint exposure, token-scoped data API policies, semantic layer query routing — while cross-linking to existing Citadel content for the underlying policy mechanism.
- The rule from existing project decisions: "cross-link over duplicate."

**Detection warning signs:** Any paragraph that could appear unchanged on an existing Citadel page. Any description of APIM subscription keys, product policies, or JWT validation that doesn't reference the existing documentation.

---

### Pitfall 6: Semantic Layer ADR Conflates MetricFlow (dbt) with Unity Catalog Business Semantics (Databricks)

**What goes wrong:** The semantic layer ADR treats "dbt Semantic Layer / MetricFlow" and "Databricks Unity Catalog Business Semantics" as competing options for the same capability, when they address partially different layers. dbt MetricFlow is a metrics definition framework tied to the dbt transformation workflow — it generates SQL against pre-built dbt models. Databricks Unity Catalog Business Semantics is a platform-native semantic layer embedded in Unity Catalog, designed to serve governed metric definitions to any consumer (dashboards, notebooks, AI agents) via open APIs. They can coexist: dbt defines and materializes models, Unity Catalog governs and exposes them semantically.

**Why it happens:** Both are described as "semantic layer" solutions. The reference source (semantic-layer-architecture.md) discusses dbt's semantic layer as one approach within a broader taxonomy, creating the impression of a single-choice decision.

**Consequences:** An ADR that frames this as either/or causes teams to abandon MetricFlow when they adopt Unity Catalog Business Semantics, losing the transformation workflow benefits, or vice versa.

**Prevention:**
- The ADR must describe the layered relationship: dbt MetricFlow governs how metrics are defined and tested in the transformation layer; Unity Catalog Business Semantics governs how those metrics are exposed and consumed by AI agents at the platform layer.
- The "author once, reuse everywhere" principle from the reference source applies to the Unity Catalog exposure layer, not to the dbt transformation layer.

**Detection warning signs:** Any ADR table that puts dbt Semantic Layer and Unity Catalog Business Semantics as direct alternatives in the same comparison row.

---

### Pitfall 7: Data Foundation Tab Adds Navigation Without Connecting to Existing User Journeys

**What goes wrong:** A new "Data Foundation" tab is added to docs.json. It has its own introduction, its own architecture overview, and its own getting-started narrative — effectively starting a parallel documentation site within the same Mintlify site. Users arriving via the existing "Getting Started" journey have no path to discover it. Users in the Data Foundation tab have no path to the Citadel governance content it depends on.

**Why it happens:** New milestone content tends to be written as self-contained. The author focuses on completeness within the new tab rather than integration with the existing navigation graph.

**Consequences:** The Data Foundation tab becomes an island. The existing user journey (Getting Started → Architecture → Guides) does not reference it. The Data Foundation pages do not appear in cross-links from Architecture or Governance pages. The content exists but is not discovered by the primary audience.

**Prevention:**
- Before adding the new tab to docs.json, identify at least three existing pages that should cross-link into the Data Foundation section (likely: architecture/layer-2-control-plane for observability data, governance/pii-protection for PII propagation path, agent-factory/context-engineering for semantic grounding).
- The Data Foundation index page must position itself explicitly within the existing Citadel 4-layer model rather than introducing a new conceptual framework.
- The Getting Started quick-start page should reference the Data Foundation section when discussing data-grounded AI agent deployment.

**Detection warning signs:** Data Foundation index page that doesn't mention Citadel or APIM in the first three paragraphs. Zero cross-links from existing Architecture or Governance pages into the new section.

---

### Pitfall 8: ADRs That Record Decisions Without Capturing the Trade-Off That Was Actually Made

**What goes wrong:** An ADR for "Shortcut vs. Mirror" describes both options and states "we recommend shortcuts for initial integration." The trade-off that drove the decision — that shortcuts preserve Unity Catalog ABAC enforcement at source, while mirroring moves enforcement into Fabric workspace roles, which changes who manages security policies — is not recorded. The decision is captured; the reasoning that allows the next architect to evaluate whether conditions have changed is not.

**Why it happens:** ADR templates often focus on options and decision. The "consequences" section, which captures what becomes harder and what assumptions must hold for the decision to remain valid, gets minimal attention.

**Consequences:** Six months later, the organization changes its Unity Catalog ABAC policy ownership from the data team to the security team. No one knows whether the shortcut decision was predicated on ABAC staying with the data team. The ADR must be re-litigated from scratch.

**Prevention:**
- Every ADR in this milestone must include: the condition that would invalidate the decision, the operational implication that flows from the decision, and the alternative that was rejected and why.
- For the shortcut vs. mirror ADR specifically: state that the shortcut recommendation assumes Unity Catalog ABAC remains authoritative for data governance and that Fabric workspace roles are not the primary access control surface.
- For the MetricFlow vs. raw SQL for AI agents ADR: state that the semantic layer recommendation assumes metrics are already defined in Unity Catalog Business Semantics; if that layer doesn't exist, the ADR must be revisited.

**Detection warning signs:** ADR consequences section that contains only positive outcomes. ADR that does not name the person or team responsible for the assumption that makes the decision valid.

---

## Minor Pitfalls

---

### Pitfall 9: Misrepresenting the Databricks Serverless Compute + OneLake Connection Requirements

**What goes wrong:** Documentation describes the Databricks → OneLake connection as straightforward, omitting that Databricks serverless compute enforces a restricted set of Spark configuration properties (CONFIG_NOT_AVAILABLE error for unsupported properties), and that the integration requires a service principal with at least the Contributor workspace role in Fabric, plus Databricks secrets management for credentials. Presenting this as "connect to OneLake from Databricks" without these prerequisites leads architects to underestimate IAM and configuration complexity.

**Prevention:** Pattern descriptions should summarize the credential chain (Entra MI or service principal → Fabric workspace role → MSAL token acquisition → OneLake ABFS endpoint) as a security architecture decision, not as a code snippet. The IAM requirement is an architectural concern; the MSAL code is an implementation detail that stays out of scope.

---

### Pitfall 10: "Platform-Native Semantics" Presented as a Microsoft-Only Concept

**What goes wrong:** Documentation frames platform-native semantic layers as a Databricks/Unity Catalog pattern, missing that the same principle applies to Microsoft Fabric's own semantic model capabilities (Power BI semantic models, Direct Lake mode). This creates a false impression that the Citadel integration is exclusively Databricks-dependent, when the actual architecture recommendation may support both platforms.

**Prevention:** When describing the "platform-native semantics" principle, anchor it to the concept (semantics live in the platform, next to data and governance, exposed via open APIs) rather than to a specific vendor implementation. Note that both Unity Catalog Business Semantics and Microsoft Fabric semantic models express this pattern; the ADR explains which is authoritative for the SOF1A 2.0 context and why.

---

### Pitfall 11: PII Propagation Section Describes APIM Behavior Differently Than Existing Citadel Docs

**What goes wrong:** The existing Citadel documentation (governance/pii-protection, the frag-pii-anonymization.xml policy) describes PII handling at the AI request/response layer — APIM intercepts LLM input/output and applies anonymization. The Data Foundation security section might describe PII propagation through the data pipeline (Unity Catalog column masking → APIM policy → agent response) as if these are the same mechanism, when they are two distinct enforcement points that must both be configured.

**Prevention:** The Data Foundation security section should describe the end-to-end PII propagation path as a chain of enforcement points — Unity Catalog column masking at the data layer, APIM policy fragment at the API gateway layer — and cross-link to the existing pii-protection page for the APIM-layer detail rather than re-describing it.

---

## Phase-Specific Warnings

| Phase Topic | Likely Pitfall | Mitigation |
|-------------|----------------|------------|
| OneLake ADRs (shortcut vs. mirror) | Conflating shortcut and mirror as equivalent "no-copy" patterns | Explicitly separate primitives; verify GA status of Unity Catalog Open API read path before writing |
| Semantic Layer ADRs (MetricFlow vs. UC semantics) | Treating as either/or when they address different layers | Describe layered relationship; use reference source language precisely |
| Text-to-SQL vs. semantic layer for AI agents | False equivalence that loses the governance argument | The docs must be opinionated here; cite the reference source directly |
| APIM Data Access patterns | Duplicating existing Citadel governance content | Read existing pages first; cross-link rather than re-describe |
| Data Foundation nav tab | Orphaned content with no path from existing user journeys | Identify cross-link targets in existing pages before writing new tab content |
| Medallion Architecture patterns | Scope creep from patterns to implementation steps | Apply the verb test: principles stay, configuration instructions go |
| Security & Identity patterns | PII propagation described as single mechanism when two distinct enforcement points exist | Describe the chain explicitly; cross-link for APIM-layer detail |
| Databricks + Unity Catalog ABAC design | Omitting workspace tier requirements that change the ADR | Include IAM prerequisites as architectural context, not code |

---

## Sources

- `docs/data-foundation/semantic-layer-architecture.md` — Databricks Blog: "Semantic Layer Architecture: Components, Design Patterns, and AI Integration" (April 2026). Source for text-to-SQL vs. semantic layer distinction, platform-native semantics definition, five implementation principles, and MetricFlow taxonomy. HIGH confidence — official Databricks source.
- `docs/data-foundation/expanding-onelake-unity-catalog.md` — Databricks Blog: "Expanding support for OneLake in Unity Catalog" (November 2025). Source for shortcut vs. mirror distinction, Unity Catalog Open API timeline, GA vs. roadmap status. MEDIUM confidence — blog post announcing roadmap items; GA status requires verification.
- `docs/data-foundation/integrate-onelake-azure-databricks.md` — Microsoft Learn: "Integrate OneLake with Azure Databricks." Source for serverless compute constraints, service principal requirements, credential chain. HIGH confidence — official Microsoft Learn documentation.
- `docs/data-foundation/microsoft-onelake-unified-data-lake.md` — ITNEXT/Microsoft Azure MVP: "Microsoft OneLake: The Unified Data Lake" (April 2026). Source for shortcut transformations as third integration pattern. MEDIUM confidence — MVP blog, not official Microsoft source; patterns verified against Learn docs.
- `docs/data-foundation/open-platform-dbt-databricks.md` — Databricks Blog: "Open Platform, Unified Pipelines: Why dbt on Databricks is Accelerating" (April 2026). Source for dbt + Unity Catalog governance integration, scope creep risk. HIGH confidence — official Databricks source.
- `.planning/PROJECT.md` — Project context, existing documentation structure, out-of-scope constraints, key decisions. HIGH confidence — authoritative project record.
- `docs/docs.json` — Current Mintlify navigation structure. HIGH confidence — live configuration file.
