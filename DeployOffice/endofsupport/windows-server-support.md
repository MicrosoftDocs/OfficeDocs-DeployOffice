---
title: "Windows Server end of support and Microsoft 365 Apps"
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
description: "Provides Office admins with information about the implications of Windows Server end of support on Microsoft 365 Apps."
---

# Windows Server end of support and Microsoft 365 Apps

> [!IMPORTANT]
> - Microsoft 365 Apps isn't supported on Windows Server 2008 R2, Windows Server 2012, Windows Server 2012 R2, or Windows 2022.
> - Using Microsoft 365 Apps on older, unsupported operating systems may cause performance and reliability issues over time. These issues could include new features added to Microsoft 365 Apps, or updates to existing features, not working as expected.
> - If your organization is using a version of Windows Server that doesn't support Microsoft 365 Apps, we recommend that you move to [Windows 365](https://www.microsoft.com/windows-365) or [Azure Virtual Desktop](https://azure.microsoft.com/services/virtual-desktop/).

Microsoft 365 (and Office 365) is governed by the [Modern Lifecycle Policy](/lifecycle/policies/modern), which requires customers to stay current as per the servicing and [system requirements](https://www.microsoft.com/microsoft-365/microsoft-365-and-office-resources) for the product or service. This policy includes using Microsoft 365 Apps on a Windows operating system that is currently in support.

The following sections provide information about support for Microsoft 365 Apps on various versions of Windows Server.

## Windows Server 2008 R2

> [!NOTE]
> Security updates for Version 2002 of Microsoft 365 Apps on Windows Server 2008 R2 will end after January 10, 2023.

Windows Server 2008 R2 went out of support on January 14, 2020. Running Microsoft 365 Apps on Windows Server 2008 R2 is no longer supported, even if you have [ESU for Windows Server 2008 R2](https://www.microsoft.com/cloud-platform/extended-security-updates).

Version 2002 is the last version of Microsoft 365 Apps that you can install on devices running Windows Server 2008 R2. If you try to install a newer version of Microsoft 365 Apps, such as Version 2005, on a device running Windows Server 2008 R2, you'll receive an error message.

Even though Windows Server 2008 R2 is no longer supported, we've decided to continue to provide you with security updates for Microsoft 365 Apps for the next three years, until January 2023. But, during that time, as long as the device is still running Windows Server 2008 R2, your installation of Microsoft 365 Apps won't receive any new features updates.

For information about managing updates to Microsoft 365 Apps on Windows Server 2008 R2, see [Windows 7 end of support and Microsoft 365 Apps](windows-7-support.md). The same information about managing updates, and using Configuration Manager, for Windows 7 also applies to Windows Server 2008 R2.

## Windows Server 2012

As of January 14, 2020, Microsoft 365 Apps isn’t supported on Windows Server 2012.

For end of support dates for Windows Server 2012, see the [Windows Server 2012 lifecycle](/lifecycle/products/windows-server-2012) page.

## Windows Server 2012 R2

As of January 14, 2020, Microsoft 365 Apps isn’t supported on Windows Server 2012 R2.

For end of support dates for Windows Server 2012 R2, see the [Windows Server 2012 R2 lifecycle](/lifecycle/products/windows-server-2012-r2) page.

## Windows Server 2016

Microsoft 365 Apps is supported on Windows Server 2016 only until October 2025.

For recommendations on client hosting solutions to migrate to before October 2025, see [Microsoft 365 Apps migration from Windows Server](windows-server-migration.md).

For end of support dates for Windows Server 2016, see the [Windows Server 2016 lifecycle](/lifecycle/products/windows-server-2016) page.

## Windows Server 2019

Microsoft 365 Apps is supported on Windows Server 2019 only until October 2025.

For recommendations on client hosting solutions to migrate to before October 2025, see [Microsoft 365 Apps migration from Windows Server](windows-server-migration.md).

For end of support dates for Windows Server 2019, see the [Windows Server 2019 lifecycle](/lifecycle/products/windows-server-2019) page.

## Windows Server 2022

Microsoft 365 Apps isn’t supported on Windows Server 2022.

For recommendations on client hosting solutions to use instead, see [Microsoft 365 Apps migration from Windows Server](windows-server-migration.md).

For end of support dates for Windows Server 2022, see the [Windows Server 2022 lifecycle](/lifecycle/products/windows-server-2022) page.

## Additional information

- This information also applies to the subscription versions of the Project and Visio desktop apps. For example, if you have Project Plan 5 or Visio Plan 2.
- For end of support dates for different versions of Office on various versions of Windows, see the [Office configuration support matrix](https://query.prod.cms.rt.microsoft.com/cms/api/am/binary/RE2OqRI).
- To discuss or learn more about end of support for Office versions, visit [Microsoft Office End of Support](https://techcommunity.microsoft.com/t5/microsoft-office-end-of-support/ct-p/OfficeEOS) on the Microsoft Tech Community.
