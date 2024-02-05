---
title: "Windows 8 end of support and Microsoft 365 Apps"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: conceptual
ms.service: o365-proplus-itpro
ms.collection: Tier1
ms.localizationpriority: medium
recommendations: false
description: "Provides Office admins with information about the implications of Windows 8 end of support on Microsoft 365 Apps."
ms.date: 02/05/2024
---

# Windows 8 end of support and Microsoft 365 Apps

> [!IMPORTANT]
> - Support for Windows 8 ended on January 12, 2016.
> - Microsoft 365 Apps is no longer supported on Windows 8.
> - If you're a home user running Microsoft 365 or Office on Windows 8, [read this article](https://support.microsoft.com/office/34e28be4-1e4f-4928-b210-3f45d8215595) instead of reading the following article.

Microsoft 365 is governed by the [Modern Lifecycle Policy](/lifecycle/policies/modern), which requires customers to stay current as per the servicing and [system requirements](https://www.microsoft.com/microsoft-365/microsoft-365-and-office-resources) for the product or service. This policy includes using Microsoft 365 Apps on a Windows operating system that is currently in support.

Using Microsoft 365 Apps on older, unsupported operating systems may cause performance and reliability issues over time. Therefore, if your organization is using Microsoft 365 Apps on devices running Windows 8, we strongly recommend your organization moves those devices to a supported operating system, such as Windows 11 or Windows 10.

> [!WARNING]
> There are known functionality and stability issues when running Version 2005 or later of Microsoft 365 Apps on Windows 8.

## Windows 8 and updates to the Office apps

If you’re using Microsoft 365 Apps on a device running Windows 8, you should be aware of the following information about updates to the Office apps.

If you’ve configured the Office apps to get updates directly from the Office Content Delivery Network (CDN) on the internet, you’ll no longer receive any feature, security, and other quality updates beyond the following versions:
- Version 2002, for Semi-Annual Enterprise Channel or Semi-Annual Enterprise Channel (Preview).
- Version 2004, for all other update channels. For example, Current Channel or Monthly Enterprise Channel.
 
If you control the deployment of updates of Office apps (for example, by using Microsoft Configuration Manager), you’ll be prevented from deploying or updating beyond the following versions:
- Version 2008, for Semi-Annual Enterprise Channel or Semi-Annual Enterprise Channel (Preview).
- Version 2012, for all other update channels. For example, Current Channel or Monthly Enterprise Channel.
 
If you try to deploy or update to a newer version of the Office apps, you'll receive an error message that states "This version of Office requires a newer version of Windows."

## Upgrade from Windows 8 to a supported operating system

Because Windows 8 is no longer supported, Windows 8 doesn’t receive security updates, leaving it vulnerable to security threats.

To get security updates for Windows and updates to Microsoft 365 Apps, we strongly recommend that you move to a supported operating system. For example, move to Windows 11 (or Windows 10).

> [!TIP]
> If you’re using Microsoft Configuration Manager (current branch), you can use the [Computers with a specific operating system](/mem/configmgr/core/servers/manage/list-of-reports#operating-system) report to identify devices that are running Windows 8.

For more information about moving to a supported operating system, see [Windows client deployment resources and documentation](/windows/deployment/).

Other upgrade resources are available from Microsoft experts, such as [Microsoft FastTrack](https://www.microsoft.com/fasttrack) and [App Assure](https://www.microsoft.com/fasttrack/microsoft-365/app-assure).
