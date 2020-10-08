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

You can use servicing profile in the Microsoft 365 Apps admin center to automate Office updates for your devices. When you apply the servicing profile to a device, the following changes occur:

- The device is moved to the Monthly Enteprise Channel
- Updates to the device come from the Office Content Delivery Network (CDN)

 
Here's what happens when you move selected devices to the Monthly Enterprise Channel and streamline the management of those devices. Here's When you apply the servicing profile to a device a device to the servicing profile,  , you can automate updates for Microsoft 365 Apps by moving your streamline your  select which devices to move to the Monthly add devices to a servicing profile to moveYou can use servicing profile to move You can apply a servicing profile to an app The servicing profile automates the monthly updates for Office apps while providing you with control.   Apps will be updated from the Office CDN and be placed on the Monthly Enterprise Channel. The setup wizard will walk you through the process of selecting devices that you would like to add to the profile along with other settings like update deadline and update exclusion dates
The Servicing Profile getting started page provides information about the devices in Inventory including the number of devices meeting the following criteria:
•	Choose devices from different Servicing Channels to add them to profiles (once added, the devices will be placed on Monthly Enterprise Channel)
•	Choose devices with sufficient disk space (greater than 5 GB)
•	Choose devices with either Macros usage or not
•	Choose devices with Add-ins installed or not
•	Choose devices matching Device Name search criteria
Only devices which meet all of the selection criteria will be included in the Servicing Profile.



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

## Set an update deadline

To make sure that your users apply updates to Microsoft 365 Apps, you can configure an update deadline. The deadline specifies how long an update can be available on a device before the updates must be applied. If the updates aren't applied by the deadline, Office automatically closes any open Office programs and applies the updates.

Users are given notifications leading up to the deadline when a deadline is set. For more information about user notifications, see [notifications your users see when you set an update deadline](../end-user-update-notifications-microsoft-365-apps.md#notifications-your-users-see-when-you-set-an-update-deadline-for-microsoft-365-apps).

## Set update exclusion dates

Update exclusions can be created to prevent devices downloading security and feature updates during specific dates. Update exclusions allow you to reduce change in your environment during busy periods, such as during tax season or at the end of the financial year. Manual actions in Action Center and end-user actions are unaffected by update exclusion dates. Note that update exclusions start and end at 00:00 UTC on the specified dates, not local device time.

> [!NOTE]
> Update exclusions prevent devices downloading security and feature updates. If you also want to prevent devices installing updates, consider starting the exclusion sooner and enforcing installations with an [update deadline](update-deadline.md).
