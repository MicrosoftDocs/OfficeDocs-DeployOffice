---
title: Copilot - Move a subset of devices to Current Channel with Microsoft Configuration Manager
author: manoth-msft
ms.author: manoth
manager: dougeby
audience: ITPro 
ms.topic: conceptual 
ms.service: o365-proplus-itpro
ms.localizationpriority: medium
ms.collection: Tier3
description: "Guide for admins on switching devices to Current Channel for Microsoft 365 Apps using Microsoft Configuration Manager"
ms.date: 08/30/2023
---

# Move devices to Current Channel using Microsoft Configuration Manager

## Overview

At this time, participants of the [Microsoft 365 Copilot Early Access Program (EAP)](https://www.microsoft.com/microsoft-365/blog/2023/05/09/introducing-the-microsoft-365-copilot-early-access-program-and-new-capabilities-in-copilot/) must be on the latest supported release of Current Channel for Microsoft 365 Apps. This article provides configuration guidance and best practices on how to prepare Microsoft 365 Apps for the Copilot EAP using Microsoft Configuration Manager.

We expect support for Microsoft 365 Copilot on Monthly Enterprise Channel in the future.

> [!NOTE]
> This article is solely focused on preparing your Microsoft 365 Apps for the Copilot Early Access Program (EAP). Other Copilot initiatives are not covered by this documentation.

> [!NOTE]
> The policies and configurations covered in this document are based on working best practices. It is highly recommended that you review, test, and validate according to the needs of your environment.
 
## Scope
This article covers recommendations for moving a subset of devices to Current Channel for Microsoft 365 Apps, using Microsoft Configuration Manager. As Current Channel is receiving updates on a fast cadence, a best practice is to leverage the Office CDN instead. Managing Current Channel updates through the Microsoft Configuration Manager infrastructure is certainly possible, but generates churn on the network and distribution points.

The implementation covers how to separate a subset of devices out, assign client policies to lift the Configuration Manager’s control over Microsoft 365 Apps updates to them and redirect them to the Office CDN. Going forward, those devices will receive updates directly from the Office CDN and no longer from the Configuration Manager infrastructure.

If you're managing your Microsoft 365 Apps updates through other technologies, please refer to the articles on [Intune](move-devices-channel-intune.md, [Group Policies](move-devices-channel-group-policy.md) or [Servicing Profiles](move-devices-channel-servicingprofile.md).

## Pre-Checks
Our general recommendation for Microsoft 365 Apps is to direct devices to the Office CDN. As Current Channel is receiving updates frequently, not on a set schedule, and multiple times a month, using the Office CDN is even more advised.
1.	Verify that your network allows devices to access the Microsoft CDN directly or through a proxy.
2.	Consider enabling [Delivery Optimization for Microsoft 365 Apps](../delivery-optimization.md) to help reduce the traffic on your internet links.

## Implementation

### Create dynamic collections
For an easier overview of the different update channels in your environment, we recommend setting up dynamic collections for each channel:
1.	Implement one collection for each update channel in your environment as described in [Build dynamic collections for Microsoft 365 Apps with Configuration Manager](../fieldnotes/build-dynamic-lean-configuration-manager.md#catch-devices-on-specific-update-channels).
2.	Implement one collection, which catches all Microsoft 365 Apps installations for easier update management: [Build dynamic collections for Microsoft 365 Apps with Configuration Manager](../fieldnotes/build-dynamic-lean-configuration-manager.md#catch-devices-running-microsoft-365-apps).

### Create collection with devices to move
Create another collection with all devices, which are slated to move to the Current Channel. We later use this collection to target devices with adjusted client policies. Devices that have finished the switch to Current Channel are automatically removed from the collection.

1.	Create a new collection and add all devices that should be switched to Current Channel.
2.	Add the previously created dynamic collection as an Exclude. This way, devices which have finished the switch to Current Channel are automatically removed from the collection. This approach gives you a good overview which devices have already moved.

### Create and assign a client policy
Next, create a client policy to disable the Microsoft 365 Apps update management through Configuration Manager.

1. In the Configuration Manager console, navigate to **Administration** > **Overview** > **Client Settings**. Create a new client policy.
2. Click on **Software Updates** and change the option **Enable management of the Office 365 client agent** to **Disable**. Don't switch to **Not configured**, otherwise the update control will remain with Configuration Manager.
3. Close the Wizard.
4. Assign the client policy to the collection which contains your devices  you need to move. Ensure that the policy has the highest priority.

### Assign Current Channel settings to devices
Follow the steps in the [group policy](./move-devices-channel-group-policy.md) article to create and assign the proper update settings to the devices that should move to Current Channel.

## Monitor
Start monitoring the collection with the devices slated to move to Current Channel. After those have sync'ed with Active Directory to get the new update settings and with the Configuration Manager infrastructure to disable its update control, devices will move to Current Channel with the next run of the Automatic Update task on the devices. Once the devices have moved, they'll be dropped from the collection with the next evaluation cycle and be added to the collection which captures all Current Channel installations.

Devices switch from any channel to the latest build released into the Current Channel. Other apps like Visio, Project or Access Runtime are migrated to Current Channel as well and are updated in the same pass.

## More resources
Microsoft 365 Copilot
- [Introducing the Microsoft 365 Copilot Early Access Program and new capabilities in Copilot](https://www.microsoft.com/en-us/microsoft-365/blog/2023/05/09/introducing-the-microsoft-365-copilot-early-access-program-and-new-capabilities-in-copilot/)
- [How to prepare for Microsoft 365 Copilot](https://techcommunity.microsoft.com/t5/microsoft-365-copilot/how-to-prepare-for-microsoft-365-copilot/ba-p/3851566)

Microsoft 365 Apps Channel Management
- [Change the Microsoft 365 Apps update channel for devices in your organization](change-update-channels.md)
-	[Managing Update Channels for Microsoft 365 Apps](https://www.youtube.com/watch?v=rIpoloAZnSg) on YouTube
-	[Explained - Microsoft 365 Apps Update Channels](https://www.youtube.com/watch?v=eNn4PDkmo7s) on YouTube
