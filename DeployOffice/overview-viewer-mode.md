---
title: "Overview of viewer mode for Office 365 ProPlus"
ms.author: MJP-MSFT
author: MJP-MSFT
manager: jwhit
audience: ITPro
ms.topic: article
ms.service: o365-proplus-itpro
localization_priority: Normal
ms.collection: 
- Ent_O365
- M365-modern-desktop
ms.custom: Ent_Office_ProPlus
description: "Overview of viewer mode for Office 365 ProPlus."
---

# Overview of viewer mode for Office 365 ProPlus

Viewer mode allows unlicensed users of Office 365 ProPlus to view and print Office files without being prompted to activate Office. To use viewer mode, you must have version 1902 of Office 365 ProPlus or later. To enable viewer mode, your organization must have an Office 365 or Microsoft 365 license subscription.

Viewer mode is designed for users who need to view or print Office files without creating or editing them. For example, a doctor or nurse can use this mode to open files in Office from a health-care line-of-business application.

When viewer mode is enabled, an unlicensed user of Office 365 ProPlus is not prompted to activate Office when they open Word, Excel, or PowerPoint. Instead, they see a banner message underneath the ribbon in their Office apps that informs them that Office is in viewer mode:

:::image type="content" source="images/viewermode2.png" alt-text="Viewer mode enabled in Word":::

:::image type="content" source="images/viewermode1.png" alt-text="Viewer mode enabled in Office 365 ProPlus":::

If you enable viewer mode on a device, we recommend not installing Outlook and Skype on that device. 

## Enable viewer mode with Group Policy

To enable viewer mode for unlicensed users in your organization with Group Policy, apply the following policy settings:

- Under User Configuration\Policies\Administrative Templates\Microsoft\Office\Licensing Settings, set viewermode to "1"  to enable viwermode. (To disable, set viewermode to "0".)

- Under Configuration\Policies\Administrative Templates\Microsoft\Office\16.0\Common, set autoorgidgetkey to "0". By setting to 0, you ensure that Office is not automatically activated with federated organization credentials.

The Administrative Template files (ADMX/ADML) for this policy setting are available here(https://www.microsoft.com/en-us/download/details.aspx?id=49030)


## Considerations when using viewer mode

- viewermode is supported on Word, Excel, and PowerPoint at this time. We are aware of known issues with Project and Visio and additional prompts. To exclude the unsupported applications you can follow the process here(https://docs.microsoft.com/en-us/DeployOffice/configuration-options-for-the-office-2016-deployment-tool#excludeapp-element) 
- Updates, such as new features and security updates, are still applied when Office is in viewer mode.
- For information about the availability of Version 1902 or later in the update channels for Office 365 ProPlus, see [Update history for Office 365 ProPlus](https://docs.microsoft.com/officeupdates/update-history-office365-proplus-by-date).
- The Activate Product button under File > Account is hidden when Office is in viewer mode.
- Even when viewer mode is enabled, users need to accept the license agreement when Office is opened for the first time. You can automatically accept the license agreement for your users when you deploy Office by configuring the [AcceptEULA attribute](configuration-options-for-the-office-2016-deployment-tool.md#accepteula-attribute-part-of-display-element).
