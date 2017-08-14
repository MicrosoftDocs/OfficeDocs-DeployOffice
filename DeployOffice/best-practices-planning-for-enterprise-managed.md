---
title: Best practices Planning for enterprise managed
ms.prod: OFFICE365
ms.assetid: 98799ea9-3b93-46b4-b399-b9fcab3e1d80
---


# Best practices: Planning for enterprise managed

 *The Best Practices Guide includes deployment recommendations and real-world examples from the Office 365 Product Group and delivery experts from Microsoft Services. For a list of all the articles, see  [Best practices guide for deploying Office 365 ProPlus in the enterprise](best-practices-guide-for-deploying-office-365-proplus-in-the-enterprise.md).* 
  
    
    

Creating a deployment plan is key when you migrate to Office 365 ProPlus. Planning is based on discovered assessment items, including constraints, and how to implement Office 365 ProPlus to meet the goals of the project.
## Planning source locations

You can deploy and update Office 365 ProPlus directly from the Office Content Delivery Network (CDN), System Center Configuration Manager, or an internal share such as UNC shares or a Distributed File System (DFS). Because * Enterprise Managed*  has System Center Configuration Manager implemented in the environment, they can leverage System Center Configuration Manager for the initial deployment. System Center Configuration Manager has update 1606 or greater; therefore, they can manage Office updates natively in System Center Configuration Manager, as well as ongoing Office 365 channel and build management.
  
    
    
The following planning is focused around deployment of items that are discovered in Assessment by using System Center Configuration Manager.
  
    
    

## Channel membership

 *Enterprise Managed*  uses the following Microsoft channel membership guidance:
  
    
    

- 1% get Current Channel
    
  
- 10% get First Release for Deferred Channel
    
  
- 89% get Deferred Channel
    
  
Because  * Enterprise Managed*  already has System Center Configuration Manager Collections for QA and Production Groups, they can leverage the existing System Center Configuration Manager collections: these are very close to the Microsoft recommendations. Using the existing collections, approximately 1,500 users will get First Release for Deferred Channel (FRDC), and approximately 18,471 users will get Deferred Channel (DC). Approximately 25 development, technology owner, or business lead roles will self-install and self-manage from CDN with Current Channel. These Current Channel users will receive features ahead of FRDC and DC.
  
    
    
For more information about channel membership and management, see  [Best practices: Management for enterprise managed](best-practices-management-for-enterprise-managed.md).
  
    
    

## Base client packaging

The packaging and deployment team at  *Enterprise Managed*  has a rich history of deploying MSI -based Office by leveraging the Office Customization Tool. Many MSI-based files significantly customize how Office looks and feels.
  
    
    
 *Enterprise Managed*  only implements changes that adhere to security polices. Office 365 ProPlus is initially configured without OneDrive for Business at deployment time; it will be added later. There is also a business requirement that all shared computer scenarios are covered properly, as they make up a sizable user population. Distribution will continue to leverage the existing System Center Configuration Manager infrastructure to deploy the Office 365 clients with the elevated privileges that are required for Office installation.
  
    
    

## Download the source files

The [Office 2016 Deployment Tool](https://www.microsoft.com/en-us/download/details.aspx?id=49117) downloads the source media that is required to create an install package and language pack(s) for customization and distribution. *Enterprise Managed*  will create a download an XML file that the Office Deployment Tool setup.exe uses to download the Office 365 client source files.
  
    
    
For more information about the Office Deployment Tool, see  [Best practices: Deployment for enterprise managed](best-practices-deployment-for-enterprise-managed.md).
  
    
    

## Configure deployments

 *Enterprise Managed*  uses [Github Office 365 ProPlus - Configuration XML Editor](http://officedev.github.io/Office-IT-Pro-Deployment-Scripts/XmlEditor.mdl).
  
    
    
The install XML files are relatively simple and can be made by following the  [XML properties that are published on Technet](https://technet.microsoft.com/en-us/library/jj219426.aspx). However, because *Enterprise Managed*  manages multiple download and install XML files, *Enterprise Managed*  uses a web-based tool for accuracy and efficiency.
  
    
    
 *Enterprise Managed*  needs install XML files for the following:
  
    
    

- 32-bit Office 365 ProPlus Deferred Channel in each region and appropriate supported regional languages
    
  
- 32-bit Project Pro (VL) Deferred Channel and supported language
    
  
- 32-bit Visio Pro (VL) Deferred Channel and supported language
    
  
- 64-bit Deferred Channel and appropriate supported language
    
  
- 32-bit Office 365 ProPlus First Release for Deferred Channel and supported language
    
  
- 32-bit Project Pro (VL) First Release for Deferred Channel and supported language
    
  
- 32-bit Visio Pro (VL) First Release for Deferred Channel and supported language
    
  
Having multiple XML files is not difficult to manage because each is less than 4 kilobytes, and they make up the System Center Configuration Manager programs attributes for the package.
  
    
    

## Shared computing

The shared computing property value needs to be set properly for each of the shared computing scenarios discovered during Assessment.
  
    
    

```

<Property Name="SharedComputerLicensing" Value="1" />
```

The following table explains how the settings will be applied to each of the shared computer activation deployment scenarios that Assessment identified:
  
    
    

|||
|:-----|:-----|
|**Client type** <br/> |**XML value** <br/> |
|Standard desktop  <br/> |0  <br/> |
|RDS  <br/> |1  <br/> |
|Non-Persistent VDI  <br/> |1  <br/> |
|Persistent VDI  <br/> |0  <br/> |
|Shared workstation  <br/> |1  <br/> |
   

## Languages

Languages are downloaded and installed by using the Office Deployment Tool. System Center Configuration Manager packages will be broken up by regions, where each region will have its own set of languages that accompany the Office 365 ProPlus files.  *Enterprise Managed*  has adds each language to the self-service catalog for users to install post-Office deployment. Because the language packs are about 200 MB each, and self-service of languages outside the region is an occurrence that happens rarely, all languages are not replicated to all regions. The default language is the one that is most commonly used in that region, together with instructions on how to change the default language. For the self-service languages, such as a user in the LATAM region who wants to add German, the ** Product ID=" LanguagePack"** element in the Office Deployment Tool is used.
  
    
    
The following table shows each region and corresponding languages and identifiers:
  
    
    

|||||
|:-----|:-----|:-----|:-----|
|**Region** <br/> |**Languages** <br/> |**Geographic area** <br/> |**Language ID** <br/> |
|North America  <br/> |English  <br/> French  <br/> Spanish  <br/> |United States  <br/> Canada  <br/> Mexico  <br/> |EN-US  <br/> FR-FR  <br/> ES-ES  <br/> |
|LATAM  <br/> |Spanish  <br/> Portuguese  <br/> English  <br/> |South America  <br/> Brazil  <br/> |ES-ES  <br/> PT-BR  <br/> EN-US  <br/> |
|AsiaPAC  <br/> |Chinese (Simplified)  <br/> Chinese  <br/> Indonesian  <br/> Japanese  <br/> Korean  <br/> Malay  <br/> Thai  <br/> English  <br/> |People's Republic of China  <br/> Taiwan  <br/> Indonesia  <br/> Japan  <br/> Korea  <br/> Malaysia  <br/> Thailand  <br/> |ZH-CN  <br/> ZH-TW  <br/> ID-ID  <br/> JA-JP  <br/> KO-KR  <br/> MS-MY  <br/> TH-TH  <br/> EN-US  <br/> |
|EU  <br/> |Czech  <br/> Danish  <br/> Dutch  <br/> Finnish  <br/> German  <br/> Greek  <br/> French  <br/> English  <br/> |Czech Republic  <br/> Denmark  <br/> Netherlands  <br/> Finland  <br/> Germany  <br/> Greece  <br/> France  <br/> |CS-CZ  <br/> DA-DK  <br/> NL-NL  <br/> FI-FI  <br/> DE-DE  <br/> EL-GR  <br/> FR-FR  <br/> EN-US  <br/> |
   

## Remove/restore applications

OneDrive for Business is excluded from the Office 365 ProPlus suite at time of deployment, but Enterprise Managed can add it later after it has been signed off on and approved for deployment. Although they could use AppLocker in GPO to lock the .EXE, users would still see the icon; therefore, they have decided to use the **ExcludeApp** element in the install XML file.
  
    
    

## Customizations (GPO)

 *Enterprise Managed*  will leverage the [Office 2016 Administrative Template files (ADMX/ADML) and Office Customization Tool for Group Policy](https://www.microsoft.com/en-us/download/details.aspx?id=49030) *Enterprise Managed*  has reviewed existing Group Policy settings and identified any preexisting Group Policy settings to use with Office 365 ProPlus. [OneDrive is a separate GPO template download](https://support.office.com/en-us/article/Administrative-settings-for-the-new-OneDrive-sync-client-0ecb2cf5-8882-42b3-a6e9-be6bda30899c?ui=en-US&amp;rs=en-US&amp;ad=US) that is not leveraged until *Enterprise Managed*  approves and adds OneDrive for Business into the Office 365 ProPlus deployment package.
  
    
    
A sample set of the Preferred Practices policies and GPO backups can be found here.
  
    
    

## Side by side

 *Enterprise Managed*  will avoid running side by side versions, especially where Project and Visio are concerned. The plan of record is to use the Office Scrub tool (OffScrub) to remove any previous versions of Office (2007, 2010, or 2013), but leave the user data intact (such as the dictionary, mail file, signature, etc.). If the user requests Project or Visio, they can be pre-approved by role (such as project manager) or by manager approval. This is not an automated process. If a user runs into macro or add-in issues, *Enterprise Managed*  will remediate the issue via the help desk first. If escalated further, Enterprise Managed can do a side by side or a Published App model for legacy versions of Office. Side by side scenarios are determined on a case by case basis.
  
    
    

## Infopath

 *Enterprise Managed*  will download the 2013 MSI version of InfoPath from the portal or Microsoft download center and distribute it as part of the payload of Office. *Enterprise Managed*  understands that this product is the last version that will be made, and is working on removing InfoPath forms from their environment. It is being deployed with Office in parallel to finding an InfoPath replacement.
  
    
    

## Project and Visio

 *Enterprise Managed*  has different versions and users of Project and Visio that they do not want to run side by side. Additionally, *Enterprise Managed*  are transitioning from MSI-based Project and Visio software to the Click-to-Run (C2R) based versions. *Enterprise Managed*  will continue to leverage their existing KMS/MAK servers for activation of Project and Visio, but the applications will be deployed by using an install XML file and Office Deployment Tool.
  
    
    
For more information about deploying the C2R volume licensed editions of Project and Visio, see  [Use the Office Deployment Tool to install volume licensed editions of Visio 2016 and Project 2016](https://technet.microsoft.com/library/mt703272.aspx).
  
    
    

## Office scrub tool (OffScrub)

 *Enterprise Managed*  will use OffScrub to ensure that all previous Office versions, including Project and Visio installations, are properly removed before Office 365 ProPlus is installed.
  
    
    
For more information on the OffScrub tool, please see  [Offscrub](http://www.deployoffice.com/preferred-practices/).
  
    
    

## Architecture

 *Enterprise Managed*  determined that only the finance and accounting departments need to run 64-bit Office. Therefore, there will be a single deployment channel (Deferred) for 64-bit to reduce the storage and complexity of maintaining multiple channels, builds, and levels of architecture.
  
    
    

## Office 2016 for Mac

 *Enterprise Managed*  will leverage their existing Mac enterprise software management tool to install and manage Office 2016 for Mac deployments for the ~500 Mac users. An Office 365 administrator will download the **Microsoft_Office_2016_Installer.pkg** from the Office 365 portal and use the software distribution tool to distribute and manage it. Users will be blocked from installing Office 2016 for Mac from the Office 365 software portal.
  
    
    

## Licensing

 *Enterprise Managed*  has already synced all of their users, and the Exchange Online users already using E3/E5 licenses. They utilize PowerShell and on-premises AD DS attributes to determine and assign the Office 365 Licenses. The majority of users are E3, with the exception being Enterprise Voice E5 users, which are well defined. The remaining E1 users are temporary employees that are in a very locked down OU, and are easy to manage with AD DS attributes.
  
    
    

> [!NOTE]
> Licensing is done by using custom PowerShell; the AD DS is just a reference point for the PowerShell licensing script. 
  
    
    


## Network

 *Enterprise Managed*  will bypass proxy services for all Office 365 ProPlus URLs. Therefore, the ability to activate and authenticate to Office 365 and maintain the subscription is not blocked. 99% of the organization users will get the Office content from System Center Configuration Manager, but System Center Configuration Manager must get the content from the Office CDN.
  
    
    
The following table shows the planning estimates for monthly downloads from CDN to System Center Configuration Manager:
  
    
    

||||
|:-----|:-----|:-----|
|**Name** <br/> |**Approximate size** <br/> |**Approximate frequency** <br/> |
|32-bit Deferred Channel  <br/> |~1024 MB  <br/> |Monthly  <br/> |
|64-bit Deferred Channel  <br/> |~1024 MB  <br/> |Monthly  <br/> |
|32-bit First Release Deferred Channel  <br/> |~1024 MB  <br/> |Every 2 weeks (for estimation purposes)  <br/> |
|17 Languages  <br/> |17*~200 MB = ~3,400 MB  <br/> |Monthly  <br/> |
   
Download from Internet to System Center Configuration Manager each month: ~7.4 GB.
  
    
    
Largest regional distribution point update each month (1 channel, 1 architecture and 8 languages): 2.6 GB.
  
    
    

## Staying current versus skipping builds and rollbacks

 *Enterprise Managed*  is planning on staying current because it is the most network-optimized solution. However, they have created an empty package in System Center Configuration Manager that contains the necessary items to perform a rollback to a previously known good version. An administrator must provide the appropriate source files and version number to which to rollback the clients.
  
    
    
For more information about performing a rollback, see  [Channel management](http://www.deployoffice.com/preferred-practices/).
  
    
    

