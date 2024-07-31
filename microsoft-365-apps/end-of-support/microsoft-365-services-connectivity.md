---
title: "Office versions and connectivity to Microsoft 365 services"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: conceptual
ms.service: o365-proplus-itpro
ms.collection: Tier1
ms.localizationpriority: medium
search.appverid: MET150
recommendations: true
adobe-target: true
description: "Provides Office admins with information what versions of Office are supported for connecting to Microsoft 365 services and the implications of using older Office clients."
ms.date: 03/19/2024
---

# Office versions and connectivity to Microsoft 365 services

The following table lists the Office versions that are supported for connecting to Microsoft 365 services. For example, connecting to Exchange Online, SharePoint Online, or OneDrive.

|Office version |Supported for connecting until this date  |
|---------|---------|
|Microsoft 365 Apps |Supported as long as you’re using a [supported version](/officeupdates/update-history-microsoft365-apps-by-date#supported-versions). |
|Office LTSC 2021  |October 13, 2026 |

> [!NOTE]
> - Support for connection to Microsoft 365 services with Office 2019 and Office 2016 ended on October 10, 2023. 
> - As stated in a [April 2017 blog post](https://www.microsoft.com/microsoft-365/blog/2017/04/20/office-365-proplus-updates/), only perpetual Office versions in mainstream support are supported for connecting to Microsoft 365 services. Office 2016 is now out of mainstream support, but its coverage was extended until October 2023, as stated in a [September 2018 blog post](https://www.microsoft.com/microsoft-365/blog/2018/09/06/helping-customers-shift-to-a-modern-desktop/).

## Older Office versions not supported for connecting to Microsoft 365 services

Older Office versions might still be able to connect to Microsoft 365 services, but that connectivity isn't supported.

In practical terms, what this means is that older Office versions might not be able to use all the latest functionality and features of Microsoft 365 services. In addition, over time, these older versions might encounter other unexpected performance or reliability issues while using Microsoft 365 services. This situation occurs because improvements to Microsoft 365 services don't consider or test compatibility with these older Office versions.

No active measures are made to block older Office versions from connecting to Microsoft 365 services if they're in extended support and are kept up to date. For example, Office 2019 and Office 2016, both of which are in extended support until October 14, 2025.

Therefore, to provide the best experience with using Microsoft 365 services, we strongly recommend that you move off older Office versions to versions supported for connecting to Microsoft 365 services.

## Upgrade resources available to administrators

We recommend that you upgrade older Office clients to a subscription version of the Office client, such as Microsoft 365 Apps for enterprise. The most up-to-date subscription versions of the Office client are always supported connecting to Microsoft 365 services.

We provide various services to help you upgrade to subscription versions of the Office client. The following list provides some examples of resources that are available:

- [Microsoft FastTrack](https://www.microsoft.com/fasttrack), for migration and deployment assistance from Microsoft experts.
- [App Assure](https://www.microsoft.com/fasttrack/microsoft-365/app-assure), for assistance from Microsoft with application compatibility issues.
- [Deployment guide for Microsoft 365 Apps](../deploy/deployment-guide-microsoft-365-apps.md), for technical documentation.
- [Product lifecycle dashboard](/mem/configmgr/core/clients/manage/asset-intelligence/product-lifecycle-dashboard) and [upgrade readiness dashboard](/mem/configmgr/sum/deploy-use/office-365-dashboard#bkmk_o365_readiness), for users of Microsoft Configuration Manager (current branch).

## Other changes related to connectivity to Microsoft 365 services

### Retirement of TLS 1.0 and 1.1

Since October 15, 2020, you must use at least TLS 1.2 to connect to Microsoft 365 services. For more information, see [Disabling TLS 1.0 and 1.1 for Microsoft 365](/purview/tls-1.0-and-1.1-deprecation-for-office-365) and [Preparing for TLS 1.2 in Office 365 and Office 365 GCC](/purview/prepare-tls-1.2-in-office-365).

### Basic authentication deprecation in Exchange Online

In early January 2023, Basic authentication for multiple protocols for Exchange Online was permanently turned off. For more information, see the following blog posts:

- [Basic Authentication Deprecation in Exchange Online – Time’s Up](https://techcommunity.microsoft.com/t5/exchange-team-blog/basic-authentication-deprecation-in-exchange-online-time-s-up/ba-p/3695312)
- [Basic Authentication Deprecation in Exchange Online – What’s Next](https://techcommunity.microsoft.com/t5/exchange-team-blog/basic-authentication-deprecation-in-exchange-online-what-s-next/ba-p/3678143)

### Retirement of Skype for Business Online

Skype for Business Online was retired on July 31, 2021. For more information, see [Skype for Business Online retirement](/microsoftteams/skype-for-business-online-retirement).

### Minimum version requirements for Outlook for Windows

As of November 1, 2021, there are minimum versions of Outlook for Windows required to connect to Microsoft 365 services, such as Exchange Online. For more information, see the following blog post: [New minimum Outlook for Windows version requirements for Microsoft 365](https://techcommunity.microsoft.com/t5/microsoft-365-blog/new-minimum-outlook-for-windows-version-requirements-for/ba-p/2684142).

> [!NOTE]
> The requirements only apply to Outlook for Windows. They don't apply to Outlook on other operating systems, such as macOS, iOS, or Android.

## Additional information about connectivity to Microsoft 365 services  

- Connecting to Microsoft 365 services using Office 2016 for Mac isn’t supported. Office 2016 for Mac reached its end of support on October 13, 2020.
- The following versions of Project are supported for connecting to Microsoft 365 services:
  - Project Online Desktop Client *(as long as you’re using a [supported version](/officeupdates/update-history-microsoft365-apps-by-date#supported-versions))*
  - Project Professional 2021 and Project Standard 2021 *(until October 2026)*
  - Project Professional 2019 and Project Standard 2019 *(until October 2023)*
  - Project Professional 2016 and Project Standard 2016 *(until October 2023)*
- The following versions of Visio are supported for connecting to Microsoft 365 services:
  - Visio desktop app that comes with a Visio Plan 2 subscription  *(as long as you’re using a [supported version](/officeupdates/update-history-microsoft365-apps-by-date#supported-versions))*
  - Visio LTSC Professional 2021 and Visio LTSC Standard 2021 *(until October 2026)*
  - Visio Professional 2019 and Visio Standard 2019 *(until October 2023)*
  - Visio Professional 2016 and Visio Standard 2016 *(until October 2023)*
- This information about connecting to Microsoft 365 services doesn't apply to InfoPath 2013 or SharePoint Designer 2013.
- For end of support dates for different versions of Office on various versions of Windows, see the [Windows and Office configuration support matrix (PDF)](https://aka.ms/windows-office-support-matrix).
- To discuss or learn more about end of support for Office versions, visit [Microsoft Office End of Support on the Microsoft Tech Community](https://techcommunity.microsoft.com/t5/microsoft-office-end-of-support/ct-p/OfficeEOS).
