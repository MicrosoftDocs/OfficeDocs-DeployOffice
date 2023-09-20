---
title: "Options for deploying Microsoft 365 Insider"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: conceptual
ms.service: o365-proplus-itpro
ms.localizationpriority: medium
ms.collection: Tier1
recommendations: false
description: "Provides an overview of the deployment options for Microsoft 365 Insider for Windows and Mac"
ms.date: 04/21/2023
---

# Options for deploying Microsoft 365 Insider

The Microsoft 365 Insider program offers organizations an opportunity to evaluate new Microsoft 365 Apps features before general release.

Both of the following Microsoft 365 Insider deployment scenarios are supported:
 - [Change to Microsoft 365 Insider when Microsoft 365 Apps is already installed](#change-to-microsoft-365-insider-when-microsoft-365-apps-is-already-installed)
 - [Choose Microsoft 365 Insider when you install Microsoft 365 Apps](#choose-microsoft-365-insider-when-you-install-microsoft-365-apps)

As the admin, you can deploy Microsoft 365 Insider for your users. Or, you can allow users to select which Microsoft 365 Insider channel they want to use.

Different deployment options are available, for Windows and Mac devices. Which option, or options, you choose depends on how you manage Microsoft 365 Apps in your organization.

> [!NOTE]
> - Regardless of which deployment option you choose, we recommend that you configure Microsoft 365 Apps to get updates from Microsoft directly from the internet. Getting updates for Microsoft 365 Insider directly from the internet simplifies update management for you. You'll automatically get new updates to Microsoft 365 Insider when they're released.
> - To see which apps are covered by Microsoft 365 Insider, [review this list](#apps-covered-by-microsoft-365-insider).

## Change to Microsoft 365 Insider when Microsoft 365 Apps is already installed

If Microsoft 365 Apps is already installed, here are the quickest and simplest ways to change to Microsoft 365 Insider:

- For a Windows device, [use a command to change the registry](registry.md).
- For a Mac, [use Microsoft AutoUpdate (MAU)](microsoft-autoupdate.md).  

In both cases, you need to have local admin permissions on the device to change to Microsoft 365 Insider.

Here are the different ways that can you change to Microsoft 365 Insider when Microsoft 365 Apps is already installed.

|Method  |Type of device|When to use  |More information  |
|---------|---------|---------|---------|
|Office Deployment Tool  |Windows |If you're already using the Office Deployment Tool to configure Microsoft 365 Apps.  |[Change an existing Microsoft 365 Apps installation to Microsoft 365 Insider (Office Deployment Tool)](office-deployment-tool.md#change-an-existing-microsoft-365-apps-installation-to-microsoft-365-insider) |
|Microsoft Intune |Windows |If you're already using Microsoft Intune to manage software.|[Change an existing Microsoft 365 Apps installation to Microsoft 365 Insider (Intune)](intune.md#change-an-existing-microsoft-365-apps-installation-to-microsoft-365-insider) |
|Group Policy   |Windows |If you're already using Group Policy to configure Microsoft 365 Apps.   | [Use Group Policy to install Microsoft 365 Insider on Windows devices](group-policy.md) |
|Use a command to update the registry|Windows |If you can't use Group Policy or if you want a quick way to change to Microsoft 365 Insider.|[Use a registry command to install Microsoft 365 Insider on Windows devices](registry.md)|
|Let users choose Microsoft 365 Insider for themselves |Windows |If you want users to select Microsoft 365 Insider for themselves by going to **File** > **Account**.|[Let users choose which Microsoft 365 Insider channel to install on Windows](user-choice.md)|
|Microsoft AutoUpdate (MAU) | Mac |If you want users to select a Microsoft 365 Insider channel for themselves. |[Let Mac users choose Microsoft 365 Insider for themselves by using Microsoft AutoUpdate (MAU)](microsoft-autoupdate.md)    |
|Preference | Mac |If you want to choose which Mac users have Microsoft 365 Insider. |[Provide Mac users with Microsoft 365 Insider by using a preference](preference.md)|

## Choose Microsoft 365 Insider when you install Microsoft 365 Apps

If you're doing a new installation of Microsoft 365 Apps, here are ways that you can deploy Microsoft 365 Insider.

|Method  |Type of device|When to use  |More information  |
|---------|---------|---------|---------|
|Office Deployment Tool |Windows |If you're already using the Office Deployment Tool to install Microsoft 365 Apps. |[Install Microsoft 365 Insider when you do a new Microsoft 365 Apps installation (Office Deployment Tool)](office-deployment-tool.md#install-microsoft-365-insider-when-you-do-a-new-microsoft-365-apps-installation) |
|Configuration Manager |Windows |If you're already using Microsoft Configuration Manager (current branch) to deploy software. | [Use Configuration Manager to install Microsoft 365 Insider on Windows devices](configuration-manager.md)|
|Microsoft Intune |Windows |If you're already using Microsoft Intune to deploy software.|[Install Microsoft 365 Insider when you do a new Microsoft 365 Apps installation (Intune)](intune.md#install-microsoft-365-insider-when-you-do-a-new-microsoft-365-apps-installation)      |

## Video with demos of some deployment options

To learn more about the Microsoft 365 Insider program and to see demos of some of these deployment options, you can watch the following video.

> [!VIDEO https://www.microsoft.com/videoplayer/embed/RE4ImX5]

## Apps covered by Microsoft 365 Insider

The following subscription apps are covered by the Microsoft 365 Insider program.

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

> [!TIP]
> To get early access to new features in the web versions of the apps, use the [Targeted release](/microsoft-365/admin/manage/release-options-in-office-365) option in the Microsoft 365 admin center.

## Related articles
- [Compare Microsoft 365 Insider channels](../compare-channels.md)
