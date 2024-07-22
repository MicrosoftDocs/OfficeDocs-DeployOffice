---
title: Change update channel to prepare devices for Copilot
author: manoth-msft
ms.author: manoth
manager: dougeby
audience: ITPro
ms.topic: how-to
ms.service: o365-proplus-itpro
ms.localizationpriority: medium
ms.collection: 
- Tier3
- m365copilot
- magic-ai-copilot
description: "Guide for admins on switching devices to Current Channel or Monthly Enterprise Channel for Microsoft 365 Apps to prepare for Copilot usage"
ms.date: 07/22/2024
---

# Change update channel of Microsoft 365 Apps to enable Copilot

## Overview

To use Microsoft 365 Copilot, Microsoft 365 Apps must run on [Current](overview-update-channels.md#current-channel-overview) or [Monthly Enterprise Channel](overview-update-channels.md#monthly-enterprise-channel-overview). This article provides configuration guidance and best practices on how to switch Microsoft 365 Apps to such a channel.

> [!NOTE]
> Assigning the Copilot licenses to users is a required step which is not covered in this documentation. For more information, see [How to prepare for Microsoft 365 Copilot](https://techcommunity.microsoft.com/t5/microsoft-365-copilot/how-to-prepare-for-microsoft-365-copilot/ba-p/3851566).

Based on your preferred management solution, choose from the following options. Microsoft recommends [Cloud Update](../admincenter/cloud-update.md), as it provides the most streamlined and easiest experience.

- [Cloud Update](#cloud-update)
- [Microsoft Intune](#microsoft-intune)
- [Windows Autopatch](#windows-autopatch)
- [Microsoft Configuration Manager](#microsoft-configuration-manager)
- [Group Policies](#group-policies)

> [!NOTE]
> The configurations covered in this document are based on working best practices. It is highly recommended that you review, test, and validate according to the needs of your environment.
 
## Pre-Checks
Our general recommendation for Microsoft 365 Apps is to direct devices to the Office CDN. As Current Channel is receiving updates frequently, not on a set schedule, and multiple times a month, using the Office CDN is even more advised.

1.	Verify that your network allows devices to access the Microsoft CDN directly or through a proxy.
2.	Consider enabling [Delivery Optimization for Microsoft 365 Apps](../updates/delivery-optimization.md) to help reduce the traffic on your internet links.

## Cloud Update
This section covers the recommended approach for changing the update channel using Cloud Updates. It walks you through the  steps of enabling Cloud Update and initiating the channel change.

[!NOTE]
> Cloud update and the Channel change feature are in **public preview**.

We recommend using Microsoft Entra ID groups with user objects for initiating the channel change. It makes targeting the right subset of devices easier, especially when using the same Microsoft Entra ID group for assigning Copilot licenses. The service automatically translates user objects into the matching device objects, based on activation data.

### Prepare a Microsoft Entra ID security group
The Channel Change feature can target individual devices or whole Microsoft Entra ID groups. Groups can contain user or device objects, or a combination of both.

1.	Create a new security group in Microsoft Entra ID (previously Azure Active Directory) for the intended Copilot users or devices. For guidance on this step, refer to [QuickStart: Create a group with members](/azure/active-directory/fundamentals/groups-view-azure-portal).
2.	Add the user or device objects to the security group. If you're using device object, ensure that the devices are (hybrid) Microsoft Entra ID-joined, otherwise those can't be targeted. There's no such requirement when using user objects.

### Enable Cloud Update
With the enablement of Cloud Updates, the service automatically manages all Microsoft 365 Apps installations on Monthly Enterprise Channel. To keep all devices updated, we recommend enabling the profile for Current Channel as well.

If you need to exclude devices from being serviced, use the **Exclude devices** feature under **Cloud Updates** > **Overview** > **Tenant Settings**.

If you prefer watching short videos over reading text, review these links:
1. [Overview of Cloud Update for Monthly Enterprise Channel](https://youtu.be/vUDGQ5I_5lo)
1. [Enable the Current Channel Profile](https://youtu.be/lRegLZUjkUY)
1. [Overview of Current Channel Profile](https://youtu.be/wwguIOw788I)

Otherwise follow these instructions:

1. Log into the [Microsoft 365 Apps admin center](https://config.office.com), you should land on the **Home** page automatically.
1. On the **Recommendation based on your tenant** card, select **Enable cloud**.
1. Wait a moment and refresh the page.
1. Verify that the **Monthly Enterprise** entry is listed under the **Cloud Update** navigation.
1. Navigate back to the **Home** page and select **Finish enabling cloud** to activate the Current Channel profile as well.
1. Wait a moment and refresh the page.
1. Verify that the **Current** entry is listed under the **Cloud Update** navigation.

### Initiate a channel change
Next step is to trigger the actual update channel change.

If you prefer watching a short video over reading text, review this link:

- [How to trigger an update channel change](https://youtu.be/tFmktdQsKgY)

Otherwise follow these instructions:

1. While staying in the Microsoft 365 Apps admin center, navigate to **Inventory**.
1. Select **Show all devices** and select the **Switch device update channel** button on the top.
1. Select which devices should be moved and the targeted update channel.
    - You can enter device names or Microsoft Entra ID groups, or a mix of both.
    - For Entry ID groups, such groups can be nested up to three levels down and contain a mix of device and user objects.
1. Select **Move devices** to initiate the channel change.

> [!NOTE]
> It might take up to 24 hours for the channel change to be completed by the device, assuming devices are online and can connect to the service.

> [!NOTE]
> A channel change is a point-in-time activity. If you are using Microsoft Entra ID groups and add devices or users to the group after initiating a channel change, those devices will not be moved automatically. You will have to initiate the channel change again. There's no need to remove already switched devices from the group.

### Validation
You can validate the implementation by monitoring the following aspects:
- Within 24 hours, you should see the devices being listed in the **Monthly Enterprise** or **Current** profile.
- Within 24 hours, you should see the **Update Channel** changing to the targeted one in inventory.
- On the device, the following registry key should change to "**1**", as profile's control is established on the device:
   - HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\cloud\office\16.0\Common\officeupdate > IgnoreGPO
- Other apps like Visio, Project or Access Runtime are migrated to Current Channel as well and are updated in the same pass.

## Microsoft Intune

In this section, we cover the recommended policy settings for managing the update channel and update servicing options for Microsoft 365 Apps using Microsoft Intune.

If you want to move some devices to Current Channel and others to Monthly Enterprise Channel, you need to repeat the steps for each update channel.

### Create a Microsoft Entra ID security group
1.	Create a new security group in Microsoft Entra ID (previously Azure Active Directory) for targeted devices. For guidance on this step, refer to [QuickStart: Create a group with members](/azure/active-directory/fundamentals/groups-view-azure-portal).
1.	Add the computer objects to this security group that need to be moved and have update management applied to. 

### Create a configuration profile
Create a new configuration profile in Microsoft Intune. Refer to the following steps:
1.	Sign in to [https://endpoint.microsoft.com/](https://endpoint.microsoft.com/) with an account that has the Intune Administrator role.
1.	From the left navigation, select **Devices**.
1.	Under **Policy**, select **Configuration profiles**.
1.	From the **Devices | Configuration profile**s page, select **+ Create profile**.
1.	From the **Create a profile** flyout, choose the following options and select **Create**:
    - Platform: Windows 10 and later
    - Profile type: Settings catalog
1.	From the **Create profile** page, on the **Basics** tab, provide a name for this profile and select **Next**. For example: **Profile – Microsoft 365 Apps on CC**.
1.	From the **Configuration settings** tab, select **+Add settings**.
1.	From the **Settings picker** flyout, select **Microsoft Office 2016 (Machine) > Updates**.
1.	On the lower-third of the flyout, mark the checkboxes for the following settings and apply the corresponding configuration. 

| Setting Name | Configuration |
|:---|:---|
|Enable Automatic Updates|Enabled|
|Hide option to enable or disable updates|Enabled|
|Hide update notifications|Disabled|
|Office 365 Client Management|Disabled|
|Update Channel|Enabled → Current Channel or Monthly Enterprise Channel|
|Update Deadline|Enabled → 1|
|Update Path|Enabled → For Current Channel enter `http://officecdn.microsoft.com/pr/492350f6-3a01-4f97-b9c0-c7c6ddf67d60` For Monthly Enterprise enter `	http://officecdn.microsoft.com/pr/55336b82-a18d-4dd6-b5f6-9e5095c314a6`|
|Target Version|Disabled|
|||

10.	select **Next**.
11.	From the **Scope tags** tab, select **Next**.
12.	From the **Assignments** tab, add your Current Channel security group and select **Next**. 
13.	On the **Review + create** tab, select **Create**.

### Update Microsoft 365 Apps for Windows 10 or later assignments
If you're deploying Microsoft 365 Apps with Intune using the [Microsoft 365 Apps for Windows 10 and later](/mem/intune/apps/apps-add-office365) app, the channel selected in the app configuration is re-evaluated and enforced during policy refresh. If the channels don't match, this causes unexpected channel flipping under the following circumstances:
- Deploying Microsoft 365 Apps using the Microsoft 365 Apps for Windows 10 and later app.
- The app is configured using the Configuration designer.
- The app is assigned as required.
- The selected channel differs from the newly assigned one.

If this matches your current configuration, adjust your Microsoft 365 Apps for Windows 10 or later apps:
- Update the configuration of the existing app to exclude the Microsoft Entra ID security groups you created for the channel change.
- Create new Microsoft 365 Apps for Windows 10 or later apps with the newly assigned update channel.
- If you're moving devices to both Current and Monthly Enterprise Channel, you have to create two new apps.
- Assign the newly created apps to the respective Microsoft Entra ID security groups.

### Monitor assignment
Monitor the progress of your configuration profile assignment using the following steps:
1.	From the left navigation, select **Devices**.
1.	Under **Policy**, select **Configuration profiles**.
1.	Locate the policy you want to monitor and select it. Review the status at the top of the profile page.

The Microsoft 365 Apps perform the full update channel switch within the next 24 hours. Devices switch from any channel to the latest build released. Other apps like Visio, Project or Access Runtime are migrated and updated as well in the same pass.

## Windows Autopatch
This section covers the recommended settings for managing the update channel and update servicing options for Microsoft 365 Apps with Windows Autopatch. All devices registered for Windows Autopatch receive updates from the Monthly Enterprise Channel, as outlined in the [Service level objective](/windows/deployment/windows-autopatch/operate/windows-autopatch-microsoft-365-apps-enterprise#update-release-schedule). If you want to use Copilot in Microsoft 365 Apps on the Monthly Enterprise Channel, there's no action required. Only if you want to switch installations to Current Channel, follow the following instructions.

To move a subset of devices to Current Channel, you can choose from two options:
1. Remove the devices for Copilot from Windows Autopatch and configure updates using Microsoft Intune.  
   1. **Benefits**: This option limits the policy changes to the subset of devices you're using for Copilot, enabling you to target separate policy settings for Microsoft 365 Apps. 
   1. **Considerations**: This option removes update management for Windows Updates, requiring you to setup and manage standalone Windows Update for Business policies. 

1. Disable update management for Microsoft 365 Apps in Windows Autopatch. 
    1. **Benefits**: This option keeps devices registered with Windows Autopatch for Windows Updates and reporting.
    2. **Considerations**: This option removes the update management for Microsoft 365 Apps across all Autopatch devices. You have to set up standalone update policies for all devices to keep them secure, versus those that are only used for Copilot. 

### Option 1: Remove devices from Windows Autopatch for Copilot 
To avoid disruption across your devices, plan your policy changes and timing accordingly.
1. Create and assign a new Intune configuration profile for Microsoft 365 Apps, as described in the section on [Microsoft Intune](#microsoft-intune).
1. Create and assign a new Windows Update for Business policy, as described in [Configure Windows Update for Business](/windows/deployment/update/waas-configure-wufb).
1. Remove your Copilot devices from Windows Autopatch, as described in [Exclude a device from Windows Autopatch](/windows/deployment/windows-autopatch/operate/windows-autopatch-exclude-device). 

### Option 2: Disable updates for Microsoft 365 Apps from Windows Autopatch 
To avoid disruption across your devices, plan your policy changes and timing accordingly.
1. Create and assign a new Intune configuration profile for Microsoft 365 Apps, as described in the section on [Microsoft Intune](#microsoft-intune).
1. Disable updates for Microsoft 365 Apps, as described in [Allow or block Microsoft 365 Apps updates](/windows/deployment/windows-autopatch/operate/windows-autopatch-microsoft-365-apps-enterprise#allow-or-block-microsoft-365-app-updates). 

## Microsoft Configuration Manager
The following steps cover how to separate a subset of devices out, assign client policies to lift the Configuration Manager’s control over Microsoft 365 Apps updates to them and redirect them to the Office CDN. Going forward, those devices receive updates directly from the Office CDN and no longer from the Configuration Manager infrastructure.

### Create dynamic collections
For an easier overview of the different update channels in your environment, we recommend setting up dynamic collections for each channel:
1.	Implement one collection for each update channel in your environment as described in [Build dynamic collections for Microsoft 365 Apps with Configuration Manager](../fieldnotes/build-dynamic-lean-configuration-manager.md#catch-devices-on-specific-update-channels).
1.	Implement one collection, which catches all Microsoft 365 Apps installations for easier update management: [Build dynamic collections for Microsoft 365 Apps with Configuration Manager](../fieldnotes/build-dynamic-lean-configuration-manager.md#catch-devices-running-microsoft-365-apps).

### Create collection with devices to move
Create another collection with all devices, which are slated to move to the new update channel. We later use this collection to target devices with adjusted client policies. Devices that have finished the switch are automatically removed from the collection.

1.	Create a new collection and add all devices that should be switched.
1.	Add the previously created dynamic collection as an Exclude. This way, devices that have finished the transition are automatically removed from the collection. This approach gives you a good overview which devices have already moved.

### Create and assign a client policy
Next, create a client policy to disable the Microsoft 365 Apps update management through Configuration Manager.

1. In the Configuration Manager console, navigate to **Administration** > **Overview** > **Client Settings**. Create a new client policy.
1. Select **Software Updates** and change the option **Enable management of the Office 365 client agent** to **Disable**. Don't switch to **Not configured**, otherwise the update control remains with Configuration Manager.
1. Close the dialog.
1. Assign the client policy to the collection that contains your devices you need to move. Ensure that the policy has the highest priority.

### Assign new update channel settings to devices
Follow the steps in the [group policy section](#group-policies) to create and assign the proper update settings.

### Monitor
Start monitoring the collection with the devices slated to move. After those have sync'ed with Active Directory to get the new update settings and with the Configuration Manager infrastructure to disable its update control, devices will move to the targeted update channel with the next run of the Automatic Update task on the devices. Once the devices have moved, they'll be dropped from the collection with the next evaluation cycle and be added to the appropriate channel-based collection.

Devices switch from any channel to the latest build released. Other apps like Visio, Project or Access Runtime are migrated and updated as well in the same pass.

## Group Policies
This section covers how to move a subset of devices to a new update channel using Active Directory-based group policies. As the Office Cloud Policy doesn't support machine-scoped settings, Active Directory-based policies have to be used. 

### Pre-Checks
Before you begin, confirm that you have addressed the following requirements:
1.	Keep up to date with the latest version of the[ ADMX templates for Microsoft 365 Apps](https://www.microsoft.com/en-us/download/details.aspx?id=49030).
1.	There are no conflicting policies being applied through other group policy objects or Intune configuration profiles.

### Create a security group
Create a security group as described in [Create a Group Account in Active Directory](/windows/security/operating-system-security/network-security/windows-firewall/create-a-group-account-in-active-directory). Add all computer objects that should change the update channel. You have to specify computer objects, using user objects doesn't work, as the group policy settings are applied on machine level.

### Create a new Group Policy Object
Create a new Group Policy Object with the settings to change the update channel. 
1.	Open the Group Policy Management console.
1.	Create a new Group Policy Object and give it a name (for example, Microsoft 365 Apps – Current Channel).
1.	Edit the policy and navigate to: **Computer Configuration > Policies > Administrative Templates > Microsoft Office 2016 (Machine) > Updates**.
1.	Configure the following settings:

|**Setting Name**  |**Configuration**  |
|:---|:---|
|Enable Automatic Updates|Enabled|
|Hide option to enable or disable updates|Enabled|
|Hide update notifications|Disabled|
|Office 365 Client Management|Disabled|
|Update Channel|Enabled → Current Channel or Monthly Enterprise Channel|
|Update Deadline|Enabled → 1|
|Update Path|Enabled → For Current Channel enter `http://officecdn.microsoft.com/pr/492350f6-3a01-4f97-b9c0-c7c6ddf67d60` For Monthly Enterprise enter `	http://officecdn.microsoft.com/pr/55336b82-a18d-4dd6-b5f6-9e5095c314a6`|
|Target Version|Disabled|
|||

5.	Close the editor and review the **Settings** tab for your new GPO.

### Apply Security Filtering
Next apply security filtering to ensure that only in-scope devices are targeted. Otherwise other devices might switch to the selected channel as well.
1.	Open the Group Policy Management console.
1.	Select the GPO that you created
1.	Select the **Scope** tab to view the GPO's scope.
1.	Under the **Security Filtering** section, remove any entries that aren't the security group that you want to filter the GPO by.
1.	Add the security group that you have created previously.

### Linking to OU and Link order
Finally, link the group policy object to an Organizational Unit (OU) which contains all targeted devices.
1.	Navigate to the desired OU, to which you want to link a GPO.
1.	Right click on this OU and select **Link an existing GPO**.
1.	In the **Select GPO** dialog under Group Policy Objects, select the GPO and Select **OK**.
1.	Review the Linked Group Policy Objects and review the Link Order.
1.	Review if the newly added GPO has the highest possible Link Order (for example, **Link Order** equals 1). This way other policies with potentially conflicting settings are overruled.

### Validation
The final step is to test the GPO's application and if the update channel switches automatically.
1.	Boot or reboot a computer that belongs to the security group.
1.	Sign-in to the device, open a command prompt and run the "gpupdate /force" command to refresh the group policy settings.
1.	Open the Registry Editor and navigate to Computer\HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\ office\16.0\Common\officeupdate and verify if keys like updatebranch and updatepath exist and have the desired values.
1.	Open the Task Scheduler, navigate to Microsoft\Office and run the Office Automatic Update 2.0 task manually.
1.	Switch back to the registry and navigate to Computer\HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Office\ClickToRun\Configuration.
1.	The value UpdateChannelChanged should have switched to True, indicating that the Update Engine is aware of the pending update channel change.

The Microsoft 365 Apps perform the full update channel switch within the next 24 hours. Devices switch from any channel to the latest build released. Other apps like Visio, Project or Access Runtime are migrated and updated as well in the same pass.

## More resources
Microsoft 365 Copilot
- [How to prepare for Microsoft 365 Copilot](https://techcommunity.microsoft.com/t5/microsoft-365-copilot/how-to-prepare-for-microsoft-365-copilot/ba-p/3851566)

Microsoft 365 Apps Channel Management
- [Change the Microsoft 365 Apps update channel for devices in your organization](./change-update-channels.md)
-	[Managing Update Channels for Microsoft 365 Apps](https://www.youtube.com/watch?v=rIpoloAZnSg) on YouTube
-	[Explained - Microsoft 365 Apps Update Channels](https://www.youtube.com/watch?v=eNn4PDkmo7s) on YouTube
