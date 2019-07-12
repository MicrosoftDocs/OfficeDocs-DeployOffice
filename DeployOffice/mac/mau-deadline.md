---
title: "Set a deadline for updates from Microsoft AutoUpdate"
ms.author: danbrown
author: DHB-MSFT
manager: laurawi
audience: ITPro
ms.topic: article
ms.service: o365-proplus-itpro
localization_priority: Normal
ms.collection: Ent_O365
ms.custom: Ent_Office_Mac
description: "Provides admins with information about how to set a deadline for updates provided from Microsoft AutoUpdate (MAU)"
---

# Set a deadline for updates from Microsoft AutoUpdate

Starting with version 4.13 of Microsoft AutoUpdate (MAU), you can set a deadline for when updates are required to be installed on a user’s device. Version 4.13 was released on July 12, 2019.

Users will receive notifications about the upcoming deadline and can temporarily postpone the updates from being installed. But once the deadline is reached, any applications the user has open will be closed and the updates applied.

## Options for setting a deadline

You can set a deadline for any of the following applications:

- An individual application, such as just Word.
- A grouping of applications, such as Word, Excel, and PowerPoint.
- All Office applications that are updated by MAU. This includes Excel, OneNote, Outlook, PowerPoint, and Word, but does not include Teams or OneDrive.
- All Microsoft applications that are updated by MAU. For example, Skype for Business, Remote Desktop, and Microsoft Defender ATP (Advanced Threat Protection).

The default is for the deadline to apply to all applications that receive updates from MAU.

When you specify a deadline, you can configure the deadline in either of these two ways:
- A specific date and time
- A certain number of days after the update is detected

If you use a specific date and time for the deadline, it’s tied to a specific version that you’re updating to. That means for the next set of updates that Microsoft releases, you would need to configure a new date and time for the deadline.

If you use a certain number of days for the deadline, you can re-use that deadline for future updates that Microsoft releases. The number of days is calculated from when an update is detected by MAU.

You can also configure how many hours in advance of the deadline that Automatic Download and Install mode begins. This is optional and the default is 72 hours before the deadline.

## Preference settings for deadlines

The following are the preference settings for configuring a deadline. These keys are CFPreferences-compatible, which means that it can be set by using enterprise management software for Mac, such as Jamf Pro.

## Deadline notifications for users

After Automatic Download and Install mode is turned on, MAU automatically updates any applications that are closed.

If applications are open and can't be updated, then users see a notification about the upcoming deadline. At that point, users can save their work, close their open applications, and have MAU apply the updates. If users do that, they won't see any more notifications about the deadline for those applications.

If users don't want to apply the updates at that time, they can postpone the updates. If they choose to postpone, they will receive other notifications at a later time reminding them about the deadline. For example, with the first notification, users can choose to be reminded again in a certain number of hours. But users can't postpone the updates beyond the deadline.

When the deadline is an hour away, users get a persistent notification along with a timer that counts down the minutes until the deadline. If the deadline arrives and users haven't saved their work and closed their applications, MAU will forcibly close the applications, without saving the data, and starts to apply the updates.

## Additional information about MAU deadlines

- Deadlines can be configured regardless of where MAU is looking for the updates. For example, deadlines work if MAU is getting updates directly from the Office Content Delivery Network (CDN) on the internet of if MAU is getting updates from a MAU caching server within your local network.
- If you have configured the deadline to be a certain number of days after an update is detected, and then MAU detects a new update, the deadline will be reset to apply to the new update.
- If you have specified a deadline for all applications, you can still configure a more specific deadline for one of the applications. For example, you can configure a 7 day deadline for all applications, and then specify that the deadline for Excel is 4 days.
- Instead of configuring a specific date and time for a deadline for a specific version, you can configure that deadline to be a certain number of days after that specific version is detected by MAU.
