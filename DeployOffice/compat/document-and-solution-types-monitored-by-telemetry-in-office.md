---
title: "Document and solution types monitored by Office Telemetry Dashboard"
ms.author: danbrown
author: DHB-MSFT
manager: laurawi
ms.audience: ITPro
ms.topic: reference
ms.service: o365-proplus-itpro
localization_priority: Normal
ms.collection: Ent_O365
ms.custom: Ent_Office_Compat
description: "Lists document and solution types that are monitored by Office Telemetry Dashboard."
---

# Document and solution types monitored by Office Telemetry Dashboard

***Applies to:*** *Office 365 ProPlus, Office 2019, and Office 2016*

The following table lists the document and solution types that Office Telemetry Dashboard monitors in Office 2019 and Office 2016.
  

|**Type**|**Office Applications**|**Description**|
|:-----|:-----|:-----|
|Active Documents  <br/> |Word, PowerPoint, Excel  <br/> | Active documents are any Office document files that are not included in the other solution types that are listed in this table. This can include the following:  <br/>  <br/>- Office binary format files (.doc, .ppt, .pps, .xls)  <br/>  - Office OpenXML format files (.docx, .pptx, .ppsx, .xlsx)  <br/> - Macro-enabled files that contain VBA code (.docm, .dotm, .pptm, .potm, .xlsm, .xltm)  <br/>  - Files that contain ActiveX controls  <br/>  - Files that have External Data Connections  <br/> |
|COM add-ins  <br/> |Word, PowerPoint, Excel  <br/> |COM add-ins include Microsoft Office development tools in Microsoft Visual Studio 2010 application-level add-ins.  <br/> |
|Excel Automation add-ins  <br/> |Excel  <br/> |This solution type includes earlier versions of Excel-supported Automation add-ins, which are built upon COM add-ins. Functions in Automation add-ins can be called from formulas in Excel worksheets.  <br/> |
|Excel XLL add-ins  <br/> |Excel  <br/> |XLL add-ins (.xll) are specific to Excel and are built with any compiler that supports building DLLs (dynamic-link libraries). They do not have to be installed or registered. XLL add-ins also include DLLs that contain user-defined commands and functions.  <br/> |
|Excel XLS RTD add-ins  <br/> |Excel  <br/> |XLS real-time data (RTD) add-ins are Excel worksheets that use the RealTimeData worksheet function to call an Automation server to retrieve data in real-time.  <br/> |
|Word WLL add-ins  <br/> |Word  <br/> |WLL (.wll) add-ins are specific to Word and built with any compiler that supports building DLLs.  <br/> |
|Application add-ins  <br/> |Word, PowerPoint, Excel   <br/> |Application add-ins are application-specific files that contain VBA code. These include macro-enabled Word templates (.dotm), Excel add-ins (.xla, .xlam), and PowerPoint add-ins (.ppa, .ppam).  <br/> |
|Templates  <br/> |Word  <br/> |Templates include document (.dot, .dotx), worksheet (.xlt, .xltx), or presentation (.pot, .potx) templates that are attached to an Office file.  <br/> |
|apps for Office  <br/> |Word, PowerPoint, Excel  <br/> |These are apps for Office that are hosted in a task pane, content, or email within the client application. To learn more, see [Office Add-ins platform overview](https://docs.microsoft.com/office/dev/add-ins/overview/office-add-ins).  <br/> |
   
## Related topics

- [Compatibility and telemetry in Office](compatibility-and-telemetry-in-office.md)

