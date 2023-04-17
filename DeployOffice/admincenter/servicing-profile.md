---
title: "Overview of servicing profile in the Microsoft 365 Apps admin center"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: article
ms.service: o365-proplus-itpro
ms.localizationpriority: medium
ms.collection: Tier1
recommendations: false
description: "Provides Office admins information about the servicing profile in the Microsoft 365 Apps admin center"
ms.date: 04/17/2023
---

# Overview of servicing profile in the Microsoft 365 Apps admin center

Servicing profiles let you automatically deliver monthly Office updates for specific users or groups. You can apply a servicing profile to a set of devices in the Microsoft 365 Apps admin center. When you apply the profile, the following changes occur:

- The devices are moved to the Monthly Enterprise Channel
- Updates to the device come from the Office Content Delivery Network (CDN)
- The devices are managed by the servicing profile

Devices in the servicing profile receive updates for the Monthly Enterprise Channel beginning the second Tuesday of every month. Updates are delivered in waves to limit the impact on the network. You can  pause updates and investigate and resolve update issues. You can also set deadlines for updates to be installed and dates on which updates can’t be installed.

> [!TIP]
> You can also watch videos with an [introduction to Servicing profiles](https://youtu.be/i_eUkyFX30E) and [in-depth coverage of the service](https://youtu.be/YO6a3iNVXXI).

## Requirements for using a servicing profile
- Microsoft 365 Apps for enterprise or Microsoft 365 Apps for business, Version 2008 or later
- A version of Windows 11 or Windows 10 supported by Microsoft 365 Apps for enterprise or by Microsoft 365 Apps for business
- Microsoft 365 (or Office 365) for Business Standard, Business Premium, A3, A5, E3, or E5 subscription plan
- Your Microsoft 365 Apps admin center account must have either the global administrator, security administrator, or Office apps administrator role.
- To apply a servicing profile to a device, that device must be part of the inventory in the Microsoft 365 Apps admin center
- Client devices can reach the following endpoints: 
  - ```https://login.live.com```
  - ```https://*.config.office.com```
  - ```https://*.config.office.net```

> [!IMPORTANT]
> Servicing profiles aren't available to customers who have the following plans:
>- Office 365 operated by 21Vianet
>- Office 365 GCC
>- Office 365 GCC High and DoD

## Compatibility with other management tools

A servicing profile takes precedence over other management tools, such as Microsoft Intune or the update configuration set by the Office Deployment Tool. The servicing profile affects all devices that meet the above requirements regardless of existing management tools in your environment. If you’re using these management tools, you may want to disable them, but it isn't required.

## How to apply the servicing profile to a device

1. Go to the [Microsoft 365 Apps admin center](https://config.office.com), choose **Servicing** in the left-hand navigation, and then choose **Monthly Enterprise**. 
2. Complete the setup wizard to apply the servicing profile to devices that meet the defined criteria. You have two options.

    - The first (and recommended) option is to use **All Devices**, which will manage all eligible devices on your tenant. This choice moves the device from the channel it’s on, if that channel is selected in the device criteria, to Monthly Enterprise Channel. 
    - The second option is to use **Groups**, which allows you to specify an Azure Active Directory group to target the profile management. You can configure the servicing profile based on a device's servicing channel, available disk space, macro usage, and add-ins. To learn more about the requirements of and best practices around the **Groups** feature, refer to [How to set up the servicing profile with the “by Azure AD group” feature](../fieldnotes/adopt-servicing-profiles.md#how-to-set-up-the-servicing-profile-with-the-by-azure-ad-group-approach).

    > [!TIP]
    > You can see a demo of how to use Azure Active Directory group filtering [by watching this video](https://youtu.be/RrEBevNV7pQ).

> [!NOTE]
> - You can edit the selection criteria once the profile has been created by going to the **Settings** tab on the **Servicing profile** dashboard.

3. When you complete the wizard, the eligible devices have the servicing profile applied within 2 hours.

## Using the servicing profile

In the Microsoft 365 Apps admin center, you can find a summary of your devices under the Servicing profile section. This overview includes information about upcoming build rollouts, planned release waves, and any device failures or issues you might encounter. From there you can go to the **Devices**, **Issues**, and **Settings** tabs to get more information on devices managed by the servicing profile.

### Devices

Within the **Devices** tab, you can see the update status of these devices and view information on individual devices. You can select a device to view the same information you can view within inventory, such as details on the device's hardware, operating system, and Microsoft 365 Apps configuration.

#### Roll back to a previous version

If you're experiencing issues with the most current version of Monthly Enterprise Channel, you can roll back devices to the previous version. For example, if there's an issue in Excel that affects users in your Finance department.

To start, select the roll back action on the **Devices** tab. Then, select the build of the previous version you want to roll back to and which devices or Azure Active Directory groups to roll back. Those devices will roll back to the previous version the next time Office checks for updates and are connected to the internet. You can check for progress under the **Rolled back** filter on the **Devices** tab.

Devices that are rolled back will stay on that previous version until the next version of Monthly Enterprise Channel is released. When the new version of Monthly Enterprise Channel is released, devices that are rolled back will update automatically to that version. New versions of Monthly Enterprise Channel are released on the second Tuesday of each month. You can also cancel the rollback action if the underlying issue has been resolved prior to the next version being available.

> [!TIP]
> To see a demo of how to roll back, [watch this video](https://www.youtube.com/watch?v=wyy_ll3wdlM).

### Issues

Issues allows you to view errors relating to Office deployment, including the number of devices affected and potential remediation advice. You can view the most recent issue for each device, and once the issue is resolved for a device it's removed.

### Settings

The servicing profile provides more settings for your Microsoft 365 Apps. These settings include establishing an update deadline to make sure updates are installed once they're downloaded. Additionally, you can set update exclusion dates to stop devices from downloading updates during specific dates.

#### Create rollout waves

> [!TIP]
> You can also watch a [walkthrough and deep dive video](https://youtu.be/rDu8qVbE1DY) with additional details.

If you want certain groups of users to receive updates before other groups of users, you can configure rollout waves for your servicing profile. You can create up to three waves and assign Azure Active Directory (Azure AD) groups to each of the waves.

For example, you might want your IT admins and help desk staff to get the updates first, while users in the Finance department get the updates in a later wave.

An additional wave is created automatically. That wave includes the devices in your servicing profile that aren’t already included in the waves that you created. Devices in this wave will be the last devices to start getting updates, after all the other waves have started receiving updates.

You can also specify the number of days between waves, from one day to five days. For example, you might want the next wave to start three days after the previous wave started. The value you specify applies to all waves. You can't have a different number of days between each wave.

#### Set an update deadline

To make sure that your users apply updates to Microsoft 365 Apps, you can configure an update deadline. The deadline specifies how long an update can be available on a device before the updates must be applied. If the updates aren't applied by the deadline, Office automatically closes any open Office programs and applies the updates.

Users are given notifications leading up to the deadline when a deadline is set. For more information about user notifications, see [notifications your users see when you set an update deadline](../updates/end-user-update-notifications-microsoft-365-apps.md#notifications-your-users-see-when-you-set-an-update-deadline-for-microsoft-365-apps).

#### Set update exclusion dates

Update exclusions can be created to prevent devices downloading security and feature updates during specific dates. Update exclusions allow you to reduce change in your environment during busy periods, such as during tax season or at the end of the financial year. Manual actions in Action Center and end-user actions are unaffected by update exclusion dates.

> [!NOTE]
> Update exclusions start and end at 00:00 UTC on the specified dates, not local device time.

By default update exclusions affect all devices that are in scope of the servicing profile. You can also select to scope the exclusion window to Azure AD groups. Only devices or users specified in the Azure AD group will be excluded, and all other devices follow the regular update deployment rhythm. Check out this video for a quick overview of [Azure AD group scoping with update exclusion windows](https://youtu.be/WMVlfg_3wnw).

> [!NOTE]
> Update exclusions prevent devices from starting the update process, which includes downloading, extracting, and applying the update. If a given device has started the process before the exclusion window applies, it will continue with the update installation. If you want to prevent devices installing updates during the requested exclusion window, consider starting the exclusion sooner and enforcing installations with an update deadline.
