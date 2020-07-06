---
title: "Windows Server end of support and Microsoft 365 Apps"
ms.author: danbrown
author: DHB-MSFT
manager: laurawi
audience: ITPro
ms.topic: article
ms.service: o365-proplus-itpro
localization_priority: Normal
ms.collection: Ent_O365
ms.custom: Ent_Office_ProPlus
description: "Provides Office admins with information about the implications of Windows Server end of support on Microsoft 365 Apps."
---

# Windows Server end of support and Microsoft 365 Apps

Office 365 and Microsoft 365 are governed by the [Modern Lifecycle Policy](https://support.microsoft.com/help/30881/modern-lifecycle-policy), which requires customers to stay current as per the servicing and [system requirements](https://products.office.com/office-resources) for the product or service. This policy includes using Microsoft 365 Apps on a Windows operating system that is currently in support.

Using Microsoft 365 Apps on older, unsupported operating systems may cause performance and reliability issues over time. Therefore, if your organization is using a version of Windows Server that doesn't support Microsoft 365 Apps, we recommend that you move to Windows Server 2019 or [Windows Virtual Desktop](https://azure.microsoft.com/services/virtual-desktop/).

The following sections provide information about support for Microsoft 365 Apps on various versions of Windows Server.

## Windows Server 2008 R2

Windows Server 2008 R2 went out of support on January 14, 2020. Running Microsoft 365 Apps on Windows Server 2008 R2 is no longer supported, even if you have [ESU for Windows Server 2008 R2](https://www.microsoft.com/cloud-platform/extended-security-updates). 

Version 2002 is the last version of Microsoft 365 Apps that you can install on devices running Windows Server 2008 R2. If you try to install a newer version of Microsoft 365 Apps, such as Version 2005, on a device running Windows Server 2008 R2, you'll receive an error message.

Even though Windows Server 2008 R2 is no longer supported, we've decided to continue to provide you with security updates for Microsoft 365 Apps for the next 3 years, until January 2023. But, during that time, as long as the device is still running Windows Server 2008 R2, your installation of Microsoft 365 Apps won't receive any new features updates.

For information about managing updates to Microsoft 365 Apps on Windows Server 2008 R2 and guidance for using Microsoft Endpoint Configuration Manager for updates, see [Windows 7 end of support and Microsoft 365 Apps](windows-7-support.md). The same information about managing updates and using Configuration Manager for Windows 7 also applies to Windows Server 2008 R2.

## Windows Server 2012

As of January 14, 2020, Microsoft 365 Apps isn’t supported on Windows Server 2012, even though Windows Server 2012 is supported until October 10, 2023.

If you’re using Microsoft 365 Apps on a device running Windows Server 2012, you should be aware of the following information about updates to the Office apps:

- If you’ve configured the Office apps to get updates directly from the Office Content Delivery Network (CDN) on the internet, Version 2004 is the last update you'll receive for the Office apps. You'll no longer receive any feature, security, and other quality updates beyond Version 2004.
- If you control the deployment of updates of Office apps (for example, by using Microsoft Endpoint Configuration Manager) deploying Version 2005 or later will result in functionality and stability issues for the Office apps. These issues are caused by features in Version 2005 and later that aren’t compatible with Windows Server 2012.

## Windows Server 2012 R2

As of January 14, 2020, Microsoft 365 Apps isn’t supported on Windows Server 2012 R2, even though Windows Server 2012 R2 is supported until October 10, 2023.

You can continue to use the most current versions of Microsoft 365 Apps on Windows Server 2012 R2, but Microsoft 365 Apps won’t be supported.

## Windows Server 2016

Microsoft 365 Apps is supported on Windows Server 2016 until October 2025.

## Windows Server 2019

Microsoft 365 Apps is supported on Windows Server 2019 until October 2025.

For some best practices when running Microsoft 365 Apps with Windows Server 2019, see [Windows Server 2019 adds support for Office 365 ProPlus](https://cloudblogs.microsoft.com/windowsserver/2019/10/07/windows-server-2019-adds-support-for-office-365-proplus/).  *(Office 365 ProPlus is now named Microsoft 365 Apps for enterprise.)*

## Additional information

- This information also applies to the subscription versions of the Project and Visio desktop apps. For example, if you have Project Plan 5 or Visio Plan 2.
- For end of support dates for different versions of Office on various versions of Windows, see the [Office configuration support matrix](https://go.microsoft.com/fwlink/p/?linkid=2111390).
- To discuss or learn more about end of support for Office versions, visit [Microsoft Office End of Support](https://techcommunity.microsoft.com/t5/microsoft-office-end-of-support/ct-p/OfficeEOS) on the Microsoft Tech Community.
