---
title: Roadmap to modern management of Microsoft 365 Apps in the enterprise
author: manoth-msft
ms.author: manoth
manager: dougeby
audience: ITPro 
ms.topic: conceptual 
ms.service: o365-proplus-itpro
ms.localizationpriority: medium
ms.collection: Tier3
description: "Roadmap to modern management of Microsoft 365 Apps in the enterprise"
ms.date: 03/20/2024
---

# Roadmap to modern management of Microsoft 365 Apps in the enterprise

The [Microsoft 365 Apps admin center](https://config.office.com/) provides new admin capabilities to monitor, manage, and update the installation of Microsoft 365 Apps for enterprise. Based on customer conversations, here are some best practices on how to adopt these new features.

There's no definitive or required way to adopt these features. But the order described in this article helps admins quickly recognize the benefits, while keeping the rate of change manageable. Adjust the approach to the needs of your organization. If you want to explore the user interface and options beforehand, we have interactive demos for [Microsoft 365 Apps health](https://octe.azurewebsites.net/Microsoft/viewer/185/index.html#/1/0) and the [inventory](https://octe.azurewebsites.net/Microsoft/viewer/185/index.html#/2/0) available.

## Get insights within minutes: Microsoft 365 Apps health

A good starting point is to adopt [Microsoft 365 Apps health](../admin-center/microsoft-365-apps-health.md). This feature provides insights into the stability, performance, and deployed builds of the Microsoft 365 Apps in your environment. It uses diagnostic data sent by your devices, so you don't have to deploy another infrastructure or software agents to use it. You can get insights into the health of your Microsoft 365 Apps within minutes.

How to enable Microsoft 365 Apps health:

1. Sign in to the Microsoft 365 Apps admin center at [config.office.com](https://config.office.com/).
2. Navigate to **Health** > **Apps health** and choose **Get started** to enable the feature.

It takes up to 3 hours for the service to be provisioned. You can then access:

- Crash rates on a per-application level, grouped by version.
- Performance metrics, such as application launch times and document load times.
- Channel metrics, such as which channels and builds are sending diagnostic data.

You can also compare two builds. This feature enables you to quickly assess if a newly deployed build is more stable and faster than the previous build. You then can proactively address issues, as opposed to waiting for issues to surface after you release a new build into your environment.

There's a minimum number of sessions required per app and version. This minimum ensures that Microsoft 365 Apps health can calculate reliable insights. A *session* is the period from launching an application until it's closed. For example, you're likely to see more sessions from an app like Microsoft Excel than Outlook.

If you disabled Diagnostic Data for Office on your devices, you might only see a subset of your devices or none at all. To get the full benefit from Microsoft 365 Apps health, you have to [enable Diagnostic Data](../privacy/manage-privacy-controls.md#policy-setting-for-diagnostic-data) and set the level to *Optional*.

## Get insights per device: Inventory and security update status

Another new feature is Inventory. It's specifically tailored for the Microsoft 365 Apps on Windows. You get a full overview of all installations which are activated and connected to your tenant. There is no limit when it comes to management or directory domain. Regardless if a device is managed or not, joint into any directory service (or not), Inventory will provide you with insights. All devices running at least Version 2008 of Microsoft 365 Apps will automatically register after enabling the feature:

1. Sign in to the Apps Admin Center at [config.office.com](https://config.office.com/).
2. Navigate to **Inventory** and choose **Get started** to enable the feature.

It usually takes up to 10 minutes for provisioning the service. After this has finished, devices will start to register into the inventory, and you can drill through data points like:

- Update channel
- Versions deployed
- Apps deployed
- Architecture
- Installed add-ins
- Whether macros are used on the device

It also populates the [Security update status](../admin-center/security-update-status.md) page, which provides an overview of:
- Which channels are deployed
- How many devices are on the latest security update
- Which devices are behind schedule and need attention

The Microsoft 365 Apps installation itself provides the inventory information, so there's no conflict with existing management solutions. For example, a device can be managed by Microsoft Intune and registered into the new tenant-based inventory at the same time.

## Move devices to Monthly Enterprise Channel

Moving your devices to the [Monthly Enterprise Channel](../updates/overview-update-channels.md#monthly-enterprise-channel-overview) provides a good balance between receiving monthly feature and quality updates (similar to [Current Channel](../updates/overview-update-channels.md#current-channel-overview)), while having a predictable cadence with only one update per month.

We highly recommend testing out Monthly Enterprise Channel. There are two common ways you can switch devices over without the need for a reinstall:

- The recommended way to switch your devices to Monthly Enterprise Channel is to use the **Switch device update channel** capability of the [inventory](../admin-center/inventory.md#switch-device-update-channel) in the [Microsoft 365 Apps admin center](https://config.office.com). Select the devices you want to move to Monthly Enterprise Channel and confirm the move. You can also use Microsoft Entry ID groups containing devices and/or users. The devices perform the channel change within roughly 24 hours.

- You can switch managed devices to Monthly Enterprise Channel by using existing management tools. If you're using Microsoft Intune, review this [guidance](../updates/change-update-channels.md#change-the-update-channel-with-microsoft-intune-administrative-templates). For environments with Microsoft Configuration Manager, we recommend reviewing our best practices on how to [prepare your environment for multi-channel management](build-dynamic-lean-configuration-manager.md) and perform the [actual switch to Monthly Enterprise Channel using Configuration Manager](switch-to-monthly-enterprise-channel.md). If you aren't using Configuration Manager, you can adapt the [generic change update channel guidance](../updates/change-update-channels.md).
- For unmanaged devices, you can [change the default channel in the Microsoft 365 admin center](../updates/overview-update-channels.md#microsoft-365-admin-center). Unmanaged installations will switch to the set channel.

## Prepare your network to receive updates from the internet

If you use [cloud update](../admin-center/cloud-update.md) to manage updates directly from the cloud, your devices will download those from the internet. To determine if your network can handle this traffic without disruption, see [published sizes of the update downloads](/officeupdates/download-sizes-microsoft365-apps-updates). There are several ways to optimize your network for taking updates directly from the cloud.

**For users on-premises**, you should consider these options:

- [Enable Delivery Optimization](../updates/delivery-optimization.md) to allow devices to share content with each other through P2P mechanisms.
- If you have Configuration Manager deployed, enable [Connected Cache](/mem/configmgr/core/plan-design/hierarchy/microsoft-connected-cache) on your distribution points. Use client settings to [enable devices](/mem/configmgr/core/plan-design/hierarchy/microsoft-connected-cache#enable-connected-cache) to use Microsoft Connected Cache servers for content download.

**For users working from home or remotely by VPN**, you should consider these options:

- Configure VPN with [selective tunnel](/microsoft-365/enterprise/microsoft-365-vpn-implement-split-tunnel#4-vpn-selective-tunnel) instead of [forced tunnel](/microsoft-365/enterprise/microsoft-365-vpn-implement-split-tunnel#1-vpn-forced-tunnel). The VPN tunnel is then used only for corpnet-based services. Default route traffic (internet and all internet-based services) goes direct, as do Microsoft 365 Apps updates.
- If your VPN is configured for [forced tunnel with exceptions](/microsoft-365/enterprise/microsoft-365-vpn-implement-split-tunnel#2-vpn-forced-tunnel-with-a-small-number-of-trusted-exceptions) and supports using FQDNs for Dynamic Split Tunneling, ensure that the [URL for the Office CDN is included in the exclusion list](/microsoft-365/enterprise/urls-and-ip-address-ranges#microsoft-365-common-and-office-online) (#92). For details, see our [how-to guides for common VPN solutions](/microsoft-365/enterprise/microsoft-365-vpn-implement-split-tunnel#howto-guides-for-common-vpn-platforms).
- If your VPN is configured for forced tunnel and doesn't support FQDN-based exceptions, contact your Microsoft representative for support to implement an IP-based static solution.

## Use Cloud Update to keep devices current

You can use a [Cloud Update](../admin-center/cloud-update.md) to enable your tenant to take control over update deployment to all devices connected to the tenant, regardless of how the device is managed (if at all). You can set up rules to control which devices are in-scope for the update deployment and monitor progress through tailored reports.

No other infrastructure or software agent is required to enable this feature. If a device has provisioned itself into inventory, its characteristics will be evaluated by Cloud Update. If the device is on a Cloud Update-enabled update channel, Cloud Update will manage Microsoft 365 Apps updates on the device. This functionality lets you cover installations on "BYOD" personal or unmanaged devices that are connected to your tenant and devices managed by Configuration Manager or Microsoft Intune.

> [!Note]
> Currently, Cloud Update only supports managing Monthly Enterprise Channel and Current Channel updates. Any device which is on one of those channels, will get managed, if not excluded.

The [Cloud Update](../admin-center/cloud-update.md) article has more details on how this feature works.
