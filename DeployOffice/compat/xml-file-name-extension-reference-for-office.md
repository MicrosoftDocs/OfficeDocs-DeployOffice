---
title: "XML file name extension reference for Office"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: reference
ms.service: office-perpetual-itpro
ms.localizationpriority: medium
ms.collection: Tier2
description: "Learn about the XML file formats and their extensions that are used by Word, Excel, PowerPoint, and Visio."
ms.date: 03/01/2023
---

# XML file name extension reference for Office

***Applies to:*** *Office 2019, Office 2016*

XML file formats and their extensions are listed in the following tables for Word, Excel, PowerPoint, and Visio.
  
## XML file types for Word

The following table describes the file type, extension, and description for Word XML file formats.
  
**XML file types for Word**

|**Word file type**|**Extension**|**Description**|
|:-----|:-----|:-----|
|Word Document  <br/> |.docx  <br/> |The default Word file format. Can't store VBA macro code.  <br/> |
|Strict Open XML document  <br/> |.docx  <br/> |Conforms to the Strict profile of the Open XML standard (ISO/IEC 29500). This profile of Open XML doesn't allow a set of features that were designed specifically for backward-compatibility with existing binary documents, as specified in Part 4 of ISO/IEC 29500.  <br/> |
|Word Macro-Enabled Document  <br/> |.docm  <br/> |Uses the same basic XML format as the Word document format, but can store VBA macro code. This file type is created when VBA macro code is present in the file.  <br/> |
|Word Template  <br/> |.dotx  <br/> |The default format for a Word template. Created when document styles and formatting are saved. Can't store VBA macro code.  <br/> |
|Word Macro-Enabled Template  <br/> |.dotm  <br/> |Stores macro code for use with other Word documents. Does not always contain macro code, but is configured to support the storage of macro code. Word documents created from a macro-enabled template do not inherit the VBAProject part of the template. By default, documents are saved as .docx files even when they are created from a Word macro-enabled template.  <br/> |
   

## XML file types for Excel

The following table describes the file type, extension, and description for Excel XML file formats.
  
**XML file types for Excel**

|**Excel file type**|**Extension**|**Description**|
|:-----|:-----|:-----|
|Excel Workbook  <br/> |.xlsx  <br/> |The default Excel file format. Can't store VBA macro code or Microsoft Excel 4.0 macro sheets (.xlm files in Excel 4.0).  <br/> |
|Strict Open XML Spreadsheet  <br/> |.xlsx  <br/> |An ISO strict version of the Excel Workbook file format (.xlsx).  <br/> |
|Excel Macro-Enabled Workbook  <br/> |.xlsm  <br/> |Uses the same basic XML format as the Excel Workbook, but can store VBA macro code. Users who save an Excel workbook that has VBA code or Excel 4.0 macro sheets (.xlm files in Excel 4.0) are prompted to use this file format.  <br/> |
|Excel Template  <br/> |.xltx  <br/> |The default file format for an Excel template. Can't store VBA macro code or Excel 4.0 macro sheets (.xlm files in Excel 4.0).  <br/> |
|Excel Macro-Enabled Template  <br/> |.xltm  <br/> |Can contain a VBAProject part or Excel 4.0 macro sheets (.xlm files in Excel 4.0). Workbooks created from this template inherit the VBAProject part or Excel 4.0 macro sheets that exist in the template.  <br/> |
|Excel Add-In  <br/> |.xlam  <br/> |A supplemental program that runs additional code. Excel add-ins use the Open XML file format to store data, and they support using VBA projects and Excel 4.0 macro sheets.  <br/> |
   

## XML file types for PowerPoint

The following table describes the file type, extension, and description for PowerPoint XML file formats.
  
**XML file types for PowerPoint**

|**PowerPoint file type**|**Extension**|**Description**|
|:-----|:-----|:-----|
|PowerPoint Presentation  <br/> |.pptx  <br/> |The default PowerPoint XML format. Can't contain a VBAProject part (the part that stores VBA macro code) or Action settings.  <br/> |
|Strict Open XML Presentation  <br/> |.pptx  <br/> |An ISO strict version of the PowerPoint Presentation file format (.pptx).  <br/> |
|PowerPoint Macro-Enabled Presentation  <br/> |.pptm  <br/> |The same basic XML format as the PowerPoint XML presentation format, but can store VBA macro code. Users who save a PowerPoint XML presentation file that contains VBA macro code are prompted to use this file type.  <br/> |
|PowerPoint Template  <br/> |.potx  <br/> |An XML-based PowerPoint template. Created when a presentation does not have a VBAProject part and does not use Action settings.  <br/> |
|PowerPoint Macro-Enabled Template  <br/> |.potm  <br/> |Users who save a PowerPoint XML template that contains VBA macro code are prompted to use this file type. Presentations created from this template do not inherit the VBAProject part or Action settings.  <br/> |
|PowerPoint Add-In  <br/> |.ppam  <br/> |PowerPoint presentation designed to be run as a supplemental program. All PowerPoint add-ins are macro-enabled.  <br/> |
|PowerPoint Show  <br/> |.ppsx  <br/> |An XML-based PowerPoint auto-running slide show. Can't contain a VBAProject part.  <br/> |
|PowerPoint Macro-Enabled Show  <br/> |.ppsm  <br/> |An XML-based PowerPoint slide show file that contains a VBAProject part. Created when the auto-running slide show includes VBA macro code.  <br/> |
   

## XML file types for Visio

Visio uses the XML file format package that is defined by the Open Packaging Conventions (ISO/IEC 29500-2:2008) standard. The XML content is based on the existing Visio XML Drawing (VDX) format.
  
The following table describes the file type, extension, and description for Visio XML file formats.
  
**XML file types for Visio**

|**Visio file type**|**Extension**|**Description**|
|:-----|:-----|:-----|
|Visio Drawing  <br/> |.vsdx  <br/> |The default Visio file format. Can't store VBA macro code.  <br/> |
|Visio Macro-Enabled Drawing  <br/> |.vsdm  <br/> |Uses the same basic XML format as the Visio drawing format (.vsdx), but can store VBA macro code. This file type must be used when VBA macro code is present in the file.  <br/> |
|Visio Stencil  <br/> |.vssx  <br/> |The default format for a Visio stencil. Can't store VBA macro code.  <br/> |
|Visio Macro-Enabled Stencil  <br/> |.vssm  <br/> |Uses the same basic XML format as the Visio Stencil (.vssx) format, but can store VBA macro code. Does not always contain macro code, but is configured to support the storage of macro code.  <br/> |
|Visio Template  <br/> |.vstx  <br/> |The default format for a Visio template. Can't store VBA macro code.  <br/> |
|Visio Macro-Enabled Template  <br/> |.vstm  <br/> |Uses the same basic XML format as the Visio Template (.vstx) format, but can store VBA macro code. Does not always contain macro code, but is configured to support the storage of macro code. Visio Drawings that are created from this template inherit the VBAProject part that exists in the template. However, by default, drawings are saved as .vsdx files even when they are created from a Visio macro-enabled template and will drop the VBAProject part.  <br/> |
   
## Related topics

- [File format reference for Word, Excel, and PowerPoint](office-file-format-reference.md)
- [Guide to Office Telemetry Dashboard resources](compatibility-and-telemetry-in-office.md)
  

