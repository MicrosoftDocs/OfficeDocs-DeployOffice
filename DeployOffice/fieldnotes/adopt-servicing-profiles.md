---
title: Adopt servicing profiles for Microsoft 365 Apps
author: manoth-msft
ms.author: manoth
manager: dougeby
audience: ITPro 
ms.topic: article 
ms.service: o365-proplus-itpro
ms.localizationpriority: medium
ms.collection: tier3
description: "Provide guidance to Office admins on how to adopt servicing profiles for Microsoft 365 Apps"
ms.date: 02/08/2022
---

# Best practices from the field: Adopting servicing profiles for Microsoft 365 Apps

> [!NOTE]
> This article was written by Microsoft experts in the field who work with enterprise customers to deploy Office.

[Servicing profiles](../admincenter/servicing-profile.md) let you use automation to deliver monthly updates to Microsoft 365 Apps for enterprise directly from the Office Content Delivery Network (CDN). Through extensive one-on-one engagement with global enterprises, we have built this article to walk you through best practices of enabling servicing profiles within your environment and discuss the benefits for you and your organization.

This article covers:
- The benefits of using a servicing profile
- Step-by-step guidance on two ways to adopt servicing profiles
- Deep dive on how the device selection criteria works
- What happens to the devices once the servicing profile is enabled

> [!NOTE]
> All of above and below applies to Microsoft 365 Apps updates only. This feature does not replace, modify, or impact existing solutions for deploying other updates, for example Windows updates.

> [!TIP]
> If you prefer video over text, we have a [servicing profile overview](https://youtu.be/i_eUkyFX30E) video and a [servicing profile deep dive](https://youtu.be/YO6a3iNVXXI) video available.

## Benefits of using a servicing profile

There are multiple benefits of using a servicing profile over common update management tools:
- **Improved security currency:** For enterprise environments we usually see a security currency of around 66%. This means that after each monthly “Patch Tuesday” approximately 66% of Microsoft 365 Apps on devices within a tenant have been patched with the latest security updates. With a servicing profile we see this currency rise above 90%. This means that the new service helps reducing known threats in your environment faster and broader.

- **Increased reach:** Common update management tools are often limited by the boundary of a directory service. For example, devices must be joined into Active Directory, to be managed by a given solution. With a servicing profile, you're breaking this barrier and can manage all Microsoft 365 Apps instances that were activated by your tenant and have an Azure AD user from your tenant signed in. It doesn't matter if the device is joined into Active Directory, Azure Active Directory, registered into Azure Active Directory, or remains in workgroup mode.

- **Leveraging the cloud:** As a true cloud-based service, a servicing profile isn't dependent on any on-premises infrastructure. Where ever the device is, as long as it can connect to the cloud, it will be serviced.

- **Easy onboarding:** If a device falls into scope of a servicing profile (we'll deep-dive into this later in the article), it will automatically override any other Office update management mechanism. No need to detach the Microsoft 365 Apps from other management solutions first. If a device falls out-of-scope for the servicing profile, the previous update management control is restored. The servicing profile will only change the way Office updates are handled, everything else (for example, how updates for Windows or Edge are managed) remains the same. In summary, a device can be managed by two solutions at the same time without any conflicts.

## Decide if you want to adopt servicing profiles by update channel or using Azure AD groups

Instead of enabling a servicing profile for all devices at the same time, some admins want to adopt them step-by-step and monitor if everything runs smoothly. There are two common ways to adopt the feature in a staged manner:

- **By update channel:** With this approach, the servicing profile will target a small selection of update channels first. It will ignore all devices on other channels. This allows you to migrate one channel at a time over to both the [Monthly Enterprise Channel](../overview-update-channels.md#monthly-enterprise-channel-overview) and be managed through a servicing profile. Over time, you extend the selection of channels until all channels are covered and all devices are moved.

- **By Azure AD group:** The alternative approach is to use Azure AD groups to restrict the servicing profile to apply only to specified devices or users. This allows you to add devices to the scope on a more granular level.

To decide which approach is best for you, review how many Microsoft 365 Apps installs you have per update channel:
- Ensure that [inventory](../admincenter/inventory.md) in the Microsoft 365 Apps admin center is enabled and running for at least a week, so most devices have registered into it.
- Navigate to the [Security Update Status](https://config.office.com/officeSettings/currency) page in the Microsoft 365 Apps admin center, scroll down and review the number of devices per channel.

If you're comfortable with migrating all devices in a given channel at once, this is the right approach for you. If you want to migrate devices in smaller batches, you should go by Azure AD groups. This could, for example, be the case if you have a couple of thousands of devices on a given channel, and you want to migrate them in, for example, three batches to limit change.

## How to set up a servicing profile with the “by update channel” approach

If you want to adopt a servicing profile step-by-step, you can do so by targeting a single update channel first. Microsoft 365 Apps on these devices will be migrated to the Monthly Enterprise Channel and kept updated automatically. You can monitor the progress in the portal and add additional update channels over time to increase coverage.
1. Sign in to the [Microsoft 365 Apps admin center](https://config.office.com). Ensure that the [requirements](../admincenter/servicing-profile.md#requirements-for-using-a-servicing-profile) for using servicing profiles are met in your environment.
2. Navigate to **Servicing** > **Monthly Enterprise** and launch the wizard by selecting **Get Started**. Select **Next** again to go to the **Device Selection Criteria** page.
3. When enabling a servicing profile, devices on the Monthly Enterprise Channel will be targeted automatically. The chart on the top right gives you an overview how many devices will be targeted with the current selection.
4. Select the check boxes for all update channels you want to target in the first batch. Often we start with targeting Monthly Enterprise Channel plus Beta Channel and Current Channel (Preview) first. After the bulk have been updated, we extend to Current Channel and then to Semi-Annual Enterprise Channel, including Preview.
5. Review and adjust the other selection criteria.
6. Select **Next** to go to the **Update exclusion dates** page. Enter exclusion dates if needed.
7. Select  **Next** to go to the **Update deadline** page. We recommend going with the default setting to balance user experience and reaching security compliance quickly. [Learn more about how deadlines work](../admincenter/servicing-profile.md#set-an-update-deadline).
8. Select **Next** to go review your config, then select **Create Profile** to get things going.

After creation, the servicing profile will start to calculate which devices fall into the selected criteria. Once this is finished, it will start to instruct devices that are online to update to the latest Monthly Enterprise Channel release. You can review the progress on the **Devices** tab. It might take a few hours before you see the first wave of devices moving, so review the dashboard on a regular base. If the updates fail on a given device, you can see more details on the **Issues** tab.

After a few days, the bulk of targeted devices should have updated to the latest Microsoft 365 Apps release. If everything went smoothly, you can go to the **Settings** tab and add additional update channels to migrate more devices to the servicing profile.

## How to set up the servicing profile with the “by Azure AD group” approach

If you want to adopt a servicing profile in more granular steps, you can do so by using Azure AD groups to limit the targeting to a certain set of devices. Microsoft 365 Apps on these devices will be migrated to the [Monthly Enterprise Channel](../overview-update-channels.md#monthly-enterprise-channel-overview) and kept updated automatically. You can monitor the progress in the portal and add additional Azure AD groups or devices to the existing groups over time to increase coverage.

1. [Create one or multiple Azure AD groups](/azure/active-directory/fundamentals/active-directory-groups-create-azure-portal) that you want to use for targeting. You can add three types of items to a group, and mixing them is possible:
    - Devices: Those must be Azure AD joined or hybrid Azure AD joined and known to the inventory in the Microsoft 365 Apps admin center.
    - Users: Based on the activation data, the servicing profile will identify which devices in inventory have a Microsoft 365 Apps installation activated by the specified user accounts. This will also cover devices running in [shared computer activation](../overview-shared-computer-activation.md) mode where a specified user has logged on and used Microsoft 365 Apps.
    - Azure AD groups: You can use nested groups, for example to delegate management of groups to business units. Nesting is supported for up to three levels.
2. Sign in to the [Microsoft 365 Apps admin center](https://config.office.com). Ensure that the [requirements](../admincenter/servicing-profile.md#requirements-for-using-a-servicing-profile) for using a servicing profile are met in your environment.
3. Navigate to **Servicing** > **Monthly Enterprise** and launch the wizard by selecting **Get Started**. Select **Next** again to go to the **Device Selection Criteria** page.
4. On the top, select **Choose groups to include** and add the Azure AD groups you want to target. This defines the maximum set of devices that will be targeted after applying the remaining selection criteria.
    - Example: You specify an Azure AD group with two devices, one running on Current Channel, the other on Monthly Enterprise Channel. If you only select Monthly Enterprise Channel in the **Channels** section, only one device will be added to the servicing profile's scope, as the other one isn't matching all selection criteria. If you have more devices on that channel in your inventory, targeting will still be restricted to the one device from the Azure AD group.
5. When enabling a servicing profile, devices on the Monthly Enterprise Channel will be targeted automatically. The chart on the top right gives you an overview how many devices will be targeted with the current selection.
6. Review and adjust the other selection criteria.
7. Select **Next** to go to the **Update exclusion dates** page. Enter exclusion dates if needed.
8. Select **Next** to go to the **Update deadline** page. We recommend going with the default setting to balance user experience and reaching security compliance quickly. [Learn more about how deadlines work](../admincenter/servicing-profile.md#set-an-update-deadline).
9. Select **Next** to go review your config, then select **Create Profile** to get things going.

After creation, the servicing profile will start to calculate which devices fall into the selected criteria. Once this is finished, it will start to instruct devices that are online to update to the latest Monthly Enterprise Channel release. You can review the progress on the **Devices** tab. It might take a few hours before you see the first wave of devices moving, so review the dashboard on a regular base. If the updates fail on a given device, you can see more details on the **Issues** tab.

After a few days, the bulk of targeted devices should have updated to the latest Microsoft 365 Apps release. If everything went smoothly, you can go to the **Settings** tab and add additional Azure AD groups or just add devices or users to the groups directly to broaden the scope. We recommend considering to remove the Azure AD group filter at some point to also cover devices that aren't Azure AD joined.

## How do the selectors work

A servicing profile offers multiple selectors to allow you to target the right set of devices. Once the selectors are picked and saved, the servicing profile will check each device listed in inventory against those. Any given device must match all selected criteria in order to be added to the profile. If a device doesn't pass a check, it will not be added, even if it passes other checks.

- **Groups:** This selector allows you to specify one or multiple Azure AD groups. Nested groups are supported. To pass the check, one of the two conditions must be met:
    - For devices: Those must be hybrid Azure AD joined (also known as HAADJ) or Azure AD joined (also known as AADJ) and listed in the inventory.
    - For users: All devices in inventory with a Microsoft 365 Apps installation activated by the specified user will pass the check. For this condition, there's no requirement of a device being joined into any directory service.
- **Channels:** This selector checks for the currently installed update channel of the Microsoft 365 Apps. To pass the check, a device must run a Microsoft 365 Apps update channel that has been selected.
- **Disk space:** This selector checks for the available disk space reported into inventory. To pass the check, a device must have more disk space available than specified.
- **Macros:** This selector checks if inventory has reported macro usage in the past 30 days. Inventory holds a binary Yes/No information, if at least one file with macros has been opened in the last 30 days.
- **Add-ins**: This selector checks if inventory has reported add-ins being installed on a device. Inventory holds detailed add-in installation data, but this is a binary Yes/No check. It's based on just the presence of an add-in, not the actual usage.

## How a servicing profile is applied to a device

After the servicing profile has been created, the service will pre-calculate the number of devices that should be targeted. All devices will connect to the Microsoft 365 Apps admin center on a regular basis and check for pending actions or upload an updated inventory. Devices that are targeted by a servicing profile will receive commands to start performing an update to the latest Monthly Enterprise Channel release. These devices will also receive commands that instruct the local Office Update Engine to ignore commands that are coming from other management solutions. This is scoped to Microsoft 365 Apps updates only; all other management tasks (reporting inventory, running installations, updating other products) remain unchanged.

Once the device has received the command to perform an update, it will use the Office CDN, [Delivery Optimization](../delivery-optimization.md), and potentially available Connected Caches or peers to download and apply the update. If the update can’t be applied due to open Office applications, it will try silently to do so in the background or during device reboot. If the update couldn’t be applied until the specified deadline is reached, the user will receive multiple prompts to close the applications and apply the updates. After roughly 48 hours, the user will get a final notification with a countdown. When this reaches zero, open documents will be saved, the applications closed and updated, then reopened and documents reloaded. Usually we see that in most cases Office can update itself during downtimes or reboots before having to prompt the user.

The portal will receive status information about these steps and the admin can see devices transitioning from **Not Started** to **In Progress** and to **Updated** finally. If an error occurs on the device, it will be flagged accordingly in the portal and a reapply initiated. In most cases failures are related to the download of the update; for example, when the device was shut down while the download was active.

Once devices are updated, they'll remain in this state until Microsoft releases the next update to the Monthly Enterprise Channel. The service will then automatically recalculate the required actions per device and start handing those out to the devices. By default this happens in waves across four days to reduce impact on the network. There's no manual action required to initiate the monthly update cycle.
