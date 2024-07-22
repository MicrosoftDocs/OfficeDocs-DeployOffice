---
title: "Set a deadline for updates from Microsoft AutoUpdate"
ms.author: geokri
author: nicholasswhite
ms.reviewer: ppark
manager: dougeby
audience: ITPro
ms.topic: conceptual
ms.service: o365-proplus-itpro
ms.subservice: office-mac
ms.localizationpriority: medium
ms.collection: Tier2
recommendations: false
description: "Provides admins with information about how to set a deadline for updates provided from Microsoft AutoUpdate (MAU)"
ms.date: 03/01/2023
---

# Set a deadline for updates from Microsoft AutoUpdate

Starting with version 4.13 of Microsoft AutoUpdate (MAU), you can set a deadline for when updates are required to be installed on a user’s Mac. Version 4.13 was released on July 18, 2019.

Users will receive notifications about the upcoming deadline and can temporarily postpone the updates from being installed. But once the deadline is reached, any applications the user has open will be closed and the updates applied.

## Options for setting a deadline

You can set a deadline for any of the following applications:

- An individual application, such as just Word.
- A group of applications, such as Word, Excel, and PowerPoint.
- All Microsoft applications that are updated by MAU. For example, Skype for Business, Remote Desktop, and Microsoft Defender Advanced Threat Protection (ATP).

The default is for the deadline to apply to all applications that receive updates from MAU.

When you specify a deadline, you can configure the deadline in either of these two ways:
- A specific date and time
- A certain number of days after the update is detected

If you use a specific date and time for the deadline, it’s tied to a specific version that you’re updating to. That means for the next set of updates that Microsoft releases, you would need to configure a new date and time for the deadline.

If you use a certain number of days for the deadline, you can reuse that deadline for future updates that Microsoft releases. The number of days is calculated from when an update is detected by MAU.

You can also configure how many days in advance of the deadline that Automatic Download and Install mode begins. This is optional and the default is three days (72 hours) before the deadline.

## Preference settings for deadlines

The following are the preference settings for configuring a deadline. These keys are CFPreferences-compatible, which means that they can be set by using enterprise management software for Mac, such as Jamf Pro.

> [!NOTE]
> A deadline can be set within the user configuration profile or the management configuration profile. Settings in the management configuration profile take precedence, because those settings are also written to the user configuration profile.

### Configure a deadline for a certain number of days after the update is detected

To configure a deadline that is a certain number of days after the update is detected, use the following preference setting.

|Category|Details|
|:-----|:-----|
|**Domain** | com.microsoft.autoupdate2  |
|**Key**  |UpdateDeadline.DaysBeforeForcedQuit  |
|**Data Type** |Integer  |
|**Possible values**  |*various  (example: 5)* |
|**Comments** | There is no default value. |

For example, if you want to configure a deadline of five days after an update for Excel is detected, you can use the following:

```xml
<key>Applications</key>
<dict> 
  <key>/Applications/Microsoft Excel.app</key>
  <dict>
   <key>Application ID</key>
   <string>XCEL2019</string>
   <key>LCID</key>
   <integer>1033</integer>
   <key>UpdateDeadline.DaysBeforeForcedQuit</key>
   <integer>5</integer>
  </dict>
</dict>
```

If you want to configure a deadline of four days for Excel and seven days for PowerPoint, you can use the following:

```xml
<key>Applications</key>
<dict>
  <key>/Applications/Microsoft Excel.app</key>
  <dict>
    <key>Application ID</key>
    <string>XCEL2019</string>
    <key>LCID</key>
    <integer>1033</integer>
    <key>UpdateDeadline.DaysBeforeForcedQuit</key>
    <integer>4</integer>
  </dict>
  <key>/Applications/Microsoft PowerPoint.app</key>
  <dict>
   <key>Application ID</key>
   <string>PPT32019</string>
   <key>LCID</key>
   <integer>1033</integer>
   <key>UpdateDeadline.DaysBeforeForcedQuit</key>
   <integer>7</integer>
  </dict>
</dict>
```

### Configure a deadline for a specific date and time

To configure a deadline for a specific date and time, use the following preference setting.

|Category|Details|
|:-----|:-----|
|**Domain** | com.microsoft.autoupdate2  |
|**Key**  |UpdateDeadline.ApplicationsForcedUpdateSchedule   |
|**Data Type** |Dictionary  |
|**Possible values**  |*various (see examples below)*|
|**Comments** | There is no default value. <br/><br/> The date and time value should be specified in UTC format. |

For example, if you want to configure a specific date and time for a deadline for an Excel update, you can use the following:

```xml
<key>UpdateDeadline.ApplicationsForcedUpdateSchedule</key>
<dict> 
  <key>/Applications/Microsoft Excel.app</key> 
  <dict> 
    <key>Application ID</key> 
    <string>XCEL2019</string> 
    <key>ForcedUpdateDate</key> 
    <date>2019-07-23T20:01:20Z</date> 
    <key>ForcedUpdateVersion</key> 
    <string>16.27.19071500</string> 
  </dict> 
</dict> 
```

If you want to configure a specific date and time for a deadline for Word and Outlook, you can use the following:

```xml
<key>UpdateDeadline.ApplicationsForcedUpdateSchedule</key>
<dict>
  <key>/Applications/Microsoft Word.app</key>
  <dict>
    <key>Application ID</key>
    <string>MSWD2019</string>
    <key>ForcedUpdateDate</key>
    <date>2019-07-25T20:01:20Z</date>
    <key>ForcedUpdateVersion</key>
    <string>16.27.19071500</string>
  </dict>
  <key>/Applications/Microsoft Outlook.app</key>
  <dict>
    <key>Application ID</key>
    <string>OPIM2019</string>
    <key>ForcedUpdateDate</key>
    <date>2019-08-01T20:01:20Z</date>
    <key>ForcedUpdateVersion</key>
    <string>16.27.19071500</string>
  </dict>
</dict>
```

### Configure Automatic Download and Install mode

To configure how many days in advance of the deadline that Automatic Download and Install mode begins, use the following preference setting.

|Category|Details|
|:-----|:-----|
|**Domain** | com.microsoft.autoupdate2  |
|**Key**  |UpdateDeadline.StartAutomaticUpdates  |
|**Data Type** |Integer  |
|**Possible values**  |*various (example: 2)* |
|**Comments** | This is an optional setting. <br/><br/>The default value is 3. <br/><br/> Using this preference setting will enable Automatic Download and Install mode for MAU regardless of the current MAU setting on the device. After the deadline is reached, MAU will revert to the previous setting on the device.

For example, if you want to configure Automatic Download and Install mode to being two days before the deadline, you can use the following.

```xml
<key>UpdateDeadline.StartAutomaticUpdates</key> 
 <integer>2</integer>
```

## Deadline notifications for users

After Automatic Download and Install mode is turned on, MAU automatically updates any applications that are closed.

If applications are open and can't be updated, then users see a notification about the upcoming deadline. At that point, users can save their work, close their open applications, and have MAU apply the updates. If users do that, they won't see any more notifications about the deadline for those applications.

If users don't want to apply the updates at that time, they can postpone the updates. If they choose to postpone, they will receive other notifications at a later time reminding them about the deadline. For example, with the first notification, users can choose to be reminded again in a certain number of hours. But users can't postpone the updates beyond the deadline.

When the deadline is an hour away, users get a persistent notification along with a timer that counts down the minutes until the deadline. If the deadline arrives and users haven't saved their work and closed their applications, MAU will forcibly close the applications, without saving the data, and starts to apply the updates.

You can provide additional grace time for users by setting a preference for the deadline timer. The default is 60 minutes. For example, if you want the countdown to start at 3 hours, you can set the value to 180 minutes. 

|Category|Details|
|:-----|:-----|
|**Domain** | com.microsoft.autoupdate2  |
|**Key**  |UpdateDeadline.FinalCountDown  |
|**Data Type** |Integer  |
|**Possible values**  |*10 - 720* |
|**Comments** | This is an optional setting. <br/><br/>The default value is 60. <br/><br/> Use of this preference requires Microsoft AutoUpdate version 4.51 and later.

## Turn off a deadline

If you have set a deadline in the management configuration profile, you should turn off the deadline by setting empty values in your management configuration profile, as shown in the following example.

```xml
<key>UpdateDeadline.DaysBeforeForcedQuit</key>
<integer>0</integer>
<key>UpdateDeadline.StartAutomaticUpdates</key>
<integer>0</integer>
```

If you just delete the management configuration profile, the deadline isn't actually turned off. That's because the deadline settings still exist in the user configuration profile, because the settings were originally written to the user configuration profile from the management configuration profile.

If you configured a [deadline for a specific date and time](#configure-a-deadline-for-a-specific-date-and-time), once that date and time have passed, MAU deletes those values from the relevant config profiles.

## Additional information about MAU deadlines

- Deadlines can be configured regardless of where MAU is looking for the updates. For example, deadlines work if MAU is getting updates directly from the Office Content Delivery Network (CDN) on the internet or if MAU is getting updates from a MAU caching server within your local network.
- If you have configured the deadline to be a certain number of days after an update is detected, and then MAU detects a new update, the deadline will be reset to apply to the new update.
- If you have specified a deadline for all applications, you can still configure a more specific deadline for one of the applications. For example, you can configure a deadline of seven days for all applications, and then specify that the deadline for Excel is four days.
- Instead of configuring a specific date and time for a deadline for a specific version, you can configure that deadline to be a certain number of days after that specific version is detected by MAU.
- If no values are set for UpdateDeadline.DaysBeforeForcedQuit or UpdateDeadline.StartAutomaticUpdates in the user configuration profile or management configuration profile, macOS automatically generates and inserts empty values for those keys in the user configuration profile. This does not set any deadlines.
