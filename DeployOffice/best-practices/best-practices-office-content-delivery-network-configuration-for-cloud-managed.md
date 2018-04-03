---
title: "Best practices Office Content Delivery Network configuration for cloud managed"
ms.author: jwhit
author: jwhit-MSFT
manager: laurawi
ms.date: 9/15/2017
ms.audience: ITPro
ms.topic: concetpual
ms.service: o365-proplus-itpro
localization_priority: Normal
ms.collection: Ent_O365
ms.custom:
- Ent_Office_ProPlus_Best
- Ent_Office_ProPlus
ms.assetid: c5aa7b52-77a0-464d-a295-5ee8e9a08f61
description: "The Best Practices Guide includes deployment recommendations and real-world examples from the Office 365 Product Group and delivery experts from Microsoft Services. For a list of all the articles, see Best practices."
---

# Best practices: Office Content Delivery Network configuration for cloud managed

 *The Best Practices Guide includes deployment recommendations and real-world examples from the Office 365 Product Group and delivery experts from Microsoft Services. For a list of all the articles, see [Best practices](best-practices.md).* 
  
 *Cloud Managed*  will use the Office Content Delivery Network (CDN) for the source files to deploy the Office 365 ProPlus packages. However, they will utilize automation scripts for OffScrub and to initiate the Office 365 ProPlus deployment.
  
The Office 365 configuration script does the following:
  
- Run OffScrub
    
  - Remove all Office 2010 MSI components if found
    
  - Remove Office 2013 MSI core suite if found, but leave 2013 Project and Visio intact if previously installed
    
  - Leave user data in place
    
- Install Office 365 ProPlus with proper channel, architecture, and languages from Office CDN
    
## OffScrub

The following table includes the OffScrub Command lines that  *Cloud Managed*  used for the script sequence to remove previous versions of Office:
  
|||
|:-----|:-----|
|**Context for program** <br/> |**Command line** <br/> |
|Office 2010 Removal  <br/> |Command prompt cscript Offscrub2010.vbs clientall /bypass 1 /log c:\\temp /nocancel /q  <br/> |
|Office 2013 MSI Removal  <br/> |Command prompt cscript OffScrub2013.vbs ProPlus /bypass 1 /log c:\\temp /nocancel /q  <br/> |
   
## Office source location

 *Cloud Managed*  will utilize scripts to complete the Office 365 client configurations. The following is an example of the Office source location for Cloud Managed 32-bit Semi-Annual Channel. It includes the ODT setup.exe, Office 365 client install XML files, and corresponding batch files.
  
![Cloud managed source locations](../images/82dbed0c-d6d1-42fc-bb05-2556189be01b.png)
  
An example batch file for the package is as follows:
  
|||
|:-----|:-----|
|**Context for program** <br/> |**Command line** <br/> |
|Semi-Annual Channel 32-bit  <br/> |Setup.exe /configure Install_ProPlus_SAC.xml  <br/> |
   

