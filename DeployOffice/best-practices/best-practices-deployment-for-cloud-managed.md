---
title: "Best practices Deployment for cloud managed"
ms.author: jwhit
author: jwhit-MSFT
manager: laurawi
ms.date: 9/13/2017
ms.audience: ITPro
ms.topic: concetpual
ms.service: o365-administration
localization_priority: Normal
ms.collection: Ent_O365
ms.custom:
- DeployProPlus
- DeployProPlus_BestPractices
- DeployProPlus_SOConly
- Strat_O365_ProPlus
- Ent_Office_ProPlus
ms.assetid: 3c108fee-b271-4cb0-8b16-a134faf9f70c
description: "The Best Practices Guide includes deployment recommendations and real-world examples from the Office 365 Product Group and delivery experts from Microsoft Services. For a list of all the articles, see Best practices."
---

# Best practices: Deployment for cloud managed

 *The Best Practices Guide includes deployment recommendations and real-world examples from the Office 365 Product Group and delivery experts from Microsoft Services. For a list of all the articles, see [Best practices](best-practices.md).* 
  
Now that  *Cloud Managed*  has been through Assessment and Planning, it is time to deploy the software.
  
## Configure the deployment files for redistribution

Download the latest version of the [Office Deployment Tool (ODT)](https://www.microsoft.com/en-us/download/details.aspx?id=49117) and create and configure the install XML files to download and install the Office 365 ProPlus source files. *Cloud Managed*  created multiple XML files to configure and install Office 365 ProPlus.
  
[GitHub](http://officedev.github.io/Office-IT-Pro-Deployment-Scripts/XmlEditor.mdl) was leveraged to edit the XML files.
  
The following XML files must be created:
  
|||
|:-----|:-----|
|**XML file** <br/> |**Languages** <br/> |
|Office 365 ProPlus - Semi-Annual Channel - Desktops - 32-bit  <br/> |English  <br/> |
|Office 365 ProPlus - Semi-Annual Channel - Desktops - VDI - 32-bit  <br/> |English  <br/> |
|Office 365 ProPlus - Semi-Annual Channel (Targeted) - Desktops - 32-bit  <br/> |English  <br/> |
   
For examples, see [Best practices: Download XML files for cloud managed](best-practices-download-xml-files-for-cloud-managed.md).
  
## Configure the Office Scrub tool to remove all previous versions of Office

Because  *Cloud Managed*  has multiple versions of Office, two versions of the Office Scrub tool must be obtained from Premier support. The first version removes Office 2007 and 2010 MSI versions, while the second version removes Office 2013 MSI, 2013 C2R, and 2016 MSI or C2R.
  
The application will be run via a script. Because there are multiple versions of the tool, each command must be performed separately.
  
The following sequence will be run:
  
- Office 2010 Removal
    
- Office 2013 MSI Core Suite Removal (leave Project and Visio 2013 on machine)
    
User data will be persisted and Project and Visio will be left intact. A quick repair on Project and Visio will likely be required.
  
For examples, see [Best practices: Install XML files for cloud managed](best-practices-install-xml-files-for-cloud-managed.md).
  
## Create the batch install wrapper to automate the OffScrub and Office 365 ProPlus install or removal

 *Cloud Managed*  can use a batch file that is stored in a UNC path to initiate the Office 365 ProPlus installation from the Office CDN, or to uninstall an existing Office 365 ProPlus installation.
  
A sample Office 365 ProPlus batch file task order is:
  
- Run Office Scrub
    
  - Remove all Office 2010 (MSI) components
    
  - Remove Office 2013 (MSI) Core suite applications (leave any 2013 Project and Visio MSI instances intact) 
    
  - Leave user data in place
    
- Install Office 365 ProPlus with proper channel, architecture, and languages
    
The following batch files or scripts should be created:
  
- OffScrub + Office 365 ProPlus Semi-Annual Channel install
    
- OffScrub + Office 365 ProPlus Semi-Annual Channel (Targeted) install
    
- Office 365 ProPlus uninstall
    
Add the following line to a batch file ( **Office365_SAC_Configuration.cmd** ). This batch line will dynamically determine the script directory and find setup.exe and install XML. Note that this does not check whether the script is performed with elevated rights, but Cloud Managed users are local administrators on their client devices.
  
```
"%~dp0Setup.exe" /configure "%~dp0install.xml"
```

An additional batch file ( **Office365_Removal.cmd** ) to uninstall can be created with the following batch line:
  
```
"%~dp0Setup.exe" /configure "%~dp0removal.xml" 
```

For detailed guidance, see [Best practices: Office Content Delivery Network configuration for cloud managed](best-practices-office-content-delivery-network-configuration-for-cloud-managed.md).
  
## Configure Office 2016 for Mac for distribution

 *Cloud Managed*  has a limited Mac environment and will utilize the Office 365 portal for deployments. Users should be provided instructions on how to install Office 2016 for Mac from the Office 365 portal. Users will need to provide their machine administrator credentials in order to install Office 2016 for Mac.
  
For detailed guidance, see [Best practices: Office 2016 Mac client install for cloud managed](best-practices-office-2016-mac-client-install-for-cloud-managed.md).
  

