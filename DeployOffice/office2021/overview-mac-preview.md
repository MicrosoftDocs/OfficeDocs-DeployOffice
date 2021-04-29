---
title: "Overview of Office 2021 for Mac (Preview)"
ms.author: danbrown
author: DHB-MSFT
manager: laurawi
audience: ITPro
ms.topic: article
ms.prod: office-perpetual-itpro
localization_priority: Normal
ms.collection: Ent_O365
ms.custom: 
- Ent_Office_VL
- Ent_Office_Mac
ROBOTS: NOINDEX, NOFOLLOW
description: "Technical guidance for IT Pros about the preview version of Office 2021 for Mac"
---

# Overview of Office 2021 for Mac (Preview)

> [!IMPORTANT]
> - This is pre-release documentation for a preview program and is subject to change.
>
> - This preview program is intended for organizations that expect to buy and deploy the new volume licensed (perpetual) version of Office that is scheduled to be released later this year. This preview program isn’t intended for organizations that have already purchased and deployed Office from a Microsoft 365 (or Office 365) plan. 
>
> - This preview program isn't intended for home users of Office.

Microsoft is planning to release a new volume licensed version of Office later this year. A preview version is available now for you to install and test on devices running macOS in your organization.

Office 2021 Standard for Mac (Preview) includes Word, Excel, PowerPoint, Outlook, OneNote, OneDrive, and Teams. 

For information about the preview version of Office for devices running Windows, see [Overview of Office LTSC Preview](overview-ltsc-preview.md).

## Install Office 2021 for Mac (Preview)

To install Office 2021 for Mac (Preview), perform the following steps:

1. [Download the installer package file](https://go.microsoft.com/fwlink/p/?linkid=2159127) for Office 2021 for Mac (Preview), and then install on the device. Or, if you have Office 2019 for Mac installed on the device, update your existing installation to at least Version 16.48.
2. [Download the Volume License (VL) Serializer package file](https://go.microsoft.com/fwlink/p/?linkid=2147058), which is named Microsoft_Office_2021_Preview_VL_Serializer.pkg and is approximately 13 MB in size.
3.	Run the VL Serializer package file on the device to activate Office 2021 for Mac (Preview). Once activated, the **About** dialog for the app will show **Preview 2021** as the license type.

Both the installer and VL Serializer package files follow the standard Apple PKG format. Therefore, you can use the same software distribution or mobile device management (MDM) tools that you normally use to deploy software to Mac users. For example, Jamf Pro or FileWave.

Office 2021 for Mac (Preview) will be updated approximately once a month during the preview program. These updates will include, as needed, security updates and non-security updates, such as updates that provide stability or performance improvements for Office. You can use Microsoft AutoUpdate to detect, download, and apply these updates.

> [!IMPORTANT]
> - Office 2021 for Mac (Preview) uses a special activation key that expires on January 17, 2022.
> 
> - After that date, Office 2021 for Mac (Preview) will go into reduced functionality mode, which means you’ll only be able to read and print documents in the Office apps. You won’t be able to create new documents or edit existing documents using Office 2021 for Mac (Preview).     
>
> - In Outlook, you’ll be able to read existing items that have been synchronized to your mailbox, but Outlook won’t be able to connect to your email server and synchronize more items.

## What’s changed in Office 2021 for Mac (Preview)

Overall, there are no significant differences in how Office 2021 for Mac (Preview) is installed and runs compared to Office 2019 for Mac.

There are two things that might be of interest to organizations:

- The VL Serializer has been improved so that a management tool can run the VL Serializer in the background even while the user still has Office 2019 for Mac apps open and running. The next time the user closes and opens the app, Office will switch over to using the Office 2021 license. This should help minimize user disruption when organizations move from Office 2019 for Mac to Office 2021 for Mac.

- Several more Office Add-ins JavaScript APIs are available with Office 2021 for Mac (Preview). For more information, see [Office Add-ins JavaScript APIs](overview-ltsc-preview.md#office-add-ins-javascript-apis).

## What’s stayed the same in Office 2021 for Mac (Preview)

The major version of Office 2021 for Mac (Preview) is 16.x, which is the same major version as Office 2019 for Mac. Having the same major version provides the following benefits when you’re upgrading from Office 2019 for Mac:

- Application settings including policies, preferences, and preference domains remain the same.
- Add-ins and other extensibility solutions that are compatible with Office 2019 for Mac will most likely be compatible with Office 2021 for Mac (Preview) or will require only minimal testing.

Office 2021 for Mac (Preview) and Office 2019 for Mac will share the same version and build numbers for their releases. For example, Version 16.48 (21041102) for the release in April 2021. For a list of releases, see [Release history for Office for Mac](/officeupdates/update-history-office-for-mac#release-history-for-office-for-mac).

## New features included in Office 2021 for Mac (Preview)

The final list of the features that will be included in Office 2021 for Mac (Preview) isn’t available yet. More information about the features will be available closer to when Office 2021 for Mac is released later this year.

Here are a few examples of new features that are included in Office 2021 for Mac (Preview): 

- Line Focus, which removes distractions so that you can move through a Word document line by line.
- XLOOKUP function, to help you find things in a table or range by row in an Excel worksheet.
- Dynamic array support in Excel, including new functions that make use of dynamic arrays. 
- Record a slide show with narration in PowerPoint.

Keep in mind that after Office 2021 for Mac is released later this year, it won’t receive any new features. If you want to get new Office features on an on-going basis, you should consider moving to a Microsoft 365 (or Office 365) plan that includes Office. Many business and enterprise plans include Microsoft 365 Apps. Those plans also provide you with Office for Mac, which includes the same Office apps as Office 2021 Standard for Mac. For more information, see [Compare Microsoft 365 enterprise plans](https://www.microsoft.com/microsoft-365/compare-microsoft-365-enterprise-plans), [Compare Office 365 enterprise plans](https://www.microsoft.com/microsoft-365/enterprise/compare-office-365-plans), and [Compare Microsoft 365 business plans](https://www.microsoft.com/microsoft-365/business/compare-all-microsoft-365-business-products).

## Additional information about Office 2021 for Mac (Preview)

#### macOS requirements
Office 2021 for Mac (Preview) is supported on the three most recent versions of macOS. As new major versions of macOS are made generally available, Microsoft will stop support for the oldest version and support the newest and previous two versions of macOS. As of April 2021, the three supported versions are macOS Big Sur (11), macOS Catalina (10.15), and macOS Mojave (10.14). Product functionality and feature availability may vary on older systems. 

#### Memory and disk space 
The device on which you’re installing Office 2021 for Mac (Preview) should have at least 4 GB of memory and at least 10 GB of available disk space.

#### 64-bit version
Office 2021 for Mac (Preview) is only available as a 64-bit version.

#### Chipset support
Office 2021 for Mac (Preview) provides native support for both Apple Silicon and Intel-based Macs. For more information, see [Microsoft 365 and Office 2019 support for Apple Silicon](https://support.microsoft.com/office/c55b603e-14a6-4b69-bdc0-2bb4c9a36834).

#### Internet access
After downloading the installer package, internet access isn’t required to install, activate, or use Office 2021 for Mac (Preview).

#### Side-by-side installation
Office 2021 for Mac (Preview) can't be installed side-by-side on the same device with Office 2019 for Mac. If Office 2019 for Mac is already installed, it will be replaced with Office 2021 for Mac (Preview).

#### Reverting to Office 2019 for Mac
To go back to using Office 2019 for Mac on the device, perform the following steps:
1. Close all Office apps.
2. Delete /Library/Preferences/com.microsoft.office.licensingV2.plist
3. Run the VL Serializer for Office 2019 for Mac Standard. For more information, see [Overview of the Volume License (VL) Serializer](../mac/volume-license-serializer.md).

#### Updating to the released version
If you decide to purchase Office 2021 for Mac once it’s released, there will be a way that you can update Office 2021 for Mac (Preview) to Office 2021 for Mac without having to uninstall and reinstall. More details will be available closer to when Office 2021 for Mac is released later this year.


## Getting support and providing feedback

Since this is a preview program, Microsoft support isn’t available. 

Therefore, we recommend that you use Office 2021 for Mac (Preview) only for testing purposes. For example, to familiarize yourself with deploying Office 2021 for Mac (Preview) and using the new features in the Office apps. Office 2021 for Mac (Preview) shouldn’t be used in your normal production environment or on a production device. 

If you want to provide feedback about an Office app or feature, go to **File** > **Feedback** in that app.

If you have questions about Office 2021 for Mac (Preview) or want to provide additional feedback, go to the [Office LTSC Commercial Preview forum](https://answers.microsoft.com/lang/msoffice/forum/msoffice_LTSC) on Microsoft Community.

> [!NOTE]
> When Office 2021 Standard for Mac is released later this year, it will have five years of Mainstream Support. There won’t be any Extended Support available after the five years of Mainstream Support ends.

