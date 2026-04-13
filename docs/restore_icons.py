import os
import re

# Comprehensive icon map from internal Card components
icon_map = {
    "/agent-factory/overview": "robot",
    "/agent-factory/intelligence-layers": "brain",
    "/agent-factory/builder-personas": "users",
    "/agent-factory/citadel-mapping": "castle",
    "/agent-factory/agentic-web-stack": "layers",
    "/agent-factory/agentic-stack-diagrams": "sitemap",
    "/agent-factory/design-patterns": "wand-magic-sparkles",
    "/agent-factory/orchestration-patterns": "git-branch",
    "/agent-factory/mcp-integration": "plug",
    "/agent-factory/a2a-integration": "arrows-left-right",
    "/agent-factory/agent-security-blueprint": "shield",
    "/agent-factory/agent-observability": "chart-line",
    "/agent-factory/use-case-customer-support": "headset",
    "/agent-factory/use-case-employee-self-service": "headset",
    "/agent-factory/use-case-data-analytics": "chart-bar",
    "/agent-factory/use-case-sales-engagement": "briefcase",
    
    "/architecture/overview": "sitemap",
    "/architecture/citadel-4-layer-model": "sitemap",
    "/architecture/hub-spoke-overview": "network-wired",
    "/architecture/core-components": "puzzle-piece",
    "/architecture/security": "lock",
    "/architecture/layer-1-governance-hub": "building-columns",
    "/architecture/layer-2-control-plane": "layer-group",
    "/architecture/layer-3-agent-identity": "id-card",
    "/architecture/layer-4-security-fabric": "shield",
    "/architecture/networking": "network-wired",
    "/architecture/network-topology": "network-wired",
    "/architecture/network-security": "shield",
    "/architecture/vnet-peering": "link",
    
    "/governance/governance-overview": "book",
    "/governance/access-contracts": "file-contract",
    "/governance/policy-enforcement": "gavel",
    "/governance/identity-management": "id-card",
    "/governance/content-safety": "filter",
    "/governance/pii-protection": "shield-halved",
    "/governance/security-compliance": "shield-check",
    
    "/business-value/index": "chart-line",
    "/business-value/executive-summary": "file-lines",
    "/business-value/roi-framework": "calculator",
    "/business-value/compliance-value": "shield-halved",
    
    "/implementation/index": "tools",
    "/implementation/deployment": "rocket",
    "/implementation/configuration": "sliders",
    "/implementation/best-practices": "star",
    "/implementation/validation/index": "clipboard-check",
    "/implementation/validation/pre-deployment-checklist": "list-check",
    "/implementation/validation/post-deployment-validation": "check-circle",
    "/implementation/validation/troubleshooting": "wrench",
    "/implementation/integration/foundry-control-plane": "server",
    
    "/guides/deployment-guide": "rocket",
    "/guides/bicep-modules": "cube",
    "/guides/network-approach": "network-wired",
    "/guides/deployment-checklist": "list-check",
    "/guides/validation-checklist": "check-circle",
    "/guides/configuration-examples": "gear",
    "/guides/troubleshooting": "wrench",
    "/guides/common-issues": "bug",
    "/guides/best-practices": "star",
    "/guides/architecture/networking": "network-wired",
    "/guides/architecture/llm-routing": "route",
    "/guides/features/pii-masking": "shield-halved",
    "/guides/features/llm-backend-onboarding": "plug",
    "/guides/features/throttling-handling": "gauge-high",
    "/guides/operations/citadel-sizing": "ruler-combined",
    "/guides/operations/estimation-guide": "calculator",
    "/guides/operations/power-bi-dashboard": "chart-line",
    "/guides/operations/scripts-reference": "terminal",
    "/guides/operations/usage-analytics": "chart-pie",
    "/guides/reference/entraid-auth": "key",
    "/guides/reference/governance-benefits": "scale-balanced",
    "/guides/deployment/quick-start": "rocket",
    "/guides/deployment/full-deployment": "server",
    "/guides/deployment/parameters": "sliders",
    "/guides/development/testing-tools": "vial",
    "/guides/development/shared-resources": "share-nodes",
    
    "/getting-started/quick-start": "rocket",
    "/getting-started/concepts": "book-open",
    "/getting-started/roles-and-responsibilities": "users",
    "/getting-started/prerequisites": "clipboard-check",
    "/getting-started/introduction": "book",
    "/getting-started/quickstart": "bolt",
    
    "/operations/monitoring": "chart-line",
    "/operations/maintenance": "wrench",
    "/operations/troubleshooting": "wrench",
    "/operations/runbooks": "book-open",
    "/operations/index": "server",
    "/operations/runbooks/index": "book",
    
    "/ai-patterns/overview": "wand-magic-sparkles",
    "/ai-patterns/foundry-integration": "cloud",
    "/ai-patterns/apim-reference": "server",
    "/ai-patterns/pattern-comparison": "scale-balanced"
}

docs_dir = "."

def fix_frontmatter(filepath, icon):
    with open(filepath, 'r') as f:
        lines = f.readlines()
    
    if not lines or lines[0].strip() != "---":
        return False
        
    # Find the closing ---
    closing_index = -1
    for i in range(1, len(lines)):
        if lines[i].strip() == "---":
            closing_index = i
            break
            
    if closing_index == -1:
        return False
        
    # Check if icon already exists
    has_icon = False
    for i in range(1, closing_index):
        if lines[i].startswith("icon:"):
            # Update the icon name (remove quotes if present)
            lines[i] = f"icon: {icon}\n"
            has_icon = True
            break
            
    if not has_icon:
        # Insert before the closing ---
        lines.insert(closing_index, f"icon: {icon}\n")
        
    with open(filepath, 'w') as f:
        f.writelines(lines)
    return True

for root, dirs, files in os.walk(docs_dir):
    for file in files:
        if file.endswith(".mdx") or file.endswith(".md"):
            filepath = os.path.join(root, file)
            relpath = os.path.relpath(filepath, docs_dir)
            match_path = "/" + os.path.splitext(relpath)[0]
            
            # Handle index files
            if match_path.endswith("/index"):
                alt_match_path = match_path[:-6]
            else:
                alt_match_path = match_path
                
            icon = icon_map.get(match_path) or icon_map.get(alt_match_path)
            
            # Special case for .md files that map to .mdx in docs.json
            if not icon and file.endswith(".md"):
                # Potential legacy mapping
                pass

            if icon:
                if fix_frontmatter(filepath, icon):
                    print(f"Fixed/Restored icon {icon} in {filepath}")
                else:
                    print(f"Failed to fix frontmatter in {filepath}")
            else:
                # Optional: log missing if interested
                pass
