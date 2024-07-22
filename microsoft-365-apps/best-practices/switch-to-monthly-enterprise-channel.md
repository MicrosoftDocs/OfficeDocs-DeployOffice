---
title: Switch to Monthly Enterprise Channel with Configuration Manager
author: manoth-msft
ms.author: manoth
manager: dougeby
audience: ITPro 
ms.topic: conceptual 
ms.service: o365-proplus-itpro
ms.localizationpriority: medium
ms.collection: Tier3
description: "Switch to Monthly Enterprise Channel with Configuration Manager"
ms.date: 05/25/2024
---

# Switch to Monthly Enterprise Channel with Configuration Manager

> [!NOTE]
> Authored by the Microsoft 365 Apps Rangers, this article outlines common practices observed across customer implementations. We advise assessing the relevance of this guidance for your organization and adapting the approach as necessary.

The [Monthly Enterprise Channel](../updates/overview-update-channels.md#monthly-enterprise-channel-overview) for Microsoft 365 Apps offers organizations a new option to balance monthly feature adoption with a longer support lifetime and faster quality update adoption. This article walks you through the steps to move all or some of your devices from their current update channel to Monthly Enterprise Channel. You can [perform a channel change](../updates/change-update-channels.md) in several ways. This article focuses on using Microsoft Configuration Manager. The following steps assume that you use it for both managing the device and deploying [Microsoft 365 Apps client updates](../updates/manage-microsoft-365-apps-updates-configuration-manager.md).

The article shows a common approach to move devices from Semi-Annual Enterprise Channel to Monthly Enterprise Channel. The admin has to perform three actions:

1. Group devices based on their currently installed channel in distinct [dynamic collections](build-dynamic-lean-configuration-manager.md).

1. Create and deploy an application to change the assigned update channel to Monthly Enterprise Channel.

1. Deploy Microsoft 365 Apps update for Monthly Enterprise Channel to a collection holding all Microsoft 365 Apps devices.

This will trigger the following flow of events on Configuration Manager and the individual device:

1. Configuration Manager automatically adds/removes devices based on the currently installed channel for easier targeting of a specific channel.

1. The device executes the assigned application and updates the Click-to-Run configuration with the newly assigned update channel.

1. During the next [Software Updates Deployment Evaluation Cycle](/mem/configmgr/sum/understand/software-updates-introduction#scan-for-software-updates-compliance-process), Click-to-Run will download and install the client update from the new channel. The device now runs on the new channel.
   
1. Configuration Manager receives an updated hardware inventory and automatically removes the device from the old collection and adds it to the **MEC devices** collection.

## Group targeted devices

We recommend that you implement [dynamic collections tailored for Microsoft 365 Apps](build-dynamic-lean-configuration-manager.md) to group devices by update channel automatically. This allows easy targeting—for example, if you want to move all devices running Semi-Annual Enterprise Channel to Monthly Enterprise Channel. You can also group devices in a collection manually—for example, if you want to move only a subset of users or a pilot group first.
When using the dynamic collections, the collections might look like this before you start moving devices:

:::image type="content" source="./media/switch-to-monthly-enterprise-channel/move-mec-w-configmgr-1.png" alt-text="A screenshot from Configuration Manager showing three collections.":::

The benefit of using dynamic collections is that devices will automatically switch between the collections based on the currently installed update channel. This allows you to target devices more easily and monitor progress at a glance.

## Deploy an application to initiate an update channel change

Next, you deploy an application that instructs the client to perform a channel change by using the [Office Deployment Tool](../deploy/overview-office-deployment-tool.md) with a configuration file. When executed on a device, the tool begins the channel switch by updating the configuration in the registry but doesn't perform the actual channel change. The next time the Click-to-Run service does an update discovery, the service picks up the updated configuration and executes the channel change. Because you are only updating the configuration, Office applications can remain open while the Office Deployment Tool runs. This takes only a few seconds and has no impact on user productivity.

Follow these steps to deploy an application to initiate an update channel change:

1. Download and extract the [Office Deployment Tool](https://go.microsoft.com/fwlink/p/?LinkID=626065). Copy only the **setup.exe** file to a folder you'll use as a source for the application.

1. Create a configuration file based on the following XML and save it to the same folder:

   ```XML
   <Configuration>
	    <Updates Channel="MonthlyEnterprise" />
   </Configuration>
   ```

1. Create an application in Configuration Manager by following your regular process. Don't use the Office Installation Wizard because you don't need a full configuration file and no source files. Note the following:

    - The command line is **setup.exe /configure switch_to_MEC.xml**. Adjust the name of the configuration file to match yours.
    
    - Use the following detection method to check if the intent to switch channels has been injected correctly:
    
      - **Setting Type**: Registry
      - **Hive**: HKEY_LOCAL_MACHINE
      - **Key**: SOFTWARE\Microsoft\Office\ClickToRun\Configuration
      - **Value**: CDNBaseUrl
      - **Data Type**: String
      - **Operator**: Equals
      - **Value**: `http://officecdn.microsoft.com/pr/55336b82-a18d-4dd6-b5f6-9e5095c314a6`
	
    - Installation behavior needs to be **Install for System** because the assigned update channel is a system-wide setting.
    
1. After the application has been created, deploy it to the collection that holds your targeted devices. You can decide if you want to set the **Purpose** to **Required**, meaning the Office Deployment Tool will run on all devices. You can also make it a user-driven deployment by selecting **Available**.

## Make Monthly Enterprise Channel updates available to the device

After the deployed application updates the device configuration, it still must perform the actual channel change. In the next update cycle, the Click-to-Run service on the device detects the pending channel change and tries to download and apply the update from the new channel. At this stage, the device might still be on the Semi-Annual Enterprise Channel but needs to be able to fetch the Microsoft 365 Apps Update for Monthly Enterprise Channel, as shown in the following screenshot:

:::image type="content" source="./media/switch-to-monthly-enterprise-channel/move-mec-w-configmgr-2.png" alt-text="A screenshot from Configuration Manager showing two Microsoft 365 Apps Updates from Monthly Enterprise Channel.":::

In most cases, you'll want to deploy the Microsoft 365 Apps Updates for both channels to a collection holding the targeted devices:

- Devices that haven't yet received instructions to switch channels can apply the regular Semi-Annual Enterprise Channel update to stay safe and secure.

- Devices that have already received instructions to switch channels will download and apply the update from the Monthly Enterprise Channel.

> [!IMPORTANT]
> It's important to note that devices will only download applicable updates. Devices won't download both updates but only the required one. Because the delta calculation also applies, devices don't pull the full update source but only the content needed to perform the update or channel change.

A common practice is to have a [dynamic collection that catches all devices running Microsoft 365 Apps](build-dynamic-lean-configuration-manager.md#catch-devices-running-microsoft-365-apps). You can then deploy to this collection the Microsoft 365 Apps updates for all channels supported by your organization, and each device will fetch the matching update. At the same time, devices changing channels have access to the new one.

:::image type="content" source="./media/switch-to-monthly-enterprise-channel/move-mec-w-configmgr-3.png" alt-text="A screenshot from Configuration Manager showing updates from different channels deployed to the same collection.":::

Follow the regular process of [deploying software updates using Configuration Manager](/mem/configmgr/sum/deploy-use/deploy-software-updates). We recommend using [Automatic Deployment Rules](/mem/configmgr/sum/deploy-use/automatically-deploy-software-updates).

After a device has received instructions to switch channels and an update detection cycle is performed, the device downloads the delta update sources for Monthly Enterprise Channel, extracts them locally, and then applies them. If Office applications are open, you must close them to apply the update. The Configuration Manager mechanism decides if an update is enforced or if the user can postpone installation.

In the next [hardware inventory cycle](/mem/configmgr/core/clients/manage/inventory/introduction-to-hardware-inventory), the device sends the new channel information to the Configuration Manager infrastructure. In the next evaluation cycle, device membership for dynamic collection is recalculated. The devices will be removed from the old collection and added to the matching one as follows:

:::image type="content" source="./media/switch-to-monthly-enterprise-channel/move-mec-w-configmgr-4.png" alt-text="A screenshot from Configuration Manager collections with devices moved from one to another collection.":::

## Additional details

- Make sure to use Office Deployment Tool version 16.0.12827.20258 or higher to have Monthly Enterprise Channel support included. We recommend that you always run the latest version of the ODT.

- If you have a Group Policy applied to the device that sets the **Update Channel**, it will overrule the Office Deployment Tool. In this case, the device won't perform a channel change unless you remove or adjust the Group Policy Object (GPO) setting. Make sure to deploy the latest [ADMX template](https://www.microsoft.com/download/details.aspx?id=49030) to have the Monthly Enterprise Channel available as an option to select.

- Configuration Manager only applies device updates if the targeted build version is higher than the currently installed build. Moving devices from Semi-Annual Enterprise Channel or Semi-Annual Enterprise Channel (Preview) to Monthly Enterprise Channel just works. If you want to move devices from Current Channel to Monthly Enterprise Channel, you have two options:

   - After the device receives the intent to switch channels, the device will no longer apply any Current Channel updates. It will switch channels only after the Monthly Enterprise Channel build passed the installed Current Channel build.
   
   - Detach devices from Configuration Manager as the update source by disabling the Office COM Management interface. This is a major change that you must plan and execute with caution.
   
- If the device configuration is changed, two timers are relevant on the Configuration Manager side:

   - The device must upload the [hardware inventory](/mem/configmgr/core/clients/manage/inventory/introduction-to-hardware-inventory) that includes information about the selected update channel.
   
   - The Configuration Manager infrastructure must recalculate the memberships of the collections.
