# anatomy.md

> Auto-maintained by OpenWolf. Last scanned: 2026-04-10T10:59:36.790Z
> Files: 256 tracked | Anatomy hits: 0 | Misses: 0

## ./

- `.gitignore` — Git ignore rules (~1925 tok)
- `azure.yaml` — Application name (~75 tok)
- `CLAUDE.md` — OpenWolf (~57 tok)
- `LICENSE` — Project license (~286 tok)
- `README.md` — Project documentation (~4549 tok)

## .azdo/pipelines/

- `azure-dev.yml` — Run when commits are pushed to main (~476 tok)

## .claude/

- `settings.json` (~441 tok)

## .claude/rules/

- `openwolf.md` (~313 tok)

## .planning/

- `STATE.md` — Project Reference (~1637 tok)

## .planning/phases/04-implementation-guides/

- `04-01-SUMMARY.md` — Phase 4 Plan 1: Getting Started Guides Summary (~1314 tok)
- `04-02-SUMMARY.md` — Dependency graph (~1304 tok)

## assets/

- `azure-openai-landing-zone.drawio` (~126408 tok)

## bicep/infra/

- `abbreviations.json` (~1544 tok)
- `main.bicep` — Declares for (~14055 tok)
- `main.bicepparam` (~4205 tok)
- `main.parameters.dev.bicepparam` (~413 tok)
- `main.parameters.prod.bicepparam` (~876 tok)

## bicep/infra/apim-gateway-upgrade/

- `main.bicep` (~5930 tok)
- `main.bicepparam` (~1122 tok)
- `README.md` — Project documentation (~1673 tok)

## bicep/infra/citadel-access-contracts/

- `citadel-access-contracts-policy.md` — AI Citadel Access Contracts Policy (~4125 tok)
- `main.bicep` (~2399 tok)
- `main.bicepparam` (~4654 tok)
- `README.md` — Project documentation (~6645 tok)

## bicep/infra/citadel-access-contracts/base-access-contract-request/

- `access-contract-request.schema.json` (~3868 tok)
- `main.bicep` (~3823 tok)
- `main.bicepparam` (~242 tok)
- `policy-master-template.xml` (~79 tok)
- `README.md` — Project documentation (~3947 tok)

## bicep/infra/citadel-access-contracts/base-access-contract-request/examples/hr-agent/

- `access-contract-request.json` (~947 tok)
- `main.bicepparam` (~255 tok)

## bicep/infra/citadel-access-contracts/base-access-contract-request/examples/sales-agent/

- `access-contract-request.json` (~365 tok)
- `main.bicepparam` (~240 tok)

## bicep/infra/citadel-access-contracts/base-access-contract-request/snippets/

- `alerts-throttling.xml` (~161 tok)
- `capacity-per-model-entry.xml` (~146 tok)
- `capacity-per-model-wrapper.xml` (~176 tok)
- `capacity-subscription-level.xml` (~112 tok)
- `content-safety-category.xml` (~22 tok)
- `content-safety.xml` (~84 tok)
- `model-access.xml` (~58 tok)
- `model-extraction.xml` (~38 tok)
- `pii-anonymization-inbound.xml` (~316 tok)
- `pii-blocking-inbound.xml` (~872 tok)
- `pii-deanonymization-outbound.xml` (~265 tok)
- `pii-regex-entry.xml` (~52 tok)
- `pii-state-saving.xml` (~142 tok)
- `usage-tracking.xml` (~237 tok)

## bicep/infra/citadel-access-contracts/contracts/compliance-piiblocking/dev/

- `ai-product-policy.xml` (~1184 tok)
- `main.bicepparam` (~356 tok)

## bicep/infra/citadel-access-contracts/contracts/hr-chatagent/dev/

- `ai-product-policy.xml` (~783 tok)
- `main.bicepparam` (~437 tok)

## bicep/infra/citadel-access-contracts/contracts/hr-piimasking/dev/

- `ai-product-policy.xml` (~1082 tok)
- `main.bicepparam` (~356 tok)

## bicep/infra/citadel-access-contracts/contracts/sales-assistant/dev/

- `ai-product-policy.xml` (~783 tok)
- `main.bicepparam` (~348 tok)

## bicep/infra/citadel-access-contracts/contracts/support-bot/dev/

- `ai-product-policy.xml` (~783 tok)
- `main.bicepparam` (~373 tok)

## bicep/infra/citadel-access-contracts/modules/

- `apimOnboardService.bicep` (~710 tok)
- `apimProduct.bicep` (~538 tok)
- `apimSubscription.bicep` (~309 tok)
- `foundryConnection.bicep` (~1502 tok)
- `kvSecrets.bicep` (~163 tok)

## bicep/infra/citadel-access-contracts/policies/

- `default-ai-product-policy.xml` (~617 tok)

## bicep/infra/citadel-access-contracts/samples/customer-support-agent/

- `policy.xml` (~620 tok)
- `usecase.bicepparam` (~703 tok)

## bicep/infra/citadel-access-contracts/samples/document-analysis-pipeline/

- `doc-policy.xml` — Declares routing (~1631 tok)
- `oai-policy.xml` — Declares for (~2446 tok)
- `README.md` — Project documentation (~748 tok)
- `usecase.bicepparam` (~722 tok)

## bicep/infra/citadel-access-contracts/samples/healthcare-chatbot/

- `policy.xml` (~618 tok)
- `README.md` — Project documentation (~970 tok)
- `usecase.bicepparam` (~682 tok)

## bicep/infra/foundry-integration/

- `connection-apim.bicep` — Declares used (~2177 tok)
- `main.bicep` — Declares used (~2696 tok)
- `main.bicepparam` (~647 tok)
- `README.md` — Project documentation (~2488 tok)

## bicep/infra/foundry-integration/modules/

- `apim-connection-common.bicep` (~902 tok)

## bicep/infra/foundry-integration/samples/

- `custom-auth.bicepparam` (~885 tok)
- `custom-headers.bicepparam` (~771 tok)
- `dynamic-discovery.bicepparam` (~782 tok)
- `full-config.bicepparam` (~1332 tok)
- `parameters-custom-auth-config.json` (~400 tok)
- `parameters-custom-headers.json` (~404 tok)
- `parameters-dynamic-discovery.json` (~327 tok)
- `parameters-static-models.json` (~437 tok)
- `static-models.bicepparam` (~762 tok)

## bicep/infra/llm-backend-onboarding/

- `main.bicep` (~1968 tok)
- `main.bicepparam` (~2060 tok)
- `README.md` — Project documentation (~4206 tok)

## bicep/infra/llm-backend-onboarding/modules/

- `llm-backend-pools.bicep` — PARAMETERS (~1190 tok)
- `llm-backends.bicep` — PARAMETERS (~843 tok)
- `llm-policy-fragments.bicep` — PARAMETERS (~2019 tok)
- `universal-llm-api.bicep` — @module universal-llm-api (~893 tok)

## bicep/infra/llm-backend-onboarding/modules/policies/

- `frag-get-available-models.xml` (~776 tok)
- `frag-set-backend-authorization.xml` — Declares Expected (~1315 tok)
- `frag-set-backend-pools.xml` (~404 tok)
- `frag-set-llm-requested-model.xml` (~1061 tok)
- `frag-set-llm-usage.xml` (~495 tok)
- `frag-set-target-backend-pool.xml` — Declares of (~2661 tok)
- `models-inference-openapi.json` (~1616 tok)
- `universal-llm-api-policy.xml` (~1007 tok)
- `universal-llm-openapi.json` (~2285 tok)

## bicep/infra/modules/

- `azure-roles.json` (~168 tok)

## bicep/infra/modules/ai/

- `cognitiveservices.bicep` (~733 tok)

## bicep/infra/modules/apic/

- `apic-metadata.json` — Declares and (~1336 tok)
- `apic.bicep` — PARAMETERS (~1678 tok)
- `remote-mcp-servers-SAMPLES.json` (~756 tok)
- `remote-mcp-servers.json` (~6 tok)
- `servers.json` (~888 tok)

## bicep/infra/modules/apim/

- `api-center-onboarding.bicep` — PARAMETERS (~1280 tok)
- `api.bicep` — Declares of (~1744 tok)
- `apim.bicep` — LLM Backend Configuration (~10826 tok)
- `inference-api.bicep` — PARAMETERS (~2150 tok)
- `inference-backend.bicep` — PARAMETERS (~978 tok)
- `llm-backend-pools.bicep` (~1292 tok)
- `llm-backends.bicep` — PARAMETERS (~1209 tok)
- `llm-policy-fragments.bicep` — PARAMETERS (~2235 tok)
- `llm-policy-fragments.json` — Declares of (~8038 tok)
- `mcp-existing.bicep` (~606 tok)
- `mcp-from-api.bicep` (~779 tok)
- `policy-fragments.bicep` — PARAMETERS (~1438 tok)
- `README-llm-backends.md` — LLM Backend Modules (~2430 tok)

## bicep/infra/modules/apim/ai-model-inference/

- `ai-model-inference-api-spec.yaml` — Declares created (~7020 tok)

## bicep/infra/modules/apim/ai-search-api/

- `ai-search-api-spec.yaml` — Declares with (~20878 tok)
- `ai-search-index-2024-07-01-api-spec.json` — Declares with (~25337 tok)
- `ai-search-service-2024-07-01-api-spec.json` (~113368 tok)
- `Azure AI Search Service API.openapi.yaml` (~81722 tok)

## bicep/infra/modules/apim/doc-intel-api/

- `document-intelligence-2024-11-30-compressed.openapi.yaml` (~31640 tok)
- `document-intelligence-2024-11-30.json` (~46834 tok)
- `document-intelligence-2024-11-30.openapi.yaml` (~37382 tok)

## bicep/infra/modules/apim/language-api/

- `language-api-2024-11-01.json` — Declares Microsoft (~78676 tok)

## bicep/infra/modules/apim/openai-api/

- `oai-api-spec-2024-02-01.yaml` (~26629 tok)
- `oai-api-spec-2024-05-01-preview.yaml` (~92836 tok)
- `oai-api-spec-2024-06-01.yaml` (~27816 tok)
- `oai-api-spec-2024-10-21.yaml` — Declares of (~30453 tok)
- `oai-realtime-api-ws.json` (~299 tok)
- `OpenAI-Import.openapi.yaml` — Declares of (~155267 tok)

## bicep/infra/modules/apim/policies/

- `ai-model-inference-api-policy.xml` (~182 tok)
- `ai-search-index-api-policy.xml` (~164 tok)
- `ai-search-service-api-policy.xml` (~164 tok)
- `azure-open-ai-api-policy.xml` (~1520 tok)
- `doc-intelligence-api-policy.xml` (~985 tok)
- `frag-aad-auth-custom.xml` (~742 tok)
- `frag-aad-auth.xml` (~332 tok)
- `frag-ai-foundry-compatibility.xml` (~162 tok)
- `frag-ai-foundry-deployments.xml` (~940 tok)
- `frag-ai-usage.xml` (~729 tok)
- `frag-entra-auth.xml` (~742 tok)
- `frag-get-available-models.xml` (~776 tok)
- `frag-llm-usage.xml` (~1036 tok)
- `frag-openai-usage-streaming.xml` (~1201 tok)
- `frag-openai-usage.xml` (~1098 tok)
- `frag-pii-anonymization.xml` (~2872 tok)
- `frag-pii-deanonymization.xml` (~255 tok)
- `frag-pii-state-saving.xml` (~2582 tok)
- `frag-raise-throttling-events.xml` (~283 tok)
- `frag-set-backend-authorization.xml` — Declares Expected (~1315 tok)
- `frag-set-backend-pools.xml` (~404 tok)
- `frag-set-llm-requested-model.xml` (~1061 tok)
- `frag-set-llm-usage.xml` (~495 tok)
- `frag-set-target-backend-pool.xml` — Declares of (~2661 tok)
- `frag-throttling-events.xml` (~224 tok)
- `frag-validate-model-access.xml` (~927 tok)
- `mcp-default-policy.xml` (~111 tok)
- `openai_api_policy_dynamic_throttling.xml` (~2665 tok)
- `openai_api_policy.xml` (~2241 tok)
- `openai-realtime-policy.xml` (~519 tok)
- `product-llm-oauth-access.xml` (~427 tok)
- `translator-api-policy.xml` (~255 tok)
- `universal-llm-api-deployment-by-name-policy.xml` (~842 tok)
- `universal-llm-api-deployments-policy.xml` (~297 tok)
- `universal-llm-api-policy-v2.xml` (~1101 tok)

## bicep/infra/modules/apim/sample/weather/

- `openapi.json` (~1373 tok)
- `policy.xml` (~514 tok)

## bicep/infra/modules/apim/speech-api/

- `speech-api-3-1.json` (~63889 tok)

## bicep/infra/modules/apim/translator-api/

- `translator-api-spec.yaml` (~17305 tok)

## bicep/infra/modules/apim/universal-llm-api/

- `AIFoundryAzureAI.json` (~23736 tok)
- `AIFoundryOpenAI.json` — Declares of (~167933 tok)
- `PassThrough.json` (~813 tok)
- `Universal-LLM-API.openapi.yaml` (~254744 tok)
- `Universal-LLM-Basic-API.openapi.yaml` — Declares function (~19490 tok)

## bicep/infra/modules/cosmos-db/

- `cosmos-db.bicep` (~1952 tok)

## bicep/infra/modules/event-hub/

- `event-hub.bicep` (~1135 tok)

## bicep/infra/modules/foundry/

- `deployments.bicep` (~176 tok)
- `foundry.bicep` — PARAMETERS (~2955 tok)

## bicep/infra/modules/functionapp/

- `functionapp.bicep` — Declares to (~1176 tok)
- `storageaccount.bicep` (~1314 tok)

## bicep/infra/modules/keyvault/

- `keyvault-rbac.bicep` (~442 tok)
- `keyvault.bicep` (~1283 tok)

## bicep/infra/modules/logicapp/

- `api-connection-access.bicep` (~160 tok)
- `api-connection.json` (~610 tok)
- `logicapp.bicep` (~1873 tok)

## bicep/infra/modules/monitor/

- `applicationinsights-dashboard.bicep` (~11662 tok)
- `applicationinsights.bicep` (~455 tok)
- `loganalytics.bicep` (~506 tok)
- `monitoring.bicep` (~1416 tok)

## bicep/infra/modules/networking/

- `dns.bicep` (~70 tok)
- `private-endpoint-multi-dns.bicep` (~782 tok)
- `private-endpoint.bicep` (~568 tok)
- `subnet.bicep` (~92 tok)
- `vnet-existing.bicep` (~360 tok)
- `vnet.bicep` (~2245 tok)

## bicep/infra/modules/redis/

- `redis.bicep` (~1407 tok)

## bicep/infra/modules/security/

- `managed-identity-apim.bicep` (~706 tok)
- `managed-identity-usage.bicep` (~433 tok)

## docs/getting-started/

- `prerequisites.mdx` — Prerequisites (~5343 tok)
- `quick-start.mdx` — Quick-Start Guide (~4704 tok)
- `roles-and-responsibilities.mdx` — Roles and Responsibilities (~6903 tok)

## docs/guides/

- `bicep-modules.mdx` — Bicep Modules Reference (~6409 tok)
- `deployment-checklist.mdx` — Deployment Checklist (~4842 tok)
- `deployment-guide.mdx` — Deployment Guide (~6853 tok)
- `validation-checklist.mdx` — Validation Checklist (~5147 tok)

## guides/

- `citadel-sizing-guide.md` — AI Citadel Governance Hub sizing guide (~962 tok)
- `entraid-auth-validation.md` — Understanding JWT Token Authentication with Microsoft Entra ID (~2411 tok)
- `full-deployment-guide.md` — 🏗️ Full Deployment Guide - All Environments (~8060 tok)
- `governance-hub-benefits.md` — Citadel Governance Hub Benefits (~2372 tok)
- `LLM-Backend-Onboarding-Guide.md` — LLM Backend Onboarding Guide (~2367 tok)
- `llm-routing-architecture.md` — LLM Routing Architecture Guide (~3879 tok)
- `network-approach.md` — Network Architecture (~4934 tok)
- `parameters-usage-guide.md` — Using Bicep Parameter Files for Deployment (~3242 tok)
- `pii-masking-apim.md` — PII Anonymization & Deanonymization (~11382 tok)
- `power-bi-dashboard.md` — Power BI Dashboard (~1236 tok)
- `put-estimation-guide.md` — Azure OpenAI / Foundry LLM Sizing Guide (PTU vs Pay-as-you-Go) (~2177 tok)
- `quick-deployment-guide.md` — 🚀 Quick Deployment Guide - Non-Production (~1621 tok)
- `throttling-events-handling.md` — Throttling Events Handling (~1150 tok)

## scripts/

- `apim-event-hub-logger.ps1` — ####### (~411 tok)
- `azure-key-vault-certificate-import.sh` — Sample execution command: (~774 tok)

## shared/

- `apimtools.py` — APIMClientTool: initialize, discover_api, get_debug_credentials, get_trace + 3 more (~4427 tok)
- `requirements.txt` — Python dependencies (~200 tok)
- `utils.py` — Define ANSI escape code constants vor clarity in the print commands below (~6348 tok)

## shared/snippets/

- `api-http-requests.py` (~733 tok)
- `create-az-deployment.py` — type: ignore (~404 tok)
- `create-az-resource-group.py` — type: ignore (~95 tok)
- `deployment-outputs.py` — type: ignore (~638 tok)
- `openai-api-requests.py` (~280 tok)
- `README.md` — Project documentation (~363 tok)

## src/testing/

- `openai-testing.http` (~296 tok)

## src/usage-ingestion-logicapp/

- `.funcignore` (~32 tok)
- `connections.json` (~391 tok)
- `host.json` (~86 tok)
- `package.json` — Node.js package manifest (~1 tok)

## src/usage-ingestion-logicapp/ai-usage-ingestion/

- `workflow.json` (~495 tok)

## src/usage-ingestion-logicapp/ai-usage-streaming-ingestion/

- `workflow.json` (~4375 tok)

## src/usage-ingestion-logicapp/llm-usage-ingestion/

- `workflow.json` (~4290 tok)

## src/usage-ingestion-logicapp/pii-usage-ingestion/

- `workflow.json` (~477 tok)

## src/usage-ingestion-logicapp/workflow-designtime/

- `host.json` (~81 tok)

## src/usage-reports/

- `AI-Hub-Gateway-Usage-Report-v1-5-Incremetal.pbix` (~180958 tok)
- `AI-Search-Cost-Estimation-Logic.md` — Azure AI Search Cost Estimation (~242 tok)
- `model-pricing.json` (~667 tok)
- `usage-record.json` (~252 tok)

## validation/

- `citadel-access-contracts-tests.ipynb` (~10991 tok)
- `citadel-agent-frameworks-tests.ipynb` (~19395 tok)
- `citadel-pii-processing-tests.ipynb` (~15281 tok)
- `llm-backend-onboarding-runner.ipynb` (~11893 tok)
- `README.md` — Project documentation (~3990 tok)
- `requirements.txt` — Python dependencies (~191 tok)
