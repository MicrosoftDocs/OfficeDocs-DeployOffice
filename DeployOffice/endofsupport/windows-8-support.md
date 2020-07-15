---
title: "Windows 8 end of support and Microsoft 365 Apps"
ms.author: danbrown
author: DHB-MSFT
manager: laurawi
audience: ITPro
ms.topic: article
ms.service: o365-proplus-itpro
localization_priority: Normal
ms.collection: Ent_O365
ms.custom: Ent_Office_ProPlus
description: "Provides Office admins with information about the implications of Windows 8 end of support on Microsoft 365 Apps."
---

# Windows 8 end of support and Microsoft 365 Apps

> [!IMPORTANT]
> - Support for Windows 8 ended on January 12, 2016. [Learn more](https://docs.microsoft.com/lifecycle/faq/windows#windows-81)
> - Microsoft 365 Apps are not supported on Windows 8.
> - If you're a home user running Office on Windows 8, see [Windows 8 end of support and Office](https://support.microsoft.com/office/34e28be4-1e4f-4928-b210-3f45d8215595) instead of reading this article.

Office 365 and Microsoft 365 are governed by the [Modern Lifecycle Policy](https://support.microsoft.com/help/30881/modern-lifecycle-policy), which requires customers to stay current as per the servicing and [system requirements](https://products.office.com/office-resources) for the product or service. This policy includes using Microsoft 365 Apps on a Windows operating system that is currently in support.

Using Microsoft 365 Apps on older, unsupported operating systems may cause performance and reliability issues over time. Therefore, if your organization is using Microsoft 365 Apps on devices running Windows 8, we strongly recommend your organization moves those devices to a supported operating system, preferably Windows 10.

## Windows 8 and updates to the Office apps

If you’re using Microsoft 365 Apps on a device running Windows 8, you should be aware of the following information about updates to the Office apps:

- If you’ve configured the Office apps to get updates directly from the Office Content Delivery Network (CDN) on the internet, Version 2004 is the last update you'll receive for the Office apps. You'll no longer receive any feature, security, and other quality updates beyond Version 2004.
- If you control the deployment of updates of Office apps (for example, by using Microsoft Endpoint Configuration Manager) deploying Version 2005 or later will result in functionality and stability issues for the Office apps. These issues are caused by features in Version 2005 and later that aren’t compatible with Windows 8.

## Upgrade from Windows 8 to a supported operating system

Because Windows 8 is no longer supported, Windows 8 doesn’t receive security updates, leaving it vulnerable to security threats.

To get security updates for Windows and updates to Microsoft 365 Apps, we strongly recommend that you move to a supported operating system. For example, Windows 8.1, or preferably Windows 10.

> [!TIP]
> - If you’re using Microsoft Endpoint Configuration Manager (current branch), you can use the [Computers with a specific operating system](https://docs.microsoft.com/mem/configmgr/core/servers/manage/list-of-reports#operating-system) report to identify devices that are running Windows 8.
> - You can update from Windows 8 to Windows 8.1 for free. Windows 8.1 is supported until January 10, 2023. For more information, see [Update to Windows 8.1 from Windows 8](https://support.microsoft.com/help/15288/windows-8-update-to-windows-8-1).

For more information about upgrading from Windows 8 to Windows 10, see the following resources:

- [Windows 10 deployment resources and documentation](https://docs.microsoft.com/windows/deployment/)
- [Desktop Deployment Center](https://docs.microsoft.com/microsoft-365/enterprise/desktop-deployment-center-home)

Other upgrade resources are available from Microsoft experts, such as [FastTrack](https://www.microsoft.com/fasttrack/microsoft-365/windows-10) and [App Assure](https://www.microsoft.com/fasttrack/microsoft-365/app-assure).

If you're not ready to upgrade from Windows 8 at this time, [Office on the web](https://www.office.com/) might be an alternative for your users.
