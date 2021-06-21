---
title: "Overview of the security update status report in the Microsoft 365 Apps admin center"
ms.author: darrend
author: darrendmsft
manager: laurawi
audience: ITPro
ms.topic: article
ms.service: o365-proplus-itpro
localization_priority: Normal
recommendations: false
description: "Guidance for Office admins on how to use the security update status feature in the Microsoft 365 Apps admin center."
---

# Overview of the security update status report in the Microsoft 365 Apps admin center

The security update status page in the [Microsoft 365 Apps admin center](https://config.office.com) gives you insights into which devices have installed the latest security updates for Office. This information can help you keep your environment secure.

## Requirements for using security update status
- Microsoft 365 Apps for enterprise or Microsoft 365 Apps for business, Version 2008 or later
- A version of Windows 10 supported by Microsoft 365 Apps for enterprise or Microsoft 365 Apps for business
- Microsoft 365 (or Office 365) for Business Standard, Business Premium, A3, A5, E3, or E5 subscription plan
- Device must be part of [inventory](inventory.md) in the Microsoft 365 Apps admin center

## How to view security update status

To view the security update status for the devices in your inventory, perform the following steps:

1. Sign in to the [Microsoft 365 Apps admin center](https://config.office.com), and then go to **Health** > **Security Update Status** in the navigation pane.
2. If you haven't viewed security update status before, complete the setup wizard.
3. After you complete the wizard, insights about active devices will start to appear on the page within two hours. An active device is a device where a user has launched an Office app, such as Word or Excel. 


## Update status insight

The **Update status** insight on the **Security Update Status** page shows you what percentage of your devices have the most recent security update. The date of the most recent security update is listed at the top of the page for reference. For a list of security updates, see [Release notes for Microsoft Office security updates](/officeupdates/microsoft365-apps-security-updates).

Your devices in inventory are evaluated against the latest release update date (depending on the assigned update channel). Devices can be in one of the following three categories.

- **Up to date** - The device has installed the most recent security update.
- **Not up to date** - The device hasn't installed the most recent security update.
- **Unknown** - The security update status for the device couldn't be retrieved.

You can also drill down into all devices or a filtered view of the devices that aren't up to date.


## Goal insight

The **Goal** insight on the **Security Update Status** page can help you track your progress on getting devices up to date and secure with each security update. 

To set a goal, choose **Set goal**. You can specify the percentage of devices you want to update within a given timeframe, in days, for meeting that goal.

Setting a goal doesn't create any policies or changes to your devices. The goal is used only for your personal reporting on the **Security Update Status** page.


## Update status by channel insight

The **Update status by channel** insight on the **Security Update Status** page shows you the update status of devices in your inventory based on their update channel. You can also see the **Goal status** for each update channel, based on the goal you have set.

