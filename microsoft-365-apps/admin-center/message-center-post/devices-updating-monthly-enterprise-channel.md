---
title: "Microsoft 365 Apps will be updated to Monthly Enterprise Channel on all your Office devices"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: conceptual
ms.service: o365-proplus-itpro
ms.collection: Tier1
ms.localizationpriority: medium
ROBOTS: NOINDEX, NOFOLLOW
recommendations: false
hideEdit: true
description: "Provides guidance only to customers who received a Message center post about their devices with Microsoft 365 Apps being updated to Monthly Enterprise Channel."
ms.date: 03/13/2024
---

# Microsoft 365 Apps will be updated to Monthly Enterprise Channel on all your Office devices

> [!IMPORTANT]
> The information in this article applies only to organizations that received Message center post MC362760 (in the [Microsoft 365 admin center](https://admin.cloud.microsoft/AdminPortal/Home#/MessageCenter)) on April 21, 2022 and again on May 5, 2022. If you didn't receive that post, this article doesn't apply to you and no action is required on your part.

Our records show that some devices in your organization with Microsoft 365 Apps are receiving feature updates only once every six months.

Customers on a monthly feature update cadence, such as those customers on Monthly Enterprise Channel, have reported higher satisfaction than those receiving semi-annual feature updates. In addition to receiving the latest features and fixes, having all devices on the same update frequency helps enable better collaboration experiences for users in your organization. Monthly Enterprise Channel also provides admins with predictability, since updates are released once a month, on the second Tuesday of the month.

> [!TIP]
> For information about cost savings and business benefits of using Monthly Enterprise Channel, [read this research report](https://cdn.techcommunity.microsoft.com/assets/Microsoft365/TotalEconomicImpactofMonthlyEnterpriseChannelForMicrosoft365Apps-Final-Aug-9-2021.pdf).

Therefore, to improve the experience for your users, we’ll automatically change *all* devices with Microsoft 365 Apps over to Monthly Enterprise Channel. *If you don’t want this change to take place,* [you can opt out](#how-to-opt-out-of-changing-devices-to-monthly-enterprise-channel) and keep devices on the channel of your choice.

> [!NOTE]
> The date this change begins for your organization is listed in the Message center post that you received and is shown in the notification that appears in the [Microsoft 365 Apps admin center](https://config.office.com).

## Which installations of Office are affected by this change?

*This change will apply to both existing and new installations of Microsoft 365 Apps.* Microsoft 365 Apps, which is included with your subscription plan, includes the Office apps that you're familiar with, such as Word, Excel, PowerPoint, and Outlook.

*This change affects all existing installations of Office in your organization that are on update channels other than Monthly Enterprise Channel.* For example, this change affects installations that are on Semi-Annual Enterprise Channel. If you don’t opt out before the date specified, we’ll automatically configure those existing installations to begin receiving feature updates from Monthly Enterprise Channel instead of from their existing update channel. Any new installations of Office will also receive feature updates from Monthly Enterprise Channel.

In addition, Office will be configured to get updates automatically from Microsoft directly from the internet, which is our recommendation. This should help reduce your administrative workload when it comes to keeping Office up to date each month. It should also help ensure that most of your devices are updated in a timely manner after an update is released, as long as the devices are connected to the internet regularly.

These changes aren’t based on how you install or manage Microsoft 365 Apps. For example, these changes will apply whether you use Microsoft Intune to install on your users’ devices or if your users install from the **My account** page in the portal. Or whether you use Group Policy to set the update channel or use Configuration Manager to provide updates.

> [!TIP]
> - To view more information about your devices, we recommend you sign into the [Microsoft 365 Apps admin center](https://config.office.com) and use the [Inventory](../../admin-center/inventory.md) feature.
> - If you want more control over managing updates to your devices on Monthly Enterprise Channel, we recommend that you enable [cloud update](../../admin-center/cloud-update.md) in the Microsoft 365 Apps admin center.

## What is Monthly Enterprise Channel?

On Monthly Enterprise Channel, new or updated features are released on the second Tuesday of every month. Additionally, monthly releases might also contain security updates and non-security updates, such as stability or performance improvements for Office.

These releases are cumulative. The most current release contains all the features, security updates, and non-security updates from the previous releases.

For more information, see the following resources:

- [Overview of update channels for Microsoft 365 Apps](../../updates/overview-update-channels.md)
- [Update history for Microsoft 365 Apps](/officeupdates/update-history-microsoft365-apps-by-date)

## How will users be affected by this change?

The change to Monthly Enterprise Channel will mostly happen in the background while your users are using their Office apps. The next time they close all their Office apps, the change to Monthly Enterprise Channel will be completed. If they keep their Office apps open all the time, after three days they’ll receive a message letting them know that they need to close Office to apply updates, which will then finish their change over to Monthly Enterprise Channel.

Keep in mind that changing to a different channel also changes what features are available to the user. Users changing to Monthly Enterprise Channel might receive features that they didn’t have previously. You might need to provide them with information about these features. For information about what features are available in each update channel, see [Release notes for Microsoft 365 Apps releases](/officeupdates/release-notes-microsoft365-apps#release-notes-for-microsoft-365-apps-releases).

## How to opt out of changing devices to Monthly Enterprise Channel

If you don’t want your Office installations to be switched to Monthly Enterprise Channel, then in the Microsoft 365 Apps admin center, choose **View details** on the notification, then choose **Keep my devices on current configuration**, as shown in the following screenshots.

:::image type="content" source="media/devices-updating-monthly-enterprise-channel/notification-monthly-enterprise-channel.png" alt-text="A screenshot of a notification that Office will be changed to get updates automatically every month along with a 'View details' link.":::

:::image type="content" source="media/devices-updating-monthly-enterprise-channel/flyout-monthly-enterprise-channel.png" alt-text="A screenshot of a flyout showing three benefits of having Office updated each month along with a 'Keep my devices on current configuration' button.":::

> [!NOTE]
> - The date shown in the screenshot is an example. The date that applies to your organization is listed in the Message center post that you received and is shown in the notification that appears in the Microsoft 365 Apps admin center.
> - After that date, the message and the **Keep my devices on current configuration** option will no longer appear.

After you choose **Keep my devices on current configuration**, you'll be prompted to provide feedback and you can leave your reasons for opting out. You can also provide your email address so that we can contact you to discuss your choice to opt out.