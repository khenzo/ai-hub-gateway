---
phase: 12-agent-security-observability
plan: "02"
subsystem: docs/agent-factory
tags: [observability, agent-monitoring, azure-ai-foundry, runbook, evaluations, ci-cd, red-teaming]
dependency_graph:
  requires: [12-01]
  provides: [agent-observability-page, monitoring-cross-reference, nav-agent-factory-observability]
  affects: [docs/agent-factory/agent-observability.mdx, docs/operations/monitoring.mdx, docs.json]
tech_stack:
  added: []
  patterns: [Mintlify Steps component, ASCII architecture diagram, operational runbook table, CardGroup footer navigation]
key_files:
  created:
    - docs/agent-factory/agent-observability.mdx
  modified:
    - docs/operations/monitoring.mdx
    - docs.json
decisions:
  - Five best practices documented using Steps component matching agent-security-blueprint.mdx pattern
  - monitoring.mdx retained its original frontmatter (title/description/icon) and CardGroup structure; only body content replaced
  - docs.json navigation insert placed between agent-security-blueprint and use-case-employee-self-service as specified
  - monitoring.mdx uses Note component with direct href plus a standalone Card for dual-path discovery
metrics:
  duration: 2min
  completed_date: "2026-04-13"
  tasks_completed: 2
  files_created: 1
  files_modified: 2
---

# Phase 12 Plan 02: Agent Observability Summary

**One-liner:** Agent observability page with five Azure AI Foundry best practices, CI/CD gates, red teaming, operational runbook, and Citadel layer mapping — plus monitoring.mdx stub updated from dead placeholder to active cross-reference.

## What Was Built

### Task 1: Create Agent Observability Documentation

Created `docs/agent-factory/agent-observability.mdx` (158 lines) with:

- **Intro** explaining why agent observability extends traditional observability with evaluations and governance pillars
- **Traditional vs Agent Observability comparison table** (5 dimensions)
- **Azure AI Foundry Observability Platform** overview paragraph
- **Five Best Practices** in `<Steps>` component:
  - BP1: Model selection via benchmark-driven leaderboards (Azure AI Foundry model leaderboards)
  - BP2: Continuous evaluation — all four agent evaluators (Intent Resolution, Task Adherence, Tool Call Accuracy, Response Completeness), quality evaluators (Relevance, Coherence, Fluency), and risk/safety evaluators (Code vulnerabilities, violence, self-harm, sexual content, hate/unfairness, indirect attacks, protected materials)
  - BP3: CI/CD integration with GitHub Actions and Azure DevOps extensions
  - BP4: Red teaming with Azure AI Red Teaming Agent and PyRIT toolkit (with Note distinguishing from production monitoring)
  - BP5: Production monitoring with Application Insights, Azure Workbooks, Microsoft Purview, and Credo AI / Saidot
- **Citadel Layer Mapping ASCII diagram** (observability pillars → Layers 1, 2, and 4)
- **Operational Runbook table** with Daily/Weekly/Monthly/Quarterly cadences
- **Enterprise Proof Points** (EY, Accenture, Veeam, Spotfire, Hughes Network Systems)
- **CardGroup footer** with 4 cards: Agent Security Blueprint, Agent Operations, AI Control Plane, Design Patterns

### Task 2: Update monitoring.mdx and docs.json

**monitoring.mdx:** Replaced dead "Coming Soon" placeholder body with:
- Intro sentence establishing operations-focused scope
- `<Note>` component with direct link to `/agent-factory/agent-observability`
- 5-bullet summary of what the Agent Observability page covers
- Standalone `<Card>` linking to agent-observability at bottom of content section
- Original frontmatter, Key Metrics CardGroup, and Next Steps CardGroup preserved

**docs.json:** Added `"docs/agent-factory/agent-observability"` between `agent-security-blueprint` and `use-case-employee-self-service` in the Agent Factory navigation group. JSON validation confirmed valid.

## Commits

| Task | Commit | Description |
|------|--------|-------------|
| Task 1 | `12f9ec0` | feat(12-02): create agent observability documentation |
| Task 2 | `570ed84` | feat(12-02): update monitoring.mdx stub and wire agent-observability into docs.json |

## Deviations from Plan

None — plan executed exactly as written.

## Self-Check: PASSED

- FOUND: docs/agent-factory/agent-observability.mdx (158 lines)
- FOUND: docs/operations/monitoring.mdx (updated)
- FOUND: commit 12f9ec0 (Task 1)
- FOUND: commit 570ed84 (Task 2)
