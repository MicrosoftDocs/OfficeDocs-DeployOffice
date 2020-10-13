---
title: "Inventory"
ms.author: darrend
author: darrendmsft
manager: laurawi
audience: ITPro
ms.topic: article
ms.service: o365-proplus-itpro
localization_priority: None
hideEdit: true
description: "Provides Office admins information about configuring and using inventory in Microsoft 365 Apps admin center to view their managed devices"
---

# Overview of inventory in the Microsoft 365 Apps admin center

> [!IMPORTANT]
> This is pre-release documentation for a preview program that isn’t available to everyone and is subject to change.

You can use the inventory page in the Microsoft 365 Apps admin center to see information about the devices in your organization, including hardware, operating system, and the Office software running on that device.

Requirements:
- Microsoft 365 Apps for enterprise, Version 2007 or later
- A version of Windows 10 supported by Microsoft 365 Apps for enterprise
- Microsoft 365 (or Office 365) A3, A5, E3, or E5 subscription plan

## How to view inventory

1. Go to the [Microsoft 365 Apps admin center](https://config.office.com) and click **Inventory** in the left-hand navigation. For information on using the admin center and enabling preview features, see [Overview of the Microsoft 365 Apps admin center](overview.md).
2. If you haven't viewed inventory before, complete the setup wizard.
3. When you complete the wizard, your devices should appear on the inventory page within 2 hours.

## Inventory view

The inventory view gives you insights across the devices in your organization, including:

- The number of different Office builds
- The number of  different Office update channels
- The top installed add-ins

## Device view

The device view shows detailed information on devices, including the following:

|**Item**|**Description**|
|:-----|:-----|
| Device name | The name of the device |
| Last seen | The last time the device checked in |
| Status | Marks if the device is active or inactive |
| Manufacturer | The device manufacturer |
| Model Family | Device model family |
| Model | The device model  |
| Installed RAM | RAM installed on the device |
| OS Family | Which OS is running on the device |
| OS Version| Which version of the OS is running on the device |
| OS Build| What is the build number of the OS running on the device |
| Free Storage| Remaining storage on the drive on which Office is installed |
| Total Storage| The total storage on the drive on which Office is installed |
| Office Version| Which Office version is installed |
| Office Build| The Office build string installed |
| Office Channel| The office channel the device is receiving updates from |
| Serviceability Manager Version| The build string of the Serviceability manager installed on the device |
| Office apps (Word, Xls, PPT, etc.)| A list of the Office apps installed on the device |
| Office Add-ins | A list of the COM add-ins that are installed on the device. This excludes inbox add-ins |
| Download location | The location from where the device is downloading updates. |
| Use macros | Has the device recently opened a file with a macro |

> [!NOTE]
> Inventory reports the Office channel based on the build installed on a device. If channel was switched but the device still contains builds from the old channel, the Inventory will report the old channel.

## Device status

Devices status shows which devices are recently active, which means they've checked in within the last 30 days. Note that devices that don't check in for 180 days are automatically deleted from the system. If a device checks in again, it will be placed back in the active state.

## Add-in view

The add-in view shows the Office add-ins on the devices in your organization. The add-in view shows details for add-ins across the devices, including the following:

|**Item**|**Description**|
|:-----|:-----|
| Add-in Name | The name of the add-in |
| Publisher | The publisher of the add-in |
| Version | The version number of the add-in. If there is multiple version of the add-in this will state "Multiple" |
| Number of versions | The number of versions installed across your devices |
| Number of installs | The number of add-in installs across your devices |

> [!NOTE]
> Add-ins installed as a part of Microsoft 365 Apps for enterprise won’t appear in the table.

## Export inventory views

You can export the inventory views to .csv format so you can import your data into other tools. To use export, filter the views down to the selection of data you wish to export, then click the export button on the top left of the table. This will export the current filtered view of data up to a limit of the top 3000 devices. We recommend using the filtering controls on the table to first narrow down the data you wish to export.