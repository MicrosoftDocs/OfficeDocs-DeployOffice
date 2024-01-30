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
ms.date: 1/23/2024
---

# Overview of cloud update in the Microsoft 365 Apps admin center

Cloud update represents the evolution of servicing profiles, offering a comprehensive solution for managing Microsoft 365 Apps updates. Cloud update gives you enhanced controls and insights, streamlining the modernization of Microsoft 365 Apps in a secure manner and diminishing admin complexities. Cloud update addresses key challenges in update management. It serves organizations of all sizes. It tackles compatibility issues in larger companies and offers simple controls for smaller businesses. A pivotal feature of cloud update is its capability to facilitate customer access to Copilot. This functionality streamlines the process by enabling the transition of devices from non-Copilot channels to channels that are Copilot-compliant, while also offering update management support for these channels.

With cloud update, admins can oversee Microsoft 365 Apps updates for devices on both the Monthly Enterprise Channel and Current Channel.

## Channel to profile mapping

Before onboarding to cloud update, review the current state of your tenant and make informed decisions. For example, you can view devices that are already managed with Monthly Enterprise Channel profile and those devices that aren't yet onboarded.
The default onboarding experience maps devices to the cloud update profile based on their existing update channel. Devices on Current Channel and Monthly Enterprise Channel map to their corresponding cloud update profile.

## New features and benefits

Cloud update introduces a new set of powerful controls and proactive insights, along with a simple one-step onboarding process. It offers the flexibility to return to your previous management tools if cloud update doesn't work for your environment. Here’s a glimpse of the new features:

### Dashboard

After signing into Microsoft 365 Apps admin center, you can view a recommendation card displaying the update channel split of your tenant with the option to **Enable Cloud** if you're new to cloud update or **Finish Enabling Cloud** if you've been using the former servicing profiles, now named cloud update. Choosing either of the options enables update management support for Current Channel and Monthly Enterprise Channel (if not already enabled) in about 30 minutes. If the change isn't reflected, try refreshing the webpage. Devices are mapped to respective profiles based on their channel and receive updates based on profiles rules as configured by the admin.

For more information, see [Enabling the Current Channel Profile](https://youtu.be/lRegLZUjkUY?si=vdZD3X9hwYfXDPe4).

### Updates overview

The overview page provides update insights. It gives a clear view of device updates and the progress in each channel. It also details trends in Updates & Security, highlights issues and health signals, and shows update validation signals.

**Tenant settings**

In the overview page of cloud update, all the tenant settings apply to every active profile, including the Current Channel and Monthly Enterprise Channel.

**Exclude Groups**

If an admin adds a Microsoft Entra ID group to the excluded groups setting, the devices in this group are excluded from cloud update. Within 30 minutes, the inventory system updates the device schema to show which devices are't included in Current Channel or Monthly Enterprise Channel. This status appears in the 'cloud update status' column. After the information is reflected in inventory, admins can manage these devices by first setting **ignoreGPO = 0** for these devices before beginning to manage them using management tool of choice.

**Exclusion Window**

Update exclusions can be created to prevent devices downloading security and feature updates during specific dates for all devices on Monthly Enterprise Channel. Update exclusions allow you to reduce change in your environment during busy periods, such as during tax season or at the end of the financial year. Manual actions in action center and end-user actions are unaffected by update exclusion dates.

> [!NOTE]
> Update exclusions start and end at 00:00 UTC on the specified dates, not local device time. By default, update exclusions affect all devices that are in scope of cloud update. You can also select to scope the exclusion window to Azure AD groups. Only devices or users specified in the Microsoft Entra ID group will be excluded, and all other devices follow the regular update deployment rhythm. For more information, see [Azure AD group scoping with update exclusion windows](https://www.youtube.com/watch?v=WMVlfg_3wnw).

### Profiles

Delve deeper into individual profiles, allowing a more thorough examination of progress, deployment validation, and signals. Address concerns at the profile level by pausing, rolling back, or skipping updates, depending on the profile you're in. You can also configure Monthly Enterprise Channel profiles into waves as needed.

### Current Channel

**Overview**

The overview page has rollout information representing current updates. The update progress chart shows devices in Current Channel that are either updated to the latest available version or yet to begin the update process. Admins can view all devices that are part of Current Channel profiles by selecting **View all devices**. For more information, see [Cloud Updates - Overview of Current Channel Profile](https://www.youtube.com/watch?v=wwguIOw788I).

**Settings**

To make sure that your users apply updates to Microsoft 365 Apps in Current Channel, you can configure an update deadline. The update deadline specifies how long an update can be available on a device before the updates must be applied. If you don't apply the updates by the deadline, the system automatically closes all Microsoft 365 Apps and applies the updates. 

Users are given notifications leading up to the deadline when a deadline is set. For more information about user notifications, see [Notifications your users see when you set an update deadline](/deployoffice/updates/end-user-update-notifications-microsoft-365-apps#notifications-your-users-see-when-you-set-an-update-deadline-for-microsoft-365-apps).

### Monthly Enterprise Channel

**Overview**

The overview page provides information on the current and upcoming release dates for updates, showcasing the present rollout status either as active or paused. The update progress chart displays the update status for devices in Monthly Enterprise Channel. It shows which devices updated to the latest version, which devices failed to update, and which devices are yet to begin the update process. The admin can view all devices that are part of Monthly Enterprise Channel updates by selecting **View all devices**. If you have rollout waves configured, you can select **View Waves Overview** under the update progress chart instead. The update progress gives you a flyout summarizing the update status for individual waves. You can get device level details by choosing **View details on this wave**. If you have a long list of devices in a given wave and need more details per device, you can select **View Devices** on the flyout to get to a detailed device level schema for that wave.

From the overview page, you can choose **View all Potential Issues** or **view failed devices**. You can take channel actions such as rollback, pause, and manage rolled back devices. For more information, see [Introduction to Monthly Enterprise Channel Profile](https://www.youtube.com/watch?v=vUDGQ5I_5lo).

**Update validation**

Admins now have the capability to validate updates in a live environment through update validation. When an admin configures custom waves for their Microsoft 365 tenant, this feature activates automatically. The key advantage is to gain a comprehensive report on app compatibility with all your add-ins on devices. It also highlights any new regressions that might arise due to an update in the initial wave within a span of seven days. Based on a build-over-build comparison, this report is designed to give you confidence in future rollouts to subsequent waves. To get the most out of update validation, you should move your devices to Monthly Enterprise Channel to tackle potential app compatibility or add-in issues related to updates. For more information, watch [Introducing Update Validation in the Microsoft 365 Apps admin center](https://youtu.be/xZtXI-Ws-pE) or read the [full documentation](update-validation.md).

**Settings**

With Monthly Enterprise Channel profile, you gain enhanced settings for your Microsoft 365 Apps. Among these settings, you can set an update deadline, ensuring that updates are promptly installed after being downloaded. Additionally, you can create custom waves, allowing you to determine the most suitable update pace for your tenant.

**Create rollout waves**

If you want certain groups of users to receive updates before other groups of users, you can configure rollout waves for cloud update. You can create up to three waves and assign Microsoft Entra groups to each of the waves. For example, you might want your admins and help desk staff to get the updates first, while users in the finance department get the updates in a later wave. Another wave is created automatically. That wave includes the devices that aren’t already included in the waves that you created. Devices in this wave will be the last devices to start getting updates, after all the other waves start receiving updates. You can also specify the number of days between waves, from one day to five days. For example, you might want the next wave to start three days after the previous wave started. The value you specify applies to all waves except Wave one, which runs for seven days for Deployment Validation. You can't have a different number of days between each wave from waves two through four. For more information, see [Deep dive into wave customization](https://youtu.be/rDu8qVbE1DY).

**Set an update deadline**

To make sure that your users apply updates to Microsoft 365 Apps on Monthly Enterprise Channel, you can configure an update deadline. The deadline specifies how long an update can be available on a device before the updates must be applied. If you don't apply the updates by the deadline, the system automatically closes all Microsoft 365 Apps and applies the updates.

Users are given notifications leading up to the deadline when a deadline is set. For more information about user notifications, see [Notifications your users see when you set an update deadline](/deployoffice/updates/end-user-update-notifications-microsoft-365-apps#notifications-your-users-see-when-you-set-an-update-deadline-for-microsoft-365-apps).

## Inventory

In [Inventory](https://config.office.com/officeSettings/inventory), admins have the capability to modify the update channel for their devices or Microsoft Entra groups. To modify the update channel, first select **Show all devices** under data insights. Next, choose **Switch Device Update Channel** located above the device schema. Within the flyout, admins can specify the desired update channel and select the pertinent devices or Microsoft Entra ID groups. Once these changes are made, the devices are displayed in the chosen channels in inventory within a day. These devices start receiving updates directly from the internet. If cloud update isn't activated, the action of changing the channel turns on cloud update, activating support for both Current Channel and Monthly Enterprise Channel. For more information, see [How to trigger an update channel change for devices in the Microsoft 365 Apps admin center](https://www.youtube.com/watch?v=tFmktdQsKgY).

## Recommendations

For the best experience with Microsoft 365 updates, ensuring low cost, minimal effort, and high end-user productivity with the most comprehensive support, you should:

- Enable cloud update to activate your Current Channel profile and Monthly Enterprise Channel profile.
- Use Channel change capability to move all of your devices to Current Channel or Monthly Enterprise Channel. These update channels are recommended if your organization uses Copilot.
- Don't use group inclusion.
- To prevent certain devices from being included in cloud update, place them in a Microsoft Entra ID group. Then, use the **exclude groups** feature to omit them from cloud update.
- Using the switch channel feature in inventory allows you to conveniently change the update channel on devices.
- Deactivating cloud update is currently in development and is coming soon. When released, you're able to navigate to the settings page of individual channel profiles and select 'Cloud Update Review' to deactivate cloud update.

## FAQ

**When will the capabilities for channel change and cloud update be available in my tenant?**

In mid-October and continuing through mid-November of 2023, these changes roll out. If you don't see the capabilities after this timeframe, reach out to through the OCV feedback option in the Microsoft 365 Apps admin center.

**When and what settings can I configure for cloud update?**

After selecting **Enable Cloud**, you can configure various settings at tenant level and individual channel level, depending on the channel you are in. For instance:
- Exclude groups and exclusion windows are tenant level settings, which are configured from the overview page.
- In Current Channel cloud update, you can configure update deadline and pause profile if necessary.
- In Monthly Enterprise Channel cloud update, you can configure rollout waves and update deadline. You can also pause, rollback and cancel rollback as required.

**Will devices change their assigned Microsoft 365 Apps update channels?**

No, your update channel configuration isn't affected.

**What are the goals of this change?**

The primary goal is to enable devices to utilize Copilot. This change provides administrators with a unified management view for all monthly update channels. Additionally, it aims to reduce the administrative workload and enhance visibility and control over build deployments.

**When should I enable cloud update?**

If you want to track update progress across Monthly Enterprise Channel and Current Channel devices of your environment in one aggregated view and benefit from the upcoming new controls, select **Enable Cloud** or **Finish Enabling Cloud** (for existing Monthly Enterprise Channel Profile users).

**Will enabling cloud update impact any of my other settings and controls?**

None of your configurations or controls in existing profiles are affected by enabling cloud update.

**What are the expected service times for various admin actions?**

The following list shows the service times for each of the described admin actions during which the admin shouldn't retry these actions. If the desired action doesn't complete within the stipulated time, the admin should submit an OCV through the portal.

- Switch device update channel: Within 24 hours, Device/(s) reflect in targeted channels in Inventory and continue to receive updates. If cloud update isn't already enabled, the Channel Change action automatically enables cloud update for the tenant.

- Enable cloud: Cloud update for Current Channel and Monthly Enterprise Channel activates with enable cloud. Devices are eligible for the profile based on their channel and updates are received based on profile rules as configured by the admin. Once enabled, Current Channel and Monthly Enterprise Channel are listed in left navigation of Microsoft 365 Apps admin center within 30 minutes. If the channel isn't listed after 30 minutes, refresh your page.

- Exclude Groups: After a device is excluded from cloud update, it will be labeled as *Excluded from ChannelName* in the cloud update status section in inventory. This change will occur within 30 minutes, after which admins can manage these devices.

**How can I turn off update validation?**

Update validation is an extension of rollout waves. If you want to turn it off, you need to turn off rollout waves.

**Can I set up rollout waves for Current Channel devices?**

The Current Channel is designed for rapid progression. Without a fixed update release schedule and with frequent updates throughout the month, it advances quickly. As a result, features such as rollout waves and rollback aren't available in Current Channel.
