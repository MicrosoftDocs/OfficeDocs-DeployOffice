---
title: "Update exclusion dates"
ms.author: danbrown
author: DHB-MSFT
manager: laurawi
audience: ITPro
ms.topic: article
ms.service: o365-proplus-itpro
localization_priority: None
ROBOTS: NOINDEX, NOFOLLOW
hideEdit: true
---

# Update exclusion dates

> [!IMPORTANT]
> This is pre-release documentation for a preview program that isn’t available to everyone and is subject to change.

You can set update exclusion dates to prevent devices from downloading security and feature updates during specific dates. This allows you to reduce change in your environment by preventing downloads during busy periods, such as during tax season or over a holiday period.

Update exclusions only prevent devices from downloading security and feature updates during the exclusion dates. Manual actions taken through Action Center, such as Target Version, and end-user changes are unaffected by update exclusion dates.

> [!NOTE]
> While devices are prevented from downloading security and feature updates, devices may still install updates during update exclusion dates. If you don't want devices to install update during exclusion dates, consider setting an earlier start date and enforcing an [update deadline](update-deadlines.md) to ensure downloaded updates are installed before the update exclusion begins.

## Best practices

Update exclusion dates are a scheduled process and shouldn't be used to instantly pause and resume updates. Update exclusion dates be created several days before the start date to ensure all devices receive the signal to prevent downloads during these dates, and if an update exclusion is deleted while in progress it may take several hours for devices to begin receiving updates again.

## Limitations

Update exclusion dates targeted to AAD groups reflect group membership when the exclusion was created. Users added to the AAD group after the exclusion is created won't be impacted by the exclusion and users that leave the AAD group will still be impacted by the exclusion unless the exclusion is deleted and re-created.

Update exclusion dates begin and end at 00:00 UTC on the dates specified, not based on local device time.
