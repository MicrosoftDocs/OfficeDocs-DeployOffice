---
title: Configuration options for the Office Deployment Tool
ms.author: nwhite
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: conceptual
ms.service: o365-proplus-itpro
ms.collection: Tier1
ms.localizationpriority: medium
recommendations: false
description: "Configuration options for the Office Deployment Tool"

ms.date: 03/19/2024

---

# Configuration options for the Office Deployment Tool

With the Office Deployment Tool (ODT), you can download and deploy Microsoft 365 Apps to your client computers. The ODT gives you more control over installation: you can define which products and languages are installed, how those products should be updated, and whether or not to display the install experience to your users. This article covers all the available options in the tool. To learn how to use the tool itself, see  [Overview of the Office Deployment Tool](overview-office-deployment-tool.md).

> [!NOTE]
> **Best practice:** The options in this article show the XML elements and attributes in the configuration file. You can continue to create the configuration file in a text editor, but we recommend using the [Office Customization Tool](https://config.office.com/) instead. With the Office Customization Tool, you can easily create and modify configuration files in a web-based interface. For more information, see [Overview of the Office Customization Tool](../admin-center/overview-office-customization-tool.md).

## Example of a standard configuration file

The ODT consists of two files: setup.exe and configuration.xml. To work with the tool, you edit the configuration file to define what options you want, and then run setup.exe from the command line. For example, you can edit the configuration file to download the 64-bit English edition of Microsoft 365 Apps, or you can edit the file to install the 64-bit English edition of Microsoft 365 Apps with the EULA automatically accepted and without Publisher.

When creating the configuration file, we recommend starting with an example file and updating it with the appropriate options for your environment. You can start by copying and pasting the following example into a text file and saving it with a name of your choosing. Use the file to modify the XML elements and attributes and use the rest of this article to learn more details about each of the elements and attributes.   

This configuration file includes the most-commonly used elements and attributes, and can be used to download and install Microsoft 365 Apps on a client computer.


```xml
<Configuration>
  <Add SourcePath="\\Server\Share" 
       OfficeClientEdition="64"
       Channel="MonthlyEnterprise" >
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
</Configuration>
```

|**Value**|**Description**|
|:-----|:-----|
|Add SourcePath="\\\Server\Share"  <br/> |Office is downloaded to "\\\server\share" on your network and deployed using installation files at that location.  <br/> |
|Add OfficeClientEdition="64"  <br/> |Downloads and installs the 64-bit edition of Office  <br/> |
|Add Channel="MonthlyEnterprise"  <br/> |Office is installed using Monthly Enterprise Channel.  <br/> |
|Product ID="O365ProPlusRetail"  <br/> |Downloads and installs Microsoft 365 Apps for enterprise.  <br/> |
|Language ID="en-us"  <br/> Language ID="ja-jp"  <br/> |Downloads and installs English and Japanese versions of Office.  <br/> |
|Updates Enabled="TRUE"<br/> |Office checks for updates.  <br/> |
|Updates UpdatePath="\\\Server\Share" <br/> |Office checks for updates at "\\server\share" on your network.  <br/> |
|Display Level="None" AcceptEULA="TRUE"  <br/> |When installing Office, no user interface is displayed.  <br/> |

## Add element

Defines the products and languages to download or install.

### Example

```xml
<Add SourcePath="\\Server\Share" 
     OfficeClientEdition="64"
     Channel="MonthlyEnterprise"
     Version="16.0.15330.20306" >
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

Defines the location of the Microsoft 365 Apps installation files. If the ODT is run in download mode, defines where to save the files. If not included, the ODT looks for installation files in the same folder as the tool, and then use the [Content Delivery Network (CDN)](/microsoft-365/enterprise/content-delivery-networks). If not included and the ODT is run in download mode, the Microsoft 365 Apps installation files are downloaded to the same folder as the tool. 

When you download Microsoft 365 Apps to a folder that already contains that version of Microsoft 365 Apps, the ODT conserves your network bandwidth by downloading only the missing files. For example, if you use the ODT to download Microsoft 365 Apps in English and German to a folder that already contains Microsoft 365 Apps in English, only the German language pack is downloaded.

Example values:

- SourcePath="\\\server\share\"
- SourcePath="C:\Downloads\Microsoft"

The SourcePath value shouldn't include the /Office part or the name of the folder on which Office Data is downloaded.


### Version attribute (part of Add element)

Optional. Defaults to the latest version available if not specified.

When you use the Version attribute, we recommend including the Channel attribute as well. If you don't include the Channel attribute, the default channel is used, which might not match the specified version.

If Microsoft 365 Apps is already installed on a device, you can use Version="MatchInstalled" to install the same version, even if a newer version is available. This setting can make it easier to add language packs or Visio and Project without updating to a newer version. 

Example values:

- Version="16.0.15330.20306"
- Version="MatchInstalled"


### OfficeClientEdition attribute (part of Add element) 

Optional.


Defines whether the 32-bit or 64-bit edition of Microsoft 365 Apps is downloaded or installed. If Microsoft 365 Apps isn't installed on the device and OfficeClientEdition isn't set, the ODT automatically selects the 64-bit edition. However, it selects the 32-bit edition if the device uses a 32-bit version of Windows or has less than 4-GB RAM. If Microsoft 365 Apps is installed and OfficeClientEdition not specified, the ODT matches the architecture of the existing installation of Microsoft 365 Apps. If Microsoft 365 Apps is installed and OfficeClientEdition is specified, then it must match the already installed architecture. If it doesn't, the installation fails, since mixed architectures aren't supported. 

Allowed values:

- OfficeClientEdition="64"
- OfficeClientEdition="32"

### Channel attribute (part of Add element) 

Optional.

Defines which channel to use for installing Microsoft 365 Apps. If Microsoft 365 Apps isn't installed on the device, the default setting for the Channel attribute is **Current**. If Microsoft 365 Apps is installed on the device and the channel attribute isn't specified, the ODT matches the channel of the existing installation.

This value determines the channel to be installed, regardless of an optionally specified update channel in the [Updates element](#updates-element) or via Group Policy Setting. If there's such a setting with a different update channel, the channel switch is performed after the installation during the next update cycle. For more information, see [Change the Microsoft 365 Apps update channel](../updates/change-update-channels.md).

For more information about update channels, see  [Overview of update channels for Microsoft 365 Apps](../updates/overview-update-channels.md).  

Allowed values: 

- Channel="BetaChannel"
- Channel="CurrentPreview"
- Channel="Current"
- Channel="MonthlyEnterprise"
- Channel="SemiAnnualPreview"
- Channel="SemiAnnual"

> [!NOTE]
> - Previous allowed values for each update channel can still be used, which means you don't have to update your older configuration XML files.
> - Beta Channel (sometimes referred to as Insider Fast) is ***not*** a supported build so should only be used in test environments and by a small group of select users, such as IT staff or application developers.

If you're deploying Office LTSC Professional Plus 2021 or Office LTSC Standard 2021, which are volume licensed versions, there's a different update channel you need to use: PerpetualVL2021. For more information, see [Update channel for Office LTSC 2021](/office/ltsc/2021/update#update-channel-for-office-ltsc-2021).

If you're deploying Office Professional Plus 2019 or Office Standard 2019, which are volume licensed versions, there's a different update channel you need to use: PerpetualVL2019. For more information, see [Update channel for Office 2019](/office/2019/update#update-channel-for-office-2019).

### DownloadPath attribute (part of Add element)

Optional. Defaults to the CDN if not specified.

Defines where the installation files are downloaded from when running ODT in download mode. Most commonly used to distribute specific languages and products for Microsoft 365 Apps from a central location on your network to another location. You must specify a version when using DownloadPath, as shown in the example.

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

To use the CDN as a backup source for language packs, include the "AllowCdnFallback" attribute in the configuration file, as shown in the example.

When you install languages, the ODT first searches for source files at the location given in the SourcePath attribute. If the language pack isn't available at that location **and** the AllowCdnFallback setting is set to True, then the ODT uses source files from the CDN.


Allowed values: 

- AllowCdnFallback="True"
- AllowCdnFallback="False"

#### Example 

```xml
<Add SourcePath="\\Server\Share" 
     OfficeClientEdition="64"
     Channel="MonthlyEnterprise"
     AllowCdnFallback="True">
  <Product ID="O365ProPlusRetail">
      <Language ID="en-us" />
      <Language ID="ja-jp" />
  </Product>
</Add>  
```

### MigrateArch attribute (part of Add element)

Optional. Defaults to False if not specified.

If set to TRUE, then your existing installation of Microsoft 365 Apps is changed to the architecture (sometimes referred to as the bitness) that is specified in the [OfficeClientEdition attribute](#officeclientedition-attribute-part-of-add-element). For example, you can use this attribute to change a 32-bit installation of Microsoft 365 Apps to a 64-bit installation.

For more information about using MigrateArch, see [Change a Microsoft 365 Apps installation from 32-bit to 64-bit](change-bitness.md).

### OfficeMgmtCOM attribute (part of Add element)

Optional. Defaults to False if not specified.

If set to True, a COM object gets registered which is required for allowing update management solutions (for example, Microsoft Configuration Manager) to manage updates. Required when using Configuration Manager for Microsoft 365 Apps updates. When the Office COM object is enabled, the Update Now option on the Account page for Microsoft 365 Apps is automatically disabled for client devices.

For more information, see [Manage updates to Microsoft 365 Apps with Microsoft Configuration Manager](.../updates/manage-microsoft-365-apps-updates-configuration-manager.md).

Allowed values: 

- OfficeMgmtCOM="True"
- OfficeMgmtCOM="False"

#### Example 

```xml
<Configuration>
  <Add OfficeClientEdition="64" Channel="MonthlyEnterprise" OfficeMgmtCOM="True" >
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

For a list of all supported product IDs, see  [Product IDs that are supported by the Office Deployment Tool for Click-to-Run](/office365/troubleshoot/installation/product-ids-supported-office-deployment-click-to-run)

### MSICondition attribute (part of Product element)

Optional.

Allows you to control the installation of an Office product, as specified by the [ID attribute](#id-attribute-part-of-product-element), based on whether a particular MSI-based Office product is already installed on the device. For example, if an MSI-based version of Project Professional is already installed on the device, then install Project Online Desktop Client.

You can specify any Office product installed by Windows Installer (MSI), but MSICondition is most commonly used for Project or Visio installations. The value that you specify for the MSICondition attribute can be either a volume licensed or a retail version of the product, as long as that version of the product was installed by using MSI.

MSICondition recognizes 2007, 2010, 2013, and 2016 versions of the Office product that you specify. But, you can't specify a particular version. For example, you can't have MSICondition look specifically for Visio Standard 2013. MSICondition looks for all MSI-based installations of Visio Standard, including Visio Standard 2007, Visio Standard 2010, Visio Standard 2013, and Visio Standard 2016.

The value that you specify for the MSICondition attribute is the Setup ID that is found in the Setup.xml file in the *{product}*.WW folder of the installation files for your existing version of the Office product. For example, the Setup.xml file for Visio Professional 2016 is found in the VisPro.WW folder. You can specify multiple types of an Office product, separated by a comma. For example, you can specify "PrjStd,PrjStdR,PrjPro,PrjProR" to look for installations of Project Standard or Project Professional, either volume licensed or retail.


> [!NOTE]
> We recommend that you remove the existing MSI-based Office products as part of installing the products specified in your XML file. To remove existing MSI-based products, use the [RemoveMSI element](#removemsi-element).
>
> You can also watch a video on [how to use MSICondition in combination with RemoveMSI](https://youtu.be/7zHi6MRveRc) to simplify your upgrade.

### Example of MSICondition attribute

In the following example, Project Online Desktop Client is installed on the device only if an MSI-based version of Project Standard is already installed on the device. Also, Project Standard is removed from the device as part of the installation of Project Online Desktop Client.

```xml
<Configuration>
  <Add>
      <Product ID="ProjectProRetail" MSICondition="PrjStd,PrjStdR">
         <Language ID="en-us" />
         <Language ID="MatchPreviousMSI" />
      </Product>
  </Add>
  <RemoveMSI />
</Configuration>
```

## Language element

Defines which languages to download or install. If you define multiple languages, the first language in the configuration file determines the Shell UI culture, including shortcuts, right-click context menus, and tooltips. If you want to change the Shell UI language after the first installation, you must uninstall and then reinstall Microsoft 365 Apps. 


### Example

```xml
<Product ID="O365ProPlusRetail">
  <Language ID="en-us" />
  <Language ID="ja-jp" />
</Product>
```

```xml
<Add SourcePath="\\Server\Share" 
     OfficeClientEdition="64"
     Channel="MonthlyEnterprise"
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

Be sure the languages that you specify are supported by the product you're installing. Otherwise your installation fails.

For example, Microsoft 365 Apps supports English (United Kingdom), French (Canada), and Spanish (Mexico), but Project and Visio don't support those languages.

- For a list of languages supported by Microsoft 365 Apps, see [Languages, culture codes, and companion proofing languages](overview-deploying-languages-microsoft-365-apps.md#languages-culture-codes-and-companion-proofing-languages).
- For a list of languages supported by Visio, see [Display languages supported in the Visio desktop app](https://support.microsoft.com/office/a921983e-fd5d-45ef-8af1-cedf70c53d75).
- Project supports the same languages that Visio does.

For more information about MatchPreviousMSI, see [Remove existing MSI versions of Office when upgrading to Microsoft 365 Apps](upgrade-from-msi-version.md).

MatchOS and MatchInstalled can't install the operating system languages if Microsoft 365 Apps doesn't support that language or if the ODT can't find the correct language pack in the local source files. To help address this issue, we recommend that you specify a backup language and allow the ODT to use the CDN for missing files. To do so, use the Fallback attribute and AllowCdnFallBack attribute. 

MatchInstalled can be used only if there is at least one Click-to-Run product already installed. It can't be used with the /download switch for the ODT. For more information about MatchInstalled, see [Overview of deploying languages](overview-deploying-languages-microsoft-365-apps.md) and [Build dynamic, lean, and universal packages for Microsoft 365 Apps](../best-practices/build-dynamic-lean-universal-packages.md).

### Fallback attribute (part of Language element)

Optional.


When using MatchOS, specify a fallback language to install if the matched language isn't supported by Microsoft 365 Apps or is unavailable in the local source files. To do so, use the "Fallback" attribute. For more information, see [Install the same languages as the operating system](overview-deploying-languages-microsoft-365-apps.md#install-the-same-languages-as-the-operating-system).


#### Example values:

- Fallback="en-us"
- Fallback="ja-jp"

### TargetProduct attribute (part of Language element)

Optional.

When using MatchInstalled, you can specify if you want to match the list of already installed languages for a specific product or the combination of all installed products. To target a specific product, you can specify any [supported product ID](/office365/troubleshoot/installation/product-ids-supported-office-deployment-click-to-run). If you want to match the languages of all already installed products, you specify "All." ODT then installs the new product with the same set of languages as the one specified in TargetProduct.

If there's no TargetProduct specified with MatchInstalled, the ODT attempts to match the same Product ID that the Language tag belongs to in the configuration file. For example, if you're using MatchInstalled while installing "VisioProRetail" without a TargetProduct, ODT attempts to match the already installed languages for this product.

Example values:

```xml
<Language ID="MatchInstalled" TargetProduct="O365ProPlusRetail" />
<Language ID="MatchInstalled" TargetProduct="All" />
```

## Display element

Defines what the user sees when Microsoft 365 Apps is installed.

### Example

```xml
<Display Level="None" AcceptEULA="TRUE" />  
```

### Level attribute (part of Display element)

Optional. Default is set to **Full** if not specified.

If **Level** is set to **None**, Microsoft 365 Apps is installed with no user interface: no progress bars, completion screens, error messages, or other user interface are displayed.

If **Level** is set to **Full**, Microsoft 365 Apps is installed with the normal installation experience. 

Allowed values:

- Level="None"
- Level="Full"

### AcceptEULA attribute (part of Display element)

Optional. Defaults to **FALSE** if not specified.

If **AcceptEULA** is set to **TRUE**, the user doesn't see a Microsoft Software License Terms dialog box. If this attribute is set to **FALSE** or isn't included, the user could see a Microsoft Software License Terms dialog box. We recommend that administrators set **AcceptEULA** to **TRUE**. 

Allowed values:

- AcceptEULA="TRUE"
- AcceptEULA="FALSE"

## ExcludeApp element


Defines which Microsoft 365 Apps products shouldn't be installed. OneDrive is installed automatically with Microsoft 365 Apps or with individual applications like Word, Excel, PowerPoint, Publisher, Visio, or Skype. If you don't want OneDrive installed with those applications, use the ExcludeApp element to remove it. For more information, see [Exclude OneDrive when installing Microsoft 365 Apps or other applications](overview-office-deployment-tool.md#exclude-onedrive-when-installing-microsoft-365-apps-or-other-applications).

### Example

```xml
<Add SourcePath="\\Server\Share" 
     OfficeClientEdition="64"
     Channel="MonthlyEnterprise">
  <Product ID="O365ProPlusRetail">
    <Language ID="en-us" />
    <Language ID="ja-jp" />
    <ExcludeApp ID="Publisher" />
  </Product>
</Add>  
```

If a configuration file with ExcludeApp is used to install Office on a device that already has Microsoft 365 Apps installed, the ExcludeApp setting is treated differently based on the list of languages:

- If the configuration file lists all languages already installed on the device, its ExcludeApp setting overrides any previous ExcludeApp settings. This applies even when the file's language list includes both the installed languages and extra languages.
- If the list of languages in the configuration file doesn't include all the installed languages, then the ExcludeApp setting in the configuration file is combined with the ExcludeApp setting on the device. 


### ID attribute (part of ExcludeApp element)

Required.

Defines the ID of the product that shouldn't be installed.

Allowed values:

- ID="Access"
- ID="Bing"
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

> [!NOTE]
> - For OneDrive, use **Groove**. For Skype for Business, use **Lync**.
> - For more information about Microsoft Teams, see [Deploy Microsoft Teams with Microsoft 365 Apps](teams-install.md).
> - "Bing" refers to the background service for Microsoft Search in Bing. For more information, see [Microsoft Search in Bing and Microsoft 365 Apps for enterprise](microsoft-search-bing.md).

## Property element

Defines certain Microsoft 365 Apps behaviors and properties.

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

Because Microsoft 365 Apps is set to activate automatically, you shouldn't set this property for Microsoft 365 Apps products. For other products, you can set **AUTOACTIVATE** to **1** to have the product activate automatically.

Allowed values:

- Property Name="AUTOACTIVATE"
          Value="0"
- Property Name="AUTOACTIVATE"
          Value="1"
	  

### FORCEAPPSHUTDOWN property (part of Property element)

Optional. Default is **FALSE** if not specified.


When set to **TRUE**, forces any apps that are blocking the install of Microsoft 365 Apps to shut down. Data loss might occur. 

Allowed values:

- Property Name="FORCEAPPSHUTDOWN"
          Value="FALSE"
- Property Name="FORCEAPPSHUTDOWN"
          Value="TRUE"


### PACKAGEGUID property (part of Property element)

Optional.

By default, App-V packages created by the ODT share the same App-V Package ID. Administrators can use **PACKAGEGUID** to specify a different Package ID. It allows you to publish multiple App-V packages of Microsoft 365 Apps to an App-V Management Server. However, it doesn't enable you to deploy more than one Microsoft 365 Apps App-V package to a single computer. You can use the ODT to create App-V packages for Microsoft 365 Apps. Creating packages for the volume-licensed versions of Office Professional Plus or Office Standard isn't supported.

The Package ID must follow the format of the example and can only use these characters: 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, A, B, C, D, E, F  

If you use any other characters, the App-V package is created with the default Package ID.

Example values:

- Property Name="PACKAGEGUID"
          Value="12345678-ABCD-1234-ABCD-1234567890AB"

### SharedComputerLicensing property (part of Property element)

Optional. Default value is **0** if not specified.

Set **SharedComputerLicensing** to 1 if you deploy Microsoft 365 Apps to shared computers by using Remote Desktop Services. 

For more information, see  [Overview of shared computer activation for Microsoft 365 Apps](../licensing-activation/overview-shared-computer-activation.md).

Allowed values:

- Property Name="SharedComputerLicensing" Value="0"
- Property Name="SharedComputerLicensing" Value="1"

### SCLCacheOverride property (part of Property element)

Optional. Default value is **0** if not specified.

Set **SCLCacheOverride** to 1 if you're using shared computer activation and you want to roam the licensing token. Use this property with SCLCacheOverrideDirectory. This property is only needed if you choose to move the licensing token from its default location. For more information, see [Overview of shared computer activation for Microsoft 365 Apps](../licensing-activation/overview-shared-computer-activation.md).

Allowed values:

- Property Name="SCLCacheOverride" Value="0"
- Property Name="SCLCacheOverride" Value="1"

### SCLCacheOverrideDirectory property (part of Property element)

Optional.

Set **SCLCacheOverrideDirectory** to specify a folder location for the licensing token if you're using shared computer activation and you want to roam the licensing token. Use the property with SCLCacheOverride. This property is only needed if you choose to move the licensing token from its default location.

For more information, see [Overview of shared computer activation for Microsoft 365 Apps](../licensing-activation/overview-shared-computer-activation.md).

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

Defines whether shortcut icons for Microsoft 365 Apps products are added to the Windows taskbar in Windows 7 and Windows 8.1. If you install Microsoft 365 Apps using a system account, which is common when deploying with Microsoft Configuration Manager, the icons aren't pinned even if this property is set to **True**.

Allowed values:

- Property Name="PinIconsToTaskbar"
          Value="FALSE"
- Property Name="PinIconsToTaskbar"
          Value="TRUE"

> [!NOTE]
> - Microsoft 365 Apps is no longer supported on Windows 7. For more information, see [Windows 7 end of support and Microsoft 365 Apps](../end-of-support/windows-7-support.md).
> - Microsoft 365 Apps is no longer supported on Windows 8.1. For more information, see [Windows 8.1 end of support and Microsoft 365 Apps](../end-of-support/windows-81-support.md).

## Remove element

Defines which products and languages to remove from a previous installation of Microsoft 365 Apps. To remove an installed language, you must provide both the product and the language, as in the example. To remove all the installed languages, don't include the language attribute. In that case, the ODT automatically discovers and removes all installed languages for the product. 

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

Optional. The default value is **FALSE** if not specified.

If set to **TRUE**, all Microsoft 365 Apps products and languages are removed, including Project and Visio.

Allowed values:

- All="FALSE"
- All="TRUE"

## Updates element

Defines how Microsoft 365 Apps is updated after installed.

### Example

```xml
<Updates Enabled="TRUE" 
         UpdatePath="\\Server\Share\"
         Channel="SemiAnnual" />
```

### Enabled attribute (part of Updates element)

Optional. The default value is **TRUE** if not specified.

If set to **TRUE**, Microsoft 365 Apps checks for updates.
If set to **FALSE**, Microsoft 365 Apps doesn't check for updates, but the user can check for updates by going to **File** > **Account** > **Update Options** > **Update Now**.

Allowed values:

- Enabled="TRUE"
- Enabled="FALSE"


### UpdatePath attribute (part of Updates element)

Optional. Defaults to the CDN if not specified.

Defines where the updates for Microsoft 365 Apps come from. **UpdatePath** can specify a network, local, or HTTP path of a source for installation files. Environment variables can be used for network or local paths. 

If you use Group Policy with the [Administrative Template files (ADMX/ADML) for Office](https://www.microsoft.com/download/details.aspx?id=49030), you can set **UpdatePath** by using the **Update Path** policy setting. You can find this policy setting under Computer Configuration\Policies\Administrative Templates\Microsoft Office 2016 (Machine)\Updates.

Example values:

- UpdatePath="\\\server\share\"
- UpdatePath="C:\Preload\Office"
- UpdatePath="`http://internalApps/Office/`"

### TargetVersion attribute (part of Updates element)

Optional. Defaults to the latest version from the specified update path.

Defines which version Microsoft 365 Apps updates to. If **TargetVersion** is set to a specific build number, Microsoft 365 Apps attempts to update to that version. 

If you use Group Policy with the [Administrative Template files (ADMX/ADML) for Office](https://www.microsoft.com/download/details.aspx?id=49030), you can set **TargetVersion** by using the **Target Version** policy setting. You can find this policy setting under Computer Configuration\Policies\Administrative Templates\Microsoft Office 2016 (Machine)\Updates.

Example values:

- TargetVersion="16.0.12345.12345"
- TargetVersion=""

### Deadline attribute (part of Updates element)

Optional.

Defines a deadline by which updates must be applied. The deadline is specified in Coordinated Universal Time (UTC). You can use **Deadline** with **Target Version** to make sure that Microsoft 365 Apps is updated to a particular version by a particular date. We recommend that you set the deadline at least a week in the future to allow users time to install the updates. 


Before the deadline, users receive multiple reminders to install the updates. If Microsoft 365 Apps isn't updated by the deadline, users see a notification that the updates will be applied in 15 minutes. This notification gives users the opportunity to save the documents that they're working on and to close any Microsoft 365 applications that are open. If users don't close the Microsoft 365 applications, the applications are closed automatically when the 15 minutes are up, which might result in data loss. 

After Microsoft 365 Apps is closed, the updates are applied automatically. The deadline only applies to one set of updates. If you want to use a deadline to make sure that Microsoft 365 Apps is always up to date, you must change the deadline every time a new update is available.

To use this attribute, Office must be running at least Service Pack 1 (version 15.0.4569.1507). If you use Group Policy with the [Administrative Template files (ADMX/ADML) for Office](https://www.microsoft.com/download/details.aspx?id=49030), you can set **Deadline** by using the **Update Deadline** policy setting. You can find this policy setting under Computer Configuration\Policies\Administrative Templates\Microsoft Office 2016 (Machine)\Updates.

Example value:

- Deadline="05/16/2014 18:30"

### Channel attribute (part of Updates element)

Optional. The default is **Current**.

Defines which channel to use for updating Microsoft 365 Apps after installed. There are two channel attributes: the channel for the  [Add element](#add-element) is used to specify an update channel while installing Microsoft 365 Apps, and the channel for the Updates element is used to change the channel for an existing installation of Microsoft 365 Apps.

For more information about update channels, see  [Overview of update channels for Microsoft 365 Apps](../updates/overview-update-channels.md). 

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


If you deploy Office LTSC Professional Plus 2021 or Office LTSC Standard 2021, which are volume-licensed versions, you must use this update channel: PerpetualVL2021. For more information, see [Update channel for Office LTSC 2021](/office/ltsc/2021/update#update-channel-for-office-ltsc-2021).

If you're deploying Office Professional Plus 2019 or Office Standard 2019, which are volume licensed versions of Office, there's a different update channel you need to use: PerpetualVL2019. For more information, see [Update channel for Office 2019](/office/2019/update#update-channel-for-office-2019).

## RemoveMSI element

Optional.

Specifies whether any 2007, 2010, 2013, or 2016 versions of Office, Visio, and Project that were installed using Windows Installer (MSI) are uninstalled from the computer before the installation of the specified product, such as Microsoft 365 Apps.

We recommend that you uninstall any previous versions of Office before installing Microsoft 365 Apps. For more information about using RemoveMSI, see [Remove existing MSI versions of Office when upgrading to Microsoft 365 Apps](upgrade-from-msi-version.md).  

### IgnoreProduct attribute (part of RemoveMSI element)

Optional.

If an ID is specified, that Windows Installer (MSI) product isn't uninstalled from the computer.

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
