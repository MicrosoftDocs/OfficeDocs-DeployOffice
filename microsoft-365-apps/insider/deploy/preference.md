---
title: "Provide Mac users with Microsoft 365 Insider by using a preference"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: how-to
ms.service: o365-proplus-itpro
ms.localizationpriority: medium
ms.collection: Tier1
recommendations: false
description: "Provides steps for admins to use a preference to select the Microsoft 365 Insider channel for their Mac users."
ms.date: 02/05/2024
---

# Provide Mac users with Microsoft 365 Insider by using a preference

As the admin, you might want to choose which Mac users have Microsoft 365 Insider. You can make that choice by using a preference.

The following table provides the information needed to set the preference.

|Category|Details|
|:-----|:-----|
|Domain | com.microsoft.autoupdate2  |
|Key |ChannelName  |
|Possible values |Current <br/> Preview <br/> Beta |

For example, if you want certain Mac users to have Current Channel (Preview), set the value to Preview. If you no longer want Mac users to have Microsoft 365 Insider, change the value to Current.

> [!NOTE]
> - Keep in mind that Beta Channel isn't supported.
> - This key is CFPreferences-compatible, which means that it can be set by using enterprise management software for Mac, such as Jamf Pro.
> - If you want to let your Mac users choose their Microsoft 365 Insider channel for themselves, they can use [Microsoft AutoUpdate](microsoft-autoupdate.md). 

## Related articles
- [Compare Microsoft 365 Insider channels](../compare-channels.md)
- [Deploy preferences for Office for Mac](../../mac/deploy-preferences-for-office-for-mac.md)
- [Deploy updates for Office for Mac](../../mac/deploy-updates-for-office-for-mac.md)