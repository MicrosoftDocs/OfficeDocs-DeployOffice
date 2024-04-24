---
title: "Overview of the security update status report in the Microsoft 365 Apps admin center"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: conceptual
ms.service: o365-proplus-itpro
ms.localizationpriority: medium
ms.collection: Tier1
recommendations: false
description: "Guidance for Office admins on how to use the security update status feature in the Microsoft 365 Apps admin center."
ms.date: 04/24/2024
---

# Overview of the Security Update Status and Vulnerabilities in the Microsoft 365 Apps Admin Center
The **Security Update Status** page in the [Microsoft 365 Apps admin center](https://config.office.com) offers insights into the security updates for Microsoft 365 Apps across devices. It helps administrators understand and maintain the security posture of their devices by tracking the installation of the latest security updates. This feature is essential for ensuring a secure and protected environment for Microsoft 365 Apps users.

## Requirements

### Supported built-in admin roles
<!--Using include for adding requirements-->
[!INCLUDE [Roles requirements](./includes/requirements-roles.md)]

### Licensing requirements
<!--Using include for adding requirements-->
[!INCLUDE [License requirements](./includes/requirements-licenses.md)]

### Product version requirements
<!--Using include for adding requirements-->
[!INCLUDE [Version requirements](./includes/requirements-versions.md)]

### Network requirements
<!--Using include for adding requirements-->
[!INCLUDE [Network requirements](./includes/requirements-network.md)]

## Accumulated Vulnerabilities and Update Schedule
The admin center displays both the accumulated vulnerabilities and the count of devices lagging in updates. A device that wasn't updated misses at least one security patch, making it a potential risk. All channels receive security builds on the second Tuesday of every month, and for those using Monthly Enterprise Channel, this security build is incorporated as part of the new monthly version. Each installation version receives a monthly security update for the duration of its support.

## How to View Security Update Status
To view the security update status for the devices in your inventory, follow these steps:

1. Sign in to the [Microsoft 365 Apps admin center](https://config.office.com) with your admin account, and then go to **Health** > **Security Update Status** in the navigation pane.
2. Complete the setup wizard if viewing security update status for the first time.
3. Insights about active devices start to appear on the page within two hours.

## Update Status Insight and Security Vulnerability Details
The **Update status** on the **Security Update Status** page shows what percentage of your devices installed the most recent security update. The date of the most recent security update is listed at the top of the page for reference. For a list of security updates, see [Release notes for Microsoft Office security updates](/officeupdates/microsoft365-apps-security-updates).

Your devices in inventory are evaluated against the most recent security update, depending on the assigned update channel. Devices can be in one of the following three categories:

- **Up to date** - Installed the most recent security update.
- **Not up to date** - The most recent security update isn't installed.
- **Unknown** - Security update status couldn't be retrieved.

You can also drill down to view a list of all devices or a filtered view of the devices that aren't up to date.

In the security vulnerability details, each monthly security release is listed, meaning the device list displays devices from every channel.

## Goal Insight
The **Goal** insight helps track progress in updating devices with each security update. Setting a goal involves specifying the percentage of devices you want to update within a timeframe.

Setting a goal doesn't create any policies or changes to your devices. The goal is used only for your personal reporting on the Security Update Status page.

## Update Status by Channel Insight and Updating Devices
The **Update status by channel** insight shows the update status of devices based on their update channel. Admins should anticipate up to a week to ensure all devices are updated. Devices lagging by more than two security builds should be prioritized. The recommended method for updating devices is with a cloud update for automated cloud management.
