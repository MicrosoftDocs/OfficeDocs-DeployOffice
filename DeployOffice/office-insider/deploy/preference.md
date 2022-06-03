---
title: "Provide Mac users with Office Insider by using a preference"
ms.author: danbrown
author: DHB-MSFT
manager: dougeby
audience: ITPro
ms.topic: how-to
ms.service: o365-proplus-itpro
ms.localizationpriority: medium
ms.collection: Ent_O365
ms.custom: Office_Insider
recommendations: false
description: "Provides steps for Office admins to use a preference to select the Office Insider channel for their Mac users."
---

# Provide Mac users with Office Insider by using a preference

As the admin, you might want to choose which Mac users have Office Insider. You can make that choice by using a preference.

The following table provides the information needed to set the preference.

|Category|Details|
|:-----|:-----|
|Domain | com.microsoft.autoupdate2  |
|Key |ChannelName  |
|Possible values |Current <br/> Preview <br/> Beta |

For example, if you want certain Mac users to have Current Channel (Preview), set the value to Preview. If you no longer want Mac users to have Office Insider, change the value to Current.

> [!NOTE]
> - Keep in mind that Beta Channel isn't supported.
> - This key is CFPreferences-compatible, which means that it can be set by using enterprise management software for Mac, such as Jamf Pro.
> - If you want to let your Mac users choose their Office Insider channel for themselves, they can use [Microsoft AutoUpdate](microsoft-autoupdate.md). 

## Related articles
- [Compare Office Insider channels](../compare-channels.md)
- [Deploy preferences for Office for Mac](../../mac/deploy-preferences-for-office-for-mac.md)
- [Deploy updates for Office for Mac](../../mac/deploy-updates-for-office-for-mac.md)