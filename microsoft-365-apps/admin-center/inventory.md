---
title: "Overview of inventory in the Microsoft 365 Apps admin center"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: conceptual
ms.service: o365-proplus-itpro
ms.localizationpriority: medium
ms.collection: Tier1
recommendations: false
description: "Guidance for Office admins on how to use the inventory feature in the Microsoft 365 Apps admin center."
ms.date: 08/01/2024
---

# Overview of inventory in the Microsoft 365 Apps admin center

The **Inventory** page in the [Microsoft 365 Apps admin center](https://config.office.com) gives you insights into the state of Office installations on devices in your organization. These insights can help you identify issues with those Office installations, such as identifying devices that are running an older, unsupported build of Office. Insights are also available about add-ins that are installed on those devices.

From the **Inventory** page, you can drill down to see detailed information about a specific device, including hardware information, its operating system, and the Office software running on the device. Additionally, you can see if add-ins or macros are present on the device and the last signed in user. 

> [!TIP]
> If you want to get a better understanding on the benefits of using inventory, check out the [Introduction to inventory](https://www.youtube.com/watch?v=qHDFffWHdKk) video. If you want to go deeper in terms of how the inventory service works, which changes occur on your devices, and how to do troubleshoot missing devices, we recommend you check out the [Inventory deep dive](https://www.youtube.com/watch?v=g1rDR2aOAQc) video.

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

### Microsoft Entra groups requirements
The feature to [switch device update channels](#switch-device-update-channel) supports using [Microsoft Entra groups](/entra/fundamentals/concept-learn-about-groups).

<!--Using include for adding requirements-->
[!INCLUDE [Groups requirements](./includes/requirements-groups.md)]

## How to view inventory

To view the inventory for the devices in your organization with Microsoft 365 Apps installed, perform the following steps:

1. Sign in to the [Microsoft 365 Apps admin center](https://config.office.com) with your admin account, and then go to **Inventory** in the navigation pane.
2. If you're new to inventory, you need to complete the one-step setup.
3. Once the setup is complete, insights about devices where users launched a Microsoft 365 app such as Word or Excel, appear on the **Inventory** page with an hour.

## Inventory insights dashboard

The first page of **Inventory** is the insights dashboard. This page shows you insights across the devices in your organization, including the following information:

- The number of different Office builds, devices on those builds, and their support status.
- The number of different Office update channels, number of different builds from those update channels, and their support status.
- The number of devices on which Microsoft 365 Apps, version 2008 or later, is installed and the architecture (32-bit versus 64-bit) being used.
- The top installed COM add-ins on those devices.
- The Inventory Search, find a specific device or addin.

## Office build spread insight

The **Office build spread** insight shows you a view of each Office build installed on devices in your organization, grouped by build number or by unsupported builds. You can hover over the insight to get counts of devices per build or in the unsupported category. 

By choosing **Show all builds** a flyout appears that provides more details, such as the build number, the update channel that the build came from, the number of devices on that build, and the support status of that build. You can also easily get to a filtered view of all devices that have an unsupported build of Office, so that you can take action on them.

## Channels insight

The **Channels** insight shows you the number of builds in your environment by update channel and their support status. Choosing **Show all channels** shows you a flyout with additional information. From the flyout, you can select a given update channel to see a list of devices configured to use that update channel.  

## Devices insight

The **Devices** insight shows you a breakdown by Office architecture (32-bit versus 64-bit) for the devices in your organization. To see more information about your devices, choose **Show all devices**. From there, you can select any device in the table to show a flyout with additional information about that specific device. The main device table can be filtered by clicking on each column header. You can also export the full list of devices from this view.

Once you select **show all devices** you will see the Inventory table, the inventory table shows the following information:

| Heading | Description |
|:-----|:-----|
| Name| The name of the device |
| Version| The version of Office that is installed on the device |
| Build| The build of Office that is installed on the device |
| Architecture| Office architecture on the device example x64/x32 |
| Update channel| The update channel that Office is configured to receive Office updates from |
| Add-ins Present | Does the device contain add-ins |
| Macros used | Is the device running macros |
| Last contact | The last time the device checked in |
| Last user | The last user that signed into office on the device |
| Last email | The last user's email that signed into office on the device |

## Cloud Update status details

| Heading | Description |
|:-----|:-----|
| Eligible for| The device is eligible for cloud update |
| Managed by| The device is managed by cloud update |
| Not eligible for profiles| The device is not on a channel supported by cloud update |
| Onboarding to| The device is onboarding to the desired cloud update profile |
| Excluded from| The device is excluded from the specific cloud update profile |

## Office device details
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
| Macro files | If the device recently opened a macro enabled file |

> [!NOTE]
> - For a list of all the inventory information that is collected from devices, see [Data sent to Microsoft for the inventory feature in the Microsoft 365 Apps admin center](inventory-data.md).
> - The inventory reports the update channel for Office based on the build installed on the device. If the update channel was recently changed but the device hasn't completed the process of switching to the new update channel, then the inventory will still report the previous update channel.

## Add-ins insight

The **Add-ins** insight shows the Office add-ins installed on the devices in your organization. The insight shows you the most commonly installed add-ins, the number of devices running that add-in, and the number of different versions of the add-in that are installed on devices in your organization. You can export the full add-in list from the add-in table. 

If you choose **Show all add-ins**, you can see a table with the following information:

| Column heading | Description |
|:-----|:-----|
| Name| The name of the add-in. |
| Version | The version number of the add-in. If there are multiple versions of the add-in installed on devices in your organization, you see **Multiple**. |
| Publisher | The publisher of the add-in. |
| Number of versions | The number of different versions of the add-in that are installed on devices in your organization. |
| Number of devices | The number of devices in your organization that the add-in is installed on. |

You can drill down to see details about an add-in by clicking on its name. Those details include all the versions of that add-in that are installed in your organization, the architecture of the add-in, and the number of devices running that specific version of the add-in. You can then drill down further to see a list of the devices that a specific version of the add-in is installed on.

> [!NOTE]
> Add-ins that are installed as part of Microsoft 365 Apps for enterprise won’t appear in the table.

## Inventory search

If you need to find a specific device or add-in, you can use the search box located at the top of the page.
> [!NOTE]
> The Inventory switch device update channel is in public preview.

## Switch device update channel

You can use the **Switch device update channel** capability to change the update channel for Microsoft 365 Apps across the devices in your organization. To trigger a channel change using this capability, perform the following steps:

1. Sign in to the [Microsoft 365 Apps admin center](https://config.office.com) with your admin account, and then go to **Inventory** in the navigation pane.
2. Under **Devices**, choose **Show all devices**.
3. At the top of the Devices page, select **Switch device update channel** to reveal the flyout.
4. In the flyout, select the desired channel to move devices to and provide information for one of the following options:
   - One or more device names. These devices must be in inventory and not already be on the destination channel.
   - One or more Microsoft Entra groups. These groups can contain users or devices. If you include devices, they must be Entra joined or hybrid Entra joined.
6. Select **Move devices**, review the results, and close the flyout.

The channel change could take up to 24 hours to process. Once the change is complete, the updated channel is reflected in inventory.

If you'd prefer to see this capability in action, check out this video: [How to trigger an update channel change for devices in the Microsoft 365 Apps admin center](https://www.youtube.com/watch?v=tFmktdQsKgY).

> [!NOTE]
> Triggering a channel change is a point-in-time action. If you target a security group, the action will be based on the current membership of that group. If you add additional members to the group, you can re-run the action and any devices that have already been moved to the destination channel will be ignored.
> - A channel change will automatically enable cloud update for Current Channel and Monthly Enterprise Channel profiles.

## Export inventory views

You can export the inventory views to .csv format so that you can import your data into other tools. To do an export, navigate to the Devices view and select the **Export** button. This service prepares the data in the background and notifies you when it's ready for download. Refresh the page periodically until the **Download now** link appears. Inventory always exports all data points, regardless of the currently set filters. There's no size limit to the export.

> [!NOTE]
> - Inventory data can be exported once per day and downloaded as many times as needed.
> - The following columns were added to inventory with the upgrade to Cloud Updates, but are not currently included when exporting data: *Cloud Update Status*, *Update Status*, and *Wave*.
> - Inventory does not support alternative methods for data export.

## Inventory cleanup

Devices send a heartbeat once a day to the inventory. A device doesn't send a heartbeat for 30 days is removed from the inventory. If the device comes back online and sends a heartbeat, the device is added to the inventory again. You can extend this setting from 30 days by going to **Settings** in the navigation pane.

## Missing or duplicate devices

If you have devices that are missing from the inventory, make sure that the devices meet the [requirements for using inventory](#requirements).

In a few cases, some devices might appear more than once in the inventory. This duplication mainly occurs with nonpersisted VDI environments. These duplicate entries are removed automatically each day.
