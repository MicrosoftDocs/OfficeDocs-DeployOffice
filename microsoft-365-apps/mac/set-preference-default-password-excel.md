---
title: "Set a preference for trying a default decryption password in Excel for Mac"
ms.author: geokri
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: reference
ms.service: o365-proplus-itpro
ms.subservice: office-mac
ms.localizationpriority: medium
ms.collection: Tier3
recommendations: false
description: "Shows IT Pros how to set a preference for trying a default decryption password in Excel for Mac"
ms.date: 09/18/2024
---

# Set a preference for trying a default decryption password in Excel for Mac

***Applies to:*** *Excel for Mac, Excel Long Term Service Channel (LTSC) for Mac 2024, Excel LTSC for Mac 2021*

By default, when Excel opens an encrypted file, Excel tries to use a default password to decrypt the file. This preference prevents Excel, version 16.20 or later, from trying a default decryption password.

Use the following information to configure a policy:

|Category|Details|
|:-----|:-----|
|**Domain** <br/> | com.microsoft.Excel  <br/> |
|**Key** <br/> |TryDefaultPassword  <br/> |
|**Data Type** <br/> |Boolean  <br/> |
|**Possible values** <br/> |No   <br/> Yes  *(default)* <br/> |

The following example sets the option so that Excel doesn't try a default password when opening an encrypted file:

```console
defaults write com.microsoft.Excel TryDefaultPassword -bool No
```

This key is CFPreferences-compatible, which means that it can be set by using enterprise management software for Mac, such as Jamf Pro.

## Related articles

- [Configuration Profile Reference (Apple developer documentation)](https://developer.apple.com/business/documentation/Configuration-Profile-Reference.pdf)
- [Deploy preferences for Office for Mac](deploy-preferences-for-office-for-mac.md)

