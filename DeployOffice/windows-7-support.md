---
title: "Windows 7 end of support and Office 365 ProPlus"
ms.author: danbrown
author: DHB-MSFT
manager: laurawi
audience: ITPro
ms.topic: article
ms.service: o365-proplus-itpro
localization_priority: Priority
ms.collection: Ent_O365
ms.custom: Ent_Office_ProPlus
description: "Provides Office admins with information about the implications of Windows 7 end of support on Office 365 ProPlus."
---

# Windows 7 end of support and Office 365 ProPlus

> [!IMPORTANT]
> - Support for Windows 7 ended on January 14, 2020. [Learn more](https://www.microsoft.com/microsoft-365/windows/end-of-windows-7-support)
> - Office 365 ProPlus is no longer supported on Windows 7.
> - If you're a home user running Office on Windows 7, see [Windows 7 end of support and Office](https://support.office.com/article/78f20fab-b57b-44d7-8368-06a8493f3cb9) instead of reading this article.

Office 365 is governed by the [Modern Lifecycle Policy](https://support.microsoft.com/help/30881/modern-lifecycle-policy), which requires customers to stay current as per the servicing and [system requirements](https://products.office.com/office-resources) for the product or service. This includes using Office 365 ProPlus on a Windows operating system that is currently in support.

Using Office 365 ProPlus on older, unsupported operating systems may cause performance and reliability issues over time. Therefore, if your organization is using Office 365 ProPlus on devices running Windows 7, we strongly recommend your organization moves those devices to [Windows 10](https://www.microsoft.com/microsoft-365/windows/end-of-windows-7-support?rtc=1#office-ContentAreaHeadingTemplate-s9f0ou1).

## Security updates will continue for Office 365 ProPlus on Windows 7

Even though Windows 7 is no longer supported, we've decided to continue to provide you with security updates for Office 365 ProPlus for the next 3 years, until January 2023. We're doing this to give you additional time to make the transition from using Office 365 ProPlus on devices running Windows 7 to devices running a supported operating system, such as Windows 10. But, during that time, as long as the device is still running Windows 7, your installation of Office 365 ProPlus won't receive any new features updates.

> [!IMPORTANT]
> - Even with these security updates, Office 365 ProPlus is no longer supported on Windows 7.
> - This information applies even if you have purchased Extended Security Updates (ESU) for Windows 7. After January 2020, security updates for Windows 7 are only available with ESU. For more information, see [FAQ about Extended Security Updates for Windows 7](https://support.microsoft.com/help/4527878/faq-about-extended-security-updates-for-windows-7).

## How to manage Office 365 ProPlus on Windows 7 after January 2020

Version 2002 is the last version of Office 365 ProPlus that you can install on devices running Windows 7. Version 2002 is available in Monthly Channel and in Semi-Annual Channel (Targeted), and is expected to be available in Semi-Annual Channel in July 2020.

This means that if you want to continue to deploy and update Office 365 ProPlus on devices that are running Windows 7, you need to use Version 2002. If you try to install a newer version of Office 365 ProPlus, such as Version 2005, on a device running Windows 7, you'll receive an error message.

> [!NOTE]
> You can continue to use a version of Office 365 ProPlus earlier than Version 2002 on devices running Windows 7 if that version is still available. For example, you can continue to use Version 1908 of Semi-Annual Channel until March 2021. To see the version available in each update channel of Office 365 ProPlus, refer to the table in [Update history for Office 365 ProPlus](https://docs.microsoft.com/officeupdates/update-history-office365-proplus-by-date).  

To deploy or update Version 2002 on devices running Windows 7, you can keep using the same management tools that you're currently using, such as the Office Deployment Tool or Microsoft Endpoint Configuration Manager. Also, Office 365 ProPlus can remain on the same update channel as before.

If Office 365 ProPlus is configured to get updates directly from the Office Content Delivery Network (CDN) on the internet, Office 365 ProPlus on devices running Windows 7 will be updated automatically to the most current release of Version 2002 for that update channel.

## Guidance when using Configuration Manager for updates

If you use Configuration Manager and the Software Update management workflow to update installations of Office 365 ProPlus, we recommend that you create a separate collection for your Windows 7 devices. Then, use a query rule to add members to the collection.

On the 2nd Tuesday of each month, a new update package for Version 2002 that is only for devices running Windows 7 will be made available in the Microsoft Update Catalog. There will be an update package for each architecture (x86 or x64). That update package can be used with whichever update channel of Office 365 ProPlus you have deployed. There won't be separate update packages of Version 2002 for each update channel. For example, the same update package can be used to update a Monthly Channel or a Semi-Annual Channel installation of Office 365 ProPlus on devices running Windows 7.

In the Office 365 Updates node, you'll see entries like the following, where ##### will be replaced by the most current build number:

- Office 365 Client Update for Windows 7 – Version 2002 for x64 based Edition (Build 12527.#####)
- Office 365 Client Update for Windows 7 – Version 2002 for x86 based Edition (Build 12527.#####)

These update packages are configured to apply ***only*** to devices running Windows 7. These update packages can't be used to update Office 365 ProPlus on devices running other supported operating systems, such as Windows 10.

If you use an automatic deployment rule (ADR), you should create a new rule for these update packages. Then, use the new rule for your collection that contains your Windows 7 devices. We recommend using the "Title" property and searching for "Office 365 Client Update for Windows 7" as well as the architecture you support. If you support both x86 and x64, you can include both updates in one Software Update Package as clients will apply the appropriate update. You should also check other existing ADRs to make sure they don't incorrectly try to apply these update packages, which are only for devices running Windows 7, to devices running other operating systems.

## Extended availability of Version 2002

Version 2002 will be available until January 2023 and will receive security updates, as needed, during that time. For a list of security updates included in releases of Version 2002, see [Release notes for Office 365 ProPlus Security Updates](https://docs.microsoft.com/officeupdates/office365-proplus-security-updates).

Versions on Semi-Annual Channel are available usually for only 14 months, but we're making an exception for Version 2002 in order to align with the availability dates of Windows 7 ESU. This extended availability for Version 2002 also applies to other update channels, such as Monthly and Semi-Annual (Targeted).

The extended availability of Version 2002 until January 2023 applies ***only*** to devices running Windows 7.

## After moving Office 365 ProPlus to a supported Windows operating system

After you move Office 365 ProPlus to a supported Windows operating system, you can configure Office 365 ProPlus to begin receiving newer versions and feature updates again. Since updates for Office 365 ProPlus are cumulative, you'll receive all the feature updates that you missed while your device was running Windows 7.

If you're getting updates directly from the Office CDN on the internet, after the device is moved to a supported operating system, Office 365 ProPlus will be updated automatically to the most current version available for that update channel and will start receiving new features again.

## What about other versions of Office on Windows 7?

Non-subscription versions of Office used by organizations, such as Office Professional Plus 2016 or Office Standard 2013, will continue to be supported based on the [Fixed Lifecycle Policy](https://support.microsoft.com/help/14085). To see specific end of support dates for non-subscription versions of Office, go to the [Search product lifecycle](https://support.microsoft.com/lifecycle/search) page.

Even if your version of Office is still supported, Windows 7 will no longer receive security updates after January 2020, leaving it vulnerable to security threats, unless you have ESU. We recommend that you move to a [supported operating system](https://products.office.com/office-resources), such as [Windows 10](https://www.microsoft.com/microsoft-365/windows/end-of-windows-7-support?rtc=1#office-ContentAreaHeadingTemplate-s9f0ou1).

## Additional information

- This information also applies to the following products:
   - Desktop versions of Project and Visio that come with some subscription plans, such as the Project Online Professional plan or Visio Online Plan 2.
  - Office 365 Business, which is the version of Office that is included with certain business plans, such as the Microsoft 365 Business plan and the Office 365 Business Premium plan.
- Windows Server 2008 R2 also went out of support on January 14, 2020. Running Office 365 ProPlus on Windows Server 2008 R2 is no longer supported, even if you have [ESU for Windows Server 2008 R2](https://www.microsoft.com/cloud-platform/extended-security-updates). Similar to Windows 7, Version 2002 is the last version of Office 365 ProPlus available for devices running Windows Server 2008 R2.  
- For end of support dates for different versions of Office on various versions of Windows, see the [Office configuration support matrix](https://go.microsoft.com/fwlink/p/?linkid=2111390).
- Other Microsoft resources are available to help you make the transition to using Office 365 ProPlus on devices running Windows 10, including [FastTrack](https://docs.microsoft.com/fasttrack/win-10-fasttrack-benefit-for-windows-10), [Desktop App Assure](https://docs.microsoft.com/fasttrack/win-10-desktop-app-assure), and the [Desktop Deployment Center](https://docs.microsoft.com/microsoft-365/enterprise/desktop-deployment-center-home).
- To discuss or learn more about end of support for Office versions, visit [Microsoft Office End of Support](https://techcommunity.microsoft.com/t5/microsoft-office-end-of-support/ct-p/OfficeEOS) on the Microsoft Tech Community.