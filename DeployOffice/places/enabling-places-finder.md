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

Places Finder is a web-based feature that exists in Microsoft Places to help employees find available conference [rooms](/exchange/recipients/room-mailboxes) and [workspaces](/exchange/troubleshoot/outlook-issues/create-book-workspace-outlook). It has improved functionality from the existing Room Finder for employees to confidently choose the right place to meet and work productively.

## Overview of Places Finder

Like Room Finder, every meeting room and workspace must be set up in Exchange Online as a room mailbox or as a workspace mailbox.  

Your room and workspace mailboxes will automatically show up in Places Finder once you've set up your location hierarchy to ensure all rooms and workspaces are tied to a building and floor. For more information on how to set up your hierarchy, see [Quick setup of buildings and floors](get-started/quick-setup-buildings-floors.md).

## Prerequisites

> [!NOTE]
> Places Finder is an opt-in feature and, once enabled, will replace the Room Finder experience in Outlook on the web, New Outlook for Windows, and Outlook Desktop (Mac and Windows). For more information, see [Opt in to the Microsoft Places Public Preview](opt-in-places-preview.md).

Before you enable Places Finder, you must do the following:

- Create your building entities and floors and associate them to existing or new rooms and workspaces accounts. To learn how to quickly set up buildings and floors in Exchange, see [Quick setup of buildings and floors](get-started/quick-setup-buildings-floors.md).

- Ensure that each resource account (room or workspace mailbox) has the necessary fields updated with accurate room and workspace data. We strongly recommend importing photos for each resource, otherwise a stock photo is uploaded for each room. Recommended fields you can update are discussed later in this article. To learn how to add metadata for rooms, see the [Set-Place cmdlet](/powershell/module/exchange/set-place).

### Properties for room accounts

:::image type="content" source="./media/enabling-places-finder/places-finder-conference-room-example.png" alt-text="Screen showing a sample conference room with its properties." lightbox="media/enabling-places-finder/places-finder-conference-room-example.png":::

### Properties for workspace accounts (neighborhoods, desk zones, and desks)

:::image type="content" source="./media/enabling-places-finder/places-finder-workspace-example.png" alt-text="Screen showing a sample workspace with its properties." lightbox="media/enabling-places-finder/places-finder-workspace-example.png":::

## Enabling Places Finder

Once you receive notification that you have access to the Places Public preview, run the following **Places PowerShell** cmdlet to enable Places Finder for a set of users in a security group.

```powershell
Set-PlacesSettings -Collection Places –PlacesFinderEnabled 'Default:false, OID:<Security Group OID>@<TenantId>:true'
```
## Frequently Asked Questions

### When I enable Places Finder for a certain set of users, will these users lose access to Room Finder?

Yes, once Places Finder is enabled, it replaces the Room Finder experience for that set of users. We recommend ensuring that your location heirarchy is set up for all rooms or workspaces within the assigned site or building in which users regularly book.

### How do I hide a room or workspace from showing in Places Finder?

Remove the ParentId property set on the resource mailbox. Learn more about manually updating resource mailbox properties by using [Set-PlaceV3](powershell/set-placev3.md).

### Where will I see Places Finder when enabled?

In the Places web app, you're introduced to Places Finder through multiple entry points.  

- You can find the Places Finder in the Places web app to book a conference room or desk.

  :::image type="content" source="./media/enabling-places-finder/places-finder-button-in-explore-tab.png" alt-text="Screen showing the Places Finder in the Places web app." lightbox="media/enabling-places-finder/places-finder-button-in-explore-tab.png":::

- You can use the Places Finder in the Places web app under the People tab to add a room to a meeting that doesn't have one yet.

  :::image type="content" source="./media/enabling-places-finder/places-finder-people-tab.png" alt-text="Screen showing the Places web app under the People tab." lightbox="media/enabling-places-finder/places-finder-people-tab.png":::

- You can use the Places Finder in Outlook calendar the same way you would with Room Finder.

  :::image type="content" source="./media/enabling-places-finder/places-finder-outlook-calendar1.png" alt-text="Screen showing how to book a meeting in the Outlook Calendar." lightbox="media/enabling-places-finder/places-finder-outlook-calendar1.png":::

- The Places Finder in New Outlook or Outlook on the web.

  :::image type="content" source="./media/enabling-places-finder/places-finder-outlook-calendar2.png" alt-text="Screen showing the Places Finder in New Outlook or Outlook on the web." lightbox="media/enabling-places-finder/places-finder-outlook-calendar2.png":::

- The Places Finder in the Windows desktop (Win32) calendar.

  :::image type="content" source="./media/enabling-places-finder/places-finder-in-windows-desktop-win32.png" alt-text="Screen showing Places Finder in Windows Desktop (Win32)." lightbox="media/enabling-places-finder/places-finder-in-windows-desktop-win32.png":::
 
- The Places Finder in the Mac desktop calendar.

  :::image type="content" source="./media/enabling-places-finder/places-finder-in-mac-desktop-calendar.png" alt-text="Screen showing Places Finder in the Mac calendar." lightbox="media/enabling-places-finder/places-finder-in-mac-desktop-calendar.png":::

### What's the difference between Room Finder and Places Finder?

:::image type="content" source="./media/enabling-places-finder/places-finder-room-finder-vs-places-finder.png" alt-text="Screen showing the difference between Room Finder and Places Finder." lightbox="media/enabling-places-finder/places-finder-room-finder-vs-places-finder.png":::

|Functionality  |Room Finder  |Places Finder
|---------|---------|---------|
|Entry Point |New Event Form in Calendar |New Event Form in Calendar<br>Places Homepage<br>Places People page |
|Main Search |Room Lists: a distribution list of room mailbox accounts (documentation letting room list represent a building)<br>Type search |No room lists<br>Location hierarchy (uses Country, State/Region, City, Building, and Floor to find the appropriate room)<br>Type search  |
|Recent Building |Supports recent buildings (room list)  |Building set from work plan or from a user’s booking history |
|Default Search |Last-used building (room list) |No last-used building<br>Respects building set in Places |
|Place Types |Conference Room<br>Workspaces |Conference Room<br>Workspaces |
|Capacity Filter |Yes |Yes |
|Features Filter |Combination of standardized properties and customer tags<br>**Room standard properties**: Video, Display, Audio, Meeting Teams Room, and Wheelchair Accessible<br>**Workspace standard properties**: Wheelchair Accessible<br>List of features is filtered just to what is populated given a specific room list |Combination of standardized properties and customer tags<br>**Room standard properties**: Video, Display, Audio, Meeting Teams Room, and Wheelchair Accessible<br>**Workspace standard properties**: Wheelchair Accessible<br>List of features is filtered just to what is populated given a specific building |
|Room suggestions |No suggestions  |**In Places web app**:<br>Suggestions based on historical bookings<br>Suggestions based on building (from Work Plan)<br>Suggestions based on number of in-office attendees for the meeting<br>**In Calendar**:<br>Suggestions based on building (from Work Plan) |
|Workspace Suggestions |No suggestions    |**In Places web app**:<br>Suggestions based on historical bookings<br>Suggestions based on building (from Work Plan)<br>Suggestions based on number of in-office attendees for the meeting<br>**In Calendar**:<br>Suggestions based on building (from Work Plan)   |
|Room Results |Name<br>Availability<br>Capacity<br>City (when applicable)<br>Features: Standard properties with icons<br>Features: Custom properties (no icons) |Name<br>Availability<br>Capacity<br>City (when applicable)<br>Building<br>Floor<br>Picture<br>Features: Standard properties with icons<br>Features: Custom properties with icons |
