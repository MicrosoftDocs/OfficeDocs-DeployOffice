---
title: "Enabling Auto Release for your rooms"
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

# Enabling Auto Release for your rooms

With hybrid work, rooms are often booked but left unused, which wastes resources. Microsoft Teams and Microsoft Places are working together to light up multiple ways for the user to reflect that they're using the room. If a room enabled for Auto Release isn't being used, the room is freed up for others to use.

<!---DELETE THIS IF NOT EVENTUALLY USED. Learn more about how the feature works [here](/microsoftteams/devices/use-teams-panels#teams-panels-admin-experience). --->

## Overview of Auto Release

Auto release is a feature that is useful for conference rooms that are frequently booked and unused, especially in locations with limited room availability. With Auto Release, you can optimize the availability of conference rooms by having meeting attendees check in through one of two ways:

Auto Release is a feature that can be enabled for rooms that are often unused or are frequently booked and abandoned. With Auto Release, you can ensure the space is used by having meeting attendees check in through one of two ways:

1. An attendee can check in through Teams panel. Learn more about how the feature works with Teams Panels [here](/microsoftteams/devices/overview-teams-panels).
1. An attendee checks in by joining a meeting through [Microsoft Teams Rooms](/microsoftteams/rooms/).

For Public Preview Customers only (coming in July 2024)

1. An attendee can check in through Teams Chat.
1. An attendee can check in through email.

  > [!NOTE]
  > The email checkin is for meetings with no Teams meeting link (no Teams chat attached to the meeting instance).

## Who is eligible to use Auto Release

<!---  >[!NOTE]
>
> - Auto Release is an opt-in feature. For more information, see [Opt in to the Microsoft Places Public Preview](opt-in-places-preview.md).
> - Auto Release does not support or automatically release the room for live events, town halls, or non-Microsoft meetings such as Zoom or Webex. --->

### Teams panels customers

- This feature is available for rooms with Teams Rooms Standard, Teams Rooms Premium, Teams Rooms Pro, and Teams Shared Device licenses.
- We recommend enabling this feature only for rooms with [Teams panels](/microsoftteams/devices/check-in-and-room-release) (can be standalone Teams panels or paired with Microsoft Teams Rooms).

- ### Microsoft Places Public Preview customers

- Even if your room doesn't have a Teams Rooms Standard, Teams Rooms Premium, Teams Rooms Pro, or Teams Shared Device license, you have access to use Auto Release if you're part of the Microsoft Places preview. For more information, see [Opt in to the Microsoft Places Public Preview](opt-in-places-preview.md).
- If you receive access through the Microsoft Places preview program, this feature is available for all rooms, but we recommend the feature be enabled only for rooms with a Teams panel or paired with a Microsoft Teams Rooms.
- You must have [Outlook on the web](/exchange/clients/outlook-on-the-web/mailbox-access?view=exchserver-2019&preserve-view=true) enabled, as our service is using the Outlook on the web framework to check in users.
- > [!NOTE]
  > Auto Release does not support or automatically release the room for live events, town halls, or non-Microsoft meetings such as Zoom or Webex.

## Enable Auto Release

Auto Release can be enabled in three different ways:

- Microsoft Teams admin center
- Teams panel device
- PowerShell cmdlet

> [!NOTE]
>
> - When Auto Release is enabled or disabled for a room, it can take up to 48 hours for this change to take effect.
> - When enabling or disabling Auto Release, we recommend that you adjust the settings when there are no meetings scheduled within the next 48 hours.

### PowerShell cmdlet

Enable Auto Release for rooms by running the `Set-CalendarProcessing` PowerShell command.

```
Set-CalendarProcessing [-Identity <Room identity>] [-EnableAutoRelease <Boolean>] [-PostReservationMaxClaimTimeInMinutes <Int32>]
```

The following example sets the Auto Release time to 10 minutes. If no usage is detected within 10 minutes of the meeting start time, the room is auto-released.

```powershell
Set-CalendarProcessing -Identity "Lobby Conference Room" -EnableAutoRelease $true -PostReservationMaxClaimTimeInMinutes 10
```

For more information, see [Set-CalendarProcessing](/powershell/module/exchange/set-calendarprocessing?view=exchange-ps).

### Microsoft Teams admin center

You can turn on this feature in Teams admin center under **Teams devices** > **Panels** > **Configuration profiles** > turn on **Release room if no one checks in** and set **Release after** > assign the profile.

### Teams panel device

You can turn on this feature on Teams panels under **Settings** > **Device settings** > **Teams Admin Settings** > **Meeting** > turn on **Release room if no one checks in** and set **Release after**.

When you initially download the Panels app from Microsoft Teams admin center that has multi-panel check-in support, allow 48 hours for the feature to become available. Ensure that you download the app when there are no meetings scheduled within the next 48 hours.

Furthermore, when you initially download this app, it overrides the autorelease setting configured in Exchange with the current autorelease setting on Teams panels.

For more information, see [Check-in and room release on Microsoft Teams panels](/microsoftteams/devices/check-in-and-room-release).

Check-in and room release settings let users check in to a meeting on Teams Panels at the room they reserved at the start of the meeting. If no users check in within a set amount of time after the meeting start time, the room is released and becomes available for others to reserve.

Learn more about how the feature works with Teams Panels [here](/microsoftteams/devices/overview-teams-panels).

## Frequently asked questions

Find answers to frequently asked questions about the Auto Release feature.

**Which clouds or deployments is this feature supported?**
Auto Release is supported in Government Community Cloud (GCC).
