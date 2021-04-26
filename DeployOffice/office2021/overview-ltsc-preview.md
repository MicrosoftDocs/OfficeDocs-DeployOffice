---
title: "Overview of Office LTSC Preview"
ms.author: danbrown
author: DHB-MSFT
manager: laurawi
audience: ITPro
ms.topic: article
ms.service: o365-proplus-itpro
localization_priority: Normal
ms.collection: Ent_O365
ms.custom: 
- Ent_Office_VL
- OfficeLTSC
ROBOTS: NOINDEX, NOFOLLOW
description: "Technical overview for IT Pros about the preview version of Office LTSC"
---

# Overview of Office LTSC Preview

> [!IMPORTANT]
> - This is pre-release documentation for a preview program and is subject to change.
>
> - This preview program is intended for organizations that expect to buy and deploy the new volume licensed (perpetual) version of Office that is scheduled to be released later this year. This preview program isn’t intended for organizations that have already purchased and deployed Office from a Microsoft 365 (or Office 365) plan. 
>
> - This preview program isn't intended for home users of Office.

Microsoft is planning to release new volume licensed versions of Office, Project, and Visio later this year. Preview versions of those products are available now for you to install and test on devices running Windows in your organization.

The following products are available as part of this preview program:
- Office LTSC Professional Plus 2021 Preview
- Project Professional 2021 Preview
- Visio Professional 2021 Preview

Office LTSC Professional Plus 2021 Preview includes Access, Excel, OneNote, Outlook, PowerPoint, Publisher, Skype for Business, Teams, and Word.

> [!NOTE]
> LTSC stands for Long-Term Servicing Channel.

For information about installing, activating, and updating the preview versions of Office, Project, and Visio, see [Install Office LTSC Preview](install-ltsc-preview.md).

For information about the preview version of Office for devices running macOS, see [Overview of Office 2021 for Mac (Preview)](overview-mac-preview.md).

## What’s changed in Office LTSC Preview

The following are changes in Office LTSC Preview compared to the volume licensed version of Office 2019.

> [!TIP]
> If you’re moving to Office LTSC Preview from Office 2016, you should also review the changes documented in [Overview of Office 2019 (for IT Pros)](../office2019/overview.md). The most important difference between Office 2016 and Office 2019 (and Office LTSC Preview) is the change in the installation technology from Windows Installer (MSI) to Click-to-Run.

#### Privacy-related policy settings

The following policy settings are available when using Group Policy:

- Configure the level of client software diagnostic data sent by Office to Microsoft
- Allow the use of connected experiences in Office that analyze content
- Allow the use of connected experiences in Office that download online content
- Allow the use of connected experiences in Office

These policy settings are located under User Configuration\Policies\Administrative Templates\Microsoft Office 2016\Privacy\Trust Center in the Group Policy Management tool.

> [!NOTE]
> The “Allow the use of additional optional connected experiences in Office" policy setting is also available for Office LTSC Preview. But that's not considered a change because that policy setting is already available for volume licensed versions of Office 2019.

For more information, see [Use policy settings to manage privacy controls](../privacy/manage-privacy-controls.md). Even though the article isn’t specifically for Office LTSC Preview, the information covered in the article about how the policy settings work does apply to Office LTSC Preview.


#### Support duration

When Office LTSC, Project 2021, and Visio 2021 are released later this year, they will have five years of Mainstream Support. There won’t be any Extended Support available for these products after the five years of Mainstream Support ends.


#### Microsoft Teams

Office LTSC Preview includes the Teams client app, but only includes the Free or Exploratory service for Microsoft Teams.

The free version of Microsoft Teams is for users who don't have an existing Azure Active Directory (Azure AD) account. For more information, see [Manage the free version of Microsoft Teams](/microsoftteams/manage-freemium).

The Exploratory experience is for users in an organization who have existing Azure AD accounts but aren't licensed for Teams. For more information, see [Manage the Microsoft Teams Exploratory license](/microsoftteams/teams-exploratory).

For more information about the installation of the Teams client app with Office LTSC Preview, see [Apps installed](install-ltsc-preview.md#apps-installed).


#### Office Telemetry Dashboard

[Office Telemetry Dashboard](../compat/assess-office-compatibility.md) is no longer included with the installation of Office. Office Telemetry Dashboard will be available as a separate download from the Microsoft Download Center when Office LTSC is released later this year. 


#### Office Add-ins JavaScript APIs

Several more Office Add-ins JavaScript APIs are available with Office LTSC Preview and Office 2021 for Mac (Preview). These include the following requirement sets.

- Product requirement sets:
   - Outlook: Up to [1.9](/office/dev/add-ins/reference/objectmodel/requirement-set-1.9/outlook-requirement-set-1.9) on Windows, up to [1.8](/office/dev/add-ins/reference/objectmodel/requirement-set-1.8/outlook-requirement-set-1.8) on Mac
   - Excel: Up to [1.12](/office/dev/add-ins/reference/requirement-sets/excel-api-1-12-requirement-set)
   - PowerPoint: Up to [1.2](/office/dev/add-ins/reference/requirement-sets/powerpoint-api-1-2-requirement-set)

- Common API requirement sets:
   - [CustomFunctionsRuntime 1.3](/office/dev/add-ins/excel/custom-functions-requirement-sets) (Excel)
   - [DialogApi 1.2](/office/dev/add-ins/reference/requirement-sets/dialog-api-requirement-sets) (Excel, PowerPoint, Word)
   - [IdentityAPI 1.3](/office/dev/add-ins/reference/requirement-sets/identity-api-requirement-sets) (Excel, Outlook, PowerPoint, Word)
   - [ImageCoercion 1.2](/office/dev/add-ins/reference/requirement-sets/image-coercion-requirement-sets) (Excel, PowerPoint, Word)
   - [OpenBrowserWindowApi 1.1](/office/dev/add-ins/reference/requirement-sets/open-browser-window-api-requirement-sets) (Excel, Outlook, PowerPoint, Word)
   - [RibbonApi 1.1](/office/dev/add-ins/reference/requirement-sets/ribbon-api-requirement-sets) (Excel)
   - [SharedRuntime 1.1](/office/dev/add-ins/reference/requirement-sets/shared-runtime-requirement-sets) (Excel)

We encourage you to use, test, and provide feedback on the interaction of your current add-ins (including VBA and COM/VSTO) with Office LTSC Preview and Office 2021 for Mac (Preview). If you develop add-ins, consider taking this opportunity to test the new features to ensure that your customers can continue to use your add-in in Office LTSC Preview and Office 2021 for Mac (Preview).


## What’s stayed the same in Office LTSC Preview

You can use the same software distribution tools, such as Microsoft Endpoint Configuration Manager, to deploy and update Office LTSC Preview that you currently use to deploy and update volume licensed versions of Office 2019.

Also, how you activate volume licensed versions of Office remains the same. For example, by using Key Management Service (KMS) or Multiple Activation Key (MAK).

For more information about installing, activating, and updating the preview versions of Office, Project, and Visio, see [Install Office LTSC Preview](install-ltsc-preview.md).

The major version of Office LTSC Preview is 16.0, which is the same major version as volume licensed versions of Office 2019.  Having the same major version provides the following benefits when you’re upgrading from Office 2019:

- Existing Group Policy settings will continue to work, because those settings are still saved in the following registry locations: 
   - HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Office\16.0 
   - HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft\Office\16.0
- Other registry locations and settings information that reference 16.0 will still apply.
- Add-ins and other extensibility solutions that are compatible with volume licensed versions of Office 2019 will most likely be compatible with Office LTSC Preview or will require only minimal testing.

## New features included in Office LTSC Preview

The final list of the features that will be included in Office LTSC, Project 2021, and Visio 2021 isn’t available yet. More information about the features will be available closer to when these products are released later this year.

Here are a few examples of new features that are included in Office LTSC Preview: 

- Line Focus, which removes distractions so that you can move through a Word document line by line.
- XLOOKUP function, to help you find things in a table or range by row in an Excel worksheet.
- Dynamic array support in Excel, including new functions that make use of dynamic arrays. 
- Dark mode, which might help reduce eyestrain while working in your Office apps, such as Word, Excel, or Outlook. 

Keep in mind that after Office LTSC is released, Office LTSC won’t receive any new features. If you want to get new Office features on an on-going basis, you should consider moving to a Microsoft 365 (or Office 365) plan that includes Office. Many enterprise plans include Microsoft 365 Apps for enterprise, which includes the same Office apps as Office LTSC Professional Plus 2021 Preview. For more information, see [Compare Microsoft 365 enterprise plans](https://www.microsoft.com/microsoft-365/compare-microsoft-365-enterprise-plans) and [Compare Office 365 enterprise plans](https://www.microsoft.com/microsoft-365/enterprise/compare-office-365-plans).

To get on-going feature updates for the desktop versions of Project and Visio, you should consider moving to a subscription plan for those products. For more information, see [Project Plan 3/Project Plan 5](https://www.microsoft.com/microsoft-365/project/compare-microsoft-project-management-software) and [Visio Plan 2](https://www.microsoft.com/microsoft-365/visio/microsoft-visio-plans-and-pricing-compare-visio-options).

> [!NOTE]
> The Teams client app included with Office LTSC will continue to receive new features. The update process for Teams is different than the update process for the other Office apps, such as Word and Excel. For more information, see [Teams update process](/microsoftteams/teams-client-update).

## Getting support and providing feedback

Since this is a preview program, Microsoft support isn’t available. 

Therefore, we recommend that you use the preview products only for testing purposes. For example, to familiarize yourself with deploying the preview products and using the new features in the Office apps. The preview products shouldn’t be used in your normal production environment or on a production device. 

If you want to provide feedback about an Office app or feature, go to **File** > **Feedback** in that app.

If you have questions about Office LTSC Preview or want to provide additional feedback, go to the [Office LTSC 2021 Preview forum](https://answers.microsoft.com/lang/msoffice/forum/msoffice_LTSC) on Microsoft Community.

> [!NOTE]
> When Office LTSC, Project 2021, and Visio 2021 are released later this year, they will have five years of Mainstream Support. There won’t be any Extended Support available for these products after the five years of Mainstream Support ends.
