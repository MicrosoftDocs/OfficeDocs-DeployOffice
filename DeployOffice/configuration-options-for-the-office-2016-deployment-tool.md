---
title: Configuration options for the Office Deployment Tool
ms.author: jwhit
author: jwhit-MSFT
manager: laurawi
audience: ITPro
ms.topic: reference
ms.service: o365-proplus-itpro
localization_priority: Priority
ms.collection:
- Ent_O365
- M365-modern-desktop
ms.custom: Ent_Office_ProPlus
description: "Configuration options for the Office Deployment Tool"
---


# Configuration options for the Office Deployment Tool
With the Office Deployment Tool (ODT), you can download and deploy Office 365 ProPlus to your client computers. The ODT gives you more control over an Office installation: you can define which products and languages are installed, how those products should be updated, and whether or not to display the install experience to your users. This article covers all the available options in the tool. To learn how to use the tool itself, see  [Overview of the Office Deployment Tool](overview-of-the-office-2016-deployment-tool.md).

> [!NOTE]
> **Best practice:** The options in this article show the XML elements and attributes in the configuration file. You can continue to create the configuration file in a text editor, but we recommend using the [Office Customization Tool](https://config.office.com/) instead. With the Office Customization Tool, you can easily create and modify configuration files in a web-based interface. For more details, see [Overview of the Office Customization Tool](overview-of-the-office-customization-tool-for-click-to-run.md).

## Example of a standard configuration file

The ODT consists of two files: setup.exe and configuration.xml. To work with the tool, you edit the configuration file to define what options you want, and then run setup.exe from the command line. For example, you can edit the configuration file to download the 32-bit English edition of Office, or you can edit the file to install the 32-bit English edition of Office with the EULA automatically accepted and without Publisher.

When creating the configuration file, we recommend starting with an example file and updating it with the appropriate options for your environment. You can start by copying and pasting the example below into a text file and saving it with a name of your choosing. Use the file to modify the XML elements and attributes and use the rest of this article to learn more details about each of the elements and attributes.   

This configuration file includes the most-commonly used elements and attributes, and can be used to download and install Office on a client computer

```xml
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
           UpdatePath="\\Server\Share" />
   <Display Level="None" AcceptEULA="TRUE" />  
  <Logging Level="Standard" Path="%temp%" /> 
</Configuration>
```

|**Value**|**Description**|
|:-----|:-----|
|Add SourcePath="\\\Server\Share"  <br/> |Office will be downloaded to "\\\server\share" on your network and deployed using installation files at that location.  <br/> |
|Add OfficeClientEdition="32"  <br/> |Downloads and installs the 32-bit edition of Office  <br/> |
|Add Channel="Broad"  <br/> |Office will be installed using the Semi-Annual Channel.  <br/> |
|Product ID="O365ProPlusRetail"  <br/> |Downloads and installs Office 365 ProPlus.  <br/> |
|Language ID="en-us"  <br/> Language ID="ja-jp"  <br/> |Downloads and installs English and Japanese versions of Office.  <br/> |
|Updates Enabled="TRUE"<br/> |Office will check for updates.  <br/> |
|Updates UpdatePath="\\\Server\Share" <br/> |Office checks for updates at "\\server\share" on your network.  <br/> |
|Display Level="None" AcceptEULA="TRUE"  <br/> |When installing Office, no user interface is displayed.  <br/> |
|Logging Level="Standard" Path="%temp%"  <br/> |Log files are stored in the %temp% folder.  <br/> |

## Add element

Defines the products and languages to download or install

### Example

```xml
<Add SourcePath="\\Server\Share" 
     OfficeClientEdition="32"
     Channel="Broad" 
     Version="16.0.8201.2193" >
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

Note that when you download Office to a folder that already contains that version of Office, the ODT will conserve your network bandwidth by downloading only the missing files. For example, if you use the ODT to download Office in English and German to a folder that already contains Office in English, only the German language pack will be downloaded.

Example values:

- SourcePath="\\\server\share\"
- SourcePath="c:\preload\office"

### Version attribute (part of Add element)

Optional. The default is the latest available version of Office. When you use the Version attribute, we recommend including the Channel attribute as well. If you don't include the Channel attribute, the default channel will be used, which might not match the specified version.

If Office 365 ProPlus is already installed on a device, you can use Version="MatchInstalled" to install the same version of Office, even if a newer version is available. This setting can make it easier to add language packs or Visio and Project without updatinging Office to a newer version. 

Example values:

- Version="16.0.8201.2193"
- Version="MatchInstalled"


### OfficeClientEdition attribute (part of Add element) 

Optional. Defines whether the 32-bit or 64-bit edition of Office 365 ProPlus is downloaded or installed. If Office is not installed on the device and OfficeClientEdition is not specified, the ODT will default to the 64-bit edition, unless the device is running a 32-bit edition of Windows or has less than 4 GB RAM. If Office is installed and OfficeClientEdition not specified, the ODT will match the architecture of the existing installation of Office. If Office is installed and OfficeClientEdition is specified, then it must match the already installed architecture. If it doesn't, the installation will fail, since mixed architectures are not supported. 

Allowed values:

- OfficeClientEdition="64"
- OfficeClientEdition="32"

### Channel attribute (part of Add element) 

Optional. Defines which channel to use for installing Office. The default is **Broad** for Office 365 ProPlus and applies to Visio Online Plan 2 (previously named Visio Pro for Office 365) and Project Online Desktop client if deployed along with Office 365 ProPlus.  The default is **Monthly** for Visio Online Plan 2 and Project Online Desktop Client if deployed standalone without Office 365 ProPlus. 

For more information about update channels, see  [Overview of update channels for Office 365 ProPlus](overview-of-update-channels-for-office-365-proplus.md).  

Allowed values: 

- Channel="Monthly"
- Channel="Broad"
- Channel="Targeted"

Use "Broad" for Semi-Annual Channel and "Targeted" for Semi-Annual Channel (Targeted).

If you're deploying Office Professional Plus 2019, which is a volume licensed version of Office, there is a different update channel you need to use: PerpetualVL2019. For more information, see [Update channel for Office 2019](office2019/update.md#update-channel-for-office-2019).

### DownloadPath attribute (part of Add element)

Optional. Defines where the installation files are downloaded from. Most commonly used to distribute specific languages and products for Office from a central location on your network to another location. To use this setting, run the ODT in download mode. If not included, the files are downloaded from the Office CDN.  Note that you must specify a version when using DownloadPath, as shown in the example.

Example values: 

- DownloadPath="\\\servera\share\"

#### Example 

```xml
<Configuration> 
  <Add SourcePath="\\serverb\share" OfficeClientEdition="64" Version="16.0.6741.2056" DownloadPath="\\servera\share"> 
    <Product ID="O365ProPlusRetail" > 
      <Language ID="en-us" />      
    </Product> 
  </Add> 
</Configuration>
```

### AllowCdnFallback attribute (part of Add element) 

Optional. To use the Office CDN as a backup source for language packs, include the "AllowCdnFallback" attribute in the configuration file, as shown in the example.

When installing languages, the ODT looks first for source files in the location specified in the SourcePath attribute. If the language pack isn't available at that location **and** the AllowCdnFallback setting is set to True, then the ODT will use source files from the Office CDN.

Allowed values: 

- AllowCdnFallback="True"
- AllowCdnFallback="False"

#### Example 

```xml
<Add SourcePath="\\Server\Share" 
     OfficeClientEdition="32"
     Channel="Broad" 
     AllowCdnFallback="True">
  <Product ID="O365ProPlusRetail">
      <Language ID="en-us" />
      <Language ID="ja-jp" />
  </Product>
</Add>  
```

### MigrateArch attribute (part of Add element)

Optional. If set to TRUE, then your existing installation of Office 365 ProPlus will be changed to the architecture (sometimes referred to as the bitness) that is specified in the [OfficeClientEdition attribute](#officeclientedition-attribute-part-of-add-element). For example, you can use this to change a 32-bit installation of Office 365 ProPlus to a 64-bit installation.

For more information about using MigrateArch, see [Change an Office 365 ProPlus installation from 32-bit to 64-bit](change-bitness.md).

### OfficeMgmtCOM attribute (part of Add element)

Optional. For Configuration Manager to be able to manage Office 365 client updates, an Office COM object needs to be enabled on the computer where Office is installed. If set to TRUE, the Office COM object takes commands from Configuration Manager to download and install client updates. When the Office COM object is enabled, the Update Now option on the Account page for Office 365 ProPlus is automatically disabled for client devices.

For more information, see [Manage updates to Office 365 ProPlus with System Center Configuration Manager](manage-updates-to-office-365-proplus-with-system-center-configuration-manager.md).

Allowed values: 

- OfficeMgmtCOM="True"
- OfficeMgmtCOM="False"

#### Example 

```xml
<Configuration>
  <Add OfficeClientEdition="64" Channel="Monthly" OfficeMgmtCOM="True" >
    <Product ID="O365ProPlusRetail">
      <Language ID="en-us" />
    </Product>
  </Add>  
  <Updates Enabled="True"  /> 
</Configuration>
```

## Product element

Defines which products to download or install. If you define multiple products, the products are installed in the order in the configuration file. The first product determines the context for the Microsoft Office First Run Experience. 

You can also use the Product element to add language packs to existing installations of Office 365 ProPlus. For more details on how, including an example configuration file, see  [Deploy languages to existing installations of Office 365 ProPlus](overview-of-deploying-languages-in-office-365-proplus.md#deploy-languages-to-existing-installations-of-office-365-proplus).

### Example

```xml
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

- ID="O365ProPlusRetail"  
- ID="VisioProRetail"
- ID="ProjectProRetail"

For a list of all supported product IDs, see  [Product IDs that are supported by the Office Deployment Tool for Click-to-Run](https://go.microsoft.com/fwlink/p/?LinkID=301891)

## Language element

Defines which languages to download or install. If you define multiple languages, the first language in the configuration file determines the Shell UI culture, including shortcuts, right-click context menus, and tooltips. If you decide that you want to change the Shell UI language after an initial installation, you have to uninstall and reinstall Office. 

Note that MatchOS and MatchInstalled cannot install the operating system languages if Office doesn't support that language or if the ODT cannot find the correct language pack in the local source files. To help address this issue, we recommend that you specify a backup language and and a backup source location for the language pack. To do so, use the Fallback attribute and AllowCdnFallBack attribute. For more details, see [Overview of deploying languages](overview-of-deploying-languages-in-office-365-proplus.md).

### Example

```xml
<Product ID="O365ProPlusRetail">
  <Language ID="en-us" />
  <Language ID="ja-jp" />
</Product>
```

```xml
<Add SourcePath="\\Server\Share" 
     OfficeClientEdition="32"
     Channel="Broad" 
     AllowCdnFallback="True">
  <Product ID="O365ProPlusRetail">
     <Language ID="MatchInstalled" />
	 <Language ID="MatchOS" Fallback="en-us" />
  </Product>
</Add>  
```

### ID attribute (part of Language element)

Defines the ID of the language to download or install. Required.

#### Example values

- ID="en-us"
- ID="ja-jp"
- ID="MatchOS"
- ID="MatchPreviousMSI"

For a list of all languages, see [Languages, culture codes, and companion proofing languages](overview-of-deploying-languages-in-office-365-proplus.md#languages-culture-codes-and-companion-proofing-languages).

For more information about MatchPreviousMSI, see [Remove existing MSI versions of Office when upgrading to Office 365 ProPlus](upgrade-from-msi-version.md).

### Fallback attribute (part of Language element)

When using MatchOS, we recommend that you specify a fallback language to install when a matched language isn't supported by Office or can't be found in the local source files. To do so, use the "Fallback" attribute. For more details, see [Install the same languages as the operating system](overview-of-deploying-languages-in-office-365-proplus.md#install-the-same-languages-as-the-operating-system).

Example values:

- Fallback="en-us"
- Fallback="ja-jp"

## Display element

Defines what the user sees when Office is installed.

### Example

```xml
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

Default is **FALSE**.

Allowed values:

- AcceptEULA="TRUE"
- AcceptEULA="FALSE"

> [!NOTE]
> If you deploy a version of Office before Version 1803, this setting will be applied only if you install with the user's account. System Center Configuration Manager and other software distribution tools that use the SYSTEM account for installation will not apply the setting.

## ExcludeApp element

Defines which Office 365 ProPlus products should not be installed. Note that OneDrive is automatically installed when you install Office 365 ProPlus, Word, Excel, PowerPoint, Publisher, Visio, and Skype. If you don't want OneDrive installed with those applications, use the ExcludeApp element to remove it. For more details, see [Exclude OneDrive when installing Office 365 ProPlus or other applications](overview-of-the-office-2016-deployment-tool.md#exclude-onedrive-when-installing-office-365-proplus-or-other-applications).  

### Example

```xml
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
- ID="Teams"
- ID="Word"

For OneDrive for Business, use **Groove**. For Skype for Business, use **Lync**.

For more information about Microsoft Teams, see [Deploy Microsoft Teams with Office 365 ProPlus](teams-install.md).

## Logging element

Defines options for ODT logging.

### Example

```xml
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
- Path="\\\server\share\userlogs\"

## Property element

Defines certain Office behaviors and properties.

### Example

```xml
<Property Name="FORCEAPPSHUTDOWN" Value="FALSE"/>
<Property Name="SharedComputerLicensing" Value="1"/>
<Property Name="SCLCacheOverride" Value="1" />
<Property Name="SCLCacheOverrideDirectory" Value="\\server\share\%username%" />
<Property Name="PinIconsToTaskbar" Value="TRUE"/>
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

- Property Name="SharedComputerLicensing" Value="0"
- Property Name="SharedComputerLicensing" Value="1"

### SCLCacheOverride property (part of Property element)
Set **SCLCacheOverride** to 1 if you're using shared computer activation and you want to roam the licensing token. Use in conjunction with SCLCacheOverrideDirectory.

For more information, see  [Overview of shared computer activation for Office 365 ProPlus](overview-of-shared-computer-activation-for-office-365-proplus.md).

Optional. Default value is **0**.

Allowed values:

- Property Name="SCLCacheOverride" Value="0"
- Property Name="SCLCacheOverride" Value="1"

### SCLCacheOverrideDirectory property (part of Property element)
Set **SCLCacheOverrideDirectory** to specify a folder location for the licensing token if you're using shared computer activation and you want to roam the licensing token. Use in conjunction with SCLCacheOverride.

For more information, see  [Overview of shared computer activation for Office 365 ProPlus](overview-of-shared-computer-activation-for-office-365-proplus.md).

Optional.

Example values:

- Property Name="SCLCacheOverrideDirectory" Value="%appdata%\Microsoft\"
- Property Name="SCLCacheOverrideDirectory" Value="\\\server\share\\%username%"

### PinIconsToTaskBar property (part of Property element)

Defines whether shortcut icons for Office products are added to the Windows taskbar in Windows 7, 8, and 8.1. If you install Office using a system account, which is common when deploying with System Center Configuration Managers, the icons will not be pinned even if this property is set to **True**.

Optional. The default value is **True**.

Allowed values:

- Property Name="PinIconsToTaskbar"
          Value="FALSE"
- Property Name="PinIconsToTaskbar"
          Value="TRUE"


## Remove element

Defines which products and languages to remove from a previous installation of Office 365 ProPlus. To remove an installed language, you must provide both the product and the language, as in the example. To remove all the installed languages, do not include the language attribute. In that case, the ODT automatically discovers and removes all installed languages for the product. 

For more information, see  [Overview of the Office Deployment Tool](overview-of-the-office-2016-deployment-tool.md).

### Example

```xml
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

```xml
<Updates Enabled="TRUE" 
         UpdatePath="\\Server\Share\"
         Channel="Broad" />
```

### Enabled attribute (part of Updates element)

If set to **TRUE**, Office will check for updates.
If set to **FALSE**, Office won't check for updates, but the user can check for updates by going to **File** > **Account** > **Update Options** > **Update Now**.

Optional. The default value is **TRUE**.

Allowed values:

- Enabled="TRUE"
- Enabled="FALSE"


### UpdatePath attribute (part of Updates element)

Defines where the updates for Office come from. If **UpdatePath** is not set or is set to empty (""), the location is set to the Office Content Delivery Network (CDN). **UpdatePath** can specify a network, local, or HTTP path of a source for Office installation files. Environment variables can be used for network or local paths. 

If you use Group Policy with the [Administrative Template files (ADMX/ADML) for Office](https://www.microsoft.com/download/details.aspx?id=49030), you can set **UpdatePath** by using the **Update Path** policy setting. You can find this policy setting under Computer Configuration\Policies\Administrative Templates\Microsoft Office 2016 (Machine)\Updates.

Optional.

Example values:

- UpdatePath="\\\server\share\"
- UpdatePath="C:\Preload\Office"
- UpdatePath="<http://internalApps/Office/>"

### TargetVersion attribute (part of Updates element)

Defines which version Office updates to. If **TargetVersion** is not set or is set to empty (""), Office updates to the most recent version from the specified update path. If **TargetVersion** is set to a specific build number, Office attempts to update to that version. 

If you use Group Policy with the [Administrative Template files (ADMX/ADML) for Office](https://www.microsoft.com/download/details.aspx?id=49030), you can set **TargetVersion** by using the **Target Version** policy setting. You can find this policy setting under Computer Configuration\Policies\Administrative Templates\Microsoft Office 2016 (Machine)\Updates.

Optional.

Example values:

- TargetVersion="15.1.2.3"
- TargetVersion=""

### Deadline attribute (part of Updates element)

Defines a deadline by which updates must be applied. The deadline is specified in Coordinated Universal Time (UTC). You can use **Deadline** with **Target Version** to make sure that Office is updated to a particular version by a particular date. We recommend that you set the deadline at least a week in the future to allow users time to install the updates. 

Prior to the deadline, users receive multiple reminders to install the updates. If Office isn't updated by the deadline, users see a notification that the updates will be applied in 15 minutes. This gives users the opportunity to save the Office documents that they are working on and to close any Office programs that are open. If users don't close the Office programs,the programs are closed automatically when the 15 minutes are up, which might result in data loss. 

After the Office programs are closed, the updates are applied automatically. The deadline only applies to one set of updates. If you want to use a deadline to make sure that Office is always up-to-date, you must change the deadline every time a new update for Office is available.

To use this attribute, Office must be running at least Service Pack 1 (version 15.0.4569.1507). If you use Group Policy with the [Administrative Template files (ADMX/ADML) for Office](https://www.microsoft.com/download/details.aspx?id=49030), you can set **Deadline** by using the **Update Deadline** policy setting. You can find this policy setting under Computer Configuration\Policies\Administrative Templates\Microsoft Office 2016 (Machine)\Updates.

Optional.

Example value:

- Deadline="05/16/2014 18:30"

### Channel attribute (part of Updates element)

Defines which channel to use for updating Office after it is installed. Note that there are two channel attributes: the channel for the Add element is used to specify an update channel while installing Office, and the channel for the Update element is used to change the channel for an existing installation of Office.

For more information about update channels, see  [Overview of update channels for Office 365 ProPlus](overview-of-update-channels-for-office-365-proplus.md). 

If you use Group Policy with the  [Administrative Template files (ADMX/ADML) for Office](https://go.microsoft.com/fwlink/p/?LinkID=626001), you can set **Channel** by using the **Update Channel** policy setting. You can find this policy setting under Computer Configuration\Policies\Administrative Templates\Microsoft Office 2016 (Machine)\Updates. If enabled, this Group Policy setting takes precedence over the **Channel** value set by using the Office Deployment Tool.

Optional. The default is **Broad** for Office 365 ProPlus and **Monthly** for Visio Online Plan 2 (previously named Visio Pro for Office 365) and Project Online Desktop Client.

Allowed values:

- Channel="Monthly"
- Channel="Broad"
- Channel="Targeted"

Use "Broad" for Semi-Annual Channel and "Targeted" for Semi-Annual Channel (Targeted). 

If you're deploying Office Professional Plus 2019, which is a volume licensed version of Office, there is a different update channel you need to use: PerpetualVL2019. For more information, see [Update channel for Office 2019](office2019/update.md#update-channel-for-office-2019).

## RemoveMSI element

Optional.

Specifies whether any 2010, 2013, or 2016 versions of Office, Visio, and Project that were installed using Windows Installer (MSI) are uninstalled from the computer prior to the installation of the specified product, such as Office 365 ProPlus.

For more information about using RemoveMSI, see [Remove existing MSI versions of Office when upgrading to Office 365 ProPlus](upgrade-from-msi-version.md).

### IgnoreProduct attribute (part of RemoveMSI element)

If an ID is specified, that Windows Installer (MSI) product won't be uninstalled from the computer.

Optional.

Example values:
- IgnoreProduct ID="VisPro"
- IgnoreProduct ID="PrjPro"


## AppSettings element

Defines application settings for Office 365 ProPlus, including VBA Macro notifications, default file locations, and default file format. To create a configuration file with application settings, we recommend you use the [Office Customization Tool for Click-to-Run](https://config.office.com/), a web application with a full user interface. You can also use the tool to learn more about the available application settings.

For more details on application settings, see [Apply application settings](overview-of-the-office-2016-deployment-tool.md#apply-application-settings-to-office-365-proplus) and [Apply application settings to an existing installation of Office](overview-of-the-office-2016-deployment-tool.md#apply-application-settings-to-an-existing-installation-of-office-365-proplus).

Optional.

### Example

```xml
  <AppSettings>
    <User Key="software\microsoft\office\16.0\excel\security"
          Name="vbawarnings" 
          Value="3" 
          Type="REG_DWORD" 
          App="excel16" 
          Id="L_VBAWarningsPolicy" />
  </AppSettings>
```
## Related topics

- [Overview of the Office Deployment Tool](overview-of-the-office-2016-deployment-tool.md)
- [Deployment guide for Office 365 ProPlus](deployment-guide-for-office-365-proplus.md)
- [Languages, culture codes, and companion proofing languages](overview-of-deploying-languages-in-office-365-proplus.md#languages-culture-codes-and-companion-proofing-languages)
