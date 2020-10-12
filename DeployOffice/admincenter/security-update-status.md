---
title: "Security Currency"
ms.author: darrend
author: darrendmsft
manager: laurawi
audience: ITPro
ms.topic: article
ms.service: o365-proplus-itpro
localization_priority: None
hideEdit: true
description: "Provides Office admins information about Microsoft 365 Apps security currency within their environment"
---

# Overview of the security update status report in the Microsoft 365 Apps admin center

> [!IMPORTANT]
> This is pre-release documentation for a preview program that isn’t available to everyone and is subject to change.

You can use the security update status page in the Microsoft 365 Apps admin center to see the which devices have installed the latest security updates for Office.

Requirements:
- Microsoft 365 Apps for enterprise, Version 2007 or later
- A version of Windows 10 supported by Microsoft 365 Apps for enterprise
- Office 365 (or Microsoft 365) E3 or E5 subscription plan
- Device must be part of inventory in the Microsoft 365 Apps admin center

## How to view security state status

1. Go to the [Microsoft 365 Apps admin center](https://config.office.com), click **Health** anbd then click **Security update status** in the left-hand navigation. For information on using the admin center and enabling preview features, see [Overview of the Microsoft 365 Apps admin center](overview.md).
2. If you haven't viewed security update status before, complete the setup wizard.

## Security update status

The security update status view shows what percentage of your devices have the most recent security update. Your devices are evaluated against the latest release patch date (depending on the assigned channel) and can be in 3 categories.

- Up to date – Device that has installed the [latest security patch](https://docs.microsoft.com/officeupdates/microsoft365-apps-security-updates)
- Not up to date – Device that has not installed the most recent security update
- Unknown – Status of the security update could not be retrieved.

You can also drill down into all devices on or view the devices that are not up to date.

## Set a goal for updating devices

To set a goal for updating devices and view your progress against that goal, click **Set a goal** on the Security device status page. You can specify the percentage of devices you want  to update and the schedule for meeting that target.
