:# Roadmap: AI Landing Zone Documentation

## Milestones

- ✅ **v1.0 MVP** — Phases 1-6 (shipped 2026-04-13)
- ✅ **v1.1 AI Agent Factory Integration** — Phases 7-12 (shipped 2026-04-13)
- ✅ **v1.2 Open Platform Agent Factory** — Phases 13-15 (shipped 2026-04-13)
- ✅ **v1.3 EY Framework Alignment** — Phases 16-22 (shipped 2026-04-15)
- ✅ **v2.0 Enterprise Data Foundation** — Phases 23-28 (shipped 2026-04-28)
- 🚧 **v3.0 AI+ HUB Factory Presentation** — Phases 29-35 (in progress)

## Phases

<details>
<summary>✅ v1.0 MVP (Phases 1-6) — SHIPPED 2026-04-13</summary>

- [x] Phase 1: Documentation Foundation (3/3 plans) — completed 2026-04-09
- [x] Phase 2: Core Architecture (3/3 plans) — completed 2026-04-10
- [x] Phase 3: AI Landing Zone Patterns (3/3 plans) — completed 2026-04-10
- [x] Phase 4: Implementation Guides (4/4 plans) — completed 2026-04-10
- [x] Phase 5: Integration & Validation (3/3 plans) — completed 2026-04-10
- [x] Phase 6: Guides Documentation Section (1/1 plan) — completed 2026-04-10

_For full details, see `.planning/milestones/v1.0-ROADMAP.md`_
</details>

<details>
<summary>✅ v1.1 AI Agent Factory Integration (Phases 7-12) — SHIPPED 2026-04-13</summary>

- [x] Phase 7: Agent Factory Foundation (1/1 plan) — completed 2026-04-13
- [x] Phase 8: Agentic Web Stack Architecture (2/2 plans) — completed 2026-04-13
- [x] Phase 9: Agentic AI Design Patterns (2/2 plans) — completed 2026-04-13
- [x] Phase 10: Enterprise Use Cases (2/2 plans) — completed 2026-04-13
- [x] Phase 11: Open Standards Integration (2/2 plans) — completed 2026-04-13
- [x] Phase 12: Agent Security & Observability (2/2 plans) — completed 2026-04-13

_For full details, see `.planning/milestones/v1.1-ROADMAP.md`_
</details>

<details>
<summary>✅ v1.2 Open Platform Agent Factory (Phases 13-15) — SHIPPED 2026-04-13</summary>

- [x] Phase 13: Open Platform Transformation (1/1 plan) — completed 2026-04-13
- [x] Phase 14: Deep Agents Architecture (1/1 plan) — completed 2026-04-13
- [x] Phase 15: Navigation & Integration (1/1 plan) — completed 2026-04-13

_For full details, see `.planning/milestones/v1.2-ROADMAP.md`_
</details>

<details>
<summary>✅ v1.3 EY Framework Alignment (Phases 16-22) — SHIPPED 2026-04-15</summary>

- [x] **Phase 16: EY Framework Alignment Overview** - Alignment map and dedicated EY section in site navigation (completed 2026-04-14)
- [x] **Phase 17: Kubernetes & DevOps Patterns** - AKS deployment, GitHub scaffolding, and CI/CD pipeline guidance (completed 2026-04-14)
- [x] **Phase 18: Security & Governance at Scale** - EY two-tiered governance mapped to Citadel 4-layer architecture (completed 2026-04-14)
- [x] **Phase 19: MCP, A2A & Agent Discovery** - Protocol alignment and APIM as agent registry (completed 2026-04-15)
- [x] **Phase 20: Attention Points & Recommendations** - Gap analysis and actionable add-on recommendations (completed 2026-04-15)
- [x] **Phase 21: Refactor Mintlify doc tabs for Guides and Operations** - Consolidate how-to pages into a single Operations section with links to official GitHub repos (completed 2026-04-15)
- [x] **Phase 22: Refactor architecture and getting-started documentation for SOF1A 2.0 AI Governance Platform** - Rebrand and restructure architecture and getting-started docs to reflect the SOF1A 2.0 AI Governance Platform vision (completed 2026-04-15)
</details>

### v2.0 Enterprise Data Foundation (Phases 23-28)

- [x] **Phase 23: OneLake Architecture** - Universal storage patterns, shortcut vs mirror ADR, uniform security model across compute engines (completed 2026-04-27)
- [x] **Phase 24: Unity Catalog Governance** - Compute/governance separation, ABAC design, three-level namespace contract, Open API + Iceberg REST integration (completed 2026-04-27)
- [x] **Phase 25: Semantic Layer** - Platform-native semantics ADR, AI agent query patterns, author-once principle, Core vs Edge model (completed 2026-04-27)
- [x] **Phase 26: APIM Governed Data Access** - Citadel APIM fronting Databricks SQL REST API, dedicated data access policy fragment design (completed 2026-04-28)
- [x] **Phase 27: Security & Identity Patterns** - Entra MI chain for zero-secrets data path, Unity Catalog column mask propagation through APIM (completed 2026-04-28)
- [x] **Phase 28: Navigation & Integration** - Data Foundation docs.json tab, all pages wired, Citadel cross-links established (completed 2026-04-28)

## Phase Details

### Phase 16: EY Framework Alignment Overview
**Goal**: Readers can see at a glance how the EY AI Agent Development Framework maps to Citadel components, and can navigate a dedicated EY alignment section in the documentation site
**Depends on**: Phases 1-15 (existing documentation foundation)
**Requirements**: ALIGN-01, ALIGN-02
**Success Criteria** (what must be TRUE):
  1. Reader can open a single alignment map page and see every EY framework criterion listed with its corresponding Citadel component and enforcement status (enforced / partial / attention point)
  2. Reader can navigate to the EY Framework Alignment section from the Mintlify top-level navigation without needing to search
  3. Reader can distinguish at a glance which EY criteria are fully covered by Citadel vs. which require supplemental tooling
  4. Reader who is unfamiliar with EY's framework can orient themselves via a brief framework overview before reaching the alignment table
**Plans**: 2 plans
Plans:
- [ ] 16-01-PLAN.md — Create EY framework overview and alignment map content pages
- [ ] 16-02-PLAN.md — Wire EY Alignment tab and navigation into docs.json

### Phase 17: Kubernetes & DevOps Patterns
**Goal**: A pro-code engineer can follow step-by-step guidance to deploy an agent container to AKS behind Citadel APIM, scaffold a GitHub repository to EY standards, and wire a CI/CD pipeline that applies Citadel access contracts on deploy
**Depends on**: Phase 16
**Requirements**: KUBE-01, KUBE-02, KUBE-03
**Success Criteria** (what must be TRUE):
  1. Reader can understand how a containerized agent connects to AKS, integrates with the Citadel APIM gateway, and applies namespace isolation — with a concrete network integration diagram
  2. Reader can follow a prescribed GitHub repository folder structure and branch policy convention that aligns to EY agent delivery standards
  3. Reader can implement a GitHub Actions workflow that builds the agent image, runs tests, and deploys to AKS with Citadel access contracts applied at deploy time
  4. Reader can identify which Citadel layer (Gateway, Control Plane, Identity, Security Fabric) is enforced at each stage of the CI/CD pipeline
**Plans**: 2 plans
Plans:
- [ ] 17-01-PLAN.md — AKS deployment guide and GitHub repository scaffolding content pages
- [ ] 17-02-PLAN.md — CI/CD pipeline guide and navigation wiring into docs.json

### Phase 18: Security & Governance at Scale
**Goal**: An architect or compliance officer can map EY's two-tiered governance model onto Citadel's 4-layer architecture, configure AI guardrails via APIM policies, and understand how Azure Policy, Defender, and Purview satisfy EY's AIRA/AI QRM compliance requirements
**Depends on**: Phase 16
**Requirements**: GOVN-01, GOVN-02, GOVN-03
**Success Criteria** (what must be TRUE):
  1. Reader can view a side-by-side mapping of EY's firmwide and service-line governance tiers against Citadel's four layers, with a clear statement of which layer satisfies which tier
  2. Reader can follow configuration guidance to implement Content Safety filtering, PII blocking, and jailbreak/injection detection using Citadel APIM policies — with example policy snippets
  3. Reader can understand how Azure Policy initiatives, Defender for AI threat signals, and Purview data classification maps to EY's AIRA and AI QRM compliance process requirements
  4. Reader can identify which governance requirements are automatically enforced by Citadel vs. which require manual process controls outside the platform
**Plans**: 3 plans
Plans:
- [ ] 18-01-PLAN.md — Governance tier mapping and compliance tooling content pages (GOVN-01, GOVN-03)
- [ ] 18-02-PLAN.md — AI guardrails configuration guide with APIM policy snippets (GOVN-02)
- [x] 18-03-PLAN.md — Wire Phase 18 pages into EY Alignment navigation in docs.json (completed 2026-04-14)

### Phase 19: MCP, A2A & Agent Discovery
**Goal**: An architect can understand how Citadel governs MCP tool exposure, acts as an A2A trust broker for cross-agent authentication, and uses APIM API Center as an agent registry that satisfies EY's future agent discovery requirement today
**Depends on**: Phase 16
**Requirements**: PROTO-01, PROTO-02, PROTO-03
**Success Criteria** (what must be TRUE):
  1. Reader can understand how MCP server endpoints are exposed through and governed by the Citadel APIM layer — including tool invocation flows and policy enforcement points aligned to EY MCP standards
  2. Reader can understand how Citadel APIM acts as a trust broker for A2A interactions — covering cross-agent authentication, federation patterns, and the security guarantees Citadel provides for agent-to-agent calls
  3. Reader can see how APIM API Center functions as an agent registry and discovery catalog — with a concrete mapping to the "future agent discovery" requirement in EY's framework, showing it is addressable today
**Plans**: TBD

### Phase 20: Attention Points & Recommendations
**Goal**: A reader who has completed the EY alignment documentation can clearly understand what Citadel does not cover, what supplemental tools to evaluate, and have actionable next steps for fully satisfying the EY AI Agent Development Framework
**Depends on**: Phases 16-19
**Requirements**: GAPS-01
**Success Criteria** (what must be TRUE):
  1. Reader can view a consolidated list of EY framework requirements that Citadel does not fully address, with a plain-language explanation of each gap
  2. Reader can see specific recommended supplemental tools for each gap (e.g., AIRA/AI QRM tooling for governance process, LangSmith for LLM observability, EY-approved guardrail vendors) with enough context to evaluate them
  3. Reader can distinguish between gaps that require adding a tool vs. gaps that require a process change — so they can prioritize their roadmap
**Plans**: 2 plans
Plans:
- [x] 20-01-PLAN.md — Create gaps-and-recommendations content page with gap analysis and supplemental tools
- [x] 20-02-PLAN.md — Wire gaps-and-recommendations page into EY Alignment navigation in docs.json

### Phase 21: Refactor Mintlify doc tabs for Guides and Operations
**Goal**: Simplify the documentation navigation by restructuring Guides into AI Landing Zone and Citadel Hub sections, linking to official GitHub repositories, and removing the standalone Operations tab
**Depends on**: Phase 20
**Requirements**: REFACTOR-01, REFACTOR-02, REFACTOR-03, REFACTOR-04
**Success Criteria** (what must be TRUE):
  1. Guides section is restructured into two subsections: AI Landing Zone and Citadel Hub
  2. The Guides introduction and quickstart pages link directly to the official GitHub repositories
  3. The Operations tab is removed from the top-level navigation
  4. docs.json is updated to reflect the new navigation structure
  5. No broken internal links remain in modified pages
**Plans**: 2 plans
Plans:
- [x] 21-01-PLAN.md — Restructure Guides into AI Landing Zone and Citadel Hub sections with repo links
- [x] 21-02-PLAN.md — Update docs.json navigation and fix cross-references

### Phase 22: Refactor architecture and getting-started documentation for SOF1A 2.0 AI Governance Platform
**Goal**: Rebrand and restructure the architecture and getting-started documentation to reflect the SOF1A 2.0 AI Governance Platform vision, clearly positioning the AI Landing Zone and Citadel Governance Hub as a unified enterprise platform for AI services and use-case governance
**Depends on**: Phase 21
**Requirements**: REBRAND-01, REBRAND-02, REBRAND-03, REBRAND-04, REBRAND-05
**Success Criteria** (what must be TRUE):
  1. Architecture docs clearly communicate the two main components under the SOF1A 2.0 AI Governance Platform brand
  2. Getting-started docs reflect the new platform narrative and visual identity
  3. Separation of concepts between AI Landing Zone and APIM Gateway is maintained while showing how they interact
  4. Existing architecture diagrams are preserved and updated where needed
**Plans**: 4 plans
Plans:
- [x] 22-01-PLAN.md — Rebrand and restructure architecture documentation for SOF1A 2.0
- [x] 22-02-PLAN.md — Rebrand getting-started introduction and concepts for SOF1A 2.0
- [x] 22-03-PLAN.md — Rebrand getting-started quick-start, prerequisites, and roles for SOF1A 2.0
- [x] 22-04-PLAN.md — Update docs.json navigation and verify cross-references

### Phase 23: OneLake Architecture
**Goal**: Architects can reason about OneLake as the universal storage substrate — knowing when to use shortcuts vs mirroring, how the universal namespace eliminates data movement, and how uniform security enforcement works across every compute engine
**Depends on**: Phase 22 (existing Citadel foundation)
**Requirements**: LAKE-01, LAKE-02, LAKE-03
**Success Criteria** (what must be TRUE):
  1. Reader can apply the shortcut vs mirror decision criteria to a real scenario — understanding the security enforcement surface differences and when each pattern is appropriate (LAKE-01)
  2. Reader can explain how OneLake's universal namespace connects ADLS, Dataverse, and SharePoint sources without copying data — and what this means for agents querying across those sources (LAKE-02)
  3. Reader can describe how table-, row-, and column-level security is enforced consistently regardless of whether data is read via Spark, SQL Analytics, or a downstream AI agent (LAKE-03)
  4. Reader can identify which OneLake capabilities are GA vs Public Preview and understands the risk implications for production deployments (Pre-GA warning callout present)
**Plans**: 1 plan
Plans:
- [ ] 23-01-PLAN.md — Create OneLake architecture page (LAKE-01, LAKE-02, LAKE-03)

### Phase 24: Unity Catalog Governance
**Goal**: Architects can design a Unity Catalog governance model that separates compute from data ownership — with ABAC scaling across teams, a durable three-level namespace as the governance contract, and a clear understanding of the Open API + Iceberg REST integration path and its current GA status
**Depends on**: Phase 23
**Requirements**: UCAT-01, UCAT-02, UCAT-03, UCAT-04
**Success Criteria** (what must be TRUE):
  1. Reader can articulate why Unity Catalog lineage, column masks, and row filters persist independently of cluster lifecycle — and what architectural guarantee this provides to downstream consumers (UCAT-01)
  2. Reader can design a Unity Catalog ABAC scheme using tags and conditions that scales to new teams and schemas without requiring per-table ACL updates (UCAT-02)
  3. Reader can explain the catalog.schema.table namespace as the governance contract layer — and how it insulates downstream consumers from raw storage reorganizations (UCAT-03)
  4. Reader understands the Unity Catalog Open API + Iceberg REST Catalog integration with OneLake, knows its Public Preview status, and can identify the currently-GA baseline path to use in production today (UCAT-04)
**Plans**: 1 plan
Plans:
- [ ] 24-01-PLAN.md — Create Unity Catalog governance page (UCAT-01, UCAT-02, UCAT-03, UCAT-04)

### Phase 25: Semantic Layer
**Goal**: Architects can commit to platform-native semantics (MetricFlow + Unity Catalog Business Semantics as complementary layers) over tool-embedded semantics, understand why this is non-negotiable for production AI agents, and design a Core vs Edge semantic model with a governed promotion path
**Depends on**: Phase 24
**Requirements**: SEML-01, SEML-02, SEML-03, SEML-04
**Success Criteria** (what must be TRUE):
  1. Reader can articulate the ADR decision — why platform-native semantics are required vs tool-embedded semantics — including the specific risks tool-embedded semantics introduce for AI agent grounding (SEML-01)
  2. Reader can explain how AI agents query the semantic layer rather than raw tables — and why the semantic layer is a required production component, not an optional optimization (grounding vs text-to-SQL distinction clear) (SEML-02)
  3. Reader can trace a single metric definition from authorship through to its consumption by dashboards, notebooks, and AI agents — demonstrating the author-once-reuse-everywhere principle in practice (SEML-03)
  4. Reader can design a Core vs Edge semantic model — knowing which metrics belong in enterprise-certified Core, which belong in team-specific Edge, and how Edge metrics are promoted to Core (SEML-04)
**Plans**: 1 plan
Plans:
- [ ] 25-01-PLAN.md — Create Semantic Layer page (SEML-01, SEML-02, SEML-03, SEML-04)

### Phase 26: APIM Governed Data Access
**Goal**: Architects can design a Citadel APIM integration that governs semantic endpoint access with Entra token validation, usage tracking, and rate limiting — and can justify a dedicated data access policy fragment separate from LLM policy fragments based on the distinct risk surface and throttling model
**Depends on**: Phase 25
**Requirements**: DSEC-01, DSEC-02
**Success Criteria** (what must be TRUE):
  1. Reader can describe the governed semantic endpoint pattern — how Citadel APIM fronts the Databricks SQL REST API semantic endpoint, what Entra token validation enforces, and how usage tracking and rate limiting apply (DSEC-01)
  2. Reader can justify why a dedicated data access policy fragment is architecturally distinct from reusing LLM policy fragments — citing the different risk surface, throttling model, and failure modes (DSEC-02)
  3. Reader can identify where this integration attaches to the existing Citadel 4-layer model — specifically at Layer 1 (Governance Hub / APIM) — without treating it as a fifth layer
**Plans**: 1 plan
Plans:
- [ ] 26-01-PLAN.md — Create APIM governed data access page and Layer 1 cross-link (DSEC-01, DSEC-02)

### Phase 27: Security & Identity Patterns
**Goal**: Architects can implement a zero-secrets data path using the Entra MI chain from agent through APIM to Databricks SQL to OneLake, and can explain how Unity Catalog column masks propagate through the APIM PII policy to AI agent responses as governance by construction
**Depends on**: Phase 26
**Requirements**: DSEC-03, DSEC-04
**Success Criteria** (what must be TRUE):
  1. Reader can trace the complete Entra Managed Identity chain — agent identity → APIM token validation → Databricks SQL credential → OneLake access — and confirm that no secrets exist in Key Vault for the data path (DSEC-03)
  2. Reader can explain how a Unity Catalog column mask defined at the governance layer propagates through APIM PII policy into AI agent responses — and why this is governance by construction rather than procedural enforcement (DSEC-04)
  3. Reader can map both patterns to their attachment points in the existing Citadel 4-layer model (Layer 4 Security Fabric for identity; Layer 1 APIM for PII propagation)
**Plans**: TBD

### Phase 28: Navigation & Integration
**Goal**: A Data Foundation documentation section exists in the Mintlify site as a navigable tab — all content pages wired into docs.json and existing Citadel architecture pages cross-linked into the new section
**Depends on**: Phase 27
**Requirements**: DNAV-01
**Success Criteria** (what must be TRUE):
  1. A Data Foundation tab appears in the Mintlify top-level navigation and is accessible without search (DNAV-01)
  2. Every page produced in Phases 23-28 is reachable from the Data Foundation tab without dead links
  3. Existing Citadel architecture pages (Layer 1/APIM, Layer 2/observability, Layer 4/Security Fabric) include cross-links into the relevant Data Foundation pages
  4. No previously working internal links are broken by the docs.json changes
**Plans**: 1 plan
Plans:
- [x] 28-01-PLAN.md — Wire Data Foundation tab in docs.json and add cross-links to Layer 2 and Layer 4 (DNAV-01)

### 🚧 v3.0 AI+ HUB Factory Presentation (In Progress)

**Milestone Goal:** Create an animated HTML presentation (20-22 slides) that visually narrates the AI+ HUB Factory — from Azure Landing Zone foundation through Citadel governance, enterprise data, agentic intelligence, and hub-spoke scaling.

#### Phase 29: Opening & Title Sequence
**Goal**: Generate Claude prompts to create the title card and agenda slides with particle animations and progressive card reveals
**Depends on**: v2.0 completion
**Requirements**: PRES-01
**Success Criteria** (what must be TRUE):
  1. Claude prompt captures all design system specs (colors, typography, layout) from PRESENTATION.md Section 2
  2. Prompt includes exact animation specifications (timings, easing, stagger) for Slide 0.1 title sequence
  3. Prompt includes 5-chapter agenda layout with accent colors and staggered card animations for Slide 0.2
  4. Output specifies HTML/CSS/JS structure using GSAP or CSS animations
**Plans**: 1 plan
Plans:
- [ ] 29-01-PLAN.md — Create Claude prompt for Opening & Title Sequence slides (0.1-0.2)

#### Phase 30: Azure Landing Zone Foundation
**Goal**: Generate Claude prompts to create Landing Zone foundation slides with isometric diagrams and nested container visuals
**Depends on**: Phase 29
**Requirements**: PRES-02
**Success Criteria** (what must be TRUE):
  1. Prompt includes 3D isometric foundation blocks animation for Slide 1.1
  2. Prompt includes nested container diagram with concentric rectangles for Slide 1.2
  3. Prompt includes side-by-side ALZ integration bridge diagram for Slide 1.3
  4. All prompts specify the Blue (#188CE5), Purple (#750E5C), and Yellow (#FFE600) color applications
**Plans**: 1 plan
Plans:
- [ ] 30-01-PLAN.md — Create Claude prompt for Landing Zone slides (1.1-1.3)

#### Phase 31: Citadel Governance Core
**Goal**: Generate Claude prompts to create Citadel 4-layer architecture and APIM gateway slides with animated diagrams
**Depends on**: Phase 30
**Requirements**: PRES-03
**Success Criteria** (what must be TRUE):
  1. Prompt includes vertical layer stack animation with bounce effects for Slide 2.1
  2. Prompt includes central gateway with orbiting hexagons for Slide 2.2
  3. Prompt includes animated downward flow diagram for Slide 2.3
  4. Prompt includes horizontal audit trail timeline with traveling checkpoint dot for Slide 2.4
**Plans**: 1 plan
Plans:
- [ ] 31-01-PLAN.md — Create Claude prompt for Citadel Governance slides (2.1-2.4)

#### Phase 32: Data Foundation
**Goal**: Generate Claude prompts to create Enterprise Data Foundation slides with shield icons, query path flows, and semantic layer diagrams
**Depends on**: Phase 31
**Requirements**: PRES-04
**Success Criteria** (what must be TRUE):
  1. Prompt includes three shield icons with SVG stroke animation for Slide 3.1
  2. Prompt includes vertical flow diagram with data packet animation for Slide 3.2
  3. Prompt includes hub-and-spoke metric definition with radiating consumers for Slide 3.3
  4. Prompt includes split-screen Core vs Edge comparison with promotion path arrow for Slide 3.4
**Plans**: 1 plan
Plans:
- [ ] 32-01-PLAN.md — Create Claude prompt for Data Foundation slides (3.1-3.4)

#### Phase 33: Agentic Layer
**Goal**: Generate Claude prompts to create Agentic Layer slides with three-layer architecture, intelligence pillars, and honeycomb capability grid
**Depends on**: Phase 32
**Requirements**: PRES-05
**Success Criteria** (what must be TRUE):
  1. Prompt includes three horizontal bands with animated icons for Slide 4.1
  2. Prompt includes three rising pillars with converging arrows for Slide 4.2
  3. Prompt includes Citadel stack with builder tool connections for Slide 4.3
  4. Prompt includes 8-hexagon honeycomb with ripple animation for Slide 4.4
**Plans**: 1 plan
Plans:
- [ ] 33-01-PLAN.md — Create Claude prompt for Agentic Layer slides (4.1-4.4)

#### Phase 34: Hub-Spoke Topology
**Goal**: Generate Claude prompts to create Hub-Spoke scaling slides with network topology, spoke autonomy diagrams, and complete architecture stack
**Depends on**: Phase 33
**Requirements**: PRES-06
**Success Criteria** (what must be TRUE):
  1. Prompt includes central hub with radiating spokes and data packet animation for Slide 5.1
  2. Prompt includes split spoke/hub diagram with contract boundary for Slide 5.2
  3. Prompt includes comprehensive layered architecture with bottom-to-top assembly animation for Slide 5.3
**Plans**: 1 plan
Plans:
- [ ] 34-01-PLAN.md — Create Claude prompt for Hub-Spoke Topology slides (5.1-5.3)

#### Phase 35: Closing & Call to Action
**Goal**: Generate Claude prompts to create business value and CTA slides with metric cards and action buttons
**Depends on**: Phase 34
**Requirements**: PRES-07
**Success Criteria** (what must be TRUE):
  1. Prompt includes 4 metric cards with 3D flip animation and ROI timeline for Slide 6.1
  2. Prompt includes large AI+ mark with 3 CTA buttons and staggered slide-up animation for Slide 6.2
  3. All prompts include speaker notes summary from PRESENTATION.md Section 7
**Plans**: 1 plan
Plans:
- [ ] 35-01-PLAN.md — Create Claude prompt for Closing slides (6.1-6.2)

## Progress

| Phase | Milestone | Plans Complete | Status | Completed |
| ----- | --------- | -------------- | ------ | --------- |
| 1. Documentation Foundation | v1.0 | 3/3 | Complete | 2026-04-09 |
| 2. Core Architecture | v1.0 | 3/3 | Complete | 2026-04-10 |
| 3. AI Landing Zone Patterns | v1.0 | 3/3 | Complete | 2026-04-10 |
| 4. Implementation Guides | v1.0 | 4/4 | Complete | 2026-04-10 |
| 5. Integration & Validation | v1.0 | 3/3 | Complete | 2026-04-10 |
| 6. Guides Documentation Section | v1.0 | 1/1 | Complete | 2026-04-10 |
| 7. Agent Factory Foundation | v1.1 | 1/1 | Complete | 2026-04-13 |
| 8. Agentic Web Stack Architecture | v1.1 | 2/2 | Complete | 2026-04-13 |
| 9. Agentic AI Design Patterns | v1.1 | 2/2 | Complete | 2026-04-13 |
| 10. Enterprise Use Cases | v1.1 | 2/2 | Complete | 2026-04-13 |
| 11. Open Standards Integration | v1.1 | 2/2 | Complete | 2026-04-13 |
| 12. Agent Security & Observability | v1.1 | 2/2 | Complete | 2026-04-13 |
| 13. Open Platform Transformation | v1.2 | 1/1 | Complete | 2026-04-13 |
| 14. Deep Agents Architecture | v1.2 | 1/1 | Complete | 2026-04-13 |
| 15. Navigation & Integration | v1.2 | 1/1 | Complete | 2026-04-13 |
| 16. EY Framework Alignment Overview | v1.3 | 2/2 | Complete | 2026-04-14 |
| 17. Kubernetes & DevOps Patterns | v1.3 | 2/2 | Complete | 2026-04-14 |
| 18. Security & Governance at Scale | v1.3 | 3/3 | Complete | 2026-04-14 |
| 19. MCP, A2A & Agent Discovery | v1.3 | 3/3 | Complete | 2026-04-15 |
| 20. Attention Points & Recommendations | v1.3 | 2/2 | Complete | 2026-04-15 |
| 21. Refactor Mintlify doc tabs for Guides and Operations | v1.3 | 2/2 | Complete | 2026-04-15 |
| 22. Refactor architecture and getting-started for SOF1A 2.0 | v1.3 | 4/4 | Complete | 2026-04-15 |
| 23. OneLake Architecture | v2.0 | 1/1 | Complete | 2026-04-27 |
| 24. Unity Catalog Governance | v2.0 | 1/1 | Complete | 2026-04-27 |
| 25. Semantic Layer | v2.0 | 1/1 | Complete | 2026-04-27 |
| 26. APIM Governed Data Access | v2.0 | 1/1 | Complete | 2026-04-28 |
| 27. Security & Identity Patterns | v2.0 | 1/1 | Complete | 2026-04-28 |
| 28. Navigation & Integration | v2.0 | 1/1 | Complete | 2026-04-28 |
| 29. Opening & Title Sequence | v3.0 | 0/1 | Not started | - |
| 30. Landing Zone Foundation | v3.0 | 0/1 | Not started | - |
| 31. Citadel Governance Core | v3.0 | 0/1 | Not started | - |
| 32. Data Foundation | v3.0 | 0/1 | Not started | - |
| 33. Agentic Layer | v3.0 | 0/1 | Not started | - |
| 34. Hub-Spoke Topology | v3.0 | 0/1 | Not started | - |
| 35. Closing & Call to Action | v3.0 | 0/1 | Not started | - |
