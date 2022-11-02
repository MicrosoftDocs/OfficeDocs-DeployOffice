---
title: "Overview of Office for Mac (for admins and IT Pros)"
ms.author: danbrown
author: DHB-MSFT
manager: dougeby
audience: ITPro
ms.topic: overview
ms.service: o365-proplus-itpro
ms.subservice: office-mac
ms.localizationpriority: medium
ms.collection: Ent_O365
ms.custom: intro-overview
recommendations: true
description: "Provides general information for admins about Office for Mac to help them plan deployments to users in their organization"
---

# Overview of Office for Mac (for admins and IT Pros)

***Applies to:*** *Office for Mac, Office LTSC for Mac 2021, Office 2019 for Mac*

The following Office apps are available for devices running macOS:

- Word
- Excel
- PowerPoint
- Outlook
- OneNote
- OneDrive
- Teams

The following sections are intended to provide information to help you plan your deployment of Office to Mac users in your organization.

For more information, refer to [Deployment options for admins for Office for Mac](deployment-options-for-office-for-mac.md).

## System requirements

Office for Mac is supported on the three most recent versions of macOS. As new major versions of macOS are made generally available, Microsoft will remove support for the oldest version and support the newest and previous two versions of macOS. For more information, refer to [Upgrade macOS to continue receiving Microsoft 365 and Office for Mac updates](https://support.microsoft.com/office/16b8414f-08ec-4b24-8c91-10a918f649f8).

For all the system requirements, refer to [System requirements for Microsoft 365 and Office](https://www.microsoft.com/microsoft-365/microsoft-365-and-office-resources).

## Chipset support

Office provides native support for both Apple Silicon and Intel-based Mac devices. For more information, refer to [Microsoft 365 and Office 2019 support for Apple Silicon](https://support.microsoft.com/office/c55b603e-14a6-4b69-bdc0-2bb4c9a36834).

> [!NOTE]
> OneDrive and Microsoft Teams don't natively support Apple Silicon.

## Languages

All the [supported languages](https://support.microsoft.com/office/26d30382-9fba-45dd-bf55-02ab03e2a7ec#ID0EAABAAA=Mac&ID0EAACAAA=Mac) in Office for Mac a included as part of the installer package (.pkg) file. There aren't separate installer package files for each language, which means that admins can't choose which language to deploy to users. Instead, the language is based on the System Preferences settings. If none of the language settings are supported by Office, Office installs in English. However, all the languages get installed, which means users can [switch to a different language](https://support.microsoft.com/office/f5c54ff9-a6fa-4348-a43c-760e7ef148f8#ID0EACAAA=MacOS&ID0EAACAAA=MacOS&OfficeVersion=macOS) without having to reinstall Office.

## Updates

Office for Mac is updated approximately once a month. These updates include, as needed, security updates and non-security updates, such as updates that provide stability or performance improvements for Office. For those users with a Microsoft 365 (or Office 365) plan, these updates can also include new or improved features. For more information, refer to [Deploy updates for Office for Mac](deploy-updates-for-office-for-mac.md).

## Features

For information about features in the various versions of Office for Mac, review the following resources. Keep in mind that Office LTSC for Mac 2021 and Office 2019 for Mac don't receive new features after they've been released. If you want to get new Office features on an on-going basis, you should consider moving to a Microsoft 365 (or Office 365) plan that includes Office.

If you're looking for information to help your users get started with Office for Mac, review the resources on [Office Help & Training](https://support.microsoft.com/office).

#### Office for Mac features

To review the latest features in each monthly release, refer to [What's new in Microsoft 365](https://support.microsoft.com/office/95c8d81d-08ba-42c1-914f-bca4603e1426?#platform=mac) or [Release notes for Office for Mac](/officeupdates/release-notes-office-for-mac).

> [!TIP]
> For early access to new features, check out the [Office Insider Program for Business](../office-insider/index.yml).

#### Office LTSC for Mac 2021 features

For information about the new features in Office LTSC for Mac 2021, refer to the following articles:
- [What's new in Excel 2021 for Mac](https://support.microsoft.com/office/4100753f-93bc-4143-a77c-7258d1a80cd3)
- [What's new in Outlook 2021 for Mac](https://support.microsoft.com/office/cac45ed4-3f1c-490e-a76d-95af48ba770e)
- [What's new in PowerPoint 2021 for Mac](https://support.microsoft.com/office/fcbbd1ee-a94a-42a6-910e-df9cab3a1bf6)
- [What's new in Word 2021 for Mac](https://support.microsoft.com/office/ee054758-cf8d-4fb9-ba07-e105414459d5)

#### Office 2019 for Mac features

For information about the new features in Office 2019 for Mac, refer to the following articles:
- [What's new in Excel 2019 for Mac](https://support.microsoft.com/office/5ce129d3-9e5c-417f-9545-fb6f7b72674d)
- [What's new in Outlook 2019 for Mac](https://support.microsoft.com/office/05736033-f99e-4cb2-88aa-01e979b0736b)
- [What's new in PowerPoint 2019 for Mac](https://support.microsoft.com/office/5038ba79-48c5-40f0-adff-11489e5d6fed)
- [What's new in Word 2019 for Mac](https://support.microsoft.com/office/247e0cd4-a758-4b42-a157-42eb8853aef5)

## Privacy controls

There are preference settings available that allow you to configure settings related to diagnostic data and connected experiences for Office on a Mac. For more information, refer to [Use preferences to manage privacy controls for Office for Mac](../privacy/mac-privacy-preferences.md).

## App bundles

The app bundle for each app, such as Word, includes all the resources needed to run the app. There aren't any shared resources among the apps. For example, the app bundles for Excel for Mac and Word for Mac both contain the font resources needed by the app.

## Customizations

To help improve security, Office for Mac has implemented Apple app sandboxing guidelines. This means that you can't customize the app bundle before or after you deploy Office. Don't add, change, or remove files in an app bundle. For example, even if you don't need the French language resource files for Excel, don't delete them. This change prevents Excel from starting. But, you can still [configure preferences](deploy-preferences-for-office-for-mac.md) for each app.

## App icons

When you deploy Office on a Mac, the app icons aren't automatically added to the dock, but are available from Launchpad. You can provide your users with instructions on [how to add app icons to the dock](https://support.microsoft.com/office/95db1c14-45e7-450e-86ad-1134f7e80851).

## Version numbers

The major version of Office for Mac, Office LTSC for Mac 2021, and Office 2019 for Mac is 16.x. Since the major version is the same, application settings, including policies, preferences, and preference domains are similar for the three versions of Office for the Mac.

Also, add-ins and other extensibility solutions that were compatible with an older version will most likely be compatible with a newer version or will require minimal testing. For example, when upgrading from Office 2019 for Mac to Office LTSC for Mac 2021.

Office LTSC for Mac 2021 has version numbers of 16.53 or higher. Office 2019 for Mac has version numbers of 16.17 or higher.
