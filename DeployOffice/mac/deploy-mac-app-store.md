---
title: "Deploy Office for Mac from the Mac App Store"
ms.author: geokri
author: pbowden-msft
manager: dougeby
audience: ITPro
ms.topic: conceptual
ms.service: o365-proplus-itpro
ms.subservice: office-mac
ms.localizationpriority: medium
ms.collection: Tier3
recommendations: false
description: "Provides information to admins on how to download and deploy Office for Mac from the Mac App Store"
ms.date: 03/01/2023
---

# Deploy Office for Mac from the Mac App Store

***Applies to:*** *Office for Mac*

This article is for IT administrators and discusses frequently asked questions about the availability of Office from the Mac App Store, and the differences between downloading and distributing Office apps directly from Microsoft.

Starting in January 2019, the following Office applications are available for download from the Mac App Store:
- Microsoft Word
- Microsoft Excel
- Microsoft PowerPoint
- Microsoft Outlook
- Microsoft OneNote*
- Microsoft OneDrive*

\* These apps were also available from the Mac App Store in previous years.

## What version of Office is available from the Mac App Store?
The Office apps available from the Mac App Store provide the latest Current Channel version of Office for Mac. Word, Excel, PowerPoint, and Outlook require a Microsoft 365 (or Office 365) subscription to activate. OneNote and OneDrive do not require a subscription, but some premium features may require a subscription. All apps are compatible with Microsoft 365 (and Office 365) subscription plans, such as Microsoft 365 E3, Microsoft 365 Business Premium, or Office 365 E5.

> [!NOTE]
> Some Microsoft 365 (and Office 365) subscriptions don't include access to downloadable Office apps. For example, the Office 365 E1 and Microsoft 365 Business Basic plans. For more information, see [Microsoft 365 plans for businesses](https://www.microsoft.com/microsoft-365/business/compare-all-microsoft-365-business-products), [Microsoft 365 plans for enterprises](https://www.microsoft.com/microsoft-365/compare-microsoft-365-enterprise-plans), and [Office 365 plans for enterprises](https://www.microsoft.com/microsoft-365/enterprise/compare-office-365-plans).

## Can I use apps from the Mac App Store with my volume license?
No. Perpetual licenses, such as Office LTSC for Mac 2021 or Office 2019, are not supported with Office apps available from the Mac App Store. The [Volume License (VL) Serializer](volume-license-serializer.md) is not compatible with these apps. Attempts to use a perpetual license with Mac App Store apps will cause the apps to enter reduced functionality mode. For more information, see [Microsoft Office activation and the Mac App Store](https://support.microsoft.com/office/a699bd24-a8f1-4f40-9d19-9b6b6034ec51).

## How do I deploy Office apps from the Mac App Store to devices in my organization?
You need an enterprise mobility management (EMM) tool that supports either [Apple Business Manager](https://www.apple.com/business/it/) or [Apple School Manager](https://www.apple.com/education/k12/it/). For example, [Jamf Pro](https://www.jamf.com/products/jamf-pro/) is compatible with these programs and can be used to deploy Office apps. Office supports managed distribution, which allows your Mobile Device Management (MDM) server to install Office even when the user does not have an Apple ID. Office apps cannot be distributed through redeemable codes.

While a consumer may acquire Office through the Mac App Store as a bundle with a single-click download, IT admins will need to deploy the individual apps.

## When deployed through the Mac App Store, does Office behave differently, or provide less functionality?
Word, Excel, PowerPoint, Outlook, and OneNote provide the same end-user functionality regardless of how it is deployed. IT admins have traditionally deployed Office from Microsoft's Content Delivery Network (CDN), but now have the option of deploying from the Mac App Store.

The OneDrive app, when acquired from Microsoft's CDN, offers IT admins more deployment flexibility such as pre-enabling icon overlays and system access. When acquired from the Mac App Store, users will see additional prompts to enable this functionality.

The Office builds available from the Mac App Store are Current Channel builds and are usually updated on a monthly basis. The [Microsoft 365 Insider](../insider/index.yml) program is not supported through the Mac App Store. If you wish to use Current Channel (Preview) or Beta Channel, you should continue to install Office apps from the Microsoft CDN.

Microsoft Teams and Skype for Business are not available through the Mac App Store and must be deployed from the Microsoft CDN.

## How do Office updates occur?
When Office apps are deployed through the Mac App Store, it is the sole responsibility of the App Store to keep those apps up to date. Conversely, apps deployed from Microsoft's CDN are updated through the Microsoft AutoUpdate (MAU) tool. [Content caching](https://support.apple.com/guide/mac-help/about-content-caching-on-mac-mchl9388ba1b/mac) services in macOS can be used (and is highly recommended) to optimize both the installation and update process of Office apps acquired through the Mac App Store.

The download size of monthly update packages is the same, regardless of whether the CDN or Mac App Store is used for deployment.

## Can I convert an existing CDN-based Office installation to Mac App Store?
If a user launches the App Store app on their Mac, they may see that Office apps are available for download even though Office is already installed from Microsoft's CDN. Depending upon the currently installed Office build, and the build available in the Mac App Store, the existing app may or may not get overwritten. For example, if the build of Office currently installed is newer than what is available from the Mac App Store (such as an Insider build), it will not be overwritten if the user chooses to download the Mac App Store build.

There is no automated process for performing a CDN to Mac App Store conversion. Depending on your EMM's capabilities, you may be able to orchestrate the process through a script. The high-level steps for each Mac are as follows:
- Close all Office apps
- Remove the Office apps from the /Applications folder
- Remove the Office entries from the keychain
- Remove the Office package registrations (`pkgutil --forget`)
- Trigger the MDM server to install the Office apps (such as `jamf recon`)

While CDN-based installations of Office can utilize the bandwidth-optimized suite installer, which is approximately 1.8 GB in size, the total size of the same apps when deployed through the Mac App Store is approximately 4 GB.

## How can I tell if an Office app was downloaded from the Mac App Store?
- Open Finder, and navigate to the Applications folder
- Locate the Office app (such as Microsoft Outlook.app), control-click, and choose **Show Package Contents**
- Navigate into the **Contents** folder
- If a folder named `_MASReceipt` is present, the app was downloaded from the Mac App Store

## How do I manage Office policies and preferences with apps downloaded from the Mac App Store?
Word, Excel, PowerPoint, Outlook, and OneNote offer the same policies and preferences as their CDN-based counterparts. IT admins do not need to alter existing Configuration Profiles as the bundle ID for each app is unchanged.

> [!NOTE]
> OneDrive does use a different bundle ID, and different management controls are available depending on how you obtain the app. For more information, see [Deploy and configure the new OneDrive sync client for Mac](/onedrive/deploy-and-configure-on-macos).

It is highly recommended that IT admins set the [OfficeAutoSignIn](preferences-outlook.md#automatically-configure-microsoft-365-mailbox-on-first-launch) value to `TRUE` in the `com.microsoft.office` preferences domain. For new installations from the Mac App Store, this preference will bypass the first run dialogs that ask users if they wish to purchase a new Microsoft 365 (or Office 365) subscription. This will mitigate calls to the help desk in commercial environments as users can only activate an existing subscription.