:# Roadmap: AI Landing Zone Documentation

## Milestones

- ✅ **v1.0 MVP** — Phases 1-6 (shipped 2026-04-13)
- ✅ **v1.1 AI Agent Factory Integration** — Phases 7-12 (shipped 2026-04-13)

## Milestones

- ✅ **v1.0 MVP** — Phases 1-6 (shipped 2026-04-13)
- ✅ **v1.1 AI Agent Factory Integration** — Phases 7-12 (shipped 2026-04-13)
- 🚧 **v1.2 Open Platform Agent Factory** — Phases 13-15 (in progress)

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
<summary>🚧 v1.2 Open Platform Agent Factory (Phases 13-15) — IN PROGRESS</summary>

**Milestone Goal:** Transform the Agent Factory documentation from Microsoft-specific to a generic open-platform agentic factory. Add deep architectural patterns from modern agent engineering — tools, harness, skills, hooks, context engineering — while preserving Citadel 4-layer architecture alignment.

#### Phase 13: Open Platform Transformation
**Goal**: Remove Microsoft-specific branding from Agent Factory pages and reframe to generic open-platform narrative — replacing Work IQ/Fabric IQ/Foundry IQ and Microsoft tooling with framework-agnostic equivalents (LangChain, LangGraph, Claude Agent SDK, OpenAI Agents SDK, Microsoft Agent Framework).
**Depends on**: Phase 12
**Requirements**: FR-01, FR-02
**Plans**: 1 plan

**Framework Reference (for open-platform rebranding):**
- **LangChain / LangGraph** — Python/JS orchestration, stateful multi-agent graphs
- **Claude Agent SDK** — Anthropic's SDK for agentic task execution
- **OpenAI Agents SDK** — OpenAI's SDK for tool-calling agents
- **Microsoft Agent Framework** (`pip install agent-framework`) — Next-gen successor to Semantic Kernel + AutoGen; graph-based workflows, enterprise state management, MCP tool support, providers: Anthropic, Azure OpenAI, OpenAI, Foundry, Ollama. See: https://learn.microsoft.com/agent-framework/overview/

Plans:
- [ ] 13-01-PLAN.md — Audit intelligence-layers & builder-personas (confirm compliant); add OpenAI Agents SDK + Microsoft Agent Framework to overview.mdx & citadel-mapping.mdx; fix (Foundry) ASCII label

#### Phase 14: Deep Agents Architecture ✅
**Goal**: Add two new deep-architecture pages — Agent Harness & Tools (tool-gated execution, middleware chain, HITL hooks, 4-layer security, sandbox providers) and Context Engineering (filesystem working memory, progressive skill disclosure, three-tier loading, automatic summarization) — derived from source PDFs.
**Depends on**: Phase 13
**Requirements**: FR-03
**Plans**: 1 plan
**Status**: COMPLETED 2026-04-13

Plans:
- [x] 14-01-PLAN.md — Verify and patch agent-harness.mdx and context-engineering.mdx against FR-03; add formal Citadel Integration section to context-engineering.mdx; confirm docs.json ordering

#### Phase 15: Navigation & Integration
**Goal**: Update docs/docs.json navigation to integrate new pages into the Agent Factory group in the correct order, ensure cross-links and Citadel integration references are consistent across all updated pages.
**Depends on**: Phase 14
**Requirements**: FR-04, FR-05
**Plans**: 1 plan

Plans:
- [ ] 15-01: Update navigation ordering and validate cross-link consistency across all Agent Factory pages

</details>

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
| 15. Navigation & Integration | 1/1 | Complete   | 2026-04-13 | — |
