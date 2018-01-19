---
title: Configuration options for the Office 2016 Deployment Tool
ms.author: jwhit
author: jwhit-MSFT
manager: laurawi
ms.date: 12/12/2017
ms.audience: ITPro
ms.topic: concetpual
ms.service: o365-administration
localization_priority: Normal
ms.collection: Ent_O365
ms.custom:
- DeployProPlus
- DeployProPlus_SOConly
- Strat_O365_ProPlus
- Ent_Office_ProPlus
ms.assetid: d3879f0d-766c-469c-9440-0a9a2a905ca8
description: "Configuration options for the Office 2016 Deployment Tool"
---


# Configuration options for the Office 2016 Deployment Tool
With the Office Deployment Tool (ODT), you can download and deploy Office 365 ProPlus to your client computers. The ODT gives you more control over an Office installation: you can define which products and languages are installed, how those products should be updated, and whether or not to display the install experience to your users. This article covers all the available options in the tool. To learn how to use the tool itself, see  [Overview of the Office 2016 Deployment Tool](overview-of-the-office-2016-deployment-tool.md).

## Example of a standard configuration file

The ODT consists of two files: setup.exe and configuration.xml. To work with the tool, you edit the configuration file to define what options you want, and then run setup.exe from the command line. For example, you can edit the configuration file to download the 32-bit English edition of Office, or you can edit the file to install the 32-bit English edition of Office with the EULA automatically accepted and without Publisher.
  
When creating the configuration file, we recommend starting with an example file and updating it with the appropriate options for your environment. You can start by copying and pasting the example below into a text file and saving it with a name of your choosing. Use the file to modify the XML elements and attributes and use the rest of this article to learn more details about each of the elements and attributes.  
    
This configuration file includes the most-commonly used elements and attributes, and can be used to download and install Office on a client computer

```
<Configuration>
  <Add SourcePath="\\Server\Share" 
       OfficeClientEdition="32"
       Channel="Broad" >
    <Product ID="O365ProPlusRetail">
      <Language ID="en-us" />
      <Language ID="ja-jp" />
    </Product>
    <Product ID="VisioProRetail">
      <Language ID="en-us" />
      <Language ID="ja-jp" />
    </Product>
  </Add>
  <Updates Enabled="TRUE" 
           UpdatePath="\\Server\Share" 
           Channel="Broad" /> 
  <Display Level="None" AcceptEULA="TRUE" />  
  <Logging Level="Standard" Path="%temp%" /> 
</Configuration>
```

|**Value**|**Description**|
|:-----|:-----|
|Add SourcePath="\\Server\Share"  <br/> |Office will be downloaded to "\\server\share" on your network and deployed using installation files at that location.  <br/> |
|Add OfficeClientEdition="32"  <br/> |Downloads and installs the 32-bit edition of Office  <br/> |
|Add Channel="Broad"  <br/> |Office will be installed using the Semi-Annual Channel.  <br/> |
|Product ID="O365ProPlusRetail"  <br/> |Downloads and installs Office 365 ProPlus.  <br/> |
|Language ID="en-us"  <br/> Language ID="ja-jp"  <br/> |Downloads and installs English and Japanese versions of Office.  <br/> |
|Updates Enabled="TRUE"<br/> |Office will check for updates.  <br/> |
|Updates UpdatePath="\\Server\Share" <br/> |Office checks for updates at "\\server\share" on your network.  <br/> |
|Updates Channel="Broad"  <br/> |Office updates using the Semi-Annual Channel.  <br/> |
|Display Level="None" AcceptEULA="TRUE"  <br/> |When installing Office, no user interface is displayed.  <br/> |
|Logging Level="Standard" Path="%temp%"  <br/> |Log files are stored in the %temp% folder.  <br/> |
   
## Add element
    
Defines the products and languages to download or install

### Example

```
<Add SourcePath="\\Server\Share" 
     OfficeClientEdition="32"
     Channel="Broad" 
     Version="16.0.8201.2193"
     ForceUpgrade="FALSE">
  <Product ID="O365ProPlusRetail">
    <Language ID="en-us" />
    <Language ID="ja-jp" />
  </Product>
  <Product ID="VisioProRetail">
      <Language ID="en-us" />
      <Language ID="ja-jp" />
  </Product>
</Add>  
```

### SourcePath attribute (part of Add element) 

Optional. Defines the location of the Office installation files. If the ODT is run in download mode, defines where to save the files. If not included, the ODT will look for installation files in the same folder as the tool, and then use the Office Content Delivery Network (CDN). If not included and the ODT is run in download mode, the Office installation files are downloaded to the same folder as the tool.  

Example values:

- SourcePath="\\server\share\"
- SourcePath="c:\preload\office"

### Version attribute (part of Add element) 

Optional The default is the latest available version of Office.

Example value:

- Version="16.0.8201.2193"

### OfficeClientEdition attribute (part of Add element) 

Required. Defines whether the 32-bit or 64-bit edition of Office 365 ProPlus is downloaded or installed. 

Allowed values:

- OfficeClientEdition="64"
- OfficeClientEdition="32"

### Channel attribute (part of Add element) 

Optional. Defines which channel to use for installing Office. The default is **Broad** for Office 365 ProPlus and **Monthly** for Visio Pro for Office 365 and Project Online Desktop Client. 

For more information about update channels, see  [Overview of update channels for Office 365 ProPlus](overview-of-update-channels-for-office-365-proplus.md).  

Allowed values: 

- Channel="Monthly"
- Channel="Broad"
- Channel="Targeted"

### DownloadPath attribute (part of Add element) 

Optional. Defines where the installation files are downloaded from. Most commonly used to distribute specific languages and products for Office from a central location on your network to another location. To use this setting, run the ODT in download mode. If not included, the files are downloaded from the Office CDN.  

Example values: 

- DownloadPath="\\serverb\share\"

#### Example 

```
<Add SourcePath="\\Server\Share" 
     DownloadPath="\\serverb\share\"
     OfficeClientEdition="32"
     Channel="Broad" >
  <Product ID="O365ProPlusRetail">
      <Language ID="en-us" />
      <Language ID="ja-jp" />
  </Product>
</Add>  
```

### ForceUpgrade attribute (part of Add element) 

Optional. When set to **True**, ForceUpgrade automatically upgrades from Office 365 ProPlus 2013 to Office 365 ProPlus 2016 without asking for input from the user. This attribute is often used alongside the Display element to hide the user interface during installation. Default is **False**. 

Allowed values: 

- ForceUpgrade="TRUE"
- ForceUpgrade="FALSE"

## Product element

Defines which products to download or install. If you define multiple products, the products are installed in the order in the configuration file. The first product determines the context for the Microsoft Office First Run Experience. 

You can also use the Product element to add language packs to existing installations of Office 365 ProPlus. For more details on how, including an example configuration file, see  [Add languages to existing installations of Office 365 ProPlus](overview-of-the-office-2016-deployment-tool.md#BKMK_updatelanguages).

### Example

```
<Product ID="O365ProPlusRetail">
  <Language ID="en-us" />
  <Language ID="ja-jp" />
</Product>
<Product ID="VisioProRetail">
  <Language ID="en-us" />
  <Language ID="ja-jp" />
</Product>
```

### ID attribute (part of Product element)

Required. Defines the ID of the product to download or install. 

Example values:

Office 365 Product IDs: 
- ID="O365ProPlusRetail"  
- ID="VisioProRetail"
- ID="ProjectProRetail"

For a list of all supported product IDs, see  [Product IDs that are supported by the Office Deployment Tool for Click-to-Run](https://go.microsoft.com/fwlink/p/?LinkID=301891)

## Language element

Defines which languages to download or install. To install the same language as the client's operating system, use "MatchOS" as the ID. If you define multiple languages, the first language in the configuration file determines the Shell UI culture, including shortcuts, right-click context menus, and tooltips. If you decide that you want to change the Shell UI language after an initial installation, you have to uninstall and reinstall Office.

### Example

```
<Product ID="O365ProPlusRetail">
  <Language ID="en-us" />
  <Language ID="ja-jp" />
</Product>
```

### ID attribute (part of Language element)

Defines the ID of the language to download or install. Required.

#### Exaxmple values

- ID="en-us"
- ID="ja-jp"
- ID="MatchOS"

For a list of all languages, see  [Language identifiers](https://technet.microsoft.com/EN-US/library/cc179219%28v=office.16%29.aspx).  

## Display element

Defines what the user sees when Office is installed.

### Example

```
<Display Level="None" AcceptEULA="TRUE" />  
```

### Level attribute (part of Display element)

Optional. If **Level** is set to **None**, Office is installed with no user interface: no progress bars, completion screens, error messages, or other user interface are displayed.

If **Level** is set to **Full**, Office is installed with the normal installation experience. 

Default is **Full**. 

Allowed values:

- Level="None"
- Level="Full"

### AcceptEULA attribute (part of Display element)

Optional. If **AcceptEULA** is set to **TRUE**, the user does not see a Microsoft Software License Terms dialog box. If this attribute is set to **FALSE** or is not included, the user may see a Microsoft Software License Terms dialog box. We recommend that administrators set **AcceptEULA** to **TRUE**. 

This setting only applies if you install with the user's account. If you use System Center Configuration Manager or other software distribution tool that uses the SYSTEM account to install, then the setting is not applied.

Default is **FALSE**.

Allowed values:

- AcceptEULA="TRUE"
- AcceptEULA="FALSE"

## ExcludeApp element

Defines which Office 365 ProPlus products should not be installed.

### Example

```
<Add SourcePath="\\Server\Share" 
     OfficeClientEdition="32"
     Channel="Broad" >
  <Product ID="O365ProPlusRetail">
    <Language ID="en-us" />
    <Language ID="ja-jp" />
    <ExcludeApp ID="Publisher" />
  </Product>
</Add>  
```

### ID attribute (part of ExcludeApp element)

Required. Defines the ID of the product that should not be installed.
  
Allowed values:

- ID="Access"
- ID="Excel"
- ID="Groove"
- ID="Lync"
- ID="OneDrive"
- ID="OneNote"
- ID="Outlook"
- ID="PowerPoint"
- ID="Publisher"
- ID="Word"

For OneDrive for Business, use **Groove**. For Skype for Business, use **Lync**.

## Logging element

Defines options for ODT logging.

### Example

```
<Logging Level="Standard" 
         Path="%temp%" />
```

### Level attribute (part of Logging element)

Optional. Turns logging on or off. Default is **Standard**.

Allowed values:

- Level="Off"
- Level="Standard"

### Path attribute (part of Logging element)

Optional. Defines the location of the log files. Default is **%temp%**.

Example values:

- Path="%temp%"
- Path="\\server\share\userlogs\"

## Property element

Defines certain Office behaviors and properties.

### Example

```
<Property Name="FORCEAPPSHUTDOWN"
          Value="FALSE"/>
<Property Name="SharedComputerLicensing"
          Value="1"/>
<Property Name="PinIconsToTaskbar"
          Value="TRUE"/>

```

### Name attribute (part of Property element)

Required. Defines the specific property whose value you want to set.

### Value attribute (part of Property element)

Defines the value of the named property.

### AUTOACTIVATE property (part of Property element)

Because Office 365 ProPlus is set to activate automatically, you should not set this property for Office 365 ProPlus products. For other products, you can set **AUTOACTIVATE** to **1** to have the product activate automatically.

Optional. Default is **0**.

Allowed values:

- Property Name="AUTOACTIVATE"
          Value="0"
- Property Name="AUTOACTIVATE"
          Value="1"


### FORCEAPPSHUTDOWN property (part of Property element)

When set to **TRUE**, forces any apps that are blocking the install of Office to shut down. Data loss may occur. 

Optional. Default is **FALSE**.

Allowed values:

- Property Name="FORCEAPPSHUTDOWN"
          Value="FALSE"
- Property Name="FORCEAPPSHUTDOWN"
          Value="TRUE"


### PACKAGEGUID property (part of Property element)

By default, App-V packages created by the ODT share the same App-V Package ID. Administrators can use **PACKAGEGUID** to specify a different Package ID. This allows you to publish multiple App-V packages of Office to an App-V Management Server. But, this doesn't enable you to deploy more than one Office App-V package to a single computer. You can use the ODT to create App-V packages for Office 365 ProPlus. Creating packages for the volume-licensed versions of Office Professional Plus or Office Standard is not supported.

The Package ID must follow the format of the example and can only use these characters: 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, A, B, C, D, E, F  

If you use any other characters, the App-V package is created with the default Package ID.

Optional.

Example values:

- Property Name="PACKAGEGUID"
          Value="12345678-ABCD-1234-ABCD-1234567890AB"

### SharedComputerLicensing property (part of Property element)

Set **SharedComputerLicensing** to 1 if you deploy Office 365 ProPlus to shared computers by using Remote Desktop Services. 

For more information, see  [Overview of shared computer activation for Office 365 ProPlus](overview-of-shared-computer-activation-for-office-365-proplus.md).

Optional. Default value is **0**.

Allowed values:

- Property Name="SharedComputerLicensing"
          Value="0"
- Property Name="SharedComputerLicensing"
          Value="1"


### PinIconsToTaskBar property (part of Property element)

Defines whether shortcut icons for Office products are added to the Windows taskbar in Windows 7, 8, and 8.1. If you install Office using a system account, which is common when deploying with System Center Configuration Managers, the icons will not be pinned even if this property is set to **True**.

Optional. The default value is **True**.

Allowed values:

- Property Name="PinIconsToTaskbar"
          Value="FALSE"
- Property Name="PinIconsToTaskbar"
          Value="TRUE"


## Remove element

Defines which products and languages to remove from a previous installation of Office 365 ProPlus. To remove an installed language, you must provide both the product and the language, as in the example. 

For more information, see  [Overview of the Office 2016 Deployment Tool](overview-of-the-office-2016-deployment-tool.md).

### Example

```
<Remove All="FALSE">
  <Product ID="O365ProPlusRetail" >
    <Language ID="es-es" />
  </Product>
</Remove>
```


### All attribute (part of Remove element)

If set to **TRUE**, all Office 365 ProPlus products and languages will be removed.

Optional. The default value is **FALSE**.

Allowed values:

- All="FALSE"
- All="TRUE"

## Updates element

Defines how Office is updated after it's installed.

### Example

```
<Updates Enabled="TRUE" 
         UpdatePath="\\Server\Share\"
         Channel="Broad" />
```

### Enabled attribute (part of Updates element)

If set to **TRUE**, Office will check for updates. If set to **FALSE**, Office won't check for updates.

Optional. The default value is **TRUE**.

Allowed values:

- Enabled="TRUE"
- Enabled="FALSE"


### UpdatePath attribute (part of Updates element)

Defines where the updates for Office come from. If **UpdatePath** is not set or is set to empty (""), the location is set to the Office Content Delivery Network (CDN). **UpdatePath** can specify a network, local, or HTTP path of a source for Office installation files. Environment variables can be used for network or local paths. 

If you use Group Policy with the  [Office 2016](https://www.microsoft.com/download/details.aspx?id=49030) Administrative Template files (ADMX/ADML), you can set **UpdatePath** by using the **Update Path** policy setting. You can find this policy setting under Computer Configuration\Administrative Templates\Microsoft Office 2016 (Machine)\Updates.

Optional.

Example values:

- UpdatePath="\\server\share\"
- UpdatePath="C:\Preload\Office"
- UpdatePath="http://internalApps/Office/"

### TargetVersion attribute (part of Updates element)

Defines which version Office updates to. If **TargetVersion** is not set or is set to empty (""), Office updates to the most recent version from the specified update path. If **TargetVersion** is set to a specific build number, Office attempts to update to that version. 

If you use Group Policy with the  [Office 2016](https://www.microsoft.com/download/details.aspx?id=49030) Administrative Template files (ADMX/ADML), you can set **TargetVersion** by using the **Target Version** policy setting. You can find this policy setting under Computer Configuration\Administrative Templates\Microsoft Office 2016 (Machine)\Updates.

Optional.

Example values:

- TargetVersion="15.1.2.3"
- TargetVersion="""

### Deadline attribute (part of Updates element)

Defines a deadline by which updates must be applied. The deadline is specified in Coordinated Universal Time (UTC). You can use **Deadline** with **Target Version** to make sure that Office is updated to a particular version by a particular date. We recommend that you set the deadline at least a week in the future to allow users time to install the updates. 

Prior to the deadline, users receive multiple reminders to install the updates. If Office isn't updated by the deadline, users see a notification that the updates will be applied in 15 minutes. This gives users the opportunity to save the Office documents that they are working on and to close any Office programs that are open. If users don't close the Office programs,the programs are closed automatically when the 15 minutes are up, which might result in data loss. 

After the Office programs are closed, the updates are applied automatically. The deadline only applies to one set of updates. If you want to use a deadline to make sure that Office is always up-to-date, you must change the deadline every time a new update for Office is available.

To use this attribute, Office must be running at least Service Pack 1 (version 15.0.4569.1507). If you use Group Policy with the  [Office 2016](https://www.microsoft.com/download/details.aspx?id=49030) Administrative Template files (ADMX/ADML), you can set **Deadline** by using the **Update Deadline** policy setting. You can find this policy setting under Computer Configuration\Administrative Templates\Microsoft Office 2016 (Machine)\Updates.

Optional.

Example value:

- Deadline="05/16/2014 18:30"

### Channel attribute (part of Updates element)

Defines which channel to use for updating Office after it is installed. Note that there are two channel attributes: the channel for the Add element is used to specify an update channel while installing Office, and the channel for the Update element is used to change the channel for an existing installation of Office.

For more information about update channels, see  [Overview of update channels for Office 365 ProPlus](overview-of-update-channels-for-office-365-proplus.md). 

If you use Group Policy with the  [Office 2016 Administrative Template files (ADMX/ADML)](https://go.microsoft.com/fwlink/p/?LinkID=626001), you can set **Channel** by using the **Update Channel** policy setting. You can find this policy setting under Computer Configuration\Administrative Templates\Microsoft Office 2016 (Machine)\Updates. If enabled, this Group Policy setting takes precedence over the **Channel** value set by using the Office Deployment Tool.

Optional. The default is **Broad** for Office 365 ProPlus and **Monthly** for Visio Pro for Office 365 and Project Online Desktop Client.

Allowed values:

- Channel="Monthly"
- Channel="Broad"
- Channel="Targeted"

## Related topics

- [Overview of the Office 2016 Deployment Tool](overview-of-the-office-2016-deployment-tool.md)    
- [Deployment guide for Office 365 ProPlus](deployment-guide-for-office-365-proplus.md)
- [Language identifiers](https://technet.microsoft.com/EN-US/library/cc179219%28v=office.16%29.aspx)
  
    
    

