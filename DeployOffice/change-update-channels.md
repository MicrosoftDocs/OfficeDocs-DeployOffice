---
title: "Change the Microsoft 365 Apps update channel for devices in your organization"
ms.author: danbrown
author: DHB-MSFT
manager: dougeby
audience: ITPro
ms.topic: article
ms.service: o365-proplus-itpro
ms.localizationpriority: medium
ms.collection:
- Ent_O365
- M365-modern-desktop
- m365initiative-coredeploy
ms.custom: Ent_Office_ProPlus
recommendations: true
description: "This article gives step-by-step instructions for changing the update channel for Microsoft 365 Apps."
---

# Change the Microsoft 365 Apps update channel for devices in your organization

After deploying Microsoft 365 Apps, you can change the update channel with Group Policy or the Office Deployment Tool (ODT). For example, you can move a device from Semi-Annual Enterprise Channel to Monthly Enterprise Channel. When changing the channel, Office is updated automatically without having to reinstall or download the full version. For more information about channels, see [Overview of update channels for Microsoft 365 Apps](overview-update-channels.md).  

Group Policy and the ODT are the only supported methods to change update channels. If you manage updates to Office with Configuration Manager, you can change the channel by using Group Policy or the ODT in combination with Configuration Manager. For more information, see [Change the update channel with Configuration Manager](#change-the-update-channel-with-configuration-manager).

## Change the update channel with Group Policy

1. Before you begin, make sure the scheduled task "Office Automatic Updates 2.0" is enabled on the client devices. This task, which updates the assigned channel, is a required part of managing updates for Microsoft 365 Apps, whether you use  Group Policy, the Office Deployment Tool, Microsoft Configuration Manager, or Microsoft Intune.

2. Use the [Group Policy Administrative Template files (ADMX/ADML) for Office](https://www.microsoft.com/download/details.aspx?id=49030) to enable the Group Policy setting **Update Channel** and select the new channel. The policy setting is under Computer Configuration\Policies\Administrative Templates\\Microsoft Office 2016 (Machine)\\Updates.

3. Link the updated policy to the OU with the devices whose channel you want to change.

4. By default, Group Policy refreshes in the background every 90 minutes.  If you want to refresh policy assignment immediately (for example, if you're testing in a lab environment), you can use the **gpupdate** command. For more information, see [gpupdate](/windows-server/administration/windows-commands/gpupdate).

After the policy has been applied, the "Office Automatic Updates 2.0" scheduled task must run. It will detect the updated policy and update the assigned channel. When the task runs again, it detects the new assigned channel and Office updates to a new build from that channel. The Office user interface on the client device won't show the updated channel until a build of Office from the new channel is installed.

## Change the update channel with the Office Deployment Tool (ODT)

1. Before you begin, double-check these items:
   - Make sure the scheduled task "Office Automatic Updates 2.0" is enabled on the client devices. This task, which updates the assigned channel, is a required part of managing updates for Microsoft 365 Apps, whether you use  Group Policy, the Office Deployment Tool, Configuration Manager, or Intune.
   - Make sure that the update channel for the targeted device isn't set through Group Policy. Otherwise, the policy setting will take precedence over the Office Deployment Tool setting and the device will stay on the channel specified by the policy setting. In such case, either remove the policy setting from the device or use [Group Policy to change the channel](#change-the-update-channel-with-group-policy).

2. Download the latest version of the ODT (setup.exe) from the [Microsoft Download Center](https://go.microsoft.com/fwlink/p/?LinkID=626065).

3. Create a configuration file that specifies the new channel name. In the example below, the channel changes to Current Channel.  For more information on channel names, see [Channel attribute in the Configuration Options article](office-deployment-tool-configuration-options.md#channel-attribute-part-of-updates-element).

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

After the policy has been applied, the "Office Automatic Updates 2.0" scheduled task must run. It will detect the updated policy and update the assigned channel. When the task runs again, it detects the new assigned channel and Office updates to a new build from that channel. The Office user interface on the client device won't show the updated channel until a build of Office from the new channel is installed

> [!NOTE]
> If you are deploying Microsoft 365 Apps with Intune using the [Microsoft 365 Apps for Windows 10 and later](/mem/intune/apps/apps-add-office365) app, the channel you select will be re-evaluated and enforced during policy refresh. It is recommended that any update channel policies in your environment match the channel selection for your app assignment. If the channels do not match, this will cause unexpected channel flipping under the following circumstances:
>   - Deploying Microsoft 365 Apps using the Microsoft 365 Apps for Windows 10 and later app.
>   - The app is configured using the Configuration designer.
>   - The app is assigned as required.

## Considerations when changing channels

> [!Tip]
> When choosing how you want to deliver updates to your organization, we highly recommend using Monthly Enterprise Channel with a servicing profile. By using a servicing profile, you’ll automatically deliver monthly Office updates for specific users or groups in waves, limiting the impact on your network. For more information, see [Overview of servicing profile in the Microsoft 365 Apps admin center](../DeployOffice/admincenter/servicing-profile.md).

- When moving from a channel with a higher build number to a channel with a lower build number (such as Current Channel to Semi-Annual Enterprise Channel), binary delta compression isn't applied. Because of this, the update will be larger than normal. The update, however, won't be as large as a full installation of Microsoft 365 Apps.
- Devices must be able to fetch an update from the newly assigned channel to complete the transition.
   - If your devices are receiving updates from the internet, you're all set, and no other changes are required.
   - If you're using Configuration Manager to deploy updates, make sure that an update from the newly assigned channel has been deployed to the devices. We recommend using [dynamic collections](fieldnotes/build-dynamic-lean-configuration-manager.md#catch-devices-running-microsoft-365-apps) for easier targeting. Devices will only download the required updates, so it's safe to assign updates from multiple channels to a device.
   - If you're using file shares, you must download and host the matching update in a new location/folder. Use the **Update Path** group policy setting or the Office Deployment Tool to point devices at the new location. 

- After a successful channel change assignment, Microsoft 365 Apps must first apply a successful update in order to accept further channel changes.

- If Office has just been installed or updated, changing the update channel can take up to 24 hours after the new setting has been applied.

- The Office user interface on the client device won't reflect the updated channel until a build of Office from the new channel is installed.

- If you move from a channel with a newer version of Office to a channel with an older version of Office, any features that are only available in the newer version will be removed.
