---
title: "Overview of Office LTSC 2024 for Mac Preview"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: conceptual
ms.service: office-perpetual-itpro
ms.localizationpriority: medium
ms.collection: Tier1
recommendations: false
description: "Technical guidance for IT Pros about the preview version of Office LTSC 2024 for Mac"
ms.date: 04/18/2024
---

# Overview of Office LTSC 2024 for Mac Preview

> [!NOTE]
> - This article is for a preview program and is subject to change.
> - This preview program is intended for organizations that expect to buy and deploy Office LTSC 2024 for Mac, the new volume licensed (perpetual) version of Office.
> - This preview program isn’t intended for organizations that have already purchased and deployed Office from a Microsoft 365 (or Office 365) plan.
> - This preview program isn't intended for home users of Office.

Office LTSC 2024 for Mac Preview is available for you to install and test on devices running macOS in your organization. It includes Excel, OneNote, Outlook, PowerPoint, and Word.

For information about installing preview versions of Office on devices running Windows, see [Install Office LTSC Preview](install-ltsc-preview.md).

## Install Office LTSC 2024 for Mac Preview

To install Office LTSC 2024 for Mac Preview, perform the following steps:

1. [Download the installer package file](https://go.microsoft.com/fwlink/?linkid=2261988) for Office LTSC 2024 for Mac Preview, and then install on the device. Or, if you have Office 2021 for Mac installed on the device, update to at least version 16.85.
2. [Download the Volume License (VL) Serializer package file](https://go.microsoft.com/fwlink/?linkid=2261988), which is named `Microsoft_Office_Preview_Serializer.pkg` and is approximately 9 MB in size.
3. Run the VL Serializer package file on the device to activate Office LTSC 2024 for Mac Preview. Once activated, the **About** dialog for the app will show **Office LTSC Standard for Mac 2024 Preview** as the license type.

Both the installer and VL Serializer package files follow the standard Apple PKG format. Therefore, you can use the same software distribution or mobile device management (MDM) tools that you normally use to deploy software to Mac users. For example, Jamf Pro or FileWave.

Office LTSC 2024 for Mac Preview will be updated approximately once a month during the preview program. These updates will include, as needed, security updates and non-security updates, such as updates that provide stability or performance improvements for Office. You can use Microsoft AutoUpdate to detect, download, and apply these updates.

## What’s changed in Office LTSC 2024 for Mac Preview

Overall, there are no significant differences in how Office LTSC 2024 for Mac Preview is installed and runs compared to Office 2021 for Mac.

There are two things that might be of interest to organizations:

- The VL Serializer has been improved so that a management tool can run the VL Serializer in the background even while the user still has Office 2021 for Mac apps open and running. The next time the user closes and opens the app, Office will switch over to using the Office LTSC 2024 for Mac license. This should help minimize user disruption when organizations move from Office 2021 for Mac to Office LTSC 2024 for Mac.
- Several more Office Add-ins JavaScript APIs are available with Office LTSC 2024 for Mac Preview. For more information, see [Office Add-ins](../ltsc2024/overview.md#office-add-ins).

## What’s stayed the same in Office LTSC 2024 for Mac Preview

The major version of Office LTSC 2024 for Mac Preview is 16.x, which is the same major version as Office 2021 for Mac. Having the same major version provides the following benefits when you’re upgrading from Office 2021 for Mac:

- Application settings including policies, preferences, and preference domains remain the same.
- Add-ins and other extensibility solutions that are compatible with Office 2021 for Mac will most likely be compatible with Office LTSC 2024 for Mac Preview or will require only minimal testing.

Office LTSC 2024 for Mac Preview and Office 2021 for Mac share the same version and build numbers for their releases. For example, Version 16.52 (21080801) for the release in August 2024. For a list of releases, see [Release history for Office for Mac](/officeupdates/update-history-office-for-mac#release-history-for-office-for-mac).

## New features included in Office LTSC 2024 for Mac Preview

Office LTSC 2024 builds upon the core functionalities of earlier versions, introducing several advancements to enhance productivity, security, and accessibility. This update includes new options for creating meetings and refined search capabilities in Outlook. Additionally, Excel receives a range of new features, such as Dynamic Charts and Arrays, marking significant improvements over the previous Office LTSC release.

While Office LTSC 2024 enhances various features, it doesn't include the AI and cloud-based functionalities available in Microsoft 365 Apps. Consequently, users won't have access to real-time collaboration, AI-driven automation in Excel, PowerPoint, and Word, or advanced security and compliance tools tailored for a hybrid work environment. 

Keep in mind that Office LTSC 2024 for Mac won’t receive any new features after it's released. If you want to get new Office features on an ongoing basis, you should consider moving to a Microsoft 365 plan that includes Office. Many business and enterprise plans include Microsoft 365 Apps. Those plans also provide you with Office for Mac, which includes the same Office apps as Office LTSC 2024 for Mac. For more information, see [Compare Microsoft 365 enterprise plans](https://www.microsoft.com/microsoft-365/compare-microsoft-365-enterprise-plans), [Compare Office 365 enterprise plans](https://www.microsoft.com/microsoft-365/enterprise/compare-office-365-plans), and [Compare Microsoft 365 business plans](https://www.microsoft.com/microsoft-365/business/compare-all-microsoft-365-business-products).

## Additional information about Office LTSC 2024 for Mac Preview

#### macOS requirements
Office LTSC 2024 for Mac Preview is supported on the three most recent versions of macOS. As new major versions of macOS are made generally available, Microsoft will stop support for the oldest version and support the newest and previous two versions of macOS. Product functionality and feature availability may vary on older systems.

#### Memory and disk space
The device on which you’re installing Office LTSC 2024 for Mac Preview should have at least 4 GB of memory and at least 10 GB of available disk space.

#### Chipset support
Office LTSC 2024 for Mac Preview provides native support for both Apple Silicon and Intel-based Macs. For more information, see [Microsoft 365 and Office 2019 support for Apple Silicon](https://support.microsoft.com/office/c55b603e-14a6-4b69-bdc0-2bb4c9a36834).

#### Internet access
After downloading the installer package, internet access isn’t required to install, activate, or use Office LTSC 2024 for Mac Preview.

#### Side-by-side installation
Office LTSC 2024 for Mac Preview can't be installed side-by-side on the same device with Office 2021 for Mac. If Office 2021 for Mac is already installed, it will be replaced with Office LTSC 2024 for Mac Preview.

#### Reverting to Office 2021 for Mac
To go back to using Office 2021 for Mac on the device, perform the following steps:
1. Close all Office apps.
2. Delete /Library/Preferences/com.microsoft.office.licensingV2.plist
3. Run the VL Serializer for Office 2021 for Mac Standard. For more information, see [Overview of the Volume License (VL) Serializer](../mac/volume-license-serializer.md).

## Getting support and providing feedback

Microsoft support isn’t available for the preview program.

Therefore, we recommend that you use Office LTSC 2024 for Mac Preview only for testing purposes. For example, to familiarize yourself with deploying Office LTSC 2024 for Mac Preview and using the new features in the Office apps. Office LTSC 2024 for Mac Preview shouldn’t be used in your normal production environment or on a production device.

If you want to provide feedback about an Office app or feature, go to **File > Feedback** in that app.

If you have questions about Office LTSC 2024 for Mac Preview or want to provide additional feedback, go to the [Office LTSC Commercial Preview forum](https://answers.microsoft.com/lang/msoffice/forum/msoffice_LTSC) on Microsoft Community.
