---
title: "Update Office LTSC 2024"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: conceptual
ms.service: office-perpetual-itpro
ms.localizationpriority: medium
ms.collection: Tier1
recommendations: false
description: "Provides IT admins with information on how to update Office Long Term Service Channel (LTSC) 2024."
ms.date: 09/16/2024
---

# Update Office LTSC 2024

Once you deploy Office LTSC 2024, including Project and Visio, it's important to keep it up to date. Microsoft regularly releases security updates and quality improvements, including updates that enhance stability and performance. Office LTSC 2024 typically receives updates once a month, typically on the second Tuesday.

> [!NOTE]
> Office LTSC 2024 doesn't receive new features after it's released. To access new Office features on an ongoing basis, consider transitioning to a Microsoft 365 (or Office 365) plan that includes Office.

Office LTSC 2024 uses Click-to-Run technology, rather than Windows Installer (MSI), for installation and updates.

## How Office LTSC 2024 gets updated

<!--Using include for how-office-updates-->
[!INCLUDE[how-office-updates.md](../../includes/how-office-updates.md)]

## How updates work in Office LTSC 2024

Updates in Office LTSC 2024 are managed the same as in Office LTSC 2021 but differ significantly from MSI-based updates used in earlier versions of Office. In Office LTSC 2024, updates are cumulative, meaning the latest version available on the Office CDN includes all previous security and quality updates. This approach ensures that Office is up to date when you download and install it from the Office CDN, so you don’t need to apply updates or service packs.

Unlike in earlier MSI-based versions, there are no separate downloads for security or quality updates; they're included in each new build posted on the Office CDN. As a result, Microsoft Update or Windows Server Update Services (WSUS) isn't used by itself to update Office LTSC 2024. However, Microsoft Configuration Manager can be used to manage how and when updates are applied, and where they're sourced from.

<a id="update-location"></a>
## Configure where Office LTSC 2024 gets updates from

<!--Using include for where-office-updates-from-->
[!INCLUDE[where-office-updates-from.md](../../includes/where-office-updates-from.md)]

For more information, see [Deploy Office LTSC 2024](deploy.md)

## Check for updates for Office LTSC 2024

<!--Using include for check-for-office-updates-->
[!INCLUDE[check-for-office-updates.md](../../includes/check-for-office-updates.md)]

## Size of updates for Office LTSC 2024

<!--Using include for office-update-size-->
[!INCLUDE[office-update-size.md](../../includes/office-update-size.md)]

## Use Group Policy to specify update settings

<!--Using include for ad-ds-group-policy-->
[!INCLUDE[ad-ds-group-policy.md](../../includes/ad-ds-group-policy.md)]

## Update channel for Office LTSC 2024

Office uses the concept of update channels to determine which updates an installed version of Office receives. The update channel is a device-wide setting, meaning all Office products, including Project and Visio, installed on a device must use the same update channel.

"PerpetualVL2024" is the **only** update channel available for Office LTSC Professional Plus 2024 and Office LTSC Standard 2024. The PerpetualVL2024 update channel is also available for volume licensed versions of Project 2024 and Visio LTSC 2024.

Volume licensed versions of Project 2024 and Visio LTSC 2024 can also use other update channels, such as Current Channel, Monthly Enterprise Channel, or Semi-Annual Enterprise Channel. The reason Project and Visio can use these other update channels is to ensure compatibility when installed on a device alongside Microsoft 365 Apps, which support all these channels. Even if Project and Visio use different update channels, they only receive security and quality updates each month, without any new features.

For more information, see [Overview of update channels for Microsoft 365 Apps](/microsoft-365-apps/updates/overview-update-channels).

## Related articles

- [Overview of Office LTSC 2024](overview.md)
- [Deploy Office LTSC 2024](deploy.md)
