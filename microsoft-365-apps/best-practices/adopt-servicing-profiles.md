---
title: Adopt servicing profiles for Microsoft 365 Apps
author: manoth-msft
ms.author: manoth
manager: dougeby
audience: ITPro 
ms.topic: conceptual 
ms.service: o365-proplus-itpro
ms.localizationpriority: medium
ms.collection: Tier3
description: "Provide guidance to Office admins on how to adopt servicing profiles for Microsoft 365 Apps"
ms.date: 02/27/2024
---

# Adopting servicing profiles for Microsoft 365 Apps

[Servicing profiles](../admin-center/servicing-profile.md) let you use automation to deliver monthly updates to Microsoft 365 Apps for enterprise directly from the Office Content Delivery Network (CDN). Through extensive one-on-one engagement with global enterprises, we built this article to walk you through best practices of enabling servicing profiles within your environment and discuss the benefits for you and your organization.

> [!NOTE]
> Servicing profiles is deprecated and replaced by [cloud update](../admin-center/cloud-update.md). If cloud update is not available in your [Microsoft 365 Apps admin center](https://config.office.com) yet, please sign into the center and select the **Give feedback** button in the top right area. Select any of the options, enter a comment that you would like to get switched to cloud update and your Email. Select **Submit**. We will reach out to you soon.

This article covers:
- The benefits of using a servicing profile
- Step-by-step guidance on two ways to adopt servicing profiles
- Deep dive on how the device selection criteria work
- What happens to the devices once the servicing profile is enabled

> [!NOTE]
> All the above and below applies to Microsoft 365 Apps updates only. This feature does not replace, modify, or impact existing solutions for deploying other updates, for example Windows updates.

> [!TIP]
> If you prefer video over text, we have a [servicing profile overview](https://youtu.be/i_eUkyFX30E) video and a [servicing profile deep dive](https://youtu.be/YO6a3iNVXXI) video available.

## Benefits of using a servicing profile

There are multiple benefits of using a servicing profile over common update management tools:
- **Improved security currency:** For enterprise environments we usually see a security currency of around 66%. This means that after each monthly “Patch Tuesday” approximately 66% of Microsoft 365 Apps on devices within a tenant have been patched with the latest security updates. With a servicing profile, we see this currency rise above 90%. This means that the new service helps reduce known threats in your environment faster and broader.

- **Increased reach:** Common update management tools are often limited by the boundary of a directory service. For example, devices must be joined into Active Directory, to be managed by a given solution. With a servicing profile, you're breaking this barrier and can manage all Microsoft 365 Apps instances that were activated by your tenant and have a Microsoft Entra user from your tenant signed in. It doesn't matter if the device is joined into Active Directory, Microsoft Entra ID, registered into Microsoft Entra ID, or remains in workgroup mode.

- **Leveraging the cloud:** As a true cloud-based service, a servicing profile isn't dependent on any on-premises infrastructure. Wherever the device is, if it can connect to the cloud, it can be serviced.

- **Easy onboarding:** If a device falls into scope of a servicing profile (elaborated later in the article), it will automatically override any other Office update management mechanism. No need to detach the Microsoft 365 Apps from other management solutions first. If a device falls out-of-scope for the servicing profile, the previous update management control is restored. The servicing profile will only change the way Office updates are handled, everything else (for example, how updates for Windows or Edge are managed) remains the same. In summary, a device can be managed by two solutions at the same time without any conflicts.

<a name='decide-if-you-want-to-adopt-servicing-profiles-by-update-channel-or-using-azure-ad-groups'></a>

## Decide if you want to adopt servicing profiles by update channel or using Microsoft Entra groups

Instead of enabling a servicing profile for all devices at the same time, some admins want to adopt them step-by-step and monitor if everything runs smoothly. There are two common ways to adopt the feature in a staged manner:

- **By update channel:** With this approach, the servicing profile targets a small selection of update channels first. It ignores all devices on other channels. This allows you to migrate one channel at a time over to both the [Monthly Enterprise Channel](../updates/overview-update-channels.md#monthly-enterprise-channel-overview) and be managed through a servicing profile. Over time, you extend the selection of channels until all channels are covered and all devices are moved.

- **By Microsoft Entra group:** The alternative approach is to use Microsoft Entra groups to restrict the servicing profile to apply only to specified devices or users. This allows you to add devices to the scope on a more granular level.

To decide which approach is best for you, review how many Microsoft 365 Apps installs you have per update channel:
- Ensure that [inventory](../admin-center/inventory.md) in the Microsoft 365 Apps admin center is enabled and running for at least a week, so most devices have registered into it.
- Navigate to the [Security Update Status](https://config.office.com/officeSettings/currency) page in the Microsoft 365 Apps admin center, scroll down, and review the number of devices per channel.

If you're comfortable with migrating all devices on a channel at once, this is the right approach for you. If you want to migrate devices in smaller batches, you should go by Microsoft Entra groups. This could, for example, be the case if you have a couple of thousands of devices on a given channel, and you want to migrate them in, for example, three batches to limit change.

## How to set up a servicing profile with the “by update channel” approach

If you want to adopt a servicing profile step-by-step, you can do so by targeting a single update channel first. Microsoft 365 Apps on these devices would be migrated to the Monthly Enterprise Channel and kept updated automatically. You can monitor the progress in the portal and add additional update channels over time to increase coverage.
1. Sign in to the [Microsoft 365 Apps admin center](https://config.office.com). Ensure that the [requirements](../admin-center/servicing-profile.md#requirements-for-using-a-servicing-profile) for using servicing profiles are met in your environment.
2. Navigate to **Servicing** > **Monthly Enterprise** and launch the wizard by selecting **Get Started**. Select **Next** again to go to the **Device Selection Criteria** page.
3. When enabling a servicing profile, devices on the Monthly Enterprise Channel are targeted automatically. The chart on the top right gives you an overview how many devices will be targeted with the current selection.
4. Select the check boxes for all update channels you want to target in the first batch. Often, we start with targeting Monthly Enterprise Channel plus Beta Channel and Current Channel (Preview) first. After the bulk have been updated, we extend to Current Channel and then to Semi-Annual Enterprise Channel, including Preview.
5. Review and adjust the other selection criteria.
6. Select **Next** to go to the **Update exclusion dates** page. Enter exclusion dates if needed.
7. Select  **Next** to go to the **Update deadline** page. We recommend going with the default setting to balance user experience and reaching security compliance quickly. [Learn more about how deadlines work](../admin-center/servicing-profile.md#set-an-update-deadline).
8. Select **Next** to go review your config, then select **Create Profile** to get things going.

After creation, the servicing profile will start to calculate which devices fall into the selected criteria. Once this is finished, it starts to instruct devices that are online to update to the latest Monthly Enterprise Channel release. Review the progress on the **Devices** tab. It might take a few hours before you see the first wave of devices moving, so review the dashboard regularly. If the updates fail on a given device, see more details on the **Issues** tab.

After a few days, the bulk of targeted devices should have updated to the latest Microsoft 365 Apps release. If everything went smoothly, go to the **Settings** tab and add additional update channels to migrate more devices to the servicing profile.

<a name='how-to-set-up-the-servicing-profile-with-the-by-azure-ad-group-approach'></a>

## How to set up the servicing profile with the “by Microsoft Entra group” approach

If you want to adopt a servicing profile in more granular steps, do so by using Microsoft Entra groups to limit the targeting to a certain set of devices. Microsoft 365 Apps on these devices would be migrated to the [Monthly Enterprise Channel](../updates/overview-update-channels.md#monthly-enterprise-channel-overview) and kept updated automatically. You can monitor the progress in the portal and add additional Microsoft Entra groups or devices to the existing groups over time to increase coverage.

1. [Create one or multiple Microsoft Entra groups](/azure/active-directory/fundamentals/active-directory-groups-create-azure-portal) that you want to use for targeting. Add three types of items to a group, and mixing them is possible:
    - Devices: Those must be Microsoft Entra joined or Microsoft Entra hybrid joined and known to the inventory in the Microsoft 365 Apps admin center.
    - Users: Based on the activation data, the servicing profile identifies which devices in inventory have a Microsoft 365 Apps installation activated by the specified user accounts. This will also cover devices running in [shared computer activation](../deploy/overview-office-deployment-tool.md) mode where a specified user has logged on and used Microsoft 365 Apps.
    - Microsoft Entra groups: Use nested groups, for example to delegate management of groups to business units. Nesting is supported for up to three levels.
2. Sign in to the [Microsoft 365 Apps admin center](https://config.office.com). Ensure that the [requirements](../admin-center/servicing-profile.md#requirements-for-using-a-servicing-profile) for using a servicing profile are met in your environment.
3. Navigate to **Servicing** > **Monthly Enterprise** and launch the wizard by selecting **Get Started**. Select **Next** again to go to the **Device Selection Criteria** page.
4. On the top, select **Choose groups to include** and add the Microsoft Entra groups you want to target. This defines the maximum set of devices that will be targeted after applying the remaining selection criteria.
    - Example: You specify a Microsoft Entra group with two devices, one running on Current Channel, the other on Monthly Enterprise Channel. If you only select Monthly Enterprise Channel in the **Channels** section, only one device is added to the servicing profile's scope, as the other one doesn't match all selection criteria. If you have more devices on that channel in your inventory, targeting will still be restricted to the one device from the Microsoft Entra group.
5. When enabling a servicing profile, devices on the Monthly Enterprise Channel will be targeted automatically. The chart on the top right gives you an overview of how many devices can be targeted with the current selection.
6. Review and adjust the other selection criteria.
7. Select **Next** to go to the **Update exclusion dates** page. Enter exclusion dates if needed.
8. Select **Next** to go to the **Update deadline** page. We recommend going with the default setting to balance user experience and reaching security compliance quickly. [Learn more about how deadlines work](../admin-center/servicing-profile.md#set-an-update-deadline).
9. Select **Next** to go review your config, then select **Create Profile** to get things going.

After creation, the servicing profile will start to calculate which devices fall into the selected criteria. Once this is finished, it starts to instruct devices that are online to update to the latest Monthly Enterprise Channel release. Review the progress on the **Devices** tab. It might take a few hours before you see the first wave of devices moving, so review the dashboard regularly. If the updates fail on a given device, see more details on the **Issues** tab.

After a few days, the bulk of targeted devices should have updated to the latest Microsoft 365 Apps release. If everything went smoothly, go to the **Settings** tab and add additional Microsoft Entra groups or just add devices or users to the groups directly to broaden the scope. We recommend considering removing the Microsoft Entra group filter at some point to also cover devices that aren't Microsoft Entra joined.

## Best practices working with servicing profiles

Here are some best practices when it comes to managing updates with a servicing profile:

- Like other cloud services or Microsoft Configuration Manager, servicing profile is an asynchronous service. When you create or change the configuration, the service processes your input in the background. The user interface (especially the **Devices** tab) won't reflect your changes immediately. 
- After changing the configuration (selection criteria, update deadline, customer rollout waves, etc.), allow the service some time to process your changes. During this processing, you might see the number of devices in profiles drop as the service recalculates the scope and state of devices. The devices are then added back to the scope in batches of several hundred or thousand devices. Depending on the total number of devices in your environment, this process might take several hours to complete. 
- This also applies when a new update is released. Initially, the servicing profile will reset to zero devices, and devices will be added back to the servicing profile over time. 
- Allowing each change to finish calculation first before introducing the next change is recommended. Be patient during this process.
- The same applies when pausing or resuming a servicing profile. Allow the service to process the change, and don't pause/resume the service in quick succession. Pausing a servicing profile won't stop already initiated update installations on devices, but will stop the service from sending out new update commands to devices. 
- When triggering a rollback, the same applies. After configuring a rollback action, the service needs time to process the change and waits for the device to check in to send the rollback commands. 
- When using Microsoft Entra groups for including or excluding devices or creating custom rollout waves, limiting the number of members to 20,000 per group is recommended. You can specify multiple groups. Also, processing multiple smaller groups is faster than processing a single large group. Instead of using one Microsoft Entra group with, for example, 40,000 members, it's recommended to use two groups with 20,000 members each. 

## How do the selectors work

A servicing profile offers multiple selectors to allow you to target the right set of devices. Once the selectors are picked and saved, the servicing profile checks each device listed in inventory against those. Any given device must match all selected criteria to be added to the profile. If a device doesn't pass a check, it will not be added, even if it passes other checks.

- **Groups:** This selector allows you to specify one or multiple Microsoft Entra groups. Nested groups are supported. To pass the check, one of the two conditions must be met:
    - For devices: Those must be Microsoft Entra hybrid joined (also known as HAADJ) or Microsoft Entra joined (also known as AADJ) and listed in the inventory.
    - For users: All devices in inventory with a Microsoft 365 Apps installation activated by the specified user passes the check. For this condition, there's no requirement of a device being joined into any directory service.
- **Channels:** This selector checks for the currently installed update channel of the Microsoft 365 Apps. To pass the check, a device must run a Microsoft 365 Apps update channel that has been selected.
- **Disk space:** This selector checks for the available disk space reported into inventory. To pass the check, a device must have more disk space available than specified.
- **Macros:** This selector checks if inventory has reported macro usage in the past 30 days. Inventory holds a binary Yes/No information, if at least one file with macros has been opened in the last 30 days.
- **Add-ins**: This selector checks if inventory has reported add-ins being installed on a device. Inventory holds detailed add-in installation data, but this is a binary Yes/No check. It's based on just the presence of an add-in, not the actual usage.

## How a servicing profile is applied to a device

After the servicing profile has been created, the service will pre-calculate the number of devices that should be targeted. All devices connect to the Microsoft 365 Apps admin center regularly and check for pending actions or upload an updated inventory. Devices that are targeted by a servicing profile will receive commands to start performing an update to the latest Monthly Enterprise Channel release. These devices will also receive commands that instruct the local Office Update Engine to ignore commands that are coming from other management solutions. This is scoped to Microsoft 365 Apps updates only; all other management tasks (reporting inventory, running installations, updating other products) remain unchanged.

Once the device has received the command to perform an update, it will use the Office CDN, [Delivery Optimization](../updates/delivery-optimization.md), and potentially available Connected Caches or peers to download and apply the update. If the update can’t be applied due to open Microsoft 365 apps, it retries silently to do so in the background, during device reboot or when the device is locked and the operating system went into idle. If the update couldn’t be applied until the specified deadline is reached, the user receives multiple prompts to close the applications and apply the updates. After roughly 48 hours, the user will get a final notification with a countdown. When this reaches zero, open documents are saved, the applications closed and updated, then reopened and documents reloaded. But in most cases pending updates can be silently applied in the background without having to prompt the user.

The portal receives status information about these steps and the admin will see devices transitioning from **Not Started** to **In Progress** and to **Updated** finally. If an error occurs on the device, it is flagged accordingly in the portal and a reapply initiated. In most cases failures are related to the download of the update; for example, when the device was shut down while the download was active.

Once devices are updated, they'll remain in this state until Microsoft releases the next update to the Monthly Enterprise Channel. The service will then automatically recalculate the required actions per device and start handing those out to the devices. By default, this happens in waves across four days to reduce impact on the network. There's no manual action required to initiate the monthly update cycle.
