---
phase: 04-implementation-guides
plan: "01"
subsystem: getting-started
tags: [getting-started, prerequisites, quick-start, roles, RACI, onboarding]
dependency_graph:
  requires: [03-01, 03-02, 03-03]
  provides: [getting-started-entry-point, readiness-assessment, stakeholder-alignment]
  affects: [04-02, 04-03, docs/getting-started]
tech_stack:
  added: []
  patterns: [mintlify-mdx, cardgroup-navigation, tabbed-raci-matrix, scored-checklist, accordion-details]
key_files:
  created:
    - docs/getting-started/prerequisites.mdx
    - docs/getting-started/quick-start.mdx
    - docs/getting-started/roles-and-responsibilities.mdx
  modified: []
decisions:
  - "Scored readiness assessment (0-60) with three levels: Advanced/Standard/Basic/Early-Stage"
  - "Quick-start targets Developer-tier APIM for cost-effective evaluation"
  - "RACI matrix presented in five tabbed phases for readability"
  - "Org chart templates provided for three organization sizes"
metrics:
  duration: "5 min"
  completed: "2026-04-10"
  tasks_completed: 3
  files_created: 3
  files_modified: 0
---

# Phase 4 Plan 1: Getting Started Guides Summary

Three interconnected getting-started guides covering prerequisites, quick-start evaluation, and stakeholder roles for the AI Landing Zone (Citadel Governance Hub).

## What Was Built

### 1. Prerequisites Guide (`docs/getting-started/prerequisites.mdx`)

Comprehensive readiness assessment guide covering:
- **Technical prerequisites**: Azure subscription, quotas, network requirements, Entra ID, and dev tools — all with copy-paste commands
- **Organizational prerequisites**: Landing Zone maturity assessment (3 levels), governance readiness, network topology compatibility
- **Governance prerequisites**: AI governance framework, data classification policy, cost management models
- **Scored readiness assessment**: 60-point self-assessment across three categories (technical, organizational, AI governance) with three readiness levels
- **Decision framework**: Clear guidance on when to proceed, engage partners, or start with simpler patterns

### 2. Quick-Start Evaluation Guide (`docs/getting-started/quick-start.mdx`)

End-to-end 2-4 hour evaluation path covering:
- Minimal prerequisites (no existing Landing Zone required)
- Step-by-step deployment using Azure Developer CLI (primary) and Bicep directly (alternative)
- Sample AI Access Contract configuration
- Five validation steps: basic request, usage tracking, quota enforcement, APIM developer portal, content safety
- Evaluation checklist across governance, observability, policy enforcement, and developer experience
- Post-evaluation decision tree for next steps
- Complete cleanup instructions with cost avoidance guidance

### 3. Roles and Responsibilities Guide (`docs/getting-started/roles-and-responsibilities.mdx`)

Complete stakeholder framework covering:
- **Seven roles defined**: Platform Lead, Network Engineer, Security Engineer, AI/ML Engineer, Compliance Officer, PM, Business Sponsor
- **RACI matrix**: 5 tabbed phases (Design, Infrastructure, Governance, Workload Onboarding, Operations) with full responsibility mapping
- **Skills and competencies**: Azure certification paths per role with learning resources
- **Governance responsibilities**: AI Access Contract ownership model, policy lifecycle, monitoring cadence, incident response matrix
- **Communication plan**: Meeting cadence by phase, escalation path (4 levels), documentation handoff list
- **Org chart templates**: Small (5-10), medium (10-50), and enterprise (50+) team structures

## Readiness Assessment Framework

The prerequisites guide implements a 60-point scored assessment with clear outcomes:

| Score | Level | Action |
|---|---|---|
| 50-60 | Advanced | Proceed to deployment |
| 35-49 | Standard | 1-2 week gap remediation |
| 20-34 | Basic | 4-8 week preparation sprint |
| <20 | Early Stage | Engage Microsoft partner |

## Cross-References Established

- prerequisites.mdx → quick-start.mdx (readiness-to-action)
- prerequisites.mdx → /ai-patterns/pattern-comparison (pattern selection)
- quick-start.mdx → /guides/deployment-guide (evaluation-to-production)
- quick-start.mdx → /getting-started/roles-and-responsibilities (stakeholder engagement)
- roles-and-responsibilities.mdx → /governance/ai-access-contracts (governance operationalization)
- roles-and-responsibilities.mdx → /guides/deployment-guide (team deployment)

## Commits

| Task | Commit | Files |
|---|---|---|
| Create prerequisites guide | db6409b | docs/getting-started/prerequisites.mdx |
| Create quick-start evaluation guide | 8ad7b72 | docs/getting-started/quick-start.mdx |
| Create roles and responsibilities guide | f885a91 | docs/getting-started/roles-and-responsibilities.mdx |

## Deviations from Plan

None - plan executed exactly as written.

## Next Steps

Plan 04-02 (Deployment Guide) should build on this foundation:
- Quick-start links to `/guides/deployment-guide` — this path must resolve in 04-02
- Prerequisites guide references deployment guide for production configuration
- The RACI Operations phase references runbooks to be created in 04-02 or 04-03

## Self-Check: PASSED

All created files verified present on disk. All task commits verified in git history.
