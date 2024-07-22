---
title: Office 2016 in RDSH and VDI deployments
ms.author: nwhite
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: conceptual
ms.service: o365-proplus-itpro
ms.collection: Tier2
ms.localizationpriority: medium
recommendations: false
description: Learn about using Outlook 2016, OneDrive, and Skype for Business in RDSH and VDI deployments
ms.date: 1/03/2024
---
# Office 2016 in RDSH and VDI Deployments

Use the following information to plan how best to integrate Office 2016 into your Remote Desktop (RDSH) and VDI deployments.

## Outlook 2016
In pooled VDI and RDSH deployments, using search within Outlook has limitations. Search indexing depends on the machine ID, which is different for different VMs. It's possible that every time a user logs into a pooled VDI infrastructure, they're directed to a new VM. That would mean, if we enable local search, the indexer will run every time the machine ID changes (when the user is on a different VM). Depending on the size of the .OST file, the indexer could take a long time to complete and use up resources needed for other apps. Search wouldn't only be slow but might not produce results. Using an Online Mode account profile would work around this, but overall performance would suffer due to the lack of a local cache. 

[Learn more about the difference between cached and online mode](/outlook/troubleshoot/installation/cached-exchange-mode)

Outlook 2016 has a solution to tackle this in cached mode by providing a new service search experience for mailboxes hosted on Exchange 2016 (or hosted in Office 365). This uses service search results against the local cache (OST). Outlook might fall back to using the local search indexer in some scenarios, but most searches would use this new service search feature. The recommendation for pooled VDI and RDSH deployments would be to use Outlook 2016 in cache mode with network connectivity to allow service search.

[Learn how to configure cached exchange mode in Outlook 2016](/outlook/troubleshoot/installation/cached-exchange-mode)

## OneDrive
The OneDrive Desktop App isn’t supported for client sessions that are hosted on Windows 2008 Terminal Services or Windows 2012 Remote Desktop Services (RDS) in non-persistent environments. Persistent Virtual Desktop Infrastructure (VDI) environments are supported. For more information, see [Use the sync app on virtual desktops](/sharepoint/sync-vdi-support).

## Skype for Business
Skype for Business isn't supported for RDSH deployments. For VDI deployments, check out the documentation on [planning for Skype for Business in VDI environments](/skypeforbusiness/plan-your-deployment/clients-and-devices/vdi-environments).