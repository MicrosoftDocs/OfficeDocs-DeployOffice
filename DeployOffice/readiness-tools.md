---
title: "Overview of application readiness tools for Office 365 ProPlus"
ms.author: danbrown
author: DHB-MSFT
manager: laurawi
audience: ITPro
ms.topic: article
ms.service: o365-proplus-itpro
localization_priority: Normal
ms.collection: Ent_O365
ms.custom:
- Ent_Office_ProPlus
- Ent_Office_Compat
description: "Provides IT Pros with info about the different application compatibility and readiness tools that can help organizations move to Office 365 ProPlus"
---

# Overview of application readiness tools for Office 365 ProPlus


Typically, enterprises go through the following phases when planning an upgrade to Office 365 ProPlus:

- **Prepare**  Gather the inventory of devices, solutions, users, and compatibility information to adequately plan for the upgrade and pilot validation.
- **Upgrade**  Perform the necessary steps to deploy Office, including potential remediation work for application compatibility.
- **Manage**  Ensure ongoing updates don’t have any impact on business continuity or application compatibility.


## Readiness Toolkit for Office add-ins and VBA

The Readiness Toolkit for Office add-ins and VBA is our recommended basic solution for application compatibility and readiness assessment. The Readiness Toolkit is a free tool available from the [Microsoft Download Center](https://www.microsoft.com/download/details.aspx?id=55983).

The Readiness Toolkit creates reports, in either Excel or Power BI, which assist in the Prepare phase. The reports contain inventory and readiness assessment information, including the following:

- An inventory of COM add-ins, plus information on add-in adoption and ISV support for Office 365 ProPlus.
- A compatibility assessment of VBA macros for devices installed with older versions of Office, as far back as Office 2003.
- An inventory of recently opened files that use VBA macros.
- A VBA macro compatibility assessment of files from specified folders or network shares.

You can assess an individual device, a collection of devices, or a collection of documents.

There are different ways you can deploy and run the Readiness Toolkit within your organization. The Readiness Toolkit does not require database infrastructure, but you can export report data to SQL Server to create interactive Power BI reports for high scale reporting and custom analysis.

While the Readiness Toolkit is designed for on-premises use, add-in adoption information, which is optional, requires access to a publicly available web service. If you can't use this web service in your environment, you can find third party add-in adoption information on the [Ready for Modern Desktop](https://developer.microsoft.com/windows/ready-for-windows#/) website.

For more information, see [Use the Readiness Toolkit to assess application compatibility for Office 365 ProPlus](use-the-readiness-toolkit-to-assess-application-compatibility-for-office-365-pro.md).

## Office 365 ProPlus upgrade readiness dashboard in Configuration Manager



## Office Telemetry Dashboard