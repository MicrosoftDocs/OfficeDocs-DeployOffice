---
title: "Best practices Planning for locally managed"
ms.author: jwhit
author: jwhit-MSFT
manager: laurawi
ms.date: 9/9/2017
ms.audience: ITPro
ms.topic: concetpual
ms.service: o365-proplus-itpro
localization_priority: Normal
ms.collection: Ent_O365
ms.custom:
- Ent_Office_ProPlus_Best
- Ent_Office_ProPlus
ms.assetid: ac3e0d61-fd10-4caa-9b88-be55d1ef39bb
description: "The Best Practices Guide includes deployment recommendations and real-world examples from the Office 365 Product Group and delivery experts from Microsoft Services. For a list of all the articles, see Best practices."
---

# Best practices: Planning for locally managed

 *The Best Practices Guide includes deployment recommendations and real-world examples from the Office 365 Product Group and delivery experts from Microsoft Services. For a list of all the articles, see [Best practices](best-practices.md).* 
  
Creating a deployment plan is a key component when migrating to Office 365 ProPlus. Planning is based on discovered assessment items, including constraints and how to implement Office 365 ProPlus to meet the goals of the project.
  
## Planning source locations

Office 365 ProPlus can be deployed and updated directly from the Office Content Delivery Network (CDN), System Center Configuration Manager, or through an internal share such as a network share or Distributed File System (DFS). Because  *Locally Managed*  has a DFS implementation, *Locally Managed*  will leverage DFS to deploy the initial Office deployment, as well as ongoing build management. The following planning is focused around deployment of items that were discovered in Assessment via DFS.
  
## Channel membership

 *Locally Managed*  will incorporate the following Microsoft channel membership guidance:
  
- 1% get Monthly Channel
    
- 10% get Semi-Annual Channel (Targeted)
    
- 89% get Semi-Annual Channel
    
 *Locally Managed*  estimates that there may be ~20 developer, technology owner, or business lead roles that will self-install and self-manage from CDN with Monthly Channel (to have the features before anyone one else). These Monthly Channel users will receive features ahead of Semi-Annual Channel (Targeted) and Semi-Annual Channel. The existing QA collection of ~500 users will also be utilized to receive Semi-Annual Channel (Targeted). These Semi-Annual Channel (Targeted) users should represent all business groups, so that each build has been validated throughout the organization.
  
For more information about channel membership and management, see [Overview of update channels for Office 365 ProPlus](../overview-of-update-channels-for-office-365-proplus.md)
  
## Base client packaging

The packaging and deployment team at  *Locally Managed*  has a moderate history of deploying MSI-based (MSI) Office leveraging the Office Customization Tool with Office 2010. Many of the MSI-based files significantly customize how Office looks and feels. *Locally Managed*  will only implement changes that adhere to their security polices to minimize any customizations to look and feel. Office 365 ProPlus will be configured without Access at deployment time, because it is not required by the organization. There is also a business requirement for the shared computer scenarios to be covered properly. Office 365 ProPlus distribution will leverage the DFS infrastructure and batch files to deploy the Office 365 client with elevated privileges that are required for installation.
  
## Download the source files

The Office Deployment Tool will be used to download the source media required to create an install package and language pack(s) for customization and distribution.  *Locally Managed*  will create a download XML file that Office Deployment Tool setup.exe uses to download the Office 365 client source files.
  
For more information about the Office Deployment Tool, see [Overview of the Office Deployment Tool](../overview-of-the-office-2016-deployment-tool.md)
  
## Configure deployments

 *Locally Managed*  uses[Github Office 365 ProPlus - Configuration XML Editor](http://officedev.github.io/Office-IT-Pro-Deployment-Scripts/XmlEditor.html).
  
The install XML files are relatively simple and can be made by following the [Configuration options for the Office Deployment Tool](../configuration-options-for-the-office-2016-deployment-tool.md). However, because  *Locally Managed*  manages multiple download and install XML files, *Locally Managed*  uses a web-based tool for accuracy and efficiency.
  
 *Locally Managed*  will need install XML files for the following:
  
- 32-bit Office 365 ProPlus Semi-Annual Channel in both regions and appropriate supported regional languages
    
- 32-bit Project Pro Semi-Annual Channel and supported language
    
- 32-bit Visio Pro Semi-Annual Channel and supported language
    
- 32-bit Office 365 ProPlus Semi-Annual Channel (Targeted) and supported language
    
- 32-bit Project Pro Semi-Annual Channel (Targeted) and supported language
    
- 32-bit Visio Pro Semi-Annual Channel (Targeted) and supported language
    
It is not difficult to manage multiple install XML files because they are less than 4 kilobytes each.
  
## Shared computing

The shared computing property value must be set properly for each of the shared computing scenarios that were discovered during assessment.
  
```
<Property Name="SharedComputerLicensing" Value="1" /> 
```

The following table explains how the setting is applied to each of the shared computer activation deployment scenarios that were identified during Assessment:
  
|||
|:-----|:-----|
|**Client type** <br/> |**XML value** <br/> |
|Standard desktop  <br/> |0  <br/> |
|RDS  <br/> |1  <br/> |
|Random access workstation  <br/> |1  <br/> |
   
## Languages

Languages will be downloaded and installed using the Office Deployment Tool.  *Locally Managed*  will add a self-service installation for all three supported languages because they will not be installing the same languages in the CanAm and Germany regions. For the self-service languages, such as a user in the CanAm region wanting to add German, the plan is to use the **Product ID="LanguagePack"** element in the Office Deployment Tool.
  
The default language is the one that is most commonly used in a region. The following table lists each region and the corresponding languages and identifiers.
  
|||||
|:-----|:-----|:-----|:-----|
|**Region** <br/> |**Languages** <br/> |**Geographic area** <br/> |**Language ID** <br/> |
|CanAm  <br/> |English  <br/> French  <br/> |United States  <br/> Canada  <br/> |EN-US  <br/> FR-FR  <br/> |
|Germany  <br/> |German  <br/> |Germany  <br/> |DE-DE  <br/> |
   
## Remove/restore applications

Access will be excluded from the Office 365 ProPlus suite at time of deployment, but  *Locally Managed*  can add it later should business requirements change. *Locally Managed*  could use AppLocker in GPO to lock the .exe, but users would still see the icon; therefore, a better approach is to use the **ExcludeApp** element in the install XML file.
  
## Customizations (GPO)

 *Locally Managed*  will leverage the[Office 2016 Administrative Template files (ADMX/ADML) and Office Customization Tool for Group Policy](https://www.microsoft.com/en-us/download/details.aspx?id=49030) *. Locally Managed*  has reviewed existing Group Policy settings and identified any preexisting Group Policy settings to use with Office 365 ProPlus.[OneDrive is a separate GPO template download](https://support.office.com/en-us/article/Administrative-settings-for-the-new-OneDrive-sync-client-0ecb2cf5-8882-42b3-a6e9-be6bda30899c?ui=en-US&amp;rs=en-US&amp;ad=US) that is not leveraged until *Locally Managed*  approves and adds OneDrive for Business into the Office 365 ProPlus deployment package.
  
A sample set of the Preferred Practices policies and GPO backups can be found here.
  
## Side by side

 *Locally Managed*  reviewed their assessment data and decided to avoid running side by side. The plan of record is to use the Office Scrub tool (OffScrub) to remove the previous version of Office 2010 (MSI), but leave the user data intact (dictionary, mail file, signature, etc.). If the user requests Project or Visio back, they can be pre-approved by role (such as project manager) or managed approval to be licensed and allowed to get the Office 365 Project or Visio Pro version installed. If a user runs into macro or add-in issues, they will attempt to remediate the issue via the IT helpdesk first. If escalated further, *Locally Managed*  will do side by side for the legacy version of Office. This will be determined on a case by case basis.
  
## Infopath

 *Locally Managed*  will download the 2013 MSI version of InfoPath from the portal or[Microsoft download center](https://www.microsoft.com/en-us/download/details.aspx?id=48734) and distribute it as part of the payload of office. *Locally Managed*  understands that this product is the last version that will be made, and is working on removing InfoPath forms from their environment. It is being deployed with Office in parallel to finding an InfoPath replacement.
  
## Project and Visio

 *Locally Managed*  has a moderate number of Project and Visio 2010 installs that they do not want to run side by side. They will be transitioning from machine installs of the software to adding the licenses to their Office 365 tenant to cover Click-to-Run versions of Project and Visio. This way, the license will follow the user and always be the current version of Office, Project, and Visio. This will require less administrative effort and management from the IT team.
  
## Office Scrub Tool (OffScrub)

 *Locally Managed*  will use OffScrub to ensure that all previous installations of Office 2010 (MSI), including Project and Visio 2010 installations, are properly removed before Office 365 ProPlus is installed.
  
For more information on the OffScrub tool, see [Best practices: Using OffScrub](best-practices-using-offscrub.md).
  
## Architecture

 *Locally Managed*  determined that only the 32-bit version of the Office 365 clients will be deployed. Locally Managed has no use cases for 64-bit applications.
  
## Office 2016 for Mac

Because  *Locally Managed*  has a small population of ~25 existing Office for Mac users, they will leverage a network share for Office 2016 for Mac deployments. An Office 365 administrator will download the **Microsoft_Office_2016_Installer.pkg** from the Office 365 portal, and users will install Office 2016 for Mac from the network location. Users will be prompted for their machine administrator credentials to install Office 2016 for Mac.
  
## Licensing

 *Locally Managed*  has already synced all of their users, and the Exchange Online users already use E3 licenses. *Locally Managed*  uses PowerShell and on premises AD DS attributes to determine and assign the Office 365 Licenses. Nearly all users are assigned the E3 license SKU.
  
> [!NOTE]
> Licensing is done by using custom PowerShell; the AD DS is just a reference point for the PowerShell licensing script. 
  
## Network

 *Locally Managed*  will bypass proxy services for all Office 365 ProPlus URLs. Therefore, the ability to activate or authenticate to Office 365 and maintain the subscription will not be blocked. Because they will be relying on users to update from the CDN, all Office 365 ProPlus URLs must be open.
  
||||
|:-----|:-----|:-----|
|**Name** <br/> |**Approximate size** <br/> |**Approximate frequency** <br/> |
|32-bit Semi-Annual Channel  <br/> |~1024 MB  <br/> |Monthly  <br/> |
|3 Languages  <br/> |3 *~200MB = ~600 MB  <br/> |Monthly  <br/> |
|32-bit Semi-Annual Channel (Targeted)  <br/> |~1024 MB  <br/> |Every 2 weeks (for estimation purposes)  <br/> |
|1 Language  <br/> |~200 MB  <br/> |Every 2 weeks (for estimation purposes)  <br/> |
   
Semi-Annual Channel download from Office CDN to DFS each month: ~ 1.6 GB.
  
Semi-Annual Channel (Targeted) download from Office CDN to DFS each month: ~2.4 GB.
  
Total download from Office CDN to DFS each month: ~4 GB.
  
## Staying current versus skipping builds and rollbacks

 *Locally Managed*  is planning on staying current because they understand that it is the most network optimized solution. However, they have created a script stored in the DFS that contains the necessary items to perform a rollback to a previously known good version. An administrator would need to download the appropriate source files to rollback to, and insert the appropriate version number in the script to rollback to.
  
For more information about performing a rollback, see [Best practices: Managing channels](best-practices-managing-channels.md).
  

