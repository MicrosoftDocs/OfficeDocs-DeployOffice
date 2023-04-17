---
title: "Change the Microsoft 365 Apps update channel for devices in your organization"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: article
ms.service: o365-proplus-itpro
ms.collection: Tier1
ms.localizationpriority: medium
recommendations: true
description: "This article gives step-by-step instructions for changing the update channel for Microsoft 365 Apps."
ms.date: 04/17/2023
---

# Change the Microsoft 365 Apps update channel for devices in your organization

There are multiple options to switch the selected update channel for an existing Microsoft 365 Apps installation. For instance, moving a device from Semi-Annual Enterprise Channel to Monthly Enterprise Channel using group policy settings. This article covers several options to perform a channel change on a device. All use the update engine of the Microsoft 365 Apps, so the channel change happens through an update and not an uninstallation and re-installation of the apps. The following technologies are covered:

- [Group Policies](#change-the-update-channel-with-group-policy)
- [Office Deployment Tool](#change-the-update-channel-with-the-office-deployment-tool-odt)
- [Microsoft Configuration Manager](#change-the-update-channel-with-configuration-manager)
- [Intune](#change-the-update-channel-with-microsoft-intune-administrative-templates)
- [Servicing profiles](#change-the-update-channel-using-servicing-profiles)
- [Microsoft 365 admin center](#change-the-update-channel-using-the-microsoft-365-admin-center)

For more information about channels, see [Overview of update channels for Microsoft 365 Apps](overview-update-channels.md).

> [!TIP]
> If you prefer watching over reading, we have a [video on how to switch update channels](https://youtu.be/rIpoloAZnSg) ready for you.

## Change the update channel with Group Policy

1. Before you begin, make sure the scheduled task "Office Automatic Updates 2.0" is enabled on the client devices. This task, which updates the assigned channel, is a required part of managing updates for Microsoft 365 Apps, whether you use Group Policy, the Office Deployment Tool, Microsoft Configuration Manager, or Microsoft Intune.

2. Use the [Administrative Template files (ADMX/ADML) for Microsoft 365 Apps](https://www.microsoft.com/download/details.aspx?id=49030) to enable the Group Policy setting **Update Channel** and select the new channel. The policy setting is under Computer Configuration\Policies\Administrative Templates\\Microsoft Office 2016 (Machine)\\Updates.

3. Link the updated policy to the OU with the devices whose channel you want to change.

4. By default, Group Policy refreshes in the background every 90 minutes.  If you want to refresh policy assignment immediately (for example, if you're testing in a lab environment), you can use the **gpupdate** command. For more information, see [gpupdate](/windows-server/administration/windows-commands/gpupdate).

After the policy has been applied, the "Office Automatic Updates 2.0" scheduled task must run. It will detect the updated policy and update the assigned channel. When the task runs again, it detects the new assigned channel and Microsoft 365 Apps updates to a new build from that channel. The user interface on the client device won't show the updated channel until a build from the new channel is installed.

> [!NOTE]
> Above steps work for Microsoft 365 Apps for Enterprise and Microsoft 365 Apps for Business. Normally, Microsoft 365 Apps for Business cannot be configured using group policies, but the update channel setting is an exception.

## Change the update channel with the Office Deployment Tool (ODT)

1. Before you begin, double-check these items:
   - Make sure the scheduled task "Office Automatic Updates 2.0" is enabled on the client devices. This task, which updates the assigned channel, is a required part of managing updates for Microsoft 365 Apps, whether you use  Group Policy, the Office Deployment Tool, Configuration Manager, or Intune.
   - Make sure that the update channel for the targeted device isn't set through Group Policy. Otherwise, the policy setting will take precedence over the Office Deployment Tool setting and the device will stay on the channel specified by the policy setting. In such case, either remove the policy setting from the device or use [Group Policy to change the channel](#change-the-update-channel-with-group-policy).

2. Download the latest version of the ODT (setup.exe) from the [Microsoft Download Center](https://go.microsoft.com/fwlink/p/?LinkID=626065).

3. Create a configuration file that specifies the new channel name. In the example below, the channel changes to Current Channel.  For more information on channel names, see [Channel attribute in the Configuration Options article](../office-deployment-tool-configuration-options.md#channel-attribute-part-of-updates-element).

4. Deploy the configuration file using your standard processes.

After the ODT has executed, the "Office Automatic Updates 2.0" scheduled task must run. The task will detect the change and update the channel. When the task runs again, it detects the new assigned channel and Office updates to a new build from that channel. The Office user interface on the client device won't show the updated channel until a build of Office from the new channel is installed.

### Example

```xml
    <Configuration> 
        <Updates Channel="Current" />
    </Configuration>
```

## Change the update channel with Configuration Manager

If you manage updates for Microsoft 365 Apps with Configuration Manager, you change the update channel using Group Policy or the Office Deployment Tool, as described above. When doing so, the process is the same, except for the following considerations:

- If you use the ODT, you can package the ODT to deliver the configuration file using your standard approach for deploying and managing software with Configuration Manager.

- Make sure that the build from the new channel is available to the device through the Software Update Point in Configuration Manager.

- After the Office Automatic Updates 2.0 task runs and updates the assigned channel, the new build is installed the next time the Configuration Manager client runs a Software Updates Deployment Evaluation Cycle.

> [!IMPORTANT]
> If you use Configuration Manager to manage updates, moving from a channel with a newer version of Office to a channel with an older version of Office is not supported. For example, you can't use Configuration Manager to move a device from Current Channel to Semi-Annual Enterprise Channel.  

## Change the update channel with Microsoft Intune Administrative Templates 

1. Before you begin, make sure the scheduled task "Office Automatic Updates 2.0" is enabled on the client devices. This task, which updates the assigned channel, is a required part of managing updates for Microsoft 365 Apps, whether you use Group Policy, the Office Deployment Tool, Configuration Manager, or Intune.

2. Use [administrative templates for Windows 10 and newer in Microsoft Intune](/mem/intune/configuration/administrative-templates-windows) to enable the setting **Update Channel (2.0)** and select the new channel. The policy setting is under Computer Configuration\Microsoft Office 2016 (Machine)\Updates.

3. Assign the configuration profile to the Azure AD security group with the devices whose channel you want to change.

4. By default, Intune policies refresh in the background every 8 hours. Actions such as assigning a new profile will immediately notify the device to check in. If you want to refresh policy assignment immediately (for example, if you're testing in a lab environment), from the device, select **Start** > **Settings** > **Accounts** > **Access work or school** > *{Select your account}* > **Info** > **Sync**. For more information, see [Sync your Windows device manually](/mem/intune/user-help/sync-your-device-manually-windows).

5. After the policy is synced to the device from Intune, you can validate that whether the policy has actually come to the device or not by looking in the registry. Open the Registry Editor and navigate to HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\office\16.0\common\officeupdate. Policies which are pushed from Intune for Office can be seen in this registry location. For more information, [refer to this article](/mem/intune/configuration/administrative-templates-update-office).

After the policy has been applied, the "Office Automatic Updates 2.0" scheduled task must run. It will detect the updated policy and update the assigned channel. When the task runs again, it detects the new assigned channel and Microsoft 365 Apps updates to a new build from that channel. The user interface on the client device won't show the updated channel until a build from the new channel is installed.

> [!NOTE]
> If you are deploying Microsoft 365 Apps with Intune using the [Microsoft 365 Apps for Windows 10 and later](/mem/intune/apps/apps-add-office365) app, the channel you select will be re-evaluated and enforced during policy refresh. It is recommended that any update channel policies in your environment match the channel selection for your app assignment. If the channels do not match, this will cause unexpected channel flipping under the following circumstances:
>   - Deploying Microsoft 365 Apps using the Microsoft 365 Apps for Windows 10 and later app.
>   - The app is configured using the Configuration designer.
>   - The app is assigned as required.

## Change the update channel using servicing profiles

If you want to switch devices to the Monthly Enterprise channel, you can use a servicing profile. Servicing profiles is a cloud-based update management solution for the Microsoft 365 Apps. Once configured, it keeps targeted installations current. If a targeted device is on a different channel, it will automatically be migrated to the [Monthly Enterprise Channel](overview-update-channels.md#monthly-enterprise-channel-overview).

[!NOTE]
> Once activated, Servicing profiles will move all in-scope installations to the latest Monthly Enterprise Channel release and keep devices updated going forward. If you want to change to an update channel other than Monthly Enterprise Channel or not use a cloud-service to keep your devices updated, consider using one of the other options given in this article.

Here are the steps for changing the update channel to Monthly Enterprise Channel using a servicing profile:

1. Review the guidance on [Adopting servicing profiles](../fieldnotes/adopt-servicing-profiles.md).
2. If not done already, log into the [Microsoft 365 Apps admin center](https://config.office.com) and set up a servicing profile as described in the guide.
2. After the initial configuration of the servicing profile, navigate to **Servicing**, **Monthly Enterprise**, **Settings**, **Device selection criteria**.
3. Select the **Channel** you want to move to Monthly Enterprise Channel.
4. Click **Save**.

All Microsoft 365 Apps installations which match all set selection criteria will be updated by servicing profiles. If installations are on a channel other than Monthly Enterprise, a channel change will be triggered. Next time the device syncs with the service, the new update channel configuration will be sent to the device. Next, the "Office Automatic Updates 2.0" scheduled task must run. It will detect the updated configuration and update the assigned channel. When the task runs again, it detects the new assigned channel and Microsoft 365 Apps updates to a new build from that channel. The user interface on the client device won't show the updated channel until a build from the new channel is installed.

## Change the update channel using the Microsoft 365 admin center

You can use the Microsoft 365 installation options page in the [Microsoft 365 admin center](https://admin.microsoft.com) to set the default update channel for Microsoft 365 Apps. Unmanaged installations will then switch to the new default channel automatically.  

Managed installations are not affected by this setting. For a full break-down of which devices the Microsoft 365 admin center setting will target, please see [Manage Microsoft 365 installation options in the Microsoft 365 admin center](../manage-software-download-settings-office-365.md). 

Depending on your scenario, you can use the Microsoft 365 admin center along with other options described in this article. E.g., you could set up the Microsoft 365 admin center to keep all unmanaged devices on Current Channel, while using Intune to move and keep managed devices to Monthly Enterprise Channel. 

Here are the steps for setting the default update channel: 

1. Log into the [Microsoft 365 admin center](https://admin.microsoft.com) and open **Settings**, then click on **Org Settings**. 
2. Open the **Microsoft 365 installation options**. 
3. Select the desired channel and click on **Save**. 

Next time the Microsoft 365 Apps check for available updates, the new update channel configuration is sent to the device. Next, it will download the latest update from the new channel and install it. The user experience is like a regular update when it comes to notifications and prompts. 

## Considerations when changing channels

> [!Tip]
> When choosing how you want to deliver updates to your organization, we highly recommend using Monthly Enterprise Channel with a servicing profile. By using a servicing profile, you’ll automatically deliver monthly Office updates for specific users or groups in waves, limiting the impact on your network. For more information, see [Overview of servicing profile in the Microsoft 365 Apps admin center](../admincenter/servicing-profile.md).

- When moving from a channel with a higher build number to a channel with a lower build number (such as Current Channel to Semi-Annual Enterprise Channel), binary delta compression isn't applied. Because of this, the update will be larger than normal. The update, however, won't be as large as a full installation of Microsoft 365 Apps.
- Devices must be able to fetch an update from the newly assigned channel to complete the transition.
   - If your devices are receiving updates from the internet, you're all set, and no other changes are required.
   - If you're using Configuration Manager to deploy updates, make sure that an update from the newly assigned channel has been deployed to the devices. We recommend using [dynamic collections](../fieldnotes/build-dynamic-lean-configuration-manager.md#catch-devices-running-microsoft-365-apps) for easier targeting. Devices will only download the required updates, so it's safe to assign updates from multiple channels to a device.
   - If you're using file shares, you must download and host the matching update in a new location/folder. Use the **Update Path** group policy setting or the Office Deployment Tool to point devices at the new location. 

- After a successful channel change assignment, Microsoft 365 Apps must first apply a successful update in order to accept further channel changes.

- If Microsoft 365 Apps has just been installed or updated, changing the update channel can take up to 24 hours after the new setting has been applied.

- The user interface on the client device won't reflect the updated channel until a build from the new channel is installed.

- If you move from a channel with a newer version of Microsoft 365 Apps to a channel with an older version, any features that are only available in the newer version will be removed.
