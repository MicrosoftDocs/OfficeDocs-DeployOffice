---
title: Best practices Planning for cloud managed
ms.prod: OFFICE365
ms.assetid: e9a8dd9f-732c-4c51-907b-59152acda975
---


# Best practices: Planning for cloud managed

 *The Best Practices Guide includes deployment recommendations and real-world examples from the Office 365 Product Group and delivery experts from Microsoft Services. For a list of all the articles, see  [Best practices guide for deploying Office 365 ProPlus in the enterprise](best-practices-guide-for-deploying-office-365-proplus-in-the-enterprise.md).* 
  
    
    

Creating a deployment plan is a key component when migrating to Office 365 ProPlus. Planning is based on discovered assessment items, including constraints and how to implement Office 365 ProPlus to meet the goals of the project.
## Planning source locations

Office 365 ProPlus can be deployed and updated directly from the Office Content Delivery Network (CDN), System Center Configuration Manager, or a network share or Distributed File System (DFS). Because Cloud Managed does not use client management software or have a DFS in place, they will leverage the Office 365 self-service portal to install Office 365 ProPlus for remote users, and leverage the CDN for non-traveling or on-premises users. The following planning is focused on the assets that were discovered during the assessment phase.
  
    
    

## Channel membership

 *Cloud Managed*  understands the following Microsoft guidance:
  
    
    

- 1% get Current Channel
    
  
- 10% get First Release for Deferred Channel
    
  
- 89% get Deferred Channel
    
  
Using existing groups, ~50 users will be on First Release Deferred Channel, and ~440 users will get Deferred Channel. There are ~10 developer, technology owner, or business lead roles that will self-install and self-manage from Office CDN with Current Channel. These Current Channel users will receive features ahead of FRDC and DC.
  
    
    
For more information about channel membership and management, see  [Managing Channels for Office 365 ProPlus](http://www.deployoffice.com/preferred-practices/).
  
    
    

## Base client packaging

The IT department at  *Cloud Managed*  has limited history of deploying MSI-based Office using Office Customization Tool, with only one previous deployment configured. A business requirement is for shared computers to be covered as part of the deployment. Cloud Managed will create deployment packages consisting of the install XML file and ODT setup.exe, host it internally using UNC shares, and create deployment scripts to deploy Office 365 ProPlus.
  
    
    

## Download the source files

When using the Office CDN, Cloud Managed is not downloading source files to an on-premises location for redistribution. However, they will still leverage the  [Office 2016 Deployment Tool](https://www.microsoft.com/en-us/download/details.aspx?id=49117) to create an install package and language pack for customization and distribution.
  
    
    
For more information about the Office Deployment Tool, see  [Office Deployment Tool](http://www.deployoffice.com/preferred-practices/).
  
    
    

## Configure deployments

 *Cloud Managed*  uses [Github Office 365 ProPlus - Configuration XML Editor](http://officedev.github.io/Office-IT-Pro-Deployment-Scripts/XmlEditor.mdl).
  
    
    
The install XML files are relatively simple and can be made by following the  [XML properties that are published on Technet](https://technet.microsoft.com/en-us/library/jj219426.aspx). However, because *Cloud Managed*  manages multiple download and install XML files, *Cloud Managed*  uses a web-based tool for accuracy and efficiency.
  
    
    
 *Cloud Managed*  will need install XML files for the following:
  
    
    

- 32-bit Office 365 ProPlus Deferred Channel and supported language
    
  
- 32-bit Office 365 ProPlus First Release for Deferred Channel and supported language
    
  
It is not difficult to manage multiple install XML files because they are less than 4 kilobytes each.
  
    
    

## Shared computing

The shared computing property value needs to be set properly for each of the shared computing scenarios that were discovered during Assessment.
  
    
    

```

<Property Name="SharedComputerLicensing" Value="1" /> 
```

The following table describes how the setting will be applied to each of the shared computer activation deployment scenarios:
  
    
    

|||
|:-----|:-----|
|**Client type** <br/> |**XML value** <br/> |
|Standard desktop  <br/> |0  <br/> |
|Shared workstation  <br/> |1  <br/> |
   

## Languages

 *Cloud Managed*  will use the Office CDN and languages will be downloaded directly from the Office CDN and installed using the Office Deployment Tool. If they decided to allow users to install additional languages, users can leverage a self-service language pack install because they have local administrator rights on the clients.
  
    
    

## Remove/restore applications

 *Cloud Managed*  is not planning to exclude any applications during the Office 365 ProPlus deployment.
  
    
    

## Customizations (GPO)

 *Cloud Managed*  will leverage the [Office 2016 Administrative Template files (ADMX/ADML) and Office Customization Tool for Group Policy](https://www.microsoft.com/en-us/download/details.aspx?id=49030) *. Cloud Managed*  has reviewed existing Group Policy settings and identified any preexisting Group Policy settings to use with Office 365 ProPlus. At this time, [OneDrive is a separate GPO template download](https://support.office.com/en-us/article/Administrative-settings-for-the-new-OneDrive-sync-client-0ecb2cf5-8882-42b3-a6e9-be6bda30899c?ui=en-US&amp;rs=en-US&amp;ad=US) and should be reviewed to determine if any Group Policy settings are required.
  
    
    

## Side by side

 *Cloud Managed*  will install Office 365 ProPlus side by side with existing Office installations that have Project and Visio. The plan of record is to remove any previous versions of Office 2010 and 2013 (MSI), Project 2010 (MSI), and Visio 2010 (MSI), and to keep user data intact (dictionary, mail file, signature, etc.). If a user already has a 2013 Project or Visio (MSI) install on their machine, it will be left installed during the OffScrub process, but a quick repair will be run after the Office 365 ProPlus installation completes in order for the Project and Visio versions to function properly. If a user runs into Macro or Add-in errors, they will then attempt to remediate the issue by using a side by side scenario.
  
    
    

## Project and Visio

 *Cloud Managed*  has a small number of 2010 Project and Visio (MSI) deployments that they will migrate to 2013 Project and Visio (MSI). 2013 Project and Visio (MSI) will run in side by side with Office 365 ProPlus in a supported N-1 scenario. *Cloud Managed*  should run a quick repair on any Project and Visio MSI installs after Office 365 ProPlus has been installed.
  
    
    

## Office Scrub Tool (OffScrub)

Cloud Managed will use OffScrub to ensure that all previous installations of Office 2010 (MSI), including Project and Visio 2010 installations, and all previous installations of Office 2013 (MSI), excluding Project and Visio 2013, are properly removed before Office 365 ProPlus is installed.
  
    
    
For more information on the OffScrub tool, see  [Offscrub](http://www.deployoffice.com/preferred-practices/).
  
    
    

## Architecture

 *Cloud Managed*  determined that only the 32-bit version of the Office 365 clients will be deployed. *Cloud Managed*  has no use cases for 64-bit applications.
  
    
    

## Office 2016 for Mac

 *Cloud Managed*  will not use client management software to deploy Office 2016 for Mac for their ~5 Mac users. Instead, they will use the Office 365 portal for users who need Office 2016 for Mac. Users will be prompted for their machine administrator credentials to install Office 2016 for Mac.
  
    
    

## Licensing

 *Cloud Managed*  has already synced their users and the Exchange Online users already have E3 licenses. *Cloud Managed*  uses PowerShell and on premises AD DS attributes to determine and assign the Office 365 Licenses, but also does some manual license assignment and management via the Office 365 admin portal.
  
    
    

> [!NOTE]
> Licensing is done by using custom PowerShell; the AD DS is just a reference point for the PowerShell licensing script. 
  
    
    


## Network

 *Cloud Managed*  will bypass proxy services for all Office 365 ProPlus URLs. Therefore, the ability to activate or authenticate to Office 365 and maintain the subscription will not be blocked. Since they will be relying on users to update from the CDN, all Office 365 ProPlus URLs must be open.
  
    
    

## Staying current versus skipping builds and rollbacks

 *Cloud Managed*  is planning on staying current because they understand that it is the most network optimized solution. However, they have created a script stored in a network location that contains the necessary items to perform a rollback to a previously known good version. Administrators would need to provide the appropriate version number in the script to rollback to, and they will utilize the Office CDN for the rollback.
  
    
    
For more information about performing a rollback, see  [Channel management](http://www.deployoffice.com/preferred-practices/).
  
    
    

