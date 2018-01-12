---
title: "Best practices Office 2016 Mac client install for locally managed"
ms.author: danbrown
author: DHB-MSFT
manager: laurawi
ms.date: 6/1/2017
ms.audience: ITPro
ms.topic: concetpual
ms.service: o365-administration
localization_priority: Normal
ms.collection: Ent_O365
ms.custom:
- DeployProPlus
- DeployProPlus_BestPractices
- DeployProPlus_SOConly
- Ent_Office_ProPlus
ms.assetid: 7b5e0fde-11ff-4cd1-aceb-59f4ba77ff49
description: "The Best Practices Guide includes deployment recommendations and real-world examples from the Office 365 Product Group and delivery experts from Microsoft Services. For a list of all the articles, see Best practices."
---

# Best practices: Office 2016 Mac client install for locally managed

 *The Best Practices Guide includes deployment recommendations and real-world examples from the Office 365 Product Group and delivery experts from Microsoft Services. For a list of all the articles, see [Best practices](best-practices.md).* 
  
This article describes how  *Locally Managed*  should design and deploy Office 2016 for Mac. Because they do not have a sizeable Mac population or Mac software distribution tools, the deployment should be managed from a local network share.
  
## Download Office 2016 for Mac to the local network

Administrators can download the MPKG files from the Office 365 Portal Software Page and place the installation image in a network share. This strategy is useful for small scaled deployments and allows the user to control the installation of Office. Only users who are approved to install Office 2016 for Mac should have access to the network share.
  
1. Sign in to the Office 365 portal as an Office 365 administrator.
    
2. Go to the[Office 365 admin center](https://support.office.com/en-us/article/About-the-old-Office-365-admin-center-58537702-d421-4d02-8141-e128e3703547?ui=en-US&amp;rs=en-US&amp;ad=US) and select **Service Settings > User software**. 
    
3. Under **Software for Mac**, expand **Office for Mac** and then click **Download** to begin downloading the installer package file. The installer package file is named **Microsoft_Office_2016_Installer.pkg**.
    
4. Put the **Microsoft_Office_2016_Installer.pkg** file in the network location.
    
5. Provide Mac end users with installation instructions
    
For more information on deployment options for Office 2016 for Mac, see [Office 2016 for Mac Clients](http://www.deployoffice.com/preferred-practices/). 
  
## Deployment preferences

For guidance on deploying preferences to end users, see [Office 2016 for Mac Clients](http://www.deployoffice.com/preferred-practices/).
  
Deployment preferences can overwrite the existing user preference settings. To remove Office for Mac 2011, [Troubleshoot Office 2011 for Mac issues by completely uninstalling before you reinstall](https://support.office.com/en-us/article/Troubleshoot-Office-2011-for-Mac-issues-by-completely-uninstalling-before-you-reinstall-ba8d8d13-0015-4eea-b60b-7719c2cedd17?ui=en-US&amp;rs=en-US&amp;ad=US&amp;fromAR=1).
  
## Deployment languages

All of the [supported languages](https://support.office.com/en-us/article/Supported-languages-in-Office-2016-for-Mac-26d30382-9fba-45dd-bf55-02ab03e2a7ec?ui=en-US&amp;rs=en-US&amp;ad=US) in Office 2016 for Mac are included and installed as part of the installer package .pkg file. Because there are no separate installer package files for each language, admins cannot choose which language to deploy to users. The language is selected during the installation based on the System Preferences settings. If none of the language settings are supported by Office, Office will install in English.
  

