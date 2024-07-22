---
title: "Manage add-ins by using Office Telemetry Dashboard"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: conceptual
ms.service: office-perpetual-itpro
ms.localizationpriority: medium
ms.collection: Tier2
description: "Describes how to improve Office performance by managing add-ins by using Office Telemetry Dashboard."
ms.date: 05/21/2024
---

# Manage add-ins by using Office Telemetry Dashboard

***Applies to:*** *Office 2019, Office 2016*

> [!IMPORTANT]
> - Office Telemetry Dashboard is no longer supported in Microsoft 365 Apps for enterprise (as of Version 2208), and is removed in Version 2301 (and later).
> - For more information, see [Removal of Office Telemetry Dashboard from Microsoft 365 Apps for enterprise](telemetry-dashboard-removal.md).

If you can prevent end users from running non-approved add-ins that might cause issues or slow performance, then you can reduce your support costs. If an add-in is crashing or takes a long time to load, you can disable the add-in for all Office client computers at the same time. Using Office Telemetry Dashboard, you can monitor add-in usage along with performance and other issues. With the collected data, you can decide which add-ins should be managed. This article points to more information about how to manage add-ins for Office by using Office Telemetry Dashboard.
  
  
## About add-in management with Office Telemetry Dashboard

Use the Add-in management worksheet to generate a Group Policy Object script that sets the configuration state of add-ins that are used with Office. The following screenshot displays the Add-in Management worksheet.

  
**User interface for managing add-ins in Office Telemetry Dashboard**

:::image type="content" source="../compatibility/media/manage-add-ins-by-using-telemetry-dashboard-in-office/managing-addins-telemetry.png" alt-text="A screenshot of Office 2013 telemetry data table showing success rate, load time, and application details alongside group policy settings.":::

  
By using the Group Policy Administrative Template files (ADMX/ADML) for Office, you can also create lists of managed add-ins and optionally block any add-in that isn't on the list. Users can't override these settings unless you allow them to.
  
For more information about how to manage Office add-ins by using Office Telemetry Dashboard, see [Let's manage add-ins using Telemetry Dashboard](/archive/blogs/office_resource_kit/lets-manage-add-ins-using-telemetry-dashboard).

  
## Related topics

- [Guide to Office Telemetry Dashboard resources](compatibility-and-telemetry-in-office.md)
- [Deploy Office Telemetry Dashboard](deploy-telemetry-dashboard.md)
- [Manage the privacy of data monitored by Office Telemetry Dashboard](manage-the-privacy-of-data-monitored-by-telemetry-in-office.md)
