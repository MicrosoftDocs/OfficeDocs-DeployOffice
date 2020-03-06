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

Office 365 is governed by the [Modern Lifecycle Policy](https://support.microsoft.com/help/30881/modern-lifecycle-policy) which requires customers to stay current as per the servicing and [system requirements](https://products.office.com/office-resources) for the product or service. This includes using Office 365 ProPlus on a Windows operating system that is currently in support.

Using Office 365 ProPlus on older, unsupported operating systems may cause performance and reliability issues over time. Therefore, if your organization is using Office 365 ProPlus on devices running Windows 7, we strongly recommend your organization move those devices to [Windows 10](https://www.microsoft.com/microsoft-365/windows/end-of-windows-7-support?rtc=1#office-ContentAreaHeadingTemplate-s9f0ou1).

## Security updates will continue for Office 365 ProPlus on Windows 7

Even though Windows 7 is no longer supported, we've decided to continue to provide you with security updates for Office 365 ProPlus for the next 3 years, until January 2023. We're doing this to give you additional time to make the transition from running Office 365 ProPlus on devices running Windows 7 to a supported operating system, such as Windows 10. But, during that time, as long as the device is still running Windows 7, Office 365 ProPlus won't receive any new features updates.

> [!IMPORTANT]
> - Even with these security updates, Office 365 ProPlus is no longer supported on Windows 7.
> - This information applies even if you have purchased Extended Security Updates (ESU) for Windows 7. After January 2020, security updates for Windows 7 are only available with ESU. For more information, see [FAQ about Extended Security Updates for Windows 7](https://support.microsoft.com/help/4527878/faq-about-extended-security-updates-for-windows-7).

## How to manage Office 365 ProPlus on Windows 7 after January 2020

Version 2002 is expected to be the last version of Office 365 ProPlus that will be available for devices running Windows 7 after Windows 7 goes out of support in January 2020. Version 2002 is expected to be available in Monthly Channel in late February 2020, in Semi-Annual Channel (Targeted) in March 2020, and in Semi-Annual Channel in July 2020.

This means that if you want to continue to deploy and update Office 365 ProPlus on devices that are running Windows 7, you need to use Version 2002. If you try to install a newer version of Office 365 ProPlus, such as Version 2005, on a device running Windows 7, you will receive an error message.

Version 2002 will be available until January 2023 and will receive only security updates, as needed, during that time.

> [!NOTE]
> - Versions on Semi-Annual Channel are usually available only for 14 months, but we're making an exception just for Version 2002 to align with how long ESU for Windows 7 is available. 
> - This extended availability for Version 2002 also applies to other update channels, such as Monthly and Semi-Annual (Targeted).
> - The extended availability of Version 2002 until January 2023 only applies to devices running Windows 7.

To deploy or update Version 2002 on devices running Windows 7, you can keep using the same  management tools that you're currently using, such as the Office Deployment Tool or Microsoft Endpoint Configuration Manager. Also, Office 365 ProPlus can remain on the same update channel as before.

After you move Office 365 ProPlus to a supported Windows operating system, you can configure Office 365 ProPlus to begin receiving newer versions and feature updates again. Since updates for Office 365 ProPlus are cumulative, you will receive all the feature updates that you missed while the device was running Windows 7.

> [!NOTE]
> If Office 365 ProPlus is configured to get updates directly from the Office Content Delivery Network (CDN) on the internet, Office 365 ProPlus will be updated automatically to Version 2002 on devices running Windows 7. After the device is moved to a newer, supported operating system, Office 365 ProPlus will be updated automatically to the latest version available for that update channel and will start receiving new features again.

## What about other versions of Office on Windows 7?

Non-subscription versions of Office used by organizations, such as Office Professional Plus 2016 or Office Standard 2013, will continue to be supported based on the [Fixed Lifecycle Policy](https://support.microsoft.com/help/14085). To see specific end of support dates for non-subscription versions of Office, go to the [Search product lifecycle](https://support.microsoft.com/lifecycle/search) page.

Even if your version of Office is still supported, Windows 7 will no longer receive security updates after January 2020, unless you have ESU, leaving it vulnerable to security threats. We recommend that you move to a [supported operating system](https://products.office.com/office-resources), such as [Windows 10](https://www.microsoft.com/microsoft-365/windows/end-of-windows-7-support?rtc=1#office-ContentAreaHeadingTemplate-s9f0ou1).

## Additional information

- This information also applies to the following:
   - Desktop versions of Project and Visio that come with some subscription plans, such as the Project Online Professional plan or Visio Online Plan 2. 
  - Office 365 Business, which is the version of Office that is included with certain business plans, such as the Microsoft 365 Business plan and the Office 365 Business Premium plan.
- Windows Server 2008 R2 also went out of support on January 14, 2020. Running Office 365 ProPlus on Windows Server 2008 R2 is no longer supported, even if you have [ESU for Windows Server 2008 R2](https://www.microsoft.com/cloud-platform/extended-security-updates). Like Windows 7, Version 2002 is expected to be the last version of Office 365 ProPlus that will be available for devices running Windows Server 2008 R2.  
- For end of support dates for different versions of Office on various versions of Windows, see [Office configuration support matrix](https://go.microsoft.com/fwlink/p/?linkid=2111390).
- Other Microsoft resources are available to help you make the transition to using Office 365 ProPlus on devices running Windows 10, including [FastTrack](https://docs.microsoft.com/fasttrack/win-10-fasttrack-benefit-for-windows-10), [Desktop App Assure](https://docs.microsoft.com/fasttrack/win-10-desktop-app-assure), and the [Desktop Deployment Center](https://docs.microsoft.com/microsoft-365/enterprise/desktop-deployment-center-home).