---
title: "Windows 8.1 end of support and Microsoft 365 Apps"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: conceptual
ms.service: o365-proplus-itpro
ms.collection: Tier2
ms.localizationpriority: medium
recommendations: false
description: "Provides Office admins with information about the implications of Windows 8.1 end of support on Microsoft 365 Apps."
ms.date: 02/14/2023
---

# Windows 8.1 end of support and Microsoft 365 Apps

> [!IMPORTANT]
> - Support for Windows 8.1 ended on January 10, 2023.
> - Microsoft 365 Apps is no longer supported on Windows 8.1.
> - If you're a home user running Microsoft 365 or Office on Windows 8.1, [read this article](https://support.microsoft.com/office/34e28be4-1e4f-4928-b210-3f45d8215595) instead of reading the following article.

Microsoft 365 is governed by the [Modern Lifecycle Policy](/lifecycle/policies/modern), which requires customers to stay current as per the servicing and [system requirements](https://www.microsoft.com/microsoft-365/microsoft-365-and-office-resources) for the product or service. This policy includes using Microsoft 365 Apps on a Windows operating system that is currently in support.

Using Microsoft 365 Apps on older and unsupported operating systems may cause performance and reliability issues over time. Therefore, if your organization is using Microsoft 365 Apps on devices running Windows 8.1, we strongly recommend your organization moves those devices to a more current and supported operating system, such as Windows 11 (or Windows 10).

## What happens to Microsoft 365 Apps on Windows 8.1 after January 10, 2023

Support for Windows 8.1 ended on January 10, 2023. As of that date, Microsoft 365 Apps is no longer supported on a device running Windows 8.1, although your apps, such as Word, will continue to work.

In addition to not being supported, the following restrictions apply to Microsoft 365 Apps on devices running Windows 8.1.

- You won't receive any new feature, security, or other quality updates for an existing installation of Microsoft 365 Apps.
- You won't be able to install a new version of Microsoft 365 Apps.

These restrictions apply to all update channels, such as Current Channel or Semi-Annual Enterprise Channel.

For more information, see the next section about the last versions of Microsoft 365 Apps available on Windows 8.1.

## Last versions of Microsoft 365 Apps available on Windows 8.1

The last version of Microsoft 365 Apps available on Windows 8.1 depends on whether or not you're getting updates directly from the Office Content Delivery Network (CDN).

### If you get updates directly from the Office CDN

If you’ve configured Microsoft 365 Apps to get updates directly from the Office Content Delivery Network (CDN) on the internet, you’ll no longer receive any feature, security, and other quality updates beyond the specific versions and builds listed in the following table.

| Update channel                           | Version and build                |
|------------------------------------------|----------------------------------|
| Current Channel                          | Version 2301 (Build 16026.20200) |
| Monthly Enterprise Channel               | Version 2212 (Build 15928.20282) |
| Semi-Annual Enterprise Channel (Preview) | Version 2208 (Build 15601.20538) |
| Semi-Annual Enterprise Channel           | Version 2208 (Build 15601.20538) |

*(These versions and builds were released on Tuesday February 14, 2023.)*

For example, when security updates are released on Tuesday March 14, 2023, your installation of Microsoft 365 Apps on Windows 8.1 won't get those security updates. Or, for example, when a version newer than Version 2301 is released in Current Channel, your installation of Microsoft 365 Apps won't be updated to that newer version.

### If you get updates from somewhere other than the Office CDN

If you control the deployment of updates and are using a location other than the Office CDN (for example, Microsoft Configuration Manager or an internal network share), you’ll be prevented from updating beyond Version 2302. This restriction applies to all update channels, such as Current Channel or Semi-Annual Enterprise Channel.

> [!IMPORTANT]
> Even though you can install or update to Version 2302, running Microsoft 365 Apps on Windows 8.1 isn't supported.

## Move from Windows 8.1 to a more current operating system

To continue to get security updates for Windows and updates to Microsoft 365 Apps, we strongly recommend that you move to a more current and supported operating system. For example, move to Windows 11 (or Windows 10).

> [!TIP]
> If you’re using Microsoft Configuration Manager (current branch), you can use the [Computers with a specific operating system](/mem/configmgr/core/servers/manage/list-of-reports#operating-system) report to identify devices that are running Windows 8.1.

For more information about Windows 11, see the following articles:
- [Windows 11 overview](/windows/whats-new/windows-11-overview)
- [Plan for Windows 11](/windows/whats-new/windows-11-plan)
- [Prepare for Windows 11](/windows/whats-new/windows-11-prepare)

Other Microsoft resources are available to help you make the transition to using Microsoft 365 Apps on devices running Windows 11, including [Microsoft FastTrack](https://www.microsoft.com/fasttrack) and [App Assure](https://www.microsoft.com/fasttrack/microsoft-365/app-assure).

## Additional information

- The information in this article also applies to subscription versions of the Project and Visio desktop apps. For example, if you have Project Plan 5 or Visio Plan 2.
- For end of support dates for different versions of Office on various versions of Windows, see the [Windows and Office configuration support matrix (PDF)](https://aka.ms/windows-office-support-matrix).
- To check the end of support date for a Microsoft product, go to [Search Product and Services Lifecycle Information](/lifecycle/products/).
- To discuss or learn more about end of support for Office versions, visit [Microsoft Office End of Support](https://techcommunity.microsoft.com/t5/microsoft-office-end-of-support/ct-p/OfficeEOS) on the Microsoft Tech Community.