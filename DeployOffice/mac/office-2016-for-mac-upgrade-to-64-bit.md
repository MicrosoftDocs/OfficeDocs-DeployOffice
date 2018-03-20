---
title: "Office 2016 for Mac upgrade to 64-bit"
ms.author: danbrown
author: DHB-MSFT
manager: laurawi
ms.date: 12/20/2016
ms.audience: ITPro
ms.topic: get-started-article
ms.service: o365-proplus-itpro
localization_priority: Normal
ms.collection: Ent_O365
ms.custom: Ent_Office_Mac
ms.assetid: 81d318e3-e19d-4734-8485-a067a3c0068f
description: "Provides information to admins about Office 2016 for Mac changing to 64-bit."
---

# Office 2016 for Mac upgrade to 64-bit

Apple has long encouraged application developers to adopt the 64-bit runtime environment, and we've been hearing from customers that 64-bit versions of Office for Mac are desirable to enable larger address spaces, better performance, and new innovative features. The Office for Mac team has been working on the transition and we're currently preparing to release the Office apps in full 64-bit.
  
If you're an Office Insider for Office 2016 for Mac, you can get going right away and give the 64-bit version a try today. [Learn how to become an Office Insider.](https://support.microsoft.com/kb/3136076)
  
## What does this change mean for me?

- If you use Office 2016 for Mac but don't use any add-ins, you should be unaffected by this change.
    
- If you use or develop add-ins in Office 2016 for Mac, you may need to update those add-ins to 64-bit.
    
> [!NOTE]
> If you use the Thomson Reuters EndNote Cite While You Write (CWYW) add-in for Word 2016 for Mac, and you need a 64-bit version of the add-in, consider joining the [EndNote beta testing program](https://endnote.com/betasignup). Once you sign up, you'll receive a beta version of the 64-bit CWYW add-in. Any feedback you provide will help ensure that the add-in for EndNote is fully compatible with the 64-bit version of Word 2016 for Mac. 
  
## I develop add-ins or write VBA for Office 2016 for Mac. What do I need to know?

- The primary impact of this change is to compiled add-ins. Office add-ins (add-ins using the JavaScript-based APIs) are not impacted by this change.
    
- The work required to update your add-ins for 64-bit will vary based on the code.
    
- For example, any use of VBA's DECLARE statement to load external functions in compiled dynamic libraries will require that those libraries support 64-bit. The VBA code itself will continue to work as VBA is transitioned to 64-bit, but you'll need to update the external libraries.
    
If you need guidance on making this transition or have additional questions, please let us know by emailing [Office64@microsoft.com](mailto:Office64@microsoft.com) and we'll be glad to help. 
  

