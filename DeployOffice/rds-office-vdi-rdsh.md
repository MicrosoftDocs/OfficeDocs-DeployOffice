---
title: Office 2016 in RDSH and VDI deployments
author: DHB-MSFT
ms.author: danbrown
manager: laurawi
ms.reviewer: elizapo, harowl
ms.audience: ITPro
ms.topic: article
ms.service: o365-proplus-itpro
localization_priority: Normal
ms.date: 09/28/2016
ms.collection: Ent_O365
ms.custom: Ent_Office_ProPlus
description: Learn about using Outlook 2016, OneDrive for Business, and Skype for Business in RDSH and VDI deployments

---
# Office 2016 in RDSH and VDI Deployments

Use the following information to plan how best to integrate Office 2016 into your Remote Desktop (RDSH) and VDI deployments.

For more information about integrating Office 365 with your RDSH or VDI environment, check out [Microsoft Office 365 for Citrix XenApp and XenDesktop 7.x](https://www.citrix.com/content/dam/citrix/en_us/documents/products-solutions/deployment-guide-office-365-for-xenapp-and-xendesktop.pdf).

## Outlook 2016
In pooled VDI and RDSH deployments, using search within Outlook has limitations. Search indexing depends on the machine ID, which is different for different VMs. It is possible that every time a user logs into a pooled VDI infrastructure, they are directed to a new VM. That would mean, if we enable local search, the indexer will run every time the machine ID changes (when the user is on a different VM). Depending on the size of the .OST file, the indexer could take a long time to complete and use up resources needed for other apps. Search would not only be slow but might not produce results. Using an Online Mode account profile would work around this, but overall performance would suffer due to the lack of a local cache. 

[Learn more about the difference between cached and online mode](https://docs.microsoft.com/exchange/outlook/cached-exchange-mode)

Outlook 2016 has a solution to tackle this in cached mode by providing a new service search experience for mailboxes hosted on Exchange 2016 (or hosted in Office 365). This uses service search results against the local cache (OST). Outlook might fall back to using the local search indexer in some scenarios, but most searches would use this new service search feature. The recommendation for pooled VDI and RDSH deployments would be to use Outlook 2016 in cache mode with network connectivity to allow service search.

[Learn how to configure cached exchange mode in Outlook 2016](https://docs.microsoft.com/exchange/outlook/cached-exchange-mode)

## OneDrive for Business
The OneDrive for Business sync client is currently not supported for multi-user environments (pooled VDI and RDSH). Users can connect to their resources using the web interface.

## Skype for Business
Skype for Business is not supported for RDSH deployments. For VDI deployments check out the documentation on [planning for Skype for Business in VDI environments](https://docs.microsoft.com/skypeforbusiness/plan-your-deployment/clients-and-devices/vdi-environments).

