---
title: "Overview of the Office Deployment Tool"
ms.author: jwhit
author: jwhit-MSFT
manager: laurawi
ms.audience: ITPro
ms.topic: get-started-article
ms.service: o365-proplus-itpro
localization_priority: Priority
ms.collection:
- Ent_O365
- Strat_O365_ProPlus
ms.custom: Ent_Office_ProPlus
description: "The Office Deployment Tool (ODT) is a command-line tool that you can use to download and deploy Office 365 ProPlus to your client computers. The ODT gives you more control over an Office installation: you can define which products and languages are installed, how those products should be updated, and whether or not to display the install experience to your users."
---

# Overview of the Office Deployment Tool

The Office Deployment Tool (ODT) is a command-line tool that you can use to download and deploy Office 365 ProPlus to your client computers. The ODT gives you more control over an Office installation: you can define which products and languages are installed, how those products should be updated, and whether or not to display the install experience to your users.

If you're not an enterprise administrator and are looking to install Office 365 in your home or business, see [Install Office with Office 365](https://go.microsoft.com/fwlink/?LinkId=273820).

## Download the Office Deployment Tool

Download the Office Deployment Tool from the [Microsoft Download Center](https://go.microsoft.com/fwlink/p/?LinkID=626065).

After downloading the file, run the self-extracting executable file, which contains the Office Deployment Tool executable (setup.exe) and a sample configuration file (configuration.xml).

Before using the ODT to download or install Office, we recommend making sure you have the latest version.

## Get started with the Office Deployment Tool
<a name="BKMK_GetStarted"> </a>

The ODT consists of two files: setup.exe and configuration.xml. To work with the tool, you edit the configuration file to define what options you want, and then run setup.exe from the command line. For example, you can edit the configuration file to download the 32-bit English edition of Office, or you can edit the file to install the 32-bit English edition of Office with the EULA automatically accepted and without Publisher. For the full set of options, see [Configuration options for the Office Deployment Tool](configuration-options-for-the-office-2016-deployment-tool.md).

When running the ODT, you provide the location of the configuration file and define which  *mode*  the ODT should run in:

- To download Office 365 ProPlus products and languages, use **download** mode. Example: `setup.exe /download downloadconfig.xml`. Note that when you download Office to a folder that already contains that version of Office, the ODT will conserve your network bandwidth by downloading only the missing files. For example, if you use the ODT to download Office in English and German to a folder that already contains Office in English, only the German language pack will be downloaded.

- To install the downloaded Office 365 ProPlus products and languages on a client computer, use **configure** mode. You also use configure mode to remove and update Office products and languages. Example: `setup.exe /configure installconfig.xml`

- To apply new application settings to client computers that already have Office 365 ProPlus installed, use **customize** mode. This mode will apply only application settings, without changing any other deployment settings. Example: `setup.exe /customize appsettingsconfig.xml`

- To create an App-V package from the downloaded Office 365 ProPlus products and languages, use **packager** mode. Example: `setup.exe /packager packageconfig.xml`

You can also use **help** mode to read command-line help for the tool.

## Download the installation files for Office 365 ProPlus
<a name="BKMK_downloadinstallationfiles"> </a>

Follow these steps to download installation files for Office 365 ProPlus from the Office Content Delivery Network (CDN). 

 **Step 1: Create the configuration file**

When creating the configuration file, we recommend starting with an example file and updating it with the appropriate options for your environment. You can start by copying and pasting the example below into a text file, saving it with a name of your choosing, and then editing the XML elements and attributes to define the options you want.

In this example, the configuration file downloads the installation files for a 32 bit English edition of Office 365 ProPlus and Visio Online Plan 2 (previously named Visio Pro for Office 365) to \\\\server\share on your network:

```
<Configuration> 
  <Add SourcePath="\\server\share" OfficeClientEdition="32"> 
   <Product ID="O365ProPlusRetail" > 
     <Language ID="en-us" />      
   </Product> 
   <Product ID="VisioProRetail" > 
     <Language ID="en-us" />      
   </Product> 
 </Add> 
</Configuration>
```

For more information about the configuration options and more examples, see [Configuration options for the Office Deployment Tool](configuration-options-for-the-office-2016-deployment-tool.md).

 **Step 2: Run the ODT executable in download mode**

From a command prompt, run the ODT executable in download mode and with a reference to the configuration file you just saved. In this example, the configuration file is named **downloadconfig.xml:**

 `setup.exe /download downloadconfig.xml`

 **Step 3: Validate that the files have been downloaded**

After running the command, go to the download location you defined in the configuration file and look for an Office folder with the appropriate files in it. If you run into problems, make sure you have the newest version of the ODT. You can also troubleshoot issues by reviewing the log file in the %temp% directory.

## Download the installation files for Office 365 ProPlus from a local source
<a name="BKMK_downloadfromlocalsource"> </a>

You can use the Office Deployment Tool to download the installation files for Office 365 ProPlus from a local source on your network instead of from the Office Content Delivery Network (CDN). By doing so, you can store a central copy of multiple languages and products for Office and distribute just the languages and products that you need to other locations on your network.

To download from a local source, follow the steps for downloading Office with the ODT, but include in your configuration file the download path, which defines where the installation files are downloaded from. For example, this configuration file downloads a 32 bit English edition of Office 365 ProPlus from **\\\\servera\share** (the DownloadPath) to **\\\\serverb\share** (the SourcePath):

```
<Configuration> 
  <Add SourcePath="\\serverb\share" OfficeClientEdition="32" Version="16.0.6741.2056" DownloadPath="\\servera\share"> 
    <Product ID="O365ProPlusRetail" > 
      <Language ID="en-us" />      
    </Product> 
  </Add> 
</Configuration>
```

Note that you must specify a **Version** when using DownloadPath.

## Install Office 365 ProPlus
<a name="BKMK_installoffice"> </a>

After you download Office 365 ProPlus installation files, follow these steps to install Office on a client computer. As part of that installation, you can choose which products to install.

 **Step 1: Create the configuration file**

When creating the configuration file, we recommend starting with an example file and updating it with the appropriate options for your environment. You can start by copying and pasting the example below into a text file, saving it with a name of your choosing, and then editing the XML elements and attributes to define the options you want.

In this example, the configuration file installs a 32 bit English edition of Office 365 ProPlus without Publisher:

```
<Configuration> 
  <Add SourcePath="\\Server\share" OfficeClientEdition="32">
    <Product ID="O365ProPlusRetail" > 
      <Language ID="en-us" />        
      <ExcludeApp ID="Publisher" />
    </Product> 
  </Add> 
  <Display Level="None" AcceptEULA="TRUE" />
</Configuration> 
```

The location of the Office installation files is **\\\\server\share**. The display level is set to **None**, which means the user will not see any user interface during the install, and the AcceptEULA is set to **TRUE**, which means your users will not have to click to accept the EULA during the installation.

For more information about the configuration options, see [Configuration options for the Office Deployment Tool](configuration-options-for-the-office-2016-deployment-tool.md).

 **Step 2: Run the ODT executable in configure mode**

From a command prompt, run the ODT executable in configure mode with a reference to the configuration file you just saved. In the following example, the configuration file is named **installconfig.xml**:

 `setup.exe /configure installconfig.xml`

You must run the executable from the client computer on which you want to install Office and you must have local administrator permissions on that computer.

 **Step 3: Verify that installation was successful**

After running the command, you should see the Office installation start (unless you set display level to none). After installation is complete, the command prompt will display "Products configured successfully." If you run into problems, make sure you have the newest version of the ODT. You can also troubleshoot issues by reviewing the log files in the %temp% and %windir%\temp directories.

## Update Office 365 ProPlus
<a name="BKMK_updateoffice"> </a>

You can use the Office Deployment Tool to make updates to your client computers after installing Office 365 ProPlus. There are two ways to do this:

- Use the ODT to install Office 365 ProPlus again, which will update Office to the newest version. Only the files that have changed in the new version will be updated.

- Use the ODT to download the Office installation files and then point your client computers to that location to receive their updates. (By default, clients are updated directly from the Office Content Delivery Network (CDN).)

To change where your client computers receive their updates, run the ODT in configure mode and specify an update path in the configuration file. For example, to have Office 365 ProPlus get updates automatically from a network share called **\\\\server\updates**, include the following line in your configuration.xml file:

 `<Updates Enabled="TRUE" UpdatePath="\\server\updates" />`

This article does not cover all the issues related to managing updates for Office in your organization. For more information on that end-to-end scenario, including using Group Policy, see [Choose how to manage updates to Office 365 ProPlus](choose-how-to-manage-updates-to-office-365-proplus.md).

<a name="BKMK_excludeorremove"> </a>

## Exclude or remove Office 365 ProPlus products from client computers

When installing Office 365 ProPlus, you can exclude specific products. To do so, follow the steps for installing Office with the ODT, but include the ExcludeApp element in your configuration file. For example, this configuration file installs all the Office 365 ProPlus products except Publisher:

```
<Add SourcePath="\\Server\share" Version="15.1.2.3" OfficeClientEdition="32">
    <Product ID="O365ProPlusRetail" >
      <Language ID="en-us" />
      <ExcludeApp ID="Publisher" />
    </Product>
</Add>
```

If you've already installed Office 365 ProPlus, you can also use the ExcludeApp element to remove a product that you've previously installed. For example, the configuration file above removes Publisher from the previous installation of Office.

You can also remove an entire language version of Office 365 ProPlus. To do so, follow the steps for excluding products for installing Office with the ODT, but replace the configuration file with one that uses the **Remove** element. For example, this configuration file removes the Spanish language version of Office 365 ProPlus:

```
<Configuration> 
 <Remove>
    <Product ID="O365ProPlusRetail" > 
      <Language ID="es-es" />        
    </Product> 
 </Remove>
</Configuration> 
```

For more information about the options for excluding or removing apps, see [Configuration options for the Office Deployment Tool](configuration-options-for-the-office-2016-deployment-tool.md).

## Exclude OneDrive when installing Office 365 ProPlus or other applications

OneDrive is automatically installed when you install Office 365 ProPlus, Word, Excel, PowerPoint, Publisher, Visio, and Skype. If you don't want OneDrive installed with those applications, use the ExcludeApp element to remove it, as shown in the example.  

```
<Add SourcePath="\\Server\share" Version="15.1.2.3" OfficeClientEdition="32">
    <Product ID="O365ProPlusRetail" >
      <Language ID="en-us" />
      <ExcludeApp ID="OneDrive" />
    </Product>
</Add>
```

## Install Office in the same language as the client operating system

When using the ODT, you can automatically install the Office language that matches the display language of the client operating system. To do so, use **Language ID="MatchOS"** in the configuration file.

For example, this configuration file installs the 32-bit edition of Office 365 ProPlus in the same language as the client operating system--English for clients with the display language of English, Japanese for clients with Japanese, and so on:

```
<Configuration> 
  <Add OfficeClientEdition="32">
    <Product ID="O365ProPlusRetail" > 
      <Language ID="MatchOS" />        
    </Product> 
  </Add> 
</Configuration> 
```

## Add languages to existing installations of Office 365 ProPlus
<a name="BKMK_updatelanguages"> </a>

After installing Office, you can use the ODT to install additional language packs for Office. To do so, follow the steps for installing Office with the ODT, but use a new configuration file that uses “LanguagePack” as the Product ID and that indicates which languages to add. 

By default, the ODT will install the languages from the same location that Office gets updates from. If you want to install the languages from a different source location, specify the source path in the configuration file. 

 **Step 1: Download the Office installation files in the languages you want to add**

If Office in your organization is updated from a local source, you must download the Office installation files for the languages you want to add.

 **Step 2: Create the configuration file for adding the language packs**

When creating the configuration file, we recommend starting with an example file and updating it with the appropriate options for your environment. You can start by copying and pasting the example below into a text file, saving it with a name of your choosing, and then ensuring that the OfficeClientEdition and language IDs are what you want.

In this example, the configuration file installs the French and Japanese language packs:

```
<Configuration>
  <Add OfficeClientEdition="32">
    <Product ID="LanguagePack">
      <Language ID="fr-fr" />
      <Language ID="ja-jp" />
    </Product>
  </Add>  
</Configuration>
```

For a list of all languages, see [Language identifiers](https://technet.microsoft.com/EN-US/library/cc179219%28v=office.16%29.aspx).

 **Step 3: Run the ODT executable in configure mode**

From a command prompt, run the ODT executable in configure mode with a reference to the configuration file you just saved. In the following example, the configuration file is named **installlanguage.xml**:

 `setup.exe /configure installlanguage.xml`

You must run the executable from the client computer on which you want to install Office and you must have local administrator permissions on that computer.

## Apply application settings to Office 365 ProPlus

As part of your deployment, you can define application settings for Office 365 ProPlus, including VBA Macro notifications,  default file locations, and default file formats. To do so, you deploy Office using the standard steps in [Install Office 365 ProPlus](#install-office-365-proplus), but you include application settings as part of your configuration file. 

To create the configuration file, we recommend you use the [Office Customization Tool for Click-to-Run (preview)](https://config.office.com/), a web application with a full user interface. Note that this tool is still in preview and is subject to change.

1. In your web browser, open the [Office Customization Tool for Click-to-Run (preview)](https://config.office.com/) and follow the steps to create a configuration file, including defining application settings alongside the standard deployment settings. 
2. Export the file.
3. Follow the steps in [Install Office 365 ProPlus](#install-office-365-proplus) to deploy Office with the newly created configuration file.

In this example, the configuration file installs the 32-bit version of Office 365 ProPlus in English and displays the Trust Bar for all VBA macros in Excel.

```
<Configuration>
  <Add OfficeClientEdition="32" Channel="Broad">
    <Product ID="O365ProPlusRetail">
      <Language ID="en-us" />
    </Product>
  </Add>
  <AppSettings>
    <User Key="software\microsoft\office\16.0\excel\security"
          Name="vbawarnings" 
          Value="3" 
          Type="REG_DWORD" 
          App="excel16" 
          Id="L_VBAWarningsPolicy" />
  </AppSettings>
</Configuration>
```

This file was created with the Office Customization Tool for Click-to-Run (preview). For more details on the app settings, we recommend browsing the options in the tool itself.

## Apply application settings to an existing installation of Office 365 ProPlus

You can apply new application settings to client computers that already have Office 365 ProPlus installed without changing any other deployment setting. To do so, create a configuration file that contains application settings and then run the ODT in **customize** mode. Customize mode ignores all other settings in the configuration file except application settings. 

1. Use the steps in [Apply application settings to Office 365 ProPlus](overview-of-the-office-2016-deployment-tool.md#Apply-application-settings-to-Office-365-ProPlus) to create the configuration file.
2. From a command prompt, run the ODT executable in customize mode with a reference to the configuration file you just created. In the following example, the configuration file is named **installappsettings.xml**:

   `setup.exe /customize installappsettings.xml`

You must run the executable from the client computer on which you want to install Office and you must have local administrator permissions on that computer.

## Create an App-V package for Office 365 ProPlus
<a name="BKMK_createanappvpackage"> </a>

In addition to downloading and deploying Office 365 ProPlus, you can use the Office Deployment Tool to create App-V packages. To do so, update the configuration file and then run the ODT in packager mode. You must create App-V packages on a computer with a clean install of the operating system.

This article does not cover all the issues related to deploying App-V packages. For more information on that end-to-end scenario, see [Deploying Microsoft Office 2016 by Using App-V](https://docs.microsoft.com/en-us/microsoft-desktop-optimization-pack/appv-v5/deploying-microsoft-office-2016-by-using-app-v).

 **Step 1: Create the configuration file**

When creating the configuration file, we recommend starting with an example file and updating it with the appropriate options for your environment. You can start by copying and pasting the example below into a text file, saving it with a name of your choosing, and then editing the XML elements and attributes to define the options you want.

In this example, the configuration file creates an App-V package from a 32-bit English edition of Office 365 ProPlus without Publisher:

```
<Configuration> 
 <Add SourcePath="\\Server\share" OfficeClientEdition="32">
    <Product ID="O365ProPlusRetail" > 
      <Language ID="en-us" />        
      <ExcludeApp ID="Publisher" />
    </Product> 
 </Add> 
</Configuration> 
```

The location of the Office installation files is \\\\server\share. For your configuration file, substitute the example values with the appropriate option for your environment. For more information about the options, see [Configuration options for the Office Deployment Tool](configuration-options-for-the-office-2016-deployment-tool.md),

 **Step 2: Run the ODT executable in packager mode**

From a command prompt, run the ODT executable in packager mode with a reference to the configuration file you just saved and to the location where you want to save the App-V package. In the following example, the configuration file is named **packageconfig.xml** and the App-V package will be saved to **\\\\server\share\appv\\**:

 `setup.exe /packager packageconfig.xml \\server\share\appv\`

 **Step 3: Verify that the package was created**

After running the command, the package location should have an App-V Packages folder and a WorkingDir folder. You can troubleshoot issues by reviewing the log file in the %temp% directory.

## Related topics
<a name="BKMK_createanappvpackage"> </a>

- [Configuration options for the Office Deployment Tool](configuration-options-for-the-office-2016-deployment-tool.md)


