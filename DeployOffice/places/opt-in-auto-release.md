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

With hybrid work, rooms are often booked but left unused, which wastes resources. Microsoft Places lights up multiple ways for the user to reflect that they're using the room. If Places detects no users, it frees up the room for others.

Learn more about how the feature works [here](/microsoftteams/devices/use-teams-panels#teams-panels-admin-experience).

## Prerequisites

> [!NOTE]
>
> - Auto Release is an opt-in feature. For more information, see [Opt in to the Microsoft Places Public Preview](opt-in-places-preview.md).
> - Auto Release does not support or automatically release the room for live events, town halls, or non-Microsoft meetings such as Zoom or Webex.

### For Microsoft Places Public Preview customers

- This feature is available for all rooms, but we recommend the feature be enabled only for rooms with a Teams panel.
- The tenant has [Outlook on the web](/exchange/clients/outlook-on-the-web/mailbox-access?view=exchserver-2019&preserve-view=true) enabled.

### For Teams panels customers (not part of Microsoft Places Public Preview)

- This feature is available for rooms with Teams Rooms Standard, Teams Rooms Premium, Teams Rooms Pro, and Teams Shared Device licenses.
- We recommend enabling this feature only for rooms with [Teams panels](/microsoftteams/devices/check-in-and-room-release) (can be standalone Teams panels or paired with Microsoft Teams Rooms).

## Enable Auto Release

Auto Release can be enabled in three different ways:

- Microsoft Teams admin center
- Teams panel device
- PowerShell cmdlet

> [!NOTE]
> It can take up to 48 hours for any adjustment to the settings of this feature to sync to the backend regardless of where you adjusted the settings (in PowerShell, in the Microsoft Teams admin center, or on a Teams panel device). Ensure that you adjust the settings when there are no meetings scheduled within the next 48 hours.

### PowerShell cmdlet

Enable Auto Release for rooms by running the following command:

```powershell
Set-CalendarProcessing <Identity> -EnableAutoRelease $true -PostReservationMaxClaimTimeInMinutes 10
```

### Microsoft Teams admin center

You can turn on this feature in Teams admin center under **Teams devices** > **Panels** > **Configuration profiles** > turn on **Release room if no one checks in** and set **Release after** > assign the profile.

### Teams panel device

You can turn on this feature on Teams panels under **Settings** > **Device settings** > **Teams Admin Settings** > **Meeting** > turn on **Release room if no one checks in** and set **Release after**.

When you initially download the Panels app from Microsoft Teams admin center that has multi-panel check-in support, allow 48 hours for the feature to become available. Ensure that you download the app when there are no meetings scheduled within the next 48 hours. Furthermore, when you initially download this app, it overrides the auto-release setting configured in Exchange with the current auto-release setting on Teams panels.

For more information, see [Check-in and room release on Microsoft Teams panels](/microsoftteams/devices/check-in-and-room-release).

## What is Auto Release

Auto Release is a feature tha can be enabled for rooms that are often unused or are frequently booked and abandoned. With Auto Release, you can ensure the space is used by having meeting attendees check in through one of two ways:

- An attendee checks in through Teams panel.
- An attendee checks in by joining a meeting through Microsoft Teams Rooms (MTR).

If no users check in to a meeting on Teams Panels at the room they reserved within a set amount of time after the meeting start time, the room is released and becomes available for others to reserve.

Learn more about how the feature works with Teams Panels [here](/microsoftteams/devices/overview-teams-panels).

## Frequently asked questions

Find answers to frequently asked questions about the Auto Release feature.

**Which clouds or deployments is this feature supported?**
Auto Release is supported in Government Community Cloud (GCC).
