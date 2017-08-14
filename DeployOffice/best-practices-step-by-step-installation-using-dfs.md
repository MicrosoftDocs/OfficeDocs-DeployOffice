---
title: Best practices Step by step installation using DFS
ms.prod: OFFICE365
ms.assetid: 5ebd1288-69ed-4425-a9cf-6253d6027005
---


# Best practices: Step by step installation using DFS

 *The Best Practices Guide includes deployment recommendations and real-world examples from the Office 365 Product Group and delivery experts from Microsoft Services. For a list of all the articles, see  [Best practices guide for deploying Office 365 ProPlus in the enterprise](best-practices-guide-for-deploying-office-365-proplus-in-the-enterprise.md).* 
  
    
    

This article describes how to install and manage Office UNRESOLVED_TOKEN_VAL(365) ProPlus by leveraging an existing Distributed File System (DFS). It also provides a high level description of the architecture components.
## Deploy Office365 ProPlus from DFS


### Create DFS folder structure

Create the following folder structure in the network shares:
  
    
    

|||
|:-----|:-----|
|**Folder path** <br/> |**Purpose** <br/> |
|**\\\\Server\\Share\\O365** <br/> |This is the parent folder to store all Office UNRESOLVED_TOKEN_VAL(365) ProPlus related items.  <br/> |
|**\\\\Server\\Share\\O365\\CC** <br/> |Use this folder to store the most current Office UNRESOLVED_TOKEN_VAL(365) ProPlus Current Channel build that pilot users will receive.  <br/> |
|**\\\\Server\\Share\\O365\\FRDC** <br/> |Use this folder to store the most current Office UNRESOLVED_TOKEN_VAL(365) ProPlus First Release for Deferred Channel build that pre-production users will receive.  <br/> |
|**\\\\Server\\Share\\O365\\DC** <br/> |Use this folder to store the most current Office UNRESOLVED_TOKEN_VAL(365) ProPlus Deferred Channel build that production users will receive. Production channel should be Deferred Channel.  <br/> |
|**\\\\Server\\Share\\O365\\Archive\\%channel%** <br/> |Use this folder to host N-1 previously known good builds in case a rollback or downgrade is needed.  <br/> |
   

### Download Office365 ProPlus builds

The downloads will contain the Office UNRESOLVED_TOKEN_VAL(365) ProPlus build for the most up -to-date channel release. Specify all products and languages that will be deployed.
  
    
    
The parameters and settings for the XML file can be found at  [Reference: Configuration options for the Office Deployment Tool](https://technet.microsoft.com/en-us/library/jj219426.aspx). The parameters for Project and Visio 2016 volume licensing can be found at  [Use the Office Deployment Tool to install volume licensed editions of Visio 2016 and Project 2016](https://technet.microsoft.com/library/mt703272.aspx). A graphical UI for creating the XML file can be found at the Office GitHub Repository  [Office Click-To-Run Configuration XML Editor](http://officedev.github.io/Office-IT-Pro-Deployment-Scripts/XmlEditor.mdl).
  
    
    
 **Download Current Channel build**
  
    
    

1. Download latest Current Channel build. For an example XML, see  [Best practices: Sample configuration files for downloading Office 365 ProPlus](best-practices-sample-configuration-files-for-downloading-office-365-proplus.md).
    
  
2. Save the configuration file as **GetLatestCCBuild.xml**.
    
  
3. Confirm that Office Deployment Tool (setup.exe) is in **\\\\Server\\Share\\O365**.
    
  
4. Copy **GetLatestCCBuild.xml** to **\\\\Server\\Share\\O365\\CC**.
    
  
5. From an elevated command prompt with administrator privileges, run **\\\\Server\\Share\\O365\\Setup.exe /Download \\\\Server\\Share \\O365\\CC\\GetLatestCCBuild.xml**.
    
  
6. After it is run, Office Deployment Tool will download the latest Office UNRESOLVED_TOKEN_VAL(365) ProPlus Current Channel build into ** \\\\Server\\Share\\O365\\CC**.
    
  
 **Download first release for Deferred Channel build**
  
    
    

1. Download latest First Release Deferred Channel build. For an example XML, see  [Best practices: Sample configuration files for downloading Office 365 ProPlus](best-practices-sample-configuration-files-for-downloading-office-365-proplus.md)
    
  
2. Save the configuration file as **GetLatestFRDCBuild.xml**.
    
  
3. Confirm that Office Deployment Tool (setup.exe) is in **\\\\Server\\Share\\O365**.
    
  
4. Copy **GetLatestFRDCBuild.xml** to **\\\\Server\\Share\\O365\\FRDC**.
    
  
5. From an elevated command prompt with administrator privileges, run **\\\\Server\\Share\\O365\\Setup.exe /Download \\\\Server\\Share\\O365\\FRDC\\GetLatestFRDCBuild.xml**.
    
  
6. After it is run, Office Deployment Tool will download the latest Office UNRESOLVED_TOKEN_VAL(365) ProPlus First Release Deferred Channel build into ** \\\\Server\\Share\\O365\\FRDC**.
    
  
 **Download Deferred Channel build**
  
    
    

1. Download latest Deferred Channel build. For an example XML, see  [Best practices: Sample configuration files for downloading Office 365 ProPlus](best-practices-sample-configuration-files-for-downloading-office-365-proplus.md).
    
  
2. Save the configuration file as **GetLatestDCBuild.xml**.
    
  
3. Confirm that Office Deployment Tool (setup.exe) is in **\\\\Server\\Share\\O365**.
    
  
4. Copy **GetLatestDCBuild.xml** to ** \\\\Server\\Share\\O365\\DC**.
    
  
5. From an elevated command prompt with administrator privileges, run \\ **\\Server\\Share\\O365\\Setup.exe /Download \\\\Server\\Share\\O365\\DC\\GetLatestDCBuild.xml**.
    
  
6. After it is run, Office Deployment Tool will download the latest Office UNRESOLVED_TOKEN_VAL(365) ProPlus Deferred Channel build into **\\\\Server\\Share\\O365\\DC**.
    
  

## Install Office365 ProPlus and remove legacy version of Office

 **Install Office 365 ProPlus and remove legacy version of Office - Current Channel build**
  
    
    

1. Copy OffScrub to the workstations to be deployed.
    
  
2. From an elevated command prompt with administrator privileges, run the **OffScrub.vbs** with the appropriate command line switches.
    
  
3. Review the OffScrub exit codes that are contained within the script **Offscrub.vbs**.
    
    > [!NOTE]
      > Each version of OffScrub will have the same or similar Error/Success codes. Review each script for respective codes. 
4. From an elevated command prompt with administrator privileges, run **\\\\Server\\Share\\O365\\Setup.exe /Configure \\\\Server\\Share\\O365\\CC\\CC_configuration.xml**.
    
  
5. Review the installation log.
    
  
6. Reboot the workstation to cleanup any files that were not cleared from the registry during the OffScrub process.
    
  
 **Install Office 365 ProPlus and remove legacy version of Office - First Release for Deferred Channel build**
  
    
    

1. Copy OffScrub to the workstations to be deployed.
    
  
2. From an elevated command prompt with administrator privileges, run the **OffScrub.vbs** with the appropriate command line switches.
    
  
3. Review the OffScrub exit codes that are contained within the script **Offscrub.vbs**.
    
    > [!NOTE]
      > Each version of OffScrub will have the same or similar Error/Success codes. Review each script for respective codes. 
4. From an elevated command prompt with administrator privileges, run **\\\\Server\\Share\\O365\\Setup.exe /Configure \\\\Server\\Share\\O365\\FRDC\\FRDC_configuration.xml.xml**.
    
  
5. Review the installation log.
    
  
6. Reboot the workstation to cleanup any files that were not cleared from the registry during the OffScrub process.
    
  
 **Install Office 365 ProPlus and remove legacy version of Office - Deferred Channel build**
  
    
    

1. Copy OffScrub to the workstations to be deployed.
    
  
2. From an elevated command prompt with administrator privileges, run the **OffScrub.vbs** with the appropriate command line switches.
    
  
3. Review the OffScrub exit codes that are contained within the script **Offscrub.vbs**.
    
    > [!NOTE]
      > Each version of OffScrub will have the same or similar Error/Success codes. Review each script for respective codes. 
4. From an elevated command prompt with administrator privileges, run **\\\\Server\\Share\\O365\\Setup.exe /Configure \\\\Server\\Share\\O365\\DC\\DC_configuration.xml.xml**.
    
  
5. Review the installation log.
    
  
6. Reboot the workstation to cleanup any files that were not cleared from the registry during the OffScrub process.
    
  

## Post-deployment tasks


### Remove an application from Office ProPlus 365

You can remove a program from the Office Suite post deployment by using an XML configuration file. 
  
    
    
The parameters and settings for the XML file can be found at  [Reference: Configuration options for the Office Deployment Tool](https://technet.microsoft.com/en-us/library/jj219426.aspx). A graphical UI for creating the XML file can be found at the Office GitHub Repository  [Office Click-To-Run Configuration XML Editor](http://officedev.github.io/Office-IT-Pro-Deployment-Scripts/XmlEditor.mdl).
  
    
    

1. Configure an XML file to exclude an application. For an example XML file, see  [Best practices: Sample configuration files for downloading Office 365 ProPlus](best-practices-sample-configuration-files-for-downloading-office-365-proplus.md).
    
  
2. Save the configuration file as ** DCExcludeword_configuration.xml**.
    
  
3. Confirm that Office Deployment Tool (setup.exe) is in **\\\\Server\\Share\\O365**.
    
  
4. Copy **DCExcludeword_configuration.xml** to **\\\\Server\\Share\\O365\\DC**.
    
  
5. From an elevated command prompt with administrator privileges, run **\\\\Server\\Share\\O365\\Setup.exe /Configure \\\\Server\\Share\\O365\\DC\\DCExcludeword_configuration.xml**.
    
  

### Add an application to Office ProPlus 365

You can add a program to the Office Suite post deployment by using an XML configuration file. 
  
    
    
The parameters and settings for the XML file can be found at  [Reference: Configuration options for the Office Deployment Tool](https://technet.microsoft.com/en-us/library/jj219426.aspx). A graphical UI for creating the XML file can be found at the Office GitHub Repository  [Office Click-To-Run Configuration XML Editor](http://officedev.github.io/Office-IT-Pro-Deployment-Scripts/XmlEditor.mdl).
  
    
    

1. Configure an XML file by removing any excluded applications.
    
  
2. Save the configuration file as **DC_configuration.xml**.
    
  
3. Confirm that Office Deployment Tool (setup.exe) is in **\\\\Server\\Share\\O365**.
    
  
4. Copy **DC_configuration.xml** to ** \\\\Server\\Share\\O365\\DC**.
    
  
5. From an elevated command prompt with administrator privileges, run **\\\\Server\\Share\\O365\\Setup.exe /Configure \\\\Server\\Share\\O365\\DC\\DC_configuration.xml**.
    
  

### Add a language

You can add an additional language to Office UNRESOLVED_TOKEN_VAL(365) ProPlus.
  
    
    
If the Office UNRESOLVED_TOKEN_VAL(365) ProPlus is on Current Channel greater than update 2062, use the newest ODT and XML install file that identifies the language to be installed. If Office UNRESOLVED_TOKEN_VAL(365) ProPlus is not using the above requirements, a full XML configuration must be used.
  
    
    
 **Sample XML Add Spanish to Post Deployment - Deferred Channel**
  
    
    



```

<Configuration>
   <Add Channel="Deferred" OfficeClientEdition="32" SourcePath="\\\\Server\\Share\\O365\\DC">
      <Product ID="LanguagePack"> 
         <Language ID="es-es" />
      </Product> 
   </Add>
</Configuration> 
```

 **XML configuration file breakdown**
  
    
    

|||
|:-----|:-----|
|**Component** <br/> |**Explanation** <br/> |
|Channel="Deferred"  <br/> |The channel build of Office UNRESOLVED_TOKEN_VAL(365) ProPlus being installed.  <br/> |
|OfficeClientEdition="32"  <br/> |The architecture of Office being downloaded.  <br/> |
|Product ID="LanguagePack"  <br/> |Language Pack  <br/> |
|Language ID="en-us"  <br/> |The default language forOffice UNRESOLVED_TOKEN_VAL(365) ProPlus.  <br/> |
   

1. Save the configuration file as **DCLanguage_configuration.xml**.
    
  
2. Confirm that Office Deployment Tool (setup.exe) is in **\\\\Server\\Share\\O365**.
    
  
3. Copy **DCLangauge_configuration.xml** to **\\\\Server\\Share\\O365\\DC**.
    
  
4. From an elevated command prompt with administrator privileges, run **\\\\Server\\Share\\O365\\Setup.exe /Configure \\\\Server\\Share\\O365\\DC\\DCLanguage_configuration.xml**.
    
  

## Change update channels

It is a preferred practice to change the update channel by changing it in the Office 2016 Group Policy object if required. The changing of channels will result in a 100% delta change to the product. For more information on switching channels, see  [Best practices: Channel management](best-practices-channel-management.md).
  
    
    

## Rollback or downgrade strategy

In the unlikely scenario that the pilot or production group deems that the newly updated build is not suitable for use, a rollback or downgrade can be completed in order to get the group back on a previously known good or approved build of Office 365 ProPlus. For more information on rollbacks, see  [Best practices: Channel management](best-practices-channel-management.md).
  
    
    

