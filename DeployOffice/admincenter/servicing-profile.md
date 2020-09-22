---
title: "Servicing Profile"
ms.author: dhirenb
author: dhirendra-bhupati
manager: laurawi
audience: ITPro
ms.topic: article
ms.service: o365-proplus-itpro
localization_priority: None
ROBOTS: NOINDEX, NOFOLLOW
hideEdit: true
description: "Provides Office admins information about the Servicing Profile in config.office.com"
---

# Servicing Profile

> [!IMPORTANT]
> This is pre-release documentation for a preview program that isn’t available to everyone and is subject to change.

The Servicing Profile allows administrators to simplify their organizations monthly updates for Microsoft 365 Apps while providing additional insights and controls. Devices in the Servicing Profile receive updates for the Monthly Enterprise Channel every month beginning every second Tuesday. Updates are delivered in waves and the projected and updated devices are shown in the Servicing Profile so that you can plan for your network capacity accordingly. The Servicing Profile also provides detailed information on errors relating to Microsoft 365 Apps so that you can investigate issues with devices, use the detailed error messages to resolve these issues, or remediate these issues using various controls such as restoring to the previous build for affected devices.

## Getting started

The Servicing Profile getting started page provides information about the devices in Inventory including the number of devices meeting the following criteria:

* Devices with sufficient disk space (greater than 5 GB)
* The Monthly Enterprise Channel for Microsoft 365 Apps

Only devices which meet the criteria will be included in the Servicing Profile.

To include these devices in the Servicing Profile, click **Accept**.

## Using the Servicing Profile

You should now see an overview of the devices in the Servicing Profile, details on the next build rollout including projected waves, and information on any device failures and issues. From here you can click into **Devices**, **Actions**, **Issues**, and **Settings** to get more information on devices managed by the Servicing Profile.

## Devices

Within the devices tab, you can see the update status of these devices, view information on individual devices, and perform quick actions such as restore and snooze devices. You can click on the device to view the same information you can view within Inventory such as details on the device's hardware, operating system and Microsoft 365 Apps configuration.

## Actions

Actions allows you to view the actions you have taken, to easily keep track within the Servicing Profile.

## Issues

Issues allows you to view errors relating to Office deployment, including the number of devices affected and potential remediation advice. You can view the most recent issue for each device, and once the issue is resolved for a device it is removed.

## Settings

The Servicing Profile provides additional settings for your Microsoft 365 Apps, such as setting an update deadline to ensure updates are installed after they are downloaded, and setting update exclusion dates to prevent devices from downloading updates during specified dates.

## Update deadline

To make sure that your users apply updates to Microsoft 365 Apps, you can configure an update deadline. The deadline specifies how long an update can be available on a device before the updates must be applied. If the updates aren't applied by the deadline, Office automatically closes any open Office programs and applies the updates.

Users are given notifications leading up to the deadline when a deadline is set. For more information about user notifications, see [notifications your users see when you set an update deadline](../end-user-update-notifications-microsoft-365-apps.md#notifications-your-users-see-when-you-set-an-update-deadline-for-microsoft-365-apps).

# Update exclusion dates

Update exclusions can be created to prevent devices downloading security and feature updates during specific dates. Update exclusions allow you to reduce change in your environment during busy periods, such as during tax season or at the end of the financial year. Manual actions in Action Center and end-user actions are unaffected by update exclusion dates. Note that update exclusions start and end at 00:00 UTC on the specified dates, not local device time.

> [!NOTE]
> Update exclusions prevent devices downloading security and feature updates. If you also want to prevent devices installing updates, consider starting the exclusion sooner and enforcing installations with an [update deadline](update-deadline.md).
