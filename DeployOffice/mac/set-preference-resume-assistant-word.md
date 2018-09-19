---
title: "Set a preference for Resume Assistant in Word for Mac"
ms.author: danbrown
author: pbowden-msft
manager: laurawi
ms.date: 9/24/2018
ms.audience: ITPro
ms.topic: article
ms.service: o365-proplus-itpro
localization_priority: Normal
ms.collection: Ent_O365
ms.custom: Ent_Office_Mac
description: "Shows IT Pros how to set a preference for Resume Assistant in Word for Mac"
---

# Set a preference for Resume Assistant in Word for Mac

***Applies to:*** *Office for Mac*

In Word for Mac, the icon for [Resume Assistant](https://support.office.com/article/444ff6f0-ef74-4a9c-9091-ffd7a9d1917a) will appear on the Review tab if you are running version 16.13 or later, as shown in the following screen shot.

![Screenshot of Resume Assistant icon in the Word for Mac ribbon](../images/resume-assistant-ribbon.png)

> [!NOTE]
> Resume Assistant is only available to Office 365 subscribers.

If you're an admin, you may want to prevent this option from being shown to users. Use the following information to configure a policy:

|||
|:-----|:-----|
|**Domain** <br/> | com.microsoft.Word  <br/> |
|**Key** <br/> |DisableResumeAssistant  <br/> |
|**Data Type** <br/> |Boolean  <br/> |
|**Possible values** <br/> |false  *(default)*  <br/> true  <br/> |

This key is CFPreferences-compatible, which means that it can be set by using enterprise management software for Mac, such as Jamf Pro.
    
## See also

[Configuration Profile Reference (Apple developer documentation)](https://go.microsoft.com/fwlink/p/?linkid=852998)

[Deploy preferences for Office for Mac](deploy-preferences-for-office-for-mac.md)

