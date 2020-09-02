---
title: "Getting started"
ms.author: chhopkin
author: chhopkin
manager: laurawi
audience: ITPro
ms.topic: article
ms.service: o365-proplus-itpro
localization_priority: None
ROBOTS: NOINDEX, NOFOLLOW
hideEdit: true
---

# Getting started

> [!IMPORTANT]
> This is pre-release documentation for a preview program that isn’t available to everyone and is subject to change.

Modern cloud management for Microsoft 365 Apps is a new set of services that administrators can use to easily manage Office for all the users and devices in their organization.  These cloud based management services provide administrators with capabilities such as setting the channel and version as well as inventory and policy management.

To get started using the Microsoft 365 Apps management services, you will need to:

1. Enable the Microsoft 365 Apps management services by visiting [https://config.office.com](https://config.office.com).
2. Configure the clients you want to manage via these services.

## Enable the Microsoft 365 Apps management services

1. Visit [https://config.office.com](https://config.office.com) and sign in with your Office 365 administration account.
2. On the navigation menu select Settings.
3. You will be prompted to enable preview features.
4. You will be prompted to accept the preview agreement/terms.
5. After you enable preview features and agree to the preview terms, the settings page will display your Tenant Association Key.  This key is used to connect your Office devices to the Microsoft 365 Apps management services on your tenant.

> [!NOTE]
> Microsoft 365 Apps management services only apply to Windows 10 devices.

## Configure devices on Current Channel or Monthly Enterprise Channel

If the devices you want to manage with these services are configured for updates from the Current Channel or the Monthly Enterprise Channel, the configuration is mostly automatic.  To ensure the devices are automatically configured, follow these steps:

1. Verify the device is on Current Channel or Monthly Enterprise Channel.
2. Check the version number.  Devices on these channels must have version [16.0.xxxx.xxxx] or greater.
3. Make sure Office is activated by a licensed user.

To verify the device is connected you can check if the device appears in the Inventory page.

## Configure devices on Semi-Annual Enterprise Channel

If the devices you want to manage with these services are below version [16.0.xxxx.xxxx], such as devices configured for updates from the Semi-Annual Enterprise Channel or the Semi-Annual Enterprise Channel (Preview), you will need to install a new component which is not yet available to these channels.

Steps to configure:

1. Download Serviceability Manager from the Microsoft Download Center - [https://www.microsoft.com/download/details.aspx?id=9999999999](https://www.microsoft.com/download/details.aspx?id=9999999999)
2. Distribute Serviceability Manager to run as a scheduled task on devices you want to manage with these services.

To verify the device is connected you can check if the device appears in the Inventory page.

## Configure devices managed by Microsoft Intune

Devices that are managed via Microsoft Intune get their Office updates automatically from the CDN.  You can continue to use Microsoft Intune to install Office on the devices you manage and use the Microsoft 365 Apps management services to manage the configuration such as channel and version.  There are no additional steps to configure the client.

## Configure devices managed via Microsoft Endpoint Configuration Manager

If you are using Microsoft Endpoint Configuration Manager to manage the updates, the devices that you want to switch to auto-managed will need additional changes.

1. TODO.
