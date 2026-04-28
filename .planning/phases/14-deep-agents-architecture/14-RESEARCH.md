# Phase 14: Deep Agents Architecture - Research

**Researched:** 2026-04-13
**Domain:** Mintlify MDX documentation — agent harness engineering, context engineering, deep agent architecture
**Confidence:** HIGH

## Summary

Phase 14 requires two new documentation pages: **Agent Harness & Tools** and **Context Engineering**. The primary finding is that both pages already exist as complete, substantive MDX files and are already wired into `docs/docs.json` navigation in the correct order specified by FR-05. This was created in prior session work visible in the filesystem.

The two source PDFs — Rick Hightower's LangChain Deep Agents article (Mar 2026, Spillwave Solutions) and Jubin Soni's Azure AI Foundry Agent Service deep dive (Mar 2026, Medium) — provide the definitive source material. The existing pages faithfully implement concepts from those sources and satisfy all FR-03 requirements on inspection.

The planning task for Phase 14 is therefore: verify the existing pages against FR-03 requirements line by line, identify any gaps, and close them. If no gaps exist, document that Phase 14 is functionally complete and confirm docs.json wiring is correct.

**Primary recommendation:** Audit the two existing pages against FR-03 and the source PDFs. Fill any gaps. Confirm docs.json ordering. Phase is likely already complete.

<phase_requirements>
## Phase Requirements

| ID | Description | Research Support |
|----|-------------|-----------------|
| FR-03 | New page: Agent Harness & Tools — harness engineering, tool-gated execution, middleware chain, HITL hooks, 4-layer security model, sandbox providers | `docs/agent-factory/agent-harness.mdx` exists — covers all listed topics. Verify completeness. |
| FR-03 | New page: Context Engineering — filesystem working memory, progressive skill disclosure (3-tier loading), automatic summarization, skills vs memory distinction, three-layer agent architecture | `docs/agent-factory/context-engineering.mdx` exists — covers all listed topics. Verify completeness. |
</phase_requirements>

## Standard Stack

### Core
| Component | Version | Purpose | Why Standard |
|-----------|---------|---------|--------------|
| Mintlify MDX | Current | Documentation format | Established project standard for all pages |
| Frontmatter | YAML | Page metadata (title, description, icon) | Required by Mintlify rendering |
| ASCII art diagrams | — | Architecture visualization | Established project convention (decision log 03-01) |
| CardGroup / Card | Mintlify components | Next-step navigation | Established pattern across all agent factory pages |
| Warning / Note | Mintlify components | Important callouts | Used in agent-harness and agent-security-blueprint |

### Supporting
| Component | Version | Purpose | When to Use |
|-----------|---------|---------|-------------|
| Steps | Mintlify | Sequential process flows | agent-security-blueprint uses this; context-engineering and agent-harness do not require it |
| Tables (markdown) | — | Comparison grids | Used throughout for Citadel mapping, skill vs memory, sandbox comparison |
| Code blocks (yaml, python) | — | Skill file examples | context-engineering shows SKILL.md YAML frontmatter |

## Architecture Patterns

### Recommended Document Structure

Both pages follow this established pattern:

```
docs/agent-factory/
├── agent-harness.mdx       # Already exists
└── context-engineering.mdx # Already exists
```

The pages are placed in `docs/docs.json` at:
```
"agent-factory/context-engineering"   (position 9 of 14 in Agent Factory group)
"agent-factory/agent-harness"         (position 10 of 14 in Agent Factory group)
```

This matches the ordering specified in FR-05.

### Pattern 1: Page Anatomy

Every agent factory page follows:
1. YAML frontmatter (`title`, `description`, `icon`)
2. H1 heading repeating the title
3. Opening philosophical statement (1-2 sentences of framing)
4. Optional `<Warning>` or `<Note>` for security/preview callouts
5. Content sections with H2 headings
6. ASCII diagram(s) for architecture visualization
7. Markdown tables for comparisons
8. **Citadel Integration** section mapping to the 4 layers (REQUIRED)
9. Next Steps `<CardGroup>` with 3-4 cards linking to related pages

### Pattern 2: Citadel Layer Mapping Table

All agent factory pages include a table or diagram mapping each concept to its governing Citadel layer:

```
| [Page concept] | [Citadel Layer] | [Integration] |
```

Agent-harness maps:
- Tool gateway → Layer 1 (Governance Hub) via APIM
- HITL middleware & audit trails → Layer 2 (AI Control Plane)
- Agent identity for tool access → Layer 3 (Agent Identity)
- Sandbox isolation & PII filtering → Layer 4 (Security Fabric)

Context-engineering maps:
- Working memory storage → Layer 4 (Security Fabric) for data governance
- Execution traces, skill loading → Layer 2 (AI Control Plane) for observability

### Pattern 3: ASCII Diagram Style

Project convention: box-drawing chars, arrows (`→`, `↓`, `▼`), consistent column width.
Examples from existing pages:
```
┌──────────────────────────────────────────────────────┐
│  Layer 1: Path Validation                             │
│  Block .. traversal · Enforce allowed prefixes        │
└──────────────────────┬───────────────────────────────┘
                       ↓
```

### Anti-Patterns to Avoid

- **Microsoft-specific framing in new pages:** FR-02 requires open-platform framing. The existing agent-harness and context-engineering pages reference LangChain Deep Agents / deepagents framework patterns — check that no pages reference Microsoft-only products without providing framework-agnostic equivalents.
- **Missing Citadel integration section:** Every page must have one. Both existing pages have it — verify it is substantive (not placeholder).
- **Vague next-step cards:** Cards must link to real pages that exist in navigation. Both pages have valid hrefs; confirm all are live.
- **Icons not matching Mintlify icon set:** agent-harness uses `shield-check`, context-engineering uses `brain-circuit` — both are valid Lucide icons supported by Mintlify.

## Don't Hand-Roll

| Problem | Don't Build | Use Instead | Why |
|---------|-------------|-------------|-----|
| Tabular comparisons | Custom HTML tables | Markdown pipe tables | Mintlify renders them natively |
| Multi-step flows | Custom components | Mintlify `<Steps>` | Already used in agent-security-blueprint |
| Code syntax highlighting | Manual formatting | Fenced code blocks with language hint | Mintlify handles automatically |
| Page-to-page navigation | Inline links | `<CardGroup><Card>` pattern | Established project convention |

## Common Pitfalls

### Pitfall 1: Duplicate page creation
**What goes wrong:** Planner creates `agent-harness.mdx` or `context-engineering.mdx` not knowing they already exist, causing an overwrite of working content.
**Why it happens:** anatomy.md shows these files but a fresh plan might treat them as stubs.
**How to avoid:** READ both files first before writing. They are substantive (2,500+ tokens each per anatomy.md). Only modify if gaps found against FR-03 checklist.
**Warning signs:** Any task description saying "create" these files rather than "verify and update."

### Pitfall 2: docs.json already wired — don't duplicate entries
**What goes wrong:** Adding duplicate navigation entries for `agent-factory/context-engineering` and `agent-factory/agent-harness` to docs.json.
**Why it happens:** Assuming Phase 14 navigation work hasn't been done.
**How to avoid:** Inspect docs.json first (lines 98-114). Both pages are already at positions 9 and 10 in the Agent Factory navigation group, matching FR-05 ordering exactly.
**Warning signs:** Any task that adds navigation entries without first reading docs.json.

### Pitfall 3: FR-03 gap in three-layer agent architecture
**What goes wrong:** The FR-03 requirement lists "three-layer agent architecture" as content needed. This is covered in `overview.mdx` (the Reasoning / Context / Execution layer diagram) but may only be referenced, not fully explained, in the new pages.
**Why it happens:** Content is split across pages for DRY reasons.
**How to avoid:** Verify context-engineering.mdx references or includes the three-layer architecture. A cross-link is sufficient; duplication is not required.

### Pitfall 4: Content sourced from PDFs contains LangChain-specific API references
**What goes wrong:** Source PDF uses `deepagents`, `FilesystemBackend`, `HumanInTheLoopMiddleware` as concrete API names. These are LangChain Deep Agents framework-specific. Including them verbatim conflicts with the open-platform framing goal of v1.2.
**Why it happens:** Source material is framework-specific even though concepts are generic.
**How to avoid:** Existing pages handle this correctly — they reference the patterns (e.g., `wrap_tool_call` hook) conceptually, with code examples that are illustrative rather than prescriptive to a single framework. Preserve this abstraction.
**Warning signs:** Any code example block that imports `from deepagents import` without a note that this is one implementation approach.

### Pitfall 5: Missing skills vs memory distinction
**What goes wrong:** FR-03 explicitly calls out "skills vs memory distinction." This must be present in context-engineering.mdx.
**Why it happens:** Easy to cover skills thoroughly but omit the explicit memory contrast.
**How to avoid:** Verify that context-engineering.mdx contains a "Skills vs Memory" table or section. It does (confirmed in read). If missing in any future edit, re-add from source PDF (page 11 of LangChain PDF).

## Source Material: PDF Content Map

### LangChain Deep Agents PDF (Rick Hightower, Mar 18, 2026)
Source URL: `https://pub.spillwave.com/langchain-deep-agents-harness-and-context-engineering-memory-skills-and-security-a68737d84940`

| Topic | PDF Coverage | Mapped to Page |
|-------|-------------|----------------|
| Filesystem working memory / cognitive offloading | Pages 2-5 | context-engineering.mdx |
| Deliberate offloading, automatic summarization, result eviction | Pages 3-4 | context-engineering.mdx |
| SummarizationMiddleware (80K char threshold) | Page 4 | context-engineering.mdx |
| Agent Skill SKILL.md structure (YAML frontmatter + body) | Pages 6-7 | context-engineering.mdx |
| Three-tier loading (frontmatter → full SKILL.md → reference files) | Pages 7-10 | context-engineering.mdx |
| Skills vs Memory (MemoryMiddleware vs skills) | Page 11 | context-engineering.mdx |
| "Trust the LLM, enforce at tool layer" philosophy | Page 12 | agent-harness.mdx |
| 4-layer security model (path validation, HITL, execution isolation, remote sandbox) | Pages 12-16 | agent-harness.mdx |
| HITL middleware: wrap_tool_call hook, per-session allow-lists, auto-approval learning | Pages 14-15 | agent-harness.mdx |
| Sandbox providers: Modal (gVisor), Daytona (lifecycle), Runloop (ephemeral) | Pages 15-17 | agent-harness.mdx |
| Sandbox as Tool vs Agent in Sandbox pattern | Pages 17-18 | agent-harness.mdx |
| Network egress controls | Page 19 | agent-harness.mdx |
| Context Engineering discipline definition | Pages 19-20 | context-engineering.mdx |

### Azure AI Foundry Agent Service PDF (Jubin Soni, Mar 20, 2026)
Source URL: `https://jubinsoni.medium.com/architecting-autonomous-agents-a-deep-dive-into-azure-ai-foundry-agent-service-9c1d916a5b05`

| Topic | PDF Coverage | Mapped to Page |
|-------|-------------|----------------|
| Agent/Thread/Run/Tools stateful architecture | Pages 2-3 | Conceptual overlap with overview.mdx three-layer model |
| Code Interpreter (sandboxed execution), File Search (managed RAG), Function Calling | Pages 3-4 | Informs sandbox and tool concepts in agent-harness.mdx |
| requires_action HITL pattern | Page 6 | agent-harness.mdx HITL section |
| Managed vs Manual architecture comparison | Page 4 | overview.mdx context, not new page content |
| Three design patterns: Single Task Specialist, Router/Orchestrator, HITL | Page 8 | design-patterns.mdx (pre-existing) |
| Thread truncation / context windowing | Page 8 | context-engineering.mdx (managed summarization) |
| Security: RBAC, Managed Identity | Page 7 | agent-security-blueprint.mdx (pre-existing) |

## FR-03 Verification Checklist

Run through this before declaring Phase 14 complete:

### agent-harness.mdx
- [x] Harness engineering concept defined
- [x] Tool-gated execution: "model never executes anything directly" principle
- [x] Middleware chain: path validation → HITL → execution isolation → sandbox
- [x] HITL hooks: wrap_tool_call, per-session allow-lists, auto-approval learning
- [x] 4-layer security model with ASCII diagram
- [x] Sandbox providers: Modal, Daytona, Runloop with comparison table
- [x] Sandbox as Tool pattern (recommended) vs Agent in Sandbox (risky)
- [x] Citadel integration section mapping all 4 layers
- [x] Network egress controls
- [x] Next Steps CardGroup with valid links

### context-engineering.mdx
- [x] Context engineering discipline defined
- [x] Three-tier memory hierarchy (Immediate Context / Working Memory / Archived History + Skills)
- [x] Filesystem-backed working memory: deliberate offloading, automatic summarization, result eviction
- [x] Progressive skill disclosure: SKILL.md structure with YAML frontmatter
- [x] Three-tier loading diagram and explanation
- [x] Skills vs Memory distinction (table)
- [x] Automatic context compression
- [x] Context Engineering vs Harness Engineering relationship
- [x] Citadel integration section
- [x] Next Steps CardGroup with valid links

### docs.json navigation
- [x] context-engineering at position 9 in Agent Factory group
- [x] agent-harness at position 10 in Agent Factory group
- [x] Ordering matches FR-05 specification exactly

## Architecture: What the Planner Must Produce

Given both deliverable files already exist, the plan for Phase 14-01 should be:

**Task 1: Verify agent-harness.mdx against FR-03**
Read the file. Check each FR-03 bullet. Note any gaps. If gap found, add the missing content.

**Task 2: Verify context-engineering.mdx against FR-03**
Read the file. Check each FR-03 bullet. Note any gaps. If gap found, add the missing content.

**Task 3: Verify docs.json navigation ordering**
Confirm context-engineering is at the correct position and agent-harness follows it. Confirm no duplicate entries. No changes expected.

**Task 4: Verify cross-links are valid**
Both pages link to each other, to agent-security-blueprint, mcp-integration, citadel-mapping, design-patterns, and agent-observability. All these pages exist. Confirm hrefs resolve.

If all verification passes with no gaps found, the task set documents that Phase 14 deliverables were already shipped and the phase is complete.

## Code Examples

### SKILL.md structure (from LangChain PDF, for context-engineering content)

```yaml
---
name: api-documentation
description: >
  Procedures for generating and updating API documentation.
  Covers OpenAPI spec generation, changelog formatting,
  and publishing to the developer portal.
license: MIT
allowed-tools:
  - read_file
  - write_file
---

# API Documentation Procedures
[detailed workflow instructions]
```

### Citadel Integration Table Pattern (from agent-harness.mdx)

```markdown
| Harness Layer | Citadel Layer | Integration |
|---------------|---------------|-------------|
| Tool gateway (all tool calls) | Layer 1 (Governance Hub) | APIM enforces auth, rate limiting, policy |
| HITL middleware & audit trails | Layer 2 (AI Control Plane) | Execution traces for observability |
| Agent identity for tool access | Layer 3 (Agent Identity) | Tool access scoped to agent permissions |
| Sandbox isolation & PII filtering | Layer 4 (Security Fabric) | Content safety on tool outputs |
```

## State of the Art

| Old Approach | Current Approach | When Changed | Impact |
|--------------|------------------|--------------|--------|
| Static system prompts with all instructions | Progressive skill disclosure — load only relevant skills on demand | 2025-2026 (Deep Agents era) | Reduces token overhead from thousands to hundreds at startup |
| ReAct loop with 20-30 tool call limit | Filesystem-backed working memory with continuous offloading | 2025-2026 | Enables hundreds of tool calls in a single session |
| Agent runs inside sandbox (credentials exposed) | Sandbox as Tool pattern (credentials stay on host) | 2025-2026 | Eliminates credential exfiltration attack surface |
| Model-level prompt injection prevention | Tool-layer enforcement ("trust the LLM, enforce at tool layer") | OWASP 2025 report (73% injection rate confirmed) | Pragmatic: you constrain damage rather than prevent the impossible |

## Open Questions

1. **LangChain vs generic framing in code examples**
   - What we know: The source PDFs use `deepagents` (LangChain-specific) Python API. The existing pages abstract this to conceptual descriptions with illustrative code.
   - What's unclear: Whether the v1.2 open-platform goal requires removing the remaining framework-specific code snippet in context-engineering.mdx (the `create_deep_agent` YAML example).
   - Recommendation: The existing abstraction level is correct — code examples are labeled as illustrative patterns, not prescriptive SDKs. No change needed unless FR-02 review in Phase 13 determines otherwise.

2. **Three-layer agent architecture coverage**
   - What we know: FR-03 lists "three-layer agent architecture" as content. This is fully covered in overview.mdx (Reasoning / Context / Execution diagram). context-engineering.mdx references it via "Context Engineering vs Harness Engineering" table without redrawing the full diagram.
   - What's unclear: Whether FR-03 requires the three-layer diagram to appear in one of the two new pages, not just overview.mdx.
   - Recommendation: overview.mdx is the correct home for the diagram. A cross-reference in context-engineering.mdx is sufficient. No gap.

## Validation Architecture

No automated test infrastructure applies to this phase. This is a documentation-only phase producing Mintlify MDX files. Validation is manual:

### Phase Requirements to Test Map
| Req ID | Behavior | Test Type | Automated Command | File Exists? |
|--------|----------|-----------|-------------------|-------------|
| FR-03 | agent-harness.mdx exists with all required sections | Manual review | N/A | Yes |
| FR-03 | context-engineering.mdx exists with all required sections | Manual review | N/A | Yes |
| FR-05 | docs.json contains both pages in correct order | Manual review | N/A | Yes |

### Sampling: Build Verification
The only automatable check for a Mintlify docs project is that `mintlify dev` starts without errors. This is the implicit gate before marking Phase 14 complete.

## Sources

### Primary (HIGH confidence)
- Direct file read: `/home/khenzo/projects/ai-hub-gateway/docs/agent-factory/agent-harness.mdx` — full page content verified
- Direct file read: `/home/khenzo/projects/ai-hub-gateway/docs/agent-factory/context-engineering.mdx` — full page content verified
- Direct file read: `/home/khenzo/projects/ai-hub-gateway/docs/docs.json` — navigation structure verified
- PDF read: `LangChain Deep Agents_ Harness and Context Engineering...pdf` (Rick Hightower, Mar 18, 2026) — pages 1-20 read, full source material
- PDF read: `Architecting Autonomous Agents_ A Deep Dive into Azure AI Foundry Agent Service...pdf` (Jubin Soni, Mar 20, 2026) — pages 1-10 read, full article

### Secondary (MEDIUM confidence)
- OWASP 2025 Top 10 for LLM Applications: prompt injection as #1 vulnerability, 73% of deployments — cited in LangChain PDF, cross-validates agent-harness.mdx Warning callout
- Trail of Bits October 2025: documented prompt-injection-to-RCE chain in production AI coding tool — cited in LangChain PDF

## Metadata

**Confidence breakdown:**
- Source material content: HIGH — PDFs read directly, pages read directly
- Existing page completeness: HIGH — both pages verified as substantive (~2,500 tokens each)
- docs.json navigation: HIGH — read directly, both pages confirmed wired correctly
- FR-03 gap assessment: MEDIUM — based on reading, no gaps found, but planner should do final line-by-line verification

**Research date:** 2026-04-13
**Valid until:** Stable — this is documentation content, not a rapidly-changing library. Valid indefinitely unless requirements change.
