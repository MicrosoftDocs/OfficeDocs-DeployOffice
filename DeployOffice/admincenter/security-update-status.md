---
title: "Overview of the security update status report in the Microsoft 365 Apps admin center"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: article
ms.service: o365-proplus-itpro
ms.localizationpriority: medium
ms.collection: Tier1
recommendations: false
description: "Guidance for Office admins on how to use the security update status feature in the Microsoft 365 Apps admin center."
ms.date: 03/01/2023
---

# Overview of the security update status report in the Microsoft 365 Apps admin center

The **Security Update Status** page in the [Microsoft 365 Apps admin center](https://config.office.com) gives you insights into which devices have installed the most recent security updates for Office. This information can help you keep your environment secure.

## Requirements for using security update status

To view security update status for your environment, the following requirements must be met:

- Microsoft 365 Apps for enterprise or Microsoft 365 Apps for business, Version 2008 or later
- A version of Windows 11 or Windows 10 that is supported by Microsoft 365 Apps for enterprise or by Microsoft 365 Apps for business
- Microsoft 365 (or Office 365) for Business Standard, Business Premium, A3, A5, E3, or E5 subscription plan
- Device must be part of [inventory](inventory.md) in the Microsoft 365 Apps admin center

> [!IMPORTANT]
> Security update status isn't available to customers who have the following plans:
>- Office 365 operated by 21Vianet
>- Office 365 GCC
>- Office 365 GCC High and DoD

## How to view security update status

To view the security update status for the devices in your inventory, perform the following steps:

1. Sign in to the [Microsoft 365 Apps admin center](https://config.office.com) with your admin account, and then go to **Health** > **Security Update Status** in the navigation pane.
2. If you haven't viewed security update status before, complete the setup wizard.
3. After you complete the wizard, insights about active devices will start to appear on the page within two hours. An active device is a device where a user has launched an Office app, such as Word or Excel. 


## Update status insight

The **Update status** insight on the **Security Update Status** page shows you what percentage of your devices have installed the most recent security update. The date of the most recent security update is listed at the top of the page for reference. For a list of security updates, see [Release notes for Microsoft Office security updates](/officeupdates/microsoft365-apps-security-updates).

Your devices in inventory are evaluated against the most recent security update, depending on the assigned update channel. Devices can be in one of the following three categories.

- **Up to date** - The device has installed the most recent security update.
- **Not up to date** - The device hasn't installed the most recent security update.
- **Unknown** - The security update status for the device couldn't be retrieved.

You can also drill down to view a list of all devices or a filtered view of the devices that aren't up to date.


## Goal insight

The **Goal** insight on the **Security Update Status** page can help you track your progress on getting devices up to date and secure with each security update. 

To set a goal, choose **Set goal**. You specify as your goal the percentage of devices you want to update within a given timeframe (in days).

Setting a goal doesn't create any policies or changes to your devices. The goal is used only for your personal reporting on the **Security Update Status** page.


## Update status by channel insight

The **Update status by channel** insight on the **Security Update Status** page shows you the update status of devices in your inventory based on their update channel. You can also see, for each update channel, whether you have met the goal you've set.

