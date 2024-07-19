---
title: "Overview of Office LTSC 2021"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: conceptual
ms.service: office-perpetual-itpro
ms.localizationpriority: medium
ms.collection: Tier2
recommendations: false
description: "Provides IT admins with an overview of deploying Office LTSC 2021."
ms.date: 03/29/2024
---

# Overview of Office LTSC 2021
 
Office LTSC 2021 is the latest version of Microsoft's productivity software that's available to organizations through a volume licensing agreement.

> [!IMPORTANT]
> Office LTSC 2021 is separate from Office that's available through Microsoft 365 (or Office 365) plans. For example, if you've deployed Microsoft 365 Apps for enterprise to the users in your organization, you don't need Office LTSC 2021. Microsoft 365 Apps for enterprise already has all the features that are included in Office LTSC 2021, along with many more features that aren't in Office LTSC 2021.
  
Office LTSC 2021 is available for enterprise admins to download and deploy to the users in their organization. The following volume licensed Office products are available for devices running Windows:

- Office LTSC Professional Plus 2021
- Office LTSC Standard 2021
- Project Professional 2021
- Project Standard 2021
- Visio LTSC Professional 2021
- Visio LTSC Standard 2021

These Office products use Click-to-Run, instead of Windows Installer (MSI), as the installation technology. But, how you activate these Office products – for example, by using Key Management Service (KMS) – remains the same.

Office LTSC 2021 is supported on devices running Windows 10 or Windows 11. For more information, see [System requirements for Microsoft 365 and Office](https://www.microsoft.com/microsoft-365/microsoft-365-and-office-resources).

For devices running macOS, Office LTSC Standard for Mac 2021 is available for volume licensed customers. For more information, see [Deployment guide for Office for Mac](../mac/deployment-guide-for-office-for-mac.md).

## What changed in Office LTSC 2021?

The following are changes in Office LTSC 2021 compared to the volume licensed version of Office 2019.

> [!TIP]
> If you’re moving to Office LTSC 2021 from Office 2016, you should also review the changes documented in [Overview of Office 2019 (for IT Pros)](../office/2019/overview.md). The most important difference between Office 2016 and Office LTSC 2021 is the change in the installation technology from Windows Installer (MSI) to Click-to-Run.

#### Privacy-related policy settings

The following policy settings are available when using Group Policy:

- Configure the level of client software diagnostic data sent by Office to Microsoft
- Allow the use of connected experiences in Office that analyze content
- Allow the use of connected experiences in Office that download online content
- Allow the use of connected experiences in Office

These policy settings are located under User Configuration\Policies\Administrative Templates\Microsoft Office 2016\Privacy\Trust Center in the Group Policy Management tool.

> [!NOTE]
> The “Allow the use of additional optional connected experiences in Office" policy setting is also available for Office LTSC 2021. But that's not considered a change because that policy setting is already available for volume licensed versions of Office 2019.

For more information, see [Use policy settings to manage privacy controls](../privacy/manage-privacy-controls.md). Even though the article isn’t specifically for Office LTSC 2021, the information covered in the article about how the policy settings work does apply to Office LTSC 2021.

#### Support duration

Office LTSC 2021, including Project and Visio, have five years of Mainstream Support. There won’t be any Extended Support available for these products after the five years of Mainstream Support ends. For more information, see [Microsoft Lifecycle Policy](/lifecycle/).

#### Microsoft Teams

> [!NOTE]
> Office LTSC 2021 no longer includes the Teams client app. Existing Office LTSC 2021 installations remain unaffected. 

Users with the Teams client app from their existing Office LTSC 2021 installation are prompted to sign in upon launching. Users with a Microsoft Entra account linked to Teams, Microsoft 365, or Office 365 can sign in using their licensed account. 

Users without an existing license for Teams are able to use the free or the Exploratory service for Microsoft Teams.
- The free version of Microsoft Teams is for users who don't have an existing Microsoft Entra account. For more information, see [Manage the free version of Microsoft Teams](/microsoftteams/manage-freemium).

- The Exploratory experience is for users in an organization who have existing Microsoft Entra accounts but aren't licensed for Teams. For more information, see [Manage the Microsoft Teams Exploratory license](/microsoftteams/teams-exploratory).

For more information about the Teams client app with Office LTSC 2021, see [Microsoft Teams in Office LTSC 2021](deploy.md#microsoft-teams-in-office-ltsc-2021).

#### Language support

Office LTSC 2021 adds support for the following three languages:

- English (United Kingdom), en-gb
- French (Canada), fr-ca
- Spanish (Mexico), es-mx

> [!NOTE]
> These languages aren't available in Project or Visio.

#### OpenDocument format 1.3

Word, Excel, and PowerPoint in Office LTSC 2021 include support for OpenDocument format (ODF) 1.3. For more information, see [Office apps now support OpenDocument format 1.3](https://insider.microsoft365.com/blog/office-apps-now-support-opendocument-format-odf-1-3).

#### Office Add-ins

Several more Office Add-ins JavaScript APIs are available with Office LTSC 2021. These include the following requirement sets.

- Product requirement sets:
   - Excel: Up to [1.12](/javascript/api/requirement-sets/excel/excel-api-1-12-requirement-set)
   - Outlook: Up to [1.9](/javascript/api/requirement-sets/outlook/requirement-set-1.9/outlook-requirement-set-1.9) on Windows, up to [1.8](/javascript/api/requirement-sets/outlook/requirement-set-1.8/outlook-requirement-set-1.8) on Mac
   - PowerPoint: Up to [1.2](/javascript/api/requirement-sets/powerpoint/powerpoint-api-1-2-requirement-set)

- Common API requirement sets:
   - [CustomFunctionsRuntime 1.3](/javascript/api/requirement-sets/excel/custom-functions-requirement-sets) (Excel)
   - [DialogApi 1.2](/javascript/api/requirement-sets/common/dialog-api-requirement-sets) (Excel, PowerPoint, Word)
   - [IdentityAPI 1.3](/javascript/api/requirement-sets/common/identity-api-requirement-sets) (Excel, Outlook, PowerPoint, Word)
   - [ImageCoercion 1.2](/javascript/api/requirement-sets/common/image-coercion-requirement-sets) (Excel, PowerPoint, Word)
   - [OpenBrowserWindowApi 1.1](/javascript/api/requirement-sets/common/open-browser-window-api-requirement-sets) (Excel, Outlook, PowerPoint, Word)
   - [RibbonApi 1.1](/javascript/api/requirement-sets/common/ribbon-api-requirement-sets) (Excel)
   - [SharedRuntime 1.1](/javascript/api/requirement-sets/common/shared-runtime-requirement-sets) (Excel)

Office Add-ins on Windows now use Microsoft Edge with WebView2. For more information, see [Browsers used by Office Add-ins](/office/dev/add-ins/concepts/browsers-used-by-office-web-add-ins).

#### Office Telemetry Dashboard

[Office Telemetry Dashboard](../compatibility/assess-office-compatibility.md) is no longer included with the installation of Office and isn't supported for Office LTSC 2021.

#### OneDrive (Groove) client

The OneDrive (Groove) client is no longer included with the installation of Office and isn't supported for Office LTSC 2021.

#### Power View in Excel

Power View isn't available for the version of Excel included with Office LTSC 2021. Power BI is the recommended tool for visual data exploration and reporting. For more information, see [Roadmap for Power View in Excel](https://support.microsoft.com/office/c1f0d0f7-adef-4f03-ae35-46d83294e96b).

## What stayed the same in Office LTSC 2021?

You can use the same software distribution tools, such as Microsoft Configuration Manager, to deploy and update Office LTSC 2021 that you currently use to deploy and update volume licensed versions of Office 2019.

Also, how you activate volume licensed versions of Office remains the same. For example, by using Key Management Service (KMS) or Multiple Activation Key (MAK). For more information, see [Overview of volume activation of Office](../volume-license-activation/plan-volume-activation-of-office.md).

The major version of Office LTSC 2021 is 16.0, which is the same major version as volume licensed versions of Office 2019 (and Office 2016). Having the same major version provides the following benefits when you’re upgrading from Office 2019:

- Existing Group Policy settings continue to work, because those settings are still saved in the following registry locations:
   - HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Office\16.0
   - HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft\Office\16.0
- Other registry locations and settings information that reference 16.0 still apply.
- Add-ins and other extensibility solutions that are compatible with volume licensed versions of Office 2019 will most likely be compatible with Office LTSC 2021 or will require only minimal testing.


## What are the new features in Office LTSC 2021?

For information about the new features in Office LTSC 2021, see the following articles:

- [What's new in Office 2021](https://support.microsoft.com/office/43848c29-665d-4b1b-bc12-acd2bfb3910a)
- [What's new in Access 2021](https://support.microsoft.com/office/2c5c0766-b22b-4b81-a222-a791a8b5b54b)
- [What's new in Excel 2021](https://support.microsoft.com/office/f953fe71-8f85-4423-bef9-8a195c7a1100)
- [What's new in Outlook 2021](https://support.microsoft.com/office/6639e52f-f745-4e25-ba71-9081ac9430a9)
- [What's new in PowerPoint 2021](https://support.microsoft.com/office/dac3eb1b-483b-4043-a0c9-5c01c2c1a8f2)
- [What's new in Visio Professional 2021](https://support.microsoft.com/office/96732c1e-a022-4362-af07-fc817011ced5)
- [What's new in Word 2021](https://support.microsoft.com/office/8f0b9117-8cf4-4677-8cd5-d848dd0e1ac9)

Office LTSC 2021 includes only some, but not all, features that are available in versions of Office that come with a Microsoft 365 (or Office 365) plan.

Office LTSC 2021 won’t receive any new features now that it released. If you want to get new Office features on an on-going basis, you should consider moving to a Microsoft 365 (or Office 365) plan that includes Office. Many enterprise plans include Microsoft 365 Apps for enterprise, which includes the same Office apps as Office LTSC Professional Plus 2021. For more information, see [Compare Microsoft 365 enterprise plans](https://www.microsoft.com/microsoft-365/compare-microsoft-365-enterprise-plans) and [Compare Office 365 enterprise plans](https://www.microsoft.com/microsoft-365/enterprise/compare-office-365-plans).

To get on-going feature updates for the desktop versions of Project and Visio, you should consider moving to a subscription plan for those products. For more information, see [Project Plan 3/Project Plan 5](https://www.microsoft.com/microsoft-365/project/compare-microsoft-project-management-software) and [Visio Plan 2](https://www.microsoft.com/microsoft-365/visio/microsoft-visio-plans-and-pricing-compare-visio-options).

> [!NOTE]
> The Teams client app included with Office LTSC 2021 will continue to receive new features. The update process for Teams is different than the update process for the other Office apps, such as Word and Excel. For more information, see [Teams update process](/microsoftteams/teams-client-update).

## How do I upgrade to Office LTSC 2021?

We recommend that you uninstall existing versions of Office before you deploy Office LTSC 2021. You can remove most Office products that were installed with Windows Installer (MSI), such as Office 2016 or Office 2013, from the device as part of the installation of Office LTSC 2021. For more information, see [Remove existing versions of Office before installing Office LTSC 2021](deploy.md#remove-existing-versions-of-office-before-installing-office-ltsc-2021).

## Additional information about Office LTSC 2021

- Office LTSC Professional Plus 2021 includes Access, Excel, OneNote, Outlook, PowerPoint, Publisher, Skype for Business, Teams, and Word.
- Access and Publisher aren't available for devices running macOS.
- Office LTSC 2021 includes the OneNote desktop app. For more information, see [Deployment guide for OneNote](/microsoft-365-apps/deploy/deployment-guide-onenote.md).
- Office LTSC 2021 is available in both 32-bit and 64-bit versions. We recommend 64-bit on devices that have 4 GB or more of memory. But you should assess application compatibility and other factors that might require you to use the 32-bit version. For more information, see [Choose between the 64-bit or 32-bit version of Office](https://support.microsoft.com/office/2dee7807-8f95-4d0c-b5fe-6c6f49b8d261).
- After downloading the installation files, internet connectivity isn’t required to install Office LTSC 2021. Internet connectivity is required for MAK activation, but not for KMS activation. After activation, internet connectivity isn't required to use Office LTSC 2021.
- LTSC stands for Long Term Servicing Channel.

## Related articles

- [Deploy Office LTSC 2021](deploy.md)
- [Update Office LTSC 2021](update.md)
- [Overview of volume activation of Office](../volume-license-activation/plan-volume-activation-of-office.md)
