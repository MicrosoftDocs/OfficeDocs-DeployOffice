---
title: Copilot - Move a subset of devices to Current Channel with Intune
author: manoth-msft
ms.author: roclemen
manager: dougeby
audience: ITPro 
ms.topic: conceptual 
ms.service: o365-proplus-itpro
ms.localizationpriority: medium
ms.collection: Tier3
description: "Guide for admins on switching devices to Current Channel for Microsoft 365 Apps using Intune "
ms.date: 08/31/2023
---

# Move devices to Current Channel using Microsoft Intune

## Overview

At this time, participants of the [Microsoft 365 Copilot Early Access Program (EAP)](https://www.microsoft.com/en-us/microsoft-365/blog/2023/05/09/introducing-the-microsoft-365-copilot-early-access-program-and-new-capabilities-in-copilot/) must be on the latest supported release of Current Channel for Microsoft 365 Apps. This article provides configuration guidance and best practices on how to prepare Microsoft 365 Apps for the Copilot EAP using Microsoft Intune.

We expect support for Microsoft 365 Copilot on Monthly Enterprise Channel in the future.

> [!NOTE]
> This article is solely focused on preparing your Microsoft 365 Apps for the Copilot Early Access Program (EAP). Other Copilot initiatives are not covered by this documentation.

> [!NOTE]
> The policies and configurations covered in this document are based on working best practices. It is highly recommended that you review, test, and validate according to the needs of your environment.
 
## Scope
This article covers recommendations for moving a subset of devices to Current Channel for Microsoft 365 Apps, using Microsoft Intune. If you're managing your Microsoft 365 Apps updates through other technologies, refer to the articles on [Configuration Manager](move-devices-channel-configmgr.md), [Group Policies](move-devices-channel-group-policy.md) or [Servicing Profiles](move-devices-channel-servicingprofiles.md).

## Pre-Checks
Our general recommendation for Microsoft 365 Apps is to direct devices to the Office CDN. As Current Channel is receiving updates frequently, not on a set schedule, and multiple times a month, using the Office CDN is even more advised.
1.	Verify that your network allows devices to access the Microsoft CDN directly or through a proxy.
2.	Consider enabling [Delivery Optimization for Microsoft 365 Apps](../delivery-optimization.md) to help reduce the traffic on your internet links.

## Implementation
In this section, we cover the recommended policy settings for managing the update channel and update servicing options for Microsoft 365 Apps using Microsoft Intune. 

### Create a security group
1.	Create a new security group in Microsoft Entra ID (previously Azure Active Directory) for Current Channel devices. For guidance on this step, refer to [QuickStart: Create a group with members](/azure/active-directory/fundamentals/groups-view-azure-portal).
2.	Add the computer objects to this security group that need to be moved to Current Channel and have update management applied to. 

### Create a configuration profile
Create a new configuration profile in Microsoft Intune for Current Channel. Refer to the following steps:
1.	Sign in to [https://endpoint.microsoft.com/](https://endpoint.microsoft.com/) with an account that has the Intune Administrator role.
2.	From the left navigation, select **Devices**.
3.	Under **Policy**, select **Configuration profiles**.
4.	From the **Devices | Configuration profile**s page, select **+ Create profile**.
5.	From the **Create a profile** flyout, select the following and click **Create**:
    - Platform: Windows 10 and later
    - Profile type: Settings catalog
6.	From the **Create profile** page, on the **Basics** tab, provide a name for this profile and select **Next**. For example: **Profile – Microsoft 365 Apps on CC**.
7.	From the **Configuration settings** tab, select **+Add settings**.
8.	From the **Settings picker** flyout, select **Microsoft Office 2016 (Machine) > Updates**.
9.	On the lower-third of the flyout, mark the checkboxes for the following settings and apply the corresponding configuration. 


|**Setting Name**  |**Configuration**  |
|:---|:---|
|Enable Automatic Updates|Enabled|
|Hide option to enable or disable updates|Enabled|
|Hide update notifications|Disabled|
|Office 365 Client Management|Disabled|
|Update Channel|Enabled → Current Channel|
|Update Deadline|Enabled → 1|
|Update Path|Enabled → `http://officecdn.microsoft.com/pr/492350f6-3a01-4f97-b9c0-c7c6ddf67d60`|
|Target Version|Disabled|

10.	select **Next**.
11.	From the **Scope tags** tab, select **Next**.
12.	From the **Assignments** tab, add your Current Channel security group and select **Next**. 
13.	On the **Review + create** tab, select **Create**.

## Monitor assignment
Monitor the progress of your configuration profile assignment using the following steps:
1.	From the left navigation, select **Devices**.
2.	Under **Policy**, select **Configuration profiles**.
3.	Locate the policy you want to monitor and select it. Review the status at the top of the profile page.

The Microsoft 365 Apps perform the full update channel switch within the next 24 hours.evices switch from any channel to the latest build released into the Current Channel. Other apps like Visio, Project or Access Runtime are migrated to Current Channel as well and are updated in the same pass.

## More resources
Microsoft 365 Copilot
- [Introducing the Microsoft 365 Copilot Early Access Program and new capabilities in Copilot](https://www.microsoft.com/en-us/microsoft-365/blog/2023/05/09/introducing-the-microsoft-365-copilot-early-access-program-and-new-capabilities-in-copilot/)
- [How to prepare for Microsoft 365 Copilot](https://techcommunity.microsoft.com/t5/microsoft-365-copilot/how-to-prepare-for-microsoft-365-copilot/ba-p/3851566)

Microsoft 365 Apps Channel Management
- [Change the Microsoft 365 Apps update channel for devices in your organization](./change-update-channels.md)
-	[Managing Update Channels for Microsoft 365 Apps](https://www.youtube.com/watch?v=rIpoloAZnSg) on YouTube
-	[Explained - Microsoft 365 Apps Update Channels](https://www.youtube.com/watch?v=eNn4PDkmo7s) on YouTube

