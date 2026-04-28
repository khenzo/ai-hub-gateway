4/27/26, 9:24 AM

Microsoft OneLake: The Uniﬁed Data Lake That Eliminates ETL, Bridges Every Cloud, and Powers Your AI Agents. | by D…

ITNEXT · Follow publication

Member-only story

Microsoft OneLake: The Unified Data Lake That
Eliminates ETL, Bridges Every Cloud, and
Powers Your AI Agents.

13 min read · 5 days ago

Dave R - Microsoft Azure & AI MVP☁

Following

Listen

Share

More

How OneLake became the single foundation for analytics, governance, and agentic AI

across Snowflake, Databricks, SAP, SharePoint, and beyond.

https://itnext.io/microsoft-onelake-the-uniﬁed-data-lake-that-eliminates-etl-and-powers-your-ai-agents-a985d32d9939

1/19

4/27/26, 9:24 AM

Microsoft OneLake: The Uniﬁed Data Lake That Eliminates ETL, Bridges Every Cloud, and Powers Your AI Agents. | by D…

Microsoft OneLake: The Unified Data Lake That Eliminates ETL, Bridges Every Cloud, and Powers Your AI
Agents

If you work with data, you already know the pain: data scattered across dozens of

systems, duplicated through ETL pipelines, secured differently in every tool, and

nearly impossible to hand over to an AI agent without weeks of prep work. Microsoft

OneLake is designed to solve exactly that. It is a single, logical data lake built into

Microsoft Fabric that lets you connect to any data source, across any cloud or on-

premises system, without moving or copying a single byte. In this article, I am going

to walk you through how OneLake works, what is new, and why it matters for your

architecture. Whether you are a data engineer, a platform architect, or an analytics

lead, my goal is to give you a clear, practical understanding of every major capability

so you can decide what belongs on your roadmap.

Reference here.

https://itnext.io/microsoft-onelake-the-uniﬁed-data-lake-that-eliminates-etl-and-powers-your-ai-agents-a985d32d9939

2/19

4/27/26, 9:24 AM

Microsoft OneLake: The Uniﬁed Data Lake That Eliminates ETL, Bridges Every Cloud, and Powers Your AI Agents. | by D…

The Scale of OneLake Today

Two years after general availability, OneLake and Microsoft Fabric have reached

impressive scale: over 28,000 paying customers, 80% of Fortune 500 companies

actively using OneLake, and 6 million active OneLake shortcuts already created.

Those 6 million shortcuts are the real story. Each one represents an instance where

an organization chose to virtualize data rather than copy it. That is a fundamental

shift in how enterprises approach data integration. Instead of building another

pipeline to move data into another system, teams are pointing to the data where it

already lives and getting to work.

For a full overview of OneLake fundamentals, see:

https://learn.microsoft.com/en-us/fabric/onelake/onelake-overview?WT.mc_id=AZ-

MVP-5000671

The Problem: A Vast, Fragmented Data Landscape

Take a look at the data platforms in your organization. You probably have some

combination of Snowflake, Databricks, Azure SQL, Cosmos DB, SAP, Salesforce,

ServiceNow, SharePoint, on-premises file shares, and a handful of others. Each

system has its own access patterns, security models, and data formats.

The traditional answer has been ETL: extract the data, transform it, load it

somewhere else. That creates copies, introduces latency, multiplies governance

https://itnext.io/microsoft-onelake-the-uniﬁed-data-lake-that-eliminates-etl-and-powers-your-ai-agents-a985d32d9939

3/19

4/27/26, 9:24 AM

Microsoft OneLake: The Uniﬁed Data Lake That Eliminates ETL, Bridges Every Cloud, and Powers Your AI Agents. | by D…

burden, and makes it nearly impossible to answer the question “where is the

authoritative version of this data?”

OneLake takes a different approach entirely. Instead of moving data to a central

location, it creates a single logical namespace that virtualizes data from wherever it

lives. The two core primitives that make this work are shortcuts and mirroring.

Architecture Pillar 1: Unified Data Estate

Shortcuts: The Symbolic Link for Your Data Lake

A shortcut in OneLake is conceptually identical to a symbolic link in a file system. It

is pure metadata that points to where data actually resides. When you create a

shortcut, no data moves. The data stays in its original location, whether that is Azure

Data Lake Storage, AWS S3, Google Cloud Storage, Dataverse, or on-premises S3-

compatible storage like NetApp. But it appears as a native folder or table within your

OneLake lakehouse.

Here is where it gets powerful: you can have a single lakehouse with tables sourced

from Google BigQuery, Oracle DB running on-premises, Snowflake, Databricks

Unity Catalog, and a native Fabric SQL database, all appearing in the same schema,

queryable through a single SQL endpoint. A single SQL query can join data across all

five sources and return a unified result set.

https://itnext.io/microsoft-onelake-the-uniﬁed-data-lake-that-eliminates-etl-and-powers-your-ai-agents-a985d32d9939

4/19

4/27/26, 9:24 AM

Microsoft OneLake: The Uniﬁed Data Lake That Eliminates ETL, Bridges Every Cloud, and Powers Your AI Agents. | by D…

The architecture works like this: shortcuts connect sources from Azure, AWS S3,

Dataverse, GCP, on-premises systems, Amazon S3-compatible storage, and cross-

tenant OneLake instances. All of them flow into workspaces where unified security

and governance are applied on top, regardless of where the data physically lives.

For the full shortcuts documentation:

https://learn.microsoft.com/en-us/fabric/onelake/onelake-shortcuts?WT.mc_id=AZ-

MVP-5000671

To create and manage shortcuts:

https://learn.microsoft.com/en-us/fabric/onelake/create-onelake-shortcut?

WT.mc_id=AZ-MVP-5000671

For on-premises shortcut creation via data gateway:

https://learn.microsoft.com/en-us/fabric/onelake/create-on-premises-shortcut?

WT.mc_id=AZ-MVP-5000671

Shortcut Transformations: The Last Mile Without a Pipeline

Traditional shortcuts are pure pointers: what you see is what you get. Shortcut

transformations add a processing layer between source and destination, without

requiring a separate pipeline, notebook, or compute job. This is one of the most

practical capabilities for real-world data engineering.

https://itnext.io/microsoft-onelake-the-uniﬁed-data-lake-that-eliminates-etl-and-powers-your-ai-agents-a985d32d9939

5/19

4/27/26, 9:24 AM

Microsoft OneLake: The Uniﬁed Data Lake That Eliminates ETL, Bridges Every Cloud, and Powers Your AI Agents. | by D…

There are two categories of transformations.

Format conversions handle the messy reality of enterprise data. You can convert

CSV to Delta/Iceberg, Parquet to Delta/Iceberg, and JSON to Delta/Iceberg. If your

business team manages data in SharePoint as CSV files, a shortcut transformation

can present that data as a fully queryable Delta table automatically.

AI-powered enrichments apply intelligence at the storage layer itself. These include

sentiment analysis, PII detection and redaction, name recognition, key phrase

https://itnext.io/microsoft-onelake-the-uniﬁed-data-lake-that-eliminates-etl-and-powers-your-ai-agents-a985d32d9939

6/19

4/27/26, 9:24 AM

Microsoft OneLake: The Uniﬁed Data Lake That Eliminates ETL, Bridges Every Cloud, and Powers Your AI Agents. | by D…

extraction, text summarization, conversation analysis, and language translation.

These are right-click operations available on any folder across any cloud. They

automatically track changes in the source and synchronize the destination.

Consider a practical scenario: your team has CSV files in SharePoint. You create a

shortcut, the system auto-detects the CSV format, recommends the CSV-to-table

transform, and within seconds the data appears as a queryable Delta table. If

someone updates the CSV in SharePoint, the table reflects the changes on refresh.

No pipeline. No notebook. No scheduled job.

Mirroring: Bringing External Catalogs Into OneLake

Mirroring is the companion to shortcuts for sources that do not store data in open

formats. While shortcuts virtualize data that is already in accessible storage,

mirroring handles external catalogs: operational databases (Azure SQL, Cosmos DB,

Oracle), data platforms (Databricks Unity Catalog, Snowflake), and business

platforms (SAP Datasphere).

Mirroring automatically synchronizes metadata (tables, columns, schemas) into

OneLake. For data, it works in two modes:

If the source stores data in an open format (like Databricks storing Delta Lake files

in ADLS), mirroring creates and manages shortcuts automatically. No data

replication occurs. Just metadata sync.

If the source uses a closed storage system, mirroring performs CDC replication and

lands the data in open Delta format. The storage for replicated data is always free.

https://itnext.io/microsoft-onelake-the-uniﬁed-data-lake-that-eliminates-etl-and-powers-your-ai-agents-a985d32d9939

7/19

4/27/26, 9:24 AM

Microsoft OneLake: The Uniﬁed Data Lake That Eliminates ETL, Bridges Every Cloud, and Powers Your AI Agents. | by D…

The end result is the same: data is available in OneLake either physically or

virtually, and you can use it in all the same ways regardless of which path it took to

get there.

Currently generally available: Azure Cosmos DB, Azure PostgreSQL, SQL Server

2025, SQL Server, Azure SQL DB, Azure Data Lake Store, Azure Blob Storage, Google

Cloud Storage, Amazon S3, S3-compatible (cloud and on-premises), Microsoft

Dataverse, Databricks Catalog, Microsoft OneLake, Azure SQL Managed Instance,

and Snowflake Iceberg mirroring (which now automatically creates shortcuts

instead of replicating data for Iceberg tables).

Currently in public preview: SharePoint/OneDrive, SAP Datasphere, Oracle DB, and

Google BigQuery.

Native integrations: Snowflake bidirectional storage and SAP Business Data

Connect. Coming soon: Databricks Catalog native integration.

For the mirroring overview:

https://learn.microsoft.com/en-us/fabric/mirroring/overview?WT.mc_id=AZ-MVP-

5000671

How an Enterprise Data Team Uses This in Practice

To make this concrete, consider how an energy company might architect their data

platform with OneLake. The pattern looks like this:

https://itnext.io/microsoft-onelake-the-uniﬁed-data-lake-that-eliminates-etl-and-powers-your-ai-agents-a985d32d9939

8/19

4/27/26, 9:24 AM

Microsoft OneLake: The Uniﬁed Data Lake That Eliminates ETL, Bridges Every Cloud, and Powers Your AI Agents. | by D…

Data Factory performs batch ETL into Azure Storage (ADLS Gen2). OneLake

shortcuts virtualize that storage into an enterprise lakehouse. Mirrors bring in data

from Azure SQL, Azure PostgreSQL, Cosmos DB, Dataverse, and Databricks Unity

Catalog. Databricks and Synapse Spark perform ETL and analytical querying on the

lakehouse data. Power BI consumes the data via Direct Lake and SQL endpoints.

Open in app

The key benefits in this architecture are: shortcut transformations eliminate the

need to refactor legacy Parquet data into Delta format (saving time and compute

cost); mirroring replaces custom replication solutions with a managed service that

provides more timely data access; and centralized OneLake security eliminates re-

securing data for every compute engine.

The roadmap for this kind of architecture naturally extends into unstructured data

from SharePoint and OneDrive, agentic AI workflows through Copilot Studio and

Microsoft Foundry, and real-time intelligence for IoT and event-driven scenarios.

Architecture Pillar 2: Unified, Open Access Across Platforms

One Copy of Data, Any Engine

Every Fabric compute engine (Spark, T-SQL, KQL, and Analysis Services) stores data

in OneLake using Delta Parquet, an open-standards format. This means a data

warehouse team using T-SQL and a data science team using Spark can both read and

https://itnext.io/microsoft-onelake-the-uniﬁed-data-lake-that-eliminates-etl-and-powers-your-ai-agents-a985d32d9939

9/19

4/27/26, 9:24 AM

Microsoft OneLake: The Uniﬁed Data Lake That Eliminates ETL, Bridges Every Cloud, and Powers Your AI Agents. | by D…

write the same physical data without export or import. Which tool you use to build

your lake is a matter of team preference. You can separate data creation from data

consumption entirely.

This extends well beyond Fabric. OneLake exposes data through multiple API

surfaces:

Storage APIs (OneLake.DFS and OneLake.BLOB) let any application compatible with

Azure Storage SDKs access data as files or blobs. These are the same APIs that ADLS

Gen2 provides, so any tool that already works with ADLS can work with OneLake.

OneLake.Table endpoint (now in public preview) provides standard Iceberg REST

Catalog and Unity Catalog compatible REST APIs. Any application that speaks

Iceberg or Delta can consume OneLake data directly, with no extra catalogs

required.

Here is the critical detail: data written in Delta format is automatically accessible via

Iceberg APIs, and vice versa. You do not need to choose a format. All data is

available through all formats and all APIs automatically. If you have applications

that only know Delta Lake, they work. If you have others that only know Iceberg,

they also work. Both against the same underlying data.

For the table APIs overview:

https://learn.microsoft.com/en-us/fabric/onelake/table-apis/table-apis-overview?

WT.mc_id=AZ-MVP-5000671

Snowflake Bidirectional Integration

https://itnext.io/microsoft-onelake-the-uniﬁed-data-lake-that-eliminates-etl-and-powers-your-ai-agents-a985d32d9939

10/19

4/27/26, 9:24 AM

Microsoft OneLake: The Uniﬁed Data Lake That Eliminates ETL, Bridges Every Cloud, and Powers Your AI Agents. | by D…

One of the most significant recent developments is the deep Snowflake integration.

Snowflake now supports native storage in OneLake with bidirectional data access.

What this means in practice: when you create a new Snowflake database, you can

choose to store its Iceberg tables natively in OneLake. A “Snowflake database” item

type appears directly in Fabric workspaces. The same data is readable and writable

from both Snowflake and Fabric, with no data movement or duplication.

If your organization uses both Snowflake and Fabric, you no longer have to create

two silos. You can build a warehouse in Snowflake, have it store data in OneLake,

and use Spark, T-SQL, Power BI, or Copilot against that same data without a single

pipeline in between.

New Snowflake interoperability features: a Snowflake-branded item in Fabric

(public preview), a UI in Snowflake for configuring native OneLake storage (public

preview), and Snowflake mirroring now handles Iceberg tables by automatically

creating shortcuts (GA).

OneLake as the Data Layer for AI Agents

This is where the architecture gets especially interesting. OneLake is not just for

analytics anymore. It is becoming the unified data layer for AI workloads,

connecting to unstructured data sources (ADLS, Azure Blob, Google Cloud Storage,

Amazon S3 compatible, SharePoint) and feeding into AI consumers (Fabric data

agents, Microsoft Foundry, Copilot Studio, Microsoft 365, REST/MCP endpoints, and

partner platforms like Palantir).

https://itnext.io/microsoft-onelake-the-uniﬁed-data-lake-that-eliminates-etl-and-powers-your-ai-agents-a985d32d9939

11/19

4/27/26, 9:24 AM

Microsoft OneLake: The Uniﬁed Data Lake That Eliminates ETL, Bridges Every Cloud, and Powers Your AI Agents. | by D…

Consider this architecture: a Fabric lakehouse contains structured tables (customer

data, product data, financial data) plus unstructured files (call transcripts from

Azure Blob, PDFs from on-premises NetApp, and documents from SharePoint). All

of these are brought in through shortcuts with no data movement. You then connect

this lakehouse to a Microsoft Foundry knowledge base. Foundry indexes the data,

creates vector representations, and powers an AI agent.

That agent can answer questions that span all three unstructured sources. It does

not need to know that one source is on-premises, another is in Azure Blob, and a

third is in SharePoint. OneLake abstracts all of that away. The same security,

governance, and discoverability layer that applies to your structured analytics data

applies to your AI data.

For the Fabric samples GitHub repository with OneLake notebooks:

https://github.com/microsoft/fabric-samples

For the workload development sample showing OneLake API integration:

https://github.com/microsoft/Microsoft-Fabric-workload-development-sample

Architecture Pillar 3: Unified Discovery and Governance

OneLake Security: Defined Once, Enforced Everywhere

Traditional data lake security operates at the file and folder level and requires re-

implementation for each compute engine. If you have five engines consuming the

same data, you configure security five times, and you hope they stay in sync.

OneLake security moves these controls into the lake itself.

https://itnext.io/microsoft-onelake-the-uniﬁed-data-lake-that-eliminates-etl-and-powers-your-ai-agents-a985d32d9939

12/19

4/27/26, 9:24 AM

Microsoft OneLake: The Uniﬁed Data Lake That Eliminates ETL, Bridges Every Cloud, and Powers Your AI Agents. | by D…

You define security roles with table-level, row-level, and column-level permissions

directly in OneLake. These roles are enforced consistently across every Fabric

compute engine (Spark, T-SQL, KQL, and Analysis Services) regardless of how data

is accessed. The same security policy travels with the data through shortcuts and

across engines.

The design goals are straightforward: it must be secure, it must be performant, and

it must be consistent. You always get the same result regardless of which engine you

use to query the data.

Recent announcements for OneLake security: it is now available to all customers in

public preview. Write permissions have been added, allowing selective write access

to specific folders without requiring the full Contributor workspace role. The

OneLake security REST API supports write access and full automation.

For OneLake security documentation:

https://learn.microsoft.com/en-us/fabric/onelake/security/get-started-security?

WT.mc_id=AZ-MVP-5000671

For security best practices:

https://learn.microsoft.com/en-us/fabric/onelake/security/best-practices-secure-

data-in-onelake?WT.mc_id=AZ-MVP-5000671

For shortcut security specifics:

https://learn.microsoft.com/en-us/fabric/onelake/onelake-shortcut-security?

WT.mc_id=AZ-MVP-5000671

https://itnext.io/microsoft-onelake-the-uniﬁed-data-lake-that-eliminates-etl-and-powers-your-ai-agents-a985d32d9939

13/19

4/27/26, 9:24 AM

Microsoft OneLake: The Uniﬁed Data Lake That Eliminates ETL, Bridges Every Cloud, and Powers Your AI Agents. | by D…

OneLake Catalog: The Central Nervous System for Your Data Estate

The OneLake catalog is the unified control plane for discovery, governance, and

security. It is built into Fabric and surfaces metadata, governance insights, and

security controls across three tabs: Explore, Govern, and Secure.

The scale here is worth noting: 230,000 organizations use the OneLake catalog. It

serves 30 million+ monthly active Power BI and Fabric users. It is embedded in 100+

applications including Microsoft Teams and Excel.

The catalog supports all Fabric item types (lakehouses, warehouses, semantic

models, reports, data agents, and third-party ISV items), plus mirrored and

shortcutted data. It enables domain-based organization for data mesh

implementations, with thousands of organizations already using this pattern.

https://itnext.io/microsoft-onelake-the-uniﬁed-data-lake-that-eliminates-etl-and-powers-your-ai-agents-a985d32d9939

14/19

4/27/26, 9:24 AM

Microsoft OneLake: The Uniﬁed Data Lake That Eliminates ETL, Bridges Every Cloud, and Powers Your AI Agents. | by D…

The Explore tab lets you discover and browse all data items across your

organization. You can filter by ownership, endorsement, workspace, or tags.

Clicking any item surfaces metadata including descriptions, tags, ownership, and

workspace location. You can drill into tables and columns, view lineage showing

data flow from source to destination, monitor refresh history, and audit

permissions.

The Govern tab provides out-of-the-box governance insights for data owners and

(newly) for tenant-wide Fabric admins. It shows the status of your data: how

refreshed it is, how well curated it is, what the breakdown across item types looks

like, and what proactive actions you should take to improve governance. Copilot

integration allows you to chat with governance reports for deeper analysis.

The Secure tab centralizes OneLake security role management. You can view who

has access to content, modify role policies, see user lists with their workspace roles,

and create or edit security roles from a single location.

The catalog also integrates with Microsoft Purview for sensitivity labeling, DLP

policies, audit logging, and DSPM for AI. Third-party catalog integrations include

Informatica, Collibra, Atlan, and Alation.

Coming soon: Get-data with OneLake catalog in Excel for Windows, catalog public

APIs for search and browse, and deeper schema/table/column previews.

For the OneLake catalog overview:

https://learn.microsoft.com/en-us/fabric/governance/onelake-catalog-overview?

WT.mc_id=AZ-MVP-5000671

Quick Reference: What Is Available Now

Generally Available: Azure Cosmos DB mirroring, Azure PostgreSQL mirroring, SQL

Server 2025 mirroring, SQL Server mirroring, Snowflake Iceberg mirroring (via

shortcuts), Snowflake bidirectional OneLake integration, Azure SQL DB, ADLS,

Azure Blob Storage, Google Cloud Storage, Amazon S3, S3-compatible, Dataverse,

Databricks Catalog, and Azure SQL MI.

https://itnext.io/microsoft-onelake-the-uniﬁed-data-lake-that-eliminates-etl-and-powers-your-ai-agents-a985d32d9939

15/19

4/27/26, 9:24 AM

Microsoft OneLake: The Uniﬁed Data Lake That Eliminates ETL, Bridges Every Cloud, and Powers Your AI Agents. | by D…

Public Preview: OneLake security (all customers), OneLake security write

permissions, SharePoint/OneDrive shortcuts, SAP Datasphere mirroring, Oracle DB

mirroring, Google BigQuery mirroring, Snowflake branded item in Fabric,

Snowflake native storage UI, and OneLake.Table endpoint.

Native Integrations: Snowflake native reads/writes to OneLake, SAP Business Data

Connect.

Coming Soon: Databricks Catalog native integration, catalog search/browse APIs,

Excel Get-data with OneLake catalog, and deeper schema previews.

Getting Started

Here are the resources you need to start implementing:

OneLake overview: https://learn.microsoft.com/en-us/fabric/onelake/onelake-

overview?WT.mc_id=AZ-MVP-5000671

Create shortcuts: https://learn.microsoft.com/en-us/fabric/onelake/onelake-

shortcuts?WT.mc_id=AZ-MVP-5000671

SharePoint/OneDrive shortcuts: https://learn.microsoft.com/en-

us/fabric/onelake/create-onedrive-sharepoint-shortcut?WT.mc_id=AZ-MVP-5000671

Mirroring overview: https://learn.microsoft.com/en-us/fabric/mirroring/overview?

WT.mc_id=AZ-MVP-5000671

OneLake security: https://learn.microsoft.com/en-us/fabric/onelake/security/get-

started-security?WT.mc_id=AZ-MVP-5000671

OneLake table APIs: https://learn.microsoft.com/en-us/fabric/onelake/table-

apis/table-apis-overview?WT.mc_id=AZ-MVP-5000671

OneLake catalog: https://learn.microsoft.com/en-us/fabric/governance/onelake-

catalog-overview?WT.mc_id=AZ-MVP-5000671

OneLake consumption and billing: https://learn.microsoft.com/en-

us/fabric/onelake/onelake-consumption?WT.mc_id=AZ-MVP-5000671

https://itnext.io/microsoft-onelake-the-uniﬁed-data-lake-that-eliminates-etl-and-powers-your-ai-agents-a985d32d9939

16/19

4/27/26, 9:24 AM

Microsoft OneLake: The Uniﬁed Data Lake That Eliminates ETL, Bridges Every Cloud, and Powers Your AI Agents. | by D…

Shortcuts REST API: https://learn.microsoft.com/en-us/rest/api/fabric/core/onelake-

shortcuts/list-shortcuts?WT.mc_id=AZ-MVP-5000671

GitHub repositories: https://github.com/microsoft/fabric-samples

https://github.com/microsoft/Microsoft-Fabric-workload-development-sample

Final Thoughts

Over the past two years, I've observed many organizations struggling with data

integration. Usually, the process is similar: a team needs data from three different

systems, so they build three separate pipelines, make three copies, set up security in

three places, and end up spending more time managing infrastructure than

analyzing data. By the time the data reaches the users, it is often outdated,

inconsistently secured, and lacks the broader context needed to make it useful.

OneLake is the most serious attempt I have seen to break that cycle. Not by

replacing your existing systems, but by sitting underneath all of them as a single

logical layer. Your Snowflake warehouse, your Databricks lakehouse, your SAP data,

your SharePoint documents, your on-premises file shares: they all keep running

where they are. OneLake simply makes them all discoverable, queryable, and

governable from one place.

What excites me most is the power of the compounding effect. Each new shortcut,

mirroring source, or engine connected to OneLake increases the platform's overall

value. Once security is set, it applies universally. Governance insights encompass all

areas. AI agents can rely on all data sources. This cumulative growth is not possible

when data is scattered across isolated systems.

If you're still creating ETL pipelines solely to share data with other teams, consider

shortcuts. When re-implementing row-level security across different tools, explore

OneLake security. If you're copying SharePoint files into blob storage for AI projects,

check out the new SharePoint shortcuts. Each of these options offers an opportunity

to simplify processes, cut costs, and accelerate progress.

-Dave R.

Artificial Intelligence

Technology

Programming

Data Science

https://itnext.io/microsoft-onelake-the-uniﬁed-data-lake-that-eliminates-etl-and-powers-your-ai-agents-a985d32d9939

17/19

4/27/26, 9:24 AM

Microsoft OneLake: The Uniﬁed Data Lake That Eliminates ETL, Bridges Every Cloud, and Powers Your AI Agents. | by D…

Machine Learning

Published in ITNEXT

80K followers · Last published just now

ITNEXT is a platform for IT developers & software engineers to share knowledge, connect, collaborate, learn
and experience next-gen technologies.

Follow

Written by Dave R - Microsoft Azure & AI MVP☁

1K followers · 9 following

Hey 👋, Let’s connect — 𝕏 @DaveRndn — https://www.linkedin.com/in/daverndn/

Following

Responses (1)

Vincenzo Prencipe

See all responses

https://itnext.io/microsoft-onelake-the-uniﬁed-data-lake-that-eliminates-etl-and-powers-your-ai-agents-a985d32d9939

18/19

What are your thoughts?4/27/26, 9:24 AM

Microsoft OneLake: The Uniﬁed Data Lake That Eliminates ETL, Bridges Every Cloud, and Powers Your AI Agents. | by D…

https://itnext.io/microsoft-onelake-the-uniﬁed-data-lake-that-eliminates-etl-and-powers-your-ai-agents-a985d32d9939

19/19


