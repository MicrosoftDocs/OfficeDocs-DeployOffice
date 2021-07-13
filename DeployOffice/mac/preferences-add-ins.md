---
title: "Set a preference to prevent the use of add-ins"
ms.author: danbrown
author: pbowden-msft
manager: laurawi
audience: ITPro
ms.topic: article
ms.service: o365-proplus-itpro
localization_priority: Normal
ms.collection: Ent_O365
ms.custom: Ent_Office_Mac
recommendations: false
description: "Shows IT Pros how to set a preference to prevent users from installing and running add-ins for Office for Mac."
---

# Set a preference to prevent the use of add-ins

***Applies to:*** *Office for Mac, Office 2019 for Mac*

If you’re an admin, you may want to prevent Mac users from installing and running Office add-ins for Word, Excel, and PowerPoint. To do that, configure a preference using the following information.

|Category|Details|
|:-----|:-----|
|Domain | com.microsoft.office  |
|Key |OfficeWebAddinDisableOMEXCatalog  |
|Data type|Boolean|
|Possible values |false  *(default)*  <br/> true |
|Availability|16.29 or later |

Setting the key to `true` also disables default add-ins including Wikipedia, Bing Maps, People Graph, and Microsoft Visio Data Visualizer. Users are still able to run admin-managed add-ins.

If you want to disable all add-ins from running, even add-ins that are admin-managed, configure the following preference.

|Category|Details|
|:-----|:-----|
|Domain  | com.microsoft.office  |
|Key|OfficeWebAddinDisableAllCatalogs  |
|Data type|Boolean|
|Possible values|false  *(default)*  <br/> true |
|Availability|16.29 or later |

These preferences are CFPreferences-compatible, which means that they can be set using enterprise management software for Mac, such as Jamf Pro.

> [!NOTE]
> Neither of these preferences affect Office add-ins in Outlook for Mac or Outlook 2019 for Mac.


## Related articles

- [Configuration Profile Reference (Apple developer documentation)](https://go.microsoft.com/fwlink/p/?linkid=852998)
- [Deploy preferences for Office for Mac](deploy-preferences-for-office-for-mac.md)