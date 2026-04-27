# Phase 12: Agent Security & Observability - Research

**Researched:** 2026-04-13
**Domain:** Agent security blueprint, observability best practices, Mintlify MDX documentation
**Confidence:** HIGH

---

## Summary

Phase 12 closes the v1.1 AI Agent Factory Integration milestone by documenting two topics from the Agent Factory blog series that have not yet been integrated into the Citadel documentation: the security blueprint for safe agents (Plan 12-01) and the top-5 observability best practices (Plan 12-02). Both source documents are already downloaded to `docs/agent-factory/` and are the canonical reference for this phase.

The work is purely documentation. No code changes, no Bicep, no infrastructure. The deliverables are two new `.mdx` files placed in `docs/agent-factory/` (continuing the established Phase 7–11 pattern), with a `docs.json` navigation update that appends the pages to the existing Agent Factory group — after `a2a-integration` and before the use-case pages, or at the end of the conceptual block before use cases.

The existing governance section (`docs/governance/`) already covers enterprise-level security for AI workloads (identity, access contracts, content safety, PII, compliance). Plan 12-01 must NOT duplicate that content; instead it should synthesise the *agent-specific* security additions: Entra Agent ID, cross-prompt injection classifiers, the 6-step blueprint in action, and the Citadel layer-by-layer mapping. Plan 12-02 must NOT duplicate `docs/operations/monitoring.mdx` (which is currently a stub/placeholder); instead it should expand the five best-practice pillars and map them onto Citadel tooling, creating an operational runbook-style companion for agents.

**Primary recommendation:** Create `docs/agent-factory/agent-security-blueprint.mdx` and `docs/agent-factory/agent-observability.mdx`, wiring both into the Agent Factory navigation group in `docs.json`, and cross-link to existing governance/operations pages to avoid duplication.

---

## Standard Stack

### Core

| Library / Tool | Version | Purpose | Why Standard |
|----------------|---------|---------|--------------|
| Mintlify MDX | Current project version | Documentation authoring | All docs in this project use `.mdx` + Mintlify components |
| `docs.json` navigation | n/a | Controls rendered nav | Every phase updates this file to surface new pages |

### Supporting

| Component | Purpose | When to Use |
|-----------|---------|-------------|
| Mintlify `<CardGroup>` / `<Card>` | Next-step navigation at page bottom | Every agent-factory page ends with a CardGroup |
| Mintlify `<Steps>` | Numbered sequential guidance | Used for blueprint-in-action sequences |
| Mintlify `<Note>` / `<Warning>` | Callouts for important guidance | Used where best practices need emphasis |
| ASCII diagrams | Architecture visuals | Established project convention; no external diagram tools |

### Installation

No new package installs needed. This is a pure documentation phase.

---

## Architecture Patterns

### Recommended New File Locations

```
docs/
└── agent-factory/
    ├── overview.mdx
    ├── intelligence-layers.mdx
    ├── builder-personas.mdx
    ├── citadel-mapping.mdx
    ├── agentic-web-stack.mdx
    ├── agentic-stack-diagrams.mdx
    ├── design-patterns.mdx
    ├── orchestration-patterns.mdx
    ├── mcp-integration.mdx
    ├── a2a-integration.mdx
    ├── agent-security-blueprint.mdx    ← NEW (Plan 12-01)
    ├── agent-observability.mdx          ← NEW (Plan 12-02)
    ├── use-case-employee-self-service.mdx
    ├── use-case-data-analytics.mdx
    ├── use-case-sales-engagement.mdx
    └── use-case-customer-support.mdx
```

### docs.json Navigation Placement

The Agent Factory group in `docs.json` currently ends at (lines 104–117):
```json
"docs/agent-factory/a2a-integration",
"docs/agent-factory/use-case-employee-self-service",
...
```

The two new pages belong in the conceptual block, after `a2a-integration` and before the use-case pages:
```json
"docs/agent-factory/agent-security-blueprint",
"docs/agent-factory/agent-observability",
```

### Pattern 1: Agent Security Blueprint Page (12-01)

**What:** Synthesise the 6-step blueprint from the source doc into structured Citadel-aware guidance.
**When to use:** Use this structure for every security-concept page in Agent Factory.

Page structure:
1. Title + description frontmatter
2. Intro paragraph linking trust to Citadel governance
3. "Why Now" callout (CISOs/security teams/developers shift-left)
4. "Five Qualities of Safe Agents" table or list (identity, data protection, built-in controls, evaluations, continuous oversight)
5. "How Citadel Supports Each Quality" — one sub-section per quality, mapping to Citadel layers
6. "Blueprint in Action" — `<Steps>` component for the 6-step sequence
7. "Citadel Layer Mapping" — ASCII diagram showing which Citadel layer implements each blueprint element
8. "Customer Proof Points" — EY + Accenture quotes from source doc (contextualise for enterprise readers)
9. CardGroup next steps → `agent-observability`, `governance-overview`, `identity-management`, `layer-4-security-fabric`

**Key content from source doc to document:**
- Entra Agent ID (coming soon/preview status should be noted)
- Cross-prompt injection classifier (tool responses, email triggers, untrusted sources)
- Prompt Shields, harm/risk filters, groundedness checks, protected material detection
- Azure AI Red Teaming Agent + PyRIT toolkit for adversarial testing
- Bring-your-own Azure resources for data control (file storage, search, conversation history)
- Network isolation with private VNet and subnet delegation
- Microsoft Purview sensitivity labels + DLP in agent outputs
- Microsoft Defender XDR telemetry integration
- Governance collaborators: Credo AI, Saidot (EU AI Act, NIST AI RMF mapping)

### Pattern 2: Agent Observability Page (12-02)

**What:** Document the 5 best practices as actionable Citadel-mapped guidance.
**When to use:** Use this structure for any observability/operations content in Agent Factory.

Page structure:
1. Title + description frontmatter
2. Intro: "seeing is knowing" — why observability is distinct for agents vs traditional software
3. "Traditional vs Agent Observability" comparison table (metrics/logs/traces vs + evaluations + governance)
4. "Azure AI Foundry Observability" platform summary
5. "Five Best Practices" — use `<Steps>` with detailed sub-content for each:
   - BP1: Model selection via benchmark-driven leaderboards
   - BP2: Continuous evaluation in dev and production (4 built-in evaluators: Intent Resolution, Task Adherence, Tool Call Accuracy, Response Completeness)
   - BP3: CI/CD integration (GitHub Actions + Azure DevOps extensions)
   - BP4: AI red teaming before production (Red Teaming Agent + PyRIT)
   - BP5: Production monitoring with tracing, evaluations, alerts (Azure Monitor Application Insights + Azure Workbooks)
6. "Citadel Layer Mapping for Observability" — ASCII diagram
7. "Operational Runbook for Agent Monitoring" — brief runbook table (daily/weekly/monthly cadence)
8. Customer quotes from source doc (EY, Accenture, Veeam, Spotfire, Hughes Network Systems)
9. CardGroup next steps → `agent-security-blueprint`, `operations/monitoring`, `operations/runbooks`

**Key content from source doc to document:**
- 5 observability pillars: continuous monitoring, tracing, logging, evaluation, governance
- Agent evaluators: Intent Resolution, Task Adherence, Tool Call Accuracy, Response Completeness
- Quality evaluators: relevance, coherence, fluency
- Risk/safety evaluators: code vulnerabilities, violence, self-harm, sexual content, hate/unfairness, indirect attacks, protected materials
- Azure AI Foundry Agents Playground (test + debug + evaluate)
- CI/CD via GitHub Actions + Azure DevOps extensions
- Unified dashboard via Azure Monitor Application Insights + Azure Workbooks
- Governance integrations: Microsoft Purview, Credo AI, Saidot (EU AI Act compliance)
- Note: `docs/operations/monitoring.mdx` is currently a stub placeholder — 12-02 should create substantive content and that stub should be updated or cross-linked

### Anti-Patterns to Avoid

- **Duplicating existing governance docs:** `docs/governance/security-compliance.mdx` already covers defense-in-depth, zero trust, identity architecture. Agent security blueprint should EXTEND and link to these, not replicate.
- **Duplicating identity-management.mdx:** That doc already covers 3 identity types including agent identities. 12-01 should focus on Entra Agent ID (the new capability) and cross-reference identity-management.mdx for existing patterns.
- **Duplicating operations/monitoring.mdx:** That doc is a placeholder stub. 12-02 should replace/expand it OR create agent-observability.mdx as the substantive implementation and update the stub to point there.
- **Inconsistent navigation placement:** Use cases come after conceptual content. New pages must be inserted before use-case pages in docs.json.
- **Missing CardGroup:** Every prior agent-factory page ends with a CardGroup — omitting it breaks the navigation pattern.

---

## Don't Hand-Roll

| Problem | Don't Build | Use Instead |
|---------|-------------|-------------|
| Architecture diagrams | Custom diagram syntax | ASCII art (established project convention) |
| Navigation wiring | Custom nav scripts | Update `docs.json` entries directly |
| Security control matrices | Custom table formats | Standard MDX table following security-compliance.mdx patterns |
| Callout boxes | Custom HTML | Mintlify `<Note>`, `<Warning>`, `<Info>` components |
| Step-by-step guides | Ordered lists | Mintlify `<Steps>` component (used in all prior agent-factory pages) |

---

## Common Pitfalls

### Pitfall 1: Entra Agent ID "Coming Soon" Status
**What goes wrong:** Documenting Entra Agent ID as generally available when the source doc says "coming soon."
**Why it happens:** Easy to miss the preview/roadmap qualifier in a dense blog post.
**How to avoid:** Use a `<Note>` callout flagging preview status. Source doc (Sep 2025): "Coming soon, every agent created in Foundry will be assigned a unique Entra Agent ID."
**Warning signs:** Any mention of Entra Agent ID without a preview caveat.

### Pitfall 2: Overlooking the monitoring.mdx Stub
**What goes wrong:** Creating agent-observability.mdx as a standalone page without addressing the existing stub at `docs/operations/monitoring.mdx`.
**Why it happens:** Plan 12-02 focuses on agent-factory/, but monitoring.mdx is under operations/ and has placeholder content.
**How to avoid:** The planner should decide: either (a) update monitoring.mdx to point to agent-observability.mdx, or (b) fold runbook content into monitoring.mdx and link back. Option (a) is simpler and keeps concerns separated.
**Warning signs:** Two pages that cover monitoring without cross-referencing each other.

### Pitfall 3: Navigation Order Breaking User Journey
**What goes wrong:** Appending security/observability pages after use-case pages, which breaks the conceptual-then-examples flow.
**Why it happens:** Appending to end of list is the path of least resistance.
**How to avoid:** Insert BEFORE use-case pages. Pattern in docs.json: open standards (mcp-integration, a2a-integration) come before use cases. Security + observability are also conceptual — they belong in the same block.

### Pitfall 4: Missing Cross-References to Existing Security Docs
**What goes wrong:** The security blueprint page becomes a standalone island.
**Why it happens:** Content synthesiser focuses on new content without inventorying existing docs.
**How to avoid:** Explicitly link to `docs/governance/identity-management.mdx`, `docs/governance/security-compliance.mdx`, `docs/architecture/layer-4-security-fabric.mdx`, and `docs/governance/content-safety.mdx`.

---

## Code Examples

### docs.json Navigation Update (12-01 and 12-02)

```json
"docs/agent-factory/a2a-integration",
"docs/agent-factory/agent-security-blueprint",
"docs/agent-factory/agent-observability",
"docs/agent-factory/use-case-employee-self-service",
```

### MDX Frontmatter Pattern (consistent with prior phases)

```mdx
---
title: "Agent Security Blueprint"
description: "A layered approach to building safe, secure, and trustworthy AI agents on Citadel"
---
```

### CardGroup Pattern (mandatory page footer)

```mdx
<CardGroup cols={2}>
  <Card
    title="Agent Observability"
    icon="chart-line"
    href="/agent-factory/agent-observability"
  >
    Five best practices for monitoring agents in production
  </Card>
  <Card
    title="Identity Management"
    icon="id-card"
    href="/governance/identity-management"
  >
    Agent identity patterns with Entra ID
  </Card>
</CardGroup>
```

### Citadel Layer Mapping Diagram Template (ASCII, adapt content)

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                    SECURITY BLUEPRINT ON CITADEL                             │
│                                                                              │
│  Blueprint Element              Citadel Layer                                │
│  ─────────────────────────────────────────────                              │
│  Entra Agent ID                 Layer 3: Agent Identity                      │
│  Prompt Shields / Controls      Layer 4: Security Fabric                     │
│  Data Protection (Purview)      Layer 1: Governance Hub (policy)             │
│  Evaluations / Red Teaming      Layer 2: AI Control Plane                   │
│  Defender XDR Integration       Layer 4: Security Fabric                     │
│  Governance Collaborators       Layer 1: Governance Hub                      │
└─────────────────────────────────────────────────────────────────────────────┘
```

---

## State of the Art

| Old Approach | Current Approach | When Changed | Impact |
|--------------|------------------|--------------|--------|
| Static identity for AI services | Entra Agent ID (per-agent identity, lifecycle tracking) | Sep 2025 (preview) | Eliminates shadow agents; traceable per-agent audit trail |
| Manual red teaming | Azure AI Red Teaming Agent + PyRIT toolkit (automated adversarial testing at scale) | ~2025 | Validates multi-agent workflows before production |
| Separate observability tools | Unified Azure AI Foundry Observability dashboard (Azure Monitor + Workbooks) | Aug 2025 | Single pane for quality, safety, performance, resource usage |
| Qualitative compliance | Credo AI / Saidot integration mapping evals to EU AI Act + NIST AI RMF | 2025 | Automated regulatory alignment evidence |
| Prompt injection defense (user input only) | Cross-prompt injection classifier (also scans tool responses, email triggers, untrusted sources) | 2025 | First-of-kind cross-surface injection defense |

**Deprecated/outdated:**
- Treating AI observability as identical to traditional software observability — agents are non-deterministic and require evaluations + governance pillars in addition to metrics/logs/traces.

---

## Open Questions

1. **Entra Agent ID GA timeline**
   - What we know: Source doc (Sep 2025) says "coming soon"
   - What's unclear: Whether it has reached GA by April 2026 (documentation date)
   - Recommendation: Use `<Note>` to flag the preview/preview-at-time-of-writing status and link to the official Azure release notes. Planner should not block on this — document the capability with appropriate caveat.

2. **monitoring.mdx stub resolution**
   - What we know: `docs/operations/monitoring.mdx` exists as a placeholder with "Coming Soon" content
   - What's unclear: Whether Plan 12-02 should update that stub or leave it
   - Recommendation: Plan 12-02 should create `agent-observability.mdx` as the rich content page AND update `monitoring.mdx` to remove the placeholder and point to the new page. This is a 2-task plan structure.

3. **docs.json group label for security/observability**
   - What we know: Current Agent Factory group has no sub-groups; all items are flat
   - What's unclear: Whether the 14-item list (post Phase 12) needs sub-grouping
   - Recommendation: Do not add sub-groups unless the user requests it — all prior phases maintained flat lists within groups.

---

## Validation Architecture

> nyquist_validation is not explicitly set in .planning/config.json (no config.json found) — treating as enabled.

### Test Framework

| Property | Value |
|----------|-------|
| Framework | Mintlify build validation (no automated test suite for docs) |
| Config file | `docs.json` |
| Quick run command | Manual: verify page renders in Mintlify dev server |
| Full suite command | Manual: `mintlify dev` — confirm navigation and page loading |

### Phase Requirements → Test Map

| Req ID | Behavior | Test Type | Automated Command | File Exists? |
|--------|----------|-----------|-------------------|-------------|
| 12-01 | `docs/agent-factory/agent-security-blueprint.mdx` exists with min 80 lines | manual | Check file exists + line count | ❌ Wave 0 |
| 12-01 | Navigation entry `agent-security-blueprint` present in `docs.json` | manual | `grep "agent-security-blueprint" docs.json` | ❌ Wave 0 |
| 12-02 | `docs/agent-factory/agent-observability.mdx` exists with min 80 lines | manual | Check file exists + line count | ❌ Wave 0 |
| 12-02 | Navigation entry `agent-observability` present in `docs.json` | manual | `grep "agent-observability" docs.json` | ❌ Wave 0 |
| 12-02 | `docs/operations/monitoring.mdx` updated (no longer placeholder-only) | manual | Check file modified | ❌ Wave 0 |

### Sampling Rate

- **Per task commit:** Manual review of created file
- **Per wave merge:** Confirm both pages appear in docs.json + files have min_lines
- **Phase gate:** Both pages load correctly in Mintlify navigation before marking phase complete

### Wave 0 Gaps

- [ ] `docs/agent-factory/agent-security-blueprint.mdx` — covers 12-01
- [ ] `docs/agent-factory/agent-observability.mdx` — covers 12-02
- [ ] `docs.json` navigation entries for both pages

*(No framework install needed — documentation-only phase)*

---

## Sources

### Primary (HIGH confidence)

- `docs/agent-factory/creating-a-blueprint-for-safe-and-secure-ai-agents.md` — Full security blueprint source doc (Microsoft Azure Blog, Sep 17 2025, Yina Arenas)
- `docs/agent-factory/top-5-agent-observability-best-practices-for-reliable-ai.md` — Full observability source doc (Microsoft Azure Blog, Aug 27 2025, Yina Arenas)
- `docs.json` — Current navigation structure (verified via direct inspection, April 2026)
- `docs/governance/` directory — Inventory of existing governance pages to avoid duplication
- `docs/operations/monitoring.mdx` — Confirmed placeholder stub requiring update
- `.planning/phases/11-open-standards/11-01-PLAN.md` — Reference plan structure from immediately prior phase

### Secondary (MEDIUM confidence)

- `.planning/STATE.md` — Confirmed Phase 12 scope and predecessor phases
- `.planning/ROADMAP.md` — Confirmed plan descriptions for 12-01 and 12-02
- `docs/agent-factory/mcp-integration.mdx` — Pattern reference for MDX page structure

---

## Metadata

**Confidence breakdown:**
- Source content: HIGH — both source docs are fully readable in the repository
- Standard stack: HIGH — Mintlify MDX patterns are verified from 10+ prior phase deliverables
- Architecture / placement: HIGH — docs.json inspected directly, existing file structure confirmed
- Pitfalls: HIGH — derived from direct inspection of existing pages and prior phase patterns
- Entra Agent ID status: MEDIUM — "coming soon" per Sep 2025 source; GA status in Apr 2026 unverified

**Research date:** 2026-04-13
**Valid until:** 2026-05-13 (stable documentation domain — 30 day validity)
