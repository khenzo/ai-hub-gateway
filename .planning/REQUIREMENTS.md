# Requirements: v1.3 — EY Framework Alignment

**Defined:** 2026-04-14
**Core Value:** Enable organizations to deploy enterprise-grade AI infrastructure with confidence

## v1.3 Requirements

### Framework Alignment Overview (ALIGN)

- [x] **ALIGN-01**: User can view a single alignment map showing every EY AI Agent Development Framework criterion mapped to a Citadel component with enforcement status (enforced / partial / attention point)
- [x] **ALIGN-02**: User can navigate a dedicated EY Framework Alignment section in the Mintlify site (new top-level tab)

### Kubernetes & DevOps (KUBE)

- [x] **KUBE-01**: User can understand how to deploy a pro-code agent container to AKS behind the Citadel APIM gateway (network integration, access contract wiring, namespace isolation)
- [x] **KUBE-02**: User can follow a GitHub repository scaffolding pattern for an agent project (folder structure, branch policies, starter kit conventions aligned to EY standards)
- [x] **KUBE-03**: User can implement a CI/CD pipeline using GitHub Actions that builds, tests, and deploys an agent to AKS with Citadel access contracts applied

### Security & Governance at Scale (GOVN)

- [x] **GOVN-01**: User can map EY's two-tiered governance model (firmwide + service-line) to Citadel's 4-layer architecture — understanding which layer satisfies which governance tier
- [x] **GOVN-02**: User can implement AI guardrails (Content Safety, PII blocking, jailbreak/injection detection) using Citadel APIM policies
- [x] **GOVN-03**: User can understand how Azure Policy, Defender for AI, and Purview map to EY's AIRA/AI QRM compliance requirements

### MCP, A2A & Agent Discovery (PROTO)

- [x] **PROTO-01**: User can understand how Citadel's APIM layer governs MCP server exposure and tool invocation flows (aligned to EY MCP standards)
- [x] **PROTO-02**: User can understand how Citadel acts as an A2A trust broker — cross-agent authentication, federation, and Citadel's role in A2A security
- [x] **PROTO-03**: User can see how APIM API Center serves as an agent registry/discovery catalog — addressing EY's "future" agent discovery requirement today

### Attention Points (GAPS)

- [x] **GAPS-01**: User receives actionable recommendations for what to add alongside Citadel to fully satisfy the EY framework (what Citadel does not cover: AIRA/AI QRM tooling, EY-specific guardrail vendors, LangSmith)

### Documentation Refactoring (REFACTOR)

- [x] **REFACTOR-01**: Guides section has a clear AI Landing Zone subsection with quickstart page linking to the official ALZ GitHub repository
- [x] **REFACTOR-02**: Guides section has a clear Citadel Hub subsection with quickstart page linking to the official Citadel GitHub repository
- [x] **REFACTOR-03**: Mintlify navigation (docs.json) reflects the restructured Guides with no standalone Operations tab
- [x] **REFACTOR-04**: All internal cross-references to old guide and operations paths are updated to new locations

## Future Requirements

*(None defined for v1.4 at this time)*

## Out of Scope

| Feature | Reason |
|---------|--------|
| Development spectrum (no-code/low-code/pro-code mapping page) | Deferred — user excluded from v1.3 scope |
| EY Fabric-specific delivery (EYQ, EYX, NVIDIA Agent Builder) | Out of scope — focus is Azure/Microsoft infrastructure only |
| NVIDIA and IBM stack coverage | Out of scope per user instruction |
| EY-internal governance tooling (AIRA, AI QRM forms) | EY-proprietary process, not reproducible in Citadel |

## Traceability

| Requirement | Phase | Status |
|-------------|-------|--------|
| ALIGN-01 | Phase 16 | Complete |
| ALIGN-02 | Phase 16 | Complete |
| KUBE-01 | Phase 17 | Complete |
| KUBE-02 | Phase 17 | Complete |
| KUBE-03 | Phase 17 | Complete |
| GOVN-01 | Phase 18 | Complete |
| GOVN-02 | Phase 18 | Complete |
| GOVN-03 | Phase 18 | Complete |
| PROTO-01 | Phase 19 | Complete |
| PROTO-02 | Phase 19 | Complete |
| PROTO-03 | Phase 19 | Complete |
| GAPS-01 | Phase 20 | Complete |
| REFACTOR-01 | Phase 21 | Complete |
| REFACTOR-02 | Phase 21 | Complete |
| REFACTOR-03 | Phase 21 | Complete |
| REFACTOR-04 | Phase 21 | Complete |

**Coverage:**
- v1.3 requirements: 15 total
- Mapped to phases: 15
- Unmapped: 0 ✓

---
*Requirements defined: 2026-04-14*
*Last updated: 2026-04-14 after initial definition*
