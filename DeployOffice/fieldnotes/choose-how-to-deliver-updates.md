---
title: Update options for Office 365 ProPlus
author: davguent
ms.author: davguent
manager: 
audience: ITPro 
ms.topic: article 
ms.service: o365-proplus-itpro
localization_priority: 
description: 
ms.custom: 
ms.collection: 
---

# Choose how to deliver updates for Microsoft 365 Apps

> [!NOTE]
> This article was written by Microsoft experts in the field who work with enterprise customers to deploy Office.

There are a variety of options to choose from when delivering software updates for Microsoft 365 Apps (previously named Office 365 ProPlus).  This article outlines the advantages and disadvantages of each approach to help you make the right choice. I'm assuming that most customers are coming from an on-premises only solution and are contemplating moving to a hybrid or cloud strategy to reduce overall cost of ownership.

## Evaluating the Options

The overwhelming majority of customers I work with in the field remain on-premises when delivering software updates for Microsoft 365 Apps.  The original version of Office 2013 Click-to-Run was released years ago, when options were very limited and network transport optimizations didn't exist.  Only one Office channel existed and architecture was 32-bit.  Further, capabilities to update Office using Microsoft Endpoint Configuration Manager were unavailable.  Many customers used an on-premises file share and mirrored Office CDN content each month.  Microsoft 365 Apps has evolved since then to provide customers with many more options, including multiple channels, languages, and 64-bit architecture. These options can lead to a large increase in the amount of content IT Pros must download and replicate on-premises.

There have been tremendous innovations in Windows and Configuration Manage that provide many new capabilities.  With so many choices and combinations, a visual aid may help you choose how to manage updates.  The flowchart below is a comparison of update options, with a special focus on network transport and end user notifications. Choosing an update option determines what process is delivering notifications to the end user (Office or Configuration Manager).  For example, if the customer wants to hide or control precise timing of software updates and the level of notifications, Configuration Manager should be considered.  If the customer values network optimization and lowest cost of ownership to service Office, then update from CDN with Delivery Optimization (DO) should be considered.  

By default, Microsoft 365 Apps will update from Office CDN.  If you are a customer who currently delivers updates using one of the on-premises selections, you must reverse policies and configurations to restore default behavior.  For example, if Office 365 Client Management was enabled to support Configuration Manager integration, those steps must be reversed. Configuration Manager client settings or domain policy should be set so that Office 365 Client Management is disabled. If you make that change, Office will update against CDN next after the next restart of the  Microsoft Office Click-to-Run service. It's always a good idea to perform such an action with phased deployment process to monitor impact, especially to your network.

:::image type="content" source="../images/update-options-flowchart.png" alt-text="Update options for Microsoft 365 Apps":::

## Network options for updates

[Add intro here]

- File share: Server Message Block
- Configuration Manager (on-premises): BITS, Peer Cache [confirm that BITS is accurate]
- Configuration Manager (on-premises and cloud): BITS (cloud), Peer Cache (on-premises)
- Configuration Manager (cloud): BITS
- Office CDN: Delivery optimization, connected cache

## End-user notifications

End user notifications for software updates are a key concern for any IT department.  By default, Microsoft 365 Apps update automatically in the background.  If Office is open, notifications will be delivered to the end user over a period of days. For a full description of notifications and end user experience, see [End-user update notifications for Office 365 ProPlus](../end-user-update-notifications-for-office-365-proplus.md). IT Pros can optionally silence all end user Office notifications by using the "Hide update notifications from users" policy. Note that the policy setting won't be applied if [explain "Policy\registry setting doesn't apply to deadline notifications when defined"]  

When Office 365 Client Management is enabled (OfficeMgmtCom=1), Configuration Manager will also deliver notifications. To learn more, see [Understanding Office 365 ProPlus Updates for IT Pros](https://techcommunity.microsoft.com/t5/office-365-blog/understanding-office-365-proplus-updates-for-it-pros-cdn-vs-sccm/ba-p/795728).  Its important to carefully consider ramifications of user notifications when considering an update strategy. 

- File share: Office notifications
- Configuration Manager (on-premises): Configuration Manager notifications
- Configuration Manager (on-premises and cloud): Configuration Manager notifications
- Configuration Manager (cloud): Configuration Manager notifications
- Office CDN: Office notifications

When you use Configuration Manager, your end users can receive both Configuration Manager and Office notifications if the update pre-staged on the device. For more information, see [How to manage Office 365 ProPlus Channels](https://techcommunity.microsoft.com/t5/office-365-blog/how-to-manage-office-365-proplus-channels-for-it-pros/ba-p/795813).

## Updates delivered from file share

Advantages: none

Disadvantages: This method is discouraged due to the high cost of ownership and repetitive, manual intensive processes.  Modern network peer to peer solutions like Delivery Optimization and Peer Cache don't apply when updating Microsoft 365 Apps update from a file share.

End-user notifications: Delivered only by Office.

## Updates delivered by Configuration Manager (on-premises)

Advantages: 
- Office clients fetch updates only from the closest distribution point.
- Binary delta compression is used to optimize the payload downloaded from distributions points to clients.
- Full control over end user notifications.

Disadvantages:
- Requires the IT Pro to download all the content required to support every permutation of channel, architecture and combination of languages the organization supports.
- Every permutation of Office supported leads to exponential growth of package content which must be replicated to every Distribution Point.
- If any required content is not found on the Distribution Point, the Office client will fail to update.

End-user notifications: Delivered by Configuration Manager and, in some cases, Office. [Review for accuracy--we don't say in the end-user section that Office only is a possibility]

## Updates delivered by Configuration Manager (on-premises and cloud)

Advantages: 
- Optimizes bandwidth where IT Pro can stage on-premises content which are often required and offload to CDN for those which aren't.  Great example is languages.  Use Configuration Manager inventory to identify primary languages and stage only those on-premises, offload secondary languages and proofing tools to pull from CDN.
- Supports Configuration Manager Peer Cache feature but only for content which is staged on Distribution Points.

Disadvantages:
- A subset of content not found on the Distribution Point is downloaded using BITS from the Microsoft CDN. (Note that the Configuration Manager Peer Cache feature does not support content that is downloaded from the Office CDN.)
- The IT Pro must carefully consider which content to download and what should come from CDN.
- The IT Pro must make intentional decisions regarding specific builds\versions by channels to download each month.
- End user notifications are delivered only by Office only, Office and Configuration Manager or only Configuration Manager.

End-user notifications: Delivered by Configuration Manager and, in some cases, Office. [Review for accuracy--we don't say in the end-user section that Office only is a possibility]

## Updates delivered by Configuration Manager (cloud)

Advantages: 
- IT Pro remains in full control of software deployment available vs deadlines using Configuration Manager.  
- All content will download from CDN as content is not present on distribution points.

Disadvantages:
- Each workstation will egress to the internet to download content via BITS from the Microsoft CDN. (Note that the Configuration Manager Peer Cache feature does not support content that is downloaded from the Office CDN.)
- The IT Pro must make intentional decisions regarding specific builds\versions by channels to download each month.

End-user notifications: Delivered by Configuration Manager and, in some cases, Office. [Review for accuracy--we don't say in the end-user section that Office only is a possibility]

## Updates delivered from Office CDN (Microsoft recommended)

Advantages: 
- Will take advantage of binary delta compression to optimize content downloaded from the Microsoft CDN.
- Supports advanced network optimization technologies like Delivery Optimization and Configuration Manager Connected Cache.  These solutions also support other workloads such as Windows 10 updates (feature updates and quality updates), Windows 10 drivers, Windows Store files, Windows Store for Business files, Windows Defender definition updates, Win32 apps for Intune and SCCM Express Updates.
- IT Pro remains in control, but clients pull what is needed automatically.  No need for admin to micro-manage intentional downloads each month.
- Office was designed to update from the Microsoft CDN which allows additional capabilities such as rollback or roll forward based on group policy configuration.
- Aligns with Microsoft's vision of "Modern Workplace" where users roam and work remotely.

Disadvantages:
- Requires extensive boundary configuration within Configuration Manager.
- The IT Pro will need to review the network topology to ensure clients are performing peer to peer sharing from sources close to client.
- Extensive controls of Delivery Optimization require review.
- The IT Pro must transition from push mentality to allow clients to pull content dynamically.
- Microsoft validates signals from builds released prior to broad deployment referred to as "Throttling".  This means not all clients will receive the update at the same time and not appropriate for traditional "maintenance windows" et
- The networking team should follow Microsoft best practice and whitelist\bypass proxy for Microsoft CDN endpoints.

End-user notifications: Delivered by Office.