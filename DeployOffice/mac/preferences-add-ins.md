---
title: "Set a preference to prevent access to add-ins"
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

# Set a preference to prevent access to add-ins


If you’re an admin, you may want to prevent Mac users from installing and running Office add-ins for Word, Excel, and PowerPoint. To do that, you can use the following information to configure a policy:

|Category|Details|
|:-----|:-----|
|**Domain**  | com.microsoft.office  |
|**Key** |OfficeWebAddinDisableOMEXCatalog  |
|**Data type**|Boolean|
|**Possible values** <br/> |false  *(default)*  <br/> true |

Setting the key to `true` will also disable default add-ins including Wikipedia, Bing Maps, People Graph, and Microsoft Visio Data Visualizer. However, users will still be able to run admin-managed add-ins.

If you want to disable all add-ins from running, even add-ins that are admin-managed, configure the following policy:

|Category|Details|
|:-----|:-----|
|**Domain**  | com.microsoft.office  |
|**Key** |OfficeWebAddinDisableAllCatalogs  |
|**Data type**|Boolean|
|**Possible values** <br/> |false  *(default)*  <br/> true |

These policies are CFPreferences-compatible, which means that they can be set using enterprise management software for Mac, such as Jamf Pro.

> [!NOTE]
> The policies listed in this article do not affect Office add-ins in Microsoft Outlook for Mac.


## Related articles

- [Configuration Profile Reference (Apple developer documentation)](https://go.microsoft.com/fwlink/p/?linkid=852998)
- [Deploy preferences for Office for Mac](deploy-preferences-for-office-for-mac.md)