:# Roadmap: AI Landing Zone Documentation

## Milestones

- ✅ **v1.0 MVP** — Phases 1-6 (shipped 2026-04-13)
- ✅ **v1.1 AI Agent Factory Integration** — Phases 7-12 (shipped 2026-04-13)
- ✅ **v1.2 Open Platform Agent Factory** — Phases 13-15 (shipped 2026-04-13)
- ✅ **v1.3 EY Framework Alignment** — Phases 16-20 (shipped 2026-04-15)

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

### v1.3 EY Framework Alignment (Phases 16-22)

- [x] **Phase 16: EY Framework Alignment Overview** - Alignment map and dedicated EY section in site navigation (completed 2026-04-14)
- [x] **Phase 17: Kubernetes & DevOps Patterns** - AKS deployment, GitHub scaffolding, and CI/CD pipeline guidance (completed 2026-04-14)
- [x] **Phase 18: Security & Governance at Scale** - EY two-tiered governance mapped to Citadel 4-layer architecture (completed 2026-04-14)
- [x] **Phase 19: MCP, A2A & Agent Discovery** - Protocol alignment and APIM as agent registry (completed 2026-04-15)
- [x] **Phase 20: Attention Points & Recommendations** - Gap analysis and actionable add-on recommendations (completed 2026-04-15)
- [x] **Phase 21: Refactor Mintlify doc tabs for Guides and Operations** - Consolidate how-to pages into a single Operations section with links to official GitHub repos (completed 2026-04-15)
- [x] **Phase 22: Refactor architecture and getting-started documentation for SOF1A 2.0 AI Governance Platform** - Rebrand and restructure architecture and getting-started docs to reflect the SOF1A 2.0 AI Governance Platform vision (in progress — 2/4 plans complete) (completed 2026-04-15)

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
- [ ] 22-04-PLAN.md — Update docs.json navigation and verify cross-references

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
| 16. EY Framework Alignment Overview | 2/2 | Complete    | 2026-04-14 | - |
| 17. Kubernetes & DevOps Patterns | 2/2 | Complete    | 2026-04-14 | - |
| 18. Security & Governance at Scale | 3/3 | Complete    | 2026-04-14 | - |
| 19. MCP, A2A & Agent Discovery | 3/3 | Complete    | 2026-04-15 | - |
| 20. Attention Points & Recommendations | v1.3 | Complete    | 2026-04-15 | 2026-04-15 |
| 21. Refactor Mintlify doc tabs for Guides and Operations | 2/2 | Complete    | 2026-04-15 | - |
| 22. Refactor architecture and getting-started documentation for SOF1A 2.0 AI Governance Platform | 4/4 | Complete    | 2026-04-15 | - |
