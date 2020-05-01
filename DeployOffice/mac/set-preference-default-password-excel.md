---
title: "Set a preference for trying a default decryption password in Excel for Mac"
ms.author: danbrown
author: DHB-MSFT
manager: laurawi
audience: ITPro
ms.topic: article
ms.service: o365-proplus-itpro
localization_priority: Normal
ms.collection: Ent_O365
ms.custom: Ent_Office_Mac
description: "Shows IT Pros how to set a preference for trying a default decryption password in Excel for Mac"
---

# Set a preference for trying a default decryption password in Excel for Mac

***Applies to:*** *Excel for Mac, Excel 2019 for Mac*

By default, when Excel opens an encrypted file, Excel tries to use a default password to decrypt the file. This preference prevents Excel, version 16.20 or later, from trying a default decryption password.

Use the following information to configure a policy:

|||
|:-----|:-----|
|**Domain** <br/> | com.microsoft.Excel  <br/> |
|**Key** <br/> |TryDefaultPassword  <br/> |
|**Data Type** <br/> |Boolean  <br/> |
|**Possible values** <br/> |No   <br/> Yes  *(default)* <br/> |


The following example sets the option so that Excel doesn't try a default password when opening an encrypted file:

```
defaults write com.microsoft.Excel TryDefaultPassword -bool No
```

This key is CFPreferences-compatible, which means that it can be set by using enterprise management software for Mac, such as Jamf Pro.
    
## Related topics

- [Configuration Profile Reference (Apple developer documentation)](https://go.microsoft.com/fwlink/p/?linkid=852998)
- [Deploy preferences for Office for Mac](deploy-preferences-for-office-for-mac.md)

