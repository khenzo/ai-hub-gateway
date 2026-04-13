# Requirements: v1.2 — Open Platform Agent Factory

## Milestone Goal

Transform the Agent Factory documentation from a Microsoft-specific operating model into a **generic, open-platform agentic factory** implementation. Upgrade the section with deep architectural patterns from modern agent engineering — tools, harness, skills, hooks, and context engineering — while keeping strong alignment with the Citadel 4-layer architecture and AI Landing Zone.

## Trigger

The first three Agent Factory pages (overview, intelligence-layers, builder-personas) and the citadel-mapping page are written around the Microsoft Agent Factory white paper. This creates a vendor lock-in narrative incompatible with the project's goal of being a generic AI Landing Zone documentation hub. Two source PDFs provide richer, framework-agnostic content.

## Source Material

| Source | Content Used |
|--------|-------------|
| `docs/agent-factory/LangChain Deep Agents — Harness and Context Engineering.pdf` | Harness engineering, context engineering, progressive skill disclosure, HITL middleware, sandboxes |
| `docs/agent-factory/Architecting Autonomous Agents — Azure AI Foundry Agent Service.pdf` | Generic agent architecture patterns (Agent/Thread/Run/Tools), stateful design, human-in-the-loop |

## Functional Requirements

### FR-01: Remove Microsoft-specific branding from Agent Factory pages

- [ ] Remove "Microsoft Agent Factory" as the primary concept name; replace with "Enterprise Agent Factory" or "Open Agentic Platform"
- [ ] Remove Work IQ, Fabric IQ, Foundry IQ (Microsoft 365 / Power BI / Dataverse specific)
- [ ] Remove Copilot Studio, GitHub Copilot, Microsoft Foundry, Agent 365 as prescribed platforms
- [ ] Remove references to Microsoft prepaid commercial plans and Forward Deployed Engineering

### FR-02: Maintain generic open-platform framing

- [ ] Intelligence layers reframed as: Workspace Intelligence, Business Data Intelligence, Enterprise Knowledge Intelligence (framework-agnostic)
- [ ] Builder personas reference open toolchains: LangChain, LangGraph, Claude Agent SDK, OpenAI Agents SDK, low-code platforms (generic)
- [ ] Use case scenarios (Employee Self-Service, Data Analytics, Sales, Customer Support) retained — only tooling references updated
- [ ] Architecture diagrams use generic labels instead of Microsoft product names

### FR-03: Add deep agent architecture content

- [ ] New page: **Agent Harness & Tools** — harness engineering, tool-gated execution, middleware chain, HITL hooks, 4-layer security model, sandbox providers
- [ ] New page: **Context Engineering** — filesystem working memory, progressive skill disclosure (3-tier loading), automatic summarization, skills vs memory distinction, three-layer agent architecture

### FR-04: Maintain Citadel + AI Landing Zone integration

- [x] All updated and new pages must reference the Citadel 4-layer architecture (Layer 1 Governance Hub, Layer 2 AI Control Plane, Layer 3 Agent Identity, Layer 4 Security Fabric)
- [x] Citadel placement sections retained in every page
- [x] Cross-links to architecture/* pages maintained
- [x] APIM gateway role preserved and emphasized as the open platform's governance hub

### FR-05: Navigation consistency

- [x] `docs/docs.json` updated with new pages in Agent Factory group
- [x] Page ordering: overview → intelligence-layers → builder-personas → citadel-mapping → agentic-web-stack → agentic-stack-diagrams → design-patterns → orchestration-patterns → **context-engineering** → **agent-harness** → mcp-integration → a2a-integration → agent-security-blueprint → agent-observability

## Non-Functional Requirements

- All content uses Mintlify MDX format with consistent frontmatter
- Diagrams use ASCII art (established project convention)
- CardGroup navigation components for next-step cards
- Content targets cloud architects and platform engineers (established audience)

## Out of Scope

- Modifying non-Agent-Factory pages
- Adding pricing/cost calculators
- Adding video content
- Changing Citadel architecture documentation
