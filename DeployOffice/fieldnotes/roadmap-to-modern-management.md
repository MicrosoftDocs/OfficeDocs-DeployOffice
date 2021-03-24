---
title: Road map to modern management of Microsoft 365 Apps in the enterprise
author: manoth-msft
ms.author: manoth
manager: laurawi
audience: ITPro 
ms.topic: article 
ms.service: o365-proplus-itpro
localization_priority: Normal
description: "Field best practices: Road map to modern management of Microsoft 365 Apps in the enterprise"
ms.custom: 
- Ent_Office_ProPlus
- Ent_Office_FieldNotes
ms.collection: 
- Ent_O365
- M365-modern-desktop
---

# Best practices from the field: Road map to modern management of Microsoft 365 Apps in the enterprise

> [!IMPORTANT]
> This is prerelease documentation for a preview program that isn’t available to everyone and is subject to change.

> [!NOTE]
> This article was written by Microsoft experts in the field who work with enterprise customers to deploy Office.

Microsoft recently released to public preview a set of [new admin capabilities](../admincenter/overview.md#whats-new-in-preview) to monitor, manage, and update the installation of Microsoft 365 Apps for enterprise. Based on our work with customers during the preview, we've developed best practices on how to adopt these new features.

There's no definitive or required way to adopt these features. But the order described in this article helps admins quickly recognize the benefits while keeping the rate of change manageable. Adjust the approach to the needs of your organization.

## Get insights within minutes: Microsoft 365 Apps health

A good starting point is to adopt [Microsoft 365 Apps health](../admincenter/microsoft-365-apps-health.md). This feature provides insights into the stability, performance, and deployed builds of the Microsoft 365 Apps in your environment. It uses diagnostic data sent by your devices, so you don't have to deploy additional infrastructure or software agents to use it. You can get insights into the health of your Microsoft 365 Apps within minutes.

How to enable Microsoft 365 Apps health:

1. Sign in to the Apps Admin Center at [config.office.com](https://config.office.com/).
2. Navigate to **Health** > **Apps health**. Read and accept the Preview Microsoft Software License Terms.

It takes about 10 minutes for the service to be provisioned. You can then access:

- Crash rates on a per-application level, grouped by version.
- Performance metrics, such as application launch times and document load times.
- Channel metrics, such as which channels and builds are sending diagnostic data.

You can also compare two builds. This feature enables you to quickly assess if a newly deployed build is more stable and faster than the previous build. You then can proactively address issues, as opposed to waiting for issues to surface after you release a new build into your environment.

There's a minimum number of sessions required per app and version. This minimum ensures that Microsoft 365 Apps health can calculate reliable insights. A *session* is the period from launching an application until it's closed. For example, you're likely to see more sessions from an app like Microsoft Excel than Outlook.

If you disabled Diagnostic Data for Office on your devices, you might only see a subset of your devices or none at all. To use Microsoft 365 Apps health, you have to [enable Diagnostic Data](../privacy/manage-privacy-controls.md#policy-setting-for-diagnostic-data) and set the level to *Optional*.

## Get insights per device: Inventory and security update status

When you join the Preview program, Microsoft 365 Apps that are installed and running on Current Channel or Monthly Enterprise Channel version 2008 or later start registering in [Inventory](../admincenter/inventory.md). The Inventory page in the Apps Admin Center provides a consolidated view of your Microsoft 365 Apps and key information, such as:

- Update channel
- Versions deployed
- Apps deployed
- Architecture
- Installed add-ins
- Whether macros are used on the device

It also populates the [Security update status](../admincenter/security-update-status.md) page, which provides an overview of:
- Which channels are deployed
- How many devices are on the latest security update
- Which devices are behind schedule and need attention

The Microsoft 365 Apps installation itself provides the inventory information, so there's no conflict with existing management solutions. For example, a device can be managed by Microsoft Endpoint Manager and registered into the new tenant-based inventory at the same time.

## Move devices to Monthly Enterprise Channel

Moving your devices to the [Monthly Enterprise Channel](../overview-update-channels.md#monthly-enterprise-channel-overview) provides a good balance between receiving monthly feature and quality updates (similar to [Current Channel](../overview-update-channels.md#current-channel-overview)), while having a predictable cadence with only one update per month.

With these new preview features, consider the following two scenarios when you move devices to the Monthly Enterprise Channel:

- If you're planning to adopt Servicing Profiles (see below), devices will automatically be moved to the Monthly Enterprise Channel. In this scenario, there's no need to move devices first.
- If you want to control the rate of devices switching to Monthly Enterprise Channel, aren't ready to adopt Servicing Profiles yet, or want to manage on-prem bandwidth with existing on-premises tools, you should do the switch first.

If you prefer to move your devices first, detailed guidance is available on how to [prepare your environment for multi-channel management](build-dynamic-lean-configuration-manager.md) and how to perform the [actual switch to Monthly Enterprise Channel using Configuration Manager](switch-to-monthly-enterprise-channel.md). If you aren't using Configuration Manager, you can adapt the [generic change update channel guidance](../change-update-channels.md).

## Prepare your network to receive updates from the internet

If you use Servicing Profiles to manage updates directly from the cloud, your devices will download those profiles from the internet. To determine if your network can handle this traffic without disruption, see [published sizes of the update downloads](/officeupdates/download-sizes-microsoft365-apps-updates). There are several ways to optimize your network for taking updates directly from the cloud.

**For users on-premises**, you should consider these options:

- [Enable Delivery Optimization](../delivery-optimization.md) to allow devices to share content with each other through P2P mechanisms.
- If you have Configuration Manager deployed, enable [Connected Cache](/mem/configmgr/core/plan-design/hierarchy/microsoft-connected-cache) on your distribution points. Use client settings to [enable devices](/mem/configmgr/core/plan-design/hierarchy/microsoft-connected-cache#enable-connected-cache) to use Microsoft Connected Cache servers for content download.

**For users working from home or remotely by VPN**, you should consider these options:

- Configure VPN with [selective tunnel](/microsoft-365/enterprise/microsoft-365-vpn-implement-split-tunnel#4-vpn-selective-tunnel) instead of [forced tunnel](/microsoft-365/enterprise/microsoft-365-vpn-implement-split-tunnel#1-vpn-forced-tunnel). The VPN tunnel is then used only for corpnet-based services. Default route traffic (internet and all internet-based services) goes direct, as do Microsoft 365 Apps updates.
- If your VPN is configured for [forced tunnel with exceptions](/microsoft-365/enterprise/microsoft-365-vpn-implement-split-tunnel#2-vpn-forced-tunnel-with-a-small-number-of-trusted-exceptions) and supports using FQDNs for Dynamic Split Tunneling, ensure that the [URL for the Office CDN is included in the exclusion list](/microsoft-365/enterprise/urls-and-ip-address-ranges#microsoft-365-common-and-office-online) (#92). For details, see our [how-to guides for common VPN solutions](/microsoft-365/enterprise/microsoft-365-vpn-implement-split-tunnel#howto-guides-for-common-vpn-platforms).
- If your VPN is configured for forced tunnel and doesn't support FQDN-based exceptions, contact your Microsoft representative for support to implement an IP-based static solution.

## Use Servicing Profiles to keep devices current

You can use [Servicing Profiles](../admincenter/servicing-profile.md) to enable your tenant to take control over update deployment to all devices connected to the tenant, regardless of how the device is managed (if at all). You can set up rules to control which devices are in-scope for the update deployment and monitor progress through tailored reports.

No other infrastructure or software agent is required to enable this feature. If a device has provisioned itself into inventory, its characteristics will be evaluated by Servicing Profiles. If the device matches the rules set by the admin, Service Profiles will manage Microsoft 365 Apps updates on the device. This functionality lets you cover installations on "BYOD" personal or unmanaged devices that are connected to your tenant and devices managed by Configuration Manager or Microsoft Endpoint Manager.

Note that Servicing Profiles currently only supports managing Monthly Enterprise Channel updates. So any device that falls into the scope of the rules will be moved to this channel.

Before you adopt Servicing Profiles, consider the following factors:

- All devices that match the rule set will be switched over to Monthly Enterprise Channel and kept up to date.
- There's currently no way to include or exclude specific devices.
- Double-check if your network can handle the traffic caused by moving devices to Monthly Enterprise Channel and the monthly updates.

If these factors check out, navigate to the Servicing Profile blade, and follow the instructions in the wizard. Note that the Servicing Profile becomes active immediately when you save the profile. So, if an eligible device checks in with the service right after you finish the wizard, it will get the instructions to move to the latest Monthly Enterprise update.