---
title: "Removal of Office Telemetry Dashboard from Microsoft 365 Apps for enterprise"
ms.author: danbrown
author: DHB-MSFT
manager: dougeby
audience: ITPro
ms.topic: article
ms.service: o365-proplus-itpro
ms.localizationpriority: medium
ms.collection: Ent_O365
ms.custom: Ent_Office_Compat
description: "Notification to Office admins that Office Telemetry Dashboard is being removed from Microsoft 365 Apps for enterprise."
---

# Removal of Office Telemetry Dashboard from Microsoft 365 Apps for enterprise

> [!IMPORTANT]
> - Office Telemetry Dashboard will no longer be supported in Microsoft 365 Apps for enterprise, starting with Version 2208 in Current Channel in August 2022. *(Version 2208 is expected to be available in Semi-Annual Enterprise Channel in January 2023.)*
> - Office Telemetry Dashboard will be removed from Microsoft 365 Apps for enterprise in a future version, but that version hasn't been determined yet.

Office Telemetry Dashboard is being removed from Microsoft 365 Apps for enterprise. For more information about what happens to the Office Telemetry Dashboard components, see [What happens when Office Telemetry Dashboard is removed?](#what-happens-when-office-telemetry-dashboard-is-removed)

## When will Office Telemetry Dashboard be removed?

> [!NOTE]
> - Office Telemetry Dashboard will be removed from Microsoft 365 Apps for enterprise in a future version, but that version hasn't been determined yet. 
> - Once that version is determined, we'll update the table in this section with the relevant details.

The date when Office Telemetry Dashboard will be removed from Microsoft 365 Apps for enterprise depends on which update channel you're using. The following table shows the forecasted schedule. The information in italics in the table is subject to change.

|Update channel  | Version |Release date  |
|---------|---------|---------|
|Current Channel |*To be determined*  |*To be determined* |
|Monthly Enterprise Channel  | *To be determined* | *To be determined*|
|Semi-Annual Enterprise Channel (Preview) |*To be determined*|*To be determined*|
|Semi-Annual Enterprise Channel |*To be determined* |*To be determined* |

## Which versions of Office are affected?

Office Telemetry Dashboard is being removed *only* from versions of Microsoft 365 Apps for enterprise.

Office Telemetry Dashboard is *not* being removed from perpetual versions of Office, such as Office Professional Plus 2019. For those versions, Office Telemetry Dashboard will be supported as long as that version of Office is supported.

The following table lists the end of support dates for perpetual versions of Office that include Office Telemetry Dashboard.

|Office version  |End of support date|
|---------|---------|
|Office Standard 2013 </br> Office Professional Plus 2013 |April 11, 2023 |
|Office Standard 2016 </br> Office Professional Plus 2016 |October 14, 2025 |
|Office Professional Plus 2019 |October 14, 2025 |

> [!NOTE]
> Office Telemetry Dashboard isn't available in Microsoft 365 Apps for business or in Office LTSC 2021.

## What happens when Office Telemetry Dashboard is removed?

When you update to the version of Microsoft 365 Apps for enterprise where Office Telemetry dashboard is removed, some Office Telemetry Dashboard components will be uninstalled automatically. Other components will need to be removed manually. All components will become unsupported.

#### Office Telemetry Agent

The Office Telemetry Agent will be uninstalled automatically from devices.

#### Telemetry Dashboard for Office

The Telemetry Dashboard for Office (the Excel workbook) will be uninstalled automatically.

#### Office Telemetry Processor

The Office Telemetry Processor will no longer be needed. You'll need to remove it manually from devices on which it's installed.

#### Shared folder

The shared folder, which is used by the Office Telemetry Agent and the Office Telemetry Processor, will no longer be needed. You'll need to remove it manually.

#### Database

The SQL Server database, which stores the information used by Office Telemetry Dashboard, will no longer be needed. You'll need to remove it manually.

#### Office Telemetry Log

[Office Telemetry Log](/office/client-developer/shared/troubleshooting-office-files-and-custom-solutions-with-the-telemetry-log) isn't being removed and will still be available on client devices running Windows.

## What is the replacement for Office Telemetry Dashboard?

As an alternative to Office Telemetry Dashboard, we recommend using the following tools, depending on the information you need:

- Readiness Toolkit for Office add-ins and VBA
- Microsoft 365 Apps readiness features in Microsoft Endpoint Configuration Manager (current branch)
- Inventory feature in the Microsoft 365 Apps admin center

For more information about these tools, see the following articles:

- [Overview of application compatibility and readiness assessment tools for Microsoft 365 Apps](../readiness-tools.md)
- [Use the Readiness Toolkit to assess application compatibility for Microsoft 365 Apps](../readiness-toolkit-application-compatibility-microsoft-365-apps.md)
- [Microsoft 365 Apps readiness dashboard (in Configuration Manager)](/mem/configmgr/sum/deploy-use/office-365-dashboard#bkmk_readiness-dash)
- [Overview of inventory in the Microsoft 365 Apps admin center](../admincenter/inventory.md)