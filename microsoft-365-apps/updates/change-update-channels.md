---
title: "Change the Microsoft 365 Apps update channel for devices in your organization"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: conceptual
ms.service: o365-proplus-itpro
ms.collection: Tier1
ms.localizationpriority: medium
recommendations: true
description: "This article gives step-by-step instructions for changing the update channel for Microsoft 365 Apps."
ms.date: 03/25/2024
---

# Change the Microsoft 365 Apps update channel for devices in your organization

There are multiple options to switch the selected update channel for an existing Microsoft 365 Apps installation. For instance, moving a device from Semi-Annual Enterprise Channel to Monthly Enterprise Channel using group policy settings. This article covers several options to perform a channel change on a device. All use the update engine of the Microsoft 365 Apps, so the channel change happens through an update and not an uninstallation and reinstallation of the apps. The following technologies are covered:

- [Group Policies](#change-the-update-channel-with-group-policy)
- [Office Deployment Tool](#change-the-update-channel-with-the-office-deployment-tool-odt)
- [Microsoft Configuration Manager](#change-the-update-channel-with-configuration-manager)
- [Intune](#change-the-update-channel-with-microsoft-intune-administrative-templates)
- [Microsoft 365 Apps admin center](#change-the-update-channel-using-the-microsoft-365-apps-admin-center)
- [Microsoft 365 admin center](#change-the-update-channel-using-the-microsoft-365-admin-center)

For more information about channels, see [Overview of update channels for Microsoft 365 Apps](overview-update-channels.md).

> [!TIP]
> If you prefer watching over reading, we have a [video on how to switch update channels](https://youtu.be/rIpoloAZnSg) ready for you.

## Change the update channel with Group Policy

1. Before you begin, make sure the scheduled task "Office Automatic Updates 2.0" is enabled on the client devices. This task, which updates the assigned channel, is a required part of managing updates for Microsoft 365 Apps, whether you use Group Policy, the Office Deployment Tool, Microsoft Configuration Manager, or Microsoft Intune.

2. Use the [Administrative Template files (ADMX/ADML) for Microsoft 365 Apps](https://www.microsoft.com/download/details.aspx?id=49030) to enable the Group Policy setting **Update Channel** and select the new channel. The policy setting is under Computer Configuration\Policies\Administrative Templates\\Microsoft Office 2016 (Machine)\\Updates.

3. Link the updated policy to the OU with the devices whose channel you want to change.

4. By default, Group Policy refreshes in the background every 90 minutes.  If you want to refresh policy assignment immediately (for example, if you're testing in a lab environment), you can use the **gpupdate** command. For more information, see [gpupdate](/windows-server/administration/windows-commands/gpupdate).

After the policy is applied, the "Office Automatic Updates 2.0" scheduled task must run. It detects the updated policy and updates the assigned channel. When the task runs again, it detects the new assigned channel and Microsoft 365 Apps updates to a new build from that channel. The client device's user interface will display the updated channel only after installing a build from the new channel.

> [!NOTE]
> Above steps work for Microsoft 365 Apps for Enterprise and Microsoft 365 Apps for Business. Normally, Microsoft 365 Apps for Business cannot be configured using group policies, but the update channel setting is an exception.

## Change the update channel with the Office Deployment Tool (ODT)

1. Before you begin, double-check these items:
   - Make sure the scheduled task "Office Automatic Updates 2.0" is enabled on the client devices. This task, which updates the assigned channel, is a required part of managing updates for Microsoft 365 Apps, whether you use Group Policy, the Office Deployment Tool, Configuration Manager, or Intune.
   - Make sure that the update channel for the targeted device isn't set through Group Policy. Otherwise, the policy setting takes precedence over the Office Deployment Tool setting and the device stays on the channel specified by the policy setting. In such case, either remove the policy setting from the device or use [Group Policy to change the channel](#change-the-update-channel-with-group-policy).

2. Download the latest version of the ODT (setup.exe) from the [Microsoft Download Center](https://go.microsoft.com/fwlink/p/?LinkID=626065).

3. Create a configuration file that specifies the new update channel. In the example, the channel changes to Current Channel. For other update channels, look up the [channel attribute in the Configuration Options article](../office-deployment-tool-configuration-options.md#channel-attribute-part-of-updates-element).

4. Deploy the Office Deployment Tool with the newly created configuration file using your standard processes. It must run the "setup.exe /configure yourconfigfile.xml" command to inject the update channel setting into the system. No requirement to close the Microsoft 365 Apps first, as only the stored configuration settings are changed.

After the ODT executes, the "Office Automatic Updates 2.0" scheduled task must run. The task detects the change and update the channel. When the task runs again, it detects the new assigned channel and Microsoft 365 Apps updates to a new build from that channel. The client device's user interface will display the updated channel only after installing a build from the new channel.

### Example

```xml
    <Configuration> 
        <Updates Channel="Current" />
    </Configuration>
```

## Change the update channel with Configuration Manager

If you manage updates for Microsoft 365 Apps with Configuration Manager, you change the update channel using Group Policy or the Office Deployment Tool, as previously described. When doing so, the process is the same, except for the following considerations:

- If you use the ODT, you can package the ODT to deliver the configuration file using your standard approach for deploying and managing software with Configuration Manager.

- Make sure that the build from the new channel is available to the device through the Software Update Point in Configuration Manager.

- After the Office Automatic Updates 2.0 task runs and updates the assigned channel, the new build is installed the next time the Configuration Manager client runs a Software Updates Deployment Evaluation Cycle.

> [!IMPORTANT]
> If you use Configuration Manager to manage updates, moving from a channel with a newer version of Microsoft 365 Apps to a channel with an older version is not supported. For example, you can't use Configuration Manager to move a device from Current Channel to Semi-Annual Enterprise Channel.  

## Change the update channel with Microsoft Intune Administrative Templates 

1. Before you begin, make sure the scheduled task "Office Automatic Updates 2.0" is enabled on the client devices. This task, which updates the assigned channel, is a required part of managing updates for Microsoft 365 Apps, whether you use Group Policy, the Office Deployment Tool, Configuration Manager, or Intune.

2. Use [administrative templates for Windows 10 and newer in Microsoft Intune](/mem/intune/configuration/administrative-templates-windows) to enable the setting **Update Channel (2.0)** and select the new channel. The policy setting is under Computer Configuration\Microsoft Office 2016 (Machine)\Updates.

3. Assign the configuration profile to the Microsoft Entra security group with the devices whose channel you want to change.

4. By default, Intune policies refresh in the background every 8 hours. Actions such as assigning a new profile immediately notifies the device to check in. If you want to refresh policy assignment immediately (for example, if you're testing in a lab environment), from the device, select **Start** > **Settings** > **Accounts** > **Access work or school** > *{Select your account}* > **Info** > **Sync**. For more information, see [Sync your Windows device manually](/mem/intune/user-help/sync-your-device-manually-windows).

5. After the policy is synced to the device from Intune, validate that the policy is on the device by looking in the registry. Open the Registry Editor and navigate to HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\office\16.0\common\officeupdate. Policies that are pushed from Intune can be seen in this registry location. For more information, see [Use Update Channel and Target Version settings to update Microsoft 365 with Microsoft Intune Administrative Templates](/mem/intune/configuration/administrative-templates-update-office).

After the policy is applied, the "Office Automatic Updates 2.0" scheduled task must run. It detects the updated policy and update the assigned channel. When the task runs again, it detects the new assigned channel and Microsoft 365 Apps updates to a new build from that channel. The client device's user interface will display the updated channel only after installing a build from the new channel.

> [!NOTE]
> If you are deploying Microsoft 365 Apps with Intune using the [Microsoft 365 Apps for Windows 10 and later](/mem/intune/apps/apps-add-office365) app, the channel you select will be re-evaluated and enforced during policy refresh. It is recommended that any update channel policies in your environment match the channel selection for your app assignment. If the channels do not match, this will cause unexpected channel flipping when all of the following circumstances apply:
>   - Deploying Microsoft 365 Apps using the Microsoft 365 Apps for Windows 10 and later app.
>   - The app is configured using the Configuration designer.
>   - The app is assigned as required.

## Change the update channel using the Microsoft 365 Apps admin center

If you want to switch devices to Current Channel or Monthly Enterprise Channel, you can use the Microsoft 365 Apps admin center. In contrast to using the [Microsoft 365 admin center](#change-the-update-channel-using-the-microsoft-365-admin-center), the Apps admin center allows you to trigger a channel change for unmanaged and managed devices.

If you prefer watching over reading, view [How to trigger an update channel change for devices in the Microsoft 365 Apps admin center](https://youtu.be/tFmktdQsKgY).

Here are the steps for changing the update channel to Current Channel or Monthly Enterprise Channel:

1. Log into the [Microsoft 365 Apps admin center](https://config.office.com). Review the [requirements](../admin-center/overview.md#requirements) for eligible admin roles.
1. Navigate to **Inventory**, select **Show all devices** and then the **Switch device update channel** button on the top.
1. Select which devices should be moved and the targeted update channel.
    - You can enter device names or Microsoft Entra ID groups, or a mix of both.
    - For Entry ID groups, groups can be nested up to three levels down and contain a mix of device and user objects.
1. Select **Move devices** to initiate the channel change.

> [!NOTE]
> - It might take up to 24 hours for the channel change to be completed by the device, assuming devices are online and can connect to the service.
> - A channel change is a point-in-time activity. If you are using Microsoft Entra ID groups and add devices or users to the group after initiating a channel change, those devices will not be moved automatically. You will have to initiate the channel change again. There's no need to remove already switched devices from the group.
> - Microsoft recommends to also enable [Cloud Update](../admin-center/cloud-update.md) for automated update deployment.

## Change the update channel using the Microsoft 365 admin center

You can use the Microsoft 365 installation options page in the [Microsoft 365 admin center](https://admin.cloud.microsoft) to set the default update channel for Microsoft 365 Apps. Unmanaged installations switch to the new default channel automatically.  

This setting doesn't affect managed installations. For a full break-down of which devices the Microsoft 365 admin center setting target, see [Manage Microsoft 365 installation options in the Microsoft 365 admin center](../manage-software-download-settings-office-365.md). 

Depending on your scenario, you can use the Microsoft 365 admin center along with other options described in this article. For example, you could set up the Microsoft 365 admin center to keep all unmanaged devices on Current Channel, while using Intune to move and keep managed devices to Monthly Enterprise Channel. 

Here are the steps for setting the default update channel: 

1. Log into the [Microsoft 365 admin center](https://admin.cloud.microsoft) and open **Settings**, then select **Org Settings**. 
2. Open the **Microsoft 365 installation options**. 
3. Select the desired channel, then **Save**. 

Next time the Microsoft 365 Apps check for available updates, the new update channel configuration is sent to the device. Next, it downloads the latest update from the new channel and installs it. The user experience is like a regular update when it comes to notifications and prompts. 

## Considerations when changing channels

> [!Tip]
> When switching to Current channel or Monthly Enterprise Channel, we recommend using [cloud update](../admin-center/cloud-update.md) to keep devices current.

- If you switch from a channel like Current Channel, which has a higher build number, to a channel like Semi-Annual Enterprise Channel, with a lower build number, binary delta compression doesn't apply. Because binary delta compression doesn't apply, the update size is larger than normal. The update, however, isn't as large as a full installation of Microsoft 365 Apps.
- Devices must be able to fetch an update from the newly assigned channel to complete the transition.
   - If your devices are receiving updates from the internet, you're all set, and no other changes are required.
   - If you're using Configuration Manager to deploy updates, make sure that an update from the newly assigned channel was deployed to the devices. We recommend using [dynamic collections](../best-practices/build-dynamic-lean-configuration-manager.md#catch-devices-running-microsoft-365-apps) for easier targeting. Devices only download the required updates, so it's safe to assign updates from multiple channels to a device.
   - If you're using file shares, you must download and host the matching update in a new location/folder. Use the **Update Path** group policy setting or the Office Deployment Tool to point devices at the new location. 
- After a successful channel change assignment, Microsoft 365 Apps must first apply a successful update in order to accept further channel changes.
- If Microsoft 365 Apps was recently installed or updated, changing the update channel can take up to 24 hours after the new setting was applied.
- The client device's user interface will display the updated channel only after installing a build from the new channel.
- Moving from a channel with a newer version of Microsoft 365 Apps to a channel with an older version removes features exclusive to the newer version.
- Review how Microsoft 365 Apps determines which update channel to apply:

Priority|Management Type|Registry Value|Registry Path
---|---|---|---
1st|Cloud Update|UpdatePath|HKLM\SOFTWARE\Policies\Microsoft\cloud\office\16.0\Common\officeupdate
2nd|Cloud Update|UpdateBranch|HKLM\SOFTWARE\Policies\Microsoft\cloud\office\16.0\Common\officeupdate
3rd|Policy Setting|UpdatePath|HKLM\SOFTWARE\Policies\Microsoft\office\16.0\Common\officeupdate
4th|Policy Setting|UpdateBranch|HKLM\SOFTWARE\Policies\Microsoft\office\16.0\Common\officeupdate
5th|ODT|UpdateUrl or UpdatePath|HKLM\SOFTWARE\Microsoft\office\ClickToRun\Configuration
6th|Unmanaged|UnmanagedUpdateURL|HKLM\SOFTWARE\Microsoft\office\ClickToRun\Configuration
7th|Unmanaged|CDNBaseUrl|HKLM\SOFTWARE\Microsoft\office\ClickToRun\Configuration
