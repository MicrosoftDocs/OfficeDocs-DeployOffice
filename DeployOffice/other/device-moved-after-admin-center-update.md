---
title: "Updates to the Microsoft 365 admin center may cause your devices to change update channels"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: article
ms.service: o365-proplus-itpro
ms.localizationpriority: medium
ROBOTS: NOINDEX, NOFOLLOW
recommendations: false
hideEdit: true
description: "Provides guidance only to customers who received a Message center post about updates to the Microsoft 365 update channels in the Microsoft 365 admin center."
---

# Updates to the Microsoft 365 admin center may cause your devices to change update channels 

> [!IMPORTANT]
>
>- The information in this article applies only to organizations that received Message center post (########) 
>- This article covers information about devices with Microsoft 365 that automatically moved to a new update channel due to a change in an internal Microsoft tool related to the **Microsoft 365 installation options** section in the Microsoft 365 admin center. 

We're always looking for ways to make things better for our customers, so we're making some changes to an internal tool associated with the Microsoft 365 installation options page in the Microsoft 365 admin center. As a result, some of your devices will be moved to a different update channel automatically. But don't worry, this change will give you more control over the update channel settings for a lot more devices by using the Microsoft 365 installation options page.

## How will this affect my devices?

Once the update has been rolled out, it's normal for some of your devices to be automatically moved to a different update channel. However, if there are certain devices you don't want moved to a new channel, you can change their update preferences using other admin tools. We suggest you take a look at your current update channel selection on the Microsoft 365 installation options page in the admin center to make sure everything's set up the way you want.

For more information, see [Choose how often to get feature update for Office](../manage-software-download-settings-office-365#choose-how-often-to-get-feature-updates-for-office.md)

It's important to note that after this change, any device that's managed by one of the following management scenarios will not move to the update channel selected in the Microsoft 365 admin center.

 - Devices managed with a servicing profile in the Microsoft 365 Apps admin center.
 - Devices configured to get updates for Microsoft 365 Apps from Configuration Manager.
 - Devices where Microsoft 365 Apps is managed by Microsoft Intune.
 - Devices with one of the following Microsoft 365 update or related policies are set: Update Channel, Update Path, Target Version	

## Manage how your devices receive updates

To keep your devices on their existing update channel, you'll have to configure one of the following management options to set the update channel preference for your devices.

### Set an update policy

You can keep your devices on their current update channel by setting any of the following update channel policies through the [Microsoft 365 Apps admin center](../admincenter/overview-cloud-policy.md#steps-for-creating-a-policy-configuration), [Group Policy Objects](../change-update-channels.md#change-the-update-channel-with-group-policy), or [Intune](/mem/intune/apps/app-office-policies).
- Update channel
- Update path
- Target version

### Servicing profile in Microsoft 365 Apps admin center

A servicing profile allows you to set up automatic monthly updates for certain users or groups. You can apply a servicing profile to a set of devices in the Microsoft 365 Apps admin center. Once the profile is applied, the devices will automatically switch to the Monthly Enterprise Channel, receive updates from the Office Content Delivery Network (CDN), and be managed by the servicing profile. 

To apply a servicing profile, see [Overview of servicing profile in the Microsoft 365 Apps admin center](../admincenter/servicing-profile.md)

### Configure updates for Microsoft 365 Apps from Configuration Manager

In order for Configuration Manager to effectively manage Office updates, the Office COM object must be enabled on the computer where Office is installed. The Office COM object takes commands from Configuration Manager, facilitating the download and installation of updates to the client.

There are several ways to enable the Office COM object, such as using client policy in Configuration Manager, setting it up through Group Policy, or using the Office Deployment Tool. If you use multiple methods, the configuration set in Group Policy will take precedence.

- [Method 1: Use client policy in Configuration Manager to enable updates from Configuration Manager](../manage-microsoft-365-apps-updates-configuration-manager.md#method-1-use-client-policy-in-configuration-manager-to-enable-updates-from-configuration-manager)
- [Method 2: Use Group Policy to enable updates from Configuration Manager](../manage-microsoft-365-apps-updates-configuration-manager.md#method-2-use-group-policy-to-enable-updates-from-configuration-manager)
- [Method 3: Use the Office Deployment Tool to enable updates from Configuration Manager](#method-3-use-the-office-deployment-tool-to-enable-updates-from-configuration-manager)

### Deploy Microsoft 365 Apps with Intune

Microsoft Intune, through the [Office Deployment Tool](../overview-office-deployment-tool.md), enables the download and deployment of Microsoft 365 apps to client computers through the [Office 365 CDN](../deploy-microsoft-365-apps-cloud.md). Devices that you manage and run on Windows 10/11 can have Microsoft 365 apps assigned and installed, provided you have the necessary licenses. The list of Microsoft 365 apps available for use can be viewed in the [Microsoft Endpoint Manager admin center](https://endpoint.microsoft.com/).

For information on deploying Microsoft 365 Apps with Intune, see [Add Microsoft 365 Apps to Windows 10/11 devices with Microsoft Intune](/mem/intune/apps/apps-add-office365)