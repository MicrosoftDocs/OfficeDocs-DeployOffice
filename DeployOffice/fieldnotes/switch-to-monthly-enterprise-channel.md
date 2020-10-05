---
title: Switch to Monthly Enterprise Channel with  Configuration Manager
author: manoth-msft
ms.author: manoth
manager: laurawi
audience: ITPro 
ms.topic: article 
ms.service: o365-proplus-itpro
localization_priority: Normal
description: "Field best practices: Switch to Monthly Enterprise Channel with Configuration Manager"
ms.custom: 
- Ent_Office_ProPlus
- Ent_Office_FieldNotes
ms.collection: 
- Ent_O365
- M365-modern-desktop
---

# Best practices from the field: Switch to Monthly Enterprise Channel with Configuration Manager

> [!NOTE]
> This article was written by Microsoft experts in the field who work with enterprise customers to deploy Office.
   
With the release of the [Monthly Enterprise Channel](../overview-update-channels.md#monthly-enterprise-channel-overview) for the Microsoft 365 Apps, we offer organizations a new option to balance monthly feature adoption with a longer support lifetime and faster quality update adoption. This article will walk you through the steps to move all or some of your devices from their current update channel to Monthly Enterprise Channel. There are several ways how to [perform a channel change](../change-update-channels.md), this article will focus on using Microsoft Endpoint Configuration Manager. The following steps assume that you manage your devices as well as [Microsoft 365 Apps client updates](https://docs.microsoft.com/deployoffice/manage-microsoft-365-apps-updates-configuration-manager) with Configuration Manager.

The article will show the individual steps aligned to the following common approach of mocing devices from Semi-Annual Enterprise Channel (SAEC) to Monthly Enterprise Channel (MEC):
- Devices have Microsoft 365 Apps Semi-Annual Enterprise Channel (SAEC) installed and are member of [two dynamic collections](/build-dynamic-lean-configuration-manager.md): "SAEC devices" and "Microsoft 365 Apps devices"
- Admin creates and deploys an application to change the assigned update channel to MEC using the "SAEC devices" collection
- Admin deploys Microsoft 365 Apps Update for MEC channel to collection "Microsoft 365 Apps devices"
- Device executes application and updates Click-to-Run configuration with the newly assigned update channel
- During next [Software Updates Deployment Evaluation Cycle](https://docs.microsoft.com/mem/configmgr/sum/understand/software-updates-introduction#scan-for-software-updates-compliance-process) the Click-to-Run service will use [COM interface](https://docs.microsoft.com/office/client-developer/shared/manageability-applications-with-the-office-365-click-to-run-installer) to download update from distribution point and install build from new channel. 
- Device now runs on new channel
- Configuration Manager receives updated Hardware Inventory and moves device from collection "SAEC devices" to "MEC devices" automatically

For the admin there are three actions to take:
- Group the devices you want to target in a collection, preferably in a [dynamic collection tailored for the Microsoft 365 Apps](/build-dynamic-lean-configuration-manager.md).
- Create and deploy an application to inject the new channel assignment to the devices.
- Ensure Microsoft 365 Apps update from targeted channel is available for devices

## Group targeted devices

We recommend implementing [dynamic collections tailored for Microsoft 365 Apps](/build-dynamic-lean-configuration-manager.md) to group devices by update channel automatically. This allows easy targeting, e.g. if you want to move all devices running Semi-Annual Enterprise Channel to Monthly Enterprise Channel. Of course, you can also group devices in a collection manually, e.g. if you want to move only a subset of users or a pilot group first.
When using the dynamic collections, they might look like this before you start moving devices:

![Screenshot from Configuration Manager showing three collections](../images/fieldnotes_MoveMECCM_1.png)

The benefit of using dynamic collections is that devices will automatically switch between the collections based on the currently installed update channel. This allows you to target devices easier and monitor progress at a glance.

## Deploy application to initiate update channel change

Next step is to deploy an application which instructs the client to perform a channel change. For this we will use the [Office Deployment Tool](https://http/aka.ms/odt) with a configuration file. When executed on a device, it will only start the channel switch in terms of updating the configuration in the registry. It will not perform the actual channel change in terms of changing the installed application. The next time the Click-To-Run service does an update discovery, it will pick up the updated configuration and execute the channel change. As we only update the configuration, Office applications can remain open when the Office Deployment Tool runs. It will take only a few seconds and has no impact on end user productivity.

1. Download and extract the [Office Deployment Tool](https://go.microsoft.com/fwlink/p/?LinkID=626065). Copy just the setup.exe to a folder which you will use as a source for the application.
2. Create a configuration file based on the XML shown below and save it to the same folder.
```XML
<Configuration>
	<Updates Channel="MonthlyEnterprise" />
</Configuration>
```
3. Create an application on Configuration Manager, following your regular process. Do not use the Office Installation Wizard, as we do not need a full configuration file and no source files. A few notes:
    - The command line is **setup.exe /configure switch_to_MEC.xml**. Adjust the name of the configuration file to match yours.
    - Use the Detection Method shown below. It will check if the intend to switch channels has been injected correctly.
        - **Setting Type**: Registry
         - **Hive**: HKEY_LOCAL_MACHINE
         - **Key**: setup.exe /configure UpdateChannel_MEC.xml
         - **Value**: CDNBaseUrl
         - **Data Type**: String
         - **Operator**: Equals
         - **Value**: http://officecdn.microsoft.com/pr/55336b82-a18d-4dd6-b5f6-9e5095c314a6
    - Installation behavior needs to by **Install for System** as the assigned update channel is a system-wide setting.
4. After the application has been created, deploy it to the collection holding your targeted devices. You can decide if you want to set the **Purpose** to **Required**, meaning the Office Deployment Tool will run on all devices. Or make it a user-driven deployment by selecting **Available**.

## Make Monthly Enterprise Channel updates available to the device

After the configuration of the device has been updated by the deployed application, the actual channel change must still be performed. With the next update cycle, the Click-To-Run service on the device will detect the pending channel change and try to download and apply the update from the targeted channel. At this stage, the device is still on e.g. Semi-Annual Enterprise Channel, but needs to be able to fetch the Microsoft 365 Apps Update for Monthly Enterprise Channel:

![Screenshot from Configuration Manager showing two Microsoft 365 Apps Updates from Monthly Enterprise Channel](../images/fieldnotes_MoveMECCM_2.png)

So, in most cases you want to deploy the Microsoft 365 Apps Updates for both channels to a collection holding the targeted devices:

- Devices which have not yet received the instructions to switch channels can apply the regular Semi-Annual Enterprise Channel update to stay safe and secure.
- Devices which already have received the instruction to switch channels, will download and apply the update from the Monthly Enterprise Channel.

> [!NOTE]
> It is important to note that devices will only download applicable updates. Devices will not download both updates, but only the required update. And the delta calculation applies as well, so devices are not pulling the full update source, but only the content needed to perform the update or channel change.

A common practice is to have a [dynamic collection which catches all devices running Microsoft 365 Apps](/build-dynamic-lean-configuration-manager.md). You can then deploy the Microsoft 365 Apps Updates for all channels supported by your organization to this collection and each device will fetch the matching update. At the same time devices changing the channel have access to the targeted one.

![Screenshot from Configuration Manager showing updates from different channels deployed to the same collection](../images/fieldnotes_MoveMECCM_3.png)

Follow the regular process of [deploying software updates using Configuration Manager](https://docs.microsoft.com/mem/configmgr/sum/deploy-use/deploy-software-updates), we recommend using [Automatic Deployment Rules](https://docs.microsoft.com/mem/configmgr/sum/deploy-use/automatically-deploy-software-updates).

So once the devices have received the information to switch the channel and an update detection cycle is performed, these devices will download the delta update sources for Monthly Enterprise Channel, extract them locally and apply them. If Office applications are open, those must be closed to apply the update. The regular mechanism of Configuration Manager applies to decide if an update is enforced or the user can postpone the installation.

With the next [Hardware Inventory cycle](https://docs.microsoft.com/mem/configmgr/core/clients/manage/inventory/introduction-to-hardware-inventory) the device will sent up the new channel information to the Configuration Manager infrastructure. With the next evaluation cycle, device membership for dynamic collection will be recalculated and the devices will be removed from the old collection and added to the matching one:

![Screenshot from Configuration Manager collections with devices moved from one to another collection](../images/fieldnotes_MoveMECCM_4.png)

## Notes

- Make sure to use the most recent version of the Office Deployment Tool, so the tool supports the Monthly Enterprise Channel.
- If you have a group policy applied to the device which sets the “Update Channel”, this will overrule the Office Deployment tool. So in this case the device will not do a channel change, unless you remove the GPO setting or adjust the GPO itself. Make sure to have the latest [ADMX template](https://www.microsoft.com/en-us/download/details.aspx?id=49030) deployed to have the Monthly Enterprise Channel available as an option to select.
- Configuration Manager will only apply updates onto a device if the targeted build version is higher than the currently installed. Moving devices from Semi-Annual Enterprise or Semi-Annual Enterprise (Preview) channel to Monthly Enterprise just works. If you want to move devices from Current Channel to Monthly Enterprise, you have two options:
    - After the device received the intent to switch channel, it will not apply Current Channel updates anymore. Once the MEC build passed the installed Current Channel build, devices will switch.
    - Detach devices from Configuration Manager as the update source by disabling the Office COM Management interface. This is a major change and must be planned and executed with caution.
- If the configuration of a device is changed, there are two timers which are relevant on the Configuration Manager side:
    - First, the device must upload the [Hardware Inventory](https://docs.microsoft.com/mem/configmgr/core/clients/manage/inventory/introduction-to-hardware-inventory) which includes the information about the selected update channel.
    - Second, the Configuration Manager infrastructure must re-calculate the memberships of the collections in question.
