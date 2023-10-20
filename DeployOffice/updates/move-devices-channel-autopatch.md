---
title: Copilot - Move a subset of devices to Current Channel with Autopatch
author: manoth-msft
ms.author: roclemen
manager: dougeby
audience: ITPro 
ms.topic: conceptual 
ms.service: o365-proplus-itpro
ms.localizationpriority: medium
ROBOTS: NOINDEX, NOFOLLOW
ms.collection: Tier3
description: "Guide for admins on switching devices to Current Channel for Microsoft 365 Apps using Microsoft Autopatch"
ms.date: 09/01/2023
---

# Move devices to Current Channel using Microsoft Autopatch

## Overview
At this time, participants of the [Microsoft 365 Copilot Early Access Program (EAP)](https://www.microsoft.com/en-us/microsoft-365/blog/2023/05/09/introducing-the-microsoft-365-copilot-early-access-program-and-new-capabilities-in-copilot/) must be on the latest supported release of Current Channel for Microsoft 365 Apps. This article provides configuration guidance and best practices on how to prepare Microsoft 365 Apps for the Copilot EAP using [Microsoft Autopatch](/windows/deployment/windows-autopatch/overview/windows-autopatch-overview).

> [!NOTE]
> This article is solely focused on preparing your Microsoft 365 Apps for the Copilot Early Access Program (EAP). Other Copilot initiatives are not covered by this documentation.

> [!NOTE]
> The policies and configurations covered in this document are based on working best practices. It is highly recommended that you review, test, and validate according to the needs of your environment.
 
## Scope
This article covers recommendations for moving a subset of devices to Current Channel for Microsoft 365 Apps, with Windows Autopatch. If you're managing your Microsoft 365 Apps updates through other technologies, refer to the articles on [Cloud Update](move-devices-channel-cloudupdate.md), [Intune](move-devices-channel-intune.md), [Configuration Manager](move-devices-channel-ConfigMgr.md), [Servicing Profiles](move-devices-channel-servicingprofiles.md), or [group policies](move-devices-channel-group-policy.md).

## Pre-Checks
Our general recommendation for Microsoft 365 Apps is to direct devices to the Office CDN. As Current Channel is receiving updates frequently, not on a set schedule, and multiple times a month, using the Office CDN is even more advised.
1.	Verify that your network allows devices to access the Microsoft CDN directly or through a proxy.
2.	Consider enabling [Delivery Optimization for Microsoft 365 Apps](../delivery-optimization.md) to help reduce the traffic on your internet links.

## Implementation
This section covers the recommended settings for managing the update channel and update servicing options for Microsoft 365 Apps with Windows Autopatch. All devices registered for Windows Autopatch receive updates from the Monthly Enterprise Channel, as outlined in the [Service level objective](/windows/deployment/windows-autopatch/operate/windows-autopatch-microsoft-365-apps-enterprise#update-release-schedule).

To move a subset of devices to Current Channel, you can choose from two options:
1. Remove the devices for Copilot EAP from Windows Autopatch and configure updates using Microsoft Intune.  
   1. **Benefits**: This option limits the policy changes to the subset of devices you're using for Copilot EAP, enabling you to target separate policy settings for Microsoft 365 Apps. 
   2. **Considerations**: This option removes update management for Windows Updates, requiring you to setup and manage standalone Windows Update for Business policies. 

2. Disable update management for Microsoft 365 Apps in Windows Autopatch. 
    1. **Benefits**: This option keeps devices registered with Windows Autopatch for Windows Updates and reporting.
    2. **Considerations**: This option removes the update management for Microsoft 365 Apps across all Autopatch devices. You have to set up standalone update policies for all devices to keep them secure, versus those that are only used for Copilot EAP. 

### Option 1: Remove devices from Windows Autopatch for Copilot EAP 
To avoid disruption across your devices, plan your policy changes and timing accordingly.
1. Create and assign a new Intune configuration profile for Microsoft 365 Apps, as described in [Move devices to Current Channel using Microsoft Intune](move-devices-channel-intune.md).
2. Create and assign a new Windows Update for Business policy, as described in [Configure Windows Update for Business](/windows/deployment/update/waas-configure-wufb).
3. Remove your Copilot EAP devices from Windows Autopatch, as described in [Exclude a device from Windows Autopatch](/windows/deployment/windows-autopatch/operate/windows-autopatch-exclude-device). 

### Option 2: Disable updates for Microsoft 365 Apps from Windows Autopatch for Copilot EAP 
To avoid disruption across your devices, plan your policy changes and timing accordingly.
1. Create and assign a new Intune configuration profile for Microsoft 365 Apps, as described in [Move devices to Current Channel using Microsoft Intune](move-devices-channel-intune.md).
2. Disable updates for Microsoft 365 Apps, as described in [Allow or block Microsoft 365 Apps updates](/windows/deployment/windows-autopatch/operate/windows-autopatch-microsoft-365-apps-enterprise#allow-or-block-microsoft-365-app-updates). 

## More resources
Microsoft 365 Copilot
- [Introducing the Microsoft 365 Copilot Early Access Program and new capabilities in Copilot](https://www.microsoft.com/en-us/microsoft-365/blog/2023/05/09/introducing-the-microsoft-365-copilot-early-access-program-and-new-capabilities-in-copilot/)
- [How to prepare for Microsoft 365 Copilot](https://techcommunity.microsoft.com/t5/microsoft-365-copilot/how-to-prepare-for-microsoft-365-copilot/ba-p/3851566)

Microsoft 365 Apps Channel Management
- [Change the Microsoft 365 Apps update channel for devices in your organization](./change-update-channels.md)
-	[Managing Update Channels for Microsoft 365 Apps](https://www.youtube.com/watch?v=rIpoloAZnSg) on YouTube
-	[Explained - Microsoft 365 Apps Update Channels](https://www.youtube.com/watch?v=eNn4PDkmo7s) on YouTube
