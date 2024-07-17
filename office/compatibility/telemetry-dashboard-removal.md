---
title: "Removal of Office Telemetry Dashboard from Microsoft 365 Apps for enterprise"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: conceptual
ms.service: o365-proplus-itpro
ms.localizationpriority: medium
ms.collection: Tier2
description: "Notification to Microsoft 365 admins that Office Telemetry Dashboard is being removed from Microsoft 365 Apps for enterprise."
ms.date: 12/12/2023
---

# Removal of Office Telemetry Dashboard from Microsoft 365 Apps for enterprise

> [!IMPORTANT]
> Office Telemetry Dashboard is no longer supported in Microsoft 365 Apps for enterprise (as of Version 2208).

Office Telemetry Dashboard is being removed from Microsoft 365 Apps for enterprise. For more information about what happens to the Office Telemetry Dashboard components, see [What happens when Office Telemetry Dashboard is removed?](#what-happens-when-office-telemetry-dashboard-is-removed)

## When will Office Telemetry Dashboard be removed?

The date when Office Telemetry Dashboard is removed from Microsoft 365 Apps for enterprise depends on which update channel you're using.

|Update channel  | Version |Release date  |
|---------|---------|---------|
|Current Channel |Version 2301  |January 26, 2023 |
|Monthly Enterprise Channel  | Version 2301  | March 14, 2023|
|Semi-Annual Enterprise Channel (Preview) |Version 2302 |March 14, 2023|
|Semi-Annual Enterprise Channel |Version 2302|July 11, 2023 |

## Which versions of Office are affected?

Office Telemetry Dashboard is being removed *only* from versions of Microsoft 365 Apps for enterprise.

Office Telemetry Dashboard is *not* being removed from volume licensed versions of Office, such as Office Professional Plus 2019. For those versions, Office Telemetry Dashboard is supported as long as that version of Office is supported.

The following table lists the end of support dates for volume licensed versions of Office that include Office Telemetry Dashboard.

|Office version  |End of support date|
|---------|---------|
|Office Standard 2013 </br> Office Professional Plus 2013 |April 11, 2023 |
|Office Standard 2016 </br> Office Professional Plus 2016 |October 14, 2025 |
|Office Professional Plus 2019 |October 14, 2025 |

> [!NOTE]
> Office Telemetry Dashboard isn't available in Microsoft 365 Apps for business or in Office LTSC 2021.

## What happens when Office Telemetry Dashboard is removed?

When you update to the version of Microsoft 365 Apps for enterprise where Office Telemetry dashboard is removed, some Office Telemetry Dashboard components are uninstalled automatically. Other components need to be removed manually. All components become unsupported.

#### Office Telemetry Agent

The Office Telemetry Agent is uninstalled automatically from devices.

#### Telemetry Dashboard for Office

The Telemetry Dashboard for Office (the Excel workbook) is uninstalled automatically.

#### Office Telemetry Processor

The Office Telemetry Processor is no longer needed. You need to remove it manually from devices on which it's installed.

#### Shared folder

The shared folder, which is used by the Office Telemetry Agent and the Office Telemetry Processor, is no longer needed. You need to remove it manually.

#### Database

The SQL Server database, which stores the information used by Office Telemetry Dashboard, is no longer needed. You need to remove it manually.

#### Office Telemetry Log

[Office Telemetry Log](/office/client-developer/shared/troubleshooting-office-files-and-custom-solutions-with-the-telemetry-log) isn't being removed and is still available on client devices running Windows.

## What is the replacement for Office Telemetry Dashboard?

As an alternative to Office Telemetry Dashboard, we recommend using the following tools, depending on the information you need:

- Inventory feature in the Microsoft 365 Apps admin center
- Apps health feature in the Microsoft 365 Apps admin center
- Microsoft 365 Apps readiness features in Microsoft Configuration Manager (current branch)

For more information about these tools, see the following articles:

- [Overview of application compatibility and readiness assessment tools for Microsoft 365 Apps](../readiness-tools.md)
- [Overview of inventory in the Microsoft 365 Apps admin center](../admincenter/inventory.md)
- [Overview of Apps health in the Microsoft 365 Apps admin center](../admincenter/microsoft-365-apps-health.md)
- [Introduction to Apps health (video)](https://youtu.be/g9tiCFNDOEw)
- [Microsoft 365 Apps readiness dashboard (in Configuration Manager)](/mem/configmgr/sum/deploy-use/office-365-dashboard#bkmk_readiness-dash)
