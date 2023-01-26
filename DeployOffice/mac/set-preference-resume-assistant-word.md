---
title: "Set a preference for Resume Assistant in Word for Mac"
ms.author: pbowden
author: pbowden-msft
manager: dougeby
audience: ITPro
ms.topic: article
ms.service: o365-proplus-itpro
ms.subservice: office-mac
ms.localizationpriority: medium
ms.collection: Ent_O365
recommendations: false
description: "Shows IT Pros how to set a preference for Resume Assistant in Word for Mac"
ms.date: 05/04/2018
---

# Set a preference for Resume Assistant in Word for Mac

***Applies to:*** *Office for Mac*

In Word for Mac, the icon for [Resume Assistant](https://support.microsoft.com/office/444ff6f0-ef74-4a9c-9091-ffd7a9d1917a) will appear on the Review tab if you are running version 16.13 or later, as shown in the following screenshot.

![Screenshot of Resume Assistant icon in the Word for Mac ribbon.](../images/resume-assistant-ribbon.png)

> [!NOTE]
> Resume Assistant is only available to Microsoft 365 (and Office 365) subscribers.

If you're an admin, you may want to prevent this option from being shown to users. Use the following information to configure a policy:

|Category|Details|
|:-----|:-----|
|**Domain** <br/> | com.microsoft.Word  <br/> |
|**Key** <br/> |DisableResumeAssistant  <br/> |
|**Data Type** <br/> |Boolean  <br/> |
|**Possible values** <br/> |false  *(default)*  <br/> true  <br/> |

This key is CFPreferences-compatible, which means that it can be set by using enterprise management software for Mac, such as Jamf Pro.

## Related articles

- [Configuration Profile Reference (Apple developer documentation)](https://developer.apple.com/business/documentation/Configuration-Profile-Reference.pdf)
- [Deploy preferences for Office for Mac](deploy-preferences-for-office-for-mac.md)