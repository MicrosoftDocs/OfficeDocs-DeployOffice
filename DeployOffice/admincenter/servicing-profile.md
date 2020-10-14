---
title: "Servicing profile"
ms.author: dhirenb
author: dhirendra-bhupati
manager: laurawi
audience: ITPro
ms.topic: article
ms.service: o365-proplus-itpro
localization_priority: Normal
hideEdit: true
description: "Provides Office admins information about the servicing profile in the Microsoft 365 Apps admin center"
---

# Overview of servicing profile in the Microsoft 365 Apps admin center

> [!IMPORTANT]
> This is pre-release documentation for a preview program that isn’t available to everyone and is subject to change.

Servicing profiles let you automatically deliver monthly Office updates for specific users or groups. You can apply a servicing profile to a set of devices in the Microsoft 365 Apps admin center. When you apply the profile, the following changes occur:

- The devices are moved to the Monthly Enterprise Channel
- Updates to the device come from the Office Content Delivery Network (CDN)
- The devices are managed by the servicing profile

Devices in the servicing profile receive updates for the Monthly Enterprise Channel beginning the second Tuesday of every month. Updates are delivered in waves to limit the impact on the network. You can  pause updates and investigate and resolve update issues. You can also set deadlines for updates to be installed and dates on which updates cannot be installed.

Requirements:
- Microsoft 365 Apps for enterprise, Version 2007 or later
- A version of Windows 10 supported by Microsoft 365 Apps for enterprise
- Microsoft 365 (or Office 365) A3, A5, E3, or E5 subscription plan
- To apply a servicing profile to a device, that device must be part of the inventory in the Microsoft 365 Apps admin center
- Client devices can reach the following endpoints: ```https://login.live.com```, ```https://*.config.office.com```

## How to apply the servicing profile to a device

1. Go to the [Microsoft 365 Apps admin center](https://config.office.com), click **Servicing** in the left-hand navigation, and then click **Servicing profile**. For information on using the admin center and enabling preview features, see [Overview of the Microsoft 365 Apps admin center](overview.md).
2. Complete the setup wizard to apply the servicing profile to devices that meet the defined criteria. You can apply the servicing profile based on a device's servicing channel, available disk space, macro usage, add-ins, and name.
3. When you complete the wizard, the listed devices will have the servicing profile applied within 2 hours.

## Using the Servicing Profile

You can see an overview of the devices in the Servicing profile section of the Microsoft 365 Apps admin center, including , details on the next build rollout, projected waves, and information on any device failures and issues. From there  you can click into **Devices**, **Actions**, **Issues**, and **Settings** to get more information on devices managed by the servicing profile.

### Devices

Within the devices tab, you can see the update status of these devices, view information on individual devices, and  pause devices. You can click on the device to view the same information you can view within inventory such as details on the device's hardware, operating system and Microsoft 365 Apps configuration.

### Actions

Actions allows you to view the actions you have taken, to easily keep track within the servicing profile.

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
> Update exclusions prevent devices downloading security and feature updates. If you also want to prevent devices installing updates, consider starting the exclusion sooner and enforcing installations with an [update deadline](update-deadline.md).
