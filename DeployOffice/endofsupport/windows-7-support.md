---
title: "Windows 7 end of support and Microsoft 365 Apps"
ms.author: danbrown
author: DHB-MSFT
manager: dougeby
audience: ITPro
ms.topic: article
ms.service: o365-proplus-itpro
ms.localizationpriority: medium
ms.collection: Ent_O365
ms.custom: Ent_Office_ProPlus
recommendations: true
description: "Provides Office admins with information about the implications of Windows 7 end of support on Microsoft 365 Apps."
---

# Windows 7 end of support and Microsoft 365 Apps

> [!IMPORTANT]
> - Support for Windows 7 ended on January 14, 2020. [Learn more](https://www.microsoft.com/microsoft-365/windows/end-of-windows-7-support)
> - Microsoft 365 Apps is no longer supported on Windows 7.
> - If you're a home user running Office on Windows 7, see [Windows 7 end of support and Office](https://support.microsoft.com/office/78f20fab-b57b-44d7-8368-06a8493f3cb9) instead of reading this article.


Office 365 and Microsoft 365 are governed by the [Modern Lifecycle Policy](/lifecycle/policies/modern), which requires customers to stay current as per the servicing and [system requirements](https://www.microsoft.com/microsoft-365/microsoft-365-and-office-resources) for the product or service. These requirements include using Microsoft 365 Apps on a Windows operating system that is currently in support.

Using Microsoft 365 Apps on older, unsupported operating systems may cause performance and reliability issues over time. Therefore, if your organization is using Microsoft 365 Apps on devices running Windows 7, we strongly recommend your organization moves those devices to Windows 11 or Windows 10.

## Security updates will continue for Microsoft 365 Apps on Windows 7

> [!NOTE]
> Security updates for Version 2002 of Microsoft 365 Apps on Windows 7 will end after January 10, 2023.

Even though Windows 7 is no longer supported, we've decided to continue to provide you with security updates for Microsoft 365 Apps for the next three years, until January 2023. We're doing this to give you more time to make the transition from using Microsoft 365 Apps on devices running Windows 7 to devices running a supported operating system, such as Windows 11 or Windows 10. But, during that time, as long as the device is still running Windows 7, your installation of Microsoft 365 Apps won't receive any new features updates.

> [!IMPORTANT]
> - Even with these security updates, Microsoft 365 Apps is no longer supported on Windows 7.
> - This information applies even if you have purchased Extended Security Updates (ESU) for Windows 7. After January 2020, security updates for Windows 7 are only available with ESU. For more information, see [FAQ about Extended Security Updates for Windows 7](https://support.microsoft.com/help/4527878/faq-about-extended-security-updates-for-windows-7).

## How to manage Microsoft 365 Apps on Windows 7 after January 2020

Version 2002 is the last version of Microsoft 365 Apps that's available for devices running Windows 7.

This means that if you want to continue to use Microsoft 365 Apps on devices that are running Windows 7, you need to use Version 2002. If you try to install a newer version of Microsoft 365 Apps, such as Version 2201, on a device running Windows 7, you'll receive an error message.

> [!IMPORTANT]
> - As of January 2022, attempting to do a new installation of Version 2002 will fail.
> - Performing an Online Repair of an existing installation of Version 2002 will also fail.
> - Updating an existing installation of Version 2002 will continue to work.

To update an existing installation of Version 2002, you can keep using the same management tools that you're currently using, such as the Office Deployment Tool or Configuration Manager. Also, Microsoft 365 Apps can remain on the same update channel as before.

If Microsoft 365 Apps is configured to get updates directly from the Office Content Delivery Network (CDN) on the internet, Microsoft 365 Apps on devices running Windows 7 will be updated automatically to the most current release of Version 2002 for that update channel.

## Guidance when using Configuration Manager for updates

If you use Configuration Manager and the Software Update management workflow to update installations of Microsoft 365 Apps, we recommend that you create a separate collection for your Windows 7 devices. Then, use a query rule to add members to the collection.

On the second Tuesday of each month, a new update package for Version 2002 that is only for devices running Windows 7 will be made available in the Microsoft Update Catalog. There will be an update package for each architecture (x86 or x64). That update package can be used with whichever update channel of Microsoft 365 Apps you have deployed. There won't be separate update packages of Version 2002 for each update channel. For example, the same update package can be used to update a Current Channel or a Semi-Annual Enterprise Channel installation of Microsoft 365 Apps on devices running Windows 7.

In the Office 365 Updates node, you'll see entries like the following, where ##### will be replaced by the most current build number:

- Microsoft 365 Apps Update for Windows 7 – Version 2002 for x64 based Edition (Build 12527.#####)
- Microsoft 365 Apps Update for Windows 7 – Version 2002 for x86 based Edition (Build 12527.#####)

These update packages are configured to apply ***only*** to devices running Windows 7. These update packages can't be used to update Microsoft 365 Apps on devices running other supported operating systems, such as Windows 11 or Windows 10.

If you use an automatic deployment rule (ADR), you should create a new rule for these update packages. Then, use the new rule for your collection that contains your Windows 7 devices. We recommend using the "Title" property and searching for "Microsoft 365 Apps Update for Windows 7" and the architecture you support. If you support both x86 and x64, you can include both updates in one Software Update Package as clients will apply the appropriate update. You should also check other existing ADRs to make sure they don't incorrectly try to apply these update packages, which are only for devices running Windows 7, to devices running other operating systems.

## Extended availability of Version 2002

Version 2002 will be available until January 2023 and will receive security updates, as needed, during that time. For a list of security updates included in releases of Version 2002, see [Release notes for Microsoft Office security updates](/officeupdates/microsoft365-apps-security-updates).

Versions of Semi-Annual Enterprise Channel are available usually for only 14 months, but we're making an exception for Version 2002 in order to align with the availability dates of Windows 7 ESU. This extended availability for Version 2002 also applies to other update channels, such as Current Channel and Semi-Annual Enterprise Channel (Preview).

The extended availability of Version 2002 until January 2023 applies ***only*** to devices running Windows 7.

## After moving Microsoft 365 Apps to a supported Windows operating system

After you move Microsoft 365 Apps to a supported Windows operating system, you can configure Microsoft 365 Apps to begin receiving newer versions and feature updates again. Since updates for Microsoft 365 Apps are cumulative, you'll receive all the feature updates that you missed while your device was running Windows 7.

If you're getting updates directly from the Office CDN on the internet, after the device is moved to a supported operating system, Microsoft 365 Apps will be updated automatically to the most current version available for that update channel and will start receiving new features again.

## What about other versions of Office on Windows 7?

Non-subscription versions of Office used by organizations, such as Office Professional Plus 2016 or Office Standard 2013, will continue to be supported based on the [Fixed Lifecycle Policy](/lifecycle/policies/fixed). To see specific end of support dates for non-subscription versions of Office, go to [Search Product and Services Lifecycle Information](/lifecycle/products/).

Even if your version of Office is still supported, Windows 7 will no longer receive security updates after January 2020, leaving it vulnerable to security threats, unless you have ESU. We recommend that you move to a [supported operating system](https://www.microsoft.com/microsoft-365/microsoft-365-and-office-resources), such as Windows 11 or Windows 10.

## Additional information

- This information also applies to the following products:
   - The subscription versions of the Project and Visio desktop apps. For example, if you have Project Plan 5 or Visio Plan 2.
  - Microsoft 365 Apps for business (previously named Office 365 Business), which is the version of Office that comes with some Microsoft 365 business plans, such as Microsoft 365 Business Premium.
- For information about Windows Server 2008 R2, see [Windows Server end of support and Microsoft 365 Apps](windows-server-support.md).
- For end of support dates for different versions of Office on various versions of Windows, see the [Office configuration support matrix](https://go.microsoft.com/fwlink/p/?linkid=2111390).
- Other Microsoft resources are available to help you make the transition to using Microsoft 365 Apps on devices running Windows 11 or Windows 10, including [FastTrack](/fasttrack/win-10-fasttrack-benefit-for-windows-10) and [App Assure](https://www.microsoft.com/fasttrack/microsoft-365/app-assure?rtc=1).
- For more information and resources, see [Support for Windows 7 has ended](https://www.microsoft.com/microsoft-365/windows/end-of-windows-7-support).
- To discuss or learn more about end of support for Office versions, visit [Microsoft Office End of Support](https://techcommunity.microsoft.com/t5/microsoft-office-end-of-support/ct-p/OfficeEOS) on the Microsoft Tech Community.
- If you're using Microsoft 365 Apps for enterprise on a device running Windows 7 or Windows Server 2008 R2, you'll continue to see **Office 365 ProPlus** under the **Product Information** section when you go to **File** > **Account** in an Office app, such as Word. If you're using Version 2002 of Microsoft 365 Apps for business, you'll see **Microsoft 365 for business** under the **Product Information** section.