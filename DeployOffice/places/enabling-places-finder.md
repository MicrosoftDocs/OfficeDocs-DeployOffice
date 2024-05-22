---
title: "Enabling Places Finder"
ms.author: mactra
author: MachelleTranMSFT
manager: jtremper
ms.date: 05/22/2024
audience: ITPro
ms.topic: conceptual
ms.service: o365-proplus-itpro
ms.collection: Tier3
ms.localizationpriority: medium
recommendations: true
description: "Enable Places Finder to book desks, rooms, and workspaces."
---
# Enabling Places Finder

You can use Places Finder to book desks, rooms, or workspaces while using additional data such as images of each space, floorplans, and information about available technology in each area.

## Prerequisites

> [!NOTE]
> Places Finder is an opt-in feature. For more information, see [Opt in to the Microsoft Places Public Preview](opt-in-places-preview.md).

- You deployed New Outlook or Outlook Web  
- Experience in Win32 or Outlook Mac will be available end of June
- Your building has been reated
- Your maps have been enabled
- You have Enhanced Places

## Enable Places Finder

Once you have been notified you have access to these features, run the following PowerShell cmdlet to enable opt-in features for your tenant.

To enable Places Finder which is an opt-in feature (off by default), please run the following cmdlet:

```powershell
Set-PlacesSettings -Collection Places –PlacesFinderEnabled  ‘Default:false, OID<Security Group OID>@<TenantId>:true’
```
