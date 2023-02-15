---
title: "Set a preference to prevent the use of add-ins"
ms.author: pbowden
author: pbowden-msft
manager: dougeby
audience: ITPro
ms.topic: article
ms.service: o365-proplus-itpro
ms.subservice: office-mac
ms.localizationpriority: medium
ms.collection: tier3
recommendations: false
description: "Shows IT Pros how to set a preference to prevent users from installing and running add-ins for Office for Mac."
ms.date: 07/12/2021
---

# Set a preference to prevent the use of add-ins

***Applies to:*** *Office for Mac, Office LTSC for Mac 2021, Office 2019 for Mac*

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
> Neither of these preferences affect Office add-ins in the following versions of Outlook:
> - Outlook for Mac
> - Outlook LTSC for Mac 2021
> - Outlook 2019 for Mac

## Related articles

- [Configuration Profile Reference (Apple developer documentation)](https://developer.apple.com/business/documentation/Configuration-Profile-Reference.pdf)
- [Deploy preferences for Office for Mac](deploy-preferences-for-office-for-mac.md)