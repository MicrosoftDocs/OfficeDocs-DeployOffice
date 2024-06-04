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

With hybrid work, rooms are often booked but left unused, which wastes resources. We're lighting up multiple ways for the user to reflect that they're utilizing the room and, if no users are detected, we free up the room for others.

## Prerequisites

> [!NOTE]
> Auto Release is an opt-in feature. For more information, see [Opt in to the Microsoft Places Public Preview](opt-in-places-preview.md). It's also a feature available for rooms with Teams Rooms Standard, Teams Rooms Premium, Teams Rooms Pro, Teams Shared Device licenses.

- The room has a Microsoft Teams Rooms device (MTR) or Teams panel
- The room is used for hybrid meetings
- The tenant doesn't have Outlook Web App disabled
  - [For existing customers of Teams panels](/microsoftteams/devices/check-in-and-room-release), enable this preview feature only for rooms with existing Teams panels

## Enable Auto Release

Auto Release can be enabled in two different ways:

- Teams Admin Center and the Teams Panel
- PowerShell cmdlet

### Teams admin center

You can turn on this feature in Teams admin center under **Teams devices** > **Panels** > **Configuration profiles** > turn on **Release room if no one checks in** and set **Release after** > assign the profile.

### Teams Panel Device

You can turn on this feature on Teams panels under **Settings** > **Device settings** > **Teams Admin Settings** > **Meeting** > turn on **Release room if no one checks in** and set **Release after**.

> [!NOTE]
> It can take up to 48 hours for any adjustment to the settings of this feature to sync to the backend regardless of where you adjusted the settings (on the device, Teams admin center, or PowerShell). Ensure that you adjust the settings when there are no meetings scheduled within the next 48 hours.

When you initially download the Panels app from Teams admin center that has multi-panel check-in support, allow 48 hours for the feature to become available. Ensure that you download the app when there are no meetings scheduled within the next 48 hours. Furthermore, when you initially download this app, it overrides the auto-release setting configured in Exchange with the current auto-release setting on Teams panels.

For more information, see [Check-in and room release on Microsoft Teams panels](/microsoftteams/devices/check-in-and-room-release).

### PowerShell cmdlet

> [!NOTE]
> It can take up to 48 hours for any adjustment to the settings of this feature to sync to the backend regardless of where you adjusted the settings (on the device, Teams admin center, or PowerShell). Ensure that you adjust the settings when there are no meetings scheduled within the next 48 hours.

Enable Auto Release by running the following command:

```powershell
Set-CalendarProcessing <Identity> -EnableAutoRelease $true -PostReservationMaxClaimTimeInMinutes 10
```

## Best practices

1. Ensure rooms used for in-person meetings have Teams panels to check in
1. Avoid enabling Auto Release for rooms used for large events such as townhalls/live events
1. Avoid enabling Auto Release for rooms that aren't used for Teams meetings (such as Webex or Zoom)
