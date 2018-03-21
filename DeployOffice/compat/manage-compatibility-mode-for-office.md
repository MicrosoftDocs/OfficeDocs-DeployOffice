---
title: "Manage compatibility mode for Office"
ms.author: danbrown
author: DHB-MSFT
manager: laurawi
ms.date: 12/20/2016
ms.audience: ITPro
ms.topic: get-started-article
ms.service: o365-proplus-itpro
localization_priority: Normal
ms.collection: Ent_O365
ms.custom: Ent_Office_Compat
ms.assetid: ddbc8b03-2ea7-4ef7-9403-48b882239582
description: "Introduces compatibility mode in Office and how to set the default behavior for Word."
---

# Manage compatibility mode for Office

 **Summary:** Introduces compatibility mode in Office and how to set the default behavior for Word. 
  
In Office, compatibility mode is used automatically to open Word, Excel, and PowerPoint documents that were created in earlier versions of these applications. Compatibility mode ensures that no new or improved features in Office are available while users work with a document so that people who use earlier versions of Office will have full editing capabilities. Compatibility mode also preserves the layout of the document.
  
> [!IMPORTANT]
> This article is part of [Compatibility and telemetry in Office](compatibility-and-telemetry-in-office.md). Use the roadmap as a starting point for articles, downloads, scripts, and videos that help you assess Office compatibility. > **Are you looking for compatibility information about individual Office applications?** You can find this information by searching for "Office compatibility" on [Office Support](https://support.office.com). 
  
## How Office 2016 uses compatibility mode

 Word, Excel, and PowerPoint use compatibility mode to open binary Office documents that were created in Office 2003 or earlier versions of Office. Word also uses compatibility mode to open OpenXML documents that were created in Word 2007 and Word 2010. 
  
## Set default compatibility mode on file creation (Word 2013 and 2016 only)

You can use the **Set default compatibility mode on file creation** policy setting to manage the default compatibility mode that Word uses to create new Word documents. This might be necessary if you have add-ins or macros that use the layout functions that are used in Word 2007 or Word 2010. When you enable this policy setting, you can specify which versions of Word (2003, 2007, 2010, 2013, or 2016) that new Word documents are compatible with. Several configurations options are available for this setting: 
  
- **Word 2003** This mode disables features in Word that are incompatible with Word 2003. 
    
- **Word 2007** This mode disables features in Word that are incompatible with Word 2007. 
    
- **Word 2010** This mode disables features in Word that are incompatible with Word 2010. 
    
- **Full functionality mode** This mode makes sure that all new features remain enabled. This is the default setting for Word 2013 and Word 2016. 
    
When you choose the Word 2003 option, Word is configured to create new Open XML files that have Word 2007, Word 2010, and Word 2013 features disabled. Doing so makes sure that the Open XML files do not contain content that Word 2003 users can't edit. However, users of Office 2003 must still have the Compatibility Pack installed before they can edit Word Open XML files that are compatible with Word 2003.
  
If you select **Full functionality mode**, there is no effect on the Word 2007 and Word 2010 users. They can open and edit Word 2013 and Word 2016 documents. The only difference is that new features in Word 2013 and Word 2016 are not available in Word 2007 or Word 2010.
  
You can download the Office Administrative Templates from the [Microsoft Download Center](https://go.microsoft.com/fwlink/p/?LinkId=626001). The **Set default compatibility mode on file creation** policy setting is located in the path Microsoft Word  *version*  \Word Options\Save. Where  *version*  is the version of Word for which you are setting the default compatibility mode. For example: 
  
 Microsoft Word 2016\Word Options\Save 
  
## See also

#### 

[Assess Office compatibility](assess-office-compatibility.md)

