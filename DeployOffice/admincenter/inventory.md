---
title: "Overview of inventory in the Microsoft 365 Apps admin center"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: article
ms.service: o365-proplus-itpro
ms.localizationpriority: medium
ms.collection: Tier1
recommendations: false
description: "Guidance for Office admins on how to use the inventory feature in the Microsoft 365 Apps admin center."
ms.date: 03/01/2023
---

# Overview of inventory in the Microsoft 365 Apps admin center

The **Inventory** page in the [Microsoft 365 Apps admin center](https://config.office.com) gives you insights into the state of Office installations on devices in your organization. These insights can help you identify issues with those Office installations, such as identifying devices that are running an older, unsupported build of Office. Insights are also available about add-ins that are installed on those devices.

From the **Inventory** page, you can drill down to see detailed information about a specific device, including hardware information, its operating system, and the Office software running on the device. Additionally, you can see if add-ins or macros are present on the device as well as the last signed in user. 

> [!TIP]
> If you want to get a better understanding what are the benefits of using inventory, check out the [Introduction to inventory](https://www.youtube.com/watch?v=qHDFffWHdKk) video. If you want to go deeper in terms on how the inventory service works, which changes occur on your devices, and how to do troubleshooting, we recommend you check out the [Inventory deep dive](https://www.youtube.com/watch?v=g1rDR2aOAQc) video.

## Requirements for using inventory

To view the inventory for your environment, the following requirements must be met:

- Microsoft 365 Apps for enterprise or Microsoft 365 Apps for business, Version 2008 or later
- A version of Windows 11 or Windows 10 that is supported by Microsoft 365 Apps for enterprise or by Microsoft 365 Apps for business
- Microsoft 365 (or Office 365) for Business Standard, Business Premium, A3, A5, E3, or E5 subscription plan
- Client devices can reach the following endpoints: 
  - `https://login.live.com`
  - `https://*.config.office.com`
  - `https://*.config.office.net`

> [!IMPORTANT]
> Inventory isn't available to customers who have the following plans:
>- Office 365 operated by 21Vianet
>- Office 365 GCC
>- Office 365 GCC High and DoD

## How to view inventory

To view an inventory of devices in your organization with Microsoft 365 Apps installed, perform the following steps:

1. Sign in to the [Microsoft 365 Apps admin center](https://config.office.com) with your admin account, and then go to **Inventory** in the navigation pane.
2. If you haven't viewed the inventory before, you will need to complete the one-step setup.
3. Once the setup is complete, insights about devices where users have launched a Microsoft 365 app such as Word or Excel, will appear on the **Inventory** page with an hour.


## Inventory insights dashboard

The first page of **Inventory** is the insights dashboard. This page shows you insights across the devices in your organization, including the following information:

- The number of different Office builds, devices on those builds, and their support status.
- The number of  different Office update channels, number of different builds from those update channels, and their support status.
- The number of devices on which Microsoft 365 Apps, version 2008 or later, is installed and the architecture (32-bit versus 64-bit) being used.
- The top installed add-ins on those devices.


## Office build spread insight

The **Office build spread** insight shows you a view of each Office build installed on devices in your organization, grouped by build number or by unsupported builds. You can hover over the insight to get counts of devices per build or in the unsupported category. 

By choosing **Show all builds** you will get a flyout that provides more details, such as the build number, the update channel that the build came from, the number of devices on that build, and the support status of that build. You can also easily get to a filtered view of all devices that have an unsupported build of Office, so that you can take action on them.


## Channels insight

The **Channels** insight shows you the number of builds in your environment by update channel and their support status. Choosing **Show all channels** will show you a flyout with additional information. From the flyout, you can select a given update channel to see a list of devices configured to use that update channel.  

## Devices insight

The **Devices** insight shows you a breakdown by architecture (32-bit versus 64-bit) of Office installed on devices in your organization. To see more information about your devices, choose **Show all devices**. From there, you can select any device in the table to show a flyout with additional information about that specific device. The main device table can be filtered by clicking on each column header. You can also export the full list of devices from this view.

The flyout for a specific device shows the following information:

| Heading | Description |
|:-----|:-----|
| Device name | The name of the device |
| Last seen | The last time the device checked in |
| Manufacturer | The device manufacturer |
| Model family | The device model family |
| Model | The device model  |
| Total RAM | The amount of RAM installed on the device |
| OS family | The operating system that is running on the device |
| OS version| The version of the operating system that is running on the device |
| OS build| The build number of the operating system that is running on the device |
| Free storage| The remaining storage on the drive on which Office is installed |
| Total storage| The total storage on the drive on which Office is installed |
| Last signed in user and email | Information about who the last signed in user on the device was |
| Version| The version of Office that is installed on the device |
| Build| The build of Office that is installed on the device |
|Release date| The release date of that build of Office|
| Update channel| The update channel that Office is configured to receive Office updates from |
| Office apps| A list of the Office apps installed on the device |
| Office Add-ins | A list of the COM add-ins that are installed on the device. This list excludes Add-ins that are part of the Office installation.|
| Macro files | Whether the device has recently opened a macro enabled file |

> [!NOTE]
> - For a list of all the inventory information that is collected from devices, see [Data sent to Microsoft for the inventory feature in the Microsoft 365 Apps admin center](inventory-data.md).
> - The inventory reports the update channel for Office based on the build installed on the device. If the update channel was recently changed but the device hasn't completed the process of switching to the new update channel, then the inventory will still report the previous update channel.


## Add-ins insight

The **Add-ins** insight shows the Office add-ins installed on the devices in your organization. The insight shows you the most commonly installed add-ins, the number of devices running that add-in, and the number of different versions of the add-in that are installed on devices in your organization. You can export the full add-in list from the add-in table. 

If you choose **Show all add-ins**, you can see a table with the following information:

| Column heading | Description |
|:-----|:-----|
| Name| The name of the add-in. |
| Version | The version number of the add-in. If there are multiple versions of the add-in installed on devices in your organization, you will see **Multiple**. |
| Publisher | The publisher of the add-in. |
| Number of versions | The number of different versions of the add-in that are installed on devices in your organization. |
| Number of devices | The number of devices in your organization that the add-in is installed on. |

You can drill down to see details about an add-in by clicking on its name. Those details include all the versions of that add-in that are installed in your organization, the architecture of the add-in, and the number of devices running that specific version of the add-in. You can then drill down further to see a list of the devices that a specific version of the add-in is installed on.

> [!NOTE]
> Add-ins that are installed as part of Microsoft 365 Apps for enterprise won’t appear in the table.

## Inventory search

If you need to find a specific device or add-in, you can use the search box located at the top of the page.

## Inventory cleanup

Devices will send a heartbeat once a day to the inventory. If a device hasn't sent a heartbeat in the last 30 days, the device will be removed from the inventory. If the device comes back online and sends a heartbeat, the device will be added to the inventory again. You can extend this from 30 days by going to **Settings** in the navigation pane.


## Export inventory views

You can export the inventory views to .csv format so that you can import your data into other tools. To do an export, navigate to the Devices view and click on the **Export** button. The service will prepare the data in the background and notify you, when it is ready for download. Inventory will always export all data points, regardless of the currently set filters. There is no size limit to the export.


## Missing or duplicate devices

If you have devices that are missing from the inventory, make sure that the devices meet the [requirements for using inventory](#requirements-for-using-inventory).

In a few cases, some devices may appear more than once in the inventory. This duplication mainly occurs with non-persisted VDI environments. These duplicate entries will be removed automatically each day.

