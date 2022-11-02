---
title: "Options for deploying Office Insider"
ms.author: danbrown
author: DHB-MSFT
manager: dougeby
audience: ITPro
ms.topic: article
ms.service: o365-proplus-itpro
ms.localizationpriority: medium
ms.collection: Ent_O365
ms.custom: Office_Insider
recommendations: false
description: "Provides an overview of the deployment options for Office Insider for Windows and Mac"
---

# Options for deploying Office Insider

The Office Insider program offers organizations an opportunity to evaluate new Office subscription features before general release.

Both of the following Office Insider deployment scenarios are supported:
 - [Change to Office Insider when Office is already installed](#change-to-office-insider-when-office-is-already-installed)
 - [Choose Office Insider when you install Office](#choose-office-insider-when-you-install-office)

As the admin, you can deploy Office Insider for your users. Or, you can allow users to select which Office Insider channel they want to use.

Different deployment options are available, for Windows and Mac devices. Which option, or options, you choose depends on how you manage Office in your organization.

> [!NOTE]
> - Regardless of which deployment option you choose, we recommend that you configure Office to get updates from Microsoft directly from the internet. Getting updates for Office Insider directly from the internet simplifies update management for you. You'll automatically get new updates to Office Insider when they're released.
> - To see which subscription Office apps are covered by Office Insider, [review this list](#office-apps-covered-by-office-insider).

## Change to Office Insider when Office is already installed

If Office is already installed, here are the quickest and simplest ways to change to Office Insider:

- For a Windows device, [use a command to change the registry](registry.md).
- For a Mac, [use Microsoft AutoUpdate (MAU)](microsoft-autoupdate.md).  

In both cases, you need to have local admin permissions on the device to change to Office Insider.

Here are the different ways that can you change to Office Insider when Office is already installed.

|Method  |Type of device|When to use  |More information  |
|---------|---------|---------|---------|
|Office Deployment Tool  |Windows |If you're already using the Office Deployment Tool to configure Office.  |[Change an existing Office installation to Office Insider (Office Deployment Tool)](office-deployment-tool.md#change-an-existing-office-installation-to-office-insider) |
|Microsoft Intune |Windows |If you're already using Microsoft Intune to manage software.|[Change an existing Office installation to Office Insider (Intune)](intune.md#change-an-existing-office-installation-to-office-insider) |
|Group Policy   |Windows |If you're already using Group Policy to configure Office.   | [Use Group Policy to install Office Insider on Windows devices](group-policy.md) |
|Use a command to update the registry|Windows |If you can't use Group Policy or you want a quick way to change to Office Insider. |[Use a registry command to install Office Insider on Windows devices](registry.md)|
|Let users choose Office Insider for themselves |Windows |If you want users to select Office Insider for themselves by going to **File** > **Account**.|[Let users choose which Office Insider channel to install on Windows](user-choice.md)|
|Microsoft AutoUpdate (MAU) | Mac |If you want users to select an Office Insider channel for themselves. |[Let Mac users choose Office Insider for themselves by using Microsoft AutoUpdate (MAU)](microsoft-autoupdate.md)    |
|Preference | Mac |If you want to choose which Mac users have Office Insider. |[Provide Mac users with Office Insider by using a preference](preference.md)|

## Choose Office Insider when you install Office

If you're doing a new installation of Office, here are ways that you can deploy Office Insider.

|Method  |Type of device|When to use  |More information  |
|---------|---------|---------|---------|
|Office Deployment Tool |Windows |If you're already using the Office Deployment Tool to install Office. |[Install Office Insider when you do a new Office installation (Office Deployment Tool)](office-deployment-tool.md#install-office-insider-when-you-do-a-new-office-installation) |
|Configuration Manager |Windows |If you're already using Microsoft Configuration Manager (current branch) to deploy software. | [Use Configuration Manager to install Office Insider on Windows devices](configuration-manager.md)|
|Microsoft Intune |Windows |If you're already using Microsoft Intune to deploy software.|[Install Office Insider when you do a new Office installation (Intune)](intune.md#install-office-insider-when-you-do-a-new-office-installation)      |

## Video with demos of some deployment options

To learn more about the Office Insider program and to see demos of some of these deployment options, you can watch the following video.

> [!VIDEO https://www.microsoft.com/videoplayer/embed/RE4ImX5] 

## Office apps covered by Office Insider

The following subscription Office apps are covered by the Office Insider program.

On Windows devices:
- Access
- Excel
- OneNote
- Outlook
- PowerPoint
- Project
- Visio
- Word

On Mac devices:
- Excel
- OneNote
- Outlook
- PowerPoint
- Word

## Related articles
- [Compare Office Insider channels](../compare-channels.md)
