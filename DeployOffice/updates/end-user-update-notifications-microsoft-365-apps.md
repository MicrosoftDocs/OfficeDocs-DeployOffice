---
title: "End-user update notifications for Microsoft 365 Apps"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: conceptual
ms.service: o365-proplus-itpro
ms.collection: Tier1
ms.localizationpriority: medium
recommendations: false
description: "You probably don't want users in your organization to notice when security and other updates are applied to Microsoft 365 Apps on their computers. In most cases, they won't notice as the updates are installed automatically in the background. But, you should be aware that there are times when users see notifications that updates are available or need to be applied."
ms.date: 03/01/2023
---

# End-user update notifications for Microsoft 365 Apps

You probably don't want users in your organization to notice when security and other updates are applied to Microsoft 365 Apps on their computers. In most cases, they won't notice as the updates are installed automatically in the background. But, you should be aware that there are times when users see notifications that updates are available or need to be applied.
  
Updates can only be applied when Microsoft 365 apps aren't running. Therefore, notifications usually appear because the user is working in an application such as Outlook, and hasn't closed it in several days.
  
## Notifications your users see when updates can't be applied for several days to Microsoft 365 Apps
<a name="Days"> </a>

After updates are downloaded, Microsoft 365 attempts to apply the updates. If the updates are still not applied after four days, a message appears in the notification area in Windows, telling the user that updates are available.
  
!["Office updates are available" notification shown on the taskbar](../images/a5ed310f-432c-49de-a810-38962b552531.jpg)
  
The message disappears in a few seconds, but the Microsoft 365 icon stays visible in the notification area. If the user opens the message, Microsoft 365 tries to apply the updates. If any Microsoft 365 apps are currently being used, they must be closed.
  
If the updates still aren't applied after six days, a message appears in any newly opened Microsoft 365 document, reminding the user that updates are available.
  
![Updates are available, but are blocked by one or more apps.](../images/93bc2d5b-4955-4369-bf3b-5beb0b3ff705.jpg)
  
Users can choose **Update now** to apply the updates. The user is then prompted to close all open Microsoft 365 apps. After the updates are applied, the message disappears.
  
Users also see notifications if they go to **File > Account** in a Microsoft 365 app. The **Microsoft 365 and Office Updates** section turns yellow if updates are ready to be applied.
  
![Updates available notification that is shown under File > Account > Update Options.](../images/574a065f-f666-481f-b2f7-5cc56d7c97f9.jpg)
  
If you don't want your users to see these types of notifications, you can [use Group Policy to hide the notifications](configure-update-settings-microsoft-365-apps.md).
  
## Notifications your users see when you set an update deadline for Microsoft 365 Apps
<a name="Deadline"> </a>

To make sure that your users apply updates to Microsoft 365 Apps, you can [configure a deadline](configure-update-settings-microsoft-365-apps.md). The deadline specifies a date and time by when the updates must be applied. If the updates aren't applied by the deadline, Microsoft 365 apps are automatically closed and the updates are applied.

> [!NOTE]
> Starting with Configuration Manager, version 1802, if any Microsoft 365 apps are running during an update enforcement, the apps will not be forced to close. Instead, the update install will return as requiring a system restart 

Users are given notifications leading up to the deadline. They see a message in the notification area in Windows, reminding them that updates are ready to be applied.
  
![Office updates 12 hour deadline notification.](../images/6c315397-3f15-4c9f-86b1-5132c28dbc7e.jpg)
  
This message appears every two hours. It will also be shown 60 minutes, 30 minutes, 15 minutes, and 5 minutes before the deadline.
  
If the deadline arrives and the updates haven't been applied, users see a dialog box. This box warns them that they have 30 minutes before the updates are applied. This gives users 30 minutes to save and close any work. When the countdown reaches 00:00, any open Microsoft 365 apps are closed, and the updates are applied.
  
> [!NOTE]
> The **Hide update notifications** Group Policy setting doesn't hide notifications related to deadlines.
  
## Related topics
[Overview of the update process for Microsoft 365 Apps](overview-update-process-microsoft-365-apps.md)
  
[Choose how to manage updates to Microsoft 365 Apps](choose-how-manage-updates-microsoft-365-apps.md)
  
[Configure update settings for Microsoft 365 Apps](configure-update-settings-microsoft-365-apps.md)

