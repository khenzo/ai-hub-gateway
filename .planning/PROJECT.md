# AI Landing Zone Documentation Project

## What This Is

A comprehensive documentation hub for implementing AI Landing Zones with Citadel Governance Hub on Azure, focusing on the APIM (Azure API Management) architecture pattern. The documentation provides end-to-end guidance for architects and business stakeholders to deploy, govern, and scale AI workloads securely and efficiently.

## Core Value

**Enable organizations to deploy enterprise-grade AI infrastructure with confidence** — providing clear, actionable guidance that bridges the gap between Microsoft's reference architectures and real-world implementation, ensuring governance, security, and observability from day one.

## Requirements

### Validated

- ✓ Create structured documentation architecture for Mintlify — v1.0
- ✓ Document Citadel Governance Hub architecture (4-layer model) — v1.0
- ✓ Document AI Landing Zone for APIM reference architecture — v1.0
- ✓ Create getting started guides for architects — v1.0
- ✓ Create deployment/implementation guides — v1.0
- ✓ Document hub-spoke networking patterns — v1.0
- ✓ Document AI Access Contracts and governance policies — v1.0
- ✓ Create business stakeholder value proposition content — v1.0
- ✓ Document integration with Foundry Control Plane — v1.0
- ✓ Create validation and testing guides — v1.0
- ✓ Structure content for user journey (Getting Started → Architecture → Deployment → Operations) — v1.0
- ✓ Document Agent Factory overview, intelligence layers, and builder personas — v1.1
- ✓ Map Agent Factory concepts to Citadel 4-layer architecture — v1.1
- ✓ Document 8 essential agentic web stack components — v1.1
- ✓ Document five core agentic AI design patterns (tool-use, reflection, planning, multi-agent, ReAct) — v1.1
- ✓ Map four enterprise use cases to AI Landing Zone (employee self-service, data analytics, sales, support) — v1.1
- ✓ Remove Microsoft-specific branding from Agent Factory pages — v1.2
- ✓ Maintain generic open-platform framing with framework-agnostic toolchains — v1.2
- ✓ Add deep agent architecture content (Agent Harness & Tools, Context Engineering) — v1.2
- ✓ Maintain Citadel + AI Landing Zone integration across all Agent Factory pages — v1.2
- ✓ Navigation consistency for 14-page Agent Factory group in docs.json — v1.2

### Active

- [ ] EY Framework overview and Citadel alignment map (gap analysis)
- [ ] Development spectrum coverage on Citadel (no-code, low-code, pro-code paths)
- [ ] Kubernetes/AKS deployment patterns and GitHub scaffolding for agent delivery
- [ ] DevOps pattern reproduction (CI/CD pipelines for agents on Azure)
- [ ] Security and governance at scale — Citadel vs EY two-tiered governance model
- [ ] MCP, A2A, and agent discovery protocol alignment
- [ ] Attention points and gaps documentation

### Out of Scope

- [x] Deep implementation details for non-APIM patterns (Foundry-only, custom gateways) — Covered by AI-Landing-Zones repo; focus on APIM integration
- [x] Code-level tutorials for developers — Target audience is architects and business stakeholders, not developers
- [x] Specific pricing/cost calculators — Use Azure pricing calculator; focus on architectural cost drivers
- [x] Multi-cloud implementations (AWS/GCP) — Focus on Azure-native solutions
- [x] Legacy on-premises integration patterns — Focus on cloud-native Azure Landing Zone integration

## Context

### Current State

**Shipped v1.2** with open-platform transformation of the Agent Factory layer (Phases 13-15). Building on v1.0 foundation (156 files) and v1.1 Agent Factory integration (31 files).
**Tech stack:** Mintlify, MDX, Node.js 18+
**Documentation coverage:** Complete end-to-end coverage from Getting Started through Operations, with Agent Factory now framework-agnostic (LangChain, LangGraph, Claude SDK, OpenAI Agents SDK, Microsoft Agent Framework)
**Primary deliverables:** Open-platform Agent Factory narrative, Agent Harness & Tools deep architecture, Context Engineering deep architecture, full docs.json navigation integration for 14 Agent Factory pages

### Source Materials

This documentation synthesizes content from three primary sources:

1. **Citadel Governance Hub** (`ai-hub-gateway/README.md`)
   - Solution accelerator for enterprise AI governance
   - Hub-spoke architecture with Azure API Management as unified AI gateway
   - Infrastructure-as-code (Bicep) deployment patterns
   - Usage ingestion, validation notebooks, operational guides

2. **AI Landing Zones** (`AI-Landing-Zones-main/`)
   - Enterprise-scale production reference architecture
   - Two primary patterns: Foundry-based and APIM-based
   - Extensible implementations (Bicep, Terraform, Portal)
   - Design checklist aligned with CAF and WAF

3. **Foundry Citadel Platform** (`foundry-citadel-platform-main/`)
   - 4-layer unified approach to AI security and compliance
   - Layer 1: Governance Hub (runtime enforcement)
   - Layer 2: AI Control Plane (observability & compliance)
   - Layer 3: Agent Identity (Agent 365)
   - Layer 4: Security Fabric (Defender, Purview, Entra)

### Target Audience

**Primary**: Cloud Architects, Solution Architects, Platform Engineers
- Need detailed architecture diagrams and decision trees
- Require deployment patterns and configuration guidance
- Looking for integration patterns with existing Azure Landing Zones

**Secondary**: Business Stakeholders, Compliance Officers, CTOs
- Need to understand value proposition and ROI
- Require governance and compliance capabilities overview
- Looking for strategic alignment with enterprise architecture

### Documentation Platform

**Mintlify** (mintlify.com)
- Modern developer documentation platform
- Supports MDX, interactive components, and API documentation
- Ideal for structured technical documentation with user journey flow

### Key Integration Points

1. **Azure Landing Zone (ALZ) Integration**
   - Extends existing platform landing zones
   - Leverages hub-spoke networking topology
   - Integrates with existing security and governance foundations

2. **Microsoft Foundry Platform**
   - AI Control Plane for observability and compliance
   - Model catalog and agent runtime
   - Responsible AI evaluations

3. **Microsoft Security Fabric**
   - Entra ID for identity and access
   - Defender for AI threat protection
   - Purview for data governance and PII protection

## Current Milestone: v1.3 EY Framework Alignment

**Goal:** Document how the Citadel AI Landing Zone addresses the EY AI Agent Development Framework — where it enforces the patterns, how, and where attention is needed.

**Target features:**
- EY Framework overview and Citadel alignment map (gap analysis table)
- Development spectrum coverage: no-code → low-code → pro-code on Azure/Microsoft stack
- Kubernetes (AKS) deployment patterns and GitHub scaffolding / DevOps patterns
- Security and governance at scale — Citadel 4-layer vs EY two-tiered governance model
- MCP, A2A, and agent discovery protocol alignment
- Attention points and gaps page

## Constraints

- **Tech Stack**: Must use Mintlify-compatible Markdown/MDX
- **Source Fidelity**: Must accurately represent Microsoft's reference architectures without modification
- **Audience Alignment**: Content must serve both technical architects and business stakeholders
- **Scope**: Focus on APIM-based AI Landing Zone pattern (not Foundry-only deployments)
- **Integration**: Must align with Azure Cloud Adoption Framework and Well-Architected Framework
- **Compliance**: Must address enterprise governance, security, and compliance requirements

## Key Decisions

| Decision | Rationale | Outcome |
|----------|-----------|---------|
| User journey organization | Architects and stakeholders need progressive disclosure — start with concepts, then architecture, then implementation | ✓ Good — navigation flows naturally from Getting Started to Operations |
| Mintlify platform | Provides modern documentation experience with search, navigation, and interactive elements | ✓ Good — 156 files organized with full search and card-based navigation |
| Dual-audience approach | Business stakeholders need strategic context; architects need technical depth | ✓ Good — Business Value section bridges both audiences effectively |
| APIM focus | Citadel Governance Hub centers on APIM as unified AI gateway; aligns with "AI Landing Zone for APIM" pattern | ✓ Good — clear differentiation from Foundry-only deployments |
| 4-layer Citadel model | Foundry Citadel Platform provides the conceptual framework that ties together governance, observability, identity, and security | ✓ Good — consistent architecture structure across all documentation |
| ASCII Architecture Diagrams | Maintainable in version control, accessible, load quickly | ✓ Good — all diagrams clear and consistently styled |
| Bicep snippet includes | Reusable code patterns referenced across multiple guides | ✓ Good — reduces duplication and ensures consistency |
| Agent Factory tab placement | Positioned between Architecture and Business Value for logical user journey | ✓ Good — natural progression from concepts to implementation |
| Synthesize over copy-paste | White paper content restructured into Mintlify docs rather than copied verbatim | ✓ Good — avoids duplication, creates maintainable single-source docs |
| Cross-link governance pages | Agent security blueprint references existing governance pages instead of duplicating | ✓ Good — maintains single source of truth, reduces maintenance burden |
| Pattern doc structure | Each design pattern uses Definition → Capabilities → Citadel Placement → Azure Services → Example → Guidance | ✓ Good — consistent scannable format across all patterns |
| Open-platform rebranding | Framework-agnostic narrative removes vendor lock-in and serves broader enterprise audience | ✓ Good — documentation now equally covers LangChain, LangGraph, Claude SDK, OpenAI Agents SDK, and Microsoft Agent Framework |
| Deep architecture pages | Harness engineering and context engineering are advanced topics that differentiate this documentation from basic tutorials | ✓ Good — both pages exceed length minimums and include formal Citadel integration sections |
| Tool-gated execution principle | "Model never executes anything directly" is the core safety pattern for agentic systems | ✓ Good — clearly articulated with middleware chain and sandbox provider comparisons |
| Cross-link over duplicate | Citadel integration references use cross-links rather than repeating architecture content | ✓ Good — keeps Agent Factory pages focused while preserving 4-layer alignment |

---

<details>
<summary>Archive: Pre-v1.2 Project State</summary>

*Last updated: 2026-04-13 after v1.1 milestone completion*

**Current State (v1.1):**
Shipped v1.1 with 31 additional files across 6 phases (Phases 7-12), building on the v1.0 foundation of 156 MDX/Markdown files.
Primary deliverables: Agent Factory architecture, design patterns, enterprise use cases, MCP/A2A integration, agent security blueprint, and observability best practices.

**Previous Next Milestone Goals (v1.2):**
- Add performance and scaling guidance for high-scale agentic deployments
- Create video/visual supplements for complex Agent Factory architectures
- Expand troubleshooting runbooks based on deployment feedback
- Add multi-agent orchestration implementation examples with code samples
- Consider adding Terraform deployment patterns as alternative to Bicep
</details>

<details>
<summary>Archive: Pre-v1.0 Project State</summary>

*Last updated: 2026-04-09 after initialization*

### Previous Active Requirements
- [ ] Create structured documentation architecture for Mintlify
- [ ] Document Citadel Governance Hub architecture (4-layer model)
- [ ] Document AI Landing Zone for APIM reference architecture
- [ ] Create getting started guides for architects
- [ ] Create deployment/implementation guides
- [ ] Document hub-spoke networking patterns
- [ ] Document AI Access Contracts and governance policies
- [ ] Create business stakeholder value proposition content
- [ ] Document integration with Foundry Control Plane
- [ ] Create validation and testing guides
- [ ] Structure content for user journey (Getting Started → Architecture → Deployment → Operations)

### Previous Key Decisions Outcomes
All outcomes were marked "— Pending" before v1.0 shipment.
</details>

---
*Last updated: 2026-04-14 after v1.3 milestone start*
