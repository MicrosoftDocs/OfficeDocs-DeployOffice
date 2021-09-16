---
title: "Overview of Office LTSC for Mac 2021 (Preview)"
ms.author: danbrown
author: DHB-MSFT
manager: dougeby
audience: ITPro
ms.topic: article
ms.prod: office-perpetual-itpro
ms.localizationpriority: medium
ms.collection: Ent_O365
ms.custom: 
- Ent_Office_VL
- Ent_Office_Mac
- OfficeLTSC2021
ROBOTS: NOINDEX, NOFOLLOW
recommendations: false
description: "Technical guidance for IT Pros about the preview version of Office LTSC for Mac 2021"
---

# Overview of Office LTSC for Mac 2021 (Preview)

> [!IMPORTANT]
> - Office LTSC for Mac 2021 is generally available on the [Volume Licensing Service Center (VLSC)](https://www.microsoft.com/licensing/servicecenter/default.aspx) as of September 16, 2021.
> - For steps on how to update your preview installation to Office LTSC for Mac 2021, see [Update Office LTSC 2021 Preview to Office LTSC 2021](update-from-preview.md).

> [!NOTE]
> - This article is for a preview program and is subject to change. The preview expires on January 17, 2022.
>
> - This preview program is intended for organizations that expect to buy and deploy Office LTSC for Mac 2021, the new volume licensed (perpetual) version of Office.
>
> - This preview program isn’t intended for organizations that have already purchased and deployed Office from a Microsoft 365 (or Office 365) plan.
>
> - This preview program isn't intended for home users of Office.

Office LTSC Standard for Mac 2021 (Preview) is available for you to install and test on devices running macOS in your organization. It includes Word, Excel, PowerPoint, Outlook, OneNote, OneDrive, and Teams.

For information about installing preview versions of Office on devices running Windows, see [Install Office LTSC Preview](install-ltsc-preview.md).

## Install Office LTSC for Mac 2021 (Preview)

To install Office LTSC for Mac 2021 (Preview), perform the following steps:

1. [Download the installer package file](https://go.microsoft.com/fwlink/p/?linkid=2159127) for Office LTSC for Mac 2021 (Preview), and then install on the device. Or, if you have Office 2019 for Mac installed on the device, update your existing installation to at least Version 16.48.
2. [Download the Volume License (VL) Serializer package file](https://go.microsoft.com/fwlink/p/?linkid=2147058), which is named Microsoft_Office_2021_Preview_VL_Serializer.pkg and is approximately 13 MB in size.
3. Run the VL Serializer package file on the device to activate Office LTSC for Mac 2021 (Preview). Once activated, the **About** dialog for the app will show **Preview 2021** as the license type.

Both the installer and VL Serializer package files follow the standard Apple PKG format. Therefore, you can use the same software distribution or mobile device management (MDM) tools that you normally use to deploy software to Mac users. For example, Jamf Pro or FileWave.

Office LTSC for Mac 2021 (Preview) will be updated approximately once a month during the preview program. These updates will include, as needed, security updates and non-security updates, such as updates that provide stability or performance improvements for Office. You can use Microsoft AutoUpdate to detect, download, and apply these updates.

> [!IMPORTANT]
> - Office LTSC for Mac 2021 (Preview) uses a special activation key that expires on January 17, 2022.
>
> - After that date, Office LTSC for Mac 2021 (Preview) will go into reduced functionality mode, which means you’ll only be able to read and print documents in the Office apps. You won’t be able to create new documents or edit existing documents using Office LTSC for Mac 2021 (Preview).
>
> - In Outlook, you’ll be able to read existing items that have been synchronized to your mailbox, but Outlook won’t be able to connect to your email server and synchronize more items.

## What’s changed in Office LTSC for Mac 2021 (Preview)

Overall, there are no significant differences in how Office LTSC for Mac 2021 (Preview) is installed and runs compared to Office 2019 for Mac.

There are two things that might be of interest to organizations:

- The VL Serializer has been improved so that a management tool can run the VL Serializer in the background even while the user still has Office 2019 for Mac apps open and running. The next time the user closes and opens the app, Office will switch over to using the Office LTSC for Mac 2021 license. This should help minimize user disruption when organizations move from Office 2019 for Mac to Office LTSC for Mac 2021.

- Several more Office Add-ins JavaScript APIs are available with Office LTSC for Mac 2021 (Preview). For more information, see [Office Add-ins](overview.md#office-add-ins).

## What’s stayed the same in Office LTSC for Mac 2021 (Preview)

The major version of Office LTSC for Mac 2021 (Preview) is 16.x, which is the same major version as Office 2019 for Mac. Having the same major version provides the following benefits when you’re upgrading from Office 2019 for Mac:

- Application settings including policies, preferences, and preference domains remain the same.
- Add-ins and other extensibility solutions that are compatible with Office 2019 for Mac will most likely be compatible with Office LTSC for Mac 2021 (Preview) or will require only minimal testing.

Office LTSC for Mac 2021 (Preview) and Office 2019 for Mac share the same version and build numbers for their releases. For example, Version 16.52 (21080801) for the release in August 2021. For a list of releases, see [Release history for Office for Mac](/officeupdates/update-history-office-for-mac#release-history-for-office-for-mac).

## New features included in Office LTSC for Mac 2021 (Preview)

For information about the new features in Office LTSC for Mac 2021, see the following articles:
- [What's new in Excel 2021 for Mac](https://support.microsoft.com/office/4100753f-93bc-4143-a77c-7258d1a80cd3)
- [What's new in Outlook 2021 for Mac](https://support.microsoft.com/office/cac45ed4-3f1c-490e-a76d-95af48ba770e)
- [What's new in PowerPoint 2021 for Mac](https://support.microsoft.com/office/fcbbd1ee-a94a-42a6-910e-df9cab3a1bf6)
- [What's new in Word 2021 for Mac](https://support.microsoft.com/office/ee054758-cf8d-4fb9-ba07-e105414459d5)

Keep in mind that after Office LTSC for Mac 2021 won’t receive any new features now that it's been released. If you want to get new Office features on an on-going basis, you should consider moving to a Microsoft 365 (or Office 365) plan that includes Office. Many business and enterprise plans include Microsoft 365 Apps. Those plans also provide you with Office for Mac, which includes the same Office apps as Office LTSC Standard for Mac 2021. For more information, see [Compare Microsoft 365 enterprise plans](https://www.microsoft.com/microsoft-365/compare-microsoft-365-enterprise-plans), [Compare Office 365 enterprise plans](https://www.microsoft.com/microsoft-365/enterprise/compare-office-365-plans), and [Compare Microsoft 365 business plans](https://www.microsoft.com/microsoft-365/business/compare-all-microsoft-365-business-products).

## Additional information about Office LTSC for Mac 2021 (Preview)

#### macOS requirements
Office LTSC for Mac 2021 (Preview) is supported on the three most recent versions of macOS. As new major versions of macOS are made generally available, Microsoft will stop support for the oldest version and support the newest and previous two versions of macOS. Product functionality and feature availability may vary on older systems.

#### Memory and disk space 
The device on which you’re installing Office LTSC for Mac 2021 (Preview) should have at least 4 GB of memory and at least 10 GB of available disk space.

#### Chipset support
Office LTSC for Mac 2021 (Preview) provides native support for both Apple Silicon and Intel-based Macs. For more information, see [Microsoft 365 and Office 2019 support for Apple Silicon](https://support.microsoft.com/office/c55b603e-14a6-4b69-bdc0-2bb4c9a36834).

#### Internet access
After downloading the installer package, internet access isn’t required to install, activate, or use Office LTSC for Mac 2021 (Preview).

#### Side-by-side installation
Office LTSC for Mac 2021 (Preview) can't be installed side-by-side on the same device with Office 2019 for Mac. If Office 2019 for Mac is already installed, it will be replaced with Office LTSC for Mac 2021 (Preview).

#### Reverting to Office 2019 for Mac
To go back to using Office 2019 for Mac on the device, perform the following steps:
1. Close all Office apps.
2. Delete /Library/Preferences/com.microsoft.office.licensingV2.plist
3. Run the VL Serializer for Office 2019 for Mac Standard. For more information, see [Overview of the Volume License (VL) Serializer](../mac/volume-license-serializer.md).

## Getting support and providing feedback

Microsoft support isn’t available for the preview program.

Therefore, we recommend that you use Office LTSC for Mac 2021 (Preview) only for testing purposes. For example, to familiarize yourself with deploying Office LTSC for Mac 2021 (Preview) and using the new features in the Office apps. Office LTSC for Mac 2021 (Preview) shouldn’t be used in your normal production environment or on a production device.

If you want to provide feedback about an Office app or feature, go to **File** > **Feedback** in that app.

If you have questions about Office LTSC for Mac 2021 (Preview) or want to provide additional feedback, go to the [Office LTSC Commercial Preview forum](https://answers.microsoft.com/lang/msoffice/forum/msoffice_LTSC) on Microsoft Community.