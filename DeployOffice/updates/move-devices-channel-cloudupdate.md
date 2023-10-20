---
title: Copilot - Move a subset of devices to Current Channel with Cloud Update
author: manoth-msft
ms.author: manoth
manager: dougeby
audience: ITPro
ms.topic: conceptual
ms.service: o365-proplus-itpro
ms.localizationpriority: medium
ms.collection: Tier3
ROBOTS: NOINDEX, NOFOLLOW
description: "Guide for admins on switching devices to Current Channel for Microsoft 365 Apps using Cloud Update"
ms.date: 10/20/2023
---

# Move devices to Current Channel using Cloud Update

## Overview

At this time, participants of the [Microsoft 365 Copilot Early Access Program (EAP)](https://www.microsoft.com/en-us/microsoft-365/blog/2023/05/09/introducing-the-microsoft-365-copilot-early-access-program-and-new-capabilities-in-copilot/) must be on the latest supported release of Current Channel for Microsoft 365 Apps. This article provides configuration guidance and best practices on how to prepare Microsoft 365 Apps for the Copilot EAP using the [Microsoft 365 Apps admin center](https://config.office.com). We expect support for Microsoft 365 Copilot on Monthly Enterprise Channel in the future.

> [!NOTE]
> This article is solely focused on preparing your Microsoft 365 Apps for the Copilot Early Access Program (EAP). Other Copilot initiatives are not covered by this documentation.

> [!NOTE]
> The configurations covered in this document are based on working best practices. It is highly recommended that you review, test, and validate according to the needs of your environment.
 
## Scope
This article covers recommendations for moving a subset of devices to Current Channel for Microsoft 365 Apps using Cloud Updates. If you're managing your Microsoft 365 Apps updates through other technologies, refer to the articles on [Intune](move-devices-channel-intune.md), [Group Policies](move-devices-channel-group-policy.md), [Configuration Manager](move-devices-channel-configmgr.md), [Autopatch](move-devices-channel-autopatch.md) or [servicing profiles](move-devices-channel-servicingprofiles.md).

## Pre-Checks
Our general recommendation for Microsoft 365 Apps is to direct devices to the Office CDN. As Current Channel is receiving updates frequently, not on a set schedule, and multiple times a month, using the Office CDN is even more advised.
1.	Verify that your network allows devices to access the Microsoft CDN directly or through a proxy.
2.	Consider enabling [Delivery Optimization for Microsoft 365 Apps](../delivery-optimization.md) to help reduce the traffic on your internet links.

## Implementation
This section covers the recommended approach for moving devices to Current Channel. It walks you through the necessary steps on how enable automatic updates and initiate the channel change.

### Video-based instructions
If you prefer watching short videos over reading text, view below videos:
1. [Enable the Current Channel Profile](https://youtu.be/lRegLZUjkUY)
2. [Overview of Current Channel Profile](https://youtu.be/wwguIOw788I)
3. [How to trigger an update channel change](https://youtu.be/tFmktdQsKgY)

We recommend using Entra ID groups with user objects for initiating the channel change. It makes targeting the right subset of devices easier, especially when using the same Entra ID group for assigning Copilot licenses. The service automatically translates user objects into the matching device objects, based on activation data.

### Create a security group
The Channel Change feature can target individual devices or whole Entra ID groups. Groups can contain user or device objects, or a combination of both.

1.	Create a new security group in Microsoft Entra ID (previously Azure Active Directory) for the intended Copilot users or devices. For guidance on this step, refer to [QuickStart: Create a group with members](/azure/active-directory/fundamentals/groups-view-azure-portal).
2.	Add the objects to this security group that need to be moved to Current Channel and have update management applied to. 

### Enable Current Channel profile
In order to keep devices updated and secure after moving to Current Channel, we recommend enabling the Current Channel profile in Cloud Update. Note that the Current Channel profile applies to all devices on Current Channel. If you need to exclude devices from being serviced, use the **Exclude devices** feature under **Cloud Updates** > **Overview** > **Tenant Settings**.

1. Log into the [Microsoft 365 Apps admin center](https://config.office.com), you should land on the **Home** page automatically.
2. On the **Recommendation based on your tenant** card, select **Finish enabling cloud**.
3. Wait a moment and refresh the page.
4. Verify that the **Current** entry is listed under the **Cloud Update** navigation.
5. Select **Current**, review the presented data.
6. Optionally, you can adjust the **deadline setting** on the **Tenant settings** tab.

### Initiate channel change
Next step is to trigger the actual update channel change.
1. While staying in the Microsoft 365 Apps admin center, navigate to **Inventory**.
2. Select **Show all devices** and select the **Switch device update channel** button on the top.
3. Select **Current Channel** and enter which devices should be moved.
    - You can enter device names or Entra ID groups, or a mix of both.
    - For Entry ID groups, such groups can be nested up to three levels down and contain a mix of device and user objects.
4. Select **Move devices** to initiate the channel change.

> [!NOTE]
> It might take up to 24 hours for the channel change to be completed by the device, assuming devices are online and can connect to the service.

> [!NOTE]
> A channel change is a point-in-time activity. If you are using Entra ID groups and add devices or users to the group after initiating a channel change, those devices will not be moved automatically. You will have to initiate the channel change for this group again. There is no need to remove already switched devices fom the group.

## Validation
You can validate the implementation by monitoring the following aspects:
- Within 24 hours, you should see the devices being listed in the **Current** profile.
- Within 24 hours, you should see the **Update Channel** switching to Current Channel in inventory.
- On the device, the following registry key should change to "**1**", as profile's control is established on the device:
   - HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\cloud\office\16.0\Common\officeupdate > IgnoreGPO
- It switches from any channel to the latest build released into the Current Channel.
- Other apps like Visio, Project or Access Runtime are migrated to Current Channel as well and are updated in the same pass.

## More resources
Microsoft 365 Copilot
- [Introducing the Microsoft 365 Copilot Early Access Program and new capabilities in Copilot](https://www.microsoft.com/en-us/microsoft-365/blog/2023/05/09/introducing-the-microsoft-365-copilot-early-access-program-and-new-capabilities-in-copilot/)
- [How to prepare for Microsoft 365 Copilot](https://techcommunity.microsoft.com/t5/microsoft-365-copilot/how-to-prepare-for-microsoft-365-copilot/ba-p/3851566)

Microsoft 365 Apps Channel Management
- [Change the Microsoft 365 Apps update channel for devices in your organization](./change-update-channels.md)
-	[Managing Update Channels for Microsoft 365 Apps](https://www.youtube.com/watch?v=rIpoloAZnSg) on YouTube
-	[Explained - Microsoft 365 Apps Update Channels](https://www.youtube.com/watch?v=eNn4PDkmo7s) on YouTube
