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
ms.date: 03/13/2024
---

# Enabling and configuring Cloud Update
A guide for IT admins who want to start using cloud update from the Microsoft 365 Apps admin center to manage updates for Microsoft 365 Apps for business or enterprise

[Cloud update](../admincenter/cloud-update.md) is a service in the [Microsoft 365 Apps admin center](../admincenter/overview.md) that provides you with update automation for Microsoft 365 Apps directly from the Office Content Delivery Network (CDN). Cloud update is the replacement for servicing profile.

This document covers:
- The [benefits](#benefits-of-using-cloud-update) of using cloud update
- Recommended steps for [preparation](#preparation)
- How to [enable](#enable-cloud-update) and [configure](#configure-cloud-update) cloud update
- How devices [onboard](#onboarding-of-devices) and [update](#update-flow)
- [Best practices and tips](#best-practices-and-tips-for-working-with-cloud-update)

> [!NOTE]
> The information in this document applies to updates for Microsoft 365 Apps only. Cloud update does not replace, modify, or impact existing solutions for deploying other updates, for example Windows updates.

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

Check the [security update status](https://config.office.com/officeSettings/currency) page in the Microsoft 365 Apps admin center to identify device distribution across channels. All devices (except exclusions) on Current Channel and Monthly Enterprise channel will be onboarded.

### Network considerations
Estimate network impact by reviewing the [number of devices on an outdated release](https://config.office.com/officeSettings/currency) and the estimated [update download size](/officeupdates/download-sizes-microsoft365-apps-updates) per device. Consult your network team to ensure Office CDN accessibility and network capacity. Devices on a current release won't update until a new one is released.

Updates downloaded from Office CDN use [Delivery Optimization](/windows/deployment/do/waas-delivery-optimization), reducing network impact through peer-to-peer file sharing. If Configuration Manager is in use, consider enabling [Microsoft Connected Cache](/mem/configmgr/core/plan-design/hierarchy/microsoft-connected-cache) for centralized caching. If Delivery Optimization is disabled, we recommend enabling it to benefit Microsoft 365 Apps, Windows, Teams, Edge, and Windows Store Apps.

### Exclusions
To exclude devices from cloud update, add Microsoft Entra or hybrid joined devices to an [Entra ID group](/azure/active-directory/fundamentals/active-directory-groups-create-azure-portal). Alternatively, specify user objects to exclude all devices with those users as the last active. User object exclusion doesn't require device joining. Common devices often excluded include Remote Desktop Service Hosts and non-persistent virtual machines.

### Prerequisites and permissions
Ensure your devices meet the prerequisites for using cloud update by reviewing the [requirements](../admincenter/overview.md#how-to-get-to-the-admin-center). Network connectivity from your devices to the Microsoft 365 Apps admin center is necessary. The [Office Apps admin role](/microsoft-365/admin/add-users/about-admin-roles#commonly-used-microsoft-365-admin-center-roles) is recommended due to its restrictive permissions that still allow cloud update configuration and enablement.

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
- **Exclusion windows**: Set up necessary exclusion windows during which no updates are deployed. These windows can be scoped to a group of devices or users. If using Microsoft Entra ID groups with device objects, they must be Microsoft Entra joined or hybrid joined.#

- **Exclude groups**: Configure your exclusions. Those devices or user objects will always be excluded from cloud update. If using Microsoft Entra ID groups with device objects, they must be Microsoft Entra joined or hybrid joined.

### Current Channel settings
Navigate to **Cloud Update** > **Current** and select the **Settings** tab.
- **Deadline**: The deadline specifies the duration from the initial silent update attempt to when the update engine prompts the user to close their Microsoft 365 Apps. A shorter deadline ensures that devices are applying the latest updates earlier, while a longer deadline reduces potential user ddisruption.

### Monthly Enterprise Channel settings
Navigate to **Cloud Update** > **Monthly Enterprise** and select the **Settings** tab.
- **Rollout waves**: By default, tenants with over 100 devices will have updates staggered across four days. However, you can establish up to four custom rollout waves for more control over update deployment. For details, refer to the [custom rollout waves](../admincenter/cloud-update.md#monthly-enterprise-channel) documentation.

- **Update validation**: When custom rollout waves are configured, [Update validation](../admincenter/update-validation.md) is enabled by default. This feature aids in evaluating the impact of new updates on the performance and stability of Microsoft 365 Apps. It's recommended to use update validation, which sets a seven-day delay for the first wave. If not desired, you can opt out via the **Opt out of update validation** link.

- **Deadline**: The deadline specifies the duration from the initial silent update attempt to when the update engine prompts the user to close their Microsoft 365 Apps. A shorter deadline ensures that devices are applying the latest updates earlier, while a longer deadline reduces potential user ddisruption.

## Onboarding of devices
With cloud updates enabled and configured, the service will now start to onboard devices. Here is how you can monitor this process by using the [**inventory**](https://config.office.com/officeSettings/inventory) in the Microsoft 365 Apps admin center.

Go to **Inventory** > [**Show All Devices**](https://config.office.com/officeSettings/inventory/devices) and check the **Cloud Update Status** column. Devices will transition to an **onboarding** state before being labeled as **managed**. Devices in an exclusion group will be tagged as **excluded**.

Devices check in with the service regularly. New devices on the latest release stay in the onboarding state until a new update is released. Upon update need, cloud update performs three actions: 

1. **Take control over Microsoft 365 Apps updates**: Commands are sent to the device and its Microsoft 365 Apps update engine to ignore other update instructions.

2. **Trigger the device update**: The device downloads, extracts, and applies the update. If Microsoft 365 Apps are running, the deadline setting determines when to prompt the user.

3. **Update status from onboarding to managed**: The **Cloud Update Status** changes from **Onboarding** to **Managed by**, indicating the transfer of update management to cloud update.

## Update flow  
This section provides more information about how cloud update delivers updates to your devices and what you can expect as an admin.
1. Cloud update continuously monitors the devices in inventory for changes. If a new device reports into inventory, or an existing device reports being on a new update channel, cloud update will evaluate if that device falls within its scope. Exclusions will always overrule this check and ensure that those devices aren't onboarded to cloud update. If you change the settings of cloud update, a full evaluation of inventory is triggered. If you have tens or hundreds of thousands of devices, this task might take a couple of hours to reflect the changes you made.
1. The service pre-calculates any pending actions and stores them until the next device check-in. When the device checks in, those actions are passed down to the device, the update engine on the device is triggered, and the status in the portal is changed to **In Progress**. If custom rollout waves are configured, no actions are sent to devices until the start date of the given wave has passed.
1. The update engine for Microsoft 365 Apps is set to ignore all other update management configurations. This includes Configuration Manager, Group Policy, Intune configuration profiles, and local registry values. However, the option for the user to manually trigger an update check from the Microsoft 365 Apps’s interface is still available.
1. Once the update engine has triggered, it will determine the delta needed to update the device, download those bits, extract them locally, and stage the new files. 
1. Next, the update engine will attempt to overwrite the existing files with the updated version. If all Microsoft 365 Apps are closed, the files are swapped out and the update is complete. All described actions are silent to the user. The device will report back to the service that the update completed successfully, which is then reflected in the Microsoft 365 Apps admin center.
1. If the file operation fails due to running applications, the device will record a timestamp and the deadline setting comes into play. The update engine will retry to apply the update multiple times per day, during reboot of the device, or when the device is locked and in idle mode ([Update Under Lock](https://techcommunity.microsoft.com/t5/microsoft-365-blog/update-under-lock-improved-update-experience-for-microsoft-365/ba-p/3618901)). This will be done silently in the background until the recorded timestamp plus the number of days set in the deadline setting has passed.
1. If the deadline passes a prompt is shown to the user, giving the user the option to close the application(s) now or postpone the installation. The user can postpone the installation of the update for about 48 hours before a final countdown of two hours is shown. If the user chooses to close the applications or the final countdown has reached zero, the Microsoft 365 Apps will save any open files, the window positions, close all applications, apply the update, restore all windows, and reopen the files. On average, the user downtime is less than five minutes.

There are two special cases to be aware of: 
- When the deadline is set to 0, the first prompt will occur immediately after the first failed attempt to apply the update. Still the user can postpone the update. 
- After the user has postponed the update installation, the update engine still tries to apply the update. For example, when the user postpones the update and then reboots the device, the update will be applied during reboot and no further prompts are shown to the user.

## Best practices and tips for working with Cloud Update 
These are some best practices and tips for working with cloud update:
- Like other cloud services or Microsoft Configuration Manager, cloud update is an asynchronous service. When you create or change the configuration, the service processes your input in the background. The admin center might not reflect your changes immediately.
- Changing settings triggers a full evaluation of all devices. If you want to change multiple settings, do this in one go and allow the service to process your changes.
- When settings change and custom rollout waves are used, the waves are also re-calculated.
- The same applies when pausing or resuming a profile in cloud update. Allow the service to process the change, and don't pause/resume the service in quick succession. Pausing cloud update won't stop already initiated update installations on devices but will stop the service from sending out new update commands to devices.
- When triggering a rollback, the same applies. After configuring a rollback action, the service needs time to process the change and waits for the device to check in to send the rollback commands.
- When using Microsoft Entra groups for excluding devices or configuring custom deployment waves, limiting the number of members to 20,000 objects per group is recommended. You can specify multiple groups. Also, processing multiple smaller groups is faster than processing a single large group. Instead of using one Microsoft Entra group with, for example, 40,000 members, it's recommended to use two groups with 20,000 members each.
