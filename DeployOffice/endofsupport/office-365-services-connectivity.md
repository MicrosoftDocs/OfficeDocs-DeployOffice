---
title: "Office versions and connectivity to Office 365 services"
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

# Office versions and connectivity to Office 365 services

Starting on October 13, 2020, only these versions of Office will be supported for connecting to Office 365 (and Microsoft 365) services:

- Microsoft 365 Apps for enterprise *(previously named Office 365 ProPlus)*
- Microsoft 365 Apps for business *(previously named Office 365 Business)*
- Office 2019, such as Office Professional Plus 2019
- Office 2016, such as Office Standard 2016

Examples Office 365 services include Exchange Online, SharePoint Online, and OneDrive for Business.

> [!IMPORTANT]
> We won’t take any active measures to block other versions of the Office client, such as Office 2013, from connecting to Office 365 services, but these older clients may encounter performance or reliability issues over time.

## Impact of using older Office clients to connect to Office 365 services

After October 13, 2020, ongoing investments to our cloud services will not take into account older Office clients. Over time, these Office clients may encounter performance or reliability issues. Organizations that use these older clients will almost certainly face an increased security risk and may find themselves out of compliance depending upon specific regional or industry requirements.

Therefore, administrators should update older Office clients to versions of Office supported for connecting to Office 365 services.

## Upgrade resources available to administrators

We recommend that you upgrade older Office clients to a subscription version of the Office client, such as Microsoft 365 Apps for enterprise. The most up-to-date subscription versions of the Office client are always supported connecting to Office 365 services.

We provide various services to help you upgrade to subscription versions of the Office client. The following list provides some examples of resources that are available:

- [Microsoft FastTrack](https://www.microsoft.com/fasttrack/microsoft-365/office-365?rtc=1), for migration and deployment assistance from Microsoft experts.
- [App Assure](https://www.microsoft.com/fasttrack/microsoft-365/office-365?rtc=1), for assistance from Microsoft with application compatibility issues.
- [Deployment guide for Microsoft 365 Apps](../deployment-guide-microsoft-365-apps.md), for technical documentation.
- [Product lifecycle dashboard](https://docs.microsoft.com/mem/configmgr/core/clients/manage/asset-intelligence/product-lifecycle-dashboard) and [upgrade readiness dashboard](https://docs.microsoft.com/mem/configmgr/sum/deploy-use/office-365-dashboard#bkmk_o365_readiness), for users of Microsoft Endpoint Configuration Manager (current branch).
- [Readiness Toolkit for Office add-ins and VBA](../readiness-toolkit-application-compatibility-microsoft-365-apps.md), to help identify potential issues with add-ins and VBA macros used in your organization.

## Upcoming changes related to connectivity to Office 365 services

There are some changes planned related to the use Basic Authentication with Exchange Online. For more information, see [Basic Authentication and Exchange Online – April 2020 Update](https://techcommunity.microsoft.com/t5/exchange-team-blog/basic-authentication-and-exchange-online-april-2020-update/ba-p/1275508).

## Additional information about connectivity to Office 365 services  

- Versions of Office 2019 and Office 2016 are supported until October 2023.
- Connecting to Office 365 services using Office 2016 for Mac isn’t supported after October 13, 2020. That’s because Office 2016 for Mac reaches end of support on that date.
- This information about connecting to Office 365 services also applies to Project and Visio.
- For end of support dates for different versions of Office on various versions of Windows, see the [Office configuration support matrix](https://go.microsoft.com/fwlink/p/?linkid=2111390).
- To discuss or learn more about end of support for Office versions, visit [Microsoft Office End of Support on the Microsoft Tech Community](https://techcommunity.microsoft.com/t5/microsoft-office-end-of-support/ct-p/OfficeEOS).
- 
