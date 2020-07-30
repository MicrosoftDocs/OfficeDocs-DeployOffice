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

## Overview

Update exclusions can be created to prevent devices from downloading security and feature updates during specific dates. Update exclusions allow you to reduce change in your environment during busy periods, such as during tax season or at the end of the financial year.

Manual actions taken through Action Center such as Target Version, as well as end-user changes are unaffected by update exclusion dates.

> [!NOTE]
> Update exclusions prevent security and feature updates from downloading. If you also want to prevent updates from being installed during an exclusion period, consider setting an earlier start date and enforcing installations with an [update deadline](update-deadline.md).

## Limitations

Update exclusion dates begin and end at 00:00 UTC on the specified dates and are not based on local device time.
