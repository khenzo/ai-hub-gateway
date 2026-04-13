# Phase 13: Open Platform Transformation - Research

**Researched:** 2026-04-13
**Domain:** Mintlify MDX documentation, open-platform agent framework positioning
**Confidence:** HIGH

---

<phase_requirements>
## Phase Requirements

| ID | Description | Research Support |
|----|-------------|-----------------|
| FR-01 | Remove Microsoft-specific branding from Agent Factory pages (Work IQ, Fabric IQ, Foundry IQ, Copilot Studio, GitHub Copilot, Microsoft Foundry, Agent 365, Microsoft prepaid plans, Forward Deployed Engineering) | Audit of all four pages shows specific residual references — see Current State Audit section |
| FR-02 | Maintain generic open-platform framing: intelligence layers use framework-agnostic names; builder personas reference open toolchains (LangChain, LangGraph, Claude Agent SDK, OpenAI Agents SDK, Microsoft Agent Framework as multi-provider option); use case scenarios retained with only tooling references updated | Microsoft Agent Framework positioning documented; replacement terminology mapped per concept |
</phase_requirements>

---

## Summary

Phase 13 performs a targeted content audit and rewrite across four existing Agent Factory pages. The milestone goal is to complete the shift from a Microsoft-specific operating model to a generic open-platform narrative — replacing residual Microsoft product labels and adding the full set of approved open frameworks.

Good news first: the pages are largely already clean. Phases 7–12 already removed the most egregious Microsoft branding — Work IQ, Fabric IQ, Foundry IQ, Copilot Studio, and Forward Deployed Engineering do not appear in any of the four target pages. The intelligence-layers.mdx and builder-personas.mdx are effectively compliant with FR-01 and FR-02 already.

The remaining work is concentrated in two places. First, `citadel-mapping.mdx` contains a Microsoft-specific label in its ASCII architecture diagram (`(Foundry)` in the Layer 2 cell) and its "Framework-Based Agents" heading and builder toolchain list omits Microsoft Agent Framework and OpenAI Agents SDK. Second, `overview.mdx` has an identical gap in the builder toolchains pillar and does not introduce or explain the Microsoft Agent Framework as a multi-provider option. These are the only substantive changes needed for FR-01 and FR-02 compliance.

The Microsoft Agent Framework requires careful positioning: it is included as a genuine multi-provider option because it supports Anthropic, OpenAI, Azure OpenAI, Foundry, and Ollama — not as a Microsoft-only tool. It must appear alongside LangChain, LangGraph, Claude Agent SDK, and OpenAI Agents SDK, never as a highlighted or preferred option. The name should appear without any "Microsoft-is-special" framing — present it as "the next-gen successor to Semantic Kernel and AutoGen" with its multi-provider credentials front and centre.

**Primary recommendation:** Make surgical edits to `citadel-mapping.mdx` (ASCII diagram label + framework list) and `overview.mdx` (builder toolchains pillar + framework table), leaving intelligence-layers.mdx and builder-personas.mdx unchanged unless a spot-check reveals missed references during plan execution.

---

## Current State Audit (Per Page)

### overview.mdx — Status: Minor gaps

**What is already correct:**
- Title is "Enterprise Agent Factory" — not "Microsoft Agent Factory"
- Intelligence layer names are generic: Workspace Intelligence, Business Data Intelligence, Enterprise Knowledge Intelligence
- Three Pillars table lists "LangChain, LangGraph" under Builder Toolchains
- No Work IQ, Fabric IQ, Foundry IQ, Copilot Studio, GitHub Copilot, Agent 365, or Forward Deployed Engineering

**What needs to change (FR-02):**
- The "Three Pillars" table cell for Builder Toolchains reads: _"Low-code platforms, open frameworks (LangChain, LangGraph), and SDK-based approaches"_ — it must also name **OpenAI Agents SDK** and **Microsoft Agent Framework** alongside Claude Agent SDK (which appears in the Builder Personas page but not here)
- No introductory description of Microsoft Agent Framework as a multi-provider option exists anywhere in the page — one sentence or a row in a table should establish it clearly so the planner can add it

**Microsoft-specific residual:** None found.

---

### intelligence-layers.mdx — Status: Compliant, no changes needed

**Assessment:** Fully generic. Intelligence layer names match FR-02 requirements exactly (Workspace Intelligence, Business Data Intelligence, Enterprise Knowledge Intelligence). All sources are listed generically (BI Platforms, CRM/ERP Systems, Data Warehouses, Internal Documentation, MCP-Connected Systems). No Microsoft product names appear.

**No changes required for FR-01 or FR-02.**

---

### builder-personas.mdx — Status: Compliant, verify during execution

**What is already correct:**
- All four scenarios use generic toolchain references: LangChain, LangGraph, Claude Agent SDK, MCP, APIM
- No Work IQ, Fabric IQ, Foundry IQ, or Copilot Studio
- Persona table lists "LangChain, LangGraph, Claude Agent SDK, OpenAI Agents SDK, custom frameworks" in the Developer row

**Potential enhancement (FR-02, discretionary):**
- The Developer persona toolchain cell in the overview table lists "OpenAI Agents SDK" but the scenario-specific tables do not. Microsoft Agent Framework could be added to one scenario as an example — but this is optional. Adding it only where it adds genuine narrative value (e.g., Scenario 1 Developer row) is preferable to forcing it everywhere.
- If the planner chooses to add Microsoft Agent Framework here, the Scenario 4 Developer toolchain (`LangGraph + Claude Agent SDK + code tools`) is the best candidate for a note like "+ Microsoft Agent Framework for enterprise session state".

**Microsoft-specific residual:** None confirmed.

---

### citadel-mapping.mdx — Status: Two targeted fixes required

**Fix 1 — ASCII diagram Layer 2 label (FR-01):**

Line 101 of the file contains this in the ASCII diagram:
```
│  │  │ AI Control │  │   Agent    │  │   Security     │  │
│  │  │   Plane    │  │  Identity  │  │   Fabric       │  │
│  │  │  (APIM)    │  │ (Foundry)  │  │ (Registry) │  │  (Defender+
```

The `(Foundry)` label in Layer 2's sub-cell is a Microsoft product reference. Replace with a generic label: `(Control Plane)` or `(Observability)`.

**Fix 2 — Framework-Based Agents section heading and toolchain list (FR-02):**

Section heading on line 68 reads:
```
### Framework-Based Agents (LangChain, LangGraph, Claude Agent SDK)
```

This list is incomplete. Must include **OpenAI Agents SDK** and **Microsoft Agent Framework**. Suggested replacement heading:
```
### Framework-Based Agents (LangChain, LangGraph, Claude Agent SDK, OpenAI Agents SDK, Microsoft Agent Framework)
```

The prose description below it only mentions "open frameworks" generically, which is fine — the heading is the only change needed.

**Fix 3 — Builder Toolchains strip in the architecture diagram (FR-02):**

Line 108 of the ASCII diagram footer reads:
```
│   Low-Code Builders  │  LangChain / LangGraph  │  Claude Agent SDK   │
```

Should be expanded to include all approved frameworks. Suggested:
```
│  Low-Code  │  LangChain / LangGraph  │  Claude Agent SDK  │  OpenAI Agents SDK  │  Microsoft Agent Framework  │
```

Note: The ASCII cell widths will need adjustment to fit — keep the diagram readable by abbreviating if necessary.

---

## Microsoft Agent Framework — Positioning Guide

This section is critical for the planner. The framework must be positioned correctly every time it appears.

### What it is

Microsoft Agent Framework (`pip install agent-framework`) is the next-generation successor to both Semantic Kernel and AutoGen. It uses a graph-based workflow model for multi-agent orchestration, provides enterprise-grade session-based state management, type safety, middleware, and telemetry, and supports MCP tool invocation natively.

### Why it is NOT Microsoft-specific branding

Its key differentiator — and the reason it belongs on this open-platform page — is multi-provider support. Supported LLM providers:
- Anthropic (Claude models)
- OpenAI
- Azure OpenAI
- Microsoft Foundry
- Ollama (local/self-hosted models)

Organizations using Claude, GPT-4o, or Llama-based models can all adopt it. It is a framework choice, not a vendor lock-in choice.

### How to introduce it in documentation

Use this framing template (adapt as needed):

> **Microsoft Agent Framework** (`pip install agent-framework`) — Graph-based orchestration with enterprise state management, MCP tool support, and multi-provider LLM backends (Anthropic, OpenAI, Azure OpenAI, Ollama). Next-gen successor to Semantic Kernel and AutoGen.

Do NOT use framing like:
- "Microsoft's framework" (implies vendor-specific)
- Leading with "Microsoft" before the technical description
- Placing it as a highlighted or recommended option above others

Place it last or in alphabetical order within framework lists to avoid appearing as a preferred Microsoft option.

### Approved placement in documentation

| Page | Where | Format |
|------|-------|--------|
| overview.mdx | Three Pillars table, Builder Toolchains cell | Add to comma-separated framework list |
| citadel-mapping.mdx | Framework-Based Agents heading + ASCII diagram footer | Add to heading parenthetical + diagram strip |
| builder-personas.mdx | Developer persona overview table (already has it) | No change needed |

---

## Replacement Terminology Map

| Microsoft-Specific Term | Generic Replacement | Notes |
|------------------------|---------------------|-------|
| Work IQ | Workspace Intelligence | Already applied in all pages |
| Fabric IQ | Business Data Intelligence | Already applied in all pages |
| Foundry IQ | Enterprise Knowledge Intelligence | Already applied in all pages |
| Copilot Studio | Low-code agent builder (generic) | Already applied |
| GitHub Copilot | Coding agent / code generation agent | N/A — not present in target pages |
| Microsoft Agent Factory | Enterprise Agent Factory | Already applied |
| Microsoft Foundry (in Layer 2 label) | Control Plane / AI observability layer | Fix needed in citadel-mapping.mdx ASCII diagram |
| Agent 365 | Agent Identity registry | Not found in pages — already cleaned |
| Forward Deployed Engineering | (remove entirely) | Not found in pages — already cleaned |
| Semantic Kernel | Microsoft Agent Framework (successor) | Not present as a standalone reference |
| AutoGen | Microsoft Agent Framework (successor) | Not present as a standalone reference |

---

## Standard Stack

### Core

| Tool | Version | Purpose | Why Standard |
|------|---------|---------|--------------|
| Mintlify MDX | Current project | Documentation authoring | All agent-factory pages use `.mdx` + Mintlify components |
| `docs.json` | n/a | Navigation registration | Every page must appear in the Agent Factory group |

### Supporting

| Component | Purpose | When to Use |
|-----------|---------|-------------|
| `<CardGroup>` / `<Card>` | Next-step navigation | Every agent-factory page ends with CardGroup (established pattern) |
| ASCII diagrams | Architecture visuals | Established convention — no external diagram tools |
| Markdown tables | Framework comparisons | Used throughout all four pages |
| `<Note>` / `<Warning>` | Callouts | Use sparingly for positioning guidance |

**Installation:** No new packages. Pure documentation phase.

---

## Architecture Patterns

### Approved Framework Canonical Order

When listing frameworks in tables, headings, or diagrams, use this consistent order:

```
LangChain / LangGraph | Claude Agent SDK | OpenAI Agents SDK | Microsoft Agent Framework | Low-Code Builders
```

Rationale: Alphabetical-ish order with Microsoft Agent Framework last avoids any perception of preferred vendor. Low-code always follows code-first frameworks.

### Pattern: Framework Mention in Prose

```mdx
Framework-based developers can build with **LangChain/LangGraph**, the **Claude Agent SDK** 
(Anthropic), the **OpenAI Agents SDK**, or the **Microsoft Agent Framework** 
(`pip install agent-framework`) — which provides graph-based orchestration with built-in 
MCP support and multi-provider LLM backends including Anthropic, OpenAI, and Ollama.
```

### Pattern: Framework Row in Table

```mdx
| **Microsoft Agent Framework** | Graph-based workflows, enterprise session state, MCP tools, multi-provider (Anthropic/OpenAI/Ollama) | `pip install agent-framework` |
```

### Anti-Patterns to Avoid

- **Microsoft-first ordering:** Never list Microsoft Agent Framework before LangChain or Claude Agent SDK
- **Vendor framing:** Never say "Microsoft's framework" — say "the Microsoft Agent Framework"
- **Omission:** Never list frameworks without including all four (LangChain/LangGraph, Claude Agent SDK, OpenAI Agents SDK, Microsoft Agent Framework)
- **Duplication of Foundry label:** The `(Foundry)` label in ASCII diagrams must be replaced — Foundry is an Azure product, not a generic control plane

---

## Don't Hand-Roll

| Problem | Don't Build | Use Instead | Why |
|---------|-------------|-------------|-----|
| Framework comparison prose | Custom marketing copy | The canonical framework descriptions in this RESEARCH.md | Consistent positioning, no accidental vendor bias |
| New ASCII diagram for citadel-mapping | Fresh diagram | Edit the existing diagram in-place (surgical change to Layer 2 label only) | Minimise regression risk; diagram is otherwise correct |

---

## Common Pitfalls

### Pitfall 1: Over-editing compliant pages

**What goes wrong:** The planner creates tasks to rewrite intelligence-layers.mdx and builder-personas.mdx when they are already FR-01/FR-02 compliant.
**Why it happens:** The requirements list all four pages as targets, so the planner assumes all four need substantive changes.
**How to avoid:** Tasks for intelligence-layers.mdx and builder-personas.mdx should be READ-ONLY audits with a conditional: "if a Microsoft-specific reference is found, fix it; otherwise mark as compliant and move on."
**Warning signs:** A plan task that says "rewrite intelligence layers page" or "update builder persona toolchains" without referencing a specific residual reference.

### Pitfall 2: Positioning Microsoft Agent Framework as Microsoft branding

**What goes wrong:** A writer sees "Microsoft" in the name and buries it, apologizes for it, or adds disclaimers that undermine it.
**Why it happens:** The context of "removing Microsoft branding" creates a reflex to treat anything Microsoft-labeled as suspect.
**How to avoid:** Lead with technical capabilities (multi-provider, graph-based, MCP support) before the name. The multi-provider credential is its inclusion justification — state it immediately.

### Pitfall 3: Inconsistent framework lists across pages

**What goes wrong:** overview.mdx lists 3 frameworks, citadel-mapping.mdx lists 4, builder-personas.mdx lists 5 — creating reader confusion.
**Why it happens:** Each page is edited independently without a canonical list.
**How to avoid:** The planner should reference the canonical order in this RESEARCH.md for every framework list edit. The same four framework names must appear in the same order on every page they are listed.

### Pitfall 4: Breaking the ASCII diagram while fixing it

**What goes wrong:** Editing the `(Foundry)` label in the citadel-mapping.mdx ASCII diagram shifts column widths and breaks alignment.
**Why it happens:** ASCII diagrams use fixed-width characters; any text change requires adjusting padding.
**How to avoid:** Replace `(Foundry)` with `(Observ.)` or `(Plane)` — same character count — to avoid width changes. If a longer label is needed, adjust the full diagram column width consistently.

---

## Code Examples

### Verified: Current Framework Heading in citadel-mapping.mdx (line 68)

```mdx
### Framework-Based Agents (LangChain, LangGraph, Claude Agent SDK)
```

Replace with:

```mdx
### Framework-Based Agents (LangChain, LangGraph, Claude Agent SDK, OpenAI Agents SDK, Microsoft Agent Framework)
```

### Verified: ASCII Diagram Layer 2 Sub-label (citadel-mapping.mdx, inside the diagram block)

Current:
```
│  │  │ (APIM)    │  │ (Foundry)  │  │ (Registry) │  │  Purview+Entra)│  │
```

Replace `(Foundry)` with `(Observ.)` to preserve column width:
```
│  │  │ (APIM)    │  │ (Observ.)  │  │ (Registry) │  │  Purview+Entra)│  │
```

### Verified: ASCII Diagram Builder Toolchains Strip (citadel-mapping.mdx, bottom of diagram)

Current:
```
│   Low-Code Builders  │  LangChain / LangGraph  │  Claude Agent SDK   │
```

Replace with (adjust width to fit):
```
│  Low-Code  │  LangChain/LangGraph  │  Claude Agent SDK  │  OpenAI Agents SDK  │  MS Agent Framework  │
```

### Verified: Three Pillars Table Cell in overview.mdx

Current Builder Toolchains cell:
```
Low-code platforms, open frameworks (LangChain, LangGraph), and SDK-based approaches match the right tool to every builder persona
```

Replace with:
```
Low-code platforms, open frameworks (LangChain, LangGraph, Claude Agent SDK, OpenAI Agents SDK, Microsoft Agent Framework), and SDK-based approaches match the right tool to every builder persona
```

---

## Validation Architecture

> `workflow.nyquist_validation` is not set in `.planning/config.json` — treating as enabled.

### Test Framework

This phase produces only Mintlify MDX documentation. There is no executable code to unit test. Validation is structural and content-based.

| Property | Value |
|----------|-------|
| Framework | Manual content audit + Mintlify build (if available) |
| Config file | `docs/docs.json` |
| Quick run command | `grep -r "Work IQ\|Fabric IQ\|Foundry IQ\|Copilot Studio\|Forward Deployed Engineering" docs/agent-factory/` |
| Full suite command | `grep -r "Microsoft Agent Factory\|Work IQ\|Fabric IQ\|Foundry IQ\|Agent 365" docs/agent-factory/overview.mdx docs/agent-factory/intelligence-layers.mdx docs/agent-factory/builder-personas.mdx docs/agent-factory/citadel-mapping.mdx` |

### Phase Requirements → Test Map

| Req ID | Behavior | Test Type | Automated Command | File Exists? |
|--------|----------|-----------|-------------------|-------------|
| FR-01 | No Microsoft product brand names in target pages | Content grep | `grep -rn "Work IQ\|Fabric IQ\|Foundry IQ\|Copilot Studio\|Agent 365" docs/agent-factory/overview.mdx docs/agent-factory/intelligence-layers.mdx docs/agent-factory/builder-personas.mdx docs/agent-factory/citadel-mapping.mdx` (should return zero results) | ✅ Files exist |
| FR-01 | No `(Foundry)` label in ASCII diagrams | Content grep | `grep -n "(Foundry)" docs/agent-factory/citadel-mapping.mdx` (should return zero results) | ✅ File exists |
| FR-02 | Microsoft Agent Framework present in framework lists | Content grep | `grep -n "agent-framework\|Microsoft Agent Framework" docs/agent-factory/overview.mdx docs/agent-factory/citadel-mapping.mdx` (should return at least 1 result per file) | ✅ Files exist |
| FR-02 | OpenAI Agents SDK present in framework lists | Content grep | `grep -n "OpenAI Agents SDK" docs/agent-factory/overview.mdx docs/agent-factory/citadel-mapping.mdx` (should return at least 1 result per file) | ✅ Files exist |
| FR-02 | Intelligence layer names are generic | Content grep | `grep -n "Workspace Intelligence\|Business Data Intelligence\|Enterprise Knowledge Intelligence" docs/agent-factory/intelligence-layers.mdx` (should return multiple results) | ✅ File exists |

### Sampling Rate

- **Per task commit:** Run the FR-01 grep (zero-result check) on the file just edited
- **Per wave merge:** Run the full FR-01 and FR-02 grep suite above
- **Phase gate:** All greps pass before `/gsd:verify-work`

### Wave 0 Gaps

None — existing test infrastructure (file structure, grep commands) covers all phase requirements. No new test files needed.

---

## Sources

### Primary (HIGH confidence)

- Direct file reads of all four target pages (2026-04-13) — content audit performed at line level
- `.planning/REQUIREMENTS.md` — canonical FR-01 and FR-02 definitions
- `.planning/ROADMAP.md` — Phase 13 goals, framework list, Microsoft Agent Framework description

### Secondary (MEDIUM confidence)

- Microsoft Agent Framework docs URL (`https://learn.microsoft.com/agent-framework/overview/`) provided in ROADMAP.md — not fetched during research (URL provided by project owner as authoritative reference)

### Tertiary (LOW confidence)

- None — all findings are from direct project file reads or project-owner-provided specifications

---

## Open Questions

1. **Mintlify build verification**
   - What we know: Project uses Mintlify; all pages render as MDX
   - What's unclear: Whether a local Mintlify build command is available to verify rendering after edits
   - Recommendation: Use grep-based validation as the primary gate; if `npx mintlify dev` is available, run it as a smoke test after plan execution

2. **Microsoft Agent Framework docs URL reachability**
   - What we know: URL provided in ROADMAP.md is `https://learn.microsoft.com/agent-framework/overview/`
   - What's unclear: Whether this is a live, public URL or an internal/staged reference
   - Recommendation: Do not link to this URL in the MDX pages until verified live. Use `pip install agent-framework` as the technical reference instead.

---

## Metadata

**Confidence breakdown:**
- Current state audit: HIGH — pages read at line level; residuals identified precisely
- Microsoft Agent Framework positioning: HIGH — specifications provided directly by project owner in ROADMAP.md
- Replacement terminology: HIGH — FR-01 and FR-02 definitions are explicit and unambiguous
- Pitfall identification: HIGH — derived from direct file analysis

**Research date:** 2026-04-13
**Valid until:** 2026-05-13 (stable content domain — 30-day window)
