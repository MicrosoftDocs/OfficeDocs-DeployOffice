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

With the Office Deployment Tool (ODT), you can download and deploy Microsoft 365 Apps to your client computers. The ODT gives you more control over an Office installation: you can define which products and languages are installed, how those products should be updated, and whether or not to display the install experience to your users. This article covers all the available options in the tool. To learn how to use the tool itself, see  [Overview of the Office Deployment Tool](overview-office-deployment-tool.md).

> [!NOTE]
> **Best practice:** The options in this article show the XML elements and attributes in the configuration file. You can continue to create the configuration file in a text editor, but we recommend using the [Office Customization Tool](https://config.office.com/) instead. With the Office Customization Tool, you can easily create and modify configuration files in a web-based interface. For more information, see [Overview of the Office Customization Tool](overview-of-the-office-customization-tool-for-click-to-run.md).

## Example of a standard configuration file

The ODT consists of two files: setup.exe and configuration.xml. To work with the tool, you edit the configuration file to define what options you want, and then run setup.exe from the command line. For example, you can edit the configuration file to download the 32-bit English edition of Office, or you can edit the file to install the 32-bit English edition of Office with the EULA automatically accepted and without Publisher.

When creating the configuration file, we recommend starting with an example file and updating it with the appropriate options for your environment. You can start by copying and pasting the example below into a text file and saving it with a name of your choosing. Use the file to modify the XML elements and attributes and use the rest of this article to learn more details about each of the elements and attributes.   

This configuration file includes the most-commonly used elements and attributes, and can be used to download and install Office on a client computer

```xml
<Configuration>
  <Add SourcePath="\\Server\Share" 
       OfficeClientEdition="32"
       Channel="SemiAnnual" >
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
|Add Channel="SemiAnnual"  <br/> |Office will be installed using Semi-Annual Enterprise Channel.  <br/> |
|Product ID="O365ProPlusRetail"  <br/> |Downloads and installs Microsoft 365 Apps for enterprise.  <br/> |
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
     Channel="SemiAnnual" 
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

Optional.

Defines the location of the Office installation files. If the ODT is run in download mode, defines where to save the files. If not included, the ODT will look for installation files in the same folder as the tool, and then use the Office Content Delivery Network (CDN). If not included and the ODT is run in download mode, the Office installation files are downloaded to the same folder as the tool. 

When you download Office to a folder that already contains that version of Office, the ODT will conserve your network bandwidth by downloading only the missing files. For example, if you use the ODT to download Office in English and German to a folder that already contains Office in English, only the German language pack will be downloaded.

Example values:

- SourcePath="\\\server\share\"
- SourcePath="c:\preload\office"

### Version attribute (part of Add element)

Optional. Defaults to the latest version available if not specified.

When you use the Version attribute, we recommend including the Channel attribute as well. If you don't include the Channel attribute, the default channel will be used, which might not match the specified version.

If Microsoft 365 Apps is already installed on a device, you can use Version="MatchInstalled" to install the same version of Office, even if a newer version is available. This setting can make it easier to add language packs or Visio and Project without updating Office to a newer version. 

Example values:

- Version="16.0.8201.2193"
- Version="MatchInstalled"


### OfficeClientEdition attribute (part of Add element) 

Optional.

Defines whether the 32-bit or 64-bit edition of Microsoft 365 Apps is downloaded or installed. If Office is not installed on the device and OfficeClientEdition is not specified, the ODT will default to the 64-bit edition, unless the device is running a 32-bit edition of Windows or has less than 4 GB RAM. If Office is installed and OfficeClientEdition not specified, the ODT will match the architecture of the existing installation of Office. If Office is installed and OfficeClientEdition is specified, then it must match the already installed architecture. If it doesn't, the installation will fail, since mixed architectures are not supported. 

Allowed values:

- OfficeClientEdition="64"
- OfficeClientEdition="32"

### Channel attribute (part of Add element) 

Optional.

Defines which channel to use for installing Office. If Office is not installed on the device, the default setting for the Channel attribute is **Current**. If Office is installed on the device and the channel attribute is not specified, the ODT will match the channel of the existing installation.

This value determines the channel to be installed, regardless of an optionally specified update channel in the [Updates element](#updates-element) or via Group Policy Setting. If there is such setting with a different update channel, the channel switch is performed after the installation during the next update cycle. For more information, see [Change the Microsoft 365 Apps update channel](change-update-channels.md).

For more information about update channels, see  [Overview of update channels for Microsoft 365 Apps](overview-update-channels.md).  

Allowed values: 

- Channel="BetaChannel"
- Channel="CurrentPreview"
- Channel="Current"
- Channel="MonthlyEnterprise"
- Channel="SemiAnnualPreview"
- Channel="SemiAnnual"

> [!NOTE]
> - To use these attribute values, you need to be using at least version 16.0.12827.20268 of the Office Deployment Tool, which was released on Tuesday June 9, 2020.
> - Previous allowed values for each update channel can still be used, which means you don't have to update your older configuration XML files.
> - Beta Channel (sometimes referred to as Insider Fast) is ***not*** a supported build so should only be used in test environments and by a small group of select users, such as IT staff or application developers.

If you're deploying Office Professional Plus 2019, which is a volume licensed version of Office, there is a different update channel you need to use: PerpetualVL2019. For more information, see [Update channel for Office 2019](office2019/update.md#update-channel-for-office-2019).

### DownloadPath attribute (part of Add element)

Optional. Defaults to the CDN if not specified.

Defines where the installation files are downloaded from when running ODT in download mode. Most commonly used to distribute specific languages and products for Office from a central location on your network to another location. Note that you must specify a version when using DownloadPath, as shown in the example.

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

Optional. Defaults to False if not specified.

To use the Office CDN as a backup source for language packs, include the "AllowCdnFallback" attribute in the configuration file, as shown in the example.

When installing languages, the ODT looks first for source files in the location specified in the SourcePath attribute. If the language pack isn't available at that location **and** the AllowCdnFallback setting is set to True, then the ODT will use source files from the Office CDN.

Allowed values: 

- AllowCdnFallback="True"
- AllowCdnFallback="False"

#### Example 

```xml
<Add SourcePath="\\Server\Share" 
     OfficeClientEdition="32"
     Channel="SemiAnnual" 
     AllowCdnFallback="True">
  <Product ID="O365ProPlusRetail">
      <Language ID="en-us" />
      <Language ID="ja-jp" />
  </Product>
</Add>  
```

### MigrateArch attribute (part of Add element)

Optional. Defaults to False if not specified.

If set to TRUE, then your existing installation of Microsoft 365 Apps will be changed to the architecture (sometimes referred to as the bitness) that is specified in the [OfficeClientEdition attribute](#officeclientedition-attribute-part-of-add-element). For example, you can use this to change a 32-bit installation of Microsoft 365 Apps to a 64-bit installation.

For more information about using MigrateArch, see [Change a Microsoft 365 Apps installation from 32-bit to 64-bit](change-bitness.md).

### OfficeMgmtCOM attribute (part of Add element)

Optional. Defaults to False if not specified.

For Configuration Manager to be able to manage Microsoft 365 Apps updates, an Office COM object needs to be enabled on the computer where Office is installed. If set to TRUE, the Office COM object takes commands from Configuration Manager to download and install client updates. When the Office COM object is enabled, the Update Now option on the Account page for Microsoft 365 Apps is automatically disabled for client devices.

For more information, see [Manage updates to Microsoft 365 Apps with Microsoft Endpoint Configuration Manager](manage-microsoft-365-apps-updates-configuration-manager.md).

Allowed values: 

- OfficeMgmtCOM="True"
- OfficeMgmtCOM="False"

#### Example 

```xml
<Configuration>
  <Add OfficeClientEdition="64" Channel="Current" OfficeMgmtCOM="True" >
    <Product ID="O365ProPlusRetail">
      <Language ID="en-us" />
    </Product>
  </Add>  
  <Updates Enabled="True"  /> 
</Configuration>
```

## Product element

Defines which products to download or install. If you define multiple products, the products are installed in the order in the configuration file. The first product determines the context for the Microsoft Office First Run Experience. 

You can also use the Product element to add language packs to existing installations of Microsoft 365 Apps. For more information, including an example configuration file, see  [Deploy languages to existing installations of Microsoft 365 Apps](overview-deploying-languages-microsoft-365-apps.md#deploy-languages-to-existing-installations-of-microsoft-365-apps).

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

Required.

Defines the ID of the product to download or install. 

Example values:

- ID="O365ProPlusRetail"  
- ID="VisioProRetail"
- ID="ProjectProRetail"

For a list of all supported product IDs, see  [Product IDs that are supported by the Office Deployment Tool for Click-to-Run](https://go.microsoft.com/fwlink/p/?LinkID=301891)

### MSICondition attribute (part of Product element)

Optional.

Allows you to control the installation of an Office product, as specified by the [ID attribute](#id-attribute-part-of-product-element), based on whether a particular MSI-based Office product is already installed on the device. For example, if an MSI-based version of Project Professional is already installed on the device, then install Project Online Desktop Client.

You can specify any Office product that was installed by Windows Installer (MSI), but MSICondition is most commonly used for Project or Visio installations. The value that you specify for the MSICondition attribute can be either a volume licensed or a retail version of the product, as long as that version of the product was installed by using MSI.

MSICondition will recognize 2007, 2010, 2013, and 2016 versions of the Office product that you specify. But, you can't specify a particular version. For example, you can't have MSICondition look specifically for Visio Standard 2013. MSICondition will look for all MSI-based installations of Visio Standard, including Visio Standard 2007, Visio Standard 2010, Visio Standard 2013, and Visio Standard 2016.

The value that you specify for the MSICondition attribute is the Setup ID that is found in the Setup.xml file in the *{product}*.WW folder of the installation files for your existing version of the Office product. For example, the Setup.xml file for Visio Professional 2016 is found in the VisPro.WW folder. You can specify multiple types of an Office product, separated by a comma. For example, you can specify "PrjStd,PrjStdR,PrjPro,PrjProR" to look for installations of Project Standard or Project Professional, either volume licensed or retail.

> [!NOTE]
> - We recommend that you remove the existing MSI-based Office products as part of installing the products specified in your XML file. To remove existing MSI-based products, use the [RemoveMSI element](#removemsi-element).

### Example of MSICondition attribute

In the following example, Project Online Desktop Client will be installed on the device only if an MSI-based version of Project Standard is already installed on the device. Also, Project Standard will be removed from the device as part of the installation of Project Online Desktop Client.

```xml
<Configuration>
  <Add >
      <Product ID="ProjectProRetail" MSICondition="PrjStd,PrjStdR">
         <Language ID="en-us" />
         <Language ID="MatchPreviousMSI">
      </Product>
  </Add>
  <RemoveMSI />
</Configuration>
```

## Language element

Defines which languages to download or install. If you define multiple languages, the first language in the configuration file determines the Shell UI culture, including shortcuts, right-click context menus, and tooltips. If you decide that you want to change the Shell UI language after an initial installation, you have to uninstall and reinstall Office. 

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
     Channel="SemiAnnual" 
     AllowCdnFallback="True">
  <Product ID="O365ProPlusRetail">
     <Language ID="MatchInstalled" />
     <Language ID="MatchOS" Fallback="en-us" />
  </Product>
</Add>  
```

### ID attribute (part of Language element)

Required.

Defines the ID of the language to download or install.

#### Example values

- ID="en-us"
- ID="ja-jp"
- ID="MatchOS"
- ID="MatchPreviousMSI"
- ID="MatchInstalled"

For a list of all languages, see [Languages, culture codes, and companion proofing languages](overview-deploying-languages-microsoft-365-apps.md#languages-culture-codes-and-companion-proofing-languages).

For more information about MatchPreviousMSI, see [Remove existing MSI versions of Office when upgrading to Microsoft 365 Apps](upgrade-from-msi-version.md).

MatchOS and MatchInstalled cannot install the operating system languages if Office doesn't support that language or if the ODT cannot find the correct language pack in the local source files. To help address this issue, we recommend that you specify a backup language and allow the ODT to use the Office CDN for missing files. To do so, use the Fallback attribute and AllowCdnFallBack attribute. 

MatchInstalled can be used only if there is at least one Click-to-Run product already installed. It can't be used with the /download switch for the ODT. For more information about MatchInstalled, see [Overview of deploying languages](overview-deploying-languages-microsoft-365-apps.md) and [Build dynamic, lean, and universal packages for Microsoft 365 Apps](fieldnotes/build-dynamic-lean-universal-packages.md).

### Fallback attribute (part of Language element)

Optional.

When using MatchOS, we recommend that you specify a fallback language to install when a matched language isn't supported by Office or can't be found in the local source files. To do so, use the "Fallback" attribute. For more information, see [Install the same languages as the operating system](overview-deploying-languages-microsoft-365-apps.md#install-the-same-languages-as-the-operating-system).

Example values:

- Fallback="en-us"
- Fallback="ja-jp"

### TargetProduct attribute (part of Language element)

Optional.

When using MatchInstalled, you have to specify if you want to match a specific already installed product or the sum of all already installed languages. To target a specific product, you can specify any [supported product ID](https://docs.microsoft.com/office365/troubleshoot/installation/product-ids-supported-office-deployment-click-to-run). If you want to match all already installed languages, you can specify "All". ODT will then install the new product with the same set of languages as the one specified in TargetProduct.

Example values:

- <Language ID="MatchInstalled" TargetProduct="O365ProPlusRetail"
- <Language ID="MatchInstalled" TargetProduct="All"

## Display element

Defines what the user sees when Office is installed.

### Example

```xml
<Display Level="None" AcceptEULA="TRUE" />  
```

### Level attribute (part of Display element)

Optional. Default is set to **Full** if not specified.

If **Level** is set to **None**, Office is installed with no user interface: no progress bars, completion screens, error messages, or other user interface are displayed.

If **Level** is set to **Full**, Office is installed with the normal installation experience. 

Allowed values:

- Level="None"
- Level="Full"

### AcceptEULA attribute (part of Display element)

Optional. Defaults to **FALSE** if not specified.

If **AcceptEULA** is set to **TRUE**, the user does not see a Microsoft Software License Terms dialog box. If this attribute is set to **FALSE** or is not included, the user may see a Microsoft Software License Terms dialog box. We recommend that administrators set **AcceptEULA** to **TRUE**. 

Allowed values:

- AcceptEULA="TRUE"
- AcceptEULA="FALSE"

> [!NOTE]
> If you deploy a version of Office before Version 1803, this setting will be applied only if you install with the user's account. Microsoft Endpoint Configuration Manager and other software distribution tools that use the SYSTEM account for installation will not apply the setting.

## ExcludeApp element

Defines which Microsoft 365 Apps products should not be installed. OneDrive is automatically installed when you install Microsoft 365 Apps or install individual applications, such as Word, Excel, PowerPoint, Publisher, Visio, or Skype. If you don't want OneDrive installed with those applications, use the ExcludeApp element to remove it. For more information, see [Exclude OneDrive when installing Microsoft 365 Apps or other applications](overview-office-deployment-tool.md#exclude-onedrive-when-installing-microsoft-365-apps-or-other-applications).

### Example

```xml
<Add SourcePath="\\Server\Share" 
     OfficeClientEdition="32"
     Channel="SemiAnnual" >
  <Product ID="O365ProPlusRetail">
    <Language ID="en-us" />
    <Language ID="ja-jp" />
    <ExcludeApp ID="Publisher" />
  </Product>
</Add>  
```

If a configuration file with ExcludeApp is used to install Office on a device that already has Microsoft 365 Apps installed, the ExcludeApp setting is treated differently based on the list of languages:
- If the list of languages in the configuration file includes all the installed languages, then the ExcludeApp setting in the file replaces any existing ExcludeApp setting on the device. This is also true if the list of languages in the configuration file includes both all the installed languages and additional languages.
- If the list of languages in the configuration file doesn't include all the installed languages, then the ExcludeApp setting in the configuration file will be combined with the ExcludeApp setting on the device. 


### ID attribute (part of ExcludeApp element)

Required.

Defines the ID of the product that should not be installed.

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

For more information about Microsoft Teams, see [Deploy Microsoft Teams with Microsoft 365 Apps](teams-install.md).

## Logging element

Defines options for ODT logging.

### Example

```xml
<Logging Level="Standard" 
         Path="%temp%" />
```

### Level attribute (part of Logging element)

Optional. Default is **Standard** if not specified.

Turns logging on or off. 

Allowed values:

- Level="Off"
- Level="Standard"

### Path attribute (part of Logging element)

Optional. Default is **%temp%** if not specified.

Defines the location of the log files. 

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
<Property Name="DeviceBasedLicensing" Value="1" />
<Property Name="SCLCacheOverrideDirectory" Value="\\server\share\%username%" />
<Property Name="PinIconsToTaskbar" Value="TRUE"/>
```

### Name attribute (part of Property element)

Required.

Defines the specific property whose value you want to set.

### Value attribute (part of Property element)

Defines the value of the named property.

### AUTOACTIVATE property (part of Property element)

Optional. Default is **0** if not specified.

Because Microsoft 365 Apps is set to activate automatically, you should not set this property for Microsoft 365 Apps products. For other products, you can set **AUTOACTIVATE** to **1** to have the product activate automatically.

Allowed values:

- Property Name="AUTOACTIVATE"
          Value="0"
- Property Name="AUTOACTIVATE"
          Value="1"
	  

### FORCEAPPSHUTDOWN property (part of Property element)

Optional. Default is **FALSE** if not specified.

When set to **TRUE**, forces any apps that are blocking the install of Office to shut down. Data loss may occur. 

Allowed values:

- Property Name="FORCEAPPSHUTDOWN"
          Value="FALSE"
- Property Name="FORCEAPPSHUTDOWN"
          Value="TRUE"


### PACKAGEGUID property (part of Property element)

Optional.

By default, App-V packages created by the ODT share the same App-V Package ID. Administrators can use **PACKAGEGUID** to specify a different Package ID. This allows you to publish multiple App-V packages of Office to an App-V Management Server. But, this doesn't enable you to deploy more than one Office App-V package to a single computer. You can use the ODT to create App-V packages for Microsoft 365 Apps. Creating packages for the volume-licensed versions of Office Professional Plus or Office Standard is not supported.

The Package ID must follow the format of the example and can only use these characters: 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, A, B, C, D, E, F  

If you use any other characters, the App-V package is created with the default Package ID.

Example values:

- Property Name="PACKAGEGUID"
          Value="12345678-ABCD-1234-ABCD-1234567890AB"

### SharedComputerLicensing property (part of Property element)

Optional. Default value is **0** if not specified.

Set **SharedComputerLicensing** to 1 if you deploy Microsoft 365 Apps to shared computers by using Remote Desktop Services. 

For more information, see  [Overview of shared computer activation for Microsoft 365 Apps](overview-shared-computer-activation.md).

Allowed values:

- Property Name="SharedComputerLicensing" Value="0"
- Property Name="SharedComputerLicensing" Value="1"

### SCLCacheOverride property (part of Property element)

Optional. Default value is **0** if not specified.

Set **SCLCacheOverride** to 1 if you're using shared computer activation and you want to roam the licensing token. Use in conjunction with SCLCacheOverrideDirectory. This is only needed if you choose to move the licensing token from its default location. For more information, see [Overview of shared computer activation for Microsoft 365 Apps](overview-shared-computer-activation.md).

Allowed values:

- Property Name="SCLCacheOverride" Value="0"
- Property Name="SCLCacheOverride" Value="1"

### SCLCacheOverrideDirectory property (part of Property element)

Optional.

Set **SCLCacheOverrideDirectory** to specify a folder location for the licensing token if you're using shared computer activation and you want to roam the licensing token. Use in conjunction with SCLCacheOverride. This is only needed if you choose to move the licensing token from its default location.

For more information, see [Overview of shared computer activation for Microsoft 365 Apps](overview-shared-computer-activation.md).

Example values:

- Property Name="SCLCacheOverrideDirectory" Value="%appdata%\Microsoft\"
- Property Name="SCLCacheOverrideDirectory" Value="\\\server\share\\%username%"

### DeviceBasedLicensing property (part of Property element)

Optional. Default value is **0** if not specified.

Defines the Office licensing mode for device-based activation. For more information, see [Device-based licensing for Microsoft 365 Apps for enterprise](device-based-licensing.md).

Allowed values:

- Property Name="DeviceBasedLicensing" Value="1" 
- Property Name="DeviceBasedLicensing" Value="0" 


### PinIconsToTaskBar property (part of Property element)

Optional. The default value is **True** if not specified.

Defines whether shortcut icons for Office products are added to the Windows taskbar in Windows 7 and 8.1. If you install Office using a system account, which is common when deploying with Microsoft Endpoint Configuration Manager, the icons will not be pinned even if this property is set to **True**.

Allowed values:

- Property Name="PinIconsToTaskbar"
          Value="FALSE"
- Property Name="PinIconsToTaskbar"
          Value="TRUE"

> [!NOTE]
> Microsoft 365 Apps is no longer supported on Windows 7. For more information, see [Windows 7 end of support and Microsoft 365 Apps](endofsupport/windows-7-support.md).

## Remove element

Defines which products and languages to remove from a previous installation of Microsoft 365 Apps. To remove an installed language, you must provide both the product and the language, as in the example. To remove all the installed languages, do not include the language attribute. In that case, the ODT automatically discovers and removes all installed languages for the product. 

For more information, see  [Overview of the Office Deployment Tool](overview-office-deployment-tool.md).

### Example

```xml
<Remove All="FALSE">
  <Product ID="O365ProPlusRetail" >
    <Language ID="es-es" />
  </Product>
</Remove>
```
### All attribute (part of Remove element)

Optional. The default value is **FALSE** is not specified.

If set to **TRUE**, all Microsoft 365 Apps products and languages will be removed, including Project and Visio.

Allowed values:

- All="FALSE"
- All="TRUE"

## Updates element

Defines how Office is updated after it's installed.

### Example

```xml
<Updates Enabled="TRUE" 
         UpdatePath="\\Server\Share\"
         Channel="SemiAnnual" />
```

### Enabled attribute (part of Updates element)

Optional. The default value is **TRUE** if not specified.

If set to **TRUE**, Office will check for updates.
If set to **FALSE**, Office won't check for updates, but the user can check for updates by going to **File** > **Account** > **Update Options** > **Update Now**.

Allowed values:

- Enabled="TRUE"
- Enabled="FALSE"


### UpdatePath attribute (part of Updates element)

Optional.  Defaults to the CDN if not specified.

Defines where the updates for Office come from. **UpdatePath** can specify a network, local, or HTTP path of a source for Office installation files. Environment variables can be used for network or local paths. 

If you use Group Policy with the [Administrative Template files (ADMX/ADML) for Office](https://www.microsoft.com/download/details.aspx?id=49030), you can set **UpdatePath** by using the **Update Path** policy setting. You can find this policy setting under Computer Configuration\Policies\Administrative Templates\Microsoft Office 2016 (Machine)\Updates.

Example values:

- UpdatePath="\\\server\share\"
- UpdatePath="C:\Preload\Office"
- UpdatePath="<http://internalApps/Office/>"

### TargetVersion attribute (part of Updates element)

Optional. Defaults to the latest version from the specified update path.

Defines which version Office updates to. If **TargetVersion** is set to a specific build number, Office attempts to update to that version. 

If you use Group Policy with the [Administrative Template files (ADMX/ADML) for Office](https://www.microsoft.com/download/details.aspx?id=49030), you can set **TargetVersion** by using the **Target Version** policy setting. You can find this policy setting under Computer Configuration\Policies\Administrative Templates\Microsoft Office 2016 (Machine)\Updates.

Example values:

- TargetVersion="15.1.2.3"
- TargetVersion=""

### Deadline attribute (part of Updates element)

Optional.

Defines a deadline by which updates must be applied. The deadline is specified in Coordinated Universal Time (UTC). You can use **Deadline** with **Target Version** to make sure that Office is updated to a particular version by a particular date. We recommend that you set the deadline at least a week in the future to allow users time to install the updates. 

Prior to the deadline, users receive multiple reminders to install the updates. If Office isn't updated by the deadline, users see a notification that the updates will be applied in 15 minutes. This gives users the opportunity to save the Office documents that they are working on and to close any Office programs that are open. If users don't close the Office programs, the programs are closed automatically when the 15 minutes are up, which might result in data loss. 

After the Office programs are closed, the updates are applied automatically. The deadline only applies to one set of updates. If you want to use a deadline to make sure that Office is always up to date, you must change the deadline every time a new update for Office is available.

To use this attribute, Office must be running at least Service Pack 1 (version 15.0.4569.1507). If you use Group Policy with the [Administrative Template files (ADMX/ADML) for Office](https://www.microsoft.com/download/details.aspx?id=49030), you can set **Deadline** by using the **Update Deadline** policy setting. You can find this policy setting under Computer Configuration\Policies\Administrative Templates\Microsoft Office 2016 (Machine)\Updates.

Example value:

- Deadline="05/16/2014 18:30"

### Channel attribute (part of Updates element)

Optional. The default is **Current**.

Defines which channel to use for updating Office after it is installed. There are two channel attributes: the channel for the  [Add element](#add-element) is used to specify an update channel while installing Office, and the channel for the Updates element is used to change the channel for an existing installation of Office.

For more information about update channels, see  [Overview of update channels for Microsoft 365 Apps](overview-update-channels.md). 

If you use Group Policy with the  [Administrative Template files (ADMX/ADML) for Office](https://go.microsoft.com/fwlink/p/?LinkID=626001), you can set **Channel** by using the **Update Channel** policy setting. You can find this policy setting under Computer Configuration\Policies\Administrative Templates\Microsoft Office 2016 (Machine)\Updates. If enabled, this Group Policy setting takes precedence over the **Channel** value set by using the Office Deployment Tool.

Allowed values:

- Channel="BetaChannel"
- Channel="CurrentPreview"
- Channel="Current"
- Channel="MonthlyEnterprise"
- Channel="SemiAnnualPreview"
- Channel="SemiAnnual"

> [!NOTE]
> - To use these attribute values, you need to be using at least version 16.0.12827.20268 of the Office Deployment Tool, which was released on Tuesday June 9, 2020.
> - Previous allowed values for each update channel can still be used, which means you don't have to update your older configuration XML files.
> - Beta Channel (sometimes referred to as Insider Fast) is ***not*** a supported build so should only be used in test environments and by a small group of select users, such as IT staff or application developers.

If you're deploying Office Professional Plus 2019, which is a volume licensed version of Office, there is a different update channel you need to use: PerpetualVL2019. For more information, see [Update channel for Office 2019](office2019/update.md#update-channel-for-office-2019).

## RemoveMSI element

Optional.

Specifies whether any 2007, 2010, 2013, or 2016 versions of Office, Visio, and Project that were installed using Windows Installer (MSI) are uninstalled from the computer prior to the installation of the specified product, such as Microsoft 365 Apps.

We recommend that you uninstall any previous versions of Office before installing Microsoft 365 Apps. For more information about using RemoveMSI, see [Remove existing MSI versions of Office when upgrading to Microsoft 365 Apps](upgrade-from-msi-version.md).  

### IgnoreProduct attribute (part of RemoveMSI element)

Optional.

If an ID is specified, that Windows Installer (MSI) product won't be uninstalled from the computer.

Example values:
- IgnoreProduct ID="VisPro"
- IgnoreProduct ID="PrjPro"

## AppSettings element

Optional.

Defines application preferences for Microsoft 365 Apps, including VBA Macro notifications, default file locations, and default file format. To create a configuration file with application preferences, we recommend you use the [Office Customization Tool for Click-to-Run](https://config.office.com/), a web application with a full user interface. You can also use the tool to learn more about the available application preferences.

For more information about application preferences, see [Apply application preferences](overview-office-deployment-tool.md#apply-application-preferences-to-microsoft-365-apps) and [Apply application preferences to an existing installation of Office](overview-office-deployment-tool.md#apply-application-preferences-to-an-existing-installation-of-microsoft-365-apps).

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
## Related articles

- [Overview of the Office Deployment Tool](overview-office-deployment-tool.md)
- [Deployment guide for Microsoft 365 Apps](deployment-guide-microsoft-365-apps.md)
- [Languages, culture codes, and companion proofing languages](overview-deploying-languages-microsoft-365-apps.md#languages-culture-codes-and-companion-proofing-languages)
- [Deprecated attributes in the ODT configuration file](https://docs.microsoft.com/en-us/office/troubleshoot/installation/forceupgrade-forcedowngrade-removed-odt-config)
