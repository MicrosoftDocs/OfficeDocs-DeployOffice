---
title: "Best practices Office 2016 Mac client install for enterprise managed"
ms.author: danbrown
author: DHB-MSFT
manager: laurawi
ms.date: 3/22/2017
ms.audience: ITPro
ms.topic: concetpual
ms.service: o365-proplus-itpro
localization_priority: Normal
ms.collection: Ent_O365
ms.custom:
- Ent_Office_ProPlus_Best
- Ent_Office_ProPlus
- Ent_Office_Mac
ms.assetid: bf1d87b1-3398-45e7-86cc-109995f3af76
description: "The Best Practices Guide includes deployment recommendations and real-world examples from the Office 365 Product Group and delivery experts from Microsoft Services. For a list of all the articles, see Best practices."
---

# Best practices: Office 2016 Mac client install for enterprise managed

 *The Best Practices Guide includes deployment recommendations and real-world examples from the Office 365 Product Group and delivery experts from Microsoft Services. For a list of all the articles, see [Best practices](best-practices.md).* 
  
This article describes how  *Enterprise Managed*  designed and deployed Office 2016 for Mac. They will utilize their existing Mac software distribution tool to manage the Office 2016 for Mac deployment. Users are blocked from downloading Office 2016 for Mac from the Office 365 portal.
  
## Mac software distribution tool

Because Office 2016 for Mac uses the Apple Installer technology for installation,  *Enterprise Managed*  can utilize their existing Mac software distribution tool such as Apple Remote Desktop or Casper JAMF Software Suite. Administrators control the software deployment and have centralized control over the deployment to monitor the Mac clients to see when they have received the software. For Enterprise Managed to deploy via their Mac software distribution tool, an Office 365 administrator should download the MPKG files from the Office 365 portal and create the deployment package.
  
> [!NOTE]
> Not all third-party Mac software distribution solutions support automatic account configuration. 
  
For more information on deployment options for Office 2016 for Mac, see [Office 2016 for Mac Clients](http://www.deployoffice.com/preferred-practices/). 
  
## Deployment preferences

For guidance on deploying preferences to end users, see [Office 2016 for Mac Clients](http://www.deployoffice.com/preferred-practices/).
  
Deployment preferences can overwrite the existing user preference settings. To remove Office for Mac 2011, [Troubleshoot Office 2011 for Mac issues by completely uninstalling before you reinstall](https://support.office.com/en-us/article/Troubleshoot-Office-2011-for-Mac-issues-by-completely-uninstalling-before-you-reinstall-ba8d8d13-0015-4eea-b60b-7719c2cedd17?ui=en-US&amp;rs=en-US&amp;ad=US&amp;fromAR=1).
  
## Deployment languages

All of the [supported languages](https://support.office.com/en-us/article/Supported-languages-in-Office-2016-for-Mac-26d30382-9fba-45dd-bf55-02ab03e2a7ec?ui=en-US&amp;rs=en-US&amp;ad=US) in Office 2016 for Mac are included and installed as part of the installer package .pkg file. Because there are no separate installer package files for each language, admins cannot choose which language to deploy to users. The language is selected during the installation based on the System Preferences settings. If none of the language settings are supported by Office, Office will install in English.
  

