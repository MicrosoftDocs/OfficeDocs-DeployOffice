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

<!--Using include for how-office-updates-->
[!INCLUDE[how-office-updates.md](../../includes/how-office-updates.md)]

## How updates are different in Office LTSC 2021

Since Click-to-Run handles updates differently than Windows Installer (MSI), here are some things you need to be aware of if you're used to MSI-based updates.

- There are no separate downloads for security or quality updates. These updates are already included as part of a new build of Office LTSC 2021 that’s posted on the Office CDN.
- Updates are cumulative, so the latest version of Office LTSC 2021 available on the Office CDN includes all the security and quality updates from all the previous versions of Office LTSC 2021.
- When you download and install Office LTSC 2021 from the Office CDN, it’s up to date already. You don’t have to download and apply any additional updates or service packs before you can start using Office LTSC 2021.
- Since updates are cumulative and already included in the latest version of Office LTSC 2021 on the Office CDN, you don’t use Microsoft Updates or Windows Server Updates Services (WSUS) by itself to update Office LTSC 2021. But you can use Microsoft Configuration Manager to help you deploy and manage updates to Office LTSC 2021, including controlling when and from where updates are applied.

<a id="update-location"></a>
## Configure where Office LTSC 2021 gets updates from

<!--Using include for how-office-updates-->
[!INCLUDE[where-office-updates-from.md](../../includes/where-office-updates-from.md)]

For more information, see [Deploy Office LTSC 2021](deploy.md)

## Check for updates for Office LTSC 2021

<!--Using include for check-for-office-updates-->
[!INCLUDE[check-for-office-updates.md](../../includes/check-for-office-updates.md)]

## Size of updates for Office LTSC 2021

<!--Using include for office-update-size-->
[!INCLUDE[office-update-size.md](../../includes/office-update-size.md)]

## Use Group Policy to specify update settings

<!--Using include for ad-ds-group-policy-->
[!INCLUDE[ad-ds-group-policy.md](../../includes/ad-ds-group-policy.md)]

## Update channel for Office LTSC 2021

Office uses the concept of update channels to determine which updates an installed version of Office receives. Update channel is a device-wide setting, which means that all Office products, including Project and Visio, installed on a device must be using the same update channel.

“PerpetualVL2021” is the **only** update channel available for Office LTSC Professional Plus 2021 and Office LTSC Standard 2021. The PerpetualVL2021 update channel is also available for volume licensed versions of Project 2021 and Visio LTSC 2021.

Volume licensed versions of Project 2021 and Visio LTSC 2021 can also use other update channels, such as Current Channel, Monthly Enterprise Channel, or Semi-Annual Enterprise Channel. The reason Project and Visio can use other update channels is so that they can be installed on a device along with Microsoft 365 Apps, which supports all those other channels. But even if Project and Visio use these other update channels, they'll still only receive security and quality updates each month, not any new features. 

For more information, see [Overview of update channels for Microsoft 365 Apps](/microsoft-365-apps/updates/overview-update-channels).

## Related articles

- [Overview of Office LTSC 2021](overview.md)
- [Deploy Office LTSC 2021](deploy.md)
