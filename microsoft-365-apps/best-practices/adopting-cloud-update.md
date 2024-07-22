---
title: Enabling and configuring cloud update
author: manoth-msft
ms.author: manoth
manager: dougeby
audience: ITPro 
ms.topic: conceptual 
ms.service: o365-proplus-itpro
ms.localizationpriority: medium
ms.collection: Tier3
description: "Guide for IT admins on how to enable and configure cloud update in the Microsoft 365 Apps admin center"
ms.date: 07/22/2024
---

# Enabling and configuring Cloud Update
A guide for IT admins who want to start using cloud update from the Microsoft 365 Apps admin center to manage updates for Microsoft 365 Apps for business or enterprise.

[Cloud update](../admin-center/cloud-update.md) is a service in the [Microsoft 365 Apps admin center](../admin-center/overview.md) that provides you with update automation for Microsoft 365 Apps directly from the Office Content Delivery Network (CDN). Cloud update is the replacement for servicing profile.

This document covers:
- The [benefits](#benefits-of-using-cloud-update) of using cloud update
- Recommended steps for [preparation](#preparation)
- How to [enable](#enable-cloud-update) and [configure](#review-configuration-of-cloud-update) cloud update
- How devices [onboard](#onboarding-of-devices) and [update](#update-flow)
- [Best practices and tips](#best-practices-and-tips-for-working-with-cloud-update)
- Frequently Asked Questions ([FAQ](#frequently-asked-questions-faq))

> [!NOTE]
> The information in this document applies to updates for Microsoft 365 Apps only. Cloud update does not replace, modify, or impact existing solutions for deploying other updates, for example Windows updates.
> Cloud update is currently in Public Preview.

>[!Tip]
> If you prefer video over text, we have a [playlist of short instructional videos](https://aka.ms/CloudUpdateVideos) for you.

## Benefits of using Cloud Update
There are multiple benefits of using cloud update over common update management tools:
- **Improved security currency**: With traditional update management, enterprise security currency is typically around 66%, indicating the percentage of Microsoft 365 Apps updated with the latest security updates. However, using cloud updates can boost this figure to over 90%, enhancing overall security and better safeguarding against threats.
  
- **Increased reach**: Traditional update tools require devices to join a directory service like Active Directory or Microsoft Entra ID. Cloud update overcomes this limitation, managing all Microsoft 365 Apps instances signed in with a Microsoft Entra user from your tenant, regardless of the device's directory membership.
  
- **Leveraging the cloud**: As a true cloud-based service, cloud update isn't dependent on any on-premises infrastructure. Wherever the device is, if it can connect to the cloud, it can be serviced.
  
- **Easy onboarding**: Devices in scope of cloud update automatically bypass other Microsoft 365 Apps update configurations, with no need for detachment. If out-of-scope, previous controls are restored. Cloud update applies solely to Microsoft 365 Apps, leaving other app configurations unchanged. Thus, a device can be simultaneously managed by two solutions without conflict.

## Preparation
### Device targeting
Cloud update, supporting [Current Channel](../updates/overview-update-channels.md#current-channel-overview) and [Monthly Enterprise Channel](../updates/overview-update-channels.md#monthly-enterprise-channel-overview), automatically creates profiles and onboards devices on these channels once enabled. Devices on other channels or those excluded remain unaffected. No channel changes occur.

To identify device distribution across channels, check the [security update status](https://config.office.com/officeSettings/currency) page in the Microsoft 365 Apps admin center. All devices (except exclusions) on Current Channel and Monthly Enterprise channel will be onboarded.

### Network considerations
Estimate network impact by reviewing the [number of devices on an outdated release](https://config.office.com/officeSettings/currency) and the estimated [update download size](/officeupdates/download-sizes-microsoft365-apps-updates) per device. Consult your network team to ensure [Office CDN accessibility](../admin-center/cloud-update.md#network-requirements) and network capacity. Devices on a current release won't update until a new one is released.

Updates downloaded from Office CDN use [Delivery Optimization](/windows/deployment/do/waas-delivery-optimization), reducing network impact through peer-to-peer file sharing. If Configuration Manager is in use, consider enabling [Microsoft Connected Cache](/mem/configmgr/core/plan-design/hierarchy/microsoft-connected-cache) for centralized caching. If Delivery Optimization is disabled, we recommend enabling it to benefit Microsoft 365 Apps, Windows, Teams, Edge, and Windows Store Apps.

### Exclusions
To exclude devices from cloud update, add Microsoft Entra or hybrid joined devices and/or users to an [Microsoft Entra ID group](/azure/active-directory/fundamentals/active-directory-groups-create-azure-portal). See [Requirements for using Microsoft Entra groups](../admin-center/cloud-update.md#microsoft-entra-groups-requirements) for more details. Common devices often excluded include Remote Desktop Service Hosts and non-persistent virtual machines.

### Requirements and permissions
Ensure your devices meet the [requirements](../admin-center/cloud-update.md#requirements) for using cloud update. [Network connectivity](../admin-center/cloud-update.md#network-requirements) from your devices to the Microsoft 365 Apps admin center is necessary. The [Office Apps admin role](/microsoft-365/admin/add-users/about-admin-roles#commonly-used-microsoft-365-admin-center-roles) is recommended due to its restrictive permissions that still allow cloud update configuration and enablement.

## Enable Cloud Update
Once you've gone through the benefits and preparation steps, it's time to activate cloud update.

1.	Sign in to the [Microsoft 365 Apps admin center](https://config.office.com) with admin permissions.
2.	On the **Overview** page, you see a card labeled **Recommendation based on your tenant**.
3.	Select **Enable cloud**.  
4.	Refresh the page.
5. The **Cloud update** option in the left navigation is now expandable, providing access to an **Overview** and individual pages for both **Current Channel** and **Monthly Enterprise Channel**.

## Review configuration of Cloud Update
Once enabled, it's recommended to review and modify the configuration to fit your organization's requirements.

### Global Settings
Navigate to **Cloud Update** > **Overview** and select the **Tenant Settings** tab.
- **Exclusion windows**: Set up necessary [exclusion windows](../admin-center/cloud-update.md#exclusion-windows) during which no updates are deployed. These windows can be scoped to a group of devices or users. [Requirements](../admin-center/cloud-update.md#microsoft-entra-groups-requirements) for using Microsoft Entra groups apply.

- **Exclude groups**: Configure your [exclusions](../admin-center/cloud-update.md#exclude-groups). Those devices or user objects will always be excluded from cloud update. [Requirements](../admin-center/cloud-update.md#microsoft-entra-groups-requirements) for using Microsoft Entra groups apply.

### Current Channel settings
Navigate to **Cloud Update** > **Current** and select the **Settings** tab.
- **Deadline**: The [deadline](../admin-center/cloud-update.md#deadline) specifies the duration from the initial silent update attempt to when the update engine prompts the user to close their Microsoft 365 Apps. A shorter deadline ensures that devices are applying the latest updates earlier, while a longer deadline reduces potential user disruption.

### Monthly Enterprise Channel settings
Navigate to **Cloud Update** > **Monthly Enterprise** and select the **Settings** tab.
- **Rollout waves**: By default, tenants with over 100 devices have updates staggered across four days. However, you can establish up to four custom rollout waves for more control over update deployment. For details, refer to the [custom rollout waves](../admin-center/cloud-update.md#rollout-waves) documentation.

- **Update validation**: When custom rollout waves are configured, [Update validation](../admin-center/update-validation.md) is enabled by default. This feature aids in evaluating the impact of new updates on the performance and stability of Microsoft 365 Apps. It's recommended to use update validation, which sets a seven-day delay for the first wave. If not desired, you can opt out via the **Opt out of update validation** link.

- **Deadline**: The [deadline](../admin-center/cloud-update.md#deadline) specifies the duration from the initial silent update attempt to when the update engine prompts the user to close their Microsoft 365 Apps. A shorter deadline ensures that devices are applying the latest updates earlier, while a longer deadline reduces potential user disruption.

## Onboarding of devices
With cloud updates enabled and configured, the service starts to onboard devices. Here's how you can monitor this process by using the [**inventory**](https://config.office.com/officeSettings/inventory) in the Microsoft 365 Apps admin center.

Go to **Inventory** > [**Show All Devices**](https://config.office.com/officeSettings/inventory/devices) and check the **Cloud Update Status** column. Devices will transition to an **onboarding** state before being labeled as **managed**. Devices in an exclusion group will be tagged as **excluded**.

Devices check in with the service regularly. New devices on the latest release stay in the onboarding state until a new update is released. Upon update need, cloud update performs three actions: 

1. **Take control over Microsoft 365 Apps updates**: Commands are sent to the device and its Microsoft 365 Apps update engine to ignore other update instructions.

2. **Trigger the device update**: The device downloads, extracts, and applies the update. If Microsoft 365 Apps are running, the deadline setting determines when to prompt the user.

3. **Update status from onboarding to managed**: The **Cloud Update Status** changes from **Onboarding** to **Managed by**, indicating the transfer of update management to cloud update.

## Update flow
This section details how cloud update delivers updates and what admins can expect:

1. Cloud update continuously monitors device inventory for changes. If a new device is added or an existing one changes its update channel, cloud update evaluates if the device is within its scope. Exclusions override this check, preventing those devices from being onboarded. Changes to cloud update settings trigger a full inventory evaluation, which may take hours for large device numbers.

1. The service pre-calculates pending actions, storing them until the next device check-in. When the device checks in, these actions are passed down, triggering the update engine and changing the portal status to **In Progress**. If custom rollout waves are configured, no actions are sent until the wave's start date.

1. The Microsoft 365 Apps update engine is set to ignore all other update management configurations, including Configuration Manager, Group Policy, Intune configuration profiles, and local registry values. However, users can still manually trigger an update check from the Microsoft 365 Apps interface.

1. Once triggered, the update engine determines the update delta, downloads the bits, extracts them locally, and stages the new files.

1. The update engine then attempts to overwrite the existing files with the updated version. If all Microsoft 365 Apps are closed, the files are swapped out and the update is complete. All actions are silent to the user. The device reports back to the service that the update completed successfully, reflected in the Microsoft 365 Apps admin center.

1. If the file operation fails due to running applications, the device records a timestamp and the deadline setting comes into play. The update engine retries the update multiple times per day, during device reboot, or when the device is locked and idle ([Update Under Lock](https://techcommunity.microsoft.com/t5/microsoft-365-blog/update-under-lock-improved-update-experience-for-microsoft-365/ba-p/3618901)). This continues silently until the recorded timestamp plus the deadline setting days have passed.

1. If the deadline passes, a prompt is shown to the user, offering the option to close the applications now or postpone the installation. The user can postpone the update installation three times for two hours each, before a final two-hour countdown is shown. If the deadline is around seven hours past already, the user can postpone only once. If the user chooses to close the applications or the countdown reaches zero, the Microsoft 365 Apps save any open files, close all applications, apply the update, restore all windows, and reopen the files. On average, user downtime is less than five minutes.
    - Note two special cases:
        - If the deadline is set to 0, the first prompt appears immediately after the first failed update attempt, but the user can still postpone the update.
        - Even if the user postpones the update, the update engine continues to try to apply it. For instance, if the user postpones the update and then reboots the device, the update will be applied during reboot without further prompts.

## Best practices and tips for working with Cloud Update
Here are some tips for using cloud update:
- Cloud update, like other services, is asynchronous. Changes may not be immediately reflected in the portal.
- Changing settings triggers a full device evaluation. Make multiple changes at once and allow processing time.
- Setting changes also recalculate custom rollout waves and the rollout restarts with wave 1.
- Allow processing time when pausing/resuming a profile. Pausing won't stop initiated updates but prevents new commands. A pause is typically applied within one hour.
- Rollbacks also require processing time after configuration. If the profile is paused, rollbacks are still processed and executed.

## Frequently asked questions (FAQ)
**Will enabling cloud update impact my existing update channel configuration for Microsoft 365 Apps?**
No, by default cloud update doesn't make any automatic changes to a device's update channel. The option to change a device's update channel is controlled by the admin and initiated using the [Switch device update channel](../admincenter/inventory.md#switch-device-update-channel) feature.

**Will enabling cloud update impact any of my other update settings?**
The settings you configure for each cloud update profile will determine which update settings are deployed. If you have existing update management tools in your environment, learn more about [compatibility with other management tools](../admin-center/cloud-update.md#compatibility-with-other-management-tools).

**Something doesn't work, where do I start with troubleshooting?**
Check out the [Troubleshooting section](../admin-center/cloud-update.md#troubleshooting) in the cloud update documentation.
