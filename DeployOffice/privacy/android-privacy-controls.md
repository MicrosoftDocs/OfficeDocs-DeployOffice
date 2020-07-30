---
title: "Use policy settings to manage privacy controls for Office on Android devices"
ms.author: danbrown
author: DHB-MSFT
manager: laurawi
audience: ITPro
ms.topic: article
ms.service: o365-proplus-itpro
localization_priority: Priority
ms.collection: Ent_O365
ms.custom: 
- Ent_Office_ProPlus
- Ent_Office_Privacy
description: "Provides Office admins with information about how to manage privacy settings for Office on Android devices."
hideEdit: true
---

# Use policy settings to manage privacy controls for Office on Android devices

There are policy settings for Office on Android devices that allow you to control settings related to the following:

- ***Diagnostic data*** that is collected and sent to Microsoft about Office client software being used.

- ***Connected experiences*** that use cloud-based functionality to provide enhanced Office features to you and your users.

For more information about diagnostic data and connected experiences, see [Overview of privacy controls](overview-privacy-controls.md).

These policy settings apply to the following applications:
- Version 16.0.12228.20260 and later of Word for Android, Excel for Android, and PowerPoint for Android.
- Version 4.1.71 and later of Outlook for Android.
- Version 16.0.12228.20004 and later of OneNote for Android.
- Version 5.47 and later of OneDrive for Android.
- Version 16.0.12430.20254 and later of the Office app for Android.

## Policy settings available for Office on Android devices

The following table lists which policy settings are available for Office on Android devices and a link to additional information about each policy setting.

> [!NOTE]
>- The additional information provided covers the policy settings for Office on devices running Windows. But the same information applies to Office on Android devices because they are the same policy settings.
>- The *Allow the use of connected experiences in Office* policy setting that's available for Office on devices running Windows does not apply to Office on Android devices. 


|Name of policy setting  |Additional information |
|---------|---------|
|Configure the level of client software diagnostic data sent by Office to Microsoft|[Policy setting for diagnostic data](manage-privacy-controls.md#policy-setting-for-diagnostic-data)         |
|Allow the use of connected experiences in Office that analyze content| [Policy setting for connected experiences that analyze your content](manage-privacy-controls.md#policy-setting-for-connected-experiences-that-analyze-your-content)        |
|Allow the use of connected experiences in Office that download online content |[Policy setting for connected experiences that download online content](manage-privacy-controls.md#policy-setting-for-connected-experiences-that-download-online-content)         |
|Allow the use of additional optional connected experiences in Office |[Policy setting for optional connected experiences](manage-privacy-controls.md#policy-setting-for-optional-connected-experiences)|



## Use Office cloud policy service to apply policy settings

To apply any of these 4 policy settings for Office on Android devices, you need to use the Office cloud policy service. For more information on using the Office cloud policy service, see [Overview of the Office cloud policy service](../overview-office-cloud-policy-service.md).

> [!NOTE]
> If you previously used Office cloud policy service to configure these policy settings for Office on devices running Windows, those same settings will apply to Office on Android devices. For that to happen, you just need to sign in to the Office cloud policy service and the service will apply the settings automatically to Office on Android devices.
