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
ms.date: 10/13/2023
---

# Overview of cloud update in the Microsoft 365 Apps admin center

Cloud update represents the evolution of servicing profiles, offering a comprehensive solution for managing Microsoft 365 Apps updates. Cloud update gives you enhanced controls and insights, streamlining the modernization of Microsoft 365 Apps in a secure manner and diminishing admin complexities. Cloud update addresses key challenges in update management. It serves organizations of all sizes. It tackles compatibility issues in larger companies and offers simple controls for smaller businesses. A pivotal feature of cloud update is its capability to facilitate customer access to Copilot. It achieves this by enabling the transition of devices from non-Copilot channels to channels that are Copilot-compliant, while also offering update management support for these channels.

With cloud update, admins can oversee Microsoft 365 Apps updates for devices on both the Monthly Enterprise Channel and Current Channel.

## Channel to profile mapping

Before onboarding to cloud update, review the current state of your tenant and make informed decisions. For example, you can view devices that are already managed with Monthly Enterprise Channel profile and those devices that haven't onboarded yet.
The default onboarding experience maps devices to the cloud update profile based on their existing update channel. Devices on Current Channel and Monthly Enterprise Channel map to their corresponding cloud update profile.

## New features and benefits

Cloud update introduces a new set of powerful controls and proactive insights, along with a simple one-step onboarding process. It offers the flexibility to return to your previous management tools if cloud update doesn't work for your environment. Here’s a glimpse at the new features:

### Dashboard

After signing into Microsoft 365 Apps admin center, you can view a recommendation card displaying the update channel split of your tenant with the option to **Enable Cloud** if you're new to cloud update or **Finish Enabling Cloud** if you have been using the former servicing profiles, now named as cloud update. Choosing this enables update management support for Current Channel and Monthly Enterprise Channel (if not already enabled) in about 30 minutes. If the change isn't reflected, it's suggested to refresh the webpage. Devices are mapped to respective profiles based on their channel and will receive updates based on Profiles rules as configured by the admin.

For more information, see [Enabling the Current Channel Profile](https://youtu.be/lRegLZUjkUY?si=vdZD3X9hwYfXDPe4)

### Updates overview

#### Overview

This page shows update insights. It gives a clear view of device updates and the progress in each channel. It also details trends in Updates & Security, highlights issues and health signals, and shows Deployment Validation signals.

#### Tenant settings

In the Overview Page of cloud update, all the tenant settings, such as Exclude Groups and Exclusion Window, apply to every active profile, including the Current Channel and Monthly Enterprise Channel.

##### Exclude Groups

If an admin adds a Microsoft Entra Group to Exclude Groups setting, the devices in this group will be excluded from cloud update. The devices are marked under the Cloud Update Status column as *Excluded from Current Channel or Monthly Enterprise Channel* in the Inventory (Device Schema) within 30 mins. After this information is reflected in Inventory, Admins can manage these devices by first setting **ignoreGPO = 0** for these devices before beginning to manage them using management tool of choice.

##### Exclusion Window

Update exclusions can be created to prevent devices downloading security and feature updates during specific dates for all devices on Monthly Enterprise Channel and Current Channels. Update exclusions allow you to reduce change in your environment during busy periods, such as during tax season or at the end of the financial year. Manual actions in Action Center and end-user actions are unaffected by update exclusion dates.

**Note**
> Update exclusions start and end at 00:00 UTC on the specified dates, not local device time.
> By default update exclusions affect all devices that are in scope of cloud update. You can also select to scope the exclusion window to Azure AD groups. Only devices or users specified in the Azure AD group will be excluded, and all other devices follow the regular update deployment rhythm. For more information, see [Azure AD group scoping with update exclusion windows](https://www.youtube.com/watch?v=WMVlfg_3wnw).

### Profiles

Delve deeper into individual profiles, allowing a more thorough examination of progress, deployment validation, and signals. Address concerns at the profile level by pausing, rolling back, or skipping updates, depending on the profile you're in. You can also configure Monthly Enterprise Channel profiles into waves as needed.

#### Current Channel

##### Overview

The Overview Page will have rollout information representing current and next release dates for updates. Update Progress chart displays devices in the current channel that have been updated to the latest version available and haven't yet started the update. Admin can view all devices that are part of Current Channel profiles by selecting *View all devices*. For more information, see [Cloud Updates - Overview of Current Channel Profile](https://www.youtube.com/watch?v=wwguIOw788I)

##### Settings

To make sure that your users apply updates to Microsoft 365 Apps in Current Channel, you can configure an update deadline. The deadline specifies how long an update can be available on a device before the updates must be applied. If the updates aren't applied by the deadline, all Microsoft 365 apps are automatically closed and the updates are applied. 

Users are given notifications leading up to the deadline when a deadline is set. For more information about user notifications, see [Notifications your users see when you set an update deadline](../updates/end-user-update-notifications-microsoft-365-apps#notifications-your-users-see-when-you-set-an-update-deadline-for-microsoft-365-apps).

#### Monthly Enterprise Channel

##### Overview

The Overview Page provides information on the current and upcoming release dates for updates, showcasing the present rollout status, either Active or Paused. The Update Progress chart displays devices in the Monthly Enterprise Channel that have been updated to the latest version available, those which failed to update, and those that haven't started the update. The admin can view all devices that are part of Monthly Enterprise Channel updates by selecting View all devices. If you have rollout waves configured, you can select the View Waves Overview button under the Update Progress chart instead. This gives you a flyout summarizing the update status for individual waves. You can get device level details by choosing the View detail on this wave link under each wave. If you have a long list of devices in a given wave and need more details per device, you can select the View Devices button on the flyout to get to a detailed device level schema for that wave.

From the overview page, you can choose *View all Potential Issues* or *view failed devices*. You can take Channel Actions like rollback, pause, and manage rolled back devices. For more information, see [Introduction to Monthly Enterprise Channel Profile](https://www.youtube.com/watch?v=vUDGQ5I_5lo)

##### Deployment Validation

Admins now have the capability to validate updates in a live environment through deployment validation. When an admin configures custom waves for their Microsoft 365 tenant, this feature activates automatically. The key advantage of this is to gain a comprehensive report on app compatibility with all your add-ins on devices. It also highlights any new regressions that might arise due to an update in the initial wave within a span of seven days. Based on a build-over-build comparison, this report is designed to give you confidence in future rollouts to subsequent waves. It's recommended to move your devices to Monthly Enterprise Channel to tackle potential app compatibility or add-in issues related to updates. For more information, see [Introducing Deployment Validation in the Microsoft 365 Apps admin center](https://youtu.be/qTzoyXU8Uw8)

##### Settings

With Monthly Enterprise Channel profile, you gain enhanced settings for your Microsoft 365 Apps. Among these settings, you can set an update deadline, ensuring that updates are promptly installed after being downloaded. Additionally, you can create custom waves, allowing you to determine the most suitable update pace for your tenant.

###### Create rollout waves

**Tip**
> You can also watch this [walkthrough and deep dive video](https://youtu.be/rDu8qVbE1DY) with additional details.

If you want certain groups of users to receive updates before other groups of users, you can configure rollout waves for cloud update. You can create up to three waves and assign Microsoft Entra groups to each of the waves. For example, you might want your admins and help desk staff to get the updates first, while users in the finance department get the updates in a later wave. Another wave is created automatically. That wave includes the devices that aren’t already included in the waves that you created. Devices in this wave will be the last devices to start getting updates, after all the other waves have started receiving updates. You can also specify the number of days between waves, from one day to five days. For example, you might want the next wave to start three days after the previous wave started. The value you specify applies to all waves except Wave one, which will always run for seven days for Deployment Validation. You can't have a different number of days between each wave from waves two to four.

###### Set an update deadline

To make sure that your users apply updates to Microsoft 365 Apps on Monthly Enterprise Channel, you can configure an update deadline. The deadline specifies how long an update can be available on a device before the updates must be applied. If the updates aren't applied by the deadline, all Microsoft 365 apps are automatically closed and the updates are applied.

Users are given notifications leading up to the deadline when a deadline is set. For more information about user notifications, see [Notifications your users see when you set an update deadline](../updates/end-user-update-notifications-microsoft-365-apps#notifications-your-users-see-when-you-set-an-update-deadline-for-microsoft-365-apps).

## Inventory

In [Inventory](https://config.office.com/officeSettings/inventory), admins have the capability to modify the update channel for their devices or Microsoft Entra groups. To do this, first select Show all devices under Data Insights. Next, choose the Switch Device Update Channel link located above the Device Schema. Within the flyout, admins can specify the desired update channel and select the pertinent devices or Microsoft Entra groups. After making these changes, the devices will display in the chosen channels in Inventory within a day. These devices will then start receiving updates directly from the internet. If cloud updates haven't been activated, the action of changing the channel will also turn on cloud update. This means both the Current Channel and Monthly Enterprise Channel update support will be activated. For more information, see [How to trigger an update channel change for devices in the Microsoft 365 Apps admin center](https://www.youtube.com/watch?v=tFmktdQsKgY)

## Microsoft Recommendations

For the best-in-class, low cost, low effort, high end-user productivity and most supported management experience of Microsoft 365 Updates, we highly recommend our customers to:

- Enable cloud update to activate your Current Channel and Monthly Enterprise Channel profiles
- Use Channel change capability to move all of your devices to Current Channel or Monthly Enterprise Channel. This is especially recommended if your organization is using Copilot.
- Don't use Group Inclusion.
- To prevent certain devices from being included in cloud update, place them in a Microsoft Entra Group. Then, use the Exclude Groups feature to omit them from cloud update.
- Using the Switch Channel feature in Inventory allows you to conveniently change the update channel on devices.
- To deactivate cloud update, navigate to the settings page of individual channel profiles and find the "Cloud Update review" section to make the change.

## FAQs

#### I don't see the capabilities for Channel Change and Enabling Cloud in my tenant.

Starting in mid-October and continuing through mid-November of 2023, these changes will roll out. During this time, your tenant will receive these enhancements. If you utilize Group Inclusion features to incorporate only a subset of your devices for cloud update on a monthly basis, these features will be accessible to you after November 2023. For all other organizations, expect this to be available between October 2023 and November 2023.

#### Why is Group Inclusion removed from cloud update?

Group Inclusion was introduced as a temporary feature to help customers try out servicing profile. However, our usage data revealed that some customers only onboarded a fraction of their devices to servicing profiles but didn't fully adopt it. This partial integration resulted in customers juggling multiple management tools, preventing them from experiencing the full advantages of servicing profile and monthly updates. These advantages included:

- Significant reduction in admin burden, and update management time
- Elimination of security vulnerabilities
- Reduction in helpdesk calls
- Reduction in reactive effort
- Faster issue resolution
- Higher end user productivity.

Our data shows that collaboration features, Copilot, and many other latest capabilities work better when an entire organization is managed via cloud update and all devices are on Monthly Enterprise Channel or Current Channel. This significantly boosts the end user productivity and app experience and enables a high-fidelity deployment validation.

To prevent customers from testing the cloud update with only a subset of their devices, while still offering the opportunity to evaluate it, we've introduced the Deactivation feature. This requires customers to integrate all their devices with the cloud update. If they find the experience unsatisfactory, they can conveniently revert to their traditional management system. As outlined in the recommendations, the capabilities previously achieved through Group-based inclusions can now be realized with the cloud update.

#### How can I access cloud update earlier while using Group Inclusion?

To be eligible for cloud update features, avoid using Group Inclusion. Instead, fully embrace cloud update by moving all your devices into profiles. Doing so ensures your tenant qualifies for cloud update more promptly.

#### Will devices change their assigned Microsoft 365 Apps update channels?

No, this won't affect your update channel configuration.

#### What are the goals of this change?

The main goals are:

- To enable devices for use with Copilot.
- To offer admins a unified management interface for all their monthly update channels.
- To diminish admin overhead.
- To enhance visibility and control over build deployments.

#### When should I Enable Cloud?

To monitor update progression across both Monthly Enterprise Channel and Current Channel devices in a unified view, and to gain access to upcoming controls like Pause updates and Update Deadlines for Current Channel, you should select Enable Cloud or Finish Enabling Cloud (for existing Microsoft 365 Enterprise Channel Profile users).

#### Will enabling cloud update affect any of my other settings or controls?

It will not affect any of your configurations or controls in existing profiles.