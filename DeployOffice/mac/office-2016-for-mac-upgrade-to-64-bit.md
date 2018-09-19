---
title: "Office for Mac upgrade to 64-bit"
ms.author: danbrown
author: DHB-MSFT
manager: laurawi
ms.date: 09/24/2018
ms.audience: ITPro
ms.topic: get-started-article
ms.service: o365-proplus-itpro
localization_priority: Normal
ms.collection: Ent_O365
ms.custom: Ent_Office_Mac
description: "Provides information to admins about Office for Mac changing to 64-bit."
---

# Office for Mac upgrade to 64-bit

**Applies to:** *Office for Mac, Office 2019 for Mac, Office 2016 for Mac*
*Applies to: Office for Mac, Office 2019 for Mac, Office 2016 for Mac*

Apple has long encouraged application developers to adopt the 64-bit runtime environment, and we've been hearing from customers that 64-bit versions of Office for Mac are desirable to enable larger address spaces, better performance, and new innovative features. All releases of Office for Mac after August 22, 2016 are 64-bit only.
  
## What does this change mean for me?

- If you use Office for Mac but don't use any add-ins, you should be unaffected by this change.
    
- If you use or develop add-ins in Office for Mac, you may need to update those add-ins to 64-bit.
    

## I develop add-ins or write VBA for Office for Mac. What do I need to know?

- The primary impact of this change is to compiled add-ins. Office add-ins (add-ins using the JavaScript-based APIs) are not impacted by this change.
    
- The work required to update your add-ins for 64-bit will vary based on the code.
    
- For example, any use of VBA's DECLARE statement to load external functions in compiled dynamic libraries will require that those libraries support 64-bit. The VBA code itself will continue to work as VBA is transitioned to 64-bit, but you'll need to update the external libraries.
    
If you need guidance on making this transition or have additional questions, please let us know by emailing [Office64@microsoft.com](mailto:Office64@microsoft.com) and we'll be glad to help. 
  

