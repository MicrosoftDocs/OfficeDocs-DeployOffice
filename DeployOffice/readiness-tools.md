---
title: "Overview of application compatibility and readiness assessment tools for Microsoft 365 Apps"
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

# Overview of application compatibility and readiness assessment tools for Microsoft 365 Apps

> [!IMPORTANT]
> Office 365 ProPlus is being renamed to **Microsoft 365 Apps for enterprise**. To learn more about this name change, [read this blog post](https://go.microsoft.com/fwlink/p/?linkid=2120533). 
>
> For details of when this change takes effect, and what actions admins might need to take, [read this article](name-change.md).

Organizations tell us that application compatibility and readiness assessment is one of their top concerns when planning an upgrade to Microsoft 365 Apps. To help organizations with this assessment effort, we have released different on-premises tools over the last several years. Because there are different tools available, organizations ask us which of these tools they should be using as they plan and implement their upgrade to Microsoft 365 Apps. The answer can depend on a variety of factors, but in general our recommendation is:

 - Use the [Readiness Toolkit](#readiness-toolkit-for-office-add-ins-and-vba) for basic environments where simplified tool deployment and use is desired.
 - Use the [readiness features in Configuration Manager](#microsoft-365-apps-readiness-features-in-configuration-manager-current-branch), if you already have Microsoft Endpoint Configuration Manager (current branch) deployed in your organization.
 - Use [Office Telemetry Dashboard](#office-telemetry-dashboard) only if your organization needs certain usage and health information.

Typically, organizations go through the following phases when planning and implementing an upgrade to Microsoft 365 Apps:

- **Prepare**  Gather the inventory of devices and users, and compatibility information about add-ins and macros to adequately plan for the pilot validation and upgrade.
- **Upgrade**  Perform the necessary steps to deploy Office, including potential remediation work for application compatibility.
- **Manage**  Ensure ongoing updates don’t have any impact on business continuity or application compatibility.

The Readiness Toolkit and Configuration Manager can help during the Prepare phase, and Configuration Manager can also help during the Upgrade phase. Office Telemetry Dashboard is primarily of use during the Manage phase.

The following sections provide an overview of the key features of each of these tools, along with links to additional information about each tool.


## Readiness Toolkit for Office add-ins and VBA

The Readiness Toolkit for Office add-ins and VBA is our recommended basic solution for application compatibility and readiness assessment. The Readiness Toolkit is a free tool available from the [Microsoft Download Center](https://www.microsoft.com/download/details.aspx?id=55983).

The Readiness Toolkit creates reports, in either Excel or Power BI, which can assist organizations in the Prepare phase. The reports contain inventory and readiness assessment information, including the following:

- An inventory of COM add-ins, plus information on add-in adoption and ISV support for Microsoft 365 Apps.
- A compatibility assessment of VBA macros for devices installed with older versions of Office, as far back as Office 2003.
- An inventory of recently opened files that use VBA macros.
- A VBA macro compatibility assessment of files from specified folders or network shares.

You can assess an individual device, a collection of devices, or a collection of documents.

There are different ways you can deploy and run the Readiness Toolkit within your organization without significant planning or investment in time. The Readiness Toolkit does not require database infrastructure, but you can export report data to SQL Server to create interactive Power BI reports for high scale reporting and custom analysis.

While the Readiness Toolkit is designed for on-premises use, add-in adoption information, which is optional, requires access to a publicly available web service. If you can't use this web service in your environment, you can find third party add-in adoption information on the [Ready for Modern Desktop](https://developer.microsoft.com/windows/ready-for-windows#/) website.

For more information, see [Use the Readiness Toolkit to assess application compatibility for Microsoft 365 Apps](use-the-readiness-toolkit-to-assess-application-compatibility-for-office-365-pro.md).

## Microsoft 365 Apps readiness features in Configuration Manager (current branch)

If you have at least Version 1902 of Microsoft Endpoint Configuration Manager (current branch), we recommend using Configuration Manager for assessing application compatibility and readiness for Microsoft 365 Apps in your organization.

 Configuration Manager extends beyond the Readiness Toolkit to help with the Upgrade phase by providing the following features:

- An inventory of Office COM add-ins, including information on add-in adoption and ISV support for Microsoft 365 Apps.
- An inventory of devices that have recently used macros and devices that have not.
- A report of devices ready for Microsoft 365 Apps deployment, as well as a list of devices to pilot to validate that they are ready for Microsoft 365 Apps.
- The ability to create collections of devices based on their readiness assessment.

Unlike the Readiness Toolkit, add-in adoption information is downloaded directly into Configuration Manager, instead of having to rely on accessing a publicly available web service.

If you also need a detailed VBA macro compatibility assessment, you can run the Readiness Toolkit on all devices, or just the set of devices that have recently used macros. This will scan the recently used VBA macro files to assess their readiness. 

After you run the Readiness Toolkit on those devices, the following additional information will be available in Configuration Manager:

- An inventory of devices with VBA macros issues based on the Readiness Toolkit compatibility assessment
- An updated inventory of devices ready for Microsoft 365 Apps deployment, based on both add-in and VBA macro assessments.

You can also use the Readiness Toolkit to scan Office documents in specific folders or network shares, but this information can't be used by Configuration Manager.

Configuration Manager also provides reporting capabilities which can be used to filter on additional add-in and macro compatibility data fields.

Even though they are separate tools, the Readiness Toolkit and Configuration Manager can be combined to form a powerful end-to-end solution ideal for Configuration Manager customers.

For more information, see [Integration for Office 365 ProPlus readiness](https://docs.microsoft.com/configmgr/sum/deploy-use/office-365-dashboard#bkmk_o365_readiness) and [Office 365 ProPlus upgrade readiness dashboard](https://docs.microsoft.com/configmgr/core/get-started/2019/technical-preview-1904#bkmk_o365).


## Office Telemetry Dashboard

In the past, before there was the Readiness Toolkit or the Microsoft 365 Apps readiness features in Configuration Manager, we recommended Office Telemetry Dashboard for Office compatibility assessment. Office Telemetry Dashboard, which was first released in Office 2013, is still a supported tool, but we now only recommend it if you need specific usage and health information.

Office Telemetry Dashboard can assist some organizations primarily in the Manage phase, because it provides the following usage and health information:

- Runtime application and document usage, which tracks which Office applications and files are used.
- Runtime issue logging, which tracks application and add-in crashes, VBA macro errors, and usages of deprecated or modified VBA APIs.

Office Telemetry Dashboard gathers an inventory of add-ins and Office files as they are used. Since this inventory is gathered through usage, you need to collect inventory over a period of time, such as at least 30 days. This time is needed to accumulate sufficient data to provide meaningful insight into usage patterns within your organization.

In contrast, Readiness Toolkit and Configuration Manager provide an instant inventory of installed add-ins and recently used documents without the need to wait for usage patterns to emerge. These tools also provide Microsoft 365 Apps support and adoption information for add-ins, and they proactively scan VBA macros for potential compatibility issues prior to your upgrade. If needed, you can use the Readiness Toolkit to create reports based on add-in data from Office Telemetry Dashboard.

The runtime issue logging provided by Office Telemetry Dashboard can help with health tracking as your organization upgrades to Microsoft 365 Apps and as you manage ongoing updates to Microsoft 365 Apps. This health information can be used to determine if the upgrade to Microsoft 365 Apps is successful based on the volume of health issues. The detailed health reporting also helps with remediation. 

But, Office Telemetry Dashboard requires a significant amount of time to plan and deploy. For example, you need to enable logging on devices in your organization, configure processors to collect the information from those devices, and create and manage a SQL Server database to store the information collected from those devices.

We recognize that the time needed to plan, deploy, and manage Office Telemetry Dashboard can be a deterrent to many organizations. But, we know the type of health reporting provided by Office Telemetry Dashboard is useful to organizations, so we are planning to provide health reporting capabilities in future releases of Configuration Manager (current branch). In the meantime, organizations who need this type of information can continue to use Office Telemetry Dashboard.

For more information about Office Telemetry Dashboard, see [Guide to Office Telemetry Dashboard resources](compat/compatibility-and-telemetry-in-office.md). 