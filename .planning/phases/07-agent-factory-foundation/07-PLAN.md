# Phase 7: Agent Factory Foundation

**Phase Goal:** Establish the Agent Factory overview and intelligence layers (Work IQ, Fabric IQ, Foundry IQ) and map them to the Citadel architecture.

**Success Criteria:**
- [ ] `docs/agent-factory/overview.mdx` documents the Agent Factory operating model and value proposition
- [ ] `docs/agent-factory/intelligence-layers.mdx` explains Work IQ, Fabric IQ, and Foundry IQ with diagrams
- [ ] `docs/agent-factory/builder-personas.mdx` maps all 4 scenarios to builder personas and tools
- [ ] `docs/agent-factory/citadel-mapping.mdx` provides clear architecture mapping to Citadel 4-layer model
- [ ] `docs.json` updated with Agent Factory navigation group
- [ ] Cross-references added from Citadel 4-layer model, Layer 2 control plane, introduction, and Foundry integration docs
- [ ] All internal links resolve correctly
- [ ] Content renders correctly in Mintlify with proper CardGroup navigation

**Phase Status:** 📋 Planned  
**Target Completion:** TBD  
**Owner:** TBD  

---

## Plan 07-01: Document Agent Factory Overview, Builder Personas, and Intelligence Layers

### Task 1: Create `docs/agent-factory/overview.mdx`
**Status:** ⏳ Not Started  
**Estimated Effort:** 45 minutes  

**Files to Create:**
- `docs/agent-factory/overview.mdx`

**Deliverables:**
- Frontmatter with `title`, `description`
- **Building an agentic workforce** section with stats and context
- **Microsoft Agent Factory** section covering:
  - Operating model (intelligence layers + builder platforms + governance)
  - Unified commercial model (single prepaid plan spanning Copilot Studio, Foundry, GitHub Copilot, Fabric)
  - Enablement resources (FDE, partners, skilling)
- **Why now** positioning
- `<CardGroup>` next-step navigation to intelligence-layers and builder-personas pages
- ASCII diagram showing Agent Factory high-level components:
  ```
  ┌─────────────────────────────────────────────────────────────┐
  │              MICROSOFT AGENT FACTORY                         │
  │                                                              │
  │  ┌─────────────┐  ┌─────────────┐  ┌─────────────────────┐  │
  │  │  Work IQ    │  │  Fabric IQ  │  │    Foundry IQ       │  │
  │  │  (M365)     │  │  (Business) │  │  (Enterprise KB)    │  │
  │  └─────────────┘  └─────────────┘  └─────────────────────┘  │
  │         │                │                    │              │
  │         └────────────────┼────────────────────┘              │
  │                          ▼                                   │
  │  ┌─────────────────────────────────────────────────────┐    │
  │  │         Builder Platforms + Agent 365               │    │
  │  │   Copilot Studio  │  Foundry  │  GitHub Copilot     │    │
  │  └─────────────────────────────────────────────────────┘    │
  └─────────────────────────────────────────────────────────────┘
  ```

**Acceptance Criteria:**
- [ ] File renders without MDX errors
- [ ] All CardGroup links use correct absolute paths (`/agent-factory/intelligence-layers`, etc.)
- [ ] Content synthesizes the white paper accurately

---

### Task 2: Create `docs/agent-factory/intelligence-layers.mdx`
**Status:** ⏳ Not Started  
**Estimated Effort:** 60 minutes  

**Files to Create:**
- `docs/agent-factory/intelligence-layers.mdx`

**Deliverables:**
- Frontmatter with `title`, `description`
- **Work IQ** section:
  - Definition: understands how employees work via M365 signals
  - Sources: emails, calendar, documents, Teams chats, collaboration patterns
  - Example use case: "what should I prioritize today?"
- **Fabric IQ** section:
  - Definition: understands how the business operates
  - Sources: Power BI, Dataverse, Azure SQL, business terms/processes
  - Role in agent operations and semantic layer
- **Foundry IQ** section:
  - Definition: connects all knowledge across the enterprise
  - Sources: structured/unstructured content, Work IQ, Fabric IQ, enterprise data via MCP, public web
  - RAG simplification value proposition
  - Permission-respecting knowledge bases
- **How the layers work together** section with a table:
  | Layer | Context Type | Primary Sources | Agent Value |
  |-------|--------------|-----------------|-------------|
  | Work IQ | Employee context | M365, Teams, Outlook | Personal prioritization, routing |
  | Fabric IQ | Business context | Power BI, Dataverse, SQL | Operational decisions, metrics |
  | Foundry IQ | Enterprise knowledge | All sources + MCP + web | Grounded answers, SOPs, manuals |
- **Customer example** (Manufacture of Power Equipment — line operator deviation at station 23)
- ASCII architecture diagram showing the three IQ layers feeding into builder platforms
- `<CardGroup>` next-step navigation to builder-personas and citadel-mapping

**Acceptance Criteria:**
- [ ] Each IQ layer has a clear, distinct definition
- [ ] Customer example is complete and accurate to the white paper
- [ ] Diagram is clear and uses ASCII art (no mermaid)

---

### Task 3: Create `docs/agent-factory/builder-personas.mdx`
**Status:** ⏳ Not Started  
**Estimated Effort:** 75 minutes  

**Files to Create:**
- `docs/agent-factory/builder-personas.mdx`

**Deliverables:**
- Frontmatter with `title`, `description`
- **Builder Personas Overview** explaining the two primary personas (Power Users / Non-dev and Developers) and the Business User for analytics
- **Four Scenarios** documented individually:
  1. **Employee Self-Service (HR and IT Support)**
     - Challenge, opportunity, who should act
     - Builder table:
       | Persona | Approach | Tool |
       | Power User | Copilot Studio agent with Work IQ + Foundry IQ | M365 Copilot + Copilot Studio |
       | Developer | Full-control agent with MCP/APIs, deploy in Foundry | Foundry + Agent Framework |
     - IQ advantage, customer example (global energy company), buying pattern fit
  2. **Data and Analytics Agents**
     - Challenge, opportunity, who should act
     - Builder table with Business User, Data Engineer, Developer rows
     - Customer example (large banking customer)
  3. **Sales Lead Engagement**
     - Challenge, opportunity, who should act
     - Builder table with Power User and Developer rows
     - Customer example (B2B technology company)
  4. **Customer Support and Product Feedback**
     - Challenge, opportunity, who should act
     - Builder table with Power User and Developer rows
     - Customer example (SaaS platform company)
- Summary table of all scenarios:
  | Scenario | Primary Personas | Key IQ Layers | Best Fit |
- `<CardGroup>` next-step navigation to overview, intelligence-layers, and citadel-mapping

**Acceptance Criteria:**
- [ ] All 4 scenarios are documented with consistent structure
- [ ] Every scenario includes a builder persona table
- [ ] Customer examples are accurate to the white paper
- [ ] No duplicated full content from the white paper — synthesized and structured for docs

---

### Task 4: Update `docs.json` with Agent Factory Navigation
**Status:** ⏳ Not Started  
**Estimated Effort:** 15 minutes  

**Files to Modify:**
- `docs.json`

**Deliverables:**
- Add new top-level tab after "Architecture":
  ```json
  {
    "name": "Agent Factory",
    "url": "agent-factory"
  }
  ```
- Add new navigation group in the `navigation.groups` array, positioned after the "Architecture" group:
  ```json
  {
    "group": "Agent Factory",
    "pages": [
      "docs/agent-factory/overview",
      "docs/agent-factory/intelligence-layers",
      "docs/agent-factory/builder-personas",
      "docs/agent-factory/citadel-mapping"
    ]
  }
  ```

**Acceptance Criteria:**
- [ ] JSON is valid (no trailing commas, proper nesting)
- [ ] Tab order is logical: Getting Started, Architecture, Agent Factory, Business Value, Implementation, Guides, Governance, Operations
- [ ] All 4 agent-factory pages are listed in the group

---

## Plan 07-02: Map Agent Factory Concepts to Citadel 4-Layer Model and AI Landing Zone

### Task 5: Create `docs/agent-factory/citadel-mapping.mdx`
**Status:** ⏳ Not Started  
**Estimated Effort:** 75 minutes  

**Files to Create:**
- `docs/agent-factory/citadel-mapping.mdx`

**Deliverables:**
- Frontmatter with `title`, `description`
- **Mapping Overview** section explaining why Agent Factory and Citadel are complementary
- **Citadel 4-Layer + Agent Factory Mapping** with a table:
  | Citadel Layer | Agent Factory Component | Integration Point |
  |---------------|------------------------|-------------------|
  | Layer 1: Governance Hub | APIM Gateway, API Center | Foundry + Copilot Studio agents route through CGH |
  | Layer 2: AI Control Plane | Foundry Control Plane, evaluations | Agent Factory observability and compliance brain |
  | Layer 3: Agent Identity | Agent 365 | Unified agent identity, sponsorship, lifecycle |
  | Layer 4: Security Fabric | Defender, Purview, Entra | Protects agent workloads across all IQ layers |
- **Intelligence Layers in the Landing Zone** section:
  - Where Work IQ sits (M365 / Teams integration → Layer 1 gateway enforcement)
  - Where Fabric IQ sits (Data layer → Layer 2 observability on data access)
  - Where Foundry IQ sits (Knowledge base / MCP → Layer 1 gateway for MCP servers, Layer 2 for knowledge evaluation)
- **Builder Platforms & Deployment Patterns** section:
  - Copilot Studio agents → lightweight, M365-integrated, governed via Layer 1
  - Foundry + Agent Framework → enterprise-scale, custom orchestration, full 4-layer governance
- ASCII architecture diagram showing Agent Factory mapped onto Citadel:
  ```
  ┌─────────────────────────────────────────────────────────────────────────────┐
  │                     AGENT FACTORY ON CITADEL                                │
  │                                                                              │
  │  ┌──────────────────────────────────────────────────────────────────────┐   │
  │  │                         INTELLIGENCE LAYER                            │   │
  │  │   ┌─────────┐   ┌─────────┐   ┌─────────┐   ┌─────────┐             │   │
  │  │   │ Work IQ │   │Fabric IQ│   │Foundry IQ│  │ Agent   │             │   │
  │  │   │(M365)   │   │(Data)   │   │(Knowledge│  │ 365     │             │   │
  │  │   └────┬────┘   └────┬────┘   └────┬────┘   │(Identity│             │   │
  │  │        │             │             │        │/Control)│             │   │
  │  │        └─────────────┴─────────────┘        └────┬────┘             │   │
  │  └──────────────────────────────────────────────────┼──────────────────┘   │
  │                                                     │                        │
  │  ┌──────────────────────────────────────────────────┼──────────────────┐    │
  │  │              CITADEL 4-LAYER ARCHITECTURE        │                  │    │
  │  │                                                  ▼                  │    │
  │  │  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐  ┌────────────┐ │    │
  │  │  │ Layer 1     │  │ Layer 2     │  │ Layer 3     │  │ Layer 4    │ │    │
  │  │  │ Governance  │  │ AI Control  │  │ Agent       │  │ Security   │ │    │
  │  │  │ Hub         │  │ Plane       │  │ Identity    │  │ Fabric     │ │    │
  │  │  │ (APIM)      │  │ (Foundry)   │  │ (Agent 365) │  │ (Defender) │ │    │
  │  │  └─────────────┘  └─────────────┘  └─────────────┘  └────────────┘ │    │
  │  └─────────────────────────────────────────────────────────────────────┘    │
  │                                                                              │
  │  ┌─────────────────────────────────────────────────────────────────────┐    │
  │  │                    BUILDER PLATFORMS                                 │    │
  │  │   Copilot Studio  │  Azure AI Foundry  │  GitHub Copilot            │    │
  │  └─────────────────────────────────────────────────────────────────────┘    │
  └─────────────────────────────────────────────────────────────────────────────┘
  ```
- **Deployment Recommendations**:
  - Use Citadel Layer 1 to route all Agent Factory agent traffic
  - Use Layer 2 for Foundry Control Plane observability on agent outputs
  - Use Layer 3 (Agent 365) for identity and lifecycle of all agents
  - Use Layer 4 for threat detection and data governance across IQ sources
- `<CardGroup>` next-step navigation to:
  - `/architecture/citadel-4-layer-model`
  - `/ai-patterns/foundry-integration`
  - `/agent-factory/builder-personas`

**Acceptance Criteria:**
- [ ] Mapping table clearly connects each Citadel layer to an Agent Factory component
- [ ] ASCII diagram accurately represents the relationship
- [ ] Deployment recommendations are actionable and specific
- [ ] All internal links are correct

---

### Task 6: Update `docs/architecture/citadel-4-layer-model.mdx`
**Status:** ⏳ Not Started  
**Estimated Effort:** 20 minutes  

**Files to Modify:**
- `docs/architecture/citadel-4-layer-model.mdx`

**Deliverables:**
- Add a new section **"Relationship to Microsoft Agent Factory"** before "Relationship to Azure Landing Zones"
- Content:
  - Brief paragraph explaining that Citadel provides the governance and security foundation for Microsoft Agent Factory deployments
  - Bullet list:
    - Citadel Layer 1 enforces runtime policies for agents built in Copilot Studio and Foundry
    - Citadel Layer 2 provides observability and evaluations for Agent Factory workloads
    - Citadel Layer 3 (Agent 365) manages agent identity and lifecycle
    - Citadel Layer 4 secures the intelligence layers (Work IQ, Fabric IQ, Foundry IQ)
  - `<Card title="Agent Factory Mapping" href="/agent-factory/citadel-mapping" icon="factory">` card linking to the new mapping doc
- Update the "Detailed Layer Documentation" CardGroup at the bottom to also include:
  ```mdx
  <Card title="Agent Factory on Citadel" href="/agent-factory/citadel-mapping" icon="factory">
    How Agent Factory maps to the 4-layer model
  </Card>
  ```

**Acceptance Criteria:**
- [ ] New section flows naturally in the document structure
- [ ] Card links are valid and use absolute paths
- [ ] No broken MDX syntax

---

### Task 7: Update `docs/architecture/layer-2-control-plane.mdx`
**Status:** ⏳ Not Started  
**Estimated Effort:** 20 minutes  

**Files to Modify:**
- `docs/architecture/layer-2-control-plane.mdx`

**Deliverables:**
- In the **Overview** section, add one sentence connecting Layer 2 to Agent Factory: mention that the Foundry Control Plane is the observability and compliance brain for Agent Factory workloads
- Add a new subsection under **Core Functionalities** or **Fleet Operations** called **"Agent Factory Integration"** with:
  - Table:
    | Agent Factory Element | Layer 2 Capability | Value |
    |-----------------------|-------------------|-------|
    | Foundry-hosted agents | Execution traces, evaluations | End-to-end quality assurance |
    | Copilot Studio agents | Usage tracking, compliance checks | Unified observability across platforms |
    | Agent 365 identity | Lifecycle + access correlation | Track agent behavior by identity |
    | Work IQ / Fabric IQ | Data access telemetry | Monitor what intelligence agents consume |
- Update the **Next Steps** section to add:
  - `- Explore [Agent Factory mapping](/agent-factory/citadel-mapping) to understand the full integration`

**Acceptance Criteria:**
- [ ] Content integrates naturally without disrupting existing structure
- [ ] Table is accurate and adds value
- [ ] Link uses correct absolute path

---

### Task 8: Update Cross-References in `docs/getting-started/introduction.mdx` and `docs/ai-patterns/foundry-integration.mdx`
**Status:** ⏳ Not Started  
**Estimated Effort:** 20 minutes  

**Files to Modify:**
- `docs/getting-started/introduction.mdx`
- `docs/ai-patterns/foundry-integration.mdx`

**Deliverables for `docs/getting-started/introduction.mdx`:**
- Add a new `<Card>` in the "Built on the Citadel Platform" CardGroup:
  ```mdx
  <Card title="Agent Factory" icon="robot" href="/agent-factory/overview">
    Explore the Microsoft Agent Factory operating model and intelligence layers
  </Card>
  ```
- Add a new `<Step>` in the `<Steps>` block after "Explore Architecture":
  ```mdx
  <Step title="Explore Agent Factory">
    Learn how Microsoft's Agent Factory maps to the AI Landing Zone in the [Agent Factory Overview](/agent-factory/overview).
  </Step>
  ```

**Deliverables for `docs/ai-patterns/foundry-integration.mdx`:**
- Add a new `<Card>` in the **Related Documentation** CardGroup at the bottom:
  ```mdx
  <Card title="Agent Factory Intelligence Layers" href="/agent-factory/intelligence-layers" icon="brain">
    Understand Work IQ, Fabric IQ, and Foundry IQ integration
  </Card>
  ```
- Add a brief paragraph in the **Foundry Control Plane Overview** section mentioning that the Control Plane powers the Foundry IQ intelligence layer within the Microsoft Agent Factory

**Acceptance Criteria:**
- [ ] Both files updated with natural, non-intrusive references
- [ ] All Card hrefs use absolute paths
- [ ] MDX syntax is valid in both files

---

## Dependencies

**Prerequisites:**
- None external; this phase builds on existing v1.0 MVP documentation

**Inter-plan Dependencies:**
- Task 4 (docs.json update) can be done independently but should be coordinated with content creation
- Tasks 6-8 (cross-references) depend on Tasks 1-5 because they link to `/agent-factory/*` pages

**Post-requisites:**
- Phase 8 (Agentic Web Stack Architecture) will build on the Agent Factory foundation established here

---

## Risk Assessment

| Risk | Likelihood | Impact | Mitigation |
|------|-----------|--------|------------|
| Content duplication from white paper | Medium | Low | Synthesize and structure for docs; avoid copy-paste |
| Broken internal links to new pages | Low | Medium | Validate all hrefs before completing |
| docs.json merge conflicts | Low | Medium | Make minimal, targeted edits to JSON |
| Overlap with Phase 10 (use cases) | Medium | Low | Keep builder personas high-level; leave deep implementation to Phase 10 |

---

## Definition of Done

- [ ] `docs/agent-factory/overview.mdx` created and renders correctly
- [ ] `docs/agent-factory/intelligence-layers.mdx` created and renders correctly
- [ ] `docs/agent-factory/builder-personas.mdx` created and renders correctly
- [ ] `docs/agent-factory/citadel-mapping.mdx` created and renders correctly
- [ ] `docs.json` updated with Agent Factory tab and navigation group
- [ ] `docs/architecture/citadel-4-layer-model.mdx` updated with Agent Factory section and cross-link
- [ ] `docs/architecture/layer-2-control-plane.mdx` updated with Agent Factory integration table
- [ ] `docs/getting-started/introduction.mdx` updated with Agent Factory discovery card and step
- [ ] `docs/ai-patterns/foundry-integration.mdx` updated with Agent Factory reference
- [ ] All new internal links tested and working
- [ ] Mintlify renders all new pages without errors
- [ ] Phase summary document created (07-SUMMARY.md)
