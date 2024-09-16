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

Office Long Term Service Channel (LTSC) 2024 is the most recent on-premises edition of Microsoft's core productivity apps, designed for use in disconnected or restricted environments. It's available to organizations through volume licensing agreements

> [!IMPORTANT]
> Office LTSC 2024 is different from the Office version offered through Microsoft 365 plans, called Microsoft 365 Apps. Because it's designed for disconnected environments, Office LTSC does not include any cloud-backed features. It also does not receive any feature updates after launch. If your organization has already deployed Microsoft 365 Apps for enterprise or Microsoft 365 Apps for business, there's no need for Office LTSC 2024. Microsoft 365 Apps includes all the features of Office LTSC 2024, plus many additional features not found in Office LTSC 2024.

Enterprise administrators can download and deploy Office LTSC 2024 to users within their organization. The following volume licensed Office products are available for devices running Windows:

- Office LTSC Professional Plus 2024
- Office LTSC Standard 2024
- Project Professional 2024
- Project Standard 2024
- Visio LTSC Professional 2024
- Visio LTSC Standard 2024

## Minimum system requirements

Office LTSC 2024 is supported on the following operating systems:

- Windows 11<sup>*</sup>
- Windows 10
- Windows 10 LTSC 2021
- Windows 10 LTSC 2019
- Windows Server 2022

<sup>*</sup> *For Arm-based devices, Windows 11 is the minimum supported version.*

Your device needs at least a 1.1 GHz, two-core processor, 4 GB of RAM, 4 GB of available disk space, and a display with a resolution of 1280 x 768 to run Office LTSC 2024. 
A 64-bit version of Office is required for 4K and higher resolutions.

For detailed system requirements, see [System requirements for Microsoft 365 and Office](https://www.microsoft.com/microsoft-365/microsoft-365-and-office-resources#areaheading-oce1c3).

For devices running macOS, Office LTSC Standard for Mac 2024 is available for volume licensed customers. For more information, see [Deployment guide for Office for Mac](/microsoft-365-apps/mac/deployment-guide-for-office-for-mac).

## Support duration

Office LTSC 2024, including Project and Visio, receive five years of Mainstream Support. After this period, there will be no Extended Support for these products. For more information, see [Fixed Lifecycle Policy](/lifecycle/policies/fixed).

## What changed in Office LTSC 2024?

Office LTSC 2024 brings several key updates and improvements compared to previous Office versions. This section highlights the most significant changes to help you quickly understand what’s new.

> [!TIP]
> If you’re moving to Office LTSC 2024 from Office 2016, you should also review the changes documented in the [Overview of Office 2019 (for IT Pros)](../../2019/overview.md). The most significant difference between Office 2016 and Office LTSC 2024 is the shift in installation technology from Windows Installer (MSI) to Click-to-Run.

#### OpenDocument format 1.4

<!--Using include for odf 1.4 support-->
[!INCLUDE [odf 1.4 support](../../includes/odf-1-4-support-office-ltsc-preview.md)]

#### Office Add-ins

More Office Add-ins JavaScript APIs are available with Office LTSC 2024, including these requirement sets.

- Product requirement sets:
   - Excel: Up to [1.17](/javascript/api/requirement-sets/excel/excel-api-1-17-requirement-set)
   - Outlook: Up to [1.14](/javascript/api/requirement-sets/outlook/requirement-set-1.14/outlook-requirement-set-1.14)
   - PowerPoint: Up to [1.5](/javascript/api/requirement-sets/powerpoint/powerpoint-api-1-5-requirement-set)

- Common API requirement sets:
   - [CustomFunctionsRuntime 1.3](/javascript/api/requirement-sets/excel/custom-functions-requirement-sets) (Excel)
   - [DialogApi 1.2](/javascript/api/requirement-sets/common/dialog-api-requirement-sets) (Excel, PowerPoint, Word)
   - [IdentityAPI 1.3](/javascript/api/requirement-sets/common/identity-api-requirement-sets) (Excel, Outlook, PowerPoint, Word)
   - [ImageCoercion 1.2](/javascript/api/requirement-sets/common/image-coercion-requirement-sets) (Excel, PowerPoint, Word)
   - [OpenBrowserWindowApi 1.1](/javascript/api/requirement-sets/common/open-browser-window-api-requirement-sets) (Excel, Outlook, PowerPoint, Word)
   - [RibbonApi 1.1](/javascript/api/requirement-sets/common/ribbon-api-requirement-sets) (Excel)
   - [SharedRuntime 1.1](/javascript/api/requirement-sets/common/shared-runtime-requirement-sets) (Excel)

#### Publish to Power BI in Excel

The Publish to Power BI feature is removed from Excel. This change doesn't affect prior versions of on-premises Office.

Move to the Power BI service for a more robust set of features, such as importing Excel workbooks from OneDrive and SharePoint document libraries to view in Power BI. Existing local workbooks can still be downloaded from Power BI workspaces, and Excel data models can be published as Power BI semantic models with scheduled refresh.

#### Microsoft Publisher

<!--Using include for publisher-deprecation-->
[!INCLUDE[publisher-deprecation.md](../../includes/publisher-deprecation.md)]

#### Microsoft Teams

<!--Using include for teams-not-included-->
[!INCLUDE[teams-not-included-ltsc.md](../../includes/teams-not-included-ltsc.md)]

#### ActiveX

In Office LTSC 2024, ActiveX controls are disabled by default. However, IT administrators can re-enable ActiveX where necessary.

## What stayed the same in Office LTSC 2024?

Continue using the same software distribution tools, such as Microsoft Configuration Manager, to deploy and update Office LTSC 2024 as you do for volume licensed versions of Office LTSC 2021 or Office 2019.

The activation process for volume licensed versions of Office remains unchanged. You can still use Key Management Service (KMS) or Multiple Activation Key (MAK) to activate Office. For more information, see [Overview of volume activation of Office](../../volume-license-activation/plan-volume-activation-of-office.md).

The major version of Office LTSC 2024 is 16.0, the same as Office LTSC 2021 and volume licensed versions of Office 2019 and Office 2016. This consistency in the major version provides several benefits when upgrading from earlier versions:

- Existing Group Policy settings remain functional, as they continue to be stored in the following registry locations:
   - HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Office\16.0
   - HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft\Office\16.0
- Other registry locations and settings that reference 16.0 still apply.
- Add-ins and other extensibility solutions compatible with Office LTSC 2021 or Office 2019 are likely to work with Office LTSC 2024, requiring minimal testing.

## What are the new features in Office LTSC 2024?

> [!NOTE]
> While Office LTSC 2024 provides valuable enhancements for customers who need to keep their Office apps on-premises, it doesn't include new features and functionality that's available in Microsoft 365 Apps. As a result, users don't have access to real-time collaboration, AI-driven automation, or advanced security and compliance tools tailored for a hybrid work environment.

Keep in mind that Office LTSC 2024 doesn't receive any new features. If you want to get new Office features on an ongoing basis, you should consider moving to a Microsoft 365 plan. Many business and enterprise plans include Microsoft 365 Apps. These plans also provide you with Microsoft 365, which includes the same apps as Office LTSC 2024. For more information, see [Compare Microsoft 365 enterprise plans](https://www.microsoft.com/microsoft-365/compare-microsoft-365-enterprise-plans), [Compare Office 365 enterprise plans](https://www.microsoft.com/microsoft-365/enterprise/compare-office-365-plans), and [Compare Microsoft 365 business plans](https://www.microsoft.com/microsoft-365/business/compare-all-microsoft-365-business-products).

To continue receiving ongoing feature updates for the desktop versions of Project and Visio, you should consider moving to a subscription plan. For more information on the available subscription options, see [Project Plan 3/Project Plan 5](https://www.microsoft.com/microsoft-365/project/compare-microsoft-project-management-software) and [Visio Plan 2](https://www.microsoft.com/microsoft-365/visio/microsoft-visio-plans-and-pricing-compare-visio-options).

## How do I upgrade to Office LTSC 2024?

Uninstall versions of Office before deploying Office LTSC 2024. Most Office products installed via Windows Installer (MSI), such as Office 2016, can be removed during the installation of Office LTSC 2024. For more information, see [Remove existing versions of Office before installing Office LTSC 2024](deploy.md#remove-existing-versions-of-office-before-installing-office-ltsc-2024).

## Additional information about Office LTSC 2024

- Office LTSC Professional Plus 2024 includes Access, Excel, OneNote, Outlook, PowerPoint, and Word. Skype for Business is available as an optional install during setup.
- Access isn't available for devices running macOS.
- Office LTSC 2024 includes the OneNote desktop app. For more information, see [Deployment guide for OneNote](/microsoft-365-apps/deploy/deployment-guide-onenote).
- Office LTSC 2024 is available in both 32-bit and 64-bit versions. We recommend 64-bit on devices with 4 GB or more of memory. However, you should assess application compatibility and other factors that might require the use of the 32-bit version. For more information, see [Choose between the 64-bit or 32-bit version of Office](https://support.microsoft.com/office/2dee7807-8f95-4d0c-b5fe-6c6f49b8d261).
- After you download the installation files, internet connectivity isn’t required to install Office LTSC 2024. Internet connectivity is required for MAK activation, but not for KMS activation. After activation, internet connectivity isn't required to use Office LTSC 2024.

## Related articles

- [Deploy Office LTSC 2024](deploy.md)
- [Update Office LTSC 2024](update.md)
- [Overview of volume activation of Office](../../volume-license-activation/plan-volume-activation-of-office.md)
