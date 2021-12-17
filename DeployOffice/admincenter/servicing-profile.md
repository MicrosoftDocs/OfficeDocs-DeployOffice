---
title: "Servicing profile"
ms.author: dhirenb
author: dhirendra-bhupati
manager: dougeby
audience: ITPro
ms.topic: article
ms.service: o365-proplus-itpro
ms.localizationpriority: medium
recommendations: false
description: "Provides Office admins information about the servicing profile in the Microsoft 365 Apps admin center"
---

# Overview of servicing profile in the Microsoft 365 Apps admin center

Servicing profiles let you automatically deliver monthly Office updates for specific users or groups. You can apply a servicing profile to a set of devices in the Microsoft 365 Apps admin center. When you apply the profile, the following changes occur:

- The devices are moved to the Monthly Enterprise Channel
- Updates to the device come from the Office Content Delivery Network (CDN)
- The devices are managed by the servicing profile

Devices in the servicing profile receive updates for the Monthly Enterprise Channel beginning the second Tuesday of every month. Updates are delivered in waves to limit the impact on the network. You can  pause updates and investigate and resolve update issues. You can also set deadlines for updates to be installed and dates on which updates cannot be installed.

## Requirements for using a servicing profile
- Microsoft 365 Apps for enterprise or Microsoft 365 Apps for business, Version 2008 or later
- A version of Windows 11 or Windows 10 that is supported by Microsoft 365 Apps for enterprise or by Microsoft 365 Apps for business
- Microsoft 365 (or Office 365) for Business Standard, Business Premium, A3, A5, E3, or E5 subscription plan
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

A servicing profile takes precedence over other management tools, such as Microsoft Endpoint Manager or the Office Deployment Tool. This means that the servicing profile will affect all devices that meet the above requirements regardless of existing management tools in your environment. If you’re using these management tools, you may want to disable them but it isn't required.

## How to apply the servicing profile to a device

1. Go to the [Microsoft 365 Apps admin center](https://config.office.com), choose **Servicing** in the left-hand navigation, and then choose **Monthly Enterprise**. 
2. Complete the setup wizard to apply the servicing profile to devices that meet the defined criteria. You have two options.

    - The first (and recommended) option will be to use **All Devices**, which will manage all eligible devices on your tenant. This choice will move the device from the channel it’s on, if that channel is selected in the device criteria, to Monthly Enterprise Channel. 
    - The second option is to use **Groups (Preview)**, which allows you to specify an Azure Active Directory group to target the profile management. You can configure the servicing profile based on a device's servicing channel, available disk space, macro usage, and add-ins.

> [!NOTE]
> - You can edit the selection criteria once the profile has been created by going to the **Settings** tab on the **Servicing profile** dashboard.
> - Azure Active Directory registered devices are not supported at this time.

3. When you complete the wizard, the eligible devices will have the servicing profile applied within 2 hours.

## Using the servicing profile

You can see an overview of the devices in the Servicing profile section of the Microsoft 365 Apps admin center, including details on the next build rollout, projected waves, and information on any device failures and issues. From there you can go to the **Devices**, **Issues**, and **Settings** tabs to get more information on devices managed by the servicing profile.

### Devices

Within the **Devices** tab, you can see the update status of these devices and view information on individual devices. You can select a device to view the same information you can view within inventory, such as details on the device's hardware, operating system and Microsoft 365 Apps configuration.

### Issues

Issues allows you to view errors relating to Office deployment, including the number of devices affected and potential remediation advice. You can view the most recent issue for each device, and once the issue is resolved for a device it is removed.

### Settings

The servicing profile provides additional settings for your Microsoft 365 Apps, such as setting an update deadline to ensure updates are installed after they are downloaded, and setting update exclusion dates to prevent devices from downloading updates during specified dates.

### Set an update deadline

To make sure that your users apply updates to Microsoft 365 Apps, you can configure an update deadline. The deadline specifies how long an update can be available on a device before the updates must be applied. If the updates aren't applied by the deadline, Office automatically closes any open Office programs and applies the updates.

Users are given notifications leading up to the deadline when a deadline is set. For more information about user notifications, see [notifications your users see when you set an update deadline](../end-user-update-notifications-microsoft-365-apps.md#notifications-your-users-see-when-you-set-an-update-deadline-for-microsoft-365-apps).

### Set update exclusion dates

Update exclusions can be created to prevent devices downloading security and feature updates during specific dates. Update exclusions allow you to reduce change in your environment during busy periods, such as during tax season or at the end of the financial year. Manual actions in Action Center and end-user actions are unaffected by update exclusion dates. Note that update exclusions start and end at 00:00 UTC on the specified dates, not local device time.

> [!NOTE]
> Update exclusions prevent devices downloading security and feature updates. If you also want to prevent devices installing updates, consider starting the exclusion sooner and enforcing installations with an update deadline.
