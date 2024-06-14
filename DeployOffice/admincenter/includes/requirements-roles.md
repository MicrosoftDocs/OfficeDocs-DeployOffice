---
author: manoth-msft
ms.author: nwhite
manager: dougeby
ms.service: o365-proplus-itpro
ms.localizationpriority: medium
ms.topic: include
description: Network Requirements for Microsoft 365 Apps admin center 
ms.date: 04/23/2024
---
<!--This file is shared by cloud-update.md, cloud-update.md, inventory.md, microsoft-365-apps-health.md, overview.md, security-update-status.md, overview-cloud-policy.md. Headings are driven by article context.-->
You can use the following built-in Microsoft Entra roles for accessing and managing the feature:

<!--Using include for adding global admin reference-->
[!INCLUDE [Global admin reference](../../includes/global-admin-reference.md)]

| Role                                      | Description       |
| ----------------------------------------- | ----------------- |
| Office Apps Administrator (**Recommended**) | This role can manage Office apps cloud services, including policy and settings management, and manage the ability to select, unselect, and publish 'what's new' feature content to end-user's devices. |
| Security Administrator                   | This role can read security information and reports and manage configuration in Microsoft Entra ID and Office 365. |
| Global Administrator                      | This role can manage all aspects of Microsoft Entra ID and Microsoft services that use Microsoft Entra identities. |

> [!NOTE]
> Global Reader is another built-in role supported by the Microsoft 365 Apps admin center, but it does not support some features like cloud update or the Modern App Settings page.
