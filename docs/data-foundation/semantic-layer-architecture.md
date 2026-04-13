4/13/26, 3:42 PM

Semantic Layer Architecture: Components, Design Patterns, and AI Integration | Databricks Blog

Blog / Data + AI Foundations / Topic

Conclusion

Semantic Layer Architecture:
Components, Design Patterns, and AI
Integration

Learn how semantic layer architecture works — core components, design
patterns, modern vs. traditional approaches, and how it powers AI agents and
LLMs

Data + AI Foundations

15 min read

By Databricks Staff

Share this post

Keep up with us

Subscribe

https://www.databricks.com/blog/semantic-layer-architecture-components-design-patterns-and-ai-integration

1/17

4/13/26, 3:42 PM

Semantic Layer Architecture: Components, Design Patterns, and AI Integration | Databricks Blog

Every organization eventually hits the same wall. Two teams ask for

the same metric and get different numbers. A language model

answers instantly but contradicts the finance report. A new hire

spends their first week figuring out which dashboard to trust. These

are not isolated tool problems — they are symptoms of a semantic

layer problem.

A

 semantic layer

 is the architectural component that translates

source data into shared business meaning. It defines the metrics,

dimensions, and governed definitions that enable consistent data

access across every downstream surface — dashboards, query

editors, data science notebooks, and AI-powered tools. When the

semantic layer is strong, the entire organization moves faster, more

consistently, and more reliably. When it is weak or fragmented, the

opposite compounds quickly.

This guide covers what a semantic layer is, how its core components

and design patterns work, how modern data architecture differs from
traditional approaches, and — critically — how semantic layers now
serve as the foundational infrastructure for large language models and
AI-powered analytics.

What Is Semantic Layer Architecture?

Core Definition

A semantic layer sits between source data and the end users or
systems that consume it. Its job is to abstract physical data
structures — tables, joins, column names — into a business-friendly
vocabulary that both humans and machines can interpret without
needing to understand the underlying schema.

In practice, this means translating a column like
fact_subscriptions.bookings_amount into a governed metric
called "ARR Run-Rate," complete with its calculation logic, the filters
that define it (active contracts only, specific date windows), the joins
that enrich it (customer segments, product families), and the security
policies that restrict who can see what. This semantic model
becomes the authoritative translation layer between technical data
structures and business meaning.

https://www.databricks.com/blog/semantic-layer-architecture-components-design-patterns-and-ai-integration

2/17

4/13/26, 3:42 PM

Semantic Layer Architecture: Components, Design Patterns, and AI Integration | Databricks Blog

How a Semantic Layer Fits in the Modern Data
Stack

The benefits of a well-implemented semantic layer are concrete. First,

it creates a single source of truth — definitions live in one place, so

every BI tool, notebook, and natural language interface returns the

same answer to the same question. Second, it dramatically

accelerates data access: business users gain

 self-service analytics

without needing to know which tables to join. Third, it strengthens

data governance

 by ensuring that row-level security, column masking,

and certification policies travel with each metric definition rather than

being re-implemented in every tool.

Without these benefits, organizations face what the Databricks eBook

describes as "decision debt" — ambiguity that compounds into

rework, reconciliation meetings, and missed opportunities. Teams

debate definitions instead of acting on insights.

Historical Context: From OLAP Cubes to
Headless BI

The semantic layer concept is not new, but its form has evolved

dramatically through five distinct eras. In the 1990s, tools like
MicroStrategy and BusinessObjects introduced the first commercial
semantic layers — the Semantic Graph and the Universe — that let
non-technical users query databases without writing queries. The late

1990s brought OLAP cubes (Oracle Essbase, Microsoft Analysis

Services), which pre-aggregated data into rigid but fast
multidimensional structures using MDX and later DAX.

The 2000s saw enterprise BI and IT-managed centralized data

models, prioritizing consistency at the cost of agility. Looker's 2012
introduction of LookML pioneered "semantics as code," moving model

creation to analysts and enabling Git-based version control. Most
recently, the universal semantic layer emerged: headless, tool-

agnostic platforms — including Cube, AtScale, and dbt's Semantic

Layer — that define logic once and serve it to many clients via APIs.
Each wave solved the problem in front of it but left new problems

behind. Today, organizations running on cloud data lakes and
lakehouses require an approach that addresses

 business intelligence

architecture at the platform level, not the tool level.

https://www.databricks.com/blog/semantic-layer-architecture-components-design-patterns-and-ai-integration

3/17

4/13/26, 3:42 PM

Semantic Layer Architecture: Components, Design Patterns, and AI Integration | Databricks Blog

Core Components and Design Patterns

Understanding semantic layer architecture starts with its fundamental

building blocks. These components are not just technical constructs
— they encode how a business thinks, segments, and measures

success.

Dimensions

Dimensions are the axes of analysis: the "who," "what," "where," and

"when" by which performance is evaluated. They represent categorical
or temporal attributes — customer segments, product families,

regions, fiscal periods. A well-designed semantic model defines these
once so that any measure can be grouped or filtered by any

dimension without rewriting business logic. A SaaS company might

define dimensions like "Subscription Type" (annual vs. monthly) and
"Customer Segment" (enterprise vs. SMB) that apply across every KPI

in the system.

Measures

Measures quantify business outcomes as computed functions: sums,

counts, averages, ratios, and rolling windows. Their critical design
principle is independence from grouping — a measure like NRR (net

revenue retention) carries the same definition whether sliced by
product, geography, or time period. This reusability is what makes

metric definitions valuable: the calculation is authored once and
trusted everywhere. Examples include ARR run-rate (bookings

annualized), revenue churn rate (churn divided by starting ARR), and

cohort conversion rates.

Joins and Relationships

Real business answers draw on multiple data sources. The semantic
layer's join layer allows a primary fact table — say, subscription

transactions — to be enriched with related data, such as customer

geography, product hierarchies, and contract types. These
relationships are declared explicitly, making lineage visible. Both

 star

and snowflake schemas
durable part of the semantic model rather than an ad hoc query

 are supported, and the join logic becomes a

fragment re-coded by every analyst.

https://www.databricks.com/blog/semantic-layer-architecture-components-design-patterns-and-ai-integration

4/17

4/13/26, 3:42 PM

Semantic Layer Architecture: Components, Design Patterns, and AI Integration | Databricks Blog

Filters

Filters encode business rules directly into the metric definition.

"Active contracts only," "last 90 days," "exclude test accounts" — these
constraints become part of the metric's identity, not afterthoughts in

a dashboard WHERE clause. This design pattern ensures consistent
results regardless of which surface queries the metric, which tool the

data engineer uses to inspect it, or which automated interface

attempts to answer a question about it.

Metadata and Governance Layer

Beyond calculation logic, a mature semantic layer carries rich

metadata: ownership, descriptions, certification status, tags, and
synonyms. Data lineage tracks which source tables feed each metric

and which downstream consumers depend on it. Access controls —
row-level security, column-level masking — travel with each asset.

This governance layer transforms the semantic layer from a
convenience into infrastructure: change management becomes safe

because impact analysis is always visible, and audit trails are always
current. The

 Databricks data governance

 framework embeds these

controls directly within the platform, ensuring policies are inherited by

every consuming surface rather than recreated tool by tool.

Performance and Caching Layer

Query optimization in a semantic layer typically involves

materialization strategies: baseline caches of filtered, joined source
data, and pre-computed views of common measure-dimension

combinations. The system intelligently routes queries to the most
efficient available materialization. This shared caching layer means

that a business analyst exploring monthly ARR trends and an LLM-
powered interface explaining growth drivers both benefit from the

same pre-computed results, without any consumer needing to
manage the optimization themselves.

Modern vs. Traditional Semantic Layer
Architecture

The most consequential distinction in semantic layer design today is

not which tool you use — it is where semantics live. Traditional

https://www.databricks.com/blog/semantic-layer-architecture-components-design-patterns-and-ai-integration

5/17

4/13/26, 3:42 PM

Semantic Layer Architecture: Components, Design Patterns, and AI Integration | Databricks Blog

approaches embedded business logic inside BI tools. Modern

approaches move semantics into the data platform itself.

The Fundamental Problem with Tool-Bound
Semantics

Every major BI tool has its own proprietary modeling language: DAX in

Power BI, LookML in Looker, VizQL in Tableau, MDX in the cube era.

Each is a powerful innovation within its context. But when
organizations run multiple tools — which virtually all do — the cracks
appear immediately. Definitions diverge across platforms. Data
engineers maintain the same logic twice. Data scientists in notebooks

have no access to either. LLM-based tools inherit none of it.

The result is a system where the correct answer depends on where

you ask the question. Governance gets reinvented in every tool,
security policies drift out of sync, and performance is optimized
locally but fragmented globally. As the Databricks eBook puts it: "The
biggest risk isn't a wrong number. It's a system where the right number

depends on where you ask the question."

The Modern Architecture: Platform-Native
Semantics

The durable fix is to manage business semantics within the data

platform — alongside data, policies, audit history, and traceability
records — and expose them to all consuming surfaces via open APIs.
This is what platform-native semantics means. Definitions are
authored once in the platform, then accessed by query interfaces,

REST, JDBC, dashboards, notebooks, and AI-powered tools through a
consistent interface.

When semantics live in the platform, governance is no longer

documentation — it is enforcement by construction. Row-level
security set on source data automatically applies when a metric view
is queried from a dashboard or a natural language interface.

Certification signals and audit records travel with the metric wherever
it goes. Performance acceleration is a shared service rather than a
per-tool configuration problem. The semantic model becomes
infrastructure that every team and tool depends on, rather than a

brittle artifact owned by one BI platform.

https://www.databricks.com/blog/semantic-layer-architecture-components-design-patterns-and-ai-integration

6/17

4/13/26, 3:42 PM

Semantic Layer Architecture: Components, Design Patterns, and AI Integration | Databricks Blog

Modern vs. Traditional: A Comparison

Dimension

Traditional Approach

Modern / Platform-Native
Approach

Location

Inside BI tools (DAX,
LookML, MDX)

Inside the data platform, next to the
data

Governance

Reinvented per tool;
fragmented policies

Inherited by construction —
row/column policies travel with
every metric

AI Readiness

Not designed for LLMs;
no synonym or guardrail
layer

Includes synonyms, explanations,
and guardrails; AI agents inherit full
governance

Reuse

Locked within one tool's
proprietary language

SQL + open APIs (REST, JDBC,
GraphQL) consumable by any
surface

Performance

Per-tool caching and
aggregates

Shared materialization and query
routing across all consumers

Versioning

Manual, ad hoc

Lineage

Rarely visible across
tools

Semantics as code — CI/CD, Git-
versioned, dev → staging → prod

Automatic, always-on; impact
analysis before any definition
change

Types of Semantic Layers Today

Within the modern landscape, several distinct types of semantic
layers have emerged. The metrics layer focuses narrowly on

standardizing key business metrics in a portable, declarative format —
dbt's Semantic Layer takes this approach, integrating semantic data
modeling into the transformation workflow alongside dbt models.

The universal semantic layer — a headless, tool-agnostic architecture
— decouples definitions from any single BI tool and serves them to
many clients via APIs, representing a major step toward platform

independence. The platform-native semantic layer goes furthest by
embedding semantics inside the data platform itself, making them
inseparable from governance, traceability, and performance
infrastructure.

 Business Semantics from Databricks

 Unity Catalog

represents this approach, where data models and their associated
governance rules are co-located with the data they describe.

https://www.databricks.com/blog/semantic-layer-architecture-components-design-patterns-and-ai-integration

7/17

4/13/26, 3:42 PM

Semantic Layer Architecture: Components, Design Patterns, and AI Integration | Databricks Blog

REPORT
The agentic AI playbook for the
enterprise

Read now

Benefits of a Semantic Layer in the
Modern Data Stack

Improving Data Accessibility and Consistency

The most immediate benefit is consistency. When metric definitions
are centralized in a semantic model, every surface — from a Power BI

dashboard to a Jupyter notebook to a natural language query
interface — reads from the same governed logic. This eliminates the
reconciliation meetings that open when different tools return different

, because they interact with familiar business terms, not raw

numbers. Business users gain genuine
Genie
database schemas. Data teams spend less time explaining definitions
and more time building new capabilities.

 self-service analytics with AI/BI

Enhancing Governance and Compliance

Data governance becomes structural rather than procedural when
semantics live in the platform. Security policies, masking rules, and
audit trails attach to each metric definition and propagate
automatically to every consumer. Organizations in regulated industries

— financial services, healthcare, manufacturing — benefit from
governance that scales without manual enforcement. Every query is
auditable; every definition change is traceable. A mature

 data

governance strategy
they travel with every asset, not just within a single tool.

 integrates these controls at the platform level so

Enabling Data Literacy at Scale

A semantic layer democratizes data by translating technical schemas
into the language of the business. Stakeholders who cannot write

https://www.databricks.com/blog/semantic-layer-architecture-components-design-patterns-and-ai-integration

8/17

4/13/26, 3:42 PM

Semantic Layer Architecture: Components, Design Patterns, and AI Integration | Databricks Blog

code can explore KPIs using business terms they recognize. This shifts
decision-making from a bottleneck model — where analysts serve as
intermediaries — to a distributed model where domain experts can

answer their own questions. The result is faster decisions and higher
organizational confidence in the numbers.
 surface
these governed metric definitions directly to business stakeholders,
reinforcing data literacy without requiring schema-level knowledge.

 AI/BI Dashboards

Performance and Query Optimization

Materialization strategies built into the semantic layer mean that
common queries — trending ARR by segment, weekly active user
cohorts — are served from pre-computed results rather than
scanning billions of rows on demand. This shared optimization

benefits all consumers simultaneously. When new results are
materialized, every dashboard, notebook, and tool that queries that
metric gets faster automatically, without any changes to their queries.

Semantic Layer Architecture for AI, LLMs,
and Generative AI Applications

Perhaps the most consequential development in semantic layer
design is the emergence of large language models and conversational

interfaces as first-class consumers of business data. Traditional
semantic layer architectures were not designed for this — and the
gaps are not cosmetic.

Why LLMs Need a Semantic Layer

Large language models

 are powerful at language and reasoning, but

they have no inherent understanding of your business vocabulary.
Without a semantic layer, an LLM querying your data warehouse has
to infer what "ARR" means, which table contains it, what filters apply,
and whether the result should be for active contracts only or all-time.

It will generate plausible-sounding queries that may be subtly or
significantly wrong, and present the result with equal confidence
regardless.

A semantic layer for AI provides the structured context that closes
this gap: business-friendly names and descriptions, synonyms and
acronyms that map colloquial terms to canonical fields, metric

https://www.databricks.com/blog/semantic-layer-architecture-components-design-patterns-and-ai-integration

9/17

4/13/26, 3:42 PM

Semantic Layer Architecture: Components, Design Patterns, and AI Integration | Databricks Blog

definitions with their embedded filters and joins, certification signals
that indicate which definitions are trusted, and access controls that
prevent any consumer from exposing restricted data. With this

foundation in place, an LLM can answer "What's our NRR this quarter?"
with the same reliability as a governed BI dashboard — because it is
querying the same semantic model. This is the principle behind the
Databricks AI platform
, which enables governed, trusted AI-powered

analytics by grounding model outputs in managed semantic
definitions.

How AI Agents Use Semantic Layers for Data
Retrieval

AI agents interact with semantic layers in two primary ways. The first
is grounding: before generating any query or responding to a question,
the agent reads the semantic layer's descriptive context to
understand available metrics, dimensions, their definitions, and the

governance rules that apply. This prevents hallucinated column
names, incorrect joins, and misapplied filters. The second is execution:
rather than generating raw queries against base tables, the agent

queries the semantic layer's interface using governed metric
definitions. The resulting output is safe, consistent, and automatically
filtered by the platform's security policies.

A natural language interface asking "Why are VIP customers churning
more in Q4?" benefits from a semantic model that knows what "VIP
customers" means (a dimension), what "churn" means (a measure with

its specific calculation), that Q4 refers to a fiscal period (a time
dimension), and which users have permission to see customer-level
data. Without each of these, the LLM improvises — and improvised
answers in analytics are expensive.

Semantic Layer Architecture for Generative AI
Applications

Generative AI
 applications built on structured business data need
more than metric definitions. They need a rich metadata layer that
includes natural language synonyms, display rules (format as

currency, round to two decimal places), example queries that teach
the model how to answer common questions, and domain-specific
instructions that scope interpretation. This contextual metadata lives

alongside the core metric definitions in the semantic layer, providing

https://www.databricks.com/blog/semantic-layer-architecture-components-design-patterns-and-ai-integration

10/17

4/13/26, 3:42 PM

Semantic Layer Architecture: Components, Design Patterns, and AI Integration | Databricks Blog

machine-readable business context that scales with usage. From a
systems perspective, this requires designing the semantic layer as a

shared service layer rather than a BI-specific tool — it must serve
both human analysts and automated systems from a single governed
source.

The most sophisticated implementations create a feedback loop. As
users interact with conversational interfaces, the system mines query
patterns and dialogue to identify new concepts and propose them as
semantic additions. If many users ask about "high-spend customers"

using different phrasings, the system can propose a reusable
definition. If a user introduces a new term and explains what it means,
the system extracts that definition as structured knowledge. This

continuous learning loop keeps the semantic layer current with
evolving business language without requiring quarterly audit cycles.

Text-to-SQL vs. Semantic Layer for LLM
Agents

A common architectural question is whether a semantic layer is
necessary if the LLM can generate queries directly. The distinction
matters significantly in production. Pure text-to-SQL systems
generate queries against raw tables, meaning the LLM must infer
business logic, filter conditions, and join paths from table names and
column descriptions alone. Results are often inconsistent,

ungoverned, and opaque — there is no way to audit whether the
generated query reflects the organization's actual metric definition.

A semantic layer approach inverts this: the LLM generates queries
against governed metric definitions, not raw tables. The queries it
produces leverage pre-defined measures, dimensions, and filters
rather than re-implementing them. The result is consistent by design

— the same answer whether the question comes from a dashboard, a
notebook, or a natural language interface. For enterprise analytics,
where consistency and auditability are non-negotiable,
business users with self-service data intelligence
semantic layer is not optional. It is the architecture that makes AI-
driven analytics trustworthy.

 empowering

 through the

Automated Metadata Discovery and Intelligent
Query Optimization

https://www.databricks.com/blog/semantic-layer-architecture-components-design-patterns-and-ai-integration

11/17

4/13/26, 3:42 PM

Semantic Layer Architecture: Components, Design Patterns, and AI Integration | Databricks Blog

Platform-native semantic layers are beginning to exhibit adaptive
behavior that traditional approaches cannot match. Because
semantics live alongside usage data, traceability records, and query
patterns, the platform can observe how metrics are actually used and

suggest refinements: clearer synonyms, new hierarchies that emerge
from query patterns, performance strategies adapted to live
workloads.

Quality checks can detect anomalies and definition drift automatically
— when a metric's value shifts unexpectedly, the platform can surface
that signal before it becomes a decision error. This is not a distant

future; it is the natural outcome of treating semantics as managed,
observable platform assets within a broader governed platform.

Practical Implementation: Principles and
Steps

Five Principles That Prevent Common Pitfalls

Successful semantic layer implementations consistently observe five
principles. The first is "author once, reuse everywhere": definitions are
platform-native assets, not embedded in charts. A metric like
customer lifetime value lives in one place and serves every dashboard,

notebook, and conversational interface. The second is proximity to
governance: access controls, traceability, and certification travel with
the asset, making governance infrastructure rather than
documentation.

The third principle is openness by design: prefer standard query
interfaces and published APIs (REST, GraphQL, JDBC) and avoid

proprietary DSL lock-in. The semantic layer must be consumable by
today's and tomorrow's tools. The fourth is one source for humans and
AI: the same metric definitions serve dashboards and conversational
agents, with AI-specific metadata (synonyms, guardrails) attached as
additional context, not as a separate system. The fifth is semantics as
code: definitions are versioned, reviewed, and deployed through CI/CD
pipelines with the same rigor as application code.

Starting Small and Scaling

https://www.databricks.com/blog/semantic-layer-architecture-components-design-patterns-and-ai-integration

12/17

4/13/26, 3:42 PM

Semantic Layer Architecture: Components, Design Patterns, and AI Integration | Databricks Blog

The most common implementation mistake is trying to define
everything at once. A more effective approach is to start with one
high-stakes business decision and define one metric and its key

dimensions. Use it in a dashboard, let AI-powered tools answer
questions against it, and observe where definitions need refinement.
As usage increases, mine patterns to discover what new concepts the
organization actually needs. Certify logic as it matures, and let
performance optimization emerge from materialization rather than
being engineered upfront. Author anywhere, govern centrally; learn
locally, promote globally.

Core and Edge: A Healthy Division of Labor

Mature semantic layer architectures distinguish between a "core" and
an "edge." The core holds authoritative metric definitions, certified
measures, standard dimensions, and enterprise-wide policies. These
change slowly, through formal review and impact analysis. The edge —

per team, application, or agent — is seeded from the core and
enhanced with team-specific knowledge: local synonyms, domain-
specific filters, experimental metrics. The critical architectural
requirement is that useful edge knowledge can be reviewed and
promoted back to the core, ensuring the enterprise layer evolves
without drifting into chaos.

Challenges to Plan For

Implementation challenges fall into four categories. The initial
investment in data modeling is real: defining metrics precisely
requires collaboration between data engineers, analysts, and business
stakeholders who may not initially agree on definitions. This is a
feature, not a bug — the semantic layer forces definitional clarity that

was previously hidden in inconsistent ad hoc queries.

Maintaining data freshness requires thoughtful materialization
scheduling and refresh strategies. Skill set requirements span both
semantic modeling and an understanding of how business logic
translates to data. And organizational adoption — getting teams to
query the semantic layer rather than writing their own queries —

requires visible wins early, clear documentation, and leadership
alignment on which definitions are authoritative.

https://www.databricks.com/blog/semantic-layer-architecture-components-design-patterns-and-ai-integration

13/17

4/13/26, 3:42 PM

Semantic Layer Architecture: Components, Design Patterns, and AI Integration | Databricks Blog

Conclusion

A semantic layer is not a product to install — it is a practice to adopt
and an architecture to evolve. Its core function has remained
consistent across thirty years of data tooling: create a shared
language between raw data and the people and systems that need to
understand it. What has changed is the stakes.

In an era where conversational and AI-powered interfaces are first-

class consumers of business data, the semantic layer has become the
infrastructure that determines whether AI-driven analytics is
trustworthy or dangerously plausible. When semantics live inside the
data platform — next to data, policies, lineage, and audit history —
every surface, from a query editor to a natural language interface,
reads from the same governed truth. That consistency is not just a
convenience for analysts. It is the precondition for reliable decision-
making at scale.

The architecture principles are clear: author once and reuse
everywhere, keep governance proximate to data, prefer open APIs
over proprietary lock-in, serve humans and AI from the same source,
and treat definitions as code. Organizations that implement these
principles build a semantic layer that gets smarter over time —
learning from usage, evolving with business language, and

continuously improving the quality of answers it enables.

Never miss a Databricks post

Subscribe to our blog and get the latest posts delivered to your inbox

Work Email*

Country:*

Italy

By clicking “Subscribe” I understand that I will receive Databricks communications, and I agree to Databricks processing my
personal data in accordance with its

Privacy Policy
.

https://www.databricks.com/blog/semantic-layer-architecture-components-design-patterns-and-ai-integration

14/17

4/13/26, 3:42 PM

Semantic Layer Architecture: Components, Design Patterns, and AI Integration | Databricks Blog

Subscribe

What's next?

More from the Authors

Business Analytics Tools: A Complete Guide for Data-
Driven Organizations

Data Science Use Cases: 15 Real-World Applications
Transforming Enterprise Operations

Google Cloud Use Cases: How Enterprises Run Data & AI
on GCP with Databricks

DATA + AI FOUNDATIONS

12 MIN READ

https://www.databricks.com/blog/semantic-layer-architecture-components-design-patterns-and-ai-integration

15/17

4/13/26, 3:42 PM

Semantic Layer Architecture: Components, Design Patterns, and AI Integration | Databricks Blog

MLOps Frameworks: A Complete Guide to Tools and Platforms for Production ML

DATA + AI FOUNDATIONS

14 MIN READ

What is Machine Learning? How It Works, Types and Use Cases

Why Databricks

Product

Solutions

Resources

About

https://www.databricks.com/blog/semantic-layer-architecture-components-design-patterns-and-ai-integration

16/17

4/13/26, 3:42 PM

Semantic Layer Architecture: Components, Design Patterns, and AI Integration | Databricks Blog

Databricks Inc.

160 Spear Street, 15th Floor

San Francisco, CA 94105

1-866-330-0121

See Careers
at Databricks

© Databricks 2026. All rights reserved. Apache, Apache Spark,

Spark, the Spark Logo, Apache Iceberg, Iceberg, and the Apache

Iceberg logo are trademarks of the

Apache Software Foundation

.

Privacy Notice

|

Terms of Use Modern Slavery Statement

|

|

California Privacy

|

Your Privacy Choices

https://www.databricks.com/blog/semantic-layer-architecture-components-design-patterns-and-ai-integration

17/17

