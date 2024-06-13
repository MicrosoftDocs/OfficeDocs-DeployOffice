---
title: "View software update status for Microsoft 365 Apps installations"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: conceptual
ms.service: o365-proplus-itpro
ms.collection: Tier1
ms.localizationpriority: medium
recommendations: false
description: "Provides Office admins with information about the Software updates page in the Microsoft 365 admin center."
ms.date: 03/13/2024
---

# View software update status for Microsoft 365 Apps installations

The **Software updates** page in the [Microsoft 365 admin center](/microsoft-365/admin/admin-overview/about-the-admin-center) displays a high-level overview of the installation status for Microsoft 365 Apps and Windows updates in your environment. Updates that contain security fixes are typically released on the second Tuesday of each month. Ensuring these updates are installed is important because they help protect you from known vulnerabilities. The **Software updates** page allows you to easily determine the overall update compliance for your devices.

The **Software updates** page has the following tabs to assist you in monitoring update status for your devices:

- **Microsoft 365 Apps**: Displays compliance charts for security updates for Microsoft 365 Apps.

- **Windows**: Displays compliance charts for cumulative updates and feature updates for Windows clients.

This article contains information about the **Microsoft 365 Apps** tab.

> [!TIP]
> For more information about the **Windows** tab, see [Microsoft 365 admin center software updates page](/windows/deployment/update/wufb-reports-admin-center).

## The Microsoft 365 Apps tab

To view the **Software updates** page, sign in to the Microsoft 365 admin center with your admin account, and then go to **Show all** > **Health** > **Software updates**.

> [!TIP]
> If you don't see an entry for **Software updates** in the menu, try going to this URL: https://admin.cloud.microsoft/Adminportal/Home#/softwareupdates.

The **Microsoft 365 Apps** tab shows the following information about devices in your organization that have Microsoft 365 Apps installed:
- How many devices have the most recent security updates
- How many devices are missing one set of security updates
- How many devices are missing two or more sets of security updates

For devices that are behind on security updates, the **Microsoft 365 Apps** tab shows you how many security vulnerabilities those devices are potentially exposed to by not having the most current security updates.

The **Microsoft 365 Apps** tab doesn’t show the specific devices that are one or more builds behind. To see more detailed information about devices in your organization that have Microsoft 365 Apps installed, you can use the [inventory feature](../admincenter/inventory.md) available in the [Microsoft 365 Apps admin center](https://config.office.com).

## Security updates for Microsoft 365 Apps

Security updates for Microsoft 365 Apps are released on the second Tuesday of each month. It’s important that you keep up to date with these security updates to help protect your organization from known security vulnerabilities. For a list of those security updates, see [Release notes for Microsoft Office security updates](/officeupdates/microsoft365-apps-security-updates).

To simplify update management and stay up to date with security updates, we recommend the following steps:
- Verify that Microsoft 365 Apps is configured to check for updates automatically
- Configure Microsoft 365 Apps to get updates directly from the internet

If you take these steps, your devices get updates automatically when new builds of Microsoft 365 Apps are released, including builds with security updates. For more information, see [Keep Office apps up to date with the latest updates](update-basics.md).

## Devices that are shown on the Microsoft 365 Apps tab

Only the following devices are shown on the **Microsoft 365 Apps** tab on the **Software updates** page.

- Devices running Windows with Microsoft 365 Apps installed.

- Devices on the following update channels:
  - Current Channel
  - Monthly Enterprise Channel
  - Semi-Annual Enterprise Channel
  - Semi-Annual Enterprise Channel (Preview)

- Devices that are using a Microsoft 365 Apps license assigned to a user by your organization (tenant).

## Additional information about the Microsoft 365 Apps tab

The following information applies to the **Microsoft 365 Apps** tab on the **Software updates** page.

Microsoft 365 Apps is the version of Office that comes with many Microsoft 365 (or Office 365) subscription plans for organizations. It includes apps such as Word, Excel, PowerPoint, and Outlook. For more information, see [About Microsoft 365 Apps in the enterprise](../about-microsoft-365-apps.md).

The information presented on this page relies on at least [required diagnostic data](../privacy/overview-privacy-controls.md#diagnostic-data-sent-from-microsoft-365-apps-for-enterprise-to-microsoft) being sent to Microsoft.

To view the information on this page, you must be assigned one of the following roles:

<!--Using include for adding global admin reference-->
[!INCLUDE [Global admin reference](../includes/global-admin-reference.md)]

- Global Administrator
- Global Reader
- Office Apps Administrator
- Reports Reader
- Usage Summary Reports Reader

The data that populates this page refreshes approximately every 48 hours.

This information isn’t available to customers who have the following plans:

- Office 365 operated by 21Vianet
- Office 365 GCC
- Office 365 GCC High and DoD

Volume licensed versions of Office, such as Office LTSC 2021 or Office 2019, aren't shown on this page.

## Related articles

- [Update history for Microsoft 365 Apps](/officeupdates/update-history-microsoft365-apps-by-date)
- [Overview of update channels for Microsoft 365 Apps](overview-update-channels.md)