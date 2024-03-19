---
title: "Overview of cloud update in the Microsoft 365 Apps admin center"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: conceptual
ms.service: o365-proplus-itpro
ms.localizationpriority: medium
ms.collection: Tier1
recommendations: false
description: "Provides Office admins information about cloud update in the Microsoft 365 Apps admin center"
ms.date: 02/27/2024
---

# Overview

> [!NOTE]
Cloud update is the successor to servicing profile. If you still see servicing profile in the [Microsoft 365 Apps admin center](https://config.office.com), your tenant has been temporarily held back from the upgrade due to the use of **Device selection criteria** > **Choose groups to include**. This option is not available with cloud update. Please review the onboarding behavior for cloud update, which uses [channel to profile mapping](#channel-to-profile-mapping) for discovering and managing eligible devices.
> 
> If you are ready to upgrade today, follow these steps:
> 
> 1. Sign in to the Microsoft 365 Apps admin center.
> 2. Click the Give feedback button in the top right corner.
> 3. Select an option and enter a comment expressing your desire to switch to Cloud Update.
> 4. Provide your email address.
> 5. Click Submit.
>    
> We will reach out to you with more information.

Cloud update provides a modern update management solution for Microsoft 365 Apps. Use cloud update to address common servicing needs with features such as custom rollout waves, exclusion windows, pause, and rollback. It works for organizations of any size, handling compatibility concerns for larger environments, while offering simpler controls for smaller businesses. In addition, cloud update makes [Copilot readiness](../updates/change-channel-for-copilot.md) easier with the ability to move devices to a compatible update channel and maintain monthly updates with minimal administrative effort.

## Requirements

### Built-in roles for managing cloud update

You can use any of the following Microsoft Entra built-in roles to enable and manage cloud update:

| Role                       | Description       |
| -------------------------- | ----------------- |
| Global Administrator       | This role can manage all aspects of Microsoft Entra ID and Microsoft services that use Microsoft Entra identities.
| Security Administrator     | This role can read security information and reports and manage configuration in Microsoft Entra ID and Office 365.
| Office Apps Administrator (**Recommended**) | This role can manage Office apps cloud services, including policy and settings management, and manage the ability to select, unselect and publish 'what's new' feature content to end-user's devices.

> [!NOTE]
> Global Reader is another built-in role supported by the Microsoft 365 Apps admin center, but it does not support accessing cloud update.

### Licensing requirements

Cloud update supports the following subscription plans:

| Type       | Subscription Plan |
| ---------- | ----------------- |
| Education  | <li>Microsoft 365 A3</li><li>Microsoft 365 A5</li>
| Business   | <li>Microsoft 365 Business Standard</li><li>Microsoft 365 Business Premium</li>
| Enterprise | <li>Microsoft 365 E3</li><li>Microsoft 365 E5</li>

> [!IMPORTANT]
> Cloud update is not available to customers who have the following plans:
>- Microsoft 365 operated by 21Vianet
>- Microsoft 365 GCC
>- Microsoft 365 GCC High and DoD

### Product version requirements

Cloud update can manage Microsoft 365 Apps on Windows with the following version requirements:

- [Supported version of Microsoft 365 Apps](https://learn.microsoft.com/officeupdates/update-history-microsoft365-apps-by-date)
- [Supported version of Microsoft Windows 10/11](https://learn.microsoft.com/windows/release-health/supported-versions-windows-client)
- [Supported version of Windows Server that supports Microsoft 365 Apps](https://learn.microsoft.com/deployoffice/endofsupport/windows-server-support)

### Network requirements

Devices running Microsoft 365 Apps require access to the following endpoints:

| Microsoft service | URLs required on allowlist |
| ----------------- | -------------------------- |
| Cloud Update      | <li>login.live.com</li><li>\*.config.office.com</li><li>\*.config.office.net</li>
| Office CDN        | <li>officecdn.microsoft.com</li><li>officecdn.microsoft.com.edgesuite.net</li><li>otelrules.azureedge.net</li>

  Source: [Microsoft 365 URLs and IP address ranges](https://learn.microsoft.com/microsoft-365/enterprise/urls-and-ip-address-ranges?view=o365-worldwide)

### Requirements for using Microsoft Entra groups

Cloud update has multiple features that support the use of [Microsoft Entra groups](https://learn.microsoft.com/entra/fundamentals/concept-learn-about-groups). For example, groups can be used to configure custom [rollout waves](#rollout-waves) or setup [device exclusions](#exclude-groups). In all cases, the membership of these groups supports user and/or device objects with the following requirements:

- **Device objects** must be Microsoft Entra joined or hybrid joined.
- **User objects** must be present in Microsoft Entra ID and have a [supported license](#licensing-requirements) assigned.
- Multiple groups can be used, but a single group should contain no more than 20,000 objects.
- Nested groups is supported up to 3 levels deep.

## Getting started with cloud update

Cloud update is the recommended tool for managing Microsoft 365 Apps. Use the following resources to prepare, enable, configure, and monitor cloud update for your organization.

1. Review the [requirements for using cloud update](#requirements) to ensure your environment is ready.
2. Review how [cloud update works with other management tools](#compatibility-with-other-management-tools) and verify that you don't have any conflicts.
3. Review how cloud update uses [channel to profile mapping](#channel-to-profile-mapping) for identifying eligible devices and onboarding them for update management.
4. Learn more about the [controls](#profile-controls) and [settings](#tenant-settings) available with cloud update.
5. Follow the guide to [enable and configure cloud update](https://learn.microsoft.com/en-us/deployoffice/fieldnotes/adopting-cloud-update).
6. Refer to the [troubleshooting](#troubleshooting) and [FAQ](#faq) sections for more advanced topics.

## Touring cloud update

### Overview dashboard
The [Updates Overview](https://config.office.com/officeSettings/MPOverview) page for cloud update provides an at-a-glance view of your update progress, health, and management status for all of your channel profiles.

- **Update progress** shows the current update progress for all update channels, filterable by channel profile. Use this view to see how your rollout is progressing for the latest build. Drill down deeper to see all managed or unmanaged devices.

- **Channel overview** shows the active channel profiles for your tenant, including their status, current release, and release date. 

- **Update failures** shows all reported failures and issues that may require attention. Drill down deeper to see the individual devices and determine if any additional action is required to ensure these devices are active and checking in.

- **Tenant Settings** is a separate tab on the overview page for configuring tenant-level settings, such as [exclusion windows](#exclusion-windows) and [exclude groups](#exclude-groups).

### Monthly Enterprise Channel profile
[Monthly Enterprise Channel](../updates/overview-update-channels.md#monthly-enterprise-channel-overview) delivers updates once a month on a predictable schedule (patch Tuesday). With this cadence, the Monthly Enterprise Channel profile is able to support additional controls, such as [rollout waves](#rollout-waves) and [update validation](#update-validation).

The [Monthly Enterprise Channel profile](https://config.office.com/officeSettings/MPmecChannel) page for cloud update provides an at-a-glance view of your update progress, management status, and health for devices on Monthly Enterprise Channel.

- **Rollout information** provides you with insights about the active state of the profile and current release details.

- **Update progress** shows the current update progress for devices managed by the Monthly Enterprise Channel profile. Use this view to see how your rollout is progressing for the latest build. Drill down deeper to see all devices managed by this profile.

- **Update validation** shows you deployment health insights about the latest update when using custom rollout waves. Use these insights to determine if the latest update is causing a positive or negative impact to your environment.

- **Update failures** shows all reported failures and issues for the Monthly Enterprise Channel profile that may require attention. Drill down deeper to see the individual devices and determine if any additional action is required to ensure these devices are active and checking in.

- **Profile settings** is a separate tab on this page for configuring profile-specific settings, such as [rollout waves](#rollout-waves) and the [update deadline](#deadline).

### Current Channel profile
[Current Channel](../updates/overview-update-channels.md#current-channel-overview) delivers updates multiple times a month, on an unset schedule, as soon as they are ready for customers. Due to this cadence, the Current Channel profile a reduced set of features that fit the channel dynamic.

The [Current Channel profile](https://config.office.com/officeSettings/MPCurrentChannel) page for cloud update provides an at-a-glance view of your update progress, management status, and health for devices on Current Channel.

- **Rollout information** provides you with insights about the active state of the profile and current release details.

- **Update progress** shows the current update progress for devices managed by the Current Channel profile. Use this view to see how your rollout is progressing for the latest build. Drill down deeper to see all devices managed by this profile.

- **Potential update issues** shows potential issues that may require additional attention to ensure devices are reporting in and receiving their updates. Note that failure details are not available for this profile due to the fast-paced nature of Current Channel.

- **Profile settings** is a separate tab on this page for configuring profile-specific settings, such as the [update deadline](#deadline)

## Profile controls

Profile controls are additional actions that admins have access to for each profile. This includes capabilities such as pausing a rollout entirely and/or issuing a roll back to a previous build.

### Pause

Pause is available for devices managed by the Monthly Enterprise Channel profile. 

Pause is a feature that enables you to halt all further update actions. For example, if the latest update for Microsoft 365 Apps is not compatible with another app in your environment, you can pause the profile until the issue is resolved. Consider the following when using pause:

- When you pause a cloud update profile, all remaining update deployments are halted and will remain that way until an admin resumes the profile. It is recommended that you resume the profile at the earliest opportunity, otherwise your devices will be blocked from receiving updates.
- Devices that have already received their update policies are now "in progress" and will proceed with the assigned action. Consider issuing a [rollback](#rollback) on these devices if necessary.
- When a profile is paused, the rollback feature is still acknowledged.

To pause and resume a profile, follow these steps:

1. Sign in to the [Microsoft 365 Apps admin center](https://config.office.com) with a privileged account.
2. Expand **Cloud Update** from the left navigation and select **Monthly Enterprise Channel**.
3. On the **Overview** tab of the **Monthly Enterprise Channel** profile, select **Pause channel**. After a moment the button will change to **Resume channel**.
4. Confirm the channel is paused by selecting the **Overview** page from the left navigation and reviewing the **Channel overview** card.
5. Resume the profile by returning to the **Monthly Enterprise Channel** profile page and selecting **Resume channel**.

> [!NOTE]
> For rollout waves, the scheduled rollout continues when a profile is paused and does not restart when the profile is resumed.

### Rollback

Rollback is available for devices managed by the Monthly Enterprise Channel profile.

Rollback is a feature that enables you to roll back a device to a previous version. For example, if your finance department experiences an issue with the latest version of Excel, you can roll them back to the previous version. Consider the following when using rollback:

- Devices that are rolled back will stay on the previous version until the next version is released. When the new version is released, devices in a rolled back state return to their regular update schedule, skipping the previous version and updating to the latest release. 
- If the underlying issue has been resolved, you can cancel a rollback action prior to the next version being available. 
- A roll back can still be initiated when a profile is paused.
- Devices always roll back to the previous version of the Monthly Enterprise Channel. It is not possible to roll devices back to another channel.

To trigger a rollback, follow these steps:

1. Sign in to the [Microsoft 365 Apps admin center](https://config.office.com) with a privileged account.
2. Expand **Cloud Update** from the left navigation and select **Monthly Enterprise Channel**.
3. On the **Overview** tab of the **Monthly Enterprise Channel** profile, select **Channel actions** > **Rollback devices**.
4. On the flyout, select the version you want to roll the device back to, enter the name of the device(s), and click **Roll back**.
5. The roll back action will take 24 hours to complete. You can monitor the status from the **Overview** page by selecting **Channel actions** > **Manage rolled back devices**.

## Tenant settings

Tenant settings include settings that apply to all profiles (unless specified).
This includes capabilities such as scheduling an exclusion window or assigning an exclusion group.

### Exclusion windows

Exclusion windows is available for devices managed by the Monthly Enterprise Channel profile.

Exclusion windows is a feature that enables you to limit change in your environment during busy periods, such as tax season or at the end of the financial year. Create an exclusion window to prevent devices from downloading updates during specific dates. Consider the following when using exclusion windows:

- By default, exclusion windows affect all devices that are managed by a corresponding cloud update profile. 
- You have the option to scope an exclusion window using Microsoft Entra groups. Only devices or users specified in the Microsoft Entra group will be excluded, and all other devices will update at their regular schedule.
- Update exclusions start and end at 00:00 UTC on the specified dates, not local device time.
- Consider adding a buffer when scheduling a start and end date to accommodate UTC. If a device has already received the update policy before the exclusion window applies, it will continue with the update installation.
- Exclusion windows supports groups. Refer to the [Microsoft Entra group requirements](#requirements-for-using-microsoft-entra-groups) for cloud update.

To create and manage an exclusion window, follow these steps:

1. Sign in to the [Microsoft 365 Apps admin center](https://config.office.com) with a privileged account.
2. Expand **Cloud Update** from the left navigation and select **Overview**.
3. On the **Overview** page, select the **Tenant Settings** tab.
4. From **Tenant Settings**, select **Exclusion windows**.
5. Click **Add exclusion window**.
6. From the flyout provide a name, description, schedule, and scope. Click **Create**.
7. Once an exclusion window has been created, you can monitor, edit, and/or delete it from the **Exclusion windows** page.

> [!NOTE]
> For rollout waves, the scheduled rollout continues when an exclusion window is active and does not restart when updates resume.

### Exclude groups

Cloud update is designed to give you full update coverage across the devices on Current Channel and Monthly Enterprise Channel. However, there may be situations where you need to exclude one or more devices. For example, you may need to move a device to an update channel that is not currently available with cloud update. Consider the following when using exclude groups:

- Refer to the [Microsoft Entra group requirements](#requirements-for-using-microsoft-entra-groups) for cloud update.
- Exclude groups is a tenant-level setting and applies to all profiles.
- Excluded devices will be reflected in your [device inventory](https://config.office.com/officeSettings/inventory/devices) within 24 hours. You can confirm a device has been excluded by reviewing the **Cloud Update Status** column.
- Once a device is marked as excluded, the service will attempt to send an offboard notification to the device. If you plan to manage the device with a different tool, you can change the following registry value to regain control sooner:
`HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\cloud\office\16.0\Common\officeupdate`  
`Value: IgnoreGPO=0`

To add or modify a group exclusion, follow these steps:

1. Sign in to the [Microsoft 365 Apps admin center](https://config.office.com) with a privileged account.
2. Expand **Cloud Update** from the left navigation and select **Overview**.
3. On the **Overview** page, select the **Tenant Settings** tab.
4. From **Tenant Settings**, select **Exclude groups**.
5. Select **Exclude specific groups of devices**.
6. Select **+ Add group to list**.
7. From the flyout, add your Microsoft Entra group(s) and click **Add to list**.
8. Click **Save**.

## Profile settings

Profile settings include settings that apply to specific profiles.
This includes capabilities such as configuring rollout waves, enabling update validation, and assigning an update deadline.

### Rollout waves

Rollout waves is available for devices managed by the Monthly Enterprise Channel profile.

Rollout waves is a feature that enables you to configure custom waves for your update rollout. For example, you might have a group of early adopters that volunteer to receive changes first, while users in your finance department prefer to get their updates last. Consider the following when using rollout waves:

- Rollout waves support groups. Refer to the [Microsoft Entra group requirements](#requirements-for-using-microsoft-entra-groups) for cloud update.
- You do not need to include every user or device in a custom rollout wave. A final wave is included by default that includes all remaining devices.
- You can configure a delay between waves ranging from 1-5 days.
- If [update validation]() is enabled, wave 1 will be locked to 7 days and all other waves will the value configured for **days between waves**.
- Rollout waves are not enforced for expedited actions, such as rollback and switch device update channel. These actions will occur outside of a wave assignment.
- The rollout wave schedule continues when a profile is paused, or an exlusion window is active. For example, if you pause a profile on patch Tuesday and resume 20 days later, all rollout waves will have passed, and all unpatched devices will be eligible for updates. 

To configure rollout waves, follow these steps:

1. Sign in to the [Microsoft 365 Apps admin center](https://config.office.com) with a privileged account.
2. Expand **Cloud Update** from the left navigation and select **Monthly Enterprise Channel**.
3. On the **Monthly Enterprise Channel** page, select the **Settings** tab.
4. From **Settings**, select **Rollout waves**.
5. Select **Yes, create rollout waves**.
6. Click **+ Add waves**, provide the groups you want in wave 1, and click **Save**. Repeat these steps for waves 2 and 3.
7. Adjust the **Days between waves** slider to meet your needs.
8. Click **Save**.
9. Once your waves are configured, you can monitor the wave rollout from the [Monthly Enterprise Channel](https://config.office.com/officeSettings/MPmecChannel) page by clicking on **View waves overview** beneath the wave chart.

> [!IMPORTANT]
> Rollout waves can be used to help reduce network congestion. In addition, cloud update includes built-in update thresholds. These include the following:
> 
> - The **Current Channel** profile leverage the default rollout schedule defined by the Office CDN, which on average reaches full deployment within 5 days of patch Tuesday.
> - The **Monthly Enterprise Channel** profile has a separate threshold that prevents more than 30% of your eligible devices from updating on a daily basis. This same enforcement is applied when using custom rollout waves. 

### Update validation

Update validation is available for devices managed by the Monthly Enterprise Channel profile and using [custom rollout waves](#rollout-waves).

Update validation is a feature that enables you to validate new updates for the Monthly Enterprise Channel before organization-wide deployment. This feature automatically collects and consolidates health indicators such as app and add-in performance and reliability data and brings attention to any identified issues. Its automated nature reduces the need for manual administrative work and simplifies the update deployment process.

 For more information, watch [Introducing Update Validation in the Microsoft 365 Apps admin center](https://youtu.be/xZtXI-Ws-pE) or read the [full documentation](update-validation.md).

### Deadline

Deadline is available for all cloud update profiles. 

The update deadline is used to ensure updates are applied in a specified timeframe. Consider the following when configuring your update deadline:

- The deadline is uniquely calculated for each device once the first installation attempt fails. For example, the deadline is set to 3 days. A device comes online 2 days after patch Tuesday and receives the update. Outlook is open so the update fails to apply in the background due to a running app. The 3-day deadline is now applied.
- If the deadline passes, a prompt is shown to the user, offering the option to close their applications now or postpone the installation.
- Users can postpone the update installation for up to 48 hours before a final two-hour countdown is shown.
- If the countdown reaches zero, open files are saved, all required applications are closed, the update is applied, applications are re-opened, and previous files are re-opened. User downtime is less than five minutes.
- If the deadline is set to 0, the first prompt appears immediately if the apps are open, but the user will still have the option to postpone the update.
- When users choose to postpone, the update can still be applied under other conditions. For example, if the device reboots or if [Update Under Lock](https://techcommunity.microsoft.com/t5/microsoft-365-blog/update-under-lock-improved-update-experience-for-microsoft-365/ba-p/3618901) applies.

To configure the deadline, follow these steps:

1. Sign in to the [Microsoft 365 Apps admin center](https://config.office.com) with a privileged account.
2. Expand **Cloud Update** from the left navigation and select an update profile.
3. On the profile page, select the **Settings** tab.
4. From **Settings**, select **Deadline**.
5. Adjust the **Update deadline** slider to your preferred value and click **Save**.

## Compatibility with other management tools

Cloud update takes precedence over existing update management settings for Microsoft 365 Apps. For example, settings applied by Microsoft Configuration Manager or policies set through Microsoft Intune’s configuration profiles; these will remain unchanged by cloud update but will no longer be enforced. This applies to all devices managed by cloud update. 

> [!NOTE]
> Cloud update will not change the update settings of other products, such as Windows or Edge. It will also not prevent management solutions from reinstalling Microsoft 365 Apps. 

## Channel to profile mapping

With cloud update enabled, devices are automatically mapped to the corresponding profile based on their update channel. For example, all devices on Current Channel will map to the Current Channel profile. Once mapped to a profile, cloud update will deliver the appropriate policies to these devices.

Cloud update currently supports management for devices on Current Channel and Monthly Enterprise Channel. Devices on any other update channel *will not be managed by cloud update* until they are moved to a channel that cloud update supports.

## Troubleshooting
> [!IMPORTANT]
> If you are experiencing any issues enabling cloud update or managing the devices in your environment, be sure to review the [requirements for cloud update](#requirements) before proceeding.

### Devices are stuck in an onboarding state
With cloud update enabled, the service will use [channel to profile mapping](#channel-to-profile-mapping) to automatically identify and onboard devices to their corresponding profile. Devices on the Monthly Enterprise Channel will show a status of **Onboarding to Monthly Enterprise Channel** until a new update is available. These are the two scenarios where this will apply:

- The device was recently discovered by cloud update for the first time and already has the latest version of Microsoft 365 Apps installed for Monthly Enterprise Channel. In this scenario the device will show **Onboarding to Monthly Enterprise Channel** until a new update release is available, typically next patch Tuesday.

- The device was recently discovered by cloud update for the first time and has an outdated version of Microsoft 365 Apps installed for Monthly Enterprise Channel. You have custom rollout waves configured and the device is in a later wave. In this scenario the device will show **Onboarding to Monthly Enterprise Channel** until the assigned wave is active and the update is available.

### Devices are updating outside of their assigned wave

Updates applied outside of a custom rollout wave are due to external actions occurring on the device. Review the following scenarios and take any necessary actions:

- **Add-on app deployments**: Installing an add-on app, such as Project or Visio, can trigger an update check when the application is retrieved from the Office CDN. Consider updating your XML to included [Version="MatchInstalled"](../office-deployment-tool-configuration-options.md#version-attribute-part-of-add-element) to install the same version of Office, even if a newer version is available.

- **Onboarding devices**: Devices that are still in an **Onboarding to [channel-name]** state will be managed by your existing settings until cloud update takes control. During this time other management settings can enforce updates. Consider excluding devices from these other management tools or wait until the next patch Tuesday cycle for cloud update to engage.
  
### My Device-based group did not work with *[feature name]*

If you are using a group that contains device objects, the devices must be Microsoft Entra joined or hybrid joined. Microsoft Entra registered/Workplace joined will not be recognized by the service. As an alternative, consider adding the corresponding user object(s). For more information, refer to the [requirements for using Microsoft Entra groups](#requirements-for-using-microsoft-entra-groups).

## Report a problem

If you encounter a problem enabling or managing cloud update, first verify that you've reviewed the [requirements](#requirements) and completed the steps in the [troubleshooting](#troubleshooting) section.

If the problem persists after troubleshooting, open a support ticket with Microsoft. For a quick investigation, be sure to include the date and time when the issue was discovered, a detailed description of the problem, and if the issue is related to a device, collect the Device ID from your [device inventory](https://config.office.com/officeSettings/inventory/devices). You can find the Device ID by selecting the device name in inventory and reviewing the flyout.

## Send feedback

We value your feedback. To submit feature suggestions and report issues, you can use the Feedback button in the top-right corner of the Microsoft 365 Apps admin center.

![Screenshot of the feedback screen in the Microsoft 365 Apps admin center](https://github.com/MicrosoftDocs/OfficeDocs-DeployOffice-pr/assets/72577850/089c1145-3948-4cb7-a680-f965e0ae88d4)
