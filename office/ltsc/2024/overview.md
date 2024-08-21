---
title: "Overview of Office LTSC 2024"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: conceptual
ms.service: office-perpetual-itpro
ms.localizationpriority: medium
ms.collection: Tier1
recommendations: false
description: "Provides IT admins with an overview of deploying Office LTSC 2024."
ms.date: 09/16/2024
---

# Overview of Office LTSC 2024

Office LTSC 2024 is the most recent edition of Microsoft's productivity software, available to organizations through volume licensing agreements.

> [!IMPORTANT]
> Office LTSC 2024 is distinct from Office offered through Microsoft 365 plans. For instance, if your organization has already deployed Microsoft 365 Apps for enterprise, there's no need for Office LTSC 2024. Microsoft 365 Apps for enterprise includes all the features of Office LTSC 2024, plus many additional features not found in Office LTSC 2024.

Enterprise administrators can download and deploy Office LTSC 2024 to users within their organization. The following volume licensed Office products are available for devices running Windows:

- Office LTSC Professional Plus 2024
- Office LTSC Standard 2024
- Project Professional 2024
- Project Standard 2024
- Visio LTSC Professional 2024
- Visio LTSC Standard 2024
 
These Office products use Click-to-Run as the installation technology, rather than Windows Installer (MSI). However, activation methods, such as using Key Management Service (KMS), remain unchanged.

Office LTSC 2024 is supported on the following operating systems:

- Windows 11<sup>*</sup>
- Windows 10
- Windows 10 LTSC 2021
- Windows 10 LTSC 2019
- Windows Server 2022

<sup>*</sup> *For Arm-based devices, Windows 11 is the minimum supported version.*

To run Office LTSC 2024, your device should have at least a 1.1 GHz, 2-core processor, 4 GB of RAM, 4 GB of available disk space, and a display with a resolution of 1280 x 768 (64-bit Office required for 4K and higher).

For detailed system requirements, see [System requirements for Microsoft 365 and Office](https://www.microsoft.com/microsoft-365/microsoft-365-and-office-resources#areaheading-oce1c3).

For devices running macOS, Office LTSC Standard for Mac 2024 is available for volume licensed customers. For more information, see [Deployment guide for Office for Mac](/microsoft-365-apps/mac/deployment-guide-for-office-for-mac).

## What changed in Office LTSC 2024?

Office LTSC 2024 brings several key updates and improvements compared to previous Office versions. This section highlights the most significant changes to help you quickly understand what’s new.

> [!TIP]
> If you’re moving to Office LTSC 2024 from Office 2016, you should also review the changes documented in the [Overview of Office 2019 (for IT Pros)](../../2019/overview.md). The most significant difference between Office 2016 and Office LTSC 2024 is the shift in installation technology from Windows Installer (MSI) to Click-to-Run.

Office LTSC no longer includes Microsoft Publisher, as it's being [retired](https://support.microsoft.com/office/microsoft-publisher-will-no-longer-be-supported-after-october-2026-ee6302a2-4bc7-4841-babf-8e9be3acbfd7). Additionally, the Microsoft Teams app isn't preinstalled but is available for [download separately](https://www.microsoft.com/microsoft-teams/download-app#download-for-desktop).

> [!TIP]
> <!-- Add tip about moving to Office LTSC 2024 from previous versions (if any) -->

#### Privacy-related policy settings

<!-- Add new privacy-related policy settings available in Group Policy -->

> [!NOTE]
> <!-- Add note about additional policy settings (if necessary) -->

For more information, see [Use policy settings to manage privacy controls](/microsoft-365-apps/privacy/manage-privacy-controls). Even though the article isn’t specifically for Office LTSC 2024, the information covered in the article about how the policy settings work does apply to Office LTSC 2024.

#### Support duration

Office LTSC 2024, including Project and Visio, will receive five years of Mainstream Support. After this period, there will be no Extended Support for these products. For more information, see [Microsoft Lifecycle Policy](/lifecycle/).

#### Language support

<!-- Add new language support details for Office LTSC 2024 -->

> [!NOTE]
> <!-- Add note about language support in Project or Visio -->

#### OpenDocument format 1.4

<!--Using include for odf 1.4 support-->
[!INCLUDE [odf 1.4 support](../../includes/odf-1-4-support-office-ltsc-preview.md)]

#### Office Add-ins

<!-- Add details about new Office Add-ins that are available -->

#### Publish to Power BI in Excel

The Publish to Power BI feature has been removed from Excel. This change does not affect prior versions of on-premises Office.

Users are encouraged to transition to the Power BI service, which provides a more robust set of features, including the ability to import Excel workbooks from OneDrive and SharePoint document libraries for viewing in Power BI. Existing local workbooks can still be downloaded from Power BI workspaces, and Excel data models can be published as Power BI semantic models with scheduled refresh.

For more information about this transition and how to migrate your Excel workbooks, see [Migrating your Excel workbooks](deploy.md#migrating-your-excel-workbooks).


#### <!-- Add other new features here -->

<!-- Add details -->

#### <!-- Add other new features here -->

<!-- Add details -->

## What stayed the same in Office LTSC 2024?

<!-- Add details about what stayed the same in Office LTSC 2024 compared to previous versions -->

## What are the new features in Office LTSC 2024?

For information about the new features in Office LTSC 2024, see the following articles:

<!-- List articles about what's new in Office LTSC 2024 -->

Office LTSC 2024 includes only some, but not all, features that are available in versions of Office that come with a Microsoft 365 (or Office 365) plan.

> [!NOTE]
> Office LTSC no longer includes Microsoft Publisher as it has been [retired](https://support.microsoft.com/office/microsoft-publisher-will-no-longer-be-supported-after-october-2026-ee6302a2-4bc7-4841-babf-8e9be3acbfd7). Additionally, the Microsoft Teams app isn't preinstalled but is available for [download separately](https://www.microsoft.com/microsoft-teams/download-app#download-for-desktop).

## How do I upgrade to Office LTSC 2024?

<!-- Add details about upgrading to Office LTSC 2024 -->

For more information, see [Remove existing versions of Office before installing Office LTSC 2024](deploy.md#remove-existing-versions-of-office-before-installing-office-ltsc-2024).

## Additional information about Office LTSC 2024

<!-- Add additional information about Office LTSC 2024 -->

## Related articles

- [Deploy Office LTSC 2024](deploy.md)
- [Update Office LTSC 2024](update.md)
- [Overview of volume activation of Office](../../volume-license-activation/plan-volume-activation-of-office.md)
