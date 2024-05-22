---
title: "Overview of viewer mode for Microsoft 365 Apps"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
ms.reviewer: mattphil
audience: ITPro
ms.topic: conceptual
ms.service: o365-proplus-itpro
ms.collection: Tier2
ms.localizationpriority: medium
recommendations: false
description: "Overview of viewer mode for Microsoft 365 Apps."
ms.date: 03/01/2023
---

# Overview of viewer mode for Microsoft 365 Apps

Viewer mode allows unlicensed users of Microsoft 365 Apps to view and print Office files without being prompted to activate Office. To use viewer mode, you must use a supported version of Microsoft 365 Apps for enterprise.

Viewer mode is designed for users who need to view or print Office files without creating or editing. For example, a doctor or nurse can use this mode to open files in Office from a health-care line-of-business application. Viewer mode is a benefit to users of Office for the web.

When viewer mode is enabled, an unlicensed user of Microsoft 365 Apps for enterprise isn't prompted to activate Office when they open Word, Excel, or PowerPoint. Instead, they see the following banner message underneath the ribbon in their Office apps that informs them Office is in viewer mode.

:::image type="content" source="/DeployOffice/media/overview-viewer-mode/viewer-mode-notification.png" alt-text="Viewer mode notification indicating Word is configured for view and print only.":::

## Enable viewer mode with Group Policy

To enable viewer mode for unlicensed users in your organization with Group Policy:

- Enable the **Use Viewer Mode** policy setting. You can find this policy setting under Computer Configuration\Policies\Administrative Templates\Microsoft Office 2016 (Machine)\Licensing Settings.

- If you're using Version 2204 or older, disable the **Automatically activate Office with federated organization credentials** policy setting. You can find this setting under User Configuration\Policies\Administrative Templates\Microsoft Office 2016\Subscription Activation. By disabling this setting, you ensure that Office isn't automatically activated with federated organization credentials.

To use these policy settings, download and install the [Administrative Template files (ADMX/ADML) for Office](https://www.microsoft.com/download/details.aspx?id=49030) from the Microsoft Download Center.

## Considerations when using viewer mode

- Viewer mode is supported for the following apps:
  - Version 1902 or later of Word, Excel, and PowerPoint.
  - Version 2005 or later of Project and Visio.
- Updates, such as new features and security updates, are still applied when Office is in viewer mode.
- The **Activate Product** button under **File** > **Account** is hidden when Office is in viewer mode.
- *(For Version 2205 and later)* If viewer mode is enabled, but the user has a license for the product, such as Visio, then the user will have an activated, fully functional version of that product. The other unlicensed products on the device, such as Project, will remain in viewer mode.
- Even when viewer mode is enabled, users need to accept the license agreement when Office is opened for the first time. You can automatically accept the license agreement for your users when you deploy Office by configuring the [AcceptEULA attribute](office-deployment-tool-configuration-options.md#accepteula-attribute-part-of-display-element).