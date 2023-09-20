---
title: "Manage compatibility mode for Office"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: conceptual
ms.service: office-perpetual-itpro
ms.localizationpriority: medium
ms.collection: Tier2
description: "Provides an overview of compatibility mode in Office and how to set the default behavior for Word."
ms.date: 03/01/2023
---

# Manage compatibility mode for Office

***Applies to:*** *Office 2019, Office 2016*

In Office, compatibility mode is used automatically to open Word, Excel, and PowerPoint documents that were created in earlier versions of these applications. Compatibility mode ensures that no new or improved features in Office are available while users work with a document so that people who use earlier versions of Office will have full editing capabilities. Compatibility mode also preserves the layout of the document.
  
## How Office uses compatibility mode

 Word, Excel, and PowerPoint use compatibility mode to open binary Office documents that were created in Office 2003 or earlier versions of Office. Word also uses compatibility mode to open OpenXML documents that were created in Word 2007 and Word 2010. 
  
## Set default compatibility mode on file creation for Word

If you use Group Policy, you can use the **Set default compatibility mode on file creation** policy setting to manage the default compatibility mode that Word uses to create new Word documents. This might be necessary if you have add-ins or macros that use the layout functions that are used in Word 2007 or Word 2010. When you enable this policy setting, you can specify which versions of Word that new Word documents are compatible with. Several configurations options are available for this setting: 
  
- **Word 2003** This mode disables features in Word that are incompatible with Word 2003. 
    
- **Word 2007** This mode disables features in Word that are incompatible with Word 2007. 
    
- **Word 2010** This mode disables features in Word that are incompatible with Word 2010. 
    
- **Full functionality mode** This mode makes sure that all new features remain enabled. This is the default setting for Word. 
    
When you choose the Word 2003 option, Word is configured to create new Open XML files that have Word 2007 and later features disabled. Doing so makes sure that the Open XML files do not contain content that Word 2003 users can't edit. However, users of Office 2003 must still have the Compatibility Pack installed before they can edit Word Open XML files that are compatible with Word 2003.
  
If you select **Full functionality mode**, there is no effect on the Word 2007 and Word 2010 users. They can open and edit Word 2019, Word 2016, and Word 2013 documents. The only difference is that new features in Word 2013 and later are not available in Word 2007 or Word 2010.
  
You can download the Group Policy Administrative Templates files (ADMX/ADML) for Office from the [Microsoft Download Center](https://www.microsoft.com/download/details.aspx?id=49030). The **Set default compatibility mode on file creation** policy setting is located under User Configuration\\Policies\\Administrative Templates\\Microsoft Word 2016\\Word Options\\Save.
  
## Related topics

- [Assess Office compatibility](assess-office-compatibility.md)
- [Guide to Office Telemetry Dashboard resources](compatibility-and-telemetry-in-office.md)

