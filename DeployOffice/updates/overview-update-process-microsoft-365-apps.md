---
title: "Overview of the update process for Microsoft 365 Apps"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: conceptual
ms.service: o365-proplus-itpro
ms.collection: Tier1
ms.localizationpriority: medium
recommendations: false
description: "Provides an overview of the update process for Microsoft 365 Apps."
ms.date: 03/01/2023
---

# Overview of the update process for Microsoft 365 Apps

Unlike previous versions of Office, individual security updates and other updates for Microsoft 365 Apps aren't available on Windows Update. Instead, every time that updates are released, Microsoft creates an updated version of Microsoft 365 Apps and puts it on Office Content Delivery Network (CDN) on the internet. This updated version contains all the new updates, in addition to all updates from previous months. The update schedule depends on which [update channel](overview-update-channels.md) that Microsoft 365 Apps is configured to use.

For a list when updates were released for Microsoft 365 Apps, see [Update history for Microsoft 365 Apps](/officeupdates/update-history-microsoft365-apps-by-date).

To determine which version of Microsoft 365 Apps is installed on a user's computer, go to **File > Account** in any Office program. The version is listed under the **About** section. For example, in Excel, under the **About Excel** section.

> [!TIP]
> We usually recommend that you get updates automatically from the Office CDN, but you can use Windows Server Update Services (WSUS) in conjunction with Microsoft Configuration Manager to update Microsoft 365 Apps. For more information, see [Manage updates to Microsoft 365 Apps with Microsoft Configuration Manager](manage-microsoft-365-apps-updates-configuration-manager.md).

    
## Update process for Microsoft 365 Apps

There are three steps that occur automatically when the update process runs for Microsoft 365 Apps:
  
1. Detect that updates are available
2. Download the updates
3. Apply the updates
    
### Detect that updates are available for Microsoft 365 Apps

When you install Microsoft 365 Apps, a scheduled task called Office Automatic Updates 2.0 is created. This scheduled task is configured to look for updates on a regular basis. To see the schedule, open Task Scheduler on the device where Microsoft 365 Apps is installed, and then go to **Task Scheduler Library** > **Microsoft** > **Office**. On the properties of the Office Automatic Updates 2.0 task, look on the Triggers tab.
    
When the task runs, it compares the version of Microsoft 365 Apps on the computer to the version of Microsoft 365 Apps on the update location. The update location is where Office looks for updates, such as on a network share or from the internet. By default, Microsoft 365 Apps looks on the Office CDN on the internet for updates, but you can [configure the update location](configure-update-settings-microsoft-365-apps.md).
  
If there's a difference between the two versions, the update process determines which files are different and need to be updated on the local computer. After that, the next step, which is downloading the updates, starts.
  
### Download the updates for Microsoft 365 Apps

Only the files that are different are copied down to a Download folder on the local computer, and they're downloaded in a compressed form. This helps reduce the size of the download.
  
The size of the download depends on several factors, such as how many updates are being released, and which version of Microsoft 365 Apps you're updating from. For example, if you have the March version of Microsoft 365 Apps installed, and you're updating to the July version, it's likely that more files are different between those two versions, than if you're updating from the June to the July version. Therefore, the download will probably be larger.
  
> [!NOTE]
> The update process automatically uses a technology called binary delta compression to help reduce the size of the files downloaded. But, this technology is only used if you're updating from a recent version of Microsoft 365 Apps. For example, binary delta compression is used most likely if you're updating from the June to the July version, but not if you're updating from the March to the July version. 
  
If the download process is interrupted, such as by a temporary loss of network connectivity, the download resumes after the interruption, instead of restarting from the beginning. After the updates are downloaded, the computer doesn't have to be connected to the internet or the network for the updates to be applied. That's because all the files that are needed to apply the updates are already on the local computer.
  
### Apply the updates for Microsoft 365 Apps

After the compressed files are downloaded, they're uncompressed and moved from the Download folder to the Apply folder. The scheduled task then attempts to install the updates in the background, without requiring any user intervention.
  
Updates can't be applied if the Office program that has to be updated is being used by the user. If this is the case, the task tries to apply the updates the next time that the scheduled task runs. If updates can't be applied for several days, [users see a message](end-user-update-notifications-microsoft-365-apps.md) that updates are ready to install. If the user restarts the computer and updates haven't been applied, the updates are applied as Windows starts. This won't prevent the user from logging in.
  
To make sure that users apply updates, you can [configure a deadline](configure-update-settings-microsoft-365-apps.md). The deadline specifies a date and time by when the updates must be applied. If the updates aren't applied by the deadline, Office automatically closes any open Office programs and applies the updates. Users are given [notifications leading up to the deadline](end-user-update-notifications-microsoft-365-apps.md).
  
## Related articles

- [Choose how to manage updates to Microsoft 365 Apps](choose-how-manage-updates-microsoft-365-apps.md)
- [Configure update settings for Microsoft 365 Apps](configure-update-settings-microsoft-365-apps.md)
- [End-user update notifications for Microsoft 365 Apps](end-user-update-notifications-microsoft-365-apps.md)