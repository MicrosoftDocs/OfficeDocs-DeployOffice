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

The Readiness Toolkit creates reports, in either Excel or Power BI, which can assist organizations in the Prepare phase. The reports contain inventory and readiness assessment information, including the following:

- An inventory of COM add-ins, plus information on add-in adoption and ISV support for Office 365 ProPlus.
- A compatibility assessment of VBA macros for devices installed with older versions of Office, as far back as Office 2003.
- An inventory of recently opened files that use VBA macros.
- A VBA macro compatibility assessment of files from specified folders or network shares.

You can assess an individual device, a collection of devices, or a collection of documents.

There are different ways you can deploy and run the Readiness Toolkit within your organization without significant planning or investment in time. The Readiness Toolkit does not require database infrastructure, but you can export report data to SQL Server to create interactive Power BI reports for high scale reporting and custom analysis.

While the Readiness Toolkit is designed for on-premises use, add-in adoption information, which is optional, requires access to a publicly available web service. If you can't use this web service in your environment, you can find third party add-in adoption information on the [Ready for Modern Desktop](https://developer.microsoft.com/windows/ready-for-windows#/) website.

For more information, see [Use the Readiness Toolkit to assess application compatibility for Office 365 ProPlus](use-the-readiness-toolkit-to-assess-application-compatibility-for-office-365-pro.md).

## Office 365 ProPlus upgrade readiness dashboard in Configuration Manager (Current Branch)



## Office Telemetry Dashboard

In the past, before there was the Readiness Toolkit or the Office 365 ProPlus readiness features in Configuration Manager, we recommended Office Telemetry Dashboard for Office compatibility assessment. Office Telemetry Dashboard, which was first released in Office 2013, is still a supported tool, but we now only recommend it for certain specific scenarios.

Office Telemetry Dashboard can assist some organizations in both the Upgrade and Manage phases, because it provides the following specialized functionality:

- Runtime application and document usage, which tracks which Office applications and files are used.
- Runtime issue logging, which tracks application and add-in crashes, VBA macro errors, and usages of deprecated or modified VBA APIs.

Office Telemetry Dashboard gathers an inventory of add-ins and Office files as they are used. Since this inventory is gathered through usage, you need to collect inventory over a period of time, such as at least 30 days. This time is needed to accumulate sufficient data to provide meaningful insight into usage patterns within your organization.

In contrast, Readiness Toolkit and Configuration Manager provide an instant inventory of installed add-ins and recently used documents without the need to wait for usage patterns to emerge. These tools also provide Office 365 ProPlus support and adoption information for add-ins, and they proactively scan VBA macros for potential compability issues prior to your upgrade.

Runtime issue logging can help with health tracking as your organization upgrades to Office 365 ProPlus and as you manage ongoing updates to Office 365 ProPlus. This health information can be used to determine if the upgrade to Office 365 ProPlus is successful based on the volume of health issues. The detailed health reporting also helps with remediation. 

But, Office Telemetry Dashboard requires a significant amount of time to plan and deploy. For example, you need to enable logging on devices in your organization, configure processors to collect the information from those devices, and create and manage a SQL Server database to store the information collected from those devices.

We recognize that the time needed to plan, deploy, and manage Office Telemetry Dashboard can be a deterrent to many organizations. But, we know the type of health reporting provided by Office Telemetry Dashboard is useful to organizations, so we are planning to provide health reporting capabilities in future release of Configuration Manager (Current Branch).

For more information about Office Telemetry Dashboard, see [Guide to Office Telemetry Dashboard resources](compat/compatibility-and-telemetry-in-office.md). 