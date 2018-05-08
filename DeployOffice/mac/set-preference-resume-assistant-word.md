---
title: "Set a preference for Resume Assistant in Word 2016 for Mac"
ms.author: danbrown
author: pbowden-msft
manager: laurawi
ms.audience: ITPro
ms.topic: article
ms.service: o365-proplus-itpro
localization_priority: Normal
ms.collection: Ent_O365
ms.custom: Ent_Office_Mac
description: "Shows IT Pros how to set a preference for Resume Assistant in Word 2016 for Mac"
---

# Set a preference for Resume Assistant in Word 2016 for Mac
In Office 2016 for Mac, the Resume Assistant icon will appear in Word's Review tab if you are running 16.13 or later - as seen in the following screen shot:

![Screenshot of Resume Assistant icon in the Word 2016 for Mac ribbon](../images/resume-assistant-ribbon.png)

<<< NOTE to Dan: Insert Resume-DOCS.png here >>>

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

[Deploy preferences for Office 2016 for Mac](deploy-preferences-for-office-for-mac.md)

