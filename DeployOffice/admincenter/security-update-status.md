---
title: "Security Currency"
ms.author: darrend
author: darrendmsft
manager: laurawi
audience: ITPro
ms.topic: article
ms.service: o365-proplus-itpro
localization_priority: Normal
description: "Provides Office admins information about Microsoft 365 Apps security currency within their environment"
---

# Overview of the security update status report in the Microsoft 365 Apps admin center

> [!IMPORTANT]
> This is pre-release documentation for a preview program that isn’t available to everyone and is subject to change.

You can use the security update status page in the Microsoft 365 Apps admin center to see which devices have installed the latest security updates for Office.

## Requirements for using security update status
- Microsoft 365 Apps for enterprise, Version 2008 or later
- A version of Windows 10 supported by Microsoft 365 Apps for enterprise
- Microsoft 365 (or Office 365) A3, A5, E3, or E5 subscription plan
- Device must be part of inventory in the Microsoft 365 Apps admin center

## How to view security state status

1. Go to the [Microsoft 365 Apps admin center](https://config.office.com), click **Health** and then click **Security update status** in the left-hand navigation. For information on using the admin center and enabling preview features, see [Overview of the Microsoft 365 Apps admin center](overview.md).
2. If you haven't viewed security update status before, complete the setup wizard.

## Security update status

The security update status view shows what percentage of your devices have the most recent security update. Your devices are evaluated against the latest release patch date (depending on the assigned channel) and can be in three categories.

- Up to date – Device that has installed the [latest security patch](/officeupdates/microsoft365-apps-security-updates)
- Not up to date – Device that has not installed the most recent security update
- Unknown – Status of the security update could not be retrieved.

You can also drill down into all devices on or view the devices that are not up to date.

An additional view is to view the update status by channel for each channel you have Microsoft 365 Apps installed from. This chart shows the number of devices in that channel and how many of them have updated to the latest security update. You can also view the Goal status for each channel.

## Set a goal for updating devices

To set a goal for updating devices and view your progress against that goal, click **Set a goal** on the Security device status page. You can specify the percentage of devices you want to update and the schedule for meeting that target. This doesn't create any policies or changes to your devices. It is used only for reporting on the security update status page.