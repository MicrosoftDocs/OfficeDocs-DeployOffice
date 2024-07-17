---
title: "Overview of the Office Deployment Tool"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: conceptual
ms.service: o365-proplus-itpro
ms.collection: Tier1
ms.localizationpriority: medium
recommendations: false
description: "The Office Deployment Tool (ODT) is a command-line tool that you can use to download and deploy Microsoft 365 Apps to your client computers. The ODT gives you more control over an Office installation: you can define which products and languages are installed, how those products should be updated, and whether or not to display the install experience to your users."
ms.date: 03/11/2024
---

# Overview of the Office Deployment Tool

The Office Deployment Tool (ODT) is a command-line tool that you can use to download and deploy Microsoft 365 Apps to your client computers. The ODT gives you more control over an Office installation: you can define which products and languages are installed, how those products should be updated, and whether or not to display the install experience to your users.

If you're not an enterprise administrator and are looking to install Microsoft 365 in your home or business, see [Download and install or reinstall Microsoft 365 or Office 2021 on a PC or Mac](https://go.microsoft.com/fwlink/p/?LinkId=273820).

## Download the Office Deployment Tool

Download the Office Deployment Tool from the [Microsoft Download Center](https://go.microsoft.com/fwlink/p/?LinkID=626065).

After downloading the file, run the self-extracting executable file, which contains the Office Deployment Tool executable (setup.exe) and a sample configuration file (configuration.xml).

Before using the ODT to download or install Office, we recommend making sure you have the latest version.

> [!TIP]
> For more information about what changes are in the latest version of the ODT, see [Release history for Office Deployment Tool](/officeupdates/odt-release-history).

## Get started with the Office Deployment Tool
<a name="BKMK_GetStarted"> </a>

The ODT consists of two files: setup.exe and configuration.xml. To work with the tool, you edit the configuration file to define what options you want, and then run setup.exe from the command line. For example, you can edit the configuration file to install the 64-bit English edition of Office with the license terms automatically accepted. For the full set of options, see [Configuration options for the Office Deployment Tool](office-deployment-tool-configuration-options.md).

> [!NOTE]
> **Best practice:** This article shows the XML elements and attributes in the configuration file for the Office Deployment Tool. You can continue to create the configuration file in a text editor, but we recommend using the [Office Customization Tool](https://config.office.com/) instead. With the Office Customization Tool, you can easily create and modify configuration files in a web-based interface. For more information, see [Overview of the Office Customization Tool](admin-center/overview-office-customization-tool.md).

When running the ODT, you provide the location of the configuration file and define which  *mode*  the ODT should run in:

- To download Microsoft 365 Apps products and languages, use **download** mode. Example: `setup.exe /download downloadconfig.xml`. When you download Office to a folder that already contains that version of Office, the ODT will conserve your network bandwidth by downloading only the missing files. For example, if you use the ODT to download Office in English and German to a folder that already contains Office in English, only the German language pack will be downloaded.

- To install the downloaded Microsoft 365 Apps products and languages on a client computer, use **configure** mode. You also use configure mode to remove and update Office products and languages. Example: `setup.exe /configure installconfig.xml`

- To apply new application preferences to client computers that already have Microsoft 365 Apps installed, use **customize** mode. This mode will apply only application preferences, without changing any other deployment settings. Example: `setup.exe /customize preferencesconfig.xml`

- To create an App-V package from the downloaded Microsoft 365 Apps products and languages, use **packager** mode. Example: `setup.exe /packager packageconfig.xml`

You can also use **help** mode to read command-line help for the tool.

## Download the installation files for Microsoft 365 Apps
<a name="BKMK_downloadinstallationfiles"> </a>

Follow these steps to download installation files for Microsoft 365 Apps from the Office Content Delivery Network (CDN). 

 **Step 1: Create the configuration file**

When creating the configuration file, we recommend starting with an example file and updating it with the appropriate options for your environment. You can start by copying and pasting the example below into a text file, saving it with a name of your choosing, and then editing the XML elements and attributes to define the options you want.

In this example, the configuration file downloads the installation files for a 32-bit English edition of Microsoft 365 Apps for enterprise and the subscription version of the Visio desktop app to \\\\server\share on your network:

```xml
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

For more information about the configuration options and more examples, see [Configuration options for the Office Deployment Tool](office-deployment-tool-configuration-options.md).

 **Step 2: Run the ODT executable in download mode**

From a command prompt, run the ODT executable in download mode and with a reference to the configuration file you saved. In this example, the configuration file is named **downloadconfig.xml:**

 `setup.exe /download downloadconfig.xml`

 **Step 3: Validate that the files have been downloaded**

After running the command, go to the download location you defined in the configuration file and look for an Office folder with the appropriate files in it. If you run into problems, make sure you have the newest version of the ODT. You can also troubleshoot issues by reviewing the log file in the %temp% folder.

## Download the installation files for Microsoft 365 Apps from a local source
<a name="BKMK_downloadfromlocalsource"> </a>

You can use the Office Deployment Tool to download the installation files for Microsoft 365 Apps from a local source on your network. By doing so, you can store a central copy of multiple languages and products for Office and distribute just the languages and products that you need to other locations on your network.

To download from a local source, follow the steps for downloading Office with the ODT, but include in your configuration file the download path, which defines where the installation files are downloaded from. For example, this configuration file downloads a 32-bit English edition of Microsoft 365 Apps for enterprise from **\\\\servera\share** (the DownloadPath) to **\\\\serverb\share** (the SourcePath):

```xml
<Configuration> 
  <Add SourcePath="\\serverb\share" OfficeClientEdition="32" Version="16.0.6741.2056" DownloadPath="\\servera\share"> 
    <Product ID="O365ProPlusRetail" > 
      <Language ID="en-us" />      
    </Product> 
  </Add> 
</Configuration>
```

When using DownloadPath, you must specify a **Version**.

## Install Microsoft 365 Apps
<a name="BKMK_installoffice"> </a>

After you download Microsoft 365 Apps installation files, follow these steps to install Office on a client computer. As part of that installation, you can choose which products to install.

 **Step 1: Create the configuration file**

When creating the configuration file, we recommend starting with an example file and updating it with the appropriate options for your environment. You can start by copying and pasting the example below into a text file, saving it with a name of your choosing, and then editing the XML elements and attributes to define the options you want.

In this example, the configuration file installs a 32-bit English edition of Microsoft 365 Apps for enterprise without Publisher:

```xml
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

The location of the Office installation files is **\\\\server\share**. The display level is set to **None**, which means the user will not see any user interface during the install. The AcceptEULA is set to **TRUE**, which means your users will not have to click to accept the license terms during the installation.

For more information about the configuration options, see [Configuration options for the Office Deployment Tool](office-deployment-tool-configuration-options.md).

 **Step 2: Run the ODT executable in configure mode**

From a command prompt, run the ODT executable in configure mode with a reference to the configuration file you saved. In the following example, the configuration file is named **installconfig.xml**:

 `setup.exe /configure installconfig.xml`

You must have local administrator permissions on the client computer. You can run the executable from the client computer on which you want to install Office or you can put the ODT and the configuration file on a network share and run it from there. If you use a network share, make sure to pass the full network path for both the setup.exe and the configuration file to the command.

 **Step 3: Verify that installation was successful**

After running the command, you should see the Office installation start (unless you set display level to none). After installation is complete, the command prompt will display "Products configured successfully." If you run into problems, make sure you have the newest version of the ODT. You can also troubleshoot issues by reviewing the log files in the %temp% folder.

## Update Microsoft 365 Apps
<a name="BKMK_updateoffice"> </a>

You can use the Office Deployment Tool to make updates to your client computers after installing Microsoft 365 Apps. There are two ways to make the updates:

- Use the ODT to install Microsoft 365 Apps again, which will update Office to the newest version. Only the files that have changed in the new version will be updated.

- Use the ODT to download the Office installation files and then point your client computers to that location to receive their updates. (By default, clients are updated directly from the Office Content Delivery Network (CDN).)

To change where your client computers receive their updates, run the ODT in configure mode and specify an update path in the configuration file. For example, to have Microsoft 365 Apps get updates automatically from a network share called **\\\\server\updates**, include the following line in your configuration.xml file:

 `<Updates Enabled="TRUE" UpdatePath="\\server\updates" />`

This article does not cover all the issues related to managing updates for Office in your organization. For more information on that scenario, including using Group Policy, see [Choose how to manage updates to Microsoft 365 Apps](updates/choose-how-manage-updates-microsoft-365-apps.md).

<a name="BKMK_excludeorremove"> </a>

## Exclude or remove Microsoft 365 Apps applications from client computers

When installing Microsoft 365 Apps, you can exclude specific applications. To do so, follow the steps for installing Office with the ODT, but include the ExcludeApp element in your configuration file. For example, this configuration file installs all the Microsoft 365 Apps for enterprise applications except Publisher:

```xml
<Add SourcePath="\\Server\share" Version="15.1.2.3" OfficeClientEdition="32">
    <Product ID="O365ProPlusRetail" >
      <Language ID="en-us" />
      <ExcludeApp ID="Publisher" />
    </Product>
</Add>
```

If you've already installed Microsoft 365 Apps, you can also use the ExcludeApp element to remove an application that you've previously installed. For example, the configuration file above removes Publisher from the previous installation of Office.

You can also remove an entire language version of Microsoft 365 Apps. To do so, follow the steps for excluding products for installing Office with the ODT, but replace the configuration file with one that uses the **Remove** element. For example, this configuration file removes the Spanish language version of Microsoft 365 Apps for enterprise:

```xml
<Configuration> 
 <Remove>
    <Product ID="O365ProPlusRetail" > 
      <Language ID="es-es" />        
    </Product> 
 </Remove>
</Configuration> 
```

For more information about the options for excluding or removing apps, see [Configuration options for the Office Deployment Tool](office-deployment-tool-configuration-options.md).

## Exclude OneDrive when installing Microsoft 365 Apps or other applications

OneDrive is automatically installed when you install Microsoft 365 Apps or install individual applications, such as Word, Excel, PowerPoint, Publisher, Visio, or Skype. If you don't want OneDrive installed with those applications, use the ExcludeApp element to remove it, as shown in the example.  

```xml
<Add SourcePath="\\Server\share" Version="15.1.2.3" OfficeClientEdition="32">
    <Product ID="O365ProPlusRetail" >
      <Language ID="en-us" />
      <ExcludeApp ID="OneDrive" />
    </Product>
</Add>
```

## Deploy multiple or matching languages

For details on deploying languages, see [Overview of deploying languages for Microsoft 365 Apps](overview-deploying-languages-microsoft-365-apps.md).

## Apply application preferences to Microsoft 365 Apps

As part of your deployment, you can define application preferences for Microsoft 365 Apps, including VBA Macro notifications,  default file locations, and default file formats. To do so, you deploy Office using the standard steps in [Install Microsoft 365 Apps](#install-microsoft-365-apps), but you include application preferences as part of your configuration file. 

To create the configuration file, we recommend you use the [Office Customization Tool for Click-to-Run](https://config.office.com/), a web application with a full user interface.

1. In your web browser, open the [Office Customization Tool for Click-to-Run](https://config.office.com/) and follow the steps to create a configuration file, including defining application preferences alongside the standard deployment settings. 
2. Export the file.
3. Follow the steps in [Install Microsoft 365 Apps](#install-microsoft-365-apps) to deploy Office with the newly created configuration file.

In this example, the configuration file installs the 32-bit version of Microsoft 365 Apps for enterprise in English and displays the Trust Bar for all VBA macros in Excel.

```xml
<Configuration>
  <Add OfficeClientEdition="32" Channel="Current">
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

This file was created with the Office Customization Tool for Click-to-Run. For more information on the app preferences, we recommend browsing the options in the tool itself.

Note: When Office is installed, the app preferences defined in the configuration file are applied to all existing users of the device and any new users added to the device in the future.

## Apply application preferences to an existing installation of Microsoft 365 Apps

You can apply new application preferences to client computers that already have Microsoft 365 Apps installed without changing any other deployment setting. To do so, create a configuration file that contains application preferences and then run the ODT in **customize** mode. Customize mode ignores all other settings in the configuration file except application preferences. 

1. Use the steps in [define application preferences](admin-center/overview-office-customization-tool.md#define-application-preferences) to create the configuration file.
2. From a command prompt, run the ODT executable in customize mode with a reference to the configuration file you created. In the following example, the configuration file is named **installapppreferences.xml**:
  
 `setup.exe /customize installapppreferences.xml`
  
You must run the executable from the client computer on which you want to apply the app preferences and you must have local administrator permissions on that computer. When using customize mode, the app preferences defined in the configuration file are applied to all existing users of the device and any new users added to the device in the future. If you apply application preferences when Office apps are running, the preferences will be applied when Office is next restarted. 

## Create an App-V package for Microsoft 365 Apps
<a name="BKMK_createanappvpackage"> </a>

In addition to downloading and deploying Microsoft 365 Apps, you can use the Office Deployment Tool to create App-V packages. To do so, update the configuration file and then run the ODT in packager mode. You must create App-V packages on a computer that has a clean install of the operating system.

This article does not cover all the issues related to deploying App-V packages. For more information on that scenario, see [Deploying Microsoft Office 2016 by Using App-V](/microsoft-desktop-optimization-pack/appv-v5/deploying-microsoft-office-2016-by-using-app-v).

 **Step 1: Create the configuration file**

When creating the configuration file, we recommend starting with an example file and updating it with the appropriate options for your environment. You can start by copying and pasting the example below into a text file, saving it with a name of your choosing, and then editing the XML elements and attributes to define the options you want.

In this example, the configuration file creates an App-V package from a 32-bit English edition of Microsoft 365 Apps for enterprise without Publisher:

```xml
<Configuration> 
 <Add SourcePath="\\Server\share" OfficeClientEdition="32">
    <Product ID="O365ProPlusRetail" > 
      <Language ID="en-us" />        
      <ExcludeApp ID="Publisher" />
    </Product> 
 </Add> 
</Configuration> 
```

The location of the Office installation files is \\\\server\share. For your configuration file, substitute the example values with the appropriate option for your environment. For more information about the options, see [Configuration options for the Office Deployment Tool](office-deployment-tool-configuration-options.md),

 **Step 2: Run the ODT executable in packager mode**

From a command prompt, run the ODT executable in packager mode with a reference to the configuration file you saved and to the location where you want to save the App-V package. In the following example, the configuration file is named **packageconfig.xml** and the App-V package will be saved to **\\\\server\share\appv\\**:

 `setup.exe /packager packageconfig.xml \\server\share\appv\`

 **Step 3: Verify that the package was created**

After running the command, the package location should have an App-V Packages folder and a WorkingDir folder. You can troubleshoot issues by reviewing the log file in the %temp% folder.

## Related articles
<a name="BKMK_createanappvpackage"> </a>

- [Configuration options for the Office Deployment Tool](office-deployment-tool-configuration-options.md)