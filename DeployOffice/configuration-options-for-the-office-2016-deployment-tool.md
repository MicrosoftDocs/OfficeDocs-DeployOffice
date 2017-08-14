---
title: Configuration options for the Office 2016 Deployment Tool
ms.prod: OFFICE365
ms.assetid: d3879f0d-766c-469c-9440-0a9a2a905ca8
---


# Configuration options for the Office 2016 Deployment Tool

With the Office Deployment Tool (ODT), you can download and deploy Office 365 ProPlus to your client computers. The ODT gives you more control over an Office installation: you can define which products and languages are installed, how those products should be updated, and whether or not to display the install experience to your users. This article covers all the available options in the tool. To learn how to use the tool itself, see  [Overview of the Office 2016 Deployment Tool](overview-of-the-office-2016-deployment-tool.md).
  
    
    


## Example of a standard configuration file

The ODT consists of two files: setup.exe and configuration.xml. To work with the tool, you edit the configuration file to define what options you want, and then run setup.exe from the command line. For example, you can edit the configuration file to download the 32-bit English edition of Office, or you can edit the file to install the 32-bit English edition of Office with the EULA automatically accepted and without Publisher.
  
    
    
When creating the configuration file, we recommend starting with an example file and updating it with the appropriate options for your environment. You can start by copying and pasting the example below into a text file and saving it with a name of your choosing. Use the file to modify the XML elements and attributes and use the reference table in this article to learn more details about each of the elements and attributes.
  
    
    
This configuration file includes the most-commonly used elements and attributes, and can be used to download and install Office on a client computer
  
    
    



```

<Configuration>
  <Add SourcePath="\\\\Server\\Share" OfficeClientEdition="32" Channel="Deferred" >
    <Product ID="O365ProPlusRetail">
      <Language ID="en-us" />
      <Language ID="ja-jp" />
    </Product>
    <Product ID="VisioProRetail">
      <Language ID="en-us" />
    </Product>
  </Add>  
  <Updates Enabled="TRUE" UpdatePath="\\\\Server\\Share" /> 
  <Display Level="None" AcceptEULA="TRUE" />  
  <Logging Level="Standard" Path="%temp%" /> 
</Configuration>

```



|**Value**|**Description**|
|:-----|:-----|
|SourcePath="\\\\Server\\Share"  <br/> |Office will be downloaded to "\\\\server\\share" on your network and deployed using installation files at that location.  <br/> |
|OfficeClientEdition="32"  <br/> |Downloads and installs the 32-bit edition of Office  <br/> |
|Channel="Deferred"  <br/> |After installation, Office will be updated using the Deferred channel.  <br/> |
|Product ID="O365ProPlusRetail"  <br/> |Downloads and installs Office 365 ProPlus.  <br/> |
|Language ID="en-us"  <br/> Language ID="ja-jp"  <br/> |Downloads and installs English and Japanese versions of Office.  <br/> |
|Updates Enabled="TRUE" UpdatePath="\\\\Server\\Share"  <br/> |After installation, Office checks for updates at "\\\\server\\share" on your network.  <br/> |
|Display Level="None" AcceptEULA="TRUE"  <br/> |When installing Office, no user interface is displayed.  <br/> |
|Logging Level="Standard" Path="%temp%"  <br/> |Log files are stored in the %temp% folder.  <br/> |
   

## Configuration options for the Office Deployment Tool

The following options apply to running the ODT in download, configure, or packager mode.
  
    
    


|**Name**|**Description**|**Example**|
|:-----|:-----|:-----|
|**Add** element <br/> |Defines the products and languages to download or install  <br/> |
```

<Add SourcePath="\\\\Server\\Share"
     OfficeClientEdition="32" 
     Channel="Deferred" >
  <Product ID="O365ProPlusRetail">
    <Language ID="en-us" />
    <Language ID="ja-jp" />
  </Product>
  <Product ID="VisioProRetail">
    <Language ID="en-us" />
  </Product>
</Add>
```

|
|**SourcePath** attribute (part of Add element) <br/> |Defines the location of the Office installation files. If the ODT is run in download mode, defines where to save the files.  <br/> Optional. If not included, the ODT will look for installation files in the same folder as the tool, and then use the Office Content Delivery Network (CDN). If not included and the ODT is run in download mode, the Office installation files are downloaded to the same folder as the tool.  <br/> | `SourcePath="\\\\server\\share\\"` <br/>  `SourcePath="c:\\preload\\office"` <br/> |
|**Version** attribute (part of Add element) <br/> |Optional. The default is the latest available version of Office is used.  <br/> | `Version="16.0.6741.2056"` <br/> |
|**OfficeClientEdition** attribute (part of Add element) <br/> |Defines whether the 32-bit or 64-bit edition of Office 365 ProPlus is downloaded or installed.  <br/> Required.  <br/> | `OfficeClientEdition="32"` <br/>  `OfficeClientEdition="64"` <br/> |
|**Channel** attribute (part of Add element) <br/> |Defines which channel to use for updating Office after it is installed.  <br/> Optional. The default is **Deferred** for Office 365 ProPlus and **Current** for Visio Pro for Office 365 and Project Online Desktop Client. <br/> For more information about update channels, see  [Overview of update channels for Office 365 ProPlus](overview-of-update-channels-for-office-365-proplus.md).  <br/> | `Channel="Current"` <br/>  `Channel="Deferred"` <br/>  `Channel="FirstReleaseDeferred"` <br/>  `Channel="FirstReleaseCurrent"` <br/> |
|**DownloadPath** attribute (part of Add element) <br/> |Defines where the installation files are downloaded from. Most commonly used to distribute specific languages and products for Office from a central location on your network to another location.  <br/> To use this setting, run the ODT in download mode.  <br/> Optional. If not included, the files are downloaded from the Office CDN.  <br/> | `DownloadPath="\\\\serverb\\share\\"` <br/> |
|**ForceUpgrade** attribute (part of Add element) <br/> |When set to True, ForceUpgrade automatically upgrades from Office 365 ProPlus 2013 to Office 365 ProPlus 2016 without asking for input from the user. This attribute is often used alongside the Display element to hide the user interface during installation.  <br/> Optional. Default is **False**. <br/> | `ForceUpgrade="FALSE` `"` <br/>  `ForceUpgrade="TRUE"` <br/> |
|**Product** element <br/> |Defines which products to download or install.  <br/> If you define multiple products, the products are installed in the order in the configuration file. The first product determines the context for the Microsoft Office First Run Experience.  <br/> You can use the Product element to add language packs to existing installations of Office 365 ProPlus. For more details on how, including an example configuration file, see  [Add languages to existing installations of Office 365 ProPlus](overview-of-the-office-2016-deployment-tool.md#BKMK_updatelanguages).  <br/> |
```

<Product ID="O365ProPlusRetail">
  <Language ID="en-us" />
  <Language ID="ja-jp" />
</Product>
<Product ID="VisioProRetail">
  <Language ID="en-us" />
</Product> 
```

|
|**ID** attribute (part of Product element) <br/> |Defines the ID of the product to download or install.  <br/> Required.  <br/> |Office 365 Product IDs:  <br/>  `ID="O365ProPlusRetail"` <br/>  `ID="VisioProRetail"` <br/>  `ID="ProjectProRetail"` <br/> For a list of all supported product IDs, see  [Product IDs that are supported by the Office Deployment Tool for Click-to-Run](https://go.microsoft.com/fwlink/p/?LinkID=301891) <br/> |
|**Language** element <br/> |Defines which languages to download or install. To install the same language as the client's operating system, use "MatchOS" as the ID.  <br/> If you define multiple languages, the first language in the configuration file determines the Shell UI culture, including shortcuts, right-click context menus, and tooltips.  <br/> If you decide that you want to change the Shell UI language after an initial installation, you have to uninstall and reinstall Office.  <br/> |
```

<Language ID="en-us" />
<Language ID="ja-jp" />
<Language ID="MatchOS" />
```

|
|**ID** attribute (part of Language element) <br/> |Defines the ID of the language to download or install.  <br/> Required.  <br/> | `ID="en-us"` <br/>  `ID="ja-jp"` <br/>  `ID="MatchOS"` <br/> For a list of all languages, see  [Language identifiers](https://technet.microsoft.com/EN-US/library/cc179219%28v=office.16%29.aspx).  <br/> |
|**Display** element <br/> |Defines what the user sees when Office is installed.  <br/> |
```

<Display Level="None" 
         AcceptEULA="TRUE" />
```

|
|**Level** attribute (part of Display element) <br/> |If **Level** is set to **None**, Office is installed with no user interface: no progress bars, completion screens, error messages, or other user interface are displayed. <br/> If **Level** is set to **Full**, Office is installed with the normal installation experience. <br/> Optional. Default is **Full**. <br/> | `Level="None"` <br/>  `Level="Full"` <br/> |
|**AcceptEULA** attribute (part of Display element) <br/> |If **AcceptEULA** is set to **TRUE**, the user does not see a Microsoft Software License Terms dialog box. <br/> If this attribute is set to **FALSE** or is not included, the user may see a Microsoft Software License Terms dialog box. <br/> We recommend that administrators set **AcceptEULA** to **TRUE**. <br/> This setting only applies if you install with the user's account. If you use System Center Configuration Manager or other software distribution tool that uses the SYSTEM account to install, then the setting is not applied.  <br/> Optional. Default is **FALSE**. <br/> | `AcceptEULA="TRUE"` <br/>  `AcceptEULA="FALSE"` <br/> |
|**ExcludeApp** element <br/> |Defines which Office 365 ProPlus products should not be installed.  <br/> |
```

<Add SourcePath="\\\\Server\\share" 
     OfficeClientEdition="32">
  <Product ID="O365ProPlusRetail" >
    <Language ID="en-us" />
    <ExcludeApp ID="Publisher" />
  </Product>
</Add>

```

|
|**ID** attribute (part of ExcludeApp element) <br/> |Defines the ID of the product that should not be installed.  <br/> Required.  <br/> | `ID="Access"` <br/>  `ID="Excel"` <br/>  `ID="Groove"` <br/>  `ID="Lync"` <br/>  `ID="OneDrive"` <br/>  `ID="OneNote"` <br/>  `ID="Outlook"` <br/>  `ID="PowerPoint"` <br/>  `ID="Publisher"` <br/>  `ID="Word"` <br/> For OneDrive for Business, use **Groove**. For Skype for Business, use **Lync**. <br/> |
|**Logging** element <br/> |Defines options for ODT logging  <br/> |
```

<Logging Level="Standard" 
         Path="%temp%" />

```

|
|**Level** attribute (part of Logging element) <br/> |Turns logging on or off.  <br/> Optional. Default is **Standard** <br/> | `Level="Off"` <br/>  `Level="Standard"` <br/> |
|**Path** attribute (part of Logging element) <br/> |Defines the location of the log files.  <br/> Optional. Default is **%temp%**. <br/> | `Path="%temp%"` <br/>  `Path="\\\\server\\share\\userlogs\\"` <br/> |
|**Property** element <br/> |Defines certain Office behaviors and properties.  <br/> |
```

<Property Name="FORCEAPPSHUTDOWN"
          Value="FALSE"/>
    <Property Name="SharedComputerLicensing"
          Value="1"/>
    <Property Name="PinIconsToTaskbar"
          Value="TRUE"/>
```

|
|**Name** attribute (part of Property element) <br/> |Defines the specific property whose value you want to set.  <br/> Required.  <br/> ||
|**Value** attribute (part of Property element) <br/> |Defines the value of the named property.  <br/> ||
|**AUTOACTIVATE** property (part of Property element) <br/> |Because Office 365 ProPlus is set to activate automatically, you should not set this property for Office 365 ProPlus products.  <br/> For other products, you can set **AUTOACTIVATE** to **1** to have the product activate automatically. <br/> Optional. Default is **0**. <br/> |
```

<Property Name="AUTOACTIVATE"
          Value="0"/>
```


```

<Property Name="AUTOACTIVATE"
          Value="1"/>
```

|
|**FORCEAPPSHUTDOWN** property (part of Property element) <br/> |When set to **TRUE**, forces any apps that are blocking the install of Office to shut down. Data loss may occur. <br/> Optional. Default is **FALSE**. <br/> |
```

<Property Name="FORCEAPPSHUTDOWN"
          Value="FALSE"/>
    <Property Name="FORCEAPPSHUTDOWN"
          Value="TRUE"/>
```

|
|**PACKAGEGUID** property (part of Property element) <br/> |By default, App-V packages created by the ODT share the same App-V Package ID. Administrators can use **PACKAGEGUID** to specify a different Package ID. <br/> This allows you to publish multiple App-V packages of Officee to an App-V Management Server. But, this doesn't enable you to deploy more than one Office App-V package to a single computer.  <br/> You can use the ODT to create App-V packages for Office 365 ProPlus. Creating packages for the volume-licensed versions of Office Professional Plus or Office Standard is not supported.  <br/> Optional.  <br/> |
```

<Property Name="PACKAGEGUID"
          Value="12345678-ABCD-1234-ABCD-1234567890AB"/>
```

The Package ID must follow the format of the example and can only use these characters:  <br/> 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, A, B, C, D, E, F  <br/> If you use any other characters, the App-V package is created with the default Package ID.  <br/> |
|**SharedComputerLicensing** property (part of Property element) <br/> |**SharedComputerLicensing** to 1 if you deploy Office 365 ProPlus to shared computers by using Remote Desktop Services. <br/> For more information, see  [Overview of shared computer activation for Office 365 ProPlus](overview-of-shared-computer-activation-for-office-365-proplus.md).  <br/> Optional. Default value is **0**. <br/> |
```

<Property Name="SharedComputerLicensing"
          Value="0"/>
```


```

<Property Name="SharedComputerLicensing"
          Value="1"/>
```

|
|**PinIconsToTaskBar** property (part of Property element) <br/> |Defines whether shortcut icons for Office products are added to the Windows taskbar in Windows 7, 8, and 8.1.  <br/> If you install Office using a system account, which is common when deploying with System Center Configuration ManagerS, the icons will not be pinned even if this property is set to True.  <br/> Optional. The default value is **True**. <br/> |
```

<Property Name="PinIconsToTaskbar"
          Value="FALSE"/>
```


```

<Property Name="PinIconsToTaskbar"
          Value="TRUE"/>
```

|
|**Remove** element <br/> |Defines which products and languages to remove from a previous installation of Office 365 ProPlus.  <br/> To remove an installed language, you must provide both the product and the language, as in the example. For more information, see  [Overview of the Office 2016 Deployment Tool](overview-of-the-office-2016-deployment-tool.md).  <br/> |
```

<Remove All="FALSE">
  <Product ID="O365ProPlusRetail" >
    <Language ID="es-es" />
  </Product>
</Remove>
```

|
|**All** attribute (part of Remove element) <br/> |If set to TRUE, all Office 365 ProPlus products and languages will be removed.  <br/> Optional. The default value is **FALSE**. <br/> | `All="FALSE"` <br/>  `All="TRUE"` <br/> |
|**Updates** element <br/> |Defines how Office is updated after it's installed  <br/> |
```

<Updates Enabled="TRUE" 
         UpdatePath="\\\\Server\\Share\\"
         Channel="Deferred" />
```

|
|**Enabled** attribute (part of Updates element) <br/> |If set to **TRUE**, Office will check for updates. If set to **FALSE**, Office won't check for updates. <br/> Optional. The default value is **TRUE**. <br/> | `Enabled="TRUE"` <br/>  `Enabled="FALSE"` <br/> |
|**UpdatePath** attribute (part of Updates element) <br/> |Defines where the updates for Office come from.  <br/> If UpdatePath is not set or is set to empty (""), the location is set to the Office Content Delivery Network (CDN).  <br/> **UpdatePath** can specify a network, local, or HTTP path of a source for Office installation files. Environment variables can be used for network or local paths. <br/> If you use Group Policy with the  [Office 2016](https://www.microsoft.com/download/details.aspx?id=49030) Administrative Template files (ADMX/ADML), you can set **UpdatePath** by using the **Update Path** policy setting. You can find this policy setting under Computer Configuration\\Administrative Templates\\Microsoft Office 2016 (Machine)\\Updates. <br/> Optional.  <br/> | `UpdatePath="\\\\server\\share\\"` <br/>  `UpdatePath="C:\\Preload\\Office"` <br/>  `UpdatePath="http://internalApps/Office/"` <br/> |
|**TargetVersion** attribute (part of Updates element) <br/> |Defines which version Office updates to.  <br/> If **TargetVersion** is not set or is set to empty (""), Office updates to the most recent version from the specified update path. <br/> If **TargetVersion** is set to a specific build number, Office attempts to update to that version.. <br/> If you use Group Policy with the or  [Office 2016](https://www.microsoft.com/download/details.aspx?id=49030) Administrative Template files (ADMX/ADML), you can set **TargetVersion** by using the **Target Version** policy setting. You can find this policy setting under Computer Configuration\\Administrative Templates\\Microsoft Office 2016 (Machine)\\Updates. <br/> Optional.  <br/> | `TargetVersion="15.1.2.3"` <br/>  `TargetVersion="""` <br/> |
|**Deadline** attribute (part of Updates element) <br/> |Defines a deadline by which updates must be applied. The deadline is specified in Coordinated Universal Time (UTC).  <br/> You can use **Deadline** with **Target Version** to make sure that Office is updated to a particular version by a particular date. We recommend that you set the deadline at least a week in the future to allow users time to install the updates. <br/> Prior to the deadline, users receive multiple reminders to install the updates. If Office isn't updated by the deadline, users see a notification that the updates will be applied in 15 minutes. This gives users the opportunity to save the Office documents that they are working on and to close any Office programs that are open. If users don't close the Office programs, the programs are closed automatically when the 15 minutes are up, which might result in data loss. After the Office programs are closed, the updates are applied automatically.  <br/> The deadline only applies to one set of updates. If you want to use a deadline to make sure that Office is always up-to-date, you must change the deadline every time that a new update for Office is available.  <br/> To use this attribute, Office must be running at least Service Pack 1 (version 15.0.4569.1507).  <br/> If you use Group Policy with the  [Office 2016](https://www.microsoft.com/download/details.aspx?id=49030) Administrative Template files (ADMX/ADML), you can set **Deadline** by using the **Update Deadline** policy setting. You can find this policy setting under Computer Configuration\\Administrative Templates\\Microsoft Office 2016 (Machine)\\Updates. <br/> Optional.  <br/> | `Deadline="05/16/2014 18:30"` <br/> |
|**Channel** attribute (part of Updates element) <br/> |Defines which channel to use for updating Office after it is installed. Note that there are two channel attributes: the channel for the Add element is used to specify an update channel while installing Office, and the channel for the Update element is used to change the channel for an existing installation of Office.  <br/> For more information about update channels, see  [Overview of update channels for Office 365 ProPlus](overview-of-update-channels-for-office-365-proplus.md).  <br/> If you use Group Policy with the  [Office 2016 Administrative Template files (ADMX/ADML)](https://go.microsoft.com/fwlink/p/?LinkID=626001), you can set **Channel** by using the **Update Channel** policy setting. You can find this policy setting under Computer Configuration\\Administrative Templates\\Microsoft Office 2016 (Machine)\\Updates. If enabled, this Group Policy setting takes precedence over the **Channel** value set by using the Office Deployment Tool. <br/> Optional. The default is **Deferred** for Office 365 ProPlus and **Current** for Visio Pro for Office 365 and Project Online Desktop Client. <br/> | `Channel="Current"` <br/>  `Channel="Deferred"` <br/>  `Channel="FirstReleaseDeferred"` <br/>  `Channel="FirstReleaseCurrent"` <br/> |
   

## Related Topics

 [Overview of the Office 2016 Deployment Tool](overview-of-the-office-2016-deployment-tool.md)
  
    
    
 [Deployment guide for Office 365 ProPlus](deployment-guide-for-office-365-proplus.md)
  
    
    
 [Language identifiers](https://technet.microsoft.com/EN-US/library/cc179219%28v=office.16%29.aspx)
  
    
    

