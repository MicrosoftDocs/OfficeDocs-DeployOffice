---
title: "Opt in to the Auto Release feature"
ms.author: MachelleTranMSFT
author: 
manager: jtremper
ms.date: 06/03/2024
audience: ITPro
ms.topic: conceptual
ms.service: o365-proplus-itpro
ms.collection: Tier3
ms.localizationpriority: medium
recommendations: true
description: "Advise users they are using a room, and free up the room for use by others if no current users are detected."
---

# Opt in to the Auto Release feature

With hybrid work, rooms are often booked but left unused which wastes resources. We are lighting up multiple ways for the user to reflect that they are utilizing the room and, if none are detected, we will free up the room for others.

## Prerequisites

[!NOTE]
Auto Release is an opt-in feature. For more information, see [Opt in to the Microsoft Places Public Preview](opt-in-places-preview.md). It is also a feature available for rooms with Teams Rooms Standard, Teams Rooms Premium, Teams Rooms Pro, Teams Shared Device licenses.

- Have a Microsoft Teams Rooms device (MTR) or Teams Panel
- Utilized for Hybrid meetings
- Tenant does not have Outlook Web App disabled
[For existing customers of Teams panels](microsoftteams/devices/check-in-and-room-release.md), enable this preview feature only for rooms with existing Teams panels.

## Enable Auto Release

Auto release can be enabled in two different ways:

- Through the Teams Admin Center and the Teams Panel
- Via PowerShell cmdlet

### Teams admin center

You can turn on this feature in Teams admin center under **Teams devices** > **Panels** > **Configuration profiles** > turn on **Release room if no one checks in** and set **Release after** > assign the profile.

### Teams Panel Device

You can turn on this feature on Teams panels under **Settings** > **Device settings** > **Teams Admin Settings** > **Meeting** > turn on **Release room if no one checks in** and set **Release after**.

[!NOTE]
It can take up to 48 hours for any adjustment to the settings of this feature to sync to the backend regardless of where you adjusted the settings (on the device, Teams admin center, or PowerShell). Please ensure that you adjust the settings when there are no meetings scheduled within the next 48 hours.

When you initially download the Panels app from Teams admin center that has multi-panel check-in support, please allow 48 hours for the feature to become available. Please ensure that you download the app when there are no meetings scheduled within the next 48 hours. Furthermore, when you initially download this app, it will override the auto-release setting  configured in Exchange with the current auto-release setting on Teams panels.

For more information, see [Check-in and room release on Microsoft Teams panels](microsoftteams/devices/check-in-and-room-release.md).

### PowerShell cmdlet

[!NOTE]
It can take up to 48 hours for any adjustment to the settings of this feature to sync to the backend regardless of where you adjusted the settings (on the device, Teams admin center, or PowerShell). Please ensure that you adjust the settings when there are no meetings scheduled within the next 48 hours.

Enable Auto Release by running the following command:

```powershell
Set-CalendarProcessing <Identity> -EnableAutoRelease $true -PostReservationMaxClaimTimeInMinutes 10
```

## Best practices

1. Rooms utilized for in-person meetings has Teams panels to check in
1. Avoid enabling auto release for rooms used for large events such as Townhalls/Live Events
1. Avoid enabling auto release for rooms that are not used for Teams meetings (such as Webex, Zoom)
