---
title: "Overview of Office LTSC 2024 for Mac preview"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: conceptual
ms.service: office-perpetual-itpro
ms.localizationpriority: medium
ms.collection: Tier1
ROBOTS: NOINDEX, NOFOLLOW
recommendations: false
hideEdit: true
description: "Technical guidance for IT Pros about the preview version of Office LTSC 2024 for Mac"
ms.date: 07/08/2024
---

# Overview of Office LTSC 2024 for Mac preview

> [!NOTE]
> - This article is for a preview program and is subject to change.
> - This preview program is intended for organizations that expect to buy and deploy Office LTSC 2024 for Mac, the new volume licensed (perpetual) version of Office.
> - This preview program isn’t intended for organizations that have already purchased and deployed Office from a Microsoft 365 (or Office 365) plan.
> - This preview program isn't intended for home users of Office.

Office LTSC 2024 for Mac preview is available for you to install and test on devices running macOS in your organization. It includes Excel, OneNote, Outlook, PowerPoint, and Word.

For information about installing preview versions of Office on devices running Windows, see [Install Office LTSC preview](install-ltsc-preview.md).

## Install Office LTSC 2024 for Mac preview

To install Office LTSC 2024 for Mac preview, perform the following steps:

1. [Download the Office LTSC 2024 for Mac preview installer package file](https://go.microsoft.com/fwlink/p/?linkid=2245162) and install it on your device. Alternatively, if your device already has Office 2021 for Mac, update it to version 16.84 or later.
2. [Download the Volume License (VL) Serializer package file](https://go.microsoft.com/fwlink/?linkid=2261988), which is named `Microsoft_Office_Preview_Serializer.pkg` and is approximately 9 MB in size.
3. Run the VL Serializer package file on the device to activate Office LTSC 2024 for Mac preview. Once activated, the **About** dialog for the app shows **Office LTSC Standard for Mac 2024 preview** as the license type.

Both the installer and VL Serializer package files follow the standard Apple PKG format. Therefore, you can use the same software distribution or mobile device management (MDM) tools that you normally use to deploy software to Mac users. For example, Jamf Pro or FileWave.

Updates for Office LTSC 2024 for Mac include security and nonsecurity updates that provide stability and performance improvements for Office, as needed. You can use Microsoft AutoUpdate to detect, download, and apply these updates.

## What changed in Office LTSC 2024 for Mac preview

Overall, there are no significant differences in how Office LTSC 2024 for Mac preview is installed and runs compared to Office 2021 for Mac.

However, it’s important to note that the Microsoft Teams app isn't preinstalled but is available for [download separately](https://www.microsoft.com/microsoft-teams/download-app).

## What stayed the same in Office LTSC 2024 for Mac preview

The major version of Office LTSC 2024 for Mac preview is 16.x, which is the same major version as Office 2021 for Mac. Having the same major version provides the following benefits when you’re upgrading from Office 2021 for Mac:

- Application settings including policies, preferences, and preference domains remain the same.
- Add-ins and other extensibility solutions that are compatible with Office 2021 for Mac will most likely be compatible with Office LTSC 2024 for Mac preview or will require only minimal testing.

## New features included in Office LTSC 2024 for Mac preview

Office LTSC 2024 for Mac builds upon the core functionalities of earlier versions, introducing several advancements to enhance productivity, security, and accessibility. This update includes new options for creating meetings and refined search capabilities in Outlook. Additionally, Excel receives a range of new features, such as Dynamic Charts and Arrays, marking significant improvements over the previous Office LTSC release.

<!--Using include for odf 1.4 support-->
[!INCLUDE [odf 1.4 support](../../includes/odf-1-4-support-office-ltsc-preview.md)]

While Office LTSC 2024 for Mac enhances various features, it doesn't include the AI and cloud-based functionalities available in Microsoft 365 Apps. As a result, users don't access to real-time collaboration, AI-driven automation in Excel, PowerPoint, and Word, or advanced security and compliance tools tailored for a hybrid work environment. 

Keep in mind that Office LTSC 2024 for Mac also won't receive any new features after its release. If you want to get new Office features on an ongoing basis, you should consider moving to a Microsoft 365 plan that includes Office. Many business and enterprise plans include Microsoft 365 Apps. These plans also provide you with Office for Mac, which includes the same Office apps as Office LTSC 2024 for Mac. 

For more information, see [Compare Microsoft 365 enterprise plans](https://www.microsoft.com/microsoft-365/compare-microsoft-365-enterprise-plans), [Compare Office 365 enterprise plans](https://www.microsoft.com/microsoft-365/enterprise/compare-office-365-plans), and [Compare Microsoft 365 business plans](https://www.microsoft.com/microsoft-365/business/compare-all-microsoft-365-business-products).

## Additional information about Office LTSC 2024 for Mac preview

#### macOS requirements
Office LTSC 2024 for Mac preview is supported on the three most recent versions of macOS. As new major versions of macOS are made generally available, Microsoft stops support for the oldest version and support the newest and previous two versions of macOS. Product functionality and feature availability could vary on older systems.

#### Memory and disk space
The device on which you’re installing Office LTSC 2024 for Mac preview should have at least 4 GB of memory and at least 10 GB of available disk space.

#### Chipset support
Office LTSC 2024 for Mac preview provides native support for both Apple Silicon and Intel-based Macs. For more information, see [Microsoft 365, Office 2021, and Office 2019 support for Apple Silicon](https://support.microsoft.com/office/c55b603e-14a6-4b69-bdc0-2bb4c9a36834).

#### Internet access
After downloading the installer package, internet access isn’t required to install, activate, or use Office LTSC 2024 for Mac preview.

#### Side-by-side installation
Office LTSC 2024 for Mac preview can't be installed side-by-side on the same device with Office 2021 for Mac. If Office 2021 for Mac is already installed, it's replaced with Office LTSC 2024 for Mac preview.

#### Reverting to Office 2021 for Mac
To go back to using Office 2021 for Mac on the device, perform the following steps:
1. Close all Office apps.
2. Delete /Library/Preferences/com.microsoft.office.licensingV2.plist
3. Run the VL Serializer for Office 2021 for Mac Standard. For more information, see [Overview of the Volume License (VL) Serializer](../mac/volume-license-serializer.md).

## Getting support and providing feedback

Microsoft support isn’t available for the preview program.

Use the Office LTSC 2024 for Mac preview for testing purposes only. For example, to familiarize yourself with deploying the preview and using the new features in the Office apps. The Office LTSC preview shouldn’t be used in your normal production environment or on a production device.

If you want to provide feedback about an Office app or feature, go to **File**, and choose **Feedback** in that app.

If you have questions about Office LTSC preview or want to provide feedback, go to the [Microsoft 365 and Office forum for business customers](https://answers.microsoft.com/lang/msoffice/forum/msoffice_OfB) on Microsoft Community.
