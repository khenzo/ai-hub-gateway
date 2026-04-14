EY AI Agent Development Framework:
Comprehensive Standards Guide

Version: 1.5.2

Date: 17 Mar 2026

Table of Contents
Executive Summary ................................................................................................................................................... 4
1. Chapter 1: AI Agent Standards .............................................................................................................................. 5
1.1. Types of Agents ............................................................................................................................................... 5
1.2. Agent Development Spectrum........................................................................................................................... 5
1.3. Microsoft Stack ................................................................................................................................................ 6
1.4. NVIDIA Stack ................................................................................................................................................... 7
1.4.1. NVIDIA Environments ................................................................................................................................. 8
1.5. No-code and Low-code Development Approved Stack ....................................................................................... 11
1.5.1. Key Differences ....................................................................................................................................... 12
1.6. Pro-code Development Approved Stack ........................................................................................................... 13
1.6.1. Quick Cheat Sheet ................................................................................................................................... 14
1.6.2. When to Use Which .................................................................................................................................. 15
1.6.3. Key Differences ....................................................................................................................................... 16
1.6.4. Pro Tips .................................................................................................................................................. 16
1.7. AI Agent Development Platform Selection........................................................................................................ 17
1.7.1. Platform Capabilities and Suitability .......................................................................................................... 17
1.7.2. Representative Use Cases ........................................................................................................................ 18
1.7.3. What’s Next ............................................................................................................................................. 19
1.8. Agent Communication Protocols ..................................................................................................................... 20
1.8.1. Agent-to-Agent (A2A) .............................................................................................................................. 20
1.8.2. Model Context Protocol (MCP) .................................................................................................................. 21
1.9. Agent Deployment and Runtime ...................................................................................................................... 21
1.10. RAG Implementation Patterns ....................................................................................................................... 21
1.11. AI Language Models ..................................................................................................................................... 22
2. Chapter 2: What’s Next ........................................................................................................................................ 26
2.1. Agent Deployment and Runtime ...................................................................................................................... 26
2.2. AI Security/Guardrail ...................................................................................................................................... 26
2.3. AI Monitoring and Observability ...................................................................................................................... 27
3. Chapter 3: Agentic AI Governance Summary ........................................................................................................ 28
3.1. Two-Tiered Governance Approach ................................................................................................................... 28
3.2. RAI (Responsible AI) Overview ........................................................................................................................ 32
3.2.1. AIRA (AI Risk Assessment) ....................................................................................................................... 33
3.2.2. AI QRM (AI Quality Risk Management) ....................................................................................................... 33
3.2.3. Data Protection AI Assessment ................................................................................................................. 34
3.2.4. Information Security AI Assessment .......................................................................................................... 34
3.3. AI Factory Governance ................................................................................................................................... 34
3.4. EYQ Agent Onboarding Governance ................................................................................................................ 35
3.4.1. Pre-requisites for Copilot Studio Agent ..................................................................................................... 35
3.4.2. Agent Onboarding Steps .......................................................................................................................... 36
3.5. Microsoft Copilot Studio Agent Governance ..................................................................................................... 36
3.6. Process for releasing a Generally Available (GA) Agent ..................................................................................... 37

4. Chapter 4: Getting Started ................................................................................................................................... 39
4.1. M365 Copilot Agent Builder ............................................................................................................................ 39
4.1.1. Agent Builder in M365 Copilot .................................................................................................................. 39
4.1.2. Agent Builder in SharePoint Site ............................................................................................................... 39
4.2. Microsoft Copilot Studio Agent Builder ............................................................................................................ 41
4.3. Pro-code Agent Development.......................................................................................................................... 42
4.3.1. Azure OpenAI Offering with compute for AutoGen and Semantic Kernel - .NET ............................................ 43
4.3.2. Agent Development using AutoGen, LangGraph and Semantic Kernel - Python ............................................ 45
4.4. NVIDIA AI Compute ........................................................................................................................................ 48
4.5. Process for releasing a Generally Available (GA) Agent ..................................................................................... 48
4.6. EYQ API Specifications ................................................................................................................................... 48
4.6.1. APIs Built by Agent Development Team for EYQ Integration ....................................................................... 48
4.6.2. Platform API Specification for Agent Consumption ..................................................................................... 49
4.6.3. Agent Management API Specification ........................................................................................................ 50
4.6.4. Error Handling ......................................................................................................................................... 51
4.7. GitHub Repositories/Postman Collections ........................................................................................................ 51
4.8. Learning Resources ........................................................................................................................................ 52
5. Appendices.......................................................................................................................................................... 53
5.1. Applications ................................................................................................................................................... 53
5.2. Contact Matrix ............................................................................................................................................... 53
Administrative Provisions ........................................................................................................................................ 54
Document Summary .......................................................................................................................................... 54
Version History .................................................................................................................................................. 54
Signed Off By .................................................................................................................................................... 54

3

Executive Summary

As EY advances its AI-driven agent capabilities, we are leveraging three vendor provided technology stacks: Microsoft
(Copilot, MS Agent Framework, AutoGen, Semantic Kernel), LangChain (LangGraph) and NVIDIA (GPU-accelerated AI,
NeMo Framework). Each platform brings distinct strengths, making it essential to strategically determine when to use
one over the other — whether for rapid agent development, complex orchestration, or high-performance domain-specific
AI. EY will always look forward to exploring both open source and commercial products for specific needs.

This document intends to provide one aligned standard for the development of agents at EY that is in accordance with
EY’s Responsible AI Framework including our Responsible AI Global Policy and Responsible AI Principles as well as our
Data Protection and Information Security Policy Framework. This standard document will be updated periodically to
include newer technology standards.

By aligning each technology with the right scenarios, we can optimize efficiency, cost, and performance across our AI
agent initiatives. This document standardizes AI agent development at EY, covering:

•  Agent classification (5-tier taxonomy)
Technology selection (Microsoft/NVIDIA stacks)
•
•  API standards for EYQ marketplace integration
•
•

Pre-approved RAG patterns
End-to-end governance from development to deployment

Key Principles for selecting the right technology:

•  Reuse over rebuild: Leverage EY-certified Templates
•  Governance by design: Embedded compliance checks
•

Interoperability: REST API standards for marketplace agents

This standard document for agent development at EY serves to ensure consistency, quality, and security across all AI
projects. It defines the necessary technical requirements and protocols, covering acceptable technologies, specific coding
practices, and required security measures. This provides developers with a clear, reliable framework to build and deploy
agents, whether they are for internal use or broader client-facing applications. The document helps mitigate risks,
enables scalability, and facilitates future maintenance by establishing a uniform approach.

All EY personnel and approved third-party vendors involved in the development, deployment, or management of agents
must adhere to the standards. This ensures that all solutions meet the firm's global requirements for quality, risk, and
data security.

The standards apply to all agent development at EY, regardless of whether they are for internal use or are part of globally
available solutions. A universal standard ensures consistency across the firm's technological footprint, preventing
fragmentation and upholding the EY AI standard. It is a formal mandatory standard and a set of prescribed practices that
are required for compliance and successful AI deployment.

4

1. Chapter 1: AI Agent Standards

1.1. Types of Agents

There are different Types of Agents described from a simple agent to more sophisticated agents working together. The
below types of agents is a hierarchy of various levels of complexity in AI agentic design. This is by no means meant to be
extensive and cover all types of AI by function. Instead, we came up with widely general classifications of agents in terms
of how complex they are and the business problems they help to solve.

Types of Agents

Definition

Knowledge Assistants

Rule-based Q&A

Task Optimizers

Human-guided helpers

Example

HR policy chatbot

Excel Copilot

Autonomous Agents

Self-directed workflows

Pricing optimization

Teams of Agents

Collaborative agent groups that include agentic workflows
where a team of agents executes a sequential list of steps in
order or in parallel. There is always a human in the loop,
auditing the process.

Legal contract review team

Agentic Workforces

Full Organizations automation

Automated workflows

Please visit AI Agents Taxonomy | EYDX | Connect | EY Fabric for more information on types of agents with their use
cases.

1.2. Agent Development Spectrum

Agent Development Spectrum refers to the approaches used to build AI agents, categorized by the level of coding
required as summarized in the table below:

Agent Development
Spectrum

Definition

No-code Agents

Low-code Agents

Pro-code Agents

No-code agents are designed to be created and managed without the need for any programming skills.
These agents typically rely on intuitive graphical interfaces, allowing business users and subject matter
experts to configure workflows, logic, and integrations through drag-and-drop tools or simple selections.
This approach empowers non-technical staff to deploy and maintain AI-driven solutions efficiently,
accelerating adoption and innovation.

Low-code agents offer a balance between ease of use and technical capability. While they provide visual
development environments, they also allow users to incorporate limited custom code or scripting where
necessary. This enables users with basic coding knowledge to extend functionalities beyond standard
templates, making it possible to address more complex requirements without full-scale software
development.

Pro-code agents are intended for professional developers and technical teams. These agents are built using
traditional programming languages and frameworks, providing maximum flexibility and control over
features, integrations, and security. Pro-code agents are suitable for highly sophisticated solutions where
customization, scalability, and compliance are paramount, and where deep technical expertise is required
throughout the development and deployment lifecycle.

5

1.3. Microsoft Stack

Microsoft Technology Stack provides various options to develop and deploy agents, i.e. Agent Builder in M365 Copilot and
Microsoft Copilot Studio. You can refer to the decision tree below for a quick comparison between and Microsoft Copilot
Studio provided by Microsoft.

A quick comparison among Agent Builder in M365 Copilot, Microsoft Copilot Studio, EYQ Agent Studio (formerly EYX) and
Pro-Code agent development framework is summarized below:

Tool

Best Suited For

Types of Agents

Target Audience

Governance Requirements

Agent Builder
in M365
Copilot

No-code M365 chatbots

Microsoft
Copilot Studio

Low code chatbot

EYQ Agent
Studio
(formerly, EYX)

No-code agents (Meta-
prompt based)

Knowledge
Assistants, Task
Optimizers

Knowledge
Assistants, Task
Optimizers

Knowledge
Assistants, Task
Optimizers

Citizen Developer

Business User

M365 Copilot license, Power
Platform DLP (Data Loss
Prevention)

Microsoft Copilot Agent
Governance. Please refer to
Section 3.5

Business User

AI Factory Governance. Please
refer to Section 3.3

Microsoft
Agent
Framework
(Under preview,
expected GA -
General Availability
in Feb 2026)

Semantic
Kernel

Brings together the best
capabilities of AutoGen,
Semantic Kernel and
LangGraph.

Task Optimizers,
Autonomous
Agents, Teams of
Agents

Pro-code Developer  EYQ onboarding governance
for EYQ Marketplace. Please
refer to Section 3.4

Managing services and
plugins such as External
tools, APIs, and functions

Task Optimizers,
Autonomous
Agents

Pro-code Developer  EYQ onboarding governance
for EYQ Marketplace. Please
refer to Section 3.2

6

Is the scope of the agent broad (spans departments or the organization)?Does the agent support complex workflows (writing to systems, multi-step processes)?Does the agent require granular management controls (dev/test/prod environments, RBAC, telemetry)?Agent Builder in M365 CopilotMicrosoft Copilot StudioNoNoNoYesYesYes

Tool

Best Suited For

Types of Agents

Target Audience

Governance Requirements

AutoGen (will
retire after Microsoft
Agent Framework
GA)

LangGraph

that agents can use to
perform specific tasks

Conversable multi-agent
collaboration with pre-
defined agents i.e. Group
Chat, Assistant and
UserProxy for rapid
development

In-built Stateful workflows
where state flows through
the graph, carrying all
relevant information,
including messages,
variables, intermediate
results, and decision
history.

1.4. NVIDIA Stack

Autonomous
Agents, Teams of
Agents

Pro-code Developer  EYQ onboarding governance
for EYQ Marketplace. Please
refer to Section 3.2

Autonomous
Agents, Teams of
Agents

Pro-code Developer  EYQ onboarding governance
for EYQ Marketplace. Please
refer to Section 3.2

NVIDIA  technology  stack  is  more  suitable  for  High-Performance  GPU-Accelerated  Agents  requiring  ultra-low  latency,
Domain-Specific  Model  Training  &  Fine-Tuning,  Edge  Deployments  and  Large-scale  Multi-Agent  Simulations.  A  quick
summary of the NVIDIA tools is listed below:

Tool

NeMo

Riva

NIM

Best Suited For

Types of Agents

Target Audience

Custom LLM training

Data Scientist

Autonomous
Agents, Teams of
Agents, Agentic
Workforces

Real-time speech agents

Task Optimizers,
Autonomous Agents

Pro-Code Developer

Deployment of AI Models

Nemo Agent Toolkit

Blueprint to create AI
Agents

CuOpt

Optimization Engine

Enterprise RAG
Blueprint

Blueprint for Enterprise
RAG solution

Pro-Code Developer

Pro-Code Developer

Data Scientist

Pro-Code Developer

Autonomous
Agents, Teams of
Agents, Agentic
Workforces

Autonomous
Agents, Teams of
Agents, Agentic
Workforces

Autonomous
Agents, Teams of
Agents, Agentic
Workforces

Autonomous
Agents, Teams of
Agents, Agentic
Workforces

7

Tool

Best Suited For

Types of Agents

Target Audience

Data Flywheel

Blueprint for continuous
data integration

CuVector

Optimized libraries for
storing/processing the
vectorized content on GPUs

Pro-Code Developer

Pro-Code Developer

Autonomous
Agents, Teams of
Agents, Agentic
Workforces

Autonomous
Agents, Teams of
Agents, Agentic
Workforces

Please find the guidance document for balancing inference costs and performance with NVIDIA GPUs.

1.4.1. NVIDIA Environments

EY is actively exploring and working with the cloud providers and NVIDIA Cloud Partner ecosystem to make NVIDIA GPU
compute available in EY Managed Environment for consumption with pre-built NVIDIA tools, frameworks and language
models. The objective is to have more options with optimized costs with shared and dedicated compute catering to your
business needs. This journey started from Microsoft Azure, EY On Premise Global Data Center. Now it is expanding to Vultr
(NVIDIA Cloud Partner) and IBM Cloud.

Please find the below standard options available in EY to develop AI Solution using NVIDIA Compute.

Sandbox

Non-Prod (Dev, QA)

Staging/Production

Usage
Scenarios

Cloud
Providers

•

Exploration of NVIDIA tools
& frameworks as outlined in
previous section
•  Proof of concepts for
internal and external
customers

•  Developing solutions with

•

non-production data for
internal and external
customers

•  Proof of concepts for
internal and external
customers

•  Microsoft Azure

•  Microsoft Azure

Infrastructure   •

Shared across multiple
teams and service lines
•  Access is enabled based on
priority business cases

•  Dedicated to the
requested team

Cost Model

•  No cost (under review)

•

Pay as per consumption.
Please refer to the pricing
model

Internal production
applications

•  Dedicated Client Solutions
•  Managed Services model

across multiple clients (under
review)

•  Vultr (NVIDIA Cloud partner)
•  Microsoft Azure (by FY26 Q3)
IBM Cloud (under review)
•

•  Dedicated to the requested

•

•

team
Shared Infrastructure for
multiple clients in a managed
services model (under review)

Pay as per consumption.
Please refer to the pricing
model

•  Alternate cost model for
Managed Services (TBD)

Language
Models

•

EY approved models i.e.
Nemotron 9B V2 (H), GPT
OSS 20B/120B
•  Mistral 7B/12B/24B,
planned for FY26 Q3
•  Developers will have the
flexibility to try other

•

EY approved models i.e.
Nemotron 9B V2 (H), GPT
OSS 20B/120B,
•  Mistral 7B/12B/24B,
planned for FY26 Q3
•  Developers have the
flexibility to try other

•

EY approved models i.e.
Nemotron 9B V2 (H), GPT
OSS 20B/120B,

•  Mistral 7B/12B/24B, planned

for FY26 Q3

•  Any models identified and
approved within non-prod

8

Sandbox

Non-Prod (Dev, QA)

Staging/Production

models in compliance with
EY processes

models in compliance with
EY processes

environment will be made
available in production

•  Available in Microsoft Azure

•  Available in Microsoft

•  Available in Vultr NVIDIA

Region
Availability

West US

•  Other Microsoft Azure

Regions will be made
available based on demand

•

Azure West US, West US2,
South Central US
Planned in Microsoft
Azure UK South, Germany
West Central

•  Other Microsoft Azure

Regions will be made
available based on
demand

Cloud Partner US, Europe UK
and APAC region. For other
regions, review with Vultur to
make it available

•  Available in Microsoft Azure

West US, West US2, South
Central US.

•

•  All types of data C1 to C4 in

Vultr

•  All types of data C1 to C4 in

Azure (tentatively planned for
FY26 Q3)

Data
Classification

•
•

C1 – Public Information
Synthetic Data

C1 – Public Information
•
Synthetic Data
•
•  Non-Prod Data

In addition to the environments listed above, there is a NVIDIA Compute available in EY Global Data Center located at
Piscataway, New Jersey, USA for domain model/model fine tuning purpose. The process to get access to this environment
is under consideration.

Please refer to the below high-level decision diagram to choose the right NIVIDIA Compute based on your business
requirements.

9

As described above, if you would like to explore or learn NVIDIA compute tools, frameworks and language models, then
use the EY Fabric Sandbox shared environment in Azure. In future, IBM cloud will be enabled to learn and explore NVIDIA
technologies.

If you would like to train and fine tune the model, then use the EY On Premise Global Data Center as the first preference. If
you want to host your Staging/Production applications, you can consume the NVIDIA AI compute offering in Vultur NCP
(NVIDIA Cloud Partner) provided the desired region is available within Vultr NCP. If your regional requirement is not met,
then Microsoft Azure can be used as a potential alternative, and this is tentatively planned for FY26 Q3.

10

NVIDIA Compute for Domain specific custom language models and/or Committed Network Latency, High Throughput)EY Fabric Development Environment in Cloud (Azure, IBM)Dedicated Compute?Model Training and Fine Tuning?YesLearning/Exploration?YesEY On Premise Global Data CenterNoNon-ProdProdEY Fabric NVIDIA Sandbox Environment in AzureNoProduction Environment in Azure – FY26 Q3Production Environment in Vultr (NVIDIA Cloud Partner)Geographic Regional Availability within NCP?YesNoCapacity Available in On Premise?NoYes

1.5. No-code and Low-code Development Approved Stack

EY has below No-code and Low-code platform to build AI agents.

Platform

Best Suited For

Limitations

Agent Builder in
M365 Copilot

Individual or Small Team use

Only declarative agent, published to M365 Copilot, uses
Microsoft Orchestrator, cannot be scaled for enterprise
grade and cannot be onboarded to EYQ Marketplace

Microsoft Copilot
Studio

M365, SharePoint and Graph
Connector, Power Platform
focused

EYQ Agent
Studio (Formerly,
EYX)

No code/Low code, approved
governance, quick time to market

Copilot Studio agents and related data, including
conversation transcripts and agent configurations, are
stored within Microsoft Dataverse instances. Each Power
Platform environment is tied to one Dataverse database.
You need to create an individual Power Platform
environment to isolate data for each client/engagement.
You need to manually clone the Agent to each Power
Platform environment.

Not suited for complex use cases. For example: use cases
that require granular control on how knowledge is ingested
(chunked, vectorized), or complex multi-stage workflows
where custom logic needs to be applied for choosing the
best next step.

11

1.5.1. Key Differences

Some of the key differences between Agent Builder in M365 Copilot, Microsoft Copilot Studio and EYQ Agent Studio
(formerly, EYX) are:

Agent Builder in M365
Copilot

Microsoft Copilot Studio

EYQ Agent Studio (formerly,
EYX)

Conversational agent
creation

   Prompt-based, easy     Drag-drop dialog builder

   Prompt-based, easy

Create agents via
prompts only

  Yes

   Yes

  Yes

Integration with
Microsoft 365 apps
(MS Graph)

External
connector/plugin
support

Multi step
orchestration
(chains)

RAG (Retrieval-
Augmented
Generation)

  Deep integration    Graph connectors available    Custom integration

    Limited

  Power Platform connectors      pre-defined, as required,

custom connectors added
connecting to EY backend
systems

   Basic flows

   Visual flows & conditions for
simple sequential workflows

  Yes, use Semantic Kernel
internally

    Limited, M365 Data
and Copilot Connector
(EY Discover, Service
Now IT Help KBs and
Catalogue)

   Yes – Developer can build Azure
AI Search index and connect the
Copilot Agent

   Limited, In-built into the
platform, EYQ Agent Studio
team can create custom
components for specific
needs.

Multi Tenancy

    Agent to be cloned
for each tenant

    Agent to be cloned for each
tenant

  Yes

Model control & fine-
tuning

  No

    Limited to GPT-4.1 Mini, GPT-
4.1 and o3 models

  Yes, EYQ Agent Studio
Platform Admins can fine
tune a model and then make
it available for Agent
Developers to choose from.

SDK / Developer APIs    No

    Limited extensibility

Scale and
governance controls

    Basic (Power
Platform-based).
Governed via life cycle
management controls

    Medium (DLP, roles,
environments)

  Yes

  Yes

No coding skills
Required

   Yes

    Minimal/optional

   Yes

12

1.6. Pro-code Development Approved Stack

EY has below approved agentic frameworks to build AI agents for your business needs.

Framework

Best Suited For

Limitations

Microsoft Agent
Framework

Enterprise production ready, long-running processes,
multi-agent collaboration, MCP clients for tool
integration, state management, built-in A2A
integration.

Newer agent development must use this framework
instead of AutoGen, Semantic Kernel and LangGraph.

Under preview, expected General
Availability (GA) in Feb 2026.

AutoGen

Multi-agent collaboration

Microsoft research, community
supported)

Semantic Kernel  Azure-integrated multi-agents

Steeper learning curve for Developer

LangGraph

Stateful/human-in-loop workflows

Python and TypeScript only

NVIDIA NeMo

 Domain Language Models (Building a new model
architecture or targeting a new domain model from
scratch using Small Language Models)

Requires GPU clusters and the cost will
be higher for building Large Language
Models.

NVIDIA NIM

Deploy AI models

Requires GPU clusters

NVIDIA NeMo
Agent Toolkit

Agent orchestration

POC implementation in progress, planned
to complete by FY26 Q3.

Microsoft Foundry (formerly, Azure AI Foundry) is a hybrid development platform (Low-code and Pro-code) to build and
manage AI Agents. It offers declarative, UI-based workflows or YAML-defined visual pipelines for building AI agents without
extensive coding. Also, it provides a comprehensive API and SDKs for languages such as Python, C#, and
TypeScript/JavaScript with full control and customization. With the Visual Studio Code extension, developers can author,
inspect, and deploy agent code directly, integrating with Model Catalogue and builds via the Microsoft Agent Framework.

13

1.6.1. Quick Cheat Sheet

A quick cheat sheet to select the right agentic framework is described below:

Feature

Microsoft Agent Framework  AutoGen

Semantic Kernel

LangGraph

Primary Use
Case

Multi-agent collaboration,
MCP clients for tool
integration, A2A integration,
state management, multi-
step tasks, Graph based
workflows

Multi-agent
collaboration (e.g.,
debate, workflows)

Single-agent
orchestration (e.g.,
plugins, RAG)

Cyclic/stateful
workflows (e.g.,
approvals, loops)

Strengths

•  Native checkpointing,

•  Agent

pause/resume, and long-
running threads during
agent execution
Easily deployable to
Azure AI Agent Service
Seamlessly enable A2A
for agent-to-agent
communication

•

•

teamwork

•  Dynamic

•

conversations
Built-in agent
roles
(UserProxy,
Assistant)

•

•

Tight Azure/AI plugin
integration
Simple and complex
agent orchestration

•  Handles

loops/human-in-
the-loop
•  Graph-based
workflows

Weakness

Learning curve due to A2A
and MCP feature integrations

Overkill for simple
tasks

Clunky for complex agent
teams

Steeper learning
curve for Developers
to understand nodes
and edges concept in
the graph

EY’s
Standard
Starter Kit

.NET/Python (RAG based
multi agent template with
MCP and A2A integration)

.NET/Python (pre-
built debate agents)

.NET/Python (pre-built
RAG templates)

Python (workflow
templates)

Code
Complexity

Medium (command line tool
to deploy in Kubernetes)

Medium (define
agent roles)

Low (bind plugins to
prompts)

High (design graph
nodes/edges)

14

1.6.2. When to Use Which

Framework

Scenario

Sample Code Snippet

Microsoft
Agent
Framework

You need to orchestrate multiple
agents using A2A and MCP for
tools integration.

##.NET Snippet

AIAgent agent = new AzureOpenAIClient(new Uri(endpoint),new AzureKeyCredential
(apiKey)) .GetChatClient(modelName) .CreateAIAgent(instructions: "instructions
", tools: AIFunctionFactory.Create(GetWeather)]);
AgentThread thread = agent.GetNewThread();
AgentRunResponse response = await agent.RunAsync(query, thread);

AutoGen

You Need multiple agents
working together (e.g., one
researches, one writes, one
critiques).

##.NET snippet
var groupChat = new GroupChat(new List<IAgent> { userProxyAgent,financialAgent
, complianceManagerAgent });
complianceManagerAgent.SendIntroduction("<<Compliance manager text>>", groupCh
at);
financialAgent.SendIntroduction("<<Financial agent text>>", groupChat);
userProxyAgent.SendIntroduction("User proxy agent text", groupChat);

Semantic
Kernel

You’re building a single agent
with plugins (e.g., fetch data →
analyze → respond).

var groupChatManager = new GroupChatManager(groupChat);

##Python snippet

 team = RoundRobinGroupChat([
        user_proxy_agent,
        tax_expert_agent,
        planner_agent
    ], termination_condition=termination)
    # Capture the output from the group chat
    output = await Console(team.run_stream(task=task))

##.NET Snippet
    // Create the agent
    return
        new ChatCompletionAgent()
        {
            Name = "<agent name>",
            Instructions = "<agent instructions>",
            Kernel = agentKernel,
            Arguments = new KernelArguments(
                new OpenAIPromptExecutionSettings()
                {
                    FunctionChoiceBehavior = FunctionChoiceBehavior.Auto()
                }
##Python Snippet
from semantic_kernel.agents import ChatCompletionAgent
# Create the Chat Completion Agent instance by specifying a list of plugins
agent = ChatCompletionAgent(
    service=AzureChatCompletion(),
    instructions="<instructions>",
    plugins=[SamplePlugin()]
)

LangGraph

Your workflow has loops/state
(e.g., approval chains, human-in-
the-loop).

##Python Snippet
from langgraph.graph import Graph
workflow = Graph()
workflow.add_node("draft", draft_report)
workflow.add_node("review", human_review)
workflow.add_edge("draft", "review")  # Loop back if rejected

15

1.6.3. Key Differences

Some of the key differences between Microsoft Agent Framework, AutoGen, Semantic Kernel and LangGraph are:

Scenario

Microsoft Agent
Framework

AutoGen

Semantic Kernel

LangGraph

Multi-agent debate     Built-in A2A     Built-in

  Single agent focus

   Via LangChain
tools

Calling
APIs/plugins

   Native
(OpenAI + Azure
+ MCP)

   Agents do it ad-
hoc

Human-in-the-loop    Agents can

pause and resume
as threads

    Agents can
pause

   Native (OpenAI + Azure)    Via LangChain tools

    Agents can pause

   First-class support

RAG Integration    Built-in

  Bring your own    Built-in

Language
Supported

  .NET

  .NET

  .NET

  Python

  Python

  Python

   Via LangChain
tools

 .NET

  Python

1.6.4. Pro Tips

•  Microsoft Agent Framework: Use A2A for agent communication, MCP for tool calling, flexible thread execution

for human in the loop, and orchestrate durable workflows using graph

•  AutoGen: Start with the "GroupChat" template for agent teams (e.g., sales bot + support bot).
•
•

Semantic Kernel: Use Kernel Memory for RAG
LangGraph: Model workflows as state machines (e.g., "If rejected → loop to step 2").

16

1.7. AI Agent Development Platform Selection

EY’s AI Agent Development Ecosystem spans business-led, engineering-grade and specialized platforms. Each serves a
distinct purpose aligned to user capability, business requirements and workload complexity. The platform options are
described Below:

•  Microsoft Copilot Studio: A no-code, low-code platform by Microsoft to build and customize AI agents. It lets

•

teams create conversational or autonomous agents and publish them across Microsoft 365 apps.
EYQ Agent Studio (formerly, EYX): A home grown no-code, low-code platform that enables EY teams to create,
test and manage AI agents through an intuitive, guided experience.

•  NVIDIA Agent Builder (formerly, EYQ AB): A home grown no-code, low-code platform that enables EY teams to

create, test and manage AI agents leveraging NVIDIA compute.

•  Microsoft Foundry (formerly, Azure AI Foundry): A fully managed pro-code by Microsoft, offering a large model

catalogue, managed agent services, and built-in enterprise governance and safety.

•  Agent Runtime (ART): A home-grown pro-code cloud-agnostic, portable, scalable execution platform for running
AI agents at enterprise scale. It provides a declarative agent programming model with support for MCP, A2A,
containerized execution, guardrails, state and memory management.

•  NVIDIA Stack: A pro-code cloud-agnostic, portable, and scalable platform to build high-performance agents with

•

ultra-low latency. It supports custom LLM training and built-in guardrails and telemetry.
IBM WatsonX Orchestrate: A low-code, pro-code enterprise platform to build and coordinates AI agents to
automate complex, multi-step business workflows. It provides tools, prebuilt agents, and secure multi-agent
orchestration across enterprise systems.

1.7.1. Platform Capabilities and Suitability

The platform landscape provides a tiered set of options, ranging from low‑code environments empowering business users
to rapidly build agents to robust engineering‑grade platforms designed for cloud‑agnostic, scalable and mission‑critical
multi‑agent systems. Each platform is purpose built for specific needs such as rapid prototyping, enterprise‑level
orchestration, GPU‑optimized workloads or deep system integration. Choosing the right platform ensures alignment
between business objectives, technical complexity and compliance requirements.

Platform

Best fit, if you need

Not recommended, when you
need

Example

EYQ Agent Studio
(formerly, EYX)

•

•

•

Microsoft Copilot
Studio

•

Enable business users to create
agents (Low-code)

•  Native content access to M365

productivity tools such as Teams,
Outlook, SharePoint, Graph and
Power Platform connectors
Deployment within M365 Copilot,
Teams and EYQ Marketplace

•

Portability to deploy to non-
Microsoft cloud platform/On
Premise

•  Multi-tenant isolation for agent

data and context

•  More control on the agent

orchestration/ response
Real-time mission critical agents

•

Enable business users to create
agents in natural Language
Tenant isolation and secure
workspace-level data controls

•

Portability to deploy to any
cloud platform/On Premise
•  More control on the agent
orchestration/response

•  AI factory driven agent creation

experience

NVIDIA Agent
Builder (formerly,
EYQ AB)

Microsoft Foundry

•

•

•

NVIDIA based low-code agent
creation platform

•

Portability to deploy to any
cloud platform/On Premise

Enable Engineering Team to create
enterprise agents at scale with
choice of agentic framework, built-
in security, memory management
and observability
Connectivity to Azure native
ecosystem data sources (e.g. Azure

•

Portability to deploy to any
cloud platform/On Premise
•  Use cases (e.g. mission critical
systems) requiring specialized
fine-tuned models with optimal
performance on GPUs

•

•

•

•

Q&A assistant, agent
that leverages M365
content
(SharePoint/OneDrive,
Microsoft Graph and
Dataverse), Power
Platform Connectors

Service line (e.g. Tax
centric agents) with
engagement specific
workspaces with
predefined and
approved agent
governance

Domain specific agents
(e.g. Risk)

Domain centric multi-
agent solutions

17

Platform

Best fit, if you need

Not recommended, when you
need

Example

Agent Runtime
(ART)

NVIDIA Stack

IBM Watsonx
Orchestrate

SQL Server, Fabric, Data Lake, AI
Search etc.)

Enable Engineering Team to build
cloud-agnostic, portable multiagent
solutions
EY home grown solution without
any vendor tie-in/license needs
Full infra-level control of the agent
runtime environment
Built-in security and memory
management

Enable Engineering Team to build
cloud-agnostic, portable multiagent
solutions

•

•

•

•

•

•  Use cases (e.g. mission critical

systems) requiring specialized fine-
tuned model with optimal
performance on GPUs
•  Workloads demanding high-

throughput parallel inference or
custom GPU RAG (Elastic, Milvus,
CuVector)

•

•

Enable Engineering Team to build
cloud-agnostic, portable multiagent
solutions
Integration with other IBM watsonx
products (e.g. data, ai etc.)
•  Native integration with third party
systems (e.g. SAP, Workday,
Salesforce, procurement stacks)

•  A fully managed platform

•

without owning infra operations
and Kubernetes based
deployments

•  Use cases (e.g. mission critical
systems) requiring specialized
fine-tuned models with optimal
performance on GPUs

Deterministic or
autonomous multi-
agent systems

•

Deterministic or
autonomous multi-
agent systems

•

•

Pay-as-you-go consumption
pattern is a concern
Teams lack knowledge in NVIDIA
tools and frameworks
•  Vendor tie-in/license is a
concern; Microsoft is first
preference before choosing
other vendors

•  Vendor tie-in/license is a
concern; Microsoft is first
preference before choosing
other vendors

•  High-scale, cross-

department automation

•  Multi-agent

collaboration (teams of
agents)

1.7.2. Representative Use Cases

This section illustrates how each agent platform is optimized for different business scenarios, from simple Q&A assistants
and workflow automation to high-performance GPU workloads and complex multi-agent orchestration. The representative
use cases highlight the breadth of capabilities across platforms, enabling everything from document insights to regulatory
analysis and enterprise-scale automation. Together, they demonstrate how selecting the right platform directly accelerates
value for specific use cases.

Platform

Representative Use Cases

Microsoft Copilot
Studio

EYQ Agent Studio
(formerly, EYX)

•  Q&A/Support Assistant: Get answers and insights on EY internal documents present in M365 ecosystem

•

•

•

such as Microsoft SharePoint, OneDrive, Teams Channels
Task Automation: Folder creation, SharePoint site provisioning, adding users to Teams channels, M365
event driven tasks

Service Line Knowledge Companion: Navigate client-specific regulations, retrieve and summarize domain
specific memos (e.g. tax returns), curated insights within secure and governed workspaces
Engagement Command Centre Agent: Tailored for specific engagements, summarizing daily standups,
drafting decks and providing KPI snapshots from uploaded files

NVIDIA Agent
Builder (formerly,
EYQ AB)

•  Risk Model Analysis Assistant: Summarizes risk models, runs analytics workflows, supports model

•

validation
Advanced Semantic Search for IPC compliance: GPU-powered reranking and graph search across
regulations

18

Platform

Representative Use Cases

Microsoft Foundry

•

•

Enterprise Procurement Workflow: Check contract terms, run risk scoring, draft SOWs and coordinate
approvals
Client-Centric Research: Searches internal knowledge bases, summarizes insights, and cross-checks
information across multiple data sources

•  Regulatory Response Orchestration: Multi-agent system that analyses regulatory updates, drafts impact

assessments, and coordinates SME actions

Agent Runtime

•  Multi-Cloud Banking Workflow Automation: Cross-cloud orchestration performing data ingestion, KYC

checks, reporting and audit trails

•  On-Premises Connected Agents: Agents that process structured/unstructured regulated data, run

analytical models and produce standardized outputs

•  Multi-Agent Coordination: Multi-Agent Coordination with complex logic for retrieval, verification and

escalation

NVIDIA Stack

•  Real-Time Contact Centre: Live transcription, sentiment analysis, next-best-action prompts with low

latency

•  Voice Command for Field Workers: Technicians speak commands; retrieve schematics, diagnostics with

instructions

•  High-Fidelity Document RAG: Intelligent Search and retrieval across millions of documents (PDFs, CAD

drawings, contracts etc.) in a time sensitive manner

•  Digital Twin: A virtual replica of a physical system that mirrors real-time operations, enabling live

monitoring, predictive maintenance, process optimization, and data-driven decision-making integrated
with IoT data streams

IBM Watsonx
Orchestrate

•

•
•

Procurement Request Automation: Agents that extract data from SAP, create requisitions, update
Workday/Snowflake dashboards
Sales Operations Orchestration: Integrates Salesforce, SAP and email workflows for quote-to-cash cycles
Third-Party Vendor Due Diligence Flow: Agents orchestrate document checks, external system
verifications and compliance scoring

1.7.3. What’s Next

The table below provides an overview of emerging data‑adjacent agent runtimes across major platforms, highlighting how
each enables intelligence directly where enterprise data resides. While Databricks and Snowflake already support native
agent execution with approvals in progress for LLM models. Microsoft Fabric and MongoDB Voyage are advancing toward
broader availability with preview features and ongoing certification. Together, these options illustrate the expanding
landscape for building governed, low‑latency, and data‑proximate AI agents.

Data Platform

Description

Where are we

Databricks Agent
Bricks

•  Agent Bricks is Databricks native agent runtime that allows you
to build and run AI agents directly within the Databricks Data
Intelligence Platform. It leverages Databricks capabilities like
Mosaic AI, Unity Catalog and Lakehouse architecture, enabling
low-latency, data-adjacent AI agents that can reason over
enterprise data and perform automation tasks at scale.

Snowflake Cortex AI
Agents

•

Snowflake Cortex AI Agents provide a Snowflake-native runtime
for LLM-powered workloads. Cortex AI offers text generation,
summarization, classification, vector search and SQL-
integrated LLM inference using Snowflake’s zero-maintenance
compute. Cortex enables SQL users and data teams to embed
intelligent agents inside Snowflake without external
infrastructure.

Microsoft Fabric
Data Agents

•  Microsoft Fabric Data Agents are AI-powered conversational
agents that let users ask questions about their organizational
data in plain natural language and get accurate, governed
insights instantly. They eliminate the need to write SQL/DAX or
navigate complex dashboards.

•  Agent bricks feature is

•

•

•

•

approved.
LLM model approval is in
progress, targeted FY26 Q3.

Cortex AI Agent feature is
approved.
LLM model approval is in
progress, targeted FY26 Q3.

This feature is in preview,
sandbox tenant this feature is
available to use.

19

Data Platform

Description

Where are we

MongoDB Voyage
Data Agents

•  MongoDB Voyage AI consists of embedding models, reranking
models and multimodal models that help AI agents retrieve the
most accurate and relevant information from enterprise data.
These models are state-of-the-art, built for retrieval accuracy,
and are integrated directly into MongoDB Atlas.

•

GIS testing is in progress,
targeted FY26 Q3.

Note:

Selection guidance for Data Platform agents will be available in FY26 Q3.

•
•  AI Agent Development and Data Platform will be unified to give teams a comprehensive view for choosing the

right technology stack, combing both Data and AI to build AI agents. This guidance will be released in FY26 Q4.

1.8. Agent Communication Protocols

This section describes the technology stacks under consideration for AI agents to communicate with each other. A2A, MCP
Starter kit will be enhanced to support the protocols. Agent registration and discovery will be developed later.

1.8.1. Agent-to-Agent (A2A)

A2A or Agent-to-Agent is a protocol that enables different AI agents to communicate and collaborate with each other,
regardless of their underlying platforms or frameworks. It acts as a common language, allowing agents to discover each
other, negotiate tasks, exchange information, and integrate their functionalities. This fosters a more interconnected and
scalable ecosystem of AI agents. It is a foundational protocol for building a more connected and collaborative AI future.
A2A protocol specification is available at A2A Specification . Below diagram depicts a conceptual architecture for A2A
communication.

EY Fabric’s plan is to enhance the Standard Starter Kit for AutoGen, Semantic Kernel and LangGraph and provide the
template by incorporating A2A protocol. This will be released by FY26 Q3. Future releases will include Agent Binding i.e.
Agent Registration and Discovery.

20

1.8.2. Model Context Protocol (MCP)

MCP is an open standard to address isolated AI ecosystem to easily communicate with other systems or access external
tools and data sources. It provides a standardized way to connect AI models to different data sources and tools. MCP
clients communicate to server using STDIO (standard I/O or HTTP with SSE (Server-Sent Events) transport protocol.

A typical MCP sequence flow is depicted below:

EY Fabric has released the MCP Standard Starter Kit in Python. Work in progress to release the starter kit in Node.js and
.NET C# with sample pattern and MCP Inspector by FY26 Q3.

1.9. Agent Deployment and Runtime

EY Fabric has published the enterprise grade Services in the EY Fabric Catalog for you to choose and use for your agentic
deployment. These provisioned services comply with the EY Information Security Standards.  The below sections describe
the current and future state to deploy agents.

Currently, you have the services below available from EY Fabric to start your AI Agentic journey.

•

•

•

•

•

EYQ Incubator provides 90 days free usage access for your learning, experimentation and exploration with an
Azure OpenAI endpoint. This is only meant for C1 (Public Information) data.

EY Fabric Azure OpenAI Service provides options for standard Azure Resources i.e. Azure OpenAI, AI Search,
Storage Account (Blob Storage), Web App, Redis Cache and PostgreSQL.

If you have requirement to use other vector databases such as MongoDB Atlas, CosmosDB MongoDB, Elastic
Search, then refer to the vector database selection and availability and provision the services through EY Fabric
Marketplace offering.

If you have requirement to host the agent in Azure Kubernetes Service (AKS), then request for AKS cluster
through EY Fabric Containers Platform offering.

If you would like to experiment with AI models in Microsoft Foundry (formerly, Azure AI Foundry) model catalog
with C1 (public information), then use the Azure AI Foundry option provided in the Azure OpenAI offering.

1.10. RAG Implementation Patterns

AI Agents require access to knowledge sources to provide contextual results. RAG, Retrieval-Augmented Generation, is a
technique that enhances performance by integrating external knowledge sources. It combines the strengths of retrieval-
based models, finding relevant information, and generative models, RAG allows LLMs to access and utilize information
from external databases, knowledge bases, or other sources to improve the accuracy, relevance, and context of the
responses. Also, it reduces hallucination, access up-to-date information and cost of consuming LLM tokens.

21

Please refer to RAG Pattern guidance and example reference patterns that can be considered and leveraged for solution
development when using generative AI technologies You can refer to the Vector Database selection guidance article to
select the vector database of your choice. A reference decision tree is depicted below:

EY Fabric has Following vector databases to choose from:

•  Azure AI Search
•  MongoDB Atlas
•  MongoDB CosmosDB
•
•  Qdrant (Open Source)

Elastic Search (Reference Article)

There is an ongoing effort for enabling AI Agents with AI Ready data in a consumable way, tentatively targeted towards
FY26 Q3.

1.11. AI Language Models

There are many variations of AI Language Models available in the market, provided by the vendors. The broad
classification of models is based on the number of parameters, Large Language Models (LLMs) ranging from billions to
trillions versus Small Language Models (SLMs) ranging from million to few billions.

AI Models are also classified based on architecture patterns such as Feedforward Neural Networks (FNNs), Convolutional
Neural Networks (CNNs), Recurrent Neural Networks (RNNs), Graph Neural Networks (GNNs), Transformer-Based Models,
Hybrid and Specialized Architecture.

Below table summarizes the AI models that can be used at EY which are approved at Platform level, reviewed by InfoSec,
Data Protection and Independence. Please note that each AI Application use case must follow AI Governance and EY
processes before Go Live.

Provider

Consumed via

Models

Notes

OpenAI

EY Fabric Microsoft
Azure OpenAI
Offering via Azure
OpenAI or Microsoft
Foundry (formerly,
Azure AI Foundry)

Refer to “Azure OpenAI
in Microsoft Foundry
Models” at Foundry
Models sold directly
by Azure - Microsoft
Foundry | Microsoft
Learn for all Azure
OpenAI Models with their
availability in Azure
regions.

•
•

•

•

Available through EY Fabric Marketplace offering
By default, when you get Azure OpenAI or Microsoft Foundry
(formerly, Azure AI Foundry) resource from EY Fabric
Marketplace, you can only deploy Azure OpenAI models that
are in GA.
If there is a business justification to use Private and Public
Preview models, then reach out to Service Line/Function
Security Consultant.
You can consume the models as pay-as-you-go (serverless)
based on token consumption or provisioned throughput.

22

Provider

Consumed via

Models

Notes

OpenAI

OpenAI

EY Fabric NVIDIA
Compute

EY Fabric Github
Copilot Chat

GPT OSS 20B/120B

•

Available through EY Fabric Marketplace offering

GPT-4, GPT-5 Series

•

For more information, visit EY GitHub Copilot | EY Fabric

OpenAI

Factory AI

GPT-5 Series

OpenAI

API Platform for
Enterprise, provided
by OpenAI

GPT-5 Series, GPT-4.1
Series, GPT-4 Series,
GPT-4o Series, O Series,
Codex-Mini, text-
embeddings, Dall-E
Series

•

•

•

•

For more information, visit Factory.AI | EY Fabric

Zero Data Retention (ZDR) API end points are allowed i.e.
completions, images, audio, moderations, embeddings, and
responses are allowed. Refer to
https://platform.openai.com/docs/guides/your-data for more
information.
Approved for EY Parthenon (formerly SaT) Service Line AI
solutions as part of EY and OpenAI Enterprise Agreement
Not available through EY Fabric Marketplace offering. Submit
a request to d-ug-ey-fabric-operations@ey.net for details

EY Fabric NVIDIA
Compute

Nemotron 9B V2

•

Available through EY Fabric Marketplace offering

NVIDIA

NVIDIA

EY Fabric NVIDIA
Compute

Nemotron Llama
variants

Google

EY Fabric Google
Cloud Platform

Gemini family

•

•

Conditional approval available from Independence, use case
review required with Independence in addition to InfoSec,
GCO, and PIA

Approved by Independence for CT Assurance code review
adhering to the points below:

o

o

o  Only EY internal employees will use the Gemini tool
for the purposes of IT application code review,
which can be Assurance or any other Service Line.
The final output from Gemini will not be shared with
any EY clients or distributed outside the Firm in any
way.
The Gemini output will not automatically impact the
code of any Assurance applications. Essentially,
there will be EY human intervention and decision-
making to determine whether the suggested code
changes will be implemented and to what extent.
The licenses will be provisioned through EY Fabric,
where project Sponsors will provide the necessary
attestations that their use case aligns with the BRI-
16470566 documentation. This process will be
facilitated by Marta’s team.
This use case is covered by the existing CMA
already in place with Google.

o

o

•

•

•

The Independence approval can be extended to other Service
Lines/Functions adhering to the above-mentioned points.
Not available through EY Fabric Marketplace offering, please
reach out to eyfabric.openai@ey.com to get Gemini instance.
Google is an audit client vendor. Any other business use cases
not adhering to the above-mentioned points for code review
or any other use cases will be reviewed and approved on
case-by-case basis by the Independence Team.

Google

EY Fabric Github
Copilot Chat

Gemini family

•

For more information, visit EY GitHub Copilot | EY Fabric

Google

Factory AI

Gemini Family

Anthropic

EY Fabric Github
Copilot Chat

Claude Family

•

•

For more information, visit Factory.AI | EY Fabric

For more information, visit EY GitHub Copilot | EY Fabric

23

Provider

Consumed via

Models

Notes

Anthropic

Factory AI

Claude Family

Factory.AI

Factory AI

Droid Core

Mistral AI

EY Fabric Snowflake
Cortex AI

mistral-large, mistral-
large2, mistral-7b

•

•

•
•

For more information, visit Factory.AI | EY Fabric

For more information, visit Factory.AI | EY Fabric

Available through EY Fabric Marketplace offering
Refer to Snowflake Cortex AI | EYDX | Connect | EY Fabric for
more information.

Below table summarizes the AI Language Models that are under review:

Provider

Consumed via

Models

Notes

IBM

EY Fabric IBM Cloud watsonx.ai

Granite Family

Mistral AI

EY Fabric Microsoft Azure AI Foundry

Mistral Family

Mistral AI

EY Fabric Compute as Open Source

Mistral Family

Mistral AI

EY Fabric NVIDIA Compute

Mistral 7B/12B/24B

Anthropic

EY Fabric Offering

Claude Family, Claude
API, Claude Code, Claude
Code for Enterprise,
Claude Code for Financial
Services

Anthropic

EY Fabric Snowflake Cortex AI

Claude Family

Anthropic

EY Fabric Microsoft Azure OpenAI Offering
via Microsoft Foundry Models

Claude Family

Anthropic

Microsoft Copilot Studio

Claude Family

•

•

•

•

•

•

•

•

Under review

Under GCO and PIA review

Under GCO and PIA review

Under Independence, GCO and PIA
review

Under Procurement, Independence,
GCO and PIA review

Under Independence, GCO and PIA
review

Under Independence, GCO and PIA
review

Under Independence, GCO and PIA
review

If you have specific business need to use any other models that are not currently offered via EY Fabric Marketplace or not
under review, then submit the AI Model Onboarding Request Form with the details.

24

Consumption OptionsSubmit a request for AI Models not available within EY Fabric with  Model Details, Use Case, Environment, Consumption, LicenseIndependence ReviewLegal ReviewArchitecture and InfoSec ReviewAzure AI Foundry(Serverless, Managed Compute, Provisioned Throughput)EY Fabric• PIA Approval• Data Protection Approval• Security Certification• Enablement• Business Relationship (Audit/Non-Audit Client)• New/Existing BRIDGE• Open/Closed  Source• Click Through/Enterprise Agreement• Security Controls• Model Scanning• Consumption (Model as a Service, VM/AKS Compute etc.)Other Cloud Providers (IBM, Google, Databricks etc.)Self Hosted (On Prem/Azure Compute)NVIDIA GPU Hosted in Azure, IBM, NCP - NVIDIA Cloud Provider

As described in the above diagram,
•

Independence Review is required to determine EY business relationship with the Model Provider and how it will be
consumed. For example, even though Meta Llama model is an Open-Source model and available through Microsoft
Azure, IBM Cloud, Meta is an Audit Client of EY, and the model is owned by Meta.
Legal review is required to understand the license terms. For example, Microsoft displays click-through license terms
for third party models to accept before deploying in Azure AI Foundry. Also, the license terms vary depending on how
you consume the models i.e. Serverless (Model as a service) or managed compute.
InfoSec review is required to understand the security controls required based on model deployment consumption
options and identify any security vulnerability by scanning the model file.

•

•

,

25

2. Chapter 2: What’s Next

Area

Description

When

EY Fabric Developer
Workflow

Enable EY teams to select the technologies to develop AI
Agents and starter kits enabling MCP and A2A with deployment
to Agent Runtime (ART).

Under public preview.
Production by FY26 Q3.

2.1. Agent Deployment and Runtime

We do understand current state deployment and agent hosting as described in the previous section does not provide a
seamless experience for the team. EY Fabric is working on the initiative below for better experience.

•

EY Fabric is planning to build an Agent Runtime environment leveraging Kubernetes architecture (starting with
Azure Kubernetes Service – AKS) which will provide seamless experience without worrying about AI Agent
hosting. The Kubernetes environment will provide flexibility of AI Agent deployment to other cloud service
providers such as GCP and AWS.

•  Also, EY Fabric will release Agent Developer Kit agnostic of the Agentic Framework and built-in abstraction layer

that communicates to underneath AI Models such as Azure OpenAI GPT Models.

•  As AI models (LLM, SLM, Domain Specific) are growing rapidly, Model Garden will be available in EYQ Platform for
teams to choose EY Approved Models. These AI models will be provisioned automatically and ready to consume
by respective teams.

2.2. AI Security/Guardrail

AI guardrails are necessary to ensure that AI systems are used responsibly, ethically, and safely. They act as safety
barriers, preventing AI from producing harmful outputs or making unethical decisions. Guardrails help mitigate risks
associated with AI, such as bias, misinformation, security breaches, and legal non-compliance. They also help maintain
user trust and confidence in AI systems.

Some of the key features of AI Guardrails are:

•

Input, Output and Fact checking: Ensure that prompts and model responses meet content, format, and policy
requirements

•  PII (Personal Identifiable Information) and Sensitive Data Detection: Prevents disclosure of personally

identifiable information or confidential data

•  Content Safety: Protects against violence, sexual, criminal planning/confessions, Guns and illegal weapons,

controlled/regulated substances, suicide and self-harm, hate/identity, elections and more

•  Hallucination Detection: Protects against false alarms

•

•

Jailbreak Detection: Identify attempts to bypass safety measures and restrictions by manipulating the input of
the model to generate undesirable or harmful outputs

Injection Detection: Identify potential exploitation attempts by using injections such as code injection, cross-site
scripting, SQL injection, and template injection

•  Policy and ethical compliance: Align AI outputs with company policies, legal guidelines, and ethical principles

•  User trust and transparency: Build confidence in AI systems by ensuring safe and predictable behavior

•  Near real-time monitoring and logging: Track prompts, outputs, and violations with tools like Open Telemetry for

auditability

•

Structured outputs enforcement: Validate model responses to follow a desired structure like JSON, lists, or
summaries

•  Automated alerts and dashboards: Visualize violations and key metrics

26

Currently, Azure AI Content Filter feature is enabled in the Azure OpenAI instances at model deployment level to block
harmful inputs and outputs such as violence, hate, sexual and self-harm content. Also, content logging and abuse
monitoring is disabled. This feature is only available in Microsoft Azure cloud, provides limited capability and flexibility.

To provide a robust and more feature rich platform protecting AI Systems catering to LLM, SLM and Domain Specific
models hosted in any cloud and on premise, EY Fabric has performed a market study and concluded a POC shortlisting
IBM Guardium AI Security to meet the AI Guardrail requirements. At the same time, EY Information Security has done a
market evaluation via RFI response and shortlisted Hidden Layer and IBM Guardium AI Security. As there are overlapping
requirements, EY Fabric in collaboration with Information Security and Supply Chain Services concluded the POV and
vendor RFP response on IBM Guardium AI Security, CISCO AI Security, Hidden Layer, and Mend.io. IBM Guardium AI
Security has been selected based on POV and RFP Response evaluation. The plan release for the MVP of AI Security that
includes Model Scanning, Red Teaming/Dynamic Testing and Run time protection (AI Guardrail) offering is FY26 Q3.

2.3. AI Monitoring and Observability

AI observability is crucial for understanding, debugging, and optimizing AI systems, ensuring their reliability and
performance in real-world applications. It provides insights into model behavior, identifies potential issues, and enables
continuous improvement, ultimately fostering trust and responsible AI development.

Some of the key features of AI Observability solution are:

•

Tracing and Monitoring: Detailed tracing and monitoring capabilities for AI systems to understand flow of
execution and identify bottlenecks

•  Metrics and Analytics: Capture and analyze metrics like latency, cost (token usage), and error rates, offering

insights into the health and performance of AI systems

•

Evaluation and Optimization: Evaluate AI agents, identify areas for improvement, and optimize the workflows

•  Drift Detection: Track the model's performance over time and identify any changes in its behavior that might

indicate drift on model accuracy, bias and other performance metrics

•  Bias Detection: identify instances of bias in the model's predictions on different demographic groups or

identifying patterns in its outputs that suggest unfairness

•

Evaluation with LLM-as-a-judge: Uses LLMs to auto-review other LLM responses such as quality, factuality, tone

•  User Feedback Capture: Gathers user feedback to fine-tune or adjust AI system

•  Automatic Evaluation Score: Aggregation collects quality metrics (BLEU, ROUGE, etc.) from human or AI

reviewers

•  Alerts and Dashboards: Dashboards to visualize the metrics and reports of AI systems

•  Audit Logging and Retention Policies: Enables internal EY security, data retention compliance and external

regulatory compliance such as GDPR, HIPAA

•  Prompt Template Tracking: Observes which templates are used and how variables are filled

•

Integration with various tools: Integrates with wide range of AI tools and agentic frameworks, sends telemetry
data to a centralized Observability platform

EY Fabric has performed a market study and concluded a POC on LangSmith for AI Observability. Currently, Applications
hosted in Azure and using Azure OpenAI models, get basic monitoring and observability such as number of requests,
token consumed, success/failure rates. This feature is only available in Microsoft Azure cloud and provides limited
capability and flexibility. The LangSmith platform will be available in FY26 Q3 to provide a robust and more feature rich AI
Monitoring and Observability.

27

3. Chapter 3: Agentic AI Governance Summary

Agentic AI refers to generative AI systems that operate as autonomous AI agents, capable of making decisions and
executing tasks on a user’s behalf. Powered by advanced foundation models, these systems can plan and run workflows,
use tools, and collaborate with humans and other agents to achieve complex goals with minimal supervision.

Agentic AI is a rapidly developing domain that requires an augmentation of our AI governance approach. This need arises
because Agentic AI has some unique characteristics that have great potential to enhance and improve the way we are
working but may also introduce or increase risks associated with the development and use of AI, including, depending on
the type and nature of the Agent, for example broad and easy accessibility (“citizen development”) outside of traditional
technology development, a higher level of autonomy, enhanced decision-making capabilities and potential additional risk
complexity due to agent-to-agent interactions.

Whereas AI agents as a separate category of AI systems should follow Responsible AI Global Policy, this supplemental guidance
on AI agents proposes a pragmatic, risk‑proportionate governance model that calibrates reviews or controls based on an AI
agent’s autonomy and complexity, data access, deployment context and other factors to ensure safe, compliant, and scalable
adoption across EY.

The field is evolving faster than regulatory guidance – major frameworks like the EU AI Act do not yet explicitly address
autonomous AI agents – even as thousands of such agents are being developed by EY firms. The evolving technology
landscape, the significant potential of Agentic AI as well as the increased risks and factors require extended
governance approach for AI agents developed and used at EY.

This document summarizes and highlights the AI Agent Governance approach for the teams building and deploying AI
Agents. Please refer to the comprehensive Global Approach to AI Agent Governance guidance document for more
background context.

3.1. Two-Tiered Governance Approach

A two-tiered governance framework for AI agents is required, where there is Service Line-level governance and global
firmwide governance. From a global perspective this means establishing common standards, reviewing mechanisms, and
risk assessments that oversee AI agent development and deployment across all business units, while at the same time
allowing for Service Line specific controls and standards. Central monitoring and guidance will help ensure consistency,
reduce the risk of gaps (where one team might unknowingly deploy a risky agent), and leverage specialized expertise in AI
Risk Management, AI QRM, Data Protection and Information Security.

Separately, Service Line level reviews are done by Service Line Quality Functions that require the Global process to be
completed. For example, in TTAR’s AI Agent Acceptance Process for Tax, teams are directed to update AIRA and/or
complete an AI QRM review based on the intended function and type of agent, as well as seeking required Data Protection
and InfoSec approvals. By treating the governance of AI agents as a shared responsibility supported by firm-wide
infrastructure and policy (rather than burdening each service line to reinvent controls), we can more effectively manage
the novel risks of agentic AI while still enabling innovation and beneficial use of these agents.

In summary, an updated governance approach for AI agents is needed because of the unique and heightened risks they
introduce, where some firm-wide governance is required, but with Service Line level governance as well. Agentic AI’s fast
growth and autonomy capabilities push beyond the scope of traditional AI oversight. By clearly identifying the key risks
(compliance, reliability and bias, and autonomous behavior), contextualizing them even in current tools like M365 Copilot,
and structuring our risk management around factors like autonomy, use case, data access, and deployment context, we
can develop a robust framework to safely guide the proliferation of AI agents. This proactive, centralized governance will
allow our organization to harness the power of AI agents for efficiency and innovation while maintaining control,
compliance, and trust.

It is important to note that this two-tier governance approach - combining global firmwide standards with Service Line-
specific controls - serves as an immediate and pragmatic solution to address the urgent and unique risks introduced by
Agentic AI. This model enables us to quickly establish a baseline of oversight, ensuring that all AI agents are subject to
essential risk assessments and compliance checks while also allowing for tailored controls that reflect the specific needs
and risk appetites of different business units. However, as the adoption of AI agents accelerates and their deployment
scales across increasingly complex and cross-functional environments, this approach may be reconsidered to keep pace
with the growing business demand and diversity of risks. For example, this could include streamlining our many
governance requirements into single, less burdensome process or implementing monitoring and compliance testing on AI
agents to build trust and maturity within the business. Ultimately, the goal is to create a scalable, proportionate and
integrated governance model that supports innovation while maintaining robust risk management and compliance.

28

As a result, the following governance is proposed for the following categories of AI agents.

#

Agent Type

Definition

Governance

Responsible Use/Notes

1  AI Agents
(including
agent
misnomers)
that do not
meet the
definition of AI
systems

2  No-code

agents created
in “Agent
Builder in
M365 Copilot”

AI Agents that rely
on manually created
algorithms or scripts
without capabilities
to infer data to learn
(e.g. Agents that do
not rely on machine
learning models or
similar AI models).
e.g. rule-driven
systems such as
scripted chatbots

Declarative agents
built by users using
Agent Builder in
M365 Copilot
(including Microsoft
provided Researcher
and Analyst Agents)

No specific AI governance

AI Governance can be
covered for the underlying
GPAI (General Purpose AI)
system. No additional AI
Governance is required
for the development of no-
code agents and use of
M365 Copilot Agents built
by Microsoft.

It is prohibited under the
Responsible AI Global Policy to
develop and use no-code Agents,
M365 Copilot Agents built by
Microsoft, for prohibited AI
Practices.

These must also not be used for
any high-risk use cases as defined
under the EU AI ACT unless
explicitly permitted by the terms
of use for the GPAI System.

While some, but not all, of the
prohibited use cases are
prevented by Microsoft following
Microsoft Responsible AI Policy,
Code of Conduct and implemented
Responsible AI Guardrails by
providing no response to prompts,
we plan to supplement the M365
Copilot usage guidance by
prohibiting creation of high-risk
and prohibited use cases, working
both with Microsoft and EY
Technology and InfoSec teams to
implement additional prevent
controls not to “taint” M365
Copilot AI system with any such
cases increasing the overall risk
for it for us as a deployer.

3  AI Agents
created in
approved EY
environments,
other than
“Agent Builder
in M365
Copilot” or
developed by
third parties

AI agents created
in approved EY
environments, e.g.
AI agents created in
Microsoft Copilot
Studio, EYQ Agent
Studio (formerly,
EYX), NVIDIA Agent
Builder (formerly,
EYQ Agent Builder),
Microsoft Foundry
(formerly, Azure AI

Full EY governance (AIRA,
AI QRM, InfoSec and Data
Protection reviews based
on the risk assessment +
appropriate testing before
launch).

This category also includes
AI agents that are made
available (“published”) for
all EY people in approved
repositories of agents (e.g.

29

#

Agent Type

Definition

Governance

Responsible Use/Notes

Foundry), Pro-code
using agentic
framework

4

Grouping of AI
Agents under
the same
platform

AI Agents created in
approved EYQ Agent
Studio (formerly,
EYX) and NVIDIA
Agent Builder
(formerly, EYQ
Agent Builder)

EYQ Marketplace or
Copilot Agent Library).  In
addition, the same
approach would apply to
all agents developed by
third parties and deployed
by EY. Additional AI
System reviews and
consultations are required
in accordance with the
Responsible AI Global
Policy.

Grouping of AI agents
under the same platform
could be possible (and all
such cases should be first
pre-approved by
Innovation RM and AI QRM
executives), if certain
criteria are met (e.g.
similarity of goals and/or
use cases - TBD) to justify
such grouping are met:

Group Minimal/Limited
Risk agents in one AIRA
record and System Owner
performing update either
upon (1) each new agent is
added to the group; or (2)
on a periodic/quarterly
basis – with full EY
governance applied at the
group level (AIRA, AI QRM,
InfoSec and Data Privacy
reviews based on the risk
assessment + appropriate
testing before launch)

High Risk agents are
recorded separately and
follow full EY governance.

For the avoidance of doubt, AI
agents that may fall under the
grouping approach as described
above may, depending on the data
protection impact of the agent,
still require consultation with the
relevant data protection team to
identify, assess, and mitigate
potential AI specific data
protection and confidentiality risks
associated with the development
or deployment and use of such
agents.

5  Advanced and
sophisticated
AI Agents

Autonomous AI
agents, teams of
agents, agentic
workforce, i.e.,
systems that operate
with varying degrees
of autonomy —
meaning they can
pursue goals, make
decisions, and take
actions with limited

Full EY governance (AIRA,
AI QRM, InfoSec and Data
Privacy reviews based on
the risk assessment +
appropriate testing before
launch) with additional
reviews by various
relevant functions to
address additional agentic
AI risks (inadequate
oversight, automation

30

#

Agent Type

Definition

Governance

Responsible Use/Notes

or no direct human
intervention.

bias, data and goal drifts,
cascade of failures).

6  Agents at
design and
proof of
concepts
(POCs)

Agents in various
experimentation,
design, early
development stages
in Microsoft Copilot
Studio, Agentic AI
Factory, AI Foundry
and other
environments

For the avoidance of doubt, an
early consultation at the ideation,
design or development stage with
the relevant data protection team
is recommended for agents that
are intended to be developed,
trained, fine-tuned or used for the
processing personal data, client
information, third-party
Information and EY business
Information (C3 and C4 Data) to
embed data protection principles
into the agent design.

Responsible AI Global
Policy requires assessment
of AI systems at both the
design and move to
production stages, with
the same logic being
applied to AI agents.
Teams may exercise
judgment, also considering
relevant factors, such as
intended use cases, types
of data used, complexity of
the solution, etc. to
determine the appropriate
point during the design
stage when such risk
assessment of AI agents
should be done. Given that
at such stage not all
information may be
available, teams may
complete just the
regulatory modules of
AIRA (regulatory risk
assessment and role) at
this stage with Full EY
governance (AIRA, AI
QRM, InfoSec and Data
Privacy reviews based on
the risk assessment +
appropriate testing before
launch) completed prior to
move to production.

31

A simplified AI Governance process flow is depicted in the diagram below for various AI Agent development platforms
including No-code, Low-code, and Pro-code for production use. Please complete the regulatory module of AIRA during
POC/Design phase as described in the table above and follow the Full EY Governance as depicted below before moving to
production.

As described above, Agents developed using EYQ Agent Studio and Microsoft Copilot Full experience, it goes through
additional AI Factory Governance and EY Fabric Power Platform solution assessment respectively which are described in
subsequent sections. AIRA (AI Risk Assessment) risk classification is required for agents developed using EYQ Agent
Studio, Microsoft Copilot Studio, Microsoft Foundry, Third-party provided agents and EY Pro-code using agent
frameworks. If the agent is developed for an audit service line/function, then irrespective of the risk classification, it must
go through AI QRM process. If the AIRA risk classification is Low, then AI QRM process is not required. If AIRA risk
classification is medium/high, then AI QRM process is required. Irrespective of the risk classification outcome, each AI
Agent must go through EY standard Data Protection, InfoSec and Service Line/Function specific review.

3.2. RAI (Responsible AI) Overview

Currently, we use the EY Fabric Responsible AI (RAI) Platform to build, deploy and maintain AI systems responsibly. This
platform was envisioned with a focus on empowering EY internal teams & client teams (future scope) to responsibly
harness the potential of AI by developing a robust, scalable and user-friendly platform that incorporates EY’s AI centric
methodologies/regulatory frameworks such as AI Risk Assessment, AI QRM process etc. that applies EY’s proprietary
logics and algorithms to calculate scores/ratings for the previously mentioned methodologies/frameworks.

Key differentiators of RAI Platform:

•  Architected with a platform vision

•  Multitenant Architecture

•  Built on Fabric foundation

•  Modularized calculation Engine

•  Designed for EY & clients

•  Configurable Assessment Questionnaire

•  Handles sensitive Data

32

Low-code/Pro-code AgentsNo-code/Low-code AgentsAIRA (AI Risk Assessment)EYQ Agent Studio (formerly, EYX)Agent Builder in M365 Copilot (Includes Agent Builder in SharePoint)EY Pro-Code(includes NVIDIA stack)AI QRM (AI Quality Risk Assessment)AI Factory Governance(Ideate, Design & Build, Operate)Service Line/Function ReviewEYQ/Fabric Agent Onboarding GovernanceData Protection ReviewInfoSec ReviewMS Teams, Copilot Agent Store Onboarding GovernanceMicrosoft Copilot StudioMicrosoft Foundry(formerly, Azure AI Foundry)NoNo AI GoveranceGeneral Availability/External Client Work?YesRisk Classification?Medium / HighYesLowAudit Service Line/Function?NoThird Party(Vendor Provided)Service Line/Function Specific Web Portal/Mobile App Onboarding GovernanceSimilar Agent exists?NoService Line/Function ReviewYesEY Fabric Power Platform Solution Assessment

3.2.1. AIRA (AI Risk Assessment)

The AI Risk Assessment (AIRA) application is an essential EY Fabric offering for streamlining the regulatory and business
risk assessment process of AI systems within the organization. The solution leverages creation and maintaining of a
centralized catalogue of AI systems and risk assessments in preparation for the EU AI Act.

•  All AI systems, including agents, must be registered in AIRA.

•  AI systems with Medium or High Overall Risk ratings must additionally go through AI QRM review

Please note that AIRA is intended to support AI risk assessment from the ideation stage of the lifecycle onward, and it can
be used as many times as necessary. If your deployment includes an AI system, it is mandatory to complete AIRA— the
predecessor task, to AI QRM— before moving into production. To get started with AIRA and AI QRM, please follow these
steps. If you have already completed your AI risk assessment during the Validation Stage, you can skip the following steps.
If your assessment is not yet in the validation stage, please update it accordingly.

If you have not completed AIRA, follow the steps below and refer to our documentation.

•  Onboarding: Onboard yourself into AIRA at https://responsibleai.eyfabric.ey.com/ . Each system requires one

Preparer and one PPEDD Reviewer.

•  Create a System: After onboarding, create a System.

•  Assessment: Take the assessment.

•

Submission and Approval: Submit to PPEDD and have them approved of completing the AIRA step.

For more information:

•  Video Guide: https://connect.eyfabric.ey.com/eydx/content/998ee1bc-2855-42d2-8f5c-86c9ef200ff3

•

Full Documentation: https://connect.eyfabric.ey.com/eydx/content/998ee1bc-2855-42d2-8f5c-86c9ef200ff3 ,
including comparison between AIRA v1 to AIRA v2, FAQs, and other documentation.

3.2.2. AI QRM (AI Quality Risk Management)

EY Fabric AI Quality Risk Management (AI QRM): Supports standardized process for evaluating and mitigating AI system
risks to ensure alignment with the EY Responsible AI Policy. All solutions implemented must adhere to EY AI Engineering
Standards. Ensuring compliance with these standards is a fundamental aspect of all AI QRM evaluations.

•  All AI systems, including agents, must first be registered in AIRA.

•  AI systems with Medium or High Overall Risk ratings must additionally go through AI QRM review.

•

Certain “Approved Platforms” allow for skipping full AI QRM review, if the platform has reached “Approved AI
QRM Platform Status”. This only applies to 1) EYQ Agent Studio (formerly, EYX) and 2) NVIDIA Agent Builder
(formerly, EYQ Agent Builder).

Once AIRA is completed, proceed to the AI QRM Application. Ensure that all relevant team members are onboarded to the
application.

•

•

•

Search for your system in the AI QRM Application.

Select the appropriate version and on board your system.

Begin your AI QRM Assessment and submit it for review when you are ready.

For more information:

•  Video Guides: https://explore.eyfabric.ey.com/eydx/content/57920c92-e1bd-4b10-8faf-09a3fba2b398  ·

•

Full Documentation: https://connect.eyfabric.ey.com/eydx/content/998ee1bc-2855-42d2-8f5c-86c9ef200ff3 ,
including User Manual, FAQs, and other documentation. For any technical issues with the AIRA app, please reach
out to sbpl1servicedesk@in.ey.com. Please create the Asset in APM or EMPIRE. Assets should be added to both
tools when implementing or in development. For issues with ID creation, please contact: apm@gds.ey.com  and
empire@ey.com

33

3.2.3. Data Protection AI Assessment

Data Protection reviews for AI Systems including AI Agents are essential to identify, assess, and mitigate potential AI
specific data protection and confidentiality risks associated with the development or deployment and use of AI Systems.

In conjunction with EY’s Global Data Protection and Confidentiality Policy and EY’s Global PIA Procedure, all AI Systems
that are developed, trained, fine-tuned or intended to be used for the processing of EY Information including personal
data, client information, third-party Information and EY business Information must be submitted for review by the
relevant data protection team.

The consultation with the relevant data protection team shall support business teams with:

•

The identification and assessment of data protection and confidentiality risks associated with the development,
procurement or use of AI Systems including AI Agents.

•  Risk mitigation strategies and guardrails appropriate to the identified data protection and confidentiality risks.
The responsible use of EY Information in accordance with applicable data protection laws and regulations,
•
professional standards as well as contractual commitments.

More information on EY’s Global approach to data protection can be found on the Data Protection Community site.

3.2.4. Information Security AI Assessment

Please go through the AI Agents Security Governance documentation while building AI agents with appropriate
safeguards to ensure the secure deployment of AI agents.

Please refer to the EY Global Information Security section 4.21 at Secure Application and System Policy (SASP)  that
described the AI Agent security controls. Every AI Agent implementation team must go through the Information Security
Certification (if applicable) and a checklist for the same is published at AI Agent security certification review guide

3.3. AI Factory Governance

EYQ Agent Studio offers you a visual environment where you can manage your agents effortlessly. EYQ Agent Studio is
your passport in creating AI agents. With its user-friendly interface, the inspiring Agent Creator Lab, and the opportunity
to share your creations in the EYQ Marketplace.

34

As depicted above, EYQ Agent Studio provides a structured workflow for Agentic development, divided into three phases:
Idea, Design & Build, and Operate. The "Idea" phase involves submission evaluation, clarification, and decision-making for
proof of concept (POC). The "Design & Build" phase includes MVP (Minimum Viable Product) creation, quality checks, and
deployment readiness. The "Operate" phase focuses on feedback assessment, enhancement decisions, and ongoing
monitoring. The process incorporates no-code, low-code, and pro-code approaches with clear decision points and funding
steps.

This feature is currently available for limited use as a pilot roll out. Please visit EYQ Agent Studio | EYDX | Connect | EY
Fabric for more information.

3.4. EYQ Agent Onboarding Governance

EYQ Agent Onboarding Governance caters to onboarding an AI agent to the EYQ Marketplace to use EYQ platform
capabilities and seamless experience to the end-user in a unified user interface.

3.4.1. Pre-requisites for Copilot Studio Agent

If the AI Agent is developed using Microsoft Copilot studio, then EYQ allows only Direct Line key based authentication for
integration. Please follow the following steps:

•

Submit a DLP change request at Power Platform & Dynamics 365 - DLP Change Request - Power Apps (DLP
Management tab)

•

Click on authentication and get the web channel security key to share with EYQ Platform Admin Team.

35

3.4.2. Agent Onboarding Steps

Please follow the below onboarding steps either Copilot Studio or pro-code/custom agent to the EYQ platform:

1.  Fill the questionnaire EYQ Agent Onboarding Questionnaire.xlsx specifying the agent data products, meta data,

owner, API end points etc. send an email to EYQ Agent Onboarding Team  EYQAgentAdmin@ey.com attaching the
filled questionnaire to onboard the AI agent into EYQ Development and QA environment. EYQ Agent Onboarding
Team will review the filled questionnaire and onboard the agent to EYQ Development environment
(https://eyqdev.eyfabric.ey.com/) for your agent integration and testing.

2.  After onboarding to EYQ Development Environment, test the skill in EYQ Development environment and make

sure everything works as expected. Once successful, send an email to EYQ Platform EYQAgentAdmin@ey.com to
onboard the agent to EYQ QA Environment (https://eyqqa.eyfabric.ey.com/)

3.  Once QA validation is complete, please send an email to EYQAgentAdmin@ey.com attaching the Change Request

(CR) approval to promote the agent to UAT (https://eyq-uat.eyfabric.ey.com/) and Production
(https://eyq.eyfabric.ey.com) environment.

Note: EYQ Platform Team is working on a seamless self-service onboarding experience. Service line specific agents, for
example Assurance (Audit) will be available on Canvas audit platform. These agents may be available in EYQ Marketplace
for wider consumption.

3.5. Microsoft Copilot Studio Agent Governance

Microsoft Copilot Studio environment is minimal cost for EY users until 30th June 2026. EY has established AI governance
process for Copilot Studio custom Agents from building, sharing and publishing to various channels. There is a specific
governance process for POC, Dev, QA, UAT and Production based on the geographical scope, usage and risk associated
with the AI Agents. This governance process is aligned with Microsoft Power Platform and Copilot Studio AI Agent
governance at scale for security, control, track and refine.

The overall Microsoft Copilot Studio custom Agent governance is based on zone concept considering technical complexity
and risk/business criticality as described below:

•

Learning/Personal use in Copilot Studio for POC and Development Purpose
o  By default, limit sharing is enabled for Owner and 2 additional users
o  Can be extended to a maximum of 10 users after classifying via Low Code Assessment Tool
o  An email will be sent to Data Risk for awareness
•  Business use in Copilot Studio for POC and Development Purpose
o  By default, limit sharing is enabled for Owner and 2 users
o  Copilot Studio agents can be shared with up to 25 users after classifying via Low Code Assessment Tool
o  Complete just the regulatory modules of AIRA (regulatory risk assessment and role) at this stage
with Full EY governance (AIRA + AI QRM based on the risk assessment + appropriate testing before
launch) completed prior to move to production.

o  An email is sent to Data risk to make aware of an AI Agent

•  Business use in Copilot Studio for Production Purpose

o  By default, limit sharing is enabled for Owner and 2 additional users
o  Can be extended to unlimited users or Azure AD Security Group after classifying via Low Code

Assessment Tool

36

o  You must make an entry in AIRA (AI Risk Assessment) and then go through AI QRM (AI Quality Risk

Management) process depending on the AIRA risk classification

Below diagram depicts the high-level governance process to build and publish an AI Agent built using Microsoft Copilot
Studio for production roll out.

1.  Once a Copilot Studio environment is provisioned through EY Fabric Marketplace request process, GenAI feature is

not enabled by default except US region due to data movement across azure regions (aka DLP – Data Loos
Prevention). You must submit the request at Power Platform & Dynamics 365 - DLP Change Request - Power Apps
(AI Tab -> move data across region) and select your InfoSec Consultant to approve. For more information, refer to
Power Platform & Dynamics 365 - DLP Change Request | EY Fabric

2.  Submit request at Assessment App - Power Apps for classification and assessment. For more information, refer to EY

Fabric Power Platform Solution Assessment App | EY Fabric

3.  Before publishing your agent, you must obtain approval from

o
InfoSec (If you do not know your Security Consultant, please visit Security Consulting Database)
o  Service Line/Function specific AI approval depending on country, region and data classification
o  AIRA (AI Risk Assessment)
o  AI QRM (AI Quality Risk Management)
o  Data Protection (contact your local data protection team for guidance)

4.  Submit the Service Now Intake request form to publish your agent to Microsoft Teams and Microsoft Copilot Studio

Agent Store (https://m365.cloud.microsoft/ )

3.6. Process for releasing a Generally Available (GA) Agent

Below table provides reference links for EY standard and service line specific processes.

Process

AI QRM

PIA

BIA & IIA

IRA

OSS

SPR

Security Certification
Testing

Description

Reference Links

AI Quality and Risk Management

AI QRM Documentation Area

Privacy Impact Assessment

PIA Process

Business Impact Analysis and Infrastructure Impact
Analysis

BIA and IIA Guidance

Inherit Risk Assessment

Open-Source Software

IRA Process

OSS Process

Security Project Record to initiate InfoSec review

Security Consulting Database

Information Security Certification

Certification Testing

AI Agent Certification Testing
Checklist

37

Process

Description

Security Scan

Security Scan

Service Line Specific Processes

Reference Links

Security Scan

Assurance

EY Atlas Documentation Portal

EY Atlas

Audit

Assurance AI QRM Documentation Area

Coming Soon

Consulting

Consulting Tech Asset Approval Workflow (CTAAW)

Consulting Tech Asset Approval
Workflow (CTAAW)

FSO Tax

FSO Tax Technology and Tools Guide

FSO Tax

Tax

Tax Technology Approval Roadmap (TTAR)

TTAR

EY Parthenon (formerly,
SaT)

SaT Technology Approval Process (TAP)

Strategy and Transactions
Technology Approval Process
(TAP)

38

4. Chapter 4: Getting Started

This section describes the development steps to be followed based on the technology selection you have made for your
agent build.

4.1. M365 Copilot Agent Builder

This section will help to understand the required process for getting started with Agent Development Microsoft 365
(M365) Copilot Agent Builder for individual or small team use. Before you get started, please Discover what Microsoft
365 Copilot can access and different types of agents. This is NOT the same as Microsoft Copilot Studio. These agents
cannot scale in enterprise grade and cannot be onboard to the EYQ Marketplace.

Before you proceed, please check if you have the M365 Copilot license. To do so, navigate to
https://m365.cloud.microsoft/ and sign in using your EY primary email address. If you see the “Create agent” option as
shown below, then you can create agents.

If you do not have M365 Copilot license, then check the roll out at Register for M365 Copilot in your region

4.1.1. Agent Builder in M365 Copilot

This section describes how you can develop an agent using Agent Builder in Copilot Chat.

1.  Navigate to https://m365.cloud.microsoft/  and click on “Create Agent” present in the left side navigation. You

can select Microsoft provided agent templates (meeting coach, prompt coach, writing coach, scrum Assistant etc.
Various agent templates are available as list when creating an agent) to kick start, then customize further. Also,
you can start creating an agent from a blank template.

2.  Watch the videos at Agents in M365 Copilot for detailed steps to create Declarative Agents using Agent Builder

in M365 Copilot. Configure the agent using the instructions, knowledge and outcome.

3.  Click “Create Agent” on top left corner and agent will be created as shown below:

4.  The created agent will be available under “Agents” in the left side navigation for you and users you have shared

to.

5.  Refer to the article Share Agent Builder in M365 Copilot with licensed users for all information on sharing Agents

developed using Agent Builder in M365 Copilot.

4.1.2. Agent Builder in SharePoint Site

You can use AI-powered SharePoint agents to streamline workflows and foster collaboration that suits your team or
organization. SharePoint agents can answer questions about the content on any SharePoint site or document library that
the asker has permission. This section describes how you can develop an agent using Agent Builder in SharePoint Site.
You must have SharePoint Site Contributor rights to create the Agent.

39

1.  Navigate to the document library within the SharePoint site. Click on “Create an agent” from the navigation bar

or drop-down menu available under “New” as shown below:

2.  Provide description and instructions as shown below:

3.  Add the knowledge sources

4.  Find the agent you want to share from the agent list. Select the ellipsis and then select Share. You can then use

the Copy Link option to grab a link to the file. You can send the link to your colleagues as you do for sharing other
files. The person who receives the link can select the link to open the agent.

40

4.2. Microsoft Copilot Studio Agent Builder

Microsoft Copilot Studio provides a low-code AI agent builder to develop intelligent automation across Microsoft's 365
ecosystem. By incorporating agentic AI into applications such as Teams and SharePoint, it streamlines the workflows while
receiving AI-driven support and can eventually graduate to enterprise grade agents

1.  First you need to check the availability region and language support at Copilot Studio agent builder regional

availability and language support | Microsoft Learn to cater data residency requirements.

2.  Copilot and Generative AI features are enabled by default in United States region. If you are fine with United

States region, then request for a copilot studio environment in EY Fabric Marketplace at United States Region
Copilot Studio Environment. Fill out the copilot agent name, service line, environment name. It will take 20 to 30
minutes to provide the environment. This will provide a Copilot studio environment for you to create the agents.
Both Copilot Studio environment and data (prompts and responses) never leave United States region.

3.

If you would like your Copilot environment other than United States, then submit the EY Fabric Marketplace
request at Non-United States Region Copilot Studio Environment. It will take 20 to 30 minutes to provide the
environment.

a.  As data (prompts and responses) traverse across regions, sperate request must be submitted at Power
Platform & Dynamics 365 - DLP Change Request - Power Apps (AI tab) to enable Generative AI features
as shown below. This is only to make calls to Microsoft AI Services hosted in US Azure regions, but the
prompts and responses are stored in the azure region where Copilot environment is present. Detail
information is located at Move data across regions for Copilots and generative AI features - Power
Platform | Microsoft Learn

Once the request is submitted, your InfoSec Consultant will approve the request and then Generative AI
features will be enabled.

4.  Navigate to the Microsoft Copilot studio environment at https://copilotstudio.microsoft.com/ and then choose

your environment from the drop down as shown below:

41

5.  Describe your agent, provide instructions, configure the knowledge sources and upload the files.

6.  Submit the request at Assessment App - Power Apps to assess your Copilot Agent for sharing and publishing.

7.  Refer to the article on how to publish your agent into M365 Copilot Agent Store.

8.  Refer to the article on how to publish your agent into the EYQ Marketplace.

4.3. Pro-code Agent Development

EYQ supports the ability for Agents to be using professional development approaches (pro code) and enables agents to be
run and managed by teams in EY. To help accelerate your ability to build agents for EY the EYQ team has provided EY
Standard Starter Kits that vastly speed up your time to market with pro code agents. EY Standard Agent Starter Kits are
designed to get you up and run quickly and include all the necessary guidance, guardrails and InfoSec approved to make
sure your Agent can be integrated into the EYQ product. The starter kit has built-in code to integrate with EYQ Platform.

•  Read documentation to get started with Agent Development with EYQ. This documentation describes the

prerequisites for your Agent Development Projects

•

Select your Code Template and Framework based on the decision tree documented under Agentic Framework
section. Each Starter Kit will have a detailed README file that will contain everything necessary to get your
Agent running in a local development environment.

Framework

Language

Description

URL

Microsoft Agent
Framework

Python

EY Standard Template for Agent
Orchestrator in Agent Runtime (ART)

https://github.com/ey-org/ey-ai-art-
agent-orchestrator

Microsoft Agent
Framework

.NET C#

EY Standard Template to help you get
your first agent up and running

https://github.com/ey-org/ey-ai-art-
af-lowcode-agent

AutoGen

Python

EY Standard Starter Kit to help you get
your first agent up and running

AutoGen

.NET C#

EY Standard Starter Kit to help you get
your first agent up and running

Semantic Kernal

Python

EY Standard Starter Kit to help you get
your first agent up and running

Semantic Kernal

.NET

EY Standard Starter Kit to help you get
your first agent up and running

LangGraph

Python

EY Standard Starter Kit under
development

https://github.com/ey-org/ai-agent-
standard-starter-
kit/tree/master/autogen/python

https://github.com/ey-org/ai-agent-
standard-starter-
kit/tree/master/autogen/dotnet

https://github.com/ey-org/ai-agent-
standard-starter-
kit/tree/master/semantic-
kernel/python

https://github.com/ey-org/ai-agent-
standard-starter-
kit/tree/master/semantic-
kernel/dotnet

https://github.com/ey-org/ai-agent-
standard-starter-
kit/tree/master/langgraph/python

42

Based on your decision on the Agentic Framework (Semantic Kernel, AutoGen and LangGraph), the diagram guides the
development team to get started to build the agents. If your agents go live date is beyond Feb 2026, then consider
Microsoft Agent Framework for agent development instead of AutoGen, Semantic Kernel and LangGraph.

As described above, there are two approaches for pro-code development:

•

Cloning EY Standard Starter Kit code to your project GitHub repo and use your own compute to host the agent
(Python language for Semantic Kernel, LangGraph and AutoGen)

•  Azure OpenAI offering with option to standard GitHub repo and default compute to host the agent (.NET C#

language for Semantic Kernel and AutoGen)

Before you start, the first step is learning and understanding models and their capabilities.

•

The documentation EYQ Incubator explains the overall incubator program and contacts, this is for learning and
experimentation with Azure OpenAI endpoint for developer.

•  Understand the Model Availability for your AI Agents the following guide Model Regional Available to plan which

model is best suited to your business problem you are trying to solve.

4.3.1. Azure OpenAI Offering with compute for AutoGen and Semantic Kernel - .NET

•

EY Fabric Marketplace Azure OpenAI offers options to deploy minimum infrastructure and Azure OpenAI instance
through governance process. Before you start the process of requesting Agent Infrastructure through Azure
OpenAI Offering you need to make sure you have the necessary prerequisites in place.

•  You need to have an MSP01 account before proceeding, these are required to manage access into Azure

Infrastructure resources.

o  You can request an MSP01 account using this link Code Hub Secondary Accounts

•  Before requesting infrastructure, you need to create an MSP01 Group, you need to be logged in with Ping ID

before accessing the URL https://sae.ey.net/

43

Agentic Framework?NoSemantic KernelAzure OpenAI Offering deployed to Web App. Option for Redis Cache, PostgreSQL, Github Repo and CI/CD PipelineLanggraphCoding Language?PythonEY Standard Starter Kit(Clone the Github Repo)Existing compute for hosting?Coding Language?Autogen.NET C#.NET C#Existing compute for hosting?PythonYesNoYesCoding Language?Python

•  Use this format “IT-EY-NameOfYourTeam_MSP01-Team”

•  Create your group and write it down

•  Progress to requesting the Azure OpenAI instance along with the Agentic Framework Starter Kit and Compute

using the white glove EY Fabric Marketplace request form

•  When you fill the information, you will find a section called “Additional Resources” as shown in the below image
and select “Yes” under “Agent Incubator” level. This will display all required components and options to
select Aure Redis Cache, Azure PostgreSQL, GitHub Repo and CI/CD Pipeline:

44

•  You have the option to create the GitHub repository and then select the agentic framework i.e. AutoGen v0.4

or Sematic Kernel v1.0 .NET code.  This option clones the EY Standard Starter Kit code to the newly created
GitHub repository and deployed to the Web App along with other azure infrastructure components selected.

If you have your own Azure Compute to host the AI Agents, then refer to the below section to clone the EY Standard
Starter Kit

Once you have submitted the request form, you can wait for the EY Fabric Azure OpenAI offering team to complete your
request and receive an email with required information to start your agent development journey.

4.3.2. Agent Development using AutoGen, LangGraph and Semantic Kernel - Python

Currently, EY Fabric Azure OpenAI offering does not provide option to deploy AutoGen and Semantic Kernel Standard
Starter Kit for Python Language. Hence, you need to first request the Azure OpenAI Instance and then Clone the GitHub
Repo to get started as described below.

•

Before you start the process of requesting Azure OpenAI Offering you need to make sure you have the necessary
prerequisites in place.

•  You need to have an MSP01 account before proceeding, these are required to manage access into Azure

Infrastructure resources.

o  You can request an MSP01 account using this link Code Hub Secondary Accounts

•  Before requesting infrastructure, you need to create an MSP01 Group, you need to be logged in with Ping ID

before accessing the URL https://sae.ey.net/

•  Use this format “IT-EY-NameOfYourTeam_MSP01-Team”

•  Create your group and write it down

•  Progress to requesting the Azure OpenAI instance in EY Fabric Marketplace Request Form

45

•

If you would like to create a new GitHub Code Repository, then you can do this at fabric.ey.com by following the
steps below:

o  Create a Team using Manage->Teams, you need to have three team members as Admins (infosec rules).

o  Create a Billing Account using Manage->Financials , you will need to have an active engagement code

(the cost of managing the Repos is managed at a member firm level), and select the team you create in
the previous step.

o  Create a Workspace using Manage->Workspace , you need to select the Team and the Billing Account

you created in previous step.

•  You are now ready to create your Git Repositories within EY Fabric and use the Copilot Agent tooling to accelerate
your development. These steps assume you are on a Mac or Windows machines with WSL running Linux Instance
and you have standard development tools installed.

o  Clone the repository using the link to your development workstation, you can access the links from the
table above. Each EY Standard Starter Kit has a comprehensive README file. We recommend reading
this before cloning. You can clone either using HTTPS or SSH.

SSH Command: git clone git@github.com:ey-org/ai-agent-standard-starter-kit.git
▪
▪  HTTPS Command: git clone https://github.com/ey-org/ai-agent-standard-starter-kit.git

o  Execute cd ai-agent-standard-starter-kit
o  Rename the cloned repository to the name you will be using for your agent e.g. tax-agent-python

Execute mv ai-agent-standard-starter-kit tax-agent-python

o
o  Execute cd tax-agent-python

•  Navigate to the corresponding folder (e.g. AutoGen/python/v1.0)

o  Go to your Workspace you created earlier and select Artifacts->Code and then click Create artifact and

select Start from empty repository.

o  Give an agent a Git Repository name e.g. tax-agent-python

o  Select the engagement code (this is used for any GitHub Actions executions that may occur).

o  Select Submit.

•

In the Code Artifacts view click on the Repository name and it will open GitHub repository view for you.

•  Now we need to replace the git remote configuration with the cloned repository and update it to the new

repository you created.

o  Remove the original code from git history, make sure you are inside the cloned git repository

▪

▪

rm -rf .git

git init

o  Add new origin to point to our Git Hub Enterprise repository we created

▪

git remote add origin git@github.com:ey-org/tax-agent-pyton.git

o  Now it will let you create a pull request into the master branch, let us create branch call dev

▪

▪

▪

▪

▪

git pull

git checkout -b dev

git add .

git commit -m git@github.com:ey-org/tax-agent-pyton.git

git push --set-upstream origin master –force

•  Return to your Git Repository from the Workspace and you will see the request to create a pull request

46

•

Create the pull request and merge into the master branch, don’t forget to run the git pull (locally) to bring
the changes down into your master branch

•  You can now edit the source code directly in GitHub Code Spaces and use the built in Microsoft CoPilot Agent

tools to accelerate the build of your agent using Claude and OpenAI Models.

o

In the Workspace -> Code artifacts view, click on the Pen Icon (edit) this will open Code Spaces

o  Login into CoPilot icon bottom right you will see the following Visual Studio Code Editor view with your
familiar tools. You can set up Visual Studio Code locally as well with the same Copilot Agent tools.

•  You are ready to iterate on the development of your agent.

47

4.4. NVIDIA AI Compute

EY Fabric offers NVIDIA AI Compute to leverage the NVIDIA stack for various use cases. To request Azure VMs with
NVIDIA GPUs, submit your request using the above offering in EY Fabric Marketplace. You can request Sandbox and Non-
Prod environments which are approved for C1 data (publicly available and synthetically generated). Also, EY Fabric has
released the Marketplace offering to request for Staging and Production environment.

The non-prod environment is dedicated to the solution teams for development and testing purposes with non-prod data,
with costs charged for the deployed components. Both environments include pre-installed software and an NVIDIA AI
Enterprise license on the VM. Supported Azure regions are West US, West US2, and South-Central US. Development
teams can choose the appropriate memory and GPU hardware profile based on your requirements.

EY Fabric has onboarded Vultr (NVIDIA Cloud partner) for Staging and Production environments in USA, Europe, UK and
APAC regions. EY Fabric will enable Azure for staging and production workloads in FY26 Q3. Also, EY Fabric is working
with IBM to provide NVIDIA GPU Compute in IBM Cloud. By this, the customers will get multiple options for GPU types and
Cloud Service providers.

4.5. Process for releasing a Generally Available (GA) Agent

You need to follow the standard EY processes as applicable for pro-code agent deployment to production.

Process

Description

Reference Links

AI QRM

AI Quality and Risk Management

AI QRM Documentation Area

PIA

Privacy Impact Assessment

PIA Process

BIA & IIA

Business Impact Analysis and
Infrastructure Impact Analysis

BIA and IIA Guidance

IRA

OSS

Inherit Risk Assessment

IRA Process

Open-Source Software

OSS Process

Service Line Specific Processes

Assurance

Assurance specific AI policies

EY Atlas

Service line specific agents, for example Assurance (Audit) will be available on Canvas audit platform. These agents may
be available in EYQ Marketplace for wider consumption.

4.6. EYQ API Specifications

This section describes the APIs exposed by EYQ Platform for seamless experience by the Agent Development team. These
API specifications are primarily meant for pro-code agent development. There are three categories of agents exposed by
EYQ platform as described in the sub sections below.

4.6.1. APIs Built by Agent Development Team for EYQ Integration

Agent development team will comply to below API specification to onboard the agent to EYQ Marketplace. This is a set of
APIs that Agent Development must build and expose for the end-users to communicate with the agent. Agent
development team can expose their endpoint following the EYQ request and response schema. EYQ will map the API
endpoint with the agent endpoint in the agent configuration file.

Agent implementor must:

•  Validate the EYQ authentication token
•  Authorization required even if the agent is not exposed to all internal EY users

48

•

Save the conversation (prompt and response) within their platform

Agent implementor may:

•  Upload end-user file through GetAnswer end point
•
•

Store the end-user feedback
Implement any reference file download such as citation, generated file based on user prompt

API Endpoint

/user/validate

Method

Requir
ed

Description

POST

Yes

Validate user for access to the EYQ agent
based on the agent requirements.

/getAnswer

POST

Yes

/getAnswerStreaming

POST

Yes

Chat end points to get answers based on
user prompt for the complete response. It
supports passing the file URL uploaded to
the EYQ workspace.

Either getAnswer or getAnswerStreaming is
required.

Chat end points to get answers based on
user prompt with streaming for better user
experience, does not have to wait for the
complete response. It supports passing the
file URL uploaded to the EYQ workspace.

Either getAnswer or getAnswerStreaming is
required.

/conversations/:conversationId/messa
ges[?startDate][&endDate][&pageSize]
[&pageNumber][&sortColumn][&sortOrde
r]

GET

Yes

Get conversation messages based on
conversation ID for end-user conversation
history.

/conversations/:conversationId

DELETE

Yes

Delete end-user chat conversation based on
conversation ID (unique to each
conversation session)

/conversations/:conversationId/messa
ge-feedback

POST

No

Post message feedback based on
conversation ID

/download

POST

No

Download the file

The Postman collection at EYQ Agent Invocation can be used to test the integration during development phase. You
must have Postman Enterprise license to access Postman collection. If you do not have access to the Postman collection,
then submit the request within Postman interface and EYQ Platform Admin team will approve the request within 1 or 2
working days.

4.6.2. Platform API Specification for Agent Consumption

If a team would like to view and get the conversations for a specific user interacted in a conversation with multiple agents
through their custom web or mobile application, then EYQ APIs below can be leveraged.

API Endpoint

Method

Description

/conversations/init[?type]

POST

Initialize the conversation

/conversations

POST

Create the conversation

49

/conversations[?startDate][&endDate][&statu
s][&filters][&sortOrder][&sortColumn][&page
Number][&pageSize][&isBookmarked][&workspac
eId]

GET

Gets paginated conversation list

/{conversationId}/messages[?startDate][&end
Date][&filters][&sortOrder][&sortColumn][&p
ageNumber][&pageSize]

GET

Gets all conversation messages for a
conversation id

To consume EYQ API, please send an email to EYQAgentAdmin@ey.com. The EYQ Agent Admin Team will review and
approve the request within 1 to 2 business days. Please refer to Onboarding - Microsoft Azure API Management -
developer portal (use EY SSO AD to login to the portal) on how to get started.

4.6.3. Agent Management API Specification

The API endpoints below are not publicly available, limited to EYQ Agent Studio (Formerly, EYX) platform.

Endpoint

Method  Description

/user/validate

POST

Cali

/agents/conversation-starter

POST

Add conversation starter

/agents/configuration

POST

Adds a new configuration for an agent asynchronously.

/agents/conversation-starter

PUT

Adds a new conversation starter to the system.

/agents/configuration

PUT

Adds new agent configuration to the system

/agents

POST

Creates an agent asynchronously

/agents/versions

POST

Creates an agent version asynchronously

/agents/{uid}

GET

Get agent details by Agent ID

/agents/versions/{uid}

GET

Get agent version by Agent ID

/agents/publish

PUT

Publish the agent into draft, piloting or pending
governance state.

/agents/mentions[?filter][&WorkspaceI
d]

[&IsCollaboratorChatSkillsOnly]

[&pageNumber]

[&pageSize][&sortColumn]

[&sortOrder][&searchText]

/agents/agentconfig?agentTypeId={agen
tTypeId}

[&agentSubTypeId]

GET

Retrieve agent mentions

GET

Retrieves agent config by agent type and sub type

/agents/configuration/{guid}

GET

Retrieves agent configuration by its unique identifier.

50

Endpoint

Method  Description

/agents/conversation-starter/{uid}

GET

Retrieves a conversation starter by its unique
identifier.

/agents/subtypes[?sortColumn]

[&agentId][&pageNumber]

GET

Retrieves the agent subtypes by agent ID

[&pageSize][&sortOrder][&searchText]

/agents/types[?sortColumn]

[&pageNumber][&pageSize]

GET

Retrieves the agent types

[&sortOrder][&searchText]

/agents/{uid}

PUT

Updates an agent asynchronously

/agents/versions/{uid}

PUT

Updates an agent version asynchronously

4.6.4. Error Handling

All errors are caught by error handling mechanism. Errors are categorized and translated into standard error codes. Each
error code has a corresponding human-readable message to describe the issue. Responses with errors will follow a
consistent structure, including an error_code, error_message, and, where applicable, a detailed_description attribute.

For Example:"error_code" (indicative): "404_NOT_FOUND", "error_message": "Requested resource was not found.",
"detailed_description": "The endpoint /example/missing-endpoint does not exist."}

4.7. GitHub Repositories/Postman Collections

The following repositories can help you get started with your agent pro code development journey.

Sample GitHub Repo/Postman
Collection

Github Path

EY Agent Runtime (ART)
Standard Template for MCP
Server - Python

EY Agent Runtime (ART) Agent
Orchestrator using Microsoft
Agent Framework - Python

EY Standard Template for
Microsoft Agent Framework -
.NET

https://github.com/ey-org/ey-ai-art-fabric-mcp-server

https://github.com/ey-org/ey-ai-art-agent-orchestrator

https://github.com/ey-org/ey-ai-art-af-lowcode-agent

Access

Read-only

Read-only

Read-only

EY Standard Template for
AutoGen - .NET

https://github.com/ey-org/ai-agent-standard-starter-
kit/tree/master/autogen/dotnet

Read-only

EY Standard Template for
AutoGen - Python

https://github.com/ey-org/ai-agent-standard-starter-
kit/tree/master/autogen/python

Read-only

EY Standard Template for
Semantic Kernel - .NET

https://github.com/ey-org/ai-agent-standard-starter-
kit/tree/master/semantic-kernel/dotnet

Read-only

EY Standard Template for
Semantic Kernel– Python

https://github.com/ey-org/ai-agent-standard-starter-
kit/tree/master/semantic-kernel/python

Read-only

51

Sample GitHub Repo/Postman
Collection

Github Path

Access

EY Standard Template for
LangGraph – Python

https://github.com/ey-org/ai-agent-standard-starter-
kit/tree/master/langgraph/python

Read-only

Sample RAG based Agent - .NET

https://github.com/ey-org/ai-agent-standard-starter-
kit/tree/master/RAG/dotnet

Read-only

Sample RAG based Agent -
Python

https://github.com/ey-org/ai-agent-standard-starter-
kit/tree/master/RAG/python

Read-only

EYQ Agent Invocation

https://ey.postman.co/workspace/c59c25a8-4504-4b48-
83ab-6827686a466a/collection/30477524-e5768be0-f304-
47bc-8a85-04ff296e0fc8

Read-only

4.8. Learning Resources

Area

Description

Introduction to Microsoft 365
Copilot

Introduction to Microsoft 365 Copilot - Training | Microsoft Learn

Articles on Microsoft 365 Copilot  Knowledge Base - Help Portal

Develop AI solutions in Azure

Plan and Prepare to Develop AI Solutions on Azure - Training | Microsoft Learn

Agent Builder in SharePoint

Get started with SharePoint agents - Microsoft Support

Semantic Kernel

Develop generative AI apps with Azure OpenAI and Semantic Kernel - Training |
Microsoft Learn

LangGraph

LangGraph- Develop LLM powered AI agents with LangGraph | Udemy Business

NVIDIA Learning Path

NVIDIA Learning Pathways | EYDX | Connect | EY Fabric

52

5. Appendices

5.1. Applications

Area

URL

AIRA & AIQRM

Responsible AI Platform

Microsoft Copilot Studio Viva
Engage

5.2. Contact Matrix

Viva Engage - Microsoft Copilot Studio

Issue

Contact

EY.ai Standards

EY.AIStandards@ey.com

AI Security Consulting

D-UG-EYFabric-AI-SecConsulting@ey.net

AI QRM Team

AI Quality & Risk Management (AI QRM) | EYDX | Connect | EY Fabric

aiqrm@ey.com

AI Regulatory Compliance

FAQs | EYDX | Connect | EY Fabric

airegulatorycompliance@ey.com

AI Factory

AI Factory | EYDX | Connect | EY Fabric

EYQ Platform Support

Fabric Operations Support | EYDX | Connect | EY Fabric

NVIDIA Core Team

NVIDIA | EYDX | Connect | EY Fabric

D-UG-NVIDIA-CoreTeam@ey.net

53

Administrative Provisions

Document Summary

Document Name

AI Agent Development Framework: Comprehensive Standards Guide

Document Description

This document consolidates all prior AI Agent development, deployment, and governance
guidance into a single enterprise standard.

Document Type

AI Standard

Document Owner

Jimmy Jos

Prepared By

Rajesh Kumar Panda

Reviewed By

Matt J Perrins

Jimmy Jos

John M Whittaker

Pablo Cebro

Version History

Version
Number

Date

Description of changes

1.5.2

17 Mar 2026

Updated AI Agent Development Platform Selection section.

1.5.1

20 Feb 2026

Minor fixes to typo errors and alignment of terms for consistency.

1.5

29 Jan 2026

Updated the simplified AI Agent Governance process.  Name change from “Microsoft
Copilot Studio Lite” to “Agent Builder in M365 Copilot” and “Microsoft Copilot Studio Full”
to “Microsoft Copilot Studio”.

1.4

18 Dec 2025

Added Microsoft Agent Framework, Microsoft Foundry, and starter kits for MCP Server
and Agent Runtime. Updated NVIDIA compute environment.

1.3.1

28 Oct 2025

Added Data Protection AI Assessment in the AI Governance Processes and Overviews.

1.3

24 Oct 2025

Added new sections for NVIDIA environments and AI Language Models. Updated NVIDIA
Stack, AI Governance Processes and Overviews.

1.2

6 Oct 2025

Restructured the document into chapters as AI Agent Standards & What’s Next, AI Agent
Governance and Standards, Getting Started. Added Microsoft Copilot Agent Governance,
NVIDIA AI Compute Environment sections.

1.1

1.0

2 Sep 2025

Incorporated EY.ai core team review comments and released to wider audience.

7 Aug 2025

Draft version for EY.ai core team to review.

Signed Off By

Name

Email

Role

Andreas Toggwyler

andreas.toggwyler@ch.ey.com

Global Assurance Technology Officer

Benjamin Ambrosino

Ben.Ambrosino@ey.com

Global Tax Technology Officer

Benjamin Kreck

Benjamin.Kreck@de.ey.com

CT Managed Services and Data Leader

Biju Varghese

biju.varghese@gds.ey.com

Global NITRO Leader

Boris Marcelo Villazon
Terrazas

Boris.Marcelo.Villazon.Terrazas@es.ey.com   Europe West Technology - AI Tech Leader

Darrin O Karras

Darrin.O.Karras@ey.com

Global Consulting Technology Officer

Jessica R Dunn

Jessica.R.Dunn@ey.com

Global Technology Officer - Applied
Innovation | Clients & Industries

54

Name

Jimmy Jos

Email

Role

Jimmy.Jos@gds.ey.com

EY Fabric Data & AI Architect Lead

Joe Sendelbach

Joseph.SendelbachIII@ey.com

Global EY AI PMO Lead

Joe Xu

Joe.Xu@ey.com

AI InfoSec Consulting Lead

John M Whittaker

John.Whittaker@ey.com

EY Fabric Strategy Leader

Jon Caplinger

Jon.Caplinger@ey.com

Consulting

Jonathan DeGange

Jonathan.DeGange@ey.com

CT AI Quality and Risk Management Leader

Matt J Perrins

Matt.Perrins@ey.com

EY Fabric Lead Architect

Marc Ryser

Pablo Cebro

marc.ryser@ch.ey.com

Assurance

Pablo.Cebro@gds.ey.com

CT Platform and Emerging Technologies
Leader

Customer Success & Commercials Leader,
Client Technology

Robin Hutchinson

robin.hutchinson@uk.ey.com

Stephen P Newman

Stephen.Newman@ey.com

CT Engineering Leader

55


