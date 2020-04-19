---
title: "Overview of viewer mode for Microsoft 365 Apps"
ms.author: mattphil
author: MJP-MSFT
manager: laurawi
audience: ITPro
ms.topic: article
ms.service: o365-proplus-itpro
localization_priority: Normal
ms.collection: 
- Ent_O365
- M365-modern-desktop
ms.custom: Ent_Office_ProPlus
description: "Overview of viewer mode for Microsoft 365 Apps."
---

# Overview of viewer mode for Microsoft 365 Apps

Viewer mode allows unlicensed users of Microsoft 365 Apps to view and print Office files without being prompted to activate Office. To use viewer mode, you must have version 1902 of Microsoft 365 Apps or later. To enable viewer mode, your organization must have an Office 365 or Microsoft 365 license subscription.

Viewer mode is designed for users who need to view or print Office files without creating or editing them. For example, a doctor or nurse can use this mode to open files in Office from a health-care line-of-business application.

When viewer mode is enabled, an unlicensed user of Microsoft 365 Apps is not prompted to activate Office when they open Word, Excel, or PowerPoint. Instead, they see a banner message underneath the ribbon in their Office apps that informs them that Office is in viewer mode:

:::image type="content" source="images/viewermode2.png" alt-text="Viewer mode enabled in Word":::

:::image type="content" source="images/viewermode1.png" alt-text="Viewer mode enabled in Microsoft 365 Apps":::

## Enable viewer mode with Group Policy

To enable viewer mode for unlicensed users in your organization with Group Policy:

- Enable the **Use Viewer Mode** policy setting. You can find this policy setting under Computer Configuration\Policies\Administrative Templates\Microsoft Office 2016 (Machine)\Licensing Settings.

- Disable the **Automatically activate Office with federated organization credentials** policy setting. You can find this setting under User Configuration\Policies\Administrative Templates\Microsoft Office 2016\Subscription Activation. By disabling this setting, you ensure that Office is not automatically activated with federated organization credentials.

To use these policy settings, download and install the [Administrative Template files (ADMX/ADML) for Office](https://www.microsoft.com/download/details.aspx?id=49030) from the Microsoft Download Center.

## Considerations when using viewer mode

- Viewer mode is currently supported for Word, Excel, and PowerPoint. We are aware of known issues with Project and Visio. For information about how to exclude applications when deploying, see [ExcludeApp element](https://docs.microsoft.com/DeployOffice/configuration-options-for-the-office-2016-deployment-tool#excludeapp-element). 
- Updates, such as new features and security updates, are still applied when Office is in viewer mode.
- For information about the availability of Version 1902 or later in the update channels for Microsoft 365 Apps, see [Update history for Office 365 ProPlus](https://docs.microsoft.com/officeupdates/update-history-office365-proplus-by-date).
- The Activate Product button under File > Account is hidden when Office is in viewer mode.
- Even when viewer mode is enabled, users need to accept the license agreement when Office is opened for the first time. You can automatically accept the license agreement for your users when you deploy Office by configuring the [AcceptEULA attribute](configuration-options-for-the-office-2016-deployment-tool.md#accepteula-attribute-part-of-display-element).
