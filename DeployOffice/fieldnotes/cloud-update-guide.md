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
A guide for IT admins who want to use the Microsoft 365 Apps admin center to manage updates for Microsoft 365 Apps for business or enterprise

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
- **Improved security currency**: For enterprise environments we usually see a security currency of around 66%. This means that after each monthly “Patch Tuesday”, approximately 66% of Microsoft 365 Apps on devices within a tenant have been patched with the latest security updates. With cloud update, we see this currency rise above 90%. This means that the new service helps reduce known threats in your environment faster and broader.
- **Increased reach**: Common update management tools are often limited by the boundary of a directory service. For example, devices must be joined into Active Directory and/or Entra ID to be managed by a given solution. With cloud update, you're breaking this barrier and can manage all Microsoft 365 Apps instances that were activated by your tenant and have a Microsoft Entra user from your tenant signed in. It doesn't matter if the device is joined into Active Directory, Microsoft Entra ID, registered into Microsoft Entra ID, or remains in workgroup mode.
- **Leveraging the cloud**: As a true cloud-based service, cloud update isn't dependent on any on-premises infrastructure. Wherever the device is, if it can connect to the cloud, it can be serviced.
- **Easy onboarding**: If a device falls into scope of cloud update (elaborated later in this document), it will automatically override any other Office update management mechanism. No need to detach the Microsoft 365 Apps from other management solutions first. If a device falls out-of-scope for cloud update, the previous update management control is restored. Cloud update only applies to Microsoft 365 Apps, everything else (for example, how updates for Windows or Edge are managed) remains the same. In summary, a device can be managed by two solutions at the same time without any conflicts.

## Preparation
### Device targeting
Cloud update currently supports two update channels: [Current Channel](../updates/overview-update-channels.md#current-channel-overview) and [Monthly Enterprise Channel](../updates/overview-update-channels.md#monthly-enterprise-channel-overview). Once enabled, cloud update will automatically create a profile for each update channel and enable them. Devices on one of the two update channels will then be automatically onboarded to the cloud update service. Excluded devices and devices on other update channels will be excluded and not onboarded. No automatic update channel changes will be performed. All devices remain on the update channels they had before the enablement of cloud update.

We recommend that you check the [security update status](https://config.office.com/officeSettings/currency) page in the Microsoft 365 Apps admin center. Look at the **Update Status by channel** breakdown to quickly identify how many devices are on Current Channel and Monthly Enterprise Channel. All of those (minus exclusions) will be automatically onboarded.

### Network considerations
To get a rough estimate on the potential network impact, review the number of devices on an outdated release, combined with the [download size for updates](https://learn.microsoft.com/officeupdates/download-sizes-microsoft365-apps-updates). In doubt, check with your network team if the Office CDN is reachable and your network can handle the initial load. Devices which are on a current release will not perform an update until one is released.

As updates are downloaded from the Office CDN, the update engine on the devices will make use of [Delivery Optimization](https://learn.microsoft.com/windows/deployment/do/waas-delivery-optimization) if it is enabled (on by default). This can significantly reduce the network impact, as devices will share required source files in a peer-to-peer manner. If you have Configuration Manager running in your environment, consider enabling [Microsoft Connected Cache](https://learn.microsoft.com/mem/configmgr/core/plan-design/hierarchy/microsoft-connected-cache) to allow your servers to act as central caches for Delivery Optimization. If Delivery Optimization is disabled or not configured on devices, we recommend reviewing the documentation and enabling Delivery Optimization. This will not only benefit Microsoft 365 Apps, but also Windows, Teams, Edge, and Windows store Apps.

### Handling exclusions
If you need or want to exclude certain devices from cloud update, ensure that those devices are Microsoft Entra joined or hybrid joined and add those device objects to an Entra ID group. Alternatively, you can also specify user objects and cloud update will exclude all devices which reported those user objects as the last active user. When using user objects, devices do not need to be Microsoft Entra joined or hybrid joined.

### Prerequisites and permissions
Review the list of [requirements](../admincenter/overview.md#how-to-get-to-the-admin-center) for using cloud update to ensure your devices meet the prerequisites and you have proper access to the Microsoft 365 Apps admin center. We recommend using the [Office Apps admin role](https://learn.microsoft.com/microsoft-365/admin/add-users/about-admin-roles?view=o365-worldwide#commonly-used-microsoft-365-admin-center-roles), as this role has the most restrictive set of permissions which still allows you to enable and configure cloud update.

## Enable Cloud Update
After reviewing the benefits and the preparation section, let's enable cloud update.
1.	Sign in to the [Microsoft 365 Apps admin center](https://config.office.com) with admin permissions.
2.	On the **Overview** page, you see a card labeled **Recommendation based on your tenant**.
3.	Select **Enable cloud**.  
4.	Refresh the page.
5.	**Cloud update** in the left navigation is now expandable and you can access an **Overview**, as well as the individual pages for **Current Channel** and **Monthly Enterprise Channel**.

## Configure Cloud Update
After enablement, we recommend that you review and adjust the configuration of the profiles and the overall service according to the needs of your organization.

### Global Settings
Navigate to **Cloud Update** > **Overview** and select the **Tenant Settings** tab.
- **Exclusion windows**: Configure any required exclusion windows. During an exclusion window, no updates are deployed to devices. You can also scope an exclusion window to a group of device or user objects. If you use Entra ID groups which contain devices, those must be Microsoft Entra joined, or hybrid joined.
- **Exclude groups**: Configure your exclusions. Those devices or user objects will always be excluded from cloud update. If you use Entra ID groups which contain devices, those must be Microsoft Entra joined, or hybrid joined.

### Current Channel settings
Navigate to **Cloud Update** > **Current** and select the **Settings** tab.
- Deadline: The deadline determines the time which can pass between the first silent update attempt and the update engine prompting the user to close their Microsoft 365 Apps.

### Monthly Enterprise Channel settings
Navigate to **Cloud Update** > **Monthly Enterprise** and select the **Settings** tab.
- **Rollout waves**: You can choose not to use rollout waves, which will defer to an automatic wave rollout over a 4-day period. Alternatively, if you can configure custom rollout waves to control your update deployment across multiple days. For more information, review the documentation for about [custom rollout waves](../admincenter/cloud-update.md#monthly-enterprise-channel). Use Entry ID groups to configure waves and set the delay between each wave.
- **Update validation**: [Update validation](../admincenter/update-validation.md) is enabled by default when you configure custom rollout waves. This feature helps you in assessing if a new update is introducing any issues into your environment when it comes to the performance and stability of the Microsoft 365 Apps. We recommend using update validation, which will adjust your first wave to a seven-day delay. If you choose to not use the feature, you can opt-out by clicking the **Opt out of update validation** link.
- **Deadline**: The deadline determines the time which can pass between the first silent update attempt and the update engine prompting the user to close their Microsoft 365 Apps.

## Onboarding of devices
After enabling cloud update and reviewing the settings, it might take some time for the service to process all devices and pending changes. Navigate to **Inventory** > [**Show All Devices**](https://config.office.com/officeSettings/inventory/devices) and review the **Cloud Update Status** column. You will start to see devices move to an **onboarding** state and eventually marked as **managed**. Devices that are part of an exclusion group will be marked as **excluded**.

Devices will check-in with the service multiple times a day. New devices that are already running the latest release for their update channel will remain in the onboarding state till the next update is released by Microsoft. Once there is a need to install an update, cloud update will perform three actions with the next check-in of the device:
1. **Ignore other management solutions**: Cloud update will send commands to the update engine for Microsoft 365 Apps to ignore other update instructions on the device. For example, for a device managed by Configuration Manager, the update engine will start ignoring update commands from Configuration Manager.
1. **Trigger the update on the device**: The device will download, extract, and apply the update. If Microsoft 365 Apps are running, the deadline setting will be used to determine when to prompt the user.
1. **Onboarding to managed**: The **Cloud Update Status** in inventory will change from **Onboarding** to **Managed by**, reflecting that update management has been transferred to cloud update.

## Update flow  
This section provides more information about how cloud update delivers updates to your devices and what you can expect as an admin.
1. Cloud update continuously monitors the devices in inventory for changes. If a new device reports into inventory, or an existing device reports being on a new update channel, cloud update will evaluate if that device falls within its scope. Exclusions will always overrule this check and ensure that those devices are not onboarded to cloud update. If you change the settings of cloud update, a full evaluation of inventory is triggered. If you have tens or hundreds of thousands of devices, this task might take a couple of hours to reflect the changes you made.
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
