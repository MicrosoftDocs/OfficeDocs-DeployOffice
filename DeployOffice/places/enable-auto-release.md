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

1. An attendee can [check in through Teams panel](/microsoftteams/devices/check-in-and-room-release). Learn more about Teams Panels [here](/microsoftteams/devices/overview-teams-panels).
:::image type="content" source="./media/enable-auto-release/qr-code-reserved.png" alt-text="Screenshot of a Teams Panels home screen. Information about the current meeting appears on the screen with a Check-in button.":::
1. An attendee checks in by joining a meeting through [Microsoft Teams Rooms](/microsoftteams/rooms/).
:::image type="content" source="./media/enable-auto-release/join-meeting-through-teams-rooms.png" alt-text="Screenshot of Microsoft Teams Rooms. Example information about the meeting appears on the screen with a Join button.":::

For Public Preview Customers only (coming in July 2024)

1. An attendee can check in through Teams Chat.
1. An attendee can check in through email.

  > [!NOTE]
  > The email check-in is for meetings with no Teams meeting link (no Teams chat attached to the meeting instance).

## Who is eligible to use Auto Release

<!---  >[!NOTE]
>
> - Auto Release is an opt-in feature. For more information, see [Opt in to the Microsoft Places Public Preview](opt-in-places-preview.md). --->

### Teams panels customers

- This feature is available for rooms with Teams Rooms Standard, Teams Rooms Premium, Teams Rooms Pro, or Teams Shared Device licenses.
- We recommend enabling this feature only for rooms with [Teams panels](/microsoftteams/devices/check-in-and-room-release) (can be standalone Teams panels or panels sharing an account with Microsoft Teams Rooms).

### Microsoft Places Public Preview customers

- Even if your room doesn't have a Teams Rooms Standard, Teams Rooms Premium, Teams Rooms Pro, or Teams Shared Device license, you have access to use Auto Release if you're part of the Microsoft Places preview. For more information, see [Opt in to the Microsoft Places Public Preview](opt-in-places-preview.md).
- If you receive access through the Microsoft Places preview program, this feature is available for all rooms, but we recommend the feature be enabled only for rooms with a Teams panel or paired with a Microsoft Teams Rooms.
- You must have [Outlook on the web](/exchange/clients/outlook-on-the-web/mailbox-access?view=exchserver-2019&preserve-view=true) enabled, as our service uses the Outlook on the web framework to check in users.
- > [!NOTE]
  > Auto Release does not support or automatically release the room for live events, town halls, or non-Microsoft meetings such as Zoom or Webex.

## How to enable specific rooms for Auto Release

Auto Release can be enabled in three different ways:

- Exchange PowerShell
- Microsoft Teams admin center
- Teams panel device

> [!NOTE]
>
> - When Auto Release is enabled or disabled for a room, it can take up to 48 hours for this change to take effect.
> - Enabling or adjusting the Auto Release setting requires up to 48 hours to take effect. We recommend that you adjust the settings when there are no meetings scheduled within the next 48 hours.
> - If you adjust the settings for a room that has meetings scheduled over the following 48 hours and no one attends the meeting in the room, the Auto Release feature does not release the room.

### Exchange PowerShell

Enable rooms for this feature using the [`Set-CalendarProcessing`](/powershell/module/exchange/set-calendarprocessing?view=exchange-ps&preserve-view=true) Exchange PowerShell command.

The following example sets the Auto Release time to 10 minutes for the conference room labeled **Conference Room 1132**. If no usage is detected within 10 minutes of the meeting start time, the room is automatically released.

```powershell
Set-CalendarProcessing -Identity "Conference Room 1132" -EnableAutoRelease $true -PostReservationMaxClaimTimeInMinutes 10
```

### Microsoft Teams admin center

You can turn on this feature in [Teams admin center](https://admin.teams.microsoft.com/) under **Teams devices** > **Panels** > **Configuration profiles** > turn on **Release room if no one checks in** and set **Release after** > assign the configuration profile to a Teams device.

For more information, see [Manage devices in Microsoft Teams](/microsoftteams/devices/device-management).

### Teams panel device

Enable rooms for this feature on Teams panels under **Settings** > **Device settings** > **Teams Admin Settings** > **Meeting** > turn on **Release room if no one checks in** and set **Release after**.

When you initially [download the Panels app from the Microsoft Teams admin center](/microsoftteams/devices/remote-update) that has multi-panel check-in support, allow 48 hours for the feature to become available. Additionally, when you download the Panels app, it overrides the automatic release setting configured in Exchange through the `Set-CalendarProcessing` cmdlet for the room if it were configured previously.

<!-- If you adjust the settings for a room that has meetings scheduled over the following 48 hours and no one attends the meeting in the room, the Auto Release feature doesn't release the room.

When you download the Teams Panel app, validate the Auto Release setting through the Teams Panel device. The Teams Panel app overrides the Auto Release setting configured for in Exchange through the Set-CalendarProcessing cmdlet for the room. -->

For more information, see [Check-in and room release on Microsoft Teams panels](/microsoftteams/devices/check-in-and-room-release).

<!--- Check-in and room release settings let users check in to a meeting on Teams Panels at the room they reserved at the start of the meeting. If no users check in within a set amount of time after the meeting start time, the room is released and becomes available for others to reserve.

Learn more about how the feature works with Teams Panels [here](/microsoftteams/devices/overview-teams-panels). --->

## Frequently asked questions

Find answers to frequently asked questions about the Auto Release feature.

**Which clouds or deployments is this feature supported?**  
Auto Release is supported in Government Community Cloud (GCC).

**Why does the tenant need to have Outlook on the web enabled?**  
The check-in experience is built on top of the Outlook on the web framework and requires tenants to have the Outlook on the web enabled to process the check-in signal.  

**If there are meetings within 24-48 hours and Auto Release is enabled, what happens to them?  Are they all declined?  Is this an issue only when enabling via this step or via any of the 3 steps?**  
If there are meetings within 24-48 hours from when the feature was enabled, they aren't released or impacted.

**I am familiar with [Check In and Room Release for Teams panels](/microsoftteams/devices/check-in-and-room-release); what is the difference between these features?**  
For existing Teams Panel customers, there's no impact on the current Check-in and Room Release feature. With Places, you're able to see data on unclaimed meeting rooms such as the number of saved hours and eventually will be able to see the *number of meeting room hours* that were reclaimed and used productively in the Places analytics portal.  

**What triggers Auto Release?**  
When a meeting room is booked for a meeting, the attendees have time to check into the room. When no one checks into the room using any of the above options, the room is released and becomes available for others to reserve.

**When will the room be automatically released?**  
The admin sets the time attendees must check in before the room is automatically released. If no time is set, the default is 10 minutes.

**Is the meeting organizer required to check in?**  
Anyone entering the meeting room can check in to prevent the room from being auto released. Only one attendee is needed to check in through any of the previously listed options.  
