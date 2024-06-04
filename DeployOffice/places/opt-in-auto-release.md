---
title: "Opt in to the Auto Release feature"
ms.author: mactra
author: MachelleTranMSFT
manager: jtremper
ms.date: 06/03/2024
audience: ITPro
ms.topic: conceptual
ms.service: o365-proplus-itpro
ms.collection: Tier3
ms.localizationpriority: medium
recommendations: true
description: "Advise users they're using a room, and then free up the room for use by others if no current users are detected."
---

# Opt in to the Auto Release feature

With hybrid work, rooms are often booked but left unused, which wastes resources. Places lights up multiple ways for the user to reflect that they're using the room. If Places detects no users, it frees up the room for others.

## Prerequisites

> [!NOTE]
> Auto Release is an opt-in feature. For more information, see [Opt in to the Microsoft Places Public Preview](opt-in-places-preview.md).

- For Microsoft Places Public Preview customers:
  - This feature is available for all rooms, but we recommend the feature be enabled only for rooms with a Teams panel.
  - The tenant has [Outlook on the web](/exchange/clients/outlook-on-the-web/mailbox-access?view=exchserver-2019&preserve-view=true) enabled.
- For existing Teams panels customers (not part of Microsoft Places Public Preview):
  - This feature is available for rooms with Teams Rooms Standard, Teams Rooms Premium, Teams Rooms Pro, and Teams Shared Device licenses.
  - We recommend enabling this feature only for rooms with [existing Teams panels](/microsoftteams/devices/check-in-and-room-release) (can be standalone Teams panels or paired with a Microsoft Teams Rooms).

> [!NOTE]
> Auto Release does not support live events, townhalls, and non-Microsoft meetings (Zoom, Webex, and so on). These types of meetings do not auto-release the room.

## Enable Auto Release

Auto Release can be enabled in three different ways:

- Teams Admin Center
- Teams panel device
- PowerShell cmdlet

> [!NOTE]
> It can take up to 48 hours for any adjustment to the settings of this feature to sync to the backend regardless of where you adjusted the settings (on the device, Teams admin center, or PowerShell). Ensure that you adjust the settings when there are no meetings scheduled within the next 48 hours.

### Teams admin center

You can turn on this feature in Teams admin center under **Teams devices** > **Panels** > **Configuration profiles** > turn on **Release room if no one checks in** and set **Release after** > assign the profile.

### Teams panel device

You can turn on this feature on Teams panels under **Settings** > **Device settings** > **Teams Admin Settings** > **Meeting** > turn on **Release room if no one checks in** and set **Release after**.

When you initially download the Panels app from Teams admin center that has multi-panel check-in support, allow 48 hours for the feature to become available. Ensure that you download the app when there are no meetings scheduled within the next 48 hours. Furthermore, when you initially download this app, it overrides the auto-release setting configured in Exchange with the current auto-release setting on Teams panels.

For more information, see [Check-in and room release on Microsoft Teams panels](/microsoftteams/devices/check-in-and-room-release).

### PowerShell cmdlet

Enable Auto Release by running the following command:

```powershell
Set-CalendarProcessing <Identity> -EnableAutoRelease $true -PostReservationMaxClaimTimeInMinutes 10
```

## FAQs