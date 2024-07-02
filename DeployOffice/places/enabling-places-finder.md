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
# Enabling Places Finder in Outlook

Places Finder is a web-based feature that exists in Places to help employees find available conference [rooms](/exchange/recipients/room-mailboxes) and [workspaces](/exchange/troubleshoot/outlook-issues/create-book-workspace-outlook). It has improved functionality from the existing Room Finder for employees to confidently choose the right place to meet and work productively.

## Overview of Places Finder

Like Room Finder, every meeting room and workspace must be set up in Exchange Online. Each of these spaces must be configured to have either a room mailbox or a workspace mailbox as a specific type of resource mailbox.  

For existing room and workspace mailboxes, Places Finder relies on a new location hierarchy to ensure all [rooms](/exchange/recipients/room-mailboxes) and [workspaces](/exchange/troubleshoot/outlook-issues/create-book-workspace-outlook) are tied to a [building and floor](get-started/quick-setup-buildings-floors.md), to be reflected in Places Finder.  

## Prerequisites

> [!NOTE]
> Places Finder is an opt-in feature and will be replacing the Room Finder experience once enabled in Outlook on the Web, New Outlook for Windows, Outlook Desktop (Mac and Windows). For more information, see [Opt in to the Microsoft Places Public Preview](opt-in-places-preview.md).

Before you enable Places Finder, you must do the following:

- Create your building entities and floors and associate them to existing or new rooms and workspaces accounts. To learn how to quickly set up buildings and floors in Exchange, see [Quick setup of buildings and floors](get-started/quick-setup-buildings-floors.md).

- Ensure that each resource account (room or workspace mailbox) has the necessary fields updated with accurate room and workspace data. We strongly recommend importing photos for each resource, otherwise a stock photo will be uploaded for each room. Recommended fields you can update are discussed later in this article.

#### Properties and how they interface for room accounts

:::image type="content" source="./media/enabling-places-finder/places-finder-conference-room-example.png" alt-text="Screen showing a sample conference room with its properties.":::

#### Properties and how they interface for room accounts

:::image type="content" source="./media/enabling-places-finder/places-finder-workspace-example.png" alt-text="Screen showing a sample workspace with its properties.":::

## Enable Places Finder

Once you receive notification that you have access to the Places Finder feature, run the following **Places PowerShell** cmdlet to enable the opt-in features for a set of users in a security group.

```powershell
Set-PlacesSettings -Collection Places –PlacesFinderEnabled 'Default:false, OID:<Security Group OID>@<TenantId>:true'
```
