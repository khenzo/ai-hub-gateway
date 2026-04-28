4/27/26, 9:23 AM

Expanding support for OneLake in Unity Catalog | Databricks Blog

TABLE OF CONTENTS

All blogs / Platform

P A R T N E R S

November 19, 2025

Expanding support for OneLake in Unity Catalog

Deepening interoperability through open standards

by Michelle Leon, Zeashan Pappa and Jonathan Keller

SUMMARY

Today marks an important milestone for open standards and the broader data

community. We are working with Microsoft to integrate the data managed both in Unity

Catalog and OneLake using open standards. The Unity Catalog Open API specification

provides an interface to exchange data both ways, zero copy, to open up access to the

entire lakehouse ecosystem for engines in either platform.

For nearly a decade, Databricks and Microsoft have partnered to help organizations

unlock the value of their data through the openness and flexibility of the lakehouse.

Today, that partnership takes another step forward, giving customers more choice in

how they access and govern data across platforms.

The Path to Open Interoperability

As open table formats like Delta Lake and Iceberg gained adoption, new silos emerged at

the catalog-level. To address this, Databricks launched Unity Catalog Open APIs,

establishing an open standard for unified governance across data and AI, while also fully

supporting the Iceberg REST catalog API for tabular data. This dual-API approach

empowers organizations to adopt best-in-class solutions and avoid vendor lock-in while

seamlessly sharing data across  many data platforms and SaaS Applications.  We also

https://www.databricks.com/blog/expanding-support-onelake-unity-catalog

1/5

4/27/26, 9:23 AM

Expanding support for OneLake in Unity Catalog | Databricks Blog

introduced catalog federation to provide a single governed view across all data platforms.

This model, open APIs powering catalog federation, has become the industry standard

for interoperability.

Today, we’re excited to see this open vision validated by our partners at Microsoft.

Microsoft adds support for Unity Catalog Open APIs

As we announced with our partners at Microsoft

today

, our collaboration is deepening.

Microsoft has already added support for reading from Azure Databricks with

OneLake

Mirroring

, allowing Fabric engines to access all of the data managed in Unity Catalog

seamlessly.   Unlike other OneLake integrations with proprietary platforms, this makes

all data in Unity Catalog - including the highest performance tables - available in

OneLake without copying, changing code, or additional costs.

Today, Microsoft and Databricks are extending their openness by integrating even more

natively. With Microsoft OneLake adding support for the Unity Catalog Open API

standard, Azure Databricks users will be able to seamlessly read data from OneLake.

With OneLake adding support for open catalog APIs including Iceberg REST and Unity

Catalog Open APIs, Microsoft is making OneLake structured and unstructured data from

services like Dynamics, Dataverse, Blob store, etc. natively accessible to the entire open

lakehouse ecosystem, including Databricks.

Databricks Builds on the Open Foundation

Leveraging this expanded capability, Databricks is adding support to make all OneLake

data seamlessly available in Unity Catalog.

This enables zero-copy reading of OneLake data from within Databricks ensuring

seamless interoperability and access across both platforms, giving Databricks customers

access to all their data in the Microsoft ecosystem to power their most advanced AI,

machine learning, and large-scale data engineering workloads.

https://www.databricks.com/blog/expanding-support-onelake-unity-catalog

2/5

4/27/26, 9:23 AM

Expanding support for OneLake in Unity Catalog | Databricks Blog

Catalog Integration

1. Reading from Unity Catalog in Fabric – Generally Available Now

Microsoft has released Azure Databricks mirroring. Customers can

mirror Azure

Databricks data into OneLake

, through Unity Catalog ensuring that ALL data

managed by Azure Databricks is instantly available across Microsoft Fabric

workloads. Both platforms can work over the same copy of data with no data

movement.

2. Reading from OneLake in Azure Databricks - EOY 2025

This new capability, enables Azure Databricks to read data from OneLake via their

Unity Catalog Open APIs and allows all of your OneLake data to be leveraged

seamlessly in Databricks. Customers can create Unity Catalog Connections to

OneLake based on Managed Identities from EntraID, and can seamlessly mount data

items from any Fabric workspace, directly as a catalog in Unity.

Connecting to OneLake data in Azure Databricks

The Future is Open

This milestone reflects how far the industry has come toward an open, interoperable

data ecosystem. Customers no longer need to choose between innovation and

interoperability—they can have both.

https://www.databricks.com/blog/expanding-support-onelake-unity-catalog

3/5

4/27/26, 9:23 AM

Expanding support for OneLake in Unity Catalog | Databricks Blog

With Microsoft now embracing the open catalog standard,  we are excited to continue

building the future of data and AI on this foundation.  Stay tuned for more

announcements and roadmap updates, including support for Azure Databricks writing

data directly in OneLake, as we deepen our integration.

Get started with Azure Databricks for free →

Get the latest posts in your inbox

Subscribe to our blog and get the latest posts delivered to your inbox.

Work Email *

Country *

Italy

Subscribe

By clicking “Subscribe” I understand that I will receive Databricks communications, and I agree to

Databricks processing my personal data in accordance with its

Privacy Policy
.

View all blogs

https://www.databricks.com/blog/expanding-support-onelake-unity-catalog

4/5

4/27/26, 9:23 AM

Expanding support for OneLake in Unity Catalog | Databricks Blog

Why Databricks

Product

Solutions

Resources

About

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

https://www.databricks.com/blog/expanding-support-onelake-unity-catalog

5/5


