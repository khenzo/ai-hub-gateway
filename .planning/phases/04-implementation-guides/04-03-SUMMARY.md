---
phase: 04-implementation-guides
plan: "03"
subsystem: implementation-guides
tags:
  - configuration-examples
  - troubleshooting
  - common-issues
  - best-practices
  - operational-excellence
  - bicep
  - apim
  - ai-governance

dependency_graph:
  requires:
    - 04-01
    - 04-02
  provides:
    - configuration examples for all major components
    - troubleshooting procedures for deployment and runtime
    - common issues quick-reference and FAQ
    - best practices and optimization patterns
  affects:
    - all architects deploying the AI Landing Zone
    - ongoing operations and support teams

tech_stack:
  added: []
  patterns:
    - Bicep parameter file per environment (dev/staging/prod)
    - APIM policy XML with inline documentation
    - KQL queries for operational monitoring
    - Zero trust security model implementation
    - Blue-green and canary deployment patterns

key_files:
  created:
    - docs/guides/configuration-examples.mdx
    - docs/guides/troubleshooting.mdx
    - docs/guides/common-issues.mdx
    - docs/guides/best-practices.mdx
  modified: []

decisions:
  - "Configuration examples use inline Bicep + XML + JSON rather than separate files for copy-paste readability"
  - "Troubleshooting organized by component (deployment, network, APIM, AI workloads, governance, monitoring)"
  - "Common issues use Symptom → Root Cause → Fix pattern for rapid scanning"
  - "Best practices aligned to Microsoft WAF pillars with explicit references"
  - "Multi-environment pattern uses var config lookup rather than if/else chains"

metrics:
  duration: "8 min"
  completed_date: "2026-04-10"
  tasks_completed: 4
  files_created: 4
  files_modified: 0
---

# Phase 4 Plan 3: Configuration Examples and Operational Documentation Summary

**One-liner:** Complete operational documentation suite covering configuration patterns, troubleshooting diagnostics, issue resolution, and best practices aligned to the Microsoft Well-Architected Framework.

---

## What Was Built

### Task 1 — Configuration Examples (`docs/guides/configuration-examples.mdx`)

Comprehensive copy-paste ready configuration library:

- **Network**: Hub VNet with spoke peering, NSG rules for AI workloads, private endpoints for OpenAI/Foundry, private DNS zone deployment and VNet linking
- **APIM**: API definition via OpenAPI import, rate limiting with token-based limits, Entra ID JWT validation, request/response transformation, CORS, named values backed by Key Vault
- **AI Access Contracts**: Basic template, multi-tenant pattern with per-subscription limits, full governance contract with PII protection and budget controls
- **Monitoring**: KQL queries for token usage and error rates, alert rule Bicep, diagnostic settings for APIM and OpenAI
- **Security**: Key Vault RBAC (not legacy access policies), managed identity assignments with specific roles, private link service for external consumers
- **Multi-environment**: Dev/staging/prod parameter files, Bicep var config lookup pattern for environment-driven configuration

### Task 2 — Troubleshooting Guide (`docs/guides/troubleshooting.mdx`)

Structured diagnostic procedures for all components:

- **Methodology**: 5-step identify-isolate-trace-correlate-resolve framework
- **Essential commands**: APIM health, VNet peering, private endpoint, DNS tests
- **KQL diagnostic queries**: Failed requests, policy errors, backend latency analysis
- **Deployment issues**: Bicep failures with error table, APIM stuck in Activating (NSG fix), permission issues with RBAC assignment commands
- **Network issues**: VNet peering verification and re-creation, private endpoint DNS resolution fix, NSG flow log analysis
- **APIM issues**: Gateway connectivity, policy execution trace, authentication debugging with JWT decode
- **AI workload issues**: Model deployment failures, Foundry connectivity, token quota analysis, content safety tuning
- **Governance issues**: Contract enforcement verification, audit logging gap diagnosis
- **Monitoring issues**: Log collection failures, alert rule debugging with common failure table
- **Quick health-check script** covering all components

### Task 3 — Common Issues and FAQ (`docs/guides/common-issues.mdx`)

Fast-scan reference organized for quick resolution:

- **Top 10 deployment issues**: All with exact CLI fix commands
- **Top 10 runtime issues**: Auth, rate limiting, latency, content safety, logging, PII, cost attribution
- **15+ FAQ answers**: Terraform support, minimum deployment, migration, multi-region, landing zone integration, APIM tier selection, budget enforcement, model support
- **Quick fixes reference**: Restart APIM, refresh peering, regenerate keys, clear cache, force policy sync
- **Escalation matrix**: When to call Microsoft Support, required ticket information, severity level definitions

### Task 4 — Best Practices Guide (`docs/guides/best-practices.mdx`)

Implementation wisdom organized by WAF pillar:

- **Architecture**: APIM tier selection table, 3 spoke design patterns, network segmentation strategy, naming conventions, tagging implementation
- **Security**: Zero trust 3-layer model (identity/network/data), secret rotation schedule by type, RBAC least privilege matrix, network hardening commands
- **Performance**: 3-tier caching strategy (APIM/Redis/semantic), connection pooling, APIM Premium auto-scaling, 5 latency optimization techniques
- **Cost**: SKU selection by use case, PTU vs PAYG break-even analysis, dev/test 60-80% savings patterns, KQL cost tracking queries
- **Governance**: Contract versioning with major/minor convention, policy lifecycle management, compliance automation via Azure Policy, audit retention matrix
- **Operational Excellence**: Runbook template table, change management 5-step procedure, incident response playbooks, DR testing schedule
- **Migration**: Blue-green pattern with traffic weight shifting, canary release APIM policy + KQL monitoring, rollback procedures
- **Decision trees**: APIM VNet mode, PTU vs PAYG selection

---

## Key Configuration Patterns

1. **Multi-environment config**: Use Bicep `var environmentConfig` lookup pattern instead of per-environment files for DRY configuration
2. **Secret management**: Always use Key Vault-backed named values in APIM (never embed secrets in policies)
3. **Rate limiting counter key**: Use `context.Subscription.Id` for per-team throttling, not IP address
4. **DNS resolution**: Private DNS zones must be linked to ALL VNets (hub + each spoke) that need private endpoint resolution
5. **Zero trust enforcement**: `publicNetworkAccess: 'Disabled'` on all AI PaaS resources in production

---

## Troubleshooting Coverage Summary

| Component | Issues Documented |
|-----------|------------------|
| Bicep/ARM Deployments | 5 issue types with root cause table |
| Network Connectivity | VNet peering, private endpoints, NSG, DNS |
| API Management | Gateway, policies, authentication |
| AI Workloads | Model deployment, Foundry, quota, content safety |
| Governance | Contract enforcement, audit gaps |
| Monitoring | Log collection, alert rules |

---

## Phase 4 Completion Status

Phase 4 (Implementation Guides) is now **complete** — all 3 plans executed:

| Plan | Title | Status | Key Deliverables |
|------|-------|--------|-----------------|
| 04-01 | Getting Started Guides | Complete | Prerequisites, Quick-Start, Roles & Responsibilities |
| 04-02 | Deployment Guide | Complete | Deployment Guide, Bicep Modules Reference, Checklists |
| 04-03 | Configuration & Operations | Complete | Config Examples, Troubleshooting, Common Issues, Best Practices |

**Documentation coverage:** The AI Landing Zone now has complete implementation documentation from initial assessment through day-2 operations. Clear progression: prerequisites → quick-start → deployment → configuration → operations.

---

## Cross-References Between Guides

All 4 new guides are interlinked:
- `configuration-examples.mdx` → references `bicep-modules.mdx` for module parameters
- `troubleshooting.mdx` → references `common-issues.mdx` for quick-scan reference
- `common-issues.mdx` → references `troubleshooting.mdx` for deep diagnostics
- `best-practices.mdx` → references `deployment-guide.mdx` for implementation context

---

## Next Steps: Phase 5 — Integration & Validation

Phase 5 will cover:
- End-to-end integration testing scenarios
- Validation automation (test suites for each deployment pattern)
- Integration with CI/CD pipelines (Azure DevOps, GitHub Actions)
- Sample workload deployments demonstrating full stack operation
- Performance benchmarking and baseline documentation

---

## Deviations from Plan

None — plan executed exactly as written. All 4 guides created with the specified content areas. Additional value added: environment-specific configuration patterns, decision trees for architecture choices, and WAF alignment table not explicitly in plan but consistent with the goal of "reference to WAF principles."

---

## Self-Check: PASSED

- [x] `docs/guides/configuration-examples.mdx` — exists, 983 lines
- [x] `docs/guides/troubleshooting.mdx` — exists, 773 lines
- [x] `docs/guides/common-issues.mdx` — exists, 670 lines
- [x] `docs/guides/best-practices.mdx` — exists, 804 lines
- [x] Commits: ab16d93, a9f35b0, 6f80e41, 0d21700
