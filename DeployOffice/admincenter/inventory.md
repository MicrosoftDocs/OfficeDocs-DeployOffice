---
title: "Inventory"
ms.author: darrend
author: darrendmsft
manager: laurawi
audience: ITPro
ms.topic: article
ms.service: o365-proplus-itpro
localization_priority: None
ROBOTS: NOINDEX, NOFOLLOW
hideEdit: true
description: "Provides Office admins information about configuring and using Inventory in config.office.com to view the devices they manage"
---

# Inventory

> [!IMPORTANT]
> This is pre-release documentation for a preview program that isn’t available to everyone and is subject to change.

The Apps admin center Inventory is the page that exposes the information collected by the Serviceability Manager about devices in your organization such as the hardware, operating system and Office software running on that device.

## Onboarding

Onboarding to the Inventory is simple and straightforward, requiring only two steps.

1. Onboard at config.office.com<br/><br/>Log onto config.office.com and click Inventory in the left-hand pane. If this is your first time visiting the page, you will be presented with an onboarding flow. After you click accept, you will see a provisioning flow and shortly after be presented with the Inventory dashboard.

2. Ensure your devices are using the minimum required build.<br/><br/>Inventory information is collected the Serviceability Manager, a component in Click-to-Run. Once you have rolled out Office Release 1908 or greater to your end user devices, Serviceability Manager will be deployed automatically. This will check the device has your Tenant association key applied and if it is, it will start up loading data to the Inventory service.
  
   > [!NOTE]
   > It might take up to 105 minutes to start seeing data in the Inventory dashboard and tables.

## Landing Dashboard

The landing page of the Inventory is the dashboard. The dashboard contains a set of cards that allows you at a glance to see several insights across your devices.
The insights include

- Office version spread; The number of different builds across devices in your enterprise.
- Office channel spread; The number of device spread across different Office channels
- Top installed Add-ins; The top number of add-ins installed on devices

From each of these cards, you can drill into more detailed views like the device table view and the add-in table view.

## Device Inventory Table

The device inventory table gives you access to the full list of information on devices that are sending device information via the Serviceability Manager to the <MOCA> service.
The table view highlights the Office specific information for your devices.

The following table provides a list of information displayed in the Inventory table.

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
> Inventory reports the Office channel based on the build installed on a device. If channel was switched but the device still contains build from the old channel, the Inventory will report the old channel.

## Device Status

Devices can have two states in the Inventory. They can be either Active or Inactive. If a device has checked in with the Inventory service within the last 30 days, these devices are considered active state. If a device does not check in for more than 30 days, it moves to the inactive state. Device state information shown on the Inventory table and in the device flyout.

Devices remain in the inactive state for 180 days after which they are automatically deleted from the system. If during the inactive period, a device checks in again, it will be placed back in the active state.

## Inventory export

You can export the Inventory views to csv format so you can import your data into any other tools you wish to use. To use export, filter the views down to the selection of data you wish to export, then click the export button on the top left of the table. This will export the current filtered view of data up to a limit of the top 3000 devices. We recommend using the filtering controls on the table to first narrow down the data you wish to export.

## Add-in Inventory

The add-in Inventory allows you to see the spread of COM add-ins across your devices in the enterprise. To access the add-in Inventory, click on the Top installed add-ins insight card.

Note: For each device the add-in Inventory provides information about add-ins installed for the last signed Windows user and in the device context.

## Add-in table

After clicking through on the Top installed add-ins insight card you will land on the add-in table. This gives you a set of details for add-ins across the devices. Add-ins are rolled up under a single add-in name, which you can drill into for more detail.

The following table provides a list of information displayed in the add-in table.

|**Item**|**Description**|
|:-----|:-----|
| Add-in Name | The name of the add-in |
| Publisher | The publisher of the add-in |
| Version | The version number of the add-in. If there is multiple version of the add-in this will state "Multiple" |
| Number of versions | The number of versions installed across your devices |
| Number of installs | The number of add-in installs across your devices |

> [!NOTE]
> Add-ins installed as a part of Microsoft 365 Apps for enterprise won’t appear in the table.

As with the devices table, this table is filterable and you can filter the columns to get specific views you want.
The add—in Inventory is laid out in the following fashion.

- Add-ins are rolled up under the single common name
  - E.g "Contoso Add-in"
- Clicking on the Contoso Add-in opens a flyout which shows more details for that add-in
  - You can see the version(s), the Office application, the architecture, and number of installs
- You can then click on the installs count to see a device table similar to the Inventory views.
  - You can then export this list.  

> [!NOTE]
> The latest list of add-ins is taken from the last logged in user for which the Serviceability manager ran.  
