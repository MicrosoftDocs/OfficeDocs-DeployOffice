---
title: "Update Office LTSC 2021"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: conceptual
ms.service: office-perpetual-itpro
ms.localizationpriority: medium
ms.collection: Tier2
recommendations: false
description: "Provides IT admins with information on how to update Office LTSC 2021."
ms.date: 03/29/2024
---

# Update Office LTSC 2021
 
After you deploy Office LTSC 2021, including Project and Visio, you’ll want to keep it updated because Microsoft releases security updates and quality updates, such as updates that provide stability or performance improvements for Office. Office LTSC 2021 is updated approximately once a month, usually on the second Tuesday of the month.

> [!NOTE]
> Office LTSC 2021 doesn't receive new features after it's released. If you want to get new Office features on an on-going basis, you should consider moving to a Microsoft 365 (or Office 365) plan that includes Office.

Office LTSC 2021 use Click-to-Run, instead of Windows Installer (MSI), as the technology used to install and update Office.

## How Office LTSC 2021 gets updated

Click-to-Run handles updates differently than Windows Installer (MSI). The following provides information about how updates work for Office LTSC 2021.

- When there are updates for Office LTSC 2021, Microsoft releases a new build of Office LTSC 2021 on the Office Content Delivery Network (CDN) on the internet. This new build includes all the latest security and quality updates.
- By default, Office LTSC 2021 is configured to receive updates automatically and directly from the Office CDN, although that can be changed. For more information, see [Configure where Office LTSC 2021 gets updates from](#configure-where-office-ltsc-2021-gets-updates-from).
- There's a scheduled task named “Office Automatic Updates 2.0 ” on the device on which Office LTSC 2021 is installed that checks for updates regularly.
- If updates are available, Office begins downloading the updates automatically. The user doesn’t have to do anything. As part of this process, Office also figures out what’s different between the latest version of Office LTSC 2021 up on the Office CDN and the version of Office LTSC 2021 that’s installed on the device. Based on that, it only downloads what’s needed to update Office LTSC 2021 to the latest version.
- While the updates are being downloaded, users can continue to use Office apps, such as Word. After the updates are downloaded, the updates are installed. If any Office apps are open, users are prompted to save their work and close the apps, so that the updates can be installed.
- After the updates are installed, users can go back to working in their Office apps.

## How updates are different in Office LTSC 2021

Since Click-to-Run handles updates differently than Windows Installer (MSI), here are some things you need to be aware of if you're used to MSI-based updates.

- There are no separate downloads for security or quality updates. These updates are already included as part of a new build of Office LTSC 2021 that’s posted on the Office CDN.
- Updates are cumulative, so the latest version of Office LTSC 2021 available on the Office CDN includes all the security and quality updates from all the previous versions of Office LTSC 2021.
- When you download and install Office LTSC 2021 from the Office CDN, it’s up to date already. You don’t have to download and apply any additional updates or service packs before you can start using Office LTSC 2021.
- Since updates are cumulative and already included in the latest version of Office LTSC 2021 on the Office CDN, you don’t use Microsoft Updates or Windows Server Updates Services (WSUS) by itself to update Office LTSC 2021. But you can use Microsoft Configuration Manager to help you deploy and manage updates to Office LTSC 2021, including controlling when and from where updates are applied.

## Configure where Office LTSC 2021 gets updates from

If network connectivity and other considerations based on your organizational requirements aren’t an issue, we recommend that you update Office LTSC 2021 automatically from the Office CDN. Updating from the Office CDN is the default, so there’s nothing extra you need to do and it’s an easy way to keep Office LTSC 2021 up to date.

If you don’t want devices installed with Office LTSC 2021 to connect to the Office CDN to get updates, you can configure Office LTSC 2021 to get updates from a shared folder from within your internal network. You still need a least one device to have access to the Office CDN to be able to download the latest version of Office LTSC 2021 to the shared folder on your internal network.

Keep in mind that installing and updating Office LTSC 2021 from a shared folder on your local network requires more administrative effort and more disk space. For example, you have to keep track of when new builds of Office LTSC 2021 are available and then download the updated version of Office LTSC 2021 to your network. Downloading to a shared folder on your local network will always download a full copy of the updated version of Office.

You can also use enterprise software deployment tools, such as Microsoft Configuration Manager, to help you update Office LTSC 2021.

The location where Office LTSC 2021 looks for updates is specified in the configuration.xml file that you use to deploy Office LTSC 2021 with the Office Deployment Tool. For more information, see [Deploy Office LTSC 2021](deploy.md). You can also use [Group Policy](#use-group-policy-to-specify-update-settings).

## Check for updates for Office LTSC 2021

Instead of waiting for the scheduled task to run to check for updates, you can manually check for updates. To do that, open any Office app, such as Word, and go to **File** > **Account** > **Update Options** > **Update Now**.

This causes the Click-to-Run service to go look for updates at the location that you’ve configured Office to look for updates. For example, directly from the Office CDN on the internet. If updates are available, Office begins the process to download.

## Size of updates for Office LTSC 2021

The size of the updates that are downloaded to the user's device from the update location varies depending on several factors, including how long it’s been since you last updated Office LTSC 2021 and how many security and quality updates there are.

To minimize the size of the updates that need to be downloaded, we recommend that you keep Office LTSC 2021 up to date. Office uses a technology called binary delta compression to help reduce the size of the updates that need to be applied to the user's device. But binary delta compression is only available if you're updating from a recent version of Office. For example, if you're updating from the September or October version to the November version. But if you're updating a much older version of Office, such as from the June to November version, binary delta compression isn't available.

## Use Group Policy to specify update settings

If you have Windows Server and Active Directory Domain Services (AD DS) deployed in your organization, you can configure update settings for Office LTSC 2021 by using Group Policy. To do this, download the most current [Administrative Template files (ADMX/ADML for Office)](https://www.microsoft.com/download/details.aspx?id=49030), which include the policy settings for Office LTSC 2021.

After you copy the Administrative Template files to AD DS, you'll find the update policy settings under Computer Configuration\Policies\Administrative Templates\Microsoft Office 2016 (Machine)\Updates in the Group Policy Management tool. You'll also find a description of how to configure each policy setting. For example, you can use the “Update path” Group Policy setting to specify where Office LTSC 2021 should look for updates.

## Update channel for Office LTSC 2021

Office uses the concept of update channels to determine which updates an installed version of Office receives. Update channel is a device-wide setting, which means that all Office products, including Project and Visio, installed on a device must be using the same update channel.

“PerpetualVL2021” is the **only** update channel available for Office LTSC Professional Plus 2021 and Office LTSC Standard 2021. The PerpetualVL2021 update channel is also available for volume licensed versions of Project 2021 and Visio LTSC 2021.

Volume licensed versions of Project 2021 and Visio LTSC 2021 can also use other update channels, such as Current Channel, Monthly Enterprise Channel, or Semi-Annual Enterprise Channel. The reason Project and Visio can use other update channels is so that they can be installed on a device along with Microsoft 365 Apps, which supports all those other channels. But even if Project and Visio use these other update channels, they'll still only receive security and quality updates each month, not any new features. For more information, see [Overview of update channels for Microsoft 365 Apps](../updates/overview-update-channels.md).

## Related articles

- [Overview of Office LTSC 2021](overview.md)
- [Deploy Office LTSC 2021](deploy.md)
