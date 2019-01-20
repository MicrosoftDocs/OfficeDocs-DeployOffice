---
title: "Deploy Office for Mac from the Mac App Store"
ms.author: danbrown
author: pbowden-msft
manager: laurawi
ms.audience: ITPro
ms.topic: get-started-article
ms.service: o365-proplus-itpro
localization_priority: Normal
ms.collection: Ent_O365
ms.custom: Ent_Office_Mac
description: "Provides information to admins on how to download and deploy Office for Mac from the Mac App Store"
---

# Deploy Office for Mac from the Mac App Store

***Applies to:*** *Office for Mac*

This article is for IT admins and covers frequently asked questions about the availability of Office from the Mac App Store, and the differences between downloading and distributing Office apps directly from Microsoft.

Starting in January 2019, the following Office applications are available for download from the Mac App Store:
- Microsoft Word
- Microsoft Excel
- Microsoft PowerPoint
- Microsoft Outlook
- Microsoft OneNote*
- Microsoft OneDrive*

\* these apps were also available from the Mac App Store in previous years.

### What version of Office is available from the Mac App Store?
The Office apps available from the Mac App Store provide the very latest version of Office on the Mac. Word, Excel, PowerPoint, and Outlook require an Office 365 subscription to activate. OneNote and OneDrive do not require an Office 365 subscription, but some premium features may require an Office 365 subscription. All apps are compatible with Office 365 subscriptions such as A3, A5, E3, E5, and ProPlus.

NOTE: Some Office 365 subscriptions such as A1, E1, and F1 do not include access to downloadable Office apps. Click [here](https://products.office.com/en-us/business/compare-more-office-365-for-business-plans) for more information about different Office 365 plans.

### Can I use apps from the Mac App Store with my Volume License?
No. Perpetual licenses, including Office 2019 and Office 2016 are not supported with Office apps available from the Mac App Store. The [VL Serializer](volume-license-serializer.md) is not compatible with these apps. Attempts to use a perpetual license with Mac App Store apps will cause the apps to enter [reduced functionality mode](https://go.microsoft.com/fwlink/?linkid=2060681).

### How do I deploy Office apps from the Mac App Store to computers in my organization?
You need an Enterprise Mobility and Management (EMM) tool that supports either [Apple's Volume Purchase Program (VPP)](https://volume.itunes.apple.com/), [Apple Business Manager](https://www.apple.com/business/it/) or [Apple School Manager](https://www.apple.com/education/it/). For example, [Jamf Pro](https://www.jamf.com/) is compatible with these programs and can be used to deploy Office apps. Office supports managed distribution - this allows your Mobile Device Management (MDM) server to install Office even when the user does not have an Apple ID. Office apps cannot be distributed through redeemable codes.

While a consumer may acquire Office through the Mac App Store as a bundle with a single-click download, IT admins will need to deploy the individual apps.

### When deployed through the Mac App Store, does Office behave differently, or provide less functionality?
Word, Excel, PowerPoint, Outlook and OneNote provide the same end-user functionality regardless of how it was deployed. IT admins have traditionally deployed Office from Microsoft's Content Delivery Network (CDN), but now have the option of deploying from the Mac App Store. The OneDrive app offers more functionality, such as [files on demand](https://support.office.com/article/try-files-on-demand-for-mac-529f6d53-e572-4922-a585-e7a318c135f0) when deployed through the Microsoft CDN.

The Office builds available from the Mac App Store are production builds, and are updated on a monthly basis. The [Office Insider](https://insider.office.com/) program is not supported through the Mac App Store.

Microsoft Teams and Skype for Business is not available through the Mac App Store, and must continued to be deployed from the Microsoft CDN.

### How do Office updates occur?
When Office apps are deployed through the Mac App Store, it is the sole responsibility of the App Store to keep those apps up-to-date. Conversely, apps deployed from Microsoft's CDN are updated through the Microsoft AutoUpdate (MAU) tool. [Content caching](https://support.apple.com/guide/mac-help/about-content-caching-on-mac-mchl9388ba1b/mac) services in macOS can be used (and is highly recommended) to optimize both the installation and update process of Office apps.

The size of monthly update packages is the same, regardless of whether the CDN or Mac App Store is used for deployment.

### Can I convert an existing CDN-based Office installation to Mac App Store?
If a user launches the App Store app on their Mac, they may see that Office apps are available for download even though Office is already installed from the Microsoft CDN. Depending upon the currently installed Office build, and the build available in the Mac App Store, the existing app may or may not get overwritten. For example, if the build of Office currently installed is newer than what is available from the Mac App Store (such as an Insider build), it will not be overwritten if the user chooses to download the Mac App Store build.

There is no automated process for performing a CDN to Mac App Store conversion. Depending on your EMM's capabilities, you may be able to orchestrate the process through a script. The high-level steps for each Mac are as follows:
- Close all Office apps
- Remove the Office apps from the /Applications folder
- Remove the Office entries from the keychain
- Remove the Office package registrations (`pkgutil --forget`)
- Trigger the MDM server to install the Office apps (such as `jamf recon`)

While CDN-based installations of Office can utilize the bandwidth-optimized suite installer, which is approximately 1.8 GB in size, the total size of the same apps when deployed through the Mac App Store is approximately 4 GB.

### How can I tell if an Office app was downloaded from the Mac App Store?
- Open Finder, and navigate to the Applications folder
- Locate the Office app (such as Microsoft Outlook.app), control-click, and choose 'Show Package Contents'
- Navigate into the 'Contents' folder
- If a folder named `_MASReceipt` is present, the app was downloaded from the Mac App Store

### How do I manage Office policies and preferences with apps downloaded from the Mac App Store?
Word, Excel, PowerPoint, Outlook and OneNote offer the same policies and preferences as their CDN-based counterparts. IT admins do not need to alter existing Configuration Profiles as the bundle ID for each app is unchanged.

NOTE: OneNote does use a different bundle ID, and different management controls are [available](https://docs.microsoft.com/en-us/onedrive/deploy-and-configure-on-macos) depending on how you obtain the app.

It is highly recommended that IT admins [set](preferences-outlook.md) the `OfficeAutoSignIn` value to `TRUE` in the `com.microsoft.office` preferences domain. For new installations from the Mac App Store, this preference will bypass the first run dialogs that ask users if they wish to purchase a new Office 365 subscription. This will mitigate calls to the help desk in commercial environments as users can only activate an existing subscription.
