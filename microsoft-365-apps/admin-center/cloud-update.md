---
title: "Overview of cloud update in the Microsoft 365 Apps admin center"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
ms.reviewer: dimehta
audience: ITPro
ms.topic: conceptual
ms.service: o365-proplus-itpro
ms.localizationpriority: medium
ms.collection: Tier1
recommendations: false
description: "Provides Office admins information about cloud update in the Microsoft 365 Apps admin center"
ms.date: 07/25/2024
---

# Overview of cloud update in the Microsoft 365 Apps admin center

Cloud update provides a modern update management solution for Microsoft 365 Apps. Use cloud update to address common servicing needs with features such as custom rollout waves, exclusion windows, pause, and rollback. It works for organizations of any size, handling compatibility concerns for larger environments while offering simpler controls for smaller businesses. In addition, cloud update makes [Copilot readiness](../updates/change-channel-for-copilot.md) easier by maintaining monthly updates with minimal administrative effort.

## Getting started with cloud update

Cloud update is the recommended tool for servicing Microsoft 365 Apps. Use the following resources to prepare, enable, configure, and monitor cloud update for your organization.

1. Review the [requirements for using cloud update](#requirements) to ensure your environment is ready.
2. Review how [cloud update works with other management tools](#compatibility-with-other-management-tools) and verify that you don't have any conflicts.
3. Review how cloud update uses [channel to profile mapping](#channel-to-profile-mapping) for identifying eligible devices and onboarding them for update management.
4. Learn more about the [controls](#profile-controls) and [settings](#tenant-settings) available with cloud update.
5. Follow the guide to [enable and configure cloud update](../best-practices/adopting-cloud-update.md).
6. Refer to the [troubleshooting](#troubleshooting) section for more advanced topics.

## Requirements

### Supported built-in admin roles
<!--Using include for adding requirements-->
[!INCLUDE [Roles requirements](./includes/requirements-roles.md)]

### Licensing requirements
<!--Using include for adding requirements-->
[!INCLUDE [License requirements](./includes/requirements-licenses.md)]

### Product version requirements
<!--Using include for adding requirements-->
[!INCLUDE [Version requirements](./includes/requirements-versions.md)]

### Network requirements
<!--Using include for adding requirements-->
[!INCLUDE [Network requirements](./includes/requirements-network.md)]

### Microsoft Entra groups requirements
Cloud update has multiple features that support the use of [Microsoft Entra groups](/entra/fundamentals/concept-learn-about-groups). For example, groups can be used to configure custom [rollout waves](#rollout-waves), setup [device exclusions](#exclude-groups) or exclude a certain group of devices from updates for a specific [time frame](#exclusion-windows).

<!--Using include for adding requirements-->
[!INCLUDE [Groups requirements](./includes/requirements-groups.md)]

## Touring cloud update

### Overview dashboard
The [Updates Overview](https://config.office.com/officeSettings/MPOverview) page for cloud update provides an at-a-glance view of your update progress, health, and management status for all of your channel profiles.

- **Update progress** shows the current update progress for all update channels, filterable by channel profile. Use this view to see how your rollout is progressing for the latest build. Drill down deeper to see all managed or unmanaged devices.

- **Channel overview** shows the active channel profiles for your tenant, including their status, current release, and release date. 

- **Update failures** shows all reported failures and issues that might require attention. Drill down deeper to see the individual devices and determine if any other action is required to ensure these devices are active and checking in.

- **Tenant Settings** is a separate tab on the overview page for configuring tenant-level settings, such as [exclusion windows](#exclusion-windows) and [exclude groups](#exclude-groups).

### Monthly Enterprise Channel profile
[Monthly Enterprise Channel](../updates/overview-update-channels.md#monthly-enterprise-channel-overview) delivers updates once a month on a predictable schedule (patch Tuesday). With this cadence, the Monthly Enterprise Channel profile is able to support more controls, such as [rollout waves](#rollout-waves) and [update validation](#update-validation).

The [Monthly Enterprise Channel profile](https://config.office.com/officeSettings/MPmecChannel) page for cloud update provides an at-a-glance view of your update progress, management status, and health for devices on Monthly Enterprise Channel.

- **Rollout information** provides you with insights about the active state of the profile and current release details.

- **Update progress** shows the current update progress for devices managed by the Monthly Enterprise Channel profile. Use this view to see how your rollout is progressing for the latest build. Drill down deeper to see all devices managed by this profile.

- **Update validation** shows you deployment health insights about the latest update when using custom rollout waves. Use these insights to determine the update's effect on your environment.

- **Update failures** shows all reported failures and issues for the Monthly Enterprise Channel profile that might require attention. Drill down deeper to see the individual devices and determine if any other action is required to ensure these devices are active and checking in.

- **Profile settings** is a separate tab on this page for configuring profile-specific settings, such as [rollout waves](#rollout-waves) and the [update deadline](#deadline).

### Current Channel profile
[Current Channel](../updates/overview-update-channels.md#current-channel-overview) delivers updates multiple times a month, on an unset schedule as soon as they're ready for customers. Due to this cadence, the Current Channel profile a reduced set of features that fit the channel dynamic.

The [Current Channel profile](https://config.office.com/officeSettings/MPCurrentChannel) page for cloud update provides an at-a-glance view of your update progress, management status, and health for devices on Current Channel.

- **Rollout information** provides you with insights about the active state of the profile and current release details.

- **Update progress** shows the current update progress for devices managed by the Current Channel profile. Use this view to see how your rollout is progressing for the latest build. Drill down deeper to see all devices managed by this profile.

- **Potential update issues** shows potential issues that might require more attention to ensure devices are reporting in and receiving their updates. Failure details aren't available for this profile due to the fast-paced nature of Current Channel.

- **Profile settings** is a separate tab on this page for configuring profile-specific settings, such as the [update deadline](#deadline).

## Profile controls

Profile controls let admins pause a rollout or roll back to a previous build among other actions for each profile.

### Pause

> [!NOTE]
> Pause is only available for devices managed by the Monthly Enterprise Channel profile. 

Pause is a feature allowing you to stop all update actions. For example, if the latest update for Microsoft 365 Apps isn't compatible with another app in your environment, you can pause the profile until the issue is resolved. Keep these points in mind when using pause:

- When you pause a cloud update profile, all remaining update deployments are halted. They remain halted until an admin resumes the profile. Resume the profile as soon as possible to prevent blocking your devices from receiving updates.
- For devices, which are already in the "in progress" state, the update installation continues. Consider issuing a [rollback](#rollback) on these devices if necessary.
- When a profile is paused, the rollback feature is still acknowledged.

To pause and resume a profile, follow these steps:

1. Sign in to the [Microsoft 365 Apps admin center](https://config.office.com) with a privileged account.
2. Expand **Cloud Update** from the left navigation and select **Monthly Enterprise Channel**.
3. On the **Overview** tab of the **Monthly Enterprise Channel** profile, select **Pause channel**. After a moment, the button changes to **Resume channel**.
4. Confirm the channel is paused by selecting the **Overview** page from the left navigation and reviewing the **Channel overview** card.
5. Resume the profile by returning to the **Monthly Enterprise Channel** profile page and selecting **Resume channel**.

> [!NOTE]
> For [rollout waves]((#rollout-waves)), the scheduled rollout continues when a profile is paused and does not restart when the profile is resumed.

### Rollback

> [!NOTE]
> Rollback is only available for devices managed by the Monthly Enterprise Channel profile. 

Rollback enables you to roll back a device to a previous version. For example, if your finance department experiences an issue with the latest version of Excel, you can roll them back to the previous version. Keep these points in mind when using rollback:

- Devices that are rolled back will stay on the previous version until the next version is released. When the new version releases, devices in a rolled-back state revert to their regular update schedule. They skip the previous version and update to the latest release. 
- If the underlying issue was resolved, you can cancel a rollback action before the next version is available. 
- A rollback can still be initiated when a profile is paused.
- Devices always roll back to the previous version of the Monthly Enterprise Channel. It isn't possible to roll devices back to another channel.

To trigger a rollback, follow these steps:

1. Sign in to the [Microsoft 365 Apps admin center](https://config.office.com) with a privileged account.
2. Expand **Cloud Update** from the left navigation and select **Monthly Enterprise Channel**.
3. On the **Overview** tab of the **Monthly Enterprise Channel** profile, select **Channel actions** > **Rollback devices**.
4. On the flyout, select the version you want to roll the device back to, enter the name of the device or devices, and select **Roll back**.
5. The rollback action takes 24 hours to complete. You can monitor the status from the **Overview** page by selecting **Channel actions** > **Manage rolled back devices**.

## Tenant settings

Tenant settings apply to all profiles, unless otherwise specified, and allow you to schedule exclusion windows and assign exclusion groups.

### Exclusion windows

> [!NOTE]
> Exclusion windows is only available for devices managed by the Monthly Enterprise Channel profile. 

Exclusion windows enables you to limit change in your environment during busy periods, such as tax season or at the end of the fiscal year. Create an exclusion window to prevent devices from downloading updates during specific dates. Keep these points in mind when using exclusion windows:

- By default, exclusion windows affect all devices managed by a corresponding cloud update profile. 
- You can set an exclusion window for specific devices or users in a Microsoft Entra group. Only these specified devices or users are excluded from updates, while all other devices follow their regular update schedule.
- Update exclusions start and end at 00:00 UTC on the specified dates, not local device time.
- Consider adding a buffer when scheduling a start and end date to accommodate UTC. If a device received the update policy before the exclusion window applies, it continues with the update installation.
- Exclusion windows supports groups. Refer to the [Microsoft Entra group requirements](#microsoft-entra-groups-requirements) for cloud update.

To create and manage an exclusion window, follow these steps:

1. Sign in to the [Microsoft 365 Apps admin center](https://config.office.com) with a privileged account.
2. Expand **Cloud Update** from the left navigation and select **Overview**.
3. On the **Overview** page, select the **Tenant Settings** tab.
4. From **Tenant Settings**, select **Exclusion windows**.
5. Select **Add exclusion window**.
6. From the flyout, provide a name, description, schedule, and scope. Select **Create**.
7. Once an exclusion window is created, you can monitor, edit, and/or delete it from the **Exclusion windows** page.

> [!NOTE]
> For rollout waves, the scheduled rollout continues when an exclusion window is active and does not restart when updates resume.

### Exclude groups

Cloud update is designed to give you full update coverage across the devices on Current Channel and Monthly Enterprise Channel. However, there could be situations where you need to exclude specific devices or users. For example, you might need to move a device to an update channel that isn't currently available with cloud update, or exclude user accounts used for testing from cloud update. Keep these points in mind when using exclude groups:

- Refer to the [Microsoft Entra group requirements](#microsoft-entra-groups-requirements) for cloud update.
- Exclude groups is a tenant-level setting and applies to all profiles.
- Excluded devices are reflected in your [device inventory](https://config.office.com/officeSettings/inventory/devices) within 24 hours. You can confirm a device was excluded by reviewing the **Cloud Update Status** column.
- Once a device is marked as excluded, the service attempts to send an offboard notification to the device. If you plan to manage the device with a different tool, you can change the following registry value to regain control sooner:
`HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\cloud\office\16.0\Common\officeupdate`  
`Value: IgnoreGPO=0`

To add or modify a group exclusion, follow these steps:

1. Sign in to the [Microsoft 365 Apps admin center](https://config.office.com) with a privileged account.
2. Expand **Cloud Update** from the left navigation and select **Overview**.
3. On the **Overview** page, select the **Tenant Settings** tab.
4. From **Tenant Settings**, select **Exclude groups**.
5. Select **Exclude specific groups of devices**.
6. Select **+ Add group to list**.
7. From the flyout, add your Microsoft Entra group or groups and choose **Add to list**.
8. Select **Save**.

## Profile settings

Profile settings are specific to each profile and allow you to configure rollout waves, enable update validation, and set an update deadline.

### Rollout waves

Devices managed by the Monthly Enterprise Channel profile can use rollout waves.

Rollout waves let you configure custom waves for your update rollout. For example, you might have a group of early adopters that volunteer to receive changes first, while users in your finance department prefer to get their updates last. Keep these points in mind when using rollout waves:

- Rollout waves support groups. Refer to the [Microsoft Entra group requirements](#microsoft-entra-groups-requirements) for cloud update.
- You don't need to include every user or device in a custom rollout wave. A final wave is included by default that includes all remaining devices in the Monthly Enterprise profile.
- You can configure a delay between waves ranging from 1-5 days.
- If [update validation]() is enabled, ...
    - wave 1 is locked to 7 days, and all other waves are configured for **days between waves**.
    - we recommend to have at least twenty devices on wave 1, so enough signals are generated.
    - waves start on their assigned start dates. Update validation does not halt or delay waves.
- Rollout waves aren't enforced for expedited actions, such as rollback and switch device update channel. These actions occur outside of a wave assignment.
- The rollout wave schedule continues even if a profile is paused or during an active exclusion window. For example, if you pause a profile on patch Tuesday and resume 20 days later, all rollout waves pass, and all unpatched devices are eligible for updates.
- A common practise is to use the first two waves for closer monitoring of the new update, and the later two waves for broad deployment. Often, wave 1 and 2 covers the first 20% of all devices, while the remaining 80% are covered by wave 3 and 4.

To configure rollout waves, follow these steps:

1. Sign in to the [Microsoft 365 Apps admin center](https://config.office.com) with a privileged account.
2. Expand **Cloud Update** from the left navigation and select **Monthly Enterprise Channel**.
3. On the **Monthly Enterprise Channel** page, select the **Settings** tab.
4. From **Settings**, select **Rollout waves**.
5. Select **Yes, create rollout waves**.
6. Select **+ Add waves**, provide the groups you want in wave 1, and choose **Save**. Repeat these steps for waves 2 and 3.
7. Adjust the **Days between waves** slider to meet your needs.
8. Select **Save**.
9. Once your waves are configured, you can monitor the wave rollout from the [Monthly Enterprise Channel](https://config.office.com/officeSettings/MPmecChannel) page by clicking on **View waves overview** beneath the wave chart.

> [!IMPORTANT]
> Rollout waves can be used to help reduce network congestion. In addition, cloud update includes built-in update thresholds. These include the following:
> 
> - The **Current Channel** profile leverages the default rollout schedule defined by the Office CDN, which on average reaches full deployment within 5 days of patch Tuesday.
> - The **Monthly Enterprise Channel** profile has a separate threshold that prevents more than 30% of your eligible devices from updating per day. This same enforcement is applied when using custom rollout waves. 

### Update validation

Update validation is available for devices managed by the Monthly Enterprise Channel profile and using [custom rollout waves](#rollout-waves).

Update validation is a feature that enables you to validate new updates for the Monthly Enterprise Channel before organization-wide deployment. This feature automatically collects and consolidates health indicators such as app and add-in performance and reliability data and brings attention to any identified issues. Its automated nature reduces the need for manual administrative work and simplifies the update deployment process.

 For more information, watch [Introducing Update Validation in the Microsoft 365 Apps admin center](https://youtu.be/xZtXI-Ws-pE) or read the [full documentation](update-validation.md).

### Deadline

Deadline is available for all cloud update profiles. 

The update deadline is used to ensure updates are applied in a specified period. Keep these points in mind when configuring your update deadline:

- The update deadline is independently calculated for each device, commencing from the first unsuccessful installation attempt. For example, if open applications prevent the update from installing, the deadline is triggered from this initial failure. Neither the start of the deployment wave nor the update's release date influence this timeline.
- If the deadline passes, a prompt is shown to the user, offering the option to close their applications now or postpone the installation.
- Users can postpone the update installation three times for two hours each, before a final two-hour countdown is shown. If the deadline is around seven hours past already, users can postpone only once.
- When the countdown reaches zero, the system saves open files, closes necessary applications, applies the update, and then reopens the applications and files. User downtime is less than five minutes.
- If the deadline is set to zero, users immediately receive a prompt to update if apps are open, with the option to delay the update.
- When users choose to postpone, the update can still be applied under other conditions. For example, if the device reboots or if [Update Under Lock](https://techcommunity.microsoft.com/t5/microsoft-365-blog/update-under-lock-improved-update-experience-for-microsoft-365/ba-p/3618901) applies.

To configure the deadline, follow these steps:

1. Sign in to the [Microsoft 365 Apps admin center](https://config.office.com) with a privileged account.
2. Expand **Cloud Update** from the left navigation and select an update profile.
3. On the profile page, select the **Settings** tab.
4. From **Settings**, select **Deadline**.
5. Adjust the **Update deadline** slider to your preferred value and select **Save**.

## Compatibility with other management tools

Cloud updates take priority over existing update management settings for Microsoft 365 Apps. For example, if you apply settings through Microsoft Configuration Manager or set policies using Microsoft Intune’s configuration profiles, these settings remain unchanged by the cloud update but aren't enforced anymore. This change affects all devices managed by the cloud update.

> [!NOTE]
> Cloud update will not change the update settings of other products, such as Windows or Edge. It will also not prevent management solutions from reinstalling Microsoft 365 Apps. 

## Channel to profile mapping

With cloud update enabled, devices are automatically mapped to the corresponding profile based on their update channel. For example, all devices on Current Channel map to the Current Channel profile. Once the devices are mapped to a profile, cloud update delivers the appropriate policies to these devices.

Cloud update currently supports management for devices on Current Channel and Monthly Enterprise Channel. Devices on any other update channel won't be managed by cloud update until they're moved to a channel that cloud update supports.

## Deactivation
If cloud update isn't the right fit for an organizations' update management requirements of devices on Monthly Enterprise or Current channel, admins can deactivate cloud update for one or both channels. To deactivate, go into the profile in the left navigation under cloud update for the channel that you want to deactivate. Select the **Settings** tab and choose **cloud update review**. Select the **deactivate the channel** link, fill in the feedback or allow Microsoft to contact you, and choose **Submit**.

The profile states for the devices on the deactivated channel are set to "Deactivated immediately". Devices are removed from profiles within 30 minutes. Additionally, the cloud update status in the inventory is updated to **Eligible for *ChannelName*** within the same 30-minute window. Admins can manage these devices but should first set *ignoreGPO = 0* for these devices before beginning to manage them. 

## Troubleshooting
> [!IMPORTANT]
> If you are experiencing any issues enabling cloud update or managing the devices in your environment, be sure to review the [requirements for cloud update](#requirements) before proceeding.

### Devices are stuck in an onboarding state
With cloud update enabled, the service uses [channel to profile mapping](#channel-to-profile-mapping) to automatically identify and onboard devices to their corresponding profile. Devices on the Monthly Enterprise Channel show a status of **Onboarding to Monthly Enterprise Channel** until a new update is available. Here are the two scenarios where this situation applies:

- When cloud update first discovers a device with the latest Microsoft 365 Apps version for the Monthly Enterprise Channel already installed, it displays **Onboarding to Monthly Enterprise Channel**. This status continues until the next update is released, usually on the upcoming patch Tuesday.

- When cloud update first discovers a device with an outdated Microsoft 365 Apps version for Monthly Enterprise Channel, and is scheduled in a later custom rollout wave, the device displays **Onboarding to Monthly Enterprise Channel**. This status remains until the device's wave begins and the update is released.

### Devices are updating outside of their assigned wave

Updates applied outside of a custom rollout wave are due to external actions occurring on the device. Review the following scenarios and take any necessary actions:

- **Add-on app deployments**: When you Install an add-on app, such as Project or Visio, it can trigger an update check when the application is retrieved from the Office CDN. Consider updating your XML to included [Version="MatchInstalled"](../deploy/office-deployment-tool-configuration-options.md#version-attribute-part-of-add-element) to install the same version of Office, even if a newer version is available.

- **Onboarding devices**: Devices that are still in an **Onboarding to [channel-name]** state are managed by your existing settings until cloud update takes control. During this time, other management settings can enforce updates. Consider excluding devices from these other management tools or wait until the next patch Tuesday cycle for cloud update to engage.
  
### My Device-based group didn't work with *[feature name]*

If you're using a group that contains device objects, the devices must be Microsoft Entra joined or hybrid joined. Devices that are Microsoft Entra registered/Workplace joined aren't recognized when the group is processed. As an alternative, consider adding one or more corresponding user objects. For more information, see the [requirements for using Microsoft Entra groups](#microsoft-entra-groups-requirements).

## Report a problem

If you encounter a problem enabling or managing cloud update, first verify that you reviewed the [requirements](#requirements) and completed the steps in the [troubleshooting](#troubleshooting) section.

If the problem persists after troubleshooting, open a support ticket with Microsoft. For a quick investigation, include the date and time when the issue was discovered, and provide a detailed description of the problem. Provide a detailed description of the problem. If it relates to a device, gather the Device ID from your [device inventory](https://config.office.com/officeSettings/inventory/devices). You can find the Device ID by selecting the device name in inventory and reviewing the flyout.

## Send feedback

We value your feedback. To submit feature suggestions and report issues, you can use the Feedback button in the top-right corner of the Microsoft 365 Apps admin center.

:::image type="content" source="media/cloud-update/m365aac-feedback.png" alt-text="Screenshot of a feedback form interface with three options on the left side: 'I Like Something' with a happy face emoji, 'I Don't Like Something' with a frowning face emoji, and 'I Have a Suggestion' highlighted in orange with a light bulb emoji. On the right side, there's a section titled 'What do you suggest?' with a large text box prompting 'Please type in your comment' and a smaller box underneath for an optional email address. There's a checkbox labeled 'Include screenshot' and an orange 'Submit' button. In the bottom left corner is a 'Privacy Statement' link." lightbox="media/cloud-update/m365aac-feedback-1.png":::
