---
title: Choose how to deliver updates
author: manoth-msft
ms.author: manoth
manager: dougeby
audience: ITPro 
ms.topic: conceptual 
ms.service: o365-proplus-itpro
ms.localizationpriority: medium
ms.collection: Tier3
description: "Choose how to deliver updates for the Microsoft 365 Apps"
ms.date: 03/13/2024
---

# Choose how to deliver updates

There are various options to choose from when delivering software updates for Microsoft 365 Apps in managed environments. This article outlines the advantages and disadvantages of each approach to help you make the right choice. Any update deployment implementation can be changed later. These options apply to scenarios where you start fresh with Microsoft 365 Apps or when reevaluating your current implementation.

First, this article covers three different update locations you can choose from and lay out the individual differences and network implications. Second, the available options for controlling updates per update location are listed, again covering the individual benefits and considerations per mechanism. Here's an overview, in case you want to jump to a section directly:

- [Using the cloud for updates](#updates-from-the-cloud)
    - [Automatic Updates or Microsoft Intune](#automatic-update--microsoft-intune)
    - [Cloud Update](#cloud-update)
- [Using on-premises locations for updates](#updates-from-on-premises-locations)
    - [Microsoft Configuration Manager](#microsoft-configuration-manager)
    - [Network shares](#network-shares)
- [Combining cloud and on-premises locations for updates (hybrid)](#updates-from-mixed-on-premises-and-cloud-locations-hybrid)
    - [Microsoft Configuration Manager](#microsoft-configuration-manager-1)

> [!NOTE]
> The Office Update Engine will always update all Click-to-Run-based products and apps together and with the same mechanism. For example, if a device has the Microsoft 365 Apps as well as Visio desktop app installed and the updates are configured to happen through cloud update, both products will be updated at the same time. It is not possible to mix and match update mechanisms (for example Visio desktop app updates from the Office CDN, but the Microsoft 365 Apps from an on-premises file share).

## Step 1: Choose your update source: Cloud, on-premises location, or hybrid

The first step in deciding how the Microsoft 365 Apps should be updated, is to choose where updates should be delivered from: From [the cloud](#updates-from-the-cloud), from [on-premises locations](#updates-from-on-premises-locations) or a [mix of both (also known as "hybrid")](#updates-from-mixed-on-premises-and-cloud-locations-hybrid). The following section lays out these sources and calls out the individual benefits and challenges. The second step is to review and choose a fitting [solution for managing updates](#step-2-choose-your-way-to-manage-updates) for the chosen update source.

### Updates from the cloud
When the Microsoft 365 Apps are pulling updates from the Microsoft Office Content Delivery Network (Office CDN), this is referred to as cloud-based updates. Microsoft operates a worldwide, distributed network of datacenters that hosts all updates for the Microsoft 365 Apps for all available update channels, languages, related products like Visio and Project, and architectures (32/64 bit). The Office CDN also contains a history of released updates, so updating to specific releases or rolling back to older ones is also possible.

> [!TIP]
> Microsoft recommends to use the cloud as update source.

There are two core benefits when leveraging the cloud as your update source:
- **Delta updates**: When the Microsoft 365 Apps pull the latest updates, only the difference between the currently installed release and the targeted one is downloaded. So instead of having to handle the whole source files package, only delta differences, in certain scenarios down to a subfile level, are downloaded. This conserves significant bandwidth.
- **No source files maintenance** needed: As the updates are hosted worldwide at Microsoft's datacenters, there's no need for downloading, packaging, staging and distributing the source files in your on-premises network. As updates are specific to architecture, update channel and languages, this can become a complex task in for example multi-language environments.

When using the cloud as your update source, there are also some considerations:
- **Network connectivity**: Devices must be able to connect to the Office CDN. For this the URLs and IPs listed in [Office 365 URLs and IP address ranges](/Microsoft-365/enterprise/urls-and-ip-address-ranges#microsoft-365-common-and-office-online) must be accessible for devices. Microsoft recommends allowing devices to connect to the Office CDN on a system-level, bypassing any proxy servers to ensure best performance. We recommend reviewing the [Download sizes for updates to Microsoft 365 Apps](/officeupdates/download-sizes-microsoft365-apps-updates) to assess the impact on the network.
- **Delivery Optimization**: In all cloud-based update scenarios, the update mechanism can and will use [Delivery Optimization](../updates/delivery-optimization.md) when available. This allows devices to share the required sources in a peer-to-peer fashion and reduces the amount of data that needs to be downloaded from the internet. Microsoft recommends the usage of Delivery Optimization. If [Connected Caches](/windows/deployment/do/waas-microsoft-connected-cache) are deployed and configured, those will also be used. Especially [Microsoft Connected Cache in Configuration Manager](/mem/configmgr/core/plan-design/hierarchy/microsoft-connected-cache) is straight forward to implement and is recommended for environments with existing Configuration Manager infrastructures.
- **VPN bypass**: When using virtual private network (VPN) solutions, it's recommended to bypass the VPN tunnel when downloading data from the Office CDN. This reduces the load on the VPN infrastructure, network uplinks and allows for faster downloads.

### Updates from on-premises locations
The Microsoft 365 Apps support multiple on-premises locations for updates. The required source files can be hosted on network shares, in local folders or drives, or on Configuration Manager's distribution points. Common among all these options are that the admin is responsible for ensuring that the required sources for all employed update channels, languages, and architectures (32/64 bit) are available. Otherwise, the update would fail.

The main advantage of using on-premises locations is that devices don't need to pull down data from the internet to update. If repositories are available on all sites, the network traffic happens locally in the Local Area Network (LAN). In case not all sites have infrastructure, the traffic might have to flow over the Wide Area Network (WAN).

In general, Microsoft no longer recommends to host updates on-premises due to the following challenges:
- **Source file maintenance**: When update sources are hosted on-premises, the admin must ensure that the required releases for all deployed update channels, languages and architectures are available. As Microsoft releases security updates on a monthly schedule, the on-premises repositories would have to be updated with the same cadence to stay current and secure.
- **Source size**: As Microsoft doesn't release individual patches, but rather a new set of source files, the source files for an update for a specific update channel and architecture are about 3.5 GB in size. Each included language pack adds 100-300 MB to this source file set. For example, when devices run a mix of 32 bit and 64 bit, on Current Channel with three included language packs, this means 2 * 4 GB of source files that have to be downloaded and synchronized across the update locations on a monthly schedule.
- **Finding nearest update location**: If network shares are used for hosting updates, devices need a way to identify the closest network share to limit WAN traffic. This could be addressed by using [group policy preferences with Site targeting](/previous-versions/windows/it-pro/windows-server-2012-r2-and-2012/dn789189(v=ws.11)#site-targeting) or custom scripting, but this increases the complexity of the implementation. If updates are managed by Configuration Manager, the before mentioned doesn't apply, as devices determine the nearest distribution point automatically.
- **No Delivery Optimization**: When updates are hosted in on-premises locations, the Microsoft 365 Apps can't apply Delivery Optimization for reducing the network impact. All devices pull their individual set of delta files down. When using Microsoft Configuration Manager, this can be mitigated by using [Peer Cache](/troubleshoot/mem/configmgr/configure-peer-cache).


### Updates from mixed on-premises and cloud locations (hybrid)

With Configuration Manager, it's possible to implement a hybrid model. This scenario combines hosting a subset of sources (for example for the most commonly deployed languages) on distribution points with allowing the devices to acquire missing pieces from the Office CDN, for example for rarely deployed language packs.

The hybrid approach has advantages in scenarios when limited internet bandwidth demands to host update sources on-premises, but a small subset of devices running on a different update channel and would require the maintenance of a full update source file set. In this specific scenario, a hybrid approach might help by deploying updates for most devices from on-premises locations, but while updates for the smaller subsets are still triggered through Configuration Manager, the source files aren't available on distribution points and devices are allowed to fall back to the Office CDN in this case.

The hybrid approach shares the same disadvantages as the on-premises approach, even so the complexity of source file maintenance is reduced in direct comparison.

> [!NOTE]
> Devices, which gets their updates signaled through Configuration Manager, cannot leverage Delivery Optimization, even if the sources are pulled down from the Office CDN. This is a limitation of the download mechanism of Configuration Manager.


## Step 2: Choose your way to manage updates

Based on your preferred update source location, there are several solutions for update management available. The following sections lay out these options per update source, touch on benefits and challenges and provide links to additional information.

## Update solutions for cloud-based updates

### Automatic Update / Microsoft Intune

Default configuration of the Microsoft 365 Apps. If not otherwise configured, devices will automatically check in with the Office CDN on a regular base and pull-down updates automatically. If the Microsoft 365 Apps were deployed using [Intune](/mem/intune/apps/apps-add-office365), this is also the default configuration.

**Benefits**
- No upfront configuration needed. Just works out of the box.
- Rollback available through the [Microsoft 365 admin center](https://admin.cloud.microsoft/Adminportal/Home#/Settings/Services/:/Settings/L1/SoftwareDownload) for devices on Monthly Enterprise Channel.

**Considerations**
- Microsoft validates signals from builds released prior to broad deployment referred to as "Throttling". This throttling means not all clients receive the update at the same time, but in a staggered manner.
- By default, updates aren't enforced. This can be mitigated by applying the **Update deadline** group policy setting for Office.
- Features like rollback and skipping releases through the [Microsoft 365 admin center](https://admin.cloud.microsoft/Adminportal/Home#/Settings/Services/:/Settings/L1/SoftwareDownload) doesn't apply to Microsoft 365 Apps installations with custom update settings or which are managed by Intune, Configuration Manager, or cloud update.
- Use [Security Update Status](https://config.office.com/officeSettings/currency) in the [Microsoft 365 Apps admin center](../admin-center/overview.md) to monitor update adoption rate and compliance.

### Cloud update

[Cloud update](../admin-center/cloud-update.md) is a cloud-based update management solution for devices on Monthly Enterprise Channel and Current Channel. It's an end-to-end solution for managing updates for the Microsoft 365 Apps. It includes monitoring, reporting, enforcing, staggering, and rolling back devices.

> [!NOTE]
> Using cloud update is Microsoft's recommended solution for Microsoft 365 Apps on Monthly Enterprise Channel or Current Channel.

**Benefits**
- Update solution specifically built for the Microsoft 365 Apps
- Detailed reporting about update status, progress and encountered issues
- Allows admins to pause or rollback updates if there's any issues
- Allows admins to set deadlines for update enforcement
- Applies to all Microsoft 365 Apps instances connected to the tenant, regardless of management or directory domain
- [Update validation](../admin-center/update-validation.md) allows you to validate new updates on a first test ring

**Considerations**
- Cloud update supports Monthly Enterprise Channel and Current Channel. Devices on other channels can't be managed.
- Consider using custom rollout waves to control order and timing of devices getting updates, enabling you to validate updates with a pilot group first.

**Additional information**
- [Overview of cloud update](../admin-center/cloud-update.md)
- [Introductional videos](https://www.youtube.com/playlist?list=PLcUacJY1uG-hjdeyfJjQnl67hEPyPE8ed)

## Update solutions for on-premises-based updates

### Microsoft Configuration Manager
Configuration Manager can be used to deploy updates for Microsoft 365 Apps the same way as it allows management of updates, for example, Microsoft Windows. By default, the required sources will be downloaded from the Office CDN by Configuration Manager and then synchronized and staged on distribution points.


**Benefits** 
- Office clients fetch updates only from the closest distribution point, removing the need to download content over internet circuits
- Full control over end-user notifications, maintenance windows and enforcement through Configuration Manager
- Granular control over which devices get the updates when

**Considerations**
- Requires the admin to download all content required to support every permutation of channel, architecture, and combination of languages the organization supports
- Every permutation of Office supported leads to exponential growth of package content. This content must then be replicated to every distribution point
- By default, any required content not found on the distribution point results in Microsoft 365 Apps client update failure
- No support for rolling back updates. Only way is to perform a reinstallation of an older build.
- Limited to Configuration Manager-/co-managed devices

> [!NOTE]
> A managed device downloads only the required changes from a Distribution Point. So when making multiple channels and architectures available to clients, they will not download all the content, but only what's required for that client.


### Network shares
Admins can choose to download the latest releases using the [Office Deployment Tool](https://aka.ms/ODT) and stage the files on network shares, in local folders, on USB thumb drives or http/https-based locations. Then the **UpdatePath** setting in the [configuration file](../deploy/office-deployment-tool-configuration-options.md#updatepath-attribute-part-of-updates-element) or from group policies can be used, to point devices to the location.

> [!NOTE]
> This method is discouraged due to the high cost of ownership and repetitive, manual intensive processes. It should only be implemented after carefully evaluating  alternative options.

**Benefits**
- Devices fetch updates from on-premises source, removing the need to download content over internet circuits

**Considerations**
- Requires the admin to download all content required to support every permutation of channel, architecture, and combination of languages the organization supports
- Every permutation of Office supported leads to exponential growth of package content. This content must then be replicated to every share
- By default, any required content not found on the distribution point results in Microsoft 365 Apps client update failure


## Update solutions for hybrid update sources

### Microsoft Configuration Manager
Configuration Manager can be used to deploy updates for Microsoft 365 Apps the same way as it allows management of updates, for example, Microsoft Windows. By enabling the options **If software updates are not available on distribution point in current, neighbor or site boundary groups, download content from Microsoft Updates** when configuring the update deployment package, devices are allowed to fall back to Office CDN for missing sources. This enables admins to reduce the number of languages that need to be synchronized to distribution points. If certain language packs are only scarcely deployed, those devices pull down the required update sources from the Office CDN, while getting the core content from a distribution point.

**Benefits** 
- Optimizes bandwidth where admins can stage the on-premises content that is required and offload content that isn't required to the CDN. A great example is languages. 

**Considerations**
- The IT Pro must carefully consider which content to download and what should come from CDN.
- The IT Pro must make intentional decisions regarding specific builds\versions by channels to download each month.
- Supports Configuration Manager Peer Cache feature for content downloaded from distribution points. Content from Office CDN will be downloaded using BITS (no Delivery Optimization support available).
