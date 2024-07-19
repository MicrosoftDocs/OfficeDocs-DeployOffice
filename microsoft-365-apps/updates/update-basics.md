---
title: "Keep Office apps up to date with the latest updates"
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
description: "Provides Office admins with guidance on how to get updates for Microsoft 365 Apps."
ms.date: 03/01/2023
---

# Keep Office apps up to date with the latest updates

The Office apps (such as Word, Excel, PowerPoint, and Outlook) that are included with Microsoft 365 Apps are updated regularly. These updates can include feature updates, security updates, and other updates. Those other updates can include, for example, fixes for known issues or changes that provide stability or performance improvements for Office.

To help make sure Office is kept up to date with the latest updates, we recommend that you perform the following tasks:

- [Verify that Office is configured to check for updates automatically](#verify-that-office-is-configured-to-check-for-updates-automatically)
- [Configure Office to get updates directly from the internet](#configure-office-to-get-updates-directly-from-the-internet)
- [Make sure the device has enough free disk space](#make-sure-the-device-has-enough-free-disk-space)
- [Set a deadline for applying Office updates (optional)](#set-a-deadline-for-applying-office-updates-optional)

To configure update settings for Office on devices running Windows in your organization, you can [use the Office Deployment Tool or Group Policy](#use-the-office-deployment-tool-or-group-policy-to-configure-update-settings-optional).

## Verify that Office is configured to check for updates automatically

Office is configured, by default, to check automatically for updates regularly. If updates are available, Office will download them in the background while users are still using their Office apps. After downloaded, the updates will be applied at the next opportunity, such as when the Office apps are closed.

To check if Office is configured to check for updates automatically, open an Office app, such as Word, and go to **File** > **Account**. Next to **Update Options**, you should see the following text:

&nbsp;&nbsp;&nbsp;Updates are automatically downloaded and installed.

If you don't see this text, choose **Update Options** > **Enable updates**.

To configure this setting for devices running Windows in your organization, see [Use the Office Deployment Tool or Group Policy to configure update settings](#use-the-office-deployment-tool-or-group-policy-to-configure-update-settings-optional).

> [!NOTE]
> If you want to force Office to check for updates right away, open an Office app, such as Word, and go to **File** > **Account**. Then, under **Update Options**, choose **Update Now**. Office will then check to see if any new updates are available to download and install.

## Configure Office to get updates directly from the internet

To simplify update management, we recommend that you configure Office to get updates directly from the Office Content Delivery Network (CDN) on the internet.

To configure this setting, see [Use the Office Deployment Tool or Group Policy to configure update settings](#use-the-office-deployment-tool-or-group-policy-to-configure-update-settings-optional).

> [!NOTE]
> - When updates are made available on the Office CDN, we gradually advertise the availability of the updates over a period of several days to devices worldwide that have Office installed. This way not all devices in your organization will try to access the Office CDN at the same time to download the updates, which could possibly cause network bandwidth utilization issues.
> - If you configure Office to get updates directly from the Office CDN, and those devices are running Windows 11 or Windows 10, you can take advantage of [Delivery Optimization](../updates/delivery-optimization.md) to help reduce network bandwidth utilization.

## Make sure the device has enough free disk space

Office needs free disk space to be able to download and install updates. Because Office is always installed on the system drive, which is usually the C:\ drive, make sure that drive has at least 4 GB of free space.

## Set a deadline for applying Office updates (optional)

To make sure Office updates get applied, you can set a deadline by when the updates need to be applied. For example, you can specify that updates need to be installed within two days after they've been downloaded.

As the deadline approaches, users receive reminders to install the updates, including one 30 minutes before the deadline. These notifications give users the opportunity to save the Office documents that they're working on and to close any Office programs that are open. If users don't close the Office programs, the programs are closed automatically at the deadline, which might result in data loss.

To configure a deadline, see [Use the Office Deployment Tool or Group Policy to configure update settings](#use-the-office-deployment-tool-or-group-policy-to-configure-update-settings-optional).

## Use the Office Deployment Tool or Group Policy to configure update settings (optional)

You can use the [Office Deployment Tool (ODT)](../deploy/overview-office-deployment-tool.md) or [Group Policy](https://www.microsoft.com/download/details.aspx?id=49030) to configure update settings for Office for devices running Windows in your organization.

The following table shows the relevant Office Deployment Tool attributes and Group Policy policy settings that you can use.

|Setting  |Office Deployment Tool  |Group Policy <sup>[1]</sup>   |
|---------|---------|---------|
|Check for updates automatically <sup>[2]</sup>  | [Enabled attribute](../deploy/office-deployment-tool-configuration-options#enabled-attribute-part-of-updates-element) |Enable Automatic Updates|
|Get updates directly from the internet     | [UpdatePath attribute](../deploy/office-deployment-tool-configuration-options#updatepath-attribute-part-of-updates-element) | Update Path        |
|Set a deadline   | [Deadline attribute](../deploy/office-deployment-tool-configuration-options#deadline-attribute-part-of-updates-element)  | Update Deadline         |

> [!NOTE]
> <sup>[1]</sup> All these policies can be found under Computer Configuration\Policies\Administrative Templates\Microsoft Office 2016 (Machine)\Updates in the Group Policy Management tool.
>
> <sup>[2]</sup> If you use the Office Deployment Tool, users can still turn off checking for updates by choosing **Update Options** > **Disable Updates**. If you use Group Policy, users won't be allowed to change the setting.

## Related articles

- [Update history for Microsoft 365 Apps](/officeupdates/update-history-microsoft365-apps-by-date)
- [Release notes for Microsoft Office security updates](/officeupdates/microsoft365-apps-security-updates)