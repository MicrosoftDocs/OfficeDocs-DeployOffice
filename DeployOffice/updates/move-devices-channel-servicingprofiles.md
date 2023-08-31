---
title: Copilot - Move a subset of devices to Current Channel with Servicing Profile
author: manoth-msft
ms.author: manoth
manager: dougeby
audience: ITPro
ms.topic: conceptual
ms.service: o365-proplus-itpro
ms.localizationpriority: medium
ms.collection: Tier3
description: "Guide for admins on switching devices to Current Channel for Microsoft 365 Apps using servicing profiles "
ms.date: 08/31/2023
---

# Move devices to Current Channel using servicing profiles

## Overview

At this time, participants of the [Microsoft 365 Copilot Early Access Program (EAP)](https://www.microsoft.com/en-us/microsoft-365/blog/2023/05/09/introducing-the-microsoft-365-copilot-early-access-program-and-new-capabilities-in-copilot/) must be on the latest supported release of Current Channel for Microsoft 365 Apps. This article provides configuration guidance and best practices on how to prepare Microsoft 365 Apps for the Copilot EAP using Servicing Profiles and Group Policies or Microsoft Intune.

We expect support for Microsoft 365 Copilot on Monthly Enterprise Channel in the future.

> [!NOTE]
> This article is solely focused on preparing your Microsoft 365 Apps for the Copilot Early Access Program (EAP). Other Copilot initiatives are not covered by this documentation.

> [!NOTE]
> The policies and configurations covered in this document are based on working best practices. It is highly recommended that you review, test, and validate according to the needs of your environment.
 
## Scope
This article covers recommendations for moving a subset of devices to Current Channel for Microsoft 365 Apps for current Servicing Profiles users. If you're managing your Microsoft 365 Apps updates through other technologies, refer to the articles on [Intune](move-devices-channel-intune.md), [Group Policies](move-devices-channel-group-policy.md) or [Configuration Manager](move-devices-channel-configmgr.md).

## Pre-Checks
Our general recommendation for Microsoft 365 Apps is to direct devices to the Office CDN. As Current Channel is receiving updates frequently, not on a set schedule, and multiple times a month, using the Office CDN is even more advised.
1.	Verify that your network allows devices to access the Microsoft CDN directly or through a proxy.
2.	Consider enabling [Delivery Optimization for Microsoft 365 Apps](../delivery-optimization.md) to help reduce the traffic on your internet links.

## Implementation
This section covers the recommended approach for moving devices to Current Channel that are currently managed with Servicing Profiles. It walks you through the necessary steps on how to exclude devices from the current profile and move them over to Current Channel using Microsoft Intune or Active Directory-based Group Policies.

### Create a security group
1.	Create a new security group in Microsoft Entra ID (previously Azure Active Directory) for Current Channel devices. For guidance on this step, refer to [QuickStart: Create a group with members](/azure/active-directory/fundamentals/groups-view-azure-portal).
2.	Add the computer objects to this security group that need to be moved to Current Channel and have update management applied to. 

### Exclude devices from Servicing Profile
Devices which have their Microsoft 365 Apps updates currently managed through Servicing Profiles ignore other update-related policies. Thus, you need to exclude those devices from Servicing Profile first, so they get released from the profile's update control.

1. Log into the [Microsoft 365 Apps admin center](https://config.office.com) and navigate to **Servicing** > **Monthly Enterprise**.
2. Switch to the **Settings** tab, the **Device Selection Criteria** page should open automatically.
3. Change the option **Exclude devices** from **Don't exclude any devices** to **Exclude specific groups of devices** if it isn't select already.
4. Add the group that you have created previously.
5. Scroll down and click **Save**.

> [!NOTE]
> It might take up to 24 hours for the service to process the change and send the instructions to offboard the Servicing Profile's update management to devices. 

### Assign Current Channel settings to devices
With the devices being released from Servicing Profile's control, you need to ensure that the settings to move to and stay on Current Channel are present on the device. Based on your available management solutions, implement one of the two following options.

- Microsoft recommends using Microsoft Intune to apply a configuration profile to the devices to move them to Current Channel. Within Intune, you can reuse the group you have created before. Follow the detailed [instructions for Intune](move-devices-channel-intune.md#implementation) to finish the implementation.
- If Intune isn't an option, you might want to use classic Active Directory-based group policies. Follow the [instructions for Group Policies](move-devices-channel-group-policy.md#implementation) to finish the implementation.

## Validation
You can validate the implementation by monitoring the following aspects:
- Within 24 hours, you should see the devices dropping of from the **devices** tab in Servicing Profiles.
- Within 24 hours, the following registry key should change to "**0**", as profile's control is lifted in the device:
   - HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\cloud\office\16.0\Common\officeupdate > IgnoreGPO
- When using Intune, within 8 hours you should see the policy being applied on devices.
- When using Group Policy, within 90 minutes (default setting) you should see the following registry key being created with multiple values in it:
   - HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\office\16.0\Common\officeupdate 
- Within the next 24 hours after above changes have happened on devices, they should start moving to Current Channel.
    - It switches from any channel to the latest build released into the Current Channel.
    - Other apps like Visio, Project or Access Runtime are migrated to Current Channel as well and are updated in the same pass.
- Use the inventory in the Microsoft 365 Apps admin center to monitor progress.
- It will switch from any channel to the latest build released into the Current Channel. Additional apps like Visio, Project or Access Runtime will be migrated to Current Channel as well and are updated in the same pass.

## More resources
Microsoft 365 Copilot
- [Introducing the Microsoft 365 Copilot Early Access Program and new capabilities in Copilot](https://www.microsoft.com/en-us/microsoft-365/blog/2023/05/09/introducing-the-microsoft-365-copilot-early-access-program-and-new-capabilities-in-copilot/)
- [How to prepare for Microsoft 365 Copilot](https://techcommunity.microsoft.com/t5/microsoft-365-copilot/how-to-prepare-for-microsoft-365-copilot/ba-p/3851566)

Microsoft 365 Apps Channel Management
- [Change the Microsoft 365 Apps update channel for devices in your organization](./change-update-channels.md)
-	[Managing Update Channels for Microsoft 365 Apps](https://www.youtube.com/watch?v=rIpoloAZnSg) on YouTube
-	[Explained - Microsoft 365 Apps Update Channels](https://www.youtube.com/watch?v=eNn4PDkmo7s) on YouTube
