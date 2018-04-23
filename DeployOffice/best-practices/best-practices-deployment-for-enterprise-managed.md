---
title: "Best practices Deployment for enterprise managed"
ms.author: jwhit
author: jwhit-MSFT
manager: laurawi
ms.date: 9/9/2017
ms.audience: ITPro
ms.topic: concetpual
ms.service: o365-proplus-itpro
localization_priority: Priority
ms.collection:
- Ent_O365
- Strat_O365_ProPlus
ms.custom:
- Ent_Office_ProPlus_Best
- Ent_Office_ProPlus
ms.assetid: 2f560823-aa43-4003-8f79-2750d3944060
description: "The Best Practices Guide includes deployment recommendations and real-world examples from the Office 365 Product Group and delivery experts from Microsoft Services. For a list of all the articles, see Best practices."
---

# Best practices: Deployment for enterprise managed

 *The Best Practices Guide includes deployment recommendations and real-world examples from the Office 365 Product Group and delivery experts from Microsoft Services. For a list of all the articles, see [Best practices](best-practices.md).* 
  
Now that  *Enterprise Managed*  has gone through Assessment and Planning, it is time to deploy the software.
  
## Download the Office 365 ProPlus files for redistribution

 *Enterprise Managed*  will download the latest version of the[Office Deployment Tool (ODT)](https://www.microsoft.com/en-us/download/details.aspx?id=49117) and use the ODT setup.exe in download mode, in combination with the download XML files, to download the latest Office 365 client source files. The downloaded source files must be for 32-bit Semi-Annual Channel and Semi-Annual Channel (Targeted) builds, Project Pro, Visio Pro, 64-bit Semi-Annual Channel builds, and all supported languages for the Office 365 clients.
  
The specific downloads are listed in the following table:
  
|||
|:-----|:-----|
|**Package** <br/> |**Languages** <br/> |
|Office 365 ProPlus - Semi-Annual Channel - 32-bit  <br/> |English, French, Spanish, Portuguese, Chinese (Simplified), Chinese, Indonesian, Japanese, Korean, Malay, Thai, Czech, Danish , Dutch, Finnish, German, Greek  <br/> |
|Visio Pro Volume Licensed (VL) - Semi-Annual Channel - 32-bit  <br/> |English  <br/> |
|Project Pro Volume Licensed (VL) - Semi-Annual Channel - 32-bit  <br/> |English  <br/> |
|Office 365 ProPlus - Semi-Annual Channel - 64-bit  <br/> |English  <br/> |
|Office 365 ProPlus, Project Pro (VL), and Visio Pro (VL) - Semi-Annual Channel (Targeted) - 32-bit  <br/> |English  <br/> |
   
For examples, see [Best practices: Download XML files for enterprise managed](best-practices-download-xml-files-for-enterprise-managed.md).
  
## Configure the deployment files

 *Enterprise Managed*  will edit the XML files for the deployment. *Enterprise Managed*  made several install XML files, that together with the Office 365 client source files that were previously downloaded, configure and install Office 365 ProPlus.
  
> [!NOTE]
> Use [GitHub](http://officedev.github.io/Office-IT-Pro-Deployment-Scripts/XmlEditor.html) to edit the XML files.
  
The following XML files must be created:
  
||||
|:-----|:-----|:-----|
|**XML file** <br/> |**Languages** <br/> |**Exclusions/additions** <br/> |
|Office 365 ProPlus - Semi-Annual Channel - Desktops - 32-bit - North America Region  <br/> |English, French, Spanish  <br/> |Exclude OneDrive for Business  <br/> |
|Office 365 ProPlus - Semi-Annual Channel - Desktops - 32-bit - LATAM Region  <br/> |Spanish, Portuguese, English  <br/> |Exclude OneDrive for Business  <br/> |
|Office 365 ProPlus - Semi-Annual Channel - Desktops - 32-bit - AsiaPAC Region  <br/> |Chinese (Simplified), Chinese, Indonesian, Japanese, Korean, Malay, Thai, English  <br/> |Exclude OneDrive for Business  <br/> |
|Office 365 ProPlus - Semi-Annual Channel - Desktops - 32-bit - EU Region  <br/> |Czech, Danish, Dutch, Finnish, German, Greek, English, French  <br/> |Exclude OneDrive for Business  <br/> |
|Project Pro Volume Licensed (VL) - Semi-Annual Channel - Desktops - 32-bit  <br/> |English  <br/> ||
|Visio Pro Volume Licensed (VL) - Semi-Annual Channel - Desktops - 32-bit  <br/> |English  <br/> ||
|Individual languages - Semi-Annual Channel - Desktops 32-bit  <br/> |English, French, Spanish, Portuguese, Chinese (Simplified), Chinese, Indonesian, Japanese, Korean, Malay, Thai, Czech, Danish, Dutch, Finnish, German, Greek  <br/> ||
|Office 365 ProPlus - Semi-Annual Channel - VDI - 32-bit - All regions  <br/> |English, French, Spanish, Portuguese, Chinese (Simplified), Chinese, Indonesian, Japanese, Korean, Malay, Thai, Czech, Danish, Dutch, Finnish, German, Greek  <br/> |Shared computer activation  <br/> Exclude OneDrive for Business  <br/> |
|Office 365 ProPlus - Semi-Annual Channel - Desktops - 64-bit  <br/> |English  <br/> |Exclude OneDrive for Business  <br/> |
|Office 365 ProPlus - Semi-Annual Channel (Targeted) - Desktops - 32-bit  <br/> |English  <br/> |Exclude OneDrive for Business  <br/> |
|Project Pro (VL)- Semi-Annual Channel (Targeted) - Desktops - 32-bit  <br/> |English  <br/> ||
|Visio Pro (VL) - Semi-Annual Channel (Targeted) - Desktops - 32-bit  <br/> |English  <br/> ||
   
For examples, see [Best practices: Install XML files for enterprise managed](best-practices-install-xml-files-for-enterprise-managed.md).
  
## Configure OffScrub to remove all previous versions of Office

 *Enterprise Managed*  must obtain two different versions of the Office Scrub tool from Premier support. The first version removes Office 2007 and 2010 MSI versions, and the second version removes Office 2013 MSI, 2013 C2R, 2016 MSI and 2016 C2R. OffScrub will be run several times via task sequence; because there are multiple versions of the tool, each command must be performed separately.
  
The following sequence will be run:
  
- Office 2007 Removal
    
- Office 2010 Removal
    
User data will persist. All instances of Project and Visio will be removed with the accompanying version of the Office suite.
  
For examples, see [Best practices: Uninstall XML files for enterprise managed](best-practices-uninstall-xml-files-for-enterprise-managed.md).
  
## Integrate the individual packages into System Center Configuration Manager for distribution

System Center Configuration Manager can deploy to machines with elevated privilege and logging. Although the Office 365 ProPlus package does not use normal KB patch updates,  *Enterprise Managed*  will use System Center Configuration Manager for continual maintenance of Office 365 ProPlus because their System Center Configuration Manager version allows for integration of Office Builds into the management tool (System Center Configuration Manager 1602 or greater).
  
For detailed guidance, see [Best practices: System Center Configuration Manager configuration for enterprise managed](best-practices-system-center-configuration-manager-configuration-for-enterprise.md).
  
## Configure Office 2016 for Mac for distribution

 *Enterprise Managed*  has existing enterprise Mac software distribution that is different than System Center Configuration Manager. Additionally, the Office Deployment Tool is only for the Windows versions of Office 365 ProPlus. Therefore, the deployment process is slightly different for Mac clients. *Enterprise Managed*  will use their existing Mac software distribution tool to manage their Mac deployments.
  
For detailed guidance, see [Best practices: Office 2016 Mac client install for enterprise managed](best-practices-office-2016-mac-client-install-for-enterprise-managed.md).
  

