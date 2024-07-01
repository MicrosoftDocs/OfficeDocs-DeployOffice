---
title: "Enabling Places Finder"
ms.author: mactra
author: MachelleTranMSFT
manager: jtremper
ms.date: 05/31/2024
audience: ITPro
ms.topic: conceptual
ms.service: o365-proplus-itpro
ms.collection: Tier3
ms.localizationpriority: medium
recommendations: true
description: "Enable Places Finder to book desks, rooms, and workspaces."
---
# Enabling Places Finder

You can use Places Finder to book desks, rooms, or workspaces with data such as images of each space, floorplans, and information about available technology in each area.

## Prerequisites

> [!NOTE]
> Places Finder is an opt-in feature and will be replacing the Room Finder experience once enabled in Outlook on the Web, New Outlook for Windows, Outlook Desktop (Mac and Windows). For more information, see [Opt in to the Microsoft Places Public Preview](opt-in-places-preview.md).

Before you begin, you must do the following tasks:

- Deploy the new Outlook for Windows or Outlook on the web. The experience will be coming to classic Outlook for Windows and Outlook for Mac at the end of June 2024.
- Create your building.
- Enable your maps.
- Install Enhanced Places.

## Enable Places Finder

Once you receive notification that you have access to the Places Finder feature, run the following PowerShell cmdlet to enable the opt-in features for your tenant.

```powershell
Set-PlacesSettings -Collection Places –PlacesFinderEnabled 'Default:false, OID<Security Group OID>@<TenantId>:true'
```
