---
title: "Updates to the Microsoft 365 admin center may cause your devices to change update channels"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: article
ms.service: o365-proplus-itpro
ms.collection: tier1
ms.localizationpriority: medium
ROBOTS: NOINDEX, NOFOLLOW
recommendations: false
hideEdit: true
description: "Provides guidance only to customers who received a Message center post about updates to the Microsoft 365 update channels in the Microsoft 365 admin center."
ms.date: 01/18/2023
---

# Updates to the Microsoft 365 admin center may cause your devices to change update channels 

> [!IMPORTANT]
>
>- The information in this article applies only to organizations that received the "Updates to the Microsoft 365 admin center may cause your devices to change update channels" Message center post.
>- This article covers information about devices with Microsoft 365 that automatically moved to a new update channel due to a change in an internal Microsoft tool related to the **Microsoft 365 installation options** section in the Microsoft 365 admin center. 

We're always looking for ways to make things better for our customers, so we're making some changes to an internal tool associated with the **Microsoft 365 installation options** page in the Microsoft 365 admin center. As a result, some of your devices will be moved to a different update channel automatically. But don't worry, this change will give you more control over the update channel settings for a lot more devices by using the **Microsoft 365 installation options** page.

## How will this affect my devices?

Once the update has been rolled out, it's normal for some of your devices to be automatically moved to a different update channel. However, if there are certain devices you don't want moved to a new channel, you can change their update preferences using [other admin tools](#manage-how-your-devices-receive-updates). We suggest you take a look at your current update channel selection on the **Microsoft 365 installation options** page in the admin center to make sure everything's set up the way you want.

For more information, see [Choose how often to get feature update for Office](../manage-software-download-settings-office-365.md#choose-how-often-to-get-feature-updates-for-office).

> [!IMPORTANT] 
> After this change, any device that's managed by one of the following management scenarios will not move to the update channel selected in the Microsoft 365 admin center.
>
> - Devices managed with a servicing profile in the Microsoft 365 Apps admin center.
> - Devices configured to get updates for Microsoft 365 Apps from Configuration Manager.
> - Devices where Microsoft 365 Apps is managed by Microsoft Intune.
> - Devices with one of the following update related policies are set: Update Channel, Update Path, Target Version

## Manage how your devices receive updates

To keep your devices on their existing update channel, you'll have to configure one of the following management options to set the update channel preference for your devices.

### Use a servicing profile in Microsoft 365 Apps admin center

A servicing profile allows you to set up automatic monthly updates for certain users or groups. You can apply a servicing profile to a set of devices in the [Microsoft 365 Apps admin center](https://config.office.com). Once the servicing profile is applied, your devices will automatically switch to the Monthly Enterprise Channel, receive updates over the internet directly from Microsoft, and be managed by the servicing profile.

To apply a servicing profile, see [Overview of servicing profile in the Microsoft 365 Apps admin center](../admincenter/servicing-profile.md).

### Configure updates for Microsoft 365 Apps from Configuration Manager

For Configuration Manager to manage updates for Microsoft 365 Apps, the Office COM object must be enabled on the device where Microsoft 365 Apps is installed. The Office COM object takes commands from Configuration Manager, facilitating the download and installation of updates to the client.

There are several ways to enable the Office COM object, such as using client policy in Configuration Manager, setting it up through Group Policy, or using the Office Deployment Tool. If you use multiple methods, the configuration set in Group Policy will take precedence.

- [Method 1: Use client policy in Configuration Manager to enable updates from Configuration Manager](../manage-microsoft-365-apps-updates-configuration-manager.md#method-1-use-client-policy-in-configuration-manager-to-enable-updates-from-configuration-manager)
- [Method 2: Use Group Policy to enable updates from Configuration Manager](../manage-microsoft-365-apps-updates-configuration-manager.md#method-2-use-group-policy-to-enable-updates-from-configuration-manager)
- [Method 3: Use the Office Deployment Tool to enable updates from Configuration Manager](../manage-microsoft-365-apps-updates-configuration-manager.md#method-3-use-the-office-deployment-tool-to-enable-updates-from-configuration-manager)

### Deploy Microsoft 365 Apps with Microsoft Intune

Microsoft Intune, through the [Office Deployment Tool](../overview-office-deployment-tool.md), enables the download and deployment of Microsoft 365 Apps to client computers through the [Office Content Deliver Network](../deploy-microsoft-365-apps-cloud.md). Devices that you manage and run on Windows 10/11 can have Microsoft 365 apps assigned and installed, provided you have the necessary licenses.

For information on deploying Microsoft 365 Apps with Microsoft Intune, see [Add Microsoft 365 Apps to Windows 10/11 devices with Microsoft Intune](/mem/intune/apps/apps-add-office365).

### Set an update policy

You can keep your devices on their current update channel by setting update-related policies through [Group Policy](../change-update-channels.md#change-the-update-channel-with-group-policy) or [Microsoft Intune](/mem/intune/configuration/administrative-templates-windows).
These policies include:

- Update Channel: specify the update channel, such as Current Channel, Monthly Enterprise Channel, or Semi-Annual Enterprise Channel.
- Update Path: specify the source location for Microsoft 365 installation files, whether it be a network, local, or HTTP path.
- Target Version: specify the version of Microsoft 365 Apps to update to.

> [!NOTE]
> These three update-related policies are the only policies available to manage updates. They allow for granular control over the update process, enabling you to specify the update channel, location, and target version of updates. This gives you the ability to manage updates beyond the **Microsoft 365 installation options** page and provide more detailed control over the update process.

### Choose your update channel from the Microsoft 365 admin center

Maintain your devices update by specifying the frequency at which they receive feature updates for the Microsoft 365 Apps installed. This allows for flexibility in determining the most appropriate update schedule for your organization. Options include providing new features as soon as they become available, or on a monthly basis (on the second Tuesday of the month). Additionally, you may choose to distribute updates twice annually, on the second Tuesday of January and July. 

For more information, see [Manage Microsoft 365 installation options in the Microsoft 365 admin center](../manage-software-download-settings-office-365.md).