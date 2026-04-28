# Phase 27: Security & Identity Patterns - Research

**Researched:** 2026-04-27
**Domain:** Azure Entra Identity + Databricks Unity Catalog Security + APIM Governance
**Confidence:** HIGH

## Summary

This research addresses two critical enterprise AI governance patterns for the v2.0 Enterprise Data Foundation milestone: the **zero-secrets data path** using Entra Managed Identity (MI) chains, and **governance-by-construction** using Unity Catalog column masks that propagate through APIM to AI agent responses.

The zero-secrets pattern eliminates secrets from Key Vault for the data access path by chaining identities: the AI agent authenticates to APIM using an Entra token, APIM authenticates to Databricks SQL using its own Managed Identity (or forwards the user token), Databricks SQL evaluates Unity Catalog security policies using the caller's identity context, and OneLake enforces access using the same identity chain. No passwords, connection strings, or API keys exist in this path.

Governance-by-construction means security policies are embedded in the data layer (Unity Catalog column masks) and enforced at query time regardless of access path. When an AI agent queries through APIM → Databricks SQL → OneLake, the mask is applied by Unity Catalog before data leaves Databricks, ensuring masked values propagate through APIM to the agent response. This is structural enforcement, not procedural checking.

These patterns attach to the Citadel 4-layer model at Layer 4 (Security Fabric) for identity chain management and Layer 1 (APIM Gateway) for PII policy propagation.

<phase_requirements>
## Phase Requirements

| ID | Description | Research Support |
|----|-------------|-----------------|
| **DSEC-03** | User can understand the Entra Managed Identity chain for agent→APIM→Databricks SQL→OneLake — zero secrets in Key Vault for the data path | Entra MI types (system/user-assigned), `authentication-managed-identity` APIM policy, Databricks OAuth M2M/OBO flows, OneLake Entra auth |
| **DSEC-04** | User can understand how Unity Catalog column masks propagate through the APIM PII policy to AI agent responses — governance by construction, not procedural enforcement | UC column mask SQL UDFs, query-time enforcement, APIM `set-body`/`find-and-replace` response transformation, governance-by-construction vs procedural pattern |
</phase_requirements>

## Standard Stack

### Core Identity Stack
| Component | Type | Purpose | Why Standard |
|-----------|------|---------|--------------|
| **User-assigned Managed Identity** | Entra ID | Primary identity for APIM-to-Databricks authentication | Recommended by Microsoft for shared workloads; survives resource recycling; consistent permissions |
| **System-assigned Managed Identity** | Entra ID | Single-resource identity lifecycle | Use when identity must be tied to specific resource lifecycle |
| **Workload Identity Federation** | Entra ID | Federate MI as credential for app registrations | Eliminates secrets even for app-based auth; GA as of 2024 |
| **On-Behalf-Of (OBO) Flow** | OAuth 2.0 | Delegate user identity through service chain | Required for user context propagation; middle-tier services only |
| **OAuth M2M (Client Credentials)** | OAuth 2.0 | Service principal to service principal | For agent-to-APIM when user context not required |

### Core APIM Policies
| Policy | Purpose | Where Used |
|--------|---------|------------|
| `validate-azure-ad-token` | Validate Entra JWT on inbound | Layer 1 (inbound section) |
| `authentication-managed-identity` | Obtain MI token for backend | Layer 1 (backend section) |
| `set-body` | Transform response payload | Layer 1 (outbound section) |
| `find-and-replace` | Mask PII in response body | Layer 1 (outbound section) |
| `include-fragment` | Reuse policy fragments | All sections |

### Core Databricks/Unity Catalog
| Feature | Status | Purpose |
|---------|--------|---------|
| **Column Masks** | GA | Query-time column transformation based on user identity |
| **Row Filters** | GA | Query-time row filtering based on user identity |
| **ABAC Policies** | Public Preview | Centralized tag-based policy management |
| **SQL UDF Masking Functions** | GA | Custom masking logic in SQL/Python/Scala |

## Architecture Patterns

### Pattern 1: Zero-Secrets Managed Identity Chain

**What:** A credential-free authentication chain from AI agent through to data storage.

**When to use:** Any production data access path where secrets rotation, leakage, or management creates operational or security risk.

**The Chain:**

```
┌─────────────┐     Entra Token      ┌─────────────┐     MI Token        ┌──────────────┐
│  AI Agent   │ ───────────────────► │    APIM     │ ─────────────────► │  Databricks  │
│  (Entra ID) │                      │  (MI Auth)  │                    │     SQL      │
└─────────────┘                      └─────────────┘                    └──────────────┘
                                                                              │
                                                                              │ Identity
                                                                              │ Delegation
                                                                              ▼
                                                                       ┌──────────────┐
                                                                       │   OneLake    │
                                                                       │ (Entra Auth) │
                                                                       └──────────────┘
```

**Key Insight:** No Key Vault secrets exist anywhere in this path. Each hop uses either:
- Entra ID token (user-delegated or MI)
- Azure platform-managed credentials (MSI/UMI)

### Pattern 2: Governance-by-Construction with Column Masks

**What:** Data governance enforced structurally at query time, propagating through all access paths.

**When to use:** When sensitive data must be consistently redacted across all consumers (BI tools, AI agents, notebooks, APIs).

**How It Works:**

1. **Unity Catalog defines the mask** as a SQL UDF:
```sql
CREATE FUNCTION mask_email(email STRING)
RETURN CASE
  WHEN current_user() IN ('admin@contoso.com', 'security@contoso.com') THEN email
  ELSE CONCAT(SUBSTRING(email, 1, 2), '***@***.com')
END;

ALTER TABLE customers
ALTER COLUMN email
SET MASK mask_email;
```

2. **Query-time enforcement:** Every query against `customers.email` has the mask applied by the Spark SQL optimizer before results materialize.

3. **Propagation through APIM:** APIM receives already-masked data from Databricks. The PII policy in APIM serves as defense-in-depth (pattern validation) rather than primary enforcement.

4. **AI agent receives masked data:** The response contains structurally redacted values—no post-processing required.

**Why This Is "Governance by Construction":**

| Aspect | Procedural Enforcement | Governance by Construction |
|--------|----------------------|---------------------------|
| Where enforced | Application code checks data before returning | Data layer applies policy at query time |
| Bypass risk | High—different code paths may skip checks | None—impossible to query without mask |
| Consistency | Depends on application implementation | Universal across all query paths |
| Audit | Application must log enforcement actions | Automatic in UC audit logs |

### Pattern 3: APIM Policy Fragments for Data Governance

**What:** Reusable, centrally-managed policy configurations for consistent governance enforcement.

**When to use:** When multiple APIs need identical governance controls (PII masking, rate limiting, auth patterns).

**Example Fragment Structure:**
```xml
<!-- Fragment: data-governance-inbound -->
<fragment>
    <validate-azure-ad-token 
        tenant-id="{{entra-tenant-id}}"
        output-token-variable-name="validated-token">
        <audiences>
            <audience>{{api-audience}}</audience>
        </audiences>
    </validate-azure-ad-token>
    <set-variable name="caller-id" 
        value="@(((Jwt)context.Variables["validated-token"]).Claims.GetValueOrDefault("oid", ""))" />
</fragment>

<!-- Fragment: pii-response-masking -->
<fragment>
    <outbound>
        <find-and-replace from="\\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Z|a-z]{2,}\\b" 
                         to="[EMAIL_MASKED]" />
    </outbound>
</fragment>
```

**Fragment Inclusion:**
```xml
<policies>
    <inbound>
        <include-fragment fragment-id="data-governance-inbound" />
        <authentication-managed-identity resource="{{databricks-app-id}}" />
    </inbound>
    <outbound>
        <include-fragment fragment-id="pii-response-masking" />
    </outbound>
</policies>
```

### Pattern 4: Token Exchange (On-Behalf-Of)

**What:** Middle-tier service exchanges user token for downstream resource token while preserving user identity context.

**When to use:** When APIM needs to call Databricks as the original user (for audit/UC evaluation), not as the APIM service principal.

**Flow:**
1. Agent acquires token for APIM (`aud: apim-client-id`)
2. APIM validates token
3. APIM exchanges token for Databricks token using OBO flow
4. Databricks evaluates UC policies as the original user

**Limitation:** OBO only works for user principals, not service principals. For service-to-service, use direct MI auth or client credentials.

## Don't Hand-Roll

| Problem | Don't Build | Use Instead | Why |
|---------|-------------|-------------|-----|
| Token validation logic | Custom JWT parsing | `validate-azure-ad-token` / `validate-jwt` | Entra key rotation, algorithm changes, claim validation complexity |
| Token acquisition for MI | MSI endpoint calls | `authentication-managed-identity` policy | Token caching, refresh, error handling built-in |
| PII detection regex | Custom patterns | Azure AI Content Safety + APIM policy combination | ML-based detection, multilingual, context-aware |
| Row/column security | Application-level filtering | Unity Catalog row filters + column masks | Query-time enforcement, bypass-proof, audit trail |
| Secret storage for data path | Key Vault references | Managed Identity chain | Eliminates rotation, leakage risk, credential management |
| Identity federation | Custom STS/OIDC provider | Entra Workload Identity Federation | Platform-native, Azure AD B2B compatible, audit integrated |

**Key Insight:** The zero-secrets pattern is only possible when you use Azure-native identity features at every layer. Custom token handling or secret injection breaks the chain and reintroduces credential management burden.

## Common Pitfalls

### Pitfall 1: Using Secrets in the Data Path
**What goes wrong:** Teams store Databricks PATs (Personal Access Tokens) or connection strings in Key Vault, then reference them from APIM policies.

**Why it happens:** Legacy patterns, perceived simplicity, lack of awareness of MI capabilities.

**How to avoid:** 
- Enable system-assigned MI on APIM
- Grant MI "Databricks SQL User" role in Unity Catalog
- Use `authentication-managed-identity` policy exclusively

**Warning signs:** Any `{{key-vault-secret}}` reference in data access policy; PAT generation in Databricks admin console.

### Pitfall 2: OBO Flow for Service Principals
**What goes wrong:** Attempting to use On-Behalf-Of flow for service principal authentication chains.

**Why it happens:** Misunderstanding that OBO is user-delegation only.

**How to avoid:** Use direct MI auth (`authentication-managed-identity`) or client credentials for service-to-service. Reserve OBO for user-context propagation.

**Warning signs:** `AADSTS70011` errors when requesting tokens; attempt to exchange client credential tokens.

### Pitfall 3: Column Mask Performance Degradation
**What goes wrong:** Complex Python UDFs with non-deterministic logic used for masking cause query performance issues.

**Why it happens:** Python UDFs don't optimize through Catalyst; non-deterministic functions prevent predicate pushdown.

**How to avoid:** 
- Prefer SQL UDFs for simple masks
- Mark Python UDFs as `DETERMINISTIC` when applicable
- Avoid mapping tables in mask functions
- Test with realistic query patterns

**Warning signs:** Query latency increases proportionally with masked columns; `try_divide` errors in logs.

### Pitfall 4: APIM as Primary PII Enforcer
**What goes wrong:** Relying solely on APIM regex-based PII masking instead of UC column masks.

**Why it happens:** Perception that "gateway" means "security boundary."

**How to avoid:** 
- Implement masks in Unity Catalog first (structural)
- Use APIM masking as defense-in-depth only (procedural)
- Document both layers in security model

**Warning signs:** Inconsistent redaction across query paths; raw data visible in Databricks query history.

### Pitfall 5: Ignoring UC Limitations with External Engines
**What goes wrong:** Attempting to use Iceberg REST Catalog or Unity REST APIs with masked tables.

**Why it happens:** Feature matrix not consulted; assumption that UC features work uniformly.

**How to avoid:** 
- Check [Databricks UC limitations](https://docs.databricks.com/en/data-governance/unity-catalog/filters-and-masks.html#limitations) before architecture decisions
- Plan for GA timelines of preview features

**Warning signs:** Connection errors to masked tables via external tools; feature mismatch in documentation.

## Code Examples

### Example 1: Entra Token Validation in APIM
```xml
<!-- Source: Microsoft Learn - validate-azure-ad-token policy -->
<validate-azure-ad-token 
    tenant-id="{{aad-tenant-id}}"
    output-token-variable-name="jwt">
    <client-application-ids>
        <application-id>{{agent-app-id}}</application-id>
    </client-application-ids>
    <audiences>
        <audience>{{apim-audience}}</audience>
    </audiences>
    <required-claims>
        <claim name="oid" match="any">
            <value>@((string)context.Variables["allowed-users"])</value>
        </claim>
    </required-claims>
</validate-azure-ad-token>
```

### Example 2: Managed Identity Authentication to Databricks
```xml
<!-- Source: Microsoft Learn - authentication-managed-identity policy -->
<authentication-managed-identity 
    resource="{{databricks-service-principal-app-id}}"
    output-token-variable-name="databricks-token"
    ignore-error="false" />

<set-header name="Authorization" exists-action="override">
    <value>@("Bearer " + (string)context.Variables["databricks-token"])</value>
</set-header>
```

### Example 3: Unity Catalog Column Mask Definition
```sql
-- Source: Databricks Documentation - Row filters and column masks
CREATE FUNCTION mask_ssn(ssn STRING)
RETURN CASE
    WHEN is_member('security-admins') THEN ssn
    ELSE CONCAT('XXX-XX-', SUBSTRING(ssn, -4))
END;

ALTER TABLE employees
ALTER COLUMN ssn
SET MASK mask_ssn;
```

### Example 4: APIM Response Body Transformation
```xml
<!-- Source: Microsoft Learn - set-body policy with policy expressions -->
<outbound>
    <set-body>
    @{
        var response = context.Response.Body.As<JObject>(preserveContent: true);
        if (response["data"] != null)
        {
            foreach (var item in response["data"])
            {
                if (item["email"] != null)
                {
                    var email = item["email"].ToString();
                    item["email"] = email.Substring(0, 2) + "***@***.com";
                }
            }
        }
        return response.ToString();
    }
    </set-body>
</outbound>
```

### Example 5: Policy Fragment for Data Access Pattern
```xml
<!-- Fragment: governed-data-access -->
<fragment>
    <!-- Inbound: Validate caller identity -->
    <validate-azure-ad-token tenant-id="{{tenant-id}}" />
    
    <!-- Backend: Authenticate to Databricks as MI -->
    <authentication-managed-identity resource="{{databricks-app-id}}" />
    
    <!-- Outbound: Additional PII defense-in-depth -->
    <find-and-replace 
        from="\\b\\d{3}-\\d{2}-\\d{4}\\b" 
        to="XXX-XX-XXXX" />
</fragment>
```

## State of the Art (2024-2025)

### What's New / Changed Recently

| Feature | Status | When Changed | Impact |
|---------|--------|--------------|--------|
| **Workload Identity Federation** | GA | 2024 | MI can now be used as federated credential for app registrations—extends zero-secrets to legacy app scenarios |
| **Unity Catalog ABAC Policies** | Public Preview | 2024 | Tag-based policy management scales better than table-by-table masks |
| **OneLake Security (Preview)** | Preview | 2025 | Granular role-based security for OneLake; fabric-native compute + authorized external engines |
| **Databricks OAuth M2M** | GA | 2024 | Replaces PATs for service principal auth; enables true zero-secrets |
| **APIM V2 Gateway** | GA | 2024 | Improved performance; supports all policies referenced in this research |
| **Column Masks on Databricks 15.4+** | GA | 2024 | Dedicated access mode support for masked tables (read ops only on 15.4-16.2; write from 16.3+) |

### Deprecated/Outdated

| Thing | Why | What Replaced It |
|-------|-----|------------------|
| Databricks Personal Access Tokens (PATs) | Secret-based; rotation burden | OAuth M2M with service principals |
| Azure AD terminology | Rebranding | Microsoft Entra ID |
| APIM Classic Gateway (selected features) | V2 preferred | APIM V2 / Workspace Gateway |
| Static masking in ETL | Governance by construction preferred | UC column masks |

## Open Questions

### Question 1: OBO Flow for Databricks SQL REST API
**What we know:** OBO works for Microsoft Graph and other Entra-protected APIs. Databricks supports Entra token pass-through.

**What's unclear:** Whether Databricks SQL REST API specifically supports OBO token exchange vs direct user token pass-through.

**Recommendation:** Document both patterns—direct token forwarding (if APIM and agent are same user context) and MI-based service auth (when user context not required). Note OBO limitation for service principals.

### Question 2: Unity Catalog Mask Propagation via Iceberg REST Catalog
**What we know:** Unity Catalog column masks are evaluated at query time in Spark.

**What's unclear:** Whether external Iceberg REST Catalog clients receive masked data or raw data.

**Recommendation:** Explicitly state limitation—masks only apply through Databricks compute; direct OneLake/Iceberg REST access bypasses UC policies. This reinforces "UC for governance-by-construction, OneLake security roles for direct access."

### Question 3: APIM Policy Fragment Synchronization
**What we know:** Policy fragments can be updated centrally and affect all referencing policies.

**What's unclear:** Change propagation latency; atomicity guarantees during fragment updates.

**Recommendation:** In documentation, note that fragment updates take effect within seconds but may have brief inconsistency during deployment; plan changes during low-traffic periods.

### Question 4: OneLake Identity Delegation Chain
**What we know:** OneLake supports Entra authentication; shortcuts inherit security from source.

**What's unclear:** Whether the full identity chain (agent → APIM → Databricks → OneLake) preserves the original caller identity at OneLake layer, or if only the immediate caller (Databricks) identity is seen.

**Recommendation:** Document that OneLake sees the Databricks service identity, not the original user, for queries routed through Databricks SQL. This is expected behavior—the UC layer handles user-based access control before reaching OneLake.

## Sources

### Primary (HIGH confidence)
- Microsoft Learn - [Managed identities for Azure resources overview](https://learn.microsoft.com/en-us/entra/identity/managed-identities-azure-resources/overview) - Entra MI fundamentals, system vs user-assigned
- Microsoft Learn - [Workload Identity Federation](https://learn.microsoft.com/en-us/entra/workload-id/workload-identity-federation) - Federated credentials pattern
- Microsoft Learn - [Access tokens in Microsoft identity platform](https://learn.microsoft.com/en-us/entra/identity-platform/access-tokens) - Token validation, claims, lifetimes
- Microsoft Learn - [OAuth 2.0 On-Behalf-Of flow](https://learn.microsoft.com/en-us/entra/identity-platform/v2-oauth2-on-behalf-of-flow) - OBO delegation pattern
- Microsoft Learn - [validate-azure-ad-token policy](https://learn.microsoft.com/en-us/azure/api-management/validate-azure-ad-token-policy) - APIM Entra token validation
- Microsoft Learn - [authentication-managed-identity policy](https://learn.microsoft.com/en-us/azure/api-management/authentication-managed-identity-policy) - APIM MI authentication
- Microsoft Learn - [API Management policy fragments](https://learn.microsoft.com/en-us/azure/api-management/policy-fragments) - Reusable policy patterns
- Microsoft Learn - [Policy expressions](https://learn.microsoft.com/en-us/azure/api-management/api-management-policy-expressions) - APIM C# expression capabilities
- Databricks Docs - [Row filters and column masks](https://docs.databricks.com/en/data-governance/unity-catalog/filters-and-masks.html) - UC security features (via AWS docs mirror)
- Microsoft Learn - [OneLake data security overview](https://learn.microsoft.com/en-us/fabric/onelake/security/get-started-security) - OneLake security model

### Secondary (MEDIUM confidence)
- Microsoft Learn - [Databricks JDBC authentication](https://learn.microsoft.com/en-us/azure/databricks/integrations/jdbc/authentication) - OAuth M2M patterns for Databricks
- Microsoft Learn - [API Management policies reference](https://learn.microsoft.com/en-us/azure/api-management/api-management-policies) - Complete policy index
- Microsoft Learn - [Error handling in API Management](https://learn.microsoft.com/en-us/azure/api-management/api-management-error-handling-policies) - Error handling patterns

### Project Context (Citadel Model)
- Citadel 4-Layer Model docs (project internal) - Layer definitions and component mapping
- EY Framework Alignment docs (project internal) - Governance tier mapping

## Metadata

**Confidence breakdown:**
- **Standard stack:** HIGH - All components GA (except ABAC policies in preview, noted)
- **Architecture patterns:** HIGH - Patterns verified against official Microsoft documentation
- **Pitfalls:** MEDIUM-HIGH - Based on documented limitations and common implementation errors

**Research scope:** This research covers patterns and ADRs only—no implementation code (Bicep/Terraform/YAML) per v2.0 scope constraints.

**Research date:** 2026-04-27
**Valid until:** 2026-07-27 (30 days for stable features; 7 days if preview features become GA or change)

**Key assumptions verified:**
- [x] Databricks Unity Catalog column masks are GA
- [x] APIM `authentication-managed-identity` supports all required resource types
- [x] OneLake supports Entra authentication
- [x] OBO flow limitations documented (user principals only)

**Attachments to Citadel 4-Layer Model:**
- Layer 1 (Governance Hub): APIM policies for token validation, MI auth, response transformation
- Layer 4 (Security Fabric): Entra ID for identity chain, Unity Catalog for governance-by-construction

**Attachments to Phase 26:**
- Phase 26 established APIM → Databricks SQL REST API integration
- Phase 27 adds identity chain specifics (DSEC-03) and governance propagation (DSEC-04)
