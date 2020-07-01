---
title: "Update exclusion dates"
ms.author: johmark
author: johmarkMSFT
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

You can set update exclusion dates to prevent devices from downloading security and feature updates during specific dates. Update exclusions allow you to reduce change in your environment during busy periods, such as during tax season or at the end of the financial year.

Update exclusions only prevent devices from downloading security and feature updates during the exclusion dates. Manual actions taken through Action Center, such as Target Version, and end-user changes are unaffected by update exclusion dates.

> [!NOTE]
> While devices are prevented from downloading security and feature updates, devices may still install updates during update exclusion dates. If you don't want devices to install update during exclusion dates, consider setting an earlier start date and enforcing an [update deadline](update-deadline.md) to ensure downloaded updates are installed before the update exclusion begins.

Update exclusion dates are a scheduled process and shouldn't be used to instantly pause and resume updates. Create update exclusion dates several days before the start date to ensure all devices receive the signal to prevent downloads during these dates. If an update exclusion is deleted while in progress, it may take several hours for devices to begin receiving updates again.

## Limitations and known issues

Update exclusions that are targeted to Azure Active Directory (AAD) groups may not always reflect the current group memberships. Group changes are recomputed when new builds are released and when changes are made to the Servicing Profile like adding or removing devices.

<!--
When update exclusions are targeted to Azure Active Directory (AAD) groups, the devices impacted by the exclusion will reflect group membership when the exclusion was created. Exclusion dates won't impact users added to targeted AAD groups after the exclusion is created. Exclusion dates will still impact users that leave targeted AAD groups after the exclusion was created, unless the exclusion is deleted and re-created.
-->

Update exclusion dates begin and end at 00:00 UTC on the specified dates and are not based on local device time.
