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
description: "You probably don't want users in your organization to notice when security and other updates are applied to Microsoft 365 Apps on their computers. In most cases, they don't notice as updates are installed automatically in the background. There are times when users see notifications that updates are available or need to be applied."
ms.date: 05/21/2024
---

# End-user update notifications for Microsoft 365 Apps

You probably don't want users in your organization to notice when security and other updates are applied to Microsoft 365 Apps on their computers. In most cases, they don't notice as updates are installed automatically in the background. There are times when users see notifications that updates are available or need to be applied.
  
Updates can only be applied when Microsoft 365 apps are closed. Therefore, notifications usually appear because the user is working in an application like Outlook and hasn't closed it for several days.
  
## Notifications your users see when updates can't be applied for several days to Microsoft 365 Apps
<a name="Days"> </a>

After updates are downloaded, Microsoft 365 attempts to apply the updates. If the updates are still not applied after four days, a message appears in the notification area in Windows, telling the user that updates are available.
  
:::image type="content" source="../updates/media/end-user-update-notifications-microsoft-365-apps/office-updates-notification.png" alt-text="A screenshot of a notification indicating that Office updates are available and providing an option to install them.":::
  
The message disappears in a few seconds, but the Microsoft 365 icon stays visible in the notification area. If the user opens the message, Microsoft 365 tries to apply the updates. If any Microsoft 365 apps are currently being used, they must be closed.
  
If the updates still aren't applied after six days, a message appears in any newly opened Microsoft 365 document, reminding the user that updates are available.
  
:::image type="content" source="../updates/media/end-user-update-notifications-microsoft-365-apps/updates-available-banner.png" alt-text="A screenshot of a banner in Word indicating that updates for Office are ready to be applied but are blocked by one or more apps.":::
  
Users can choose **Update now** to apply the updates. The user is then prompted to close all open Microsoft 365 apps. After the updates are applied, the message disappears.
  
Users also see notifications if they go to **File > Account** in a Microsoft 365 app. The **Microsoft 365 and Office Updates** section turns yellow if updates are ready to be applied.
  
:::image type="content" source="../updates/media/end-user-update-notifications-microsoft-365-apps/office-updates-available.png" alt-text="A screenshot of a notification indicating that updates for Microsoft 365 and Office are ready to install.":::
  
If you don't want your users to see these types of notifications, you can [use Group Policy to hide the notifications](configure-update-settings-microsoft-365-apps.md).
  
## Notifications your users see when you set an update deadline for Microsoft 365 Apps
<a name="Deadline"> </a>

To make sure that your users apply updates to Microsoft 365 Apps, you can [configure a deadline](configure-update-settings-microsoft-365-apps.md). The deadline specifies a date and time by when the updates must be applied. If the updates aren't applied before the deadline, Microsoft 365 apps are automatically closed and the updates are applied.

> [!NOTE]
> Starting with Configuration Manager, version 1802, if any Microsoft 365 apps are running during an update enforcement, the apps will not be forced to close. Instead, the update install will return as requiring a system restart 

Users are given notifications leading up to the deadline. They see a message in the notification area in Windows, reminding them that updates are ready to be applied.
  
:::image type="content" source="../updates/media/end-user-update-notifications-microsoft-365-apps/updates-ready-applied.png" alt-text="A screenshot of a notification indicating that updates required by the system admin are blocked by one or more apps, with a specific time for Office restart.":::
  
This message appears every two hours. It's shown 60 minutes, 30 minutes, 15 minutes, and five minutes before the deadline.
  
If the deadline arrives and the updates aren't applied, users see a dialog box. This notification warns users that they have 30 minutes to save and close any work before the updates are applied. When the countdown reaches 00:00, any open Microsoft 365 apps are closed, and the updates are applied.
  
> [!NOTE]
> The **Hide update notifications** Group Policy setting doesn't hide notifications related to deadlines.
  
## Related articles
[Overview of the update process for Microsoft 365 Apps](overview-update-process-microsoft-365-apps.md)
  
[Choose how to manage updates to Microsoft 365 Apps](choose-how-manage-updates-microsoft-365-apps.md)
  
[Configure update settings for Microsoft 365 Apps](configure-update-settings-microsoft-365-apps.md)

