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

Before you begin, you must do the following:

- Deployed the new Outlook for Windows or Outlook on the web  
- Experience in Win32 or Outlook for the Mac will be available end of June
- Created your building
- Enable your maps
- Install Enhanced Places

## Enable Places Finder

Once you've been notified you have access to the Places Finder feature, run the following PowerShell cmdlet to enable the opt-in features for your tenant.

```powershell
Set-PlacesSettings -Collection Places –PlacesFinderEnabled  ‘Default:false, OID<Security Group OID>@<TenantId>:true’
```
