---
title: "Change the Office 365 ProPlus update channel for devices in your organization"
ms.author: jwhit
author: jwhit-MSFT
manager: laurawi
audience: ITPro
ms.topic: article
ms.service: o365-proplus-itpro
localization_priority: Priority
ms.collection:
- Ent_O365
- M365-modern-desktop
ms.custom: Ent_Office_ProPlus
description: "This article gives step-by-step instructions for changing the update channel for Office 365 ProPlus."
---

# Change the Office 365 ProPlus update channel for devices in your organization

> [!IMPORTANT]
> Office 365 ProPlus is being renamed to **Microsoft 365 Apps for enterprise**. To learn more about this name change, [read this blog post](https://go.microsoft.com/fwlink/p/?linkid=2120533). 
>
> For details of when this change takes effect, and what actions admins might need to take, [read this article](name-change.md).

After deploying Office 365 ProPlus, you can change the update channel with Group Policy or the Office Deployment Tool (ODT). For example, you can move a device from Semi-Annual Channel to Semi-Annual Channel (Targeted). When changing the channel, Office is updated automatically without having to reinstall or download the full version. For more information about channels, see [Overview of update channels for Office 365 ProPlus](overview-of-update-channels-for-office-365-proplus.md).  

Group Policy and the ODT are the only supported methods to change update channels. If you manage updates to Office with Configuration Manager, you can change the channel by using Group Policy or the ODT in combination with Configuration Manager. For more information, see [Change the update channel with Configuration Manager](#change-the-update-channel-with-configuration-manager).

## Change the update channel with Group Policy

1. Before you begin, make sure the scheduled task "Office Automatic Update 2.0" is enabled on the client devices. This task, which updates the assigned channel, is a required part of managing updates for Office 365 ProPlus, whether you use  Group Policy, the Office Deployment Tool, or Configuration Manager.

2. Use the [Group Policy Administrative Template files (ADMX/ADML) for Office](https://www.microsoft.com/download/details.aspx?id=49030) to enable the Group Policy setting **Update Channel** and select the new channel. The policy setting is under Computer Configuration\Policies\Administrative Templates\\Microsoft Office 2016 (Machine)\\Updates.

3. Link the updated policy to the OU with the devices whose channel you want to change.

4. By default, Group Policy refreshes in the background every 90 minutes.  If you want to refresh policy assignment immediately (for example, if you're testing in a lab environment), you can use the **gpupdate** command. For more information, see [gpupdate](https://docs.microsoft.com/windows-server/administration/windows-commands/gpupdate).

After policy has been applied, the Office Automatic Update 2.0 task must run. When that task runs, it detects the updated policy and updates the assigned channel. When the task runs again, it detects the new assigned channel and Office updates to a new build from that channel. The Office user interface on the client device will not show the updated channel until a build of Office from the new channel is installed.

## Change the update channel with the Office Deployment Tool (ODT)

1. Before you begin, make sure the scheduled task "Office Automatic Update 2.0" is enabled on the client devices. This task, which updates the assigned channel, is a required part of managing updates for Office 365 ProPlus, whether you use  Group Policy, the Office Deployment Tool, or Configuration Manager.

2. Download the latest version of the ODT (setup.exe) from the [Microsoft Download Center](https://go.microsoft.com/fwlink/p/?LinkID=626065).

3. Create a configuration file that specifies the new channel name. In the example below, the channel changes to Monthly.  For more information on channel names, see [Channel attribute in the Configuration Options article](configuration-options-for-the-office-2016-deployment-tool.md#channel-attribute-part-of-updates-element).

4. Deploy the configuration file using your standard processes.

After ODT has executed, the Office Automatic Update 2.0 task must run. The task will detect change and update channel. After the task runs again, it detects the new assigned channel and Office updates to a new build from that channel. The Office user interface on the client device will not show the updated channel until a build of Office from the new channel is installed.

### Example

```xml
    <Configuration> 
        <Updates Channel="Monthly" />
    </Configuration>
```

## Change the update channel with Configuration Manager

If you manage updates for Office 365 ProPlus with Configuration Manager, you change the update channel using Group Policy or the Office Deployment Tool, as described above. When doing so, the process is the same, except for the following considerations:

- If you use the ODT, you can package the ODT to deliver the configuration file using your standard approach for deploying and managing software with Configuration Manager.

- Make sure that the build from the new channel is available to the device through the Software Update Point in Configuration Manager.

- After the Office Automatic Update 2.0 task runs and updates the assigned channel, the new build is installed the next time the Configuration Manager client runs a Software Updates Deployment Evaluation Cycle.

> [!IMPORTANT]
> If you use Configuration Manger to manage updates, moving from a channel with a newer version of Office to a channel with an older version of Office is not supported. For example, you can't use Configuration Manager to move a device from Monthly Channel to Semi-Annual Channel.  

## Considerations when changing channels

- When moving from a channel with a higher build number to a channel with an lower build number (such as Monthly Channel to Semi-Annual Channel), binary delta compression is not applied. Because of this, the update will be larger than normal. The update, however, will not be as large as a full installation of Office 365 ProPlus.

- After a successful channel change assignment, Office 365 ProPlus must first apply a successful update in order to accept further channel changes.

- If Office has just been installed or updated, changing the update channel can take up to 24 hours after the new setting has been applied.

- The Office user interface on the client device will not reflect the updated channel until a build of Office from the new channel is installed.

- If you move from a channel with a newer version of Office to a channel with an older version of Office, any features that are only available in the newer version will be removed.
