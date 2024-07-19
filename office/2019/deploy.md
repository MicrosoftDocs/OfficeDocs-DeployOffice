---
title: "Deploy Office 2019 (for IT Pros)"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: conceptual
ms.service: office-perpetual-itpro
ms.localizationpriority: medium
ms.collection: Tier2
description: "Provides IT admins with information on how to deploy Office 2019."
ms.date: 03/11/2024
---

# Deploy Office 2019 (for IT Pros)
 
  
To set up and deploy volume licensed versions of Office 2019, including Project and Visio, within your organization, utilize the Office Deployment Tool (ODT). The Office Customization Tool (OCT) that you previously used for Windows Installer (MSI) is no longer used.

The installation files for Office 2019 are available on the Office Content Delivery Network (CDN) on the internet instead of on the Volume Licensing Service Center (VLSC). You can install Office 2019 directly from the Office CDN. Or, you can download the installation files from the Office CDN to a location on your local network, such as a shared folder, and install Office 2019 from that location. You can use different methods for different sets of computers in your organization. Whichever method you choose, you use the ODT.

Installing directly from the Office CDN requires the least amount of administrative effort and is recommended. But you might have constraints that prevent you from installing directly from the internet. For example, some computers might lack internet connectivity, or you could have limited bandwidth to the internet.

## Download the Office Deployment Tool from the Microsoft Download Center

The [Office Deployment Tool](https://www.microsoft.com/download/details.aspx?id=49117) is a free download from the Microsoft Download Center. We recommend that you always download and use the most current version of the ODT.

After you download the Office Deployment Tool, double-click on the officedeploymenttool executable (.exe) file to extract the ODT files. When you're finished, you should have several files:  setup.exe and some sample configuration.xml files. For an Office 2019-specific sample, see [Sample configuration.xml file to use with the Office Deployment Tool](#sample-configurationxml-file-to-use-with-the-office-deployment-tool).

The setup.exe file is the ODT and is a command-line tool that supports downloading and installing Office 2019. The configuration.xml files are sample files to get you started. You use the configuration.xml file to provide settings for the ODT to use when downloading or installing Office 2019. The configuration.xml is a simple xml file that can be created and edited in any text editor, such as Notepad. You can name the file anything that you want, as long as it retains the xml file extension.

## Create the configuration.xml

Once you have a copy of the ODT, you need to create a configuration.xml file. You can create multiple configuration.xml files to be used with the ODT. For example, to download and install the 64-bit version of Office Professional Plus 2019 in English, you need to create one configuration.xml file. For the 32-bit version of Visio Professional 2019 in French, you create a different configuration.xml file. When you run the ODT from an elevated command prompt, you specify which configuration.xml file to use. 

> [!TIP]
> Instead of using a text editor to create your configuration.xml, we recommend that you use the [Office Customization Tool (OCT)](https://config.office.com). The OCT provides a web-based interface for making your selections and creating your configuration.xml file to be used with the Office Deployment Tool. For more information, see [Overview of the Office Customization Tool](/microsoft-365-apps/admin-center/overview-office-customization-tool). Please note that this is different than the Office Customization Tool that you might have used in the past to install volume licensed versions of Office that used Windows Installer (MSI) as the installation technology.

There are a series of settings in the configuration.xml file that you configure to customize the Office 2019 download or installation. The following table lists the most common settings to configure in the configuration.xml file.


|Configuration  |configuration.xml setting  |Additional information  |
|---------|---------|---------|
|Where to download the Office installation files to and where to install Office from <br/> <br/>For example, \\\server\share (a shared folder on your local network)| SourcePath  |If you don’t specify a SourcePath, the ODT looks for the installation files in the folder it’s located in. If it doesn’t find the Office installation files there, it goes to the Office CDN to get the installation files. <br/> <br/>  We recommend that you install Office directly from the Office CDN, if internet connectivity and network bandwidth make that possible.      |
|Which products to download or install <br/> <br/>For example, Office Professional Plus 2019 | Product ID  | Valid values for volume licensed versions of Office 2019 include:  <br/>- ProPlus2019Volume <br/> -	Standard2019Volume <br/>- ProjectPro2019Volume <br/> - ProjectStd2019Volume <br/> - VisioPro2019Volume <br/> - VisioStd2019Volume  <br/><br/> For a list of Product IDs for other volume licensed versions of Office 2019, such as Access 2019, see [List of Product IDs that are supported by the Office Deployment Tool for Click-to-Run](/microsoft-365/troubleshoot/installation/product-ids-supported-office-deployment-click-to-run).|
|Use Key Management Service (KMS) to activate Office 2019|PIDKEY| Enter the [Generic Volume License Key (GVLK)](../volume-license-activation/gvlks.md) for KMS activation.|
|Use Multiple Activation (MAK) to activate Office 2019     | PIDKEY  | Enter the product key for MAK activation.  |
|Which languages to download or install <br/> <br/> For example, English (en-us) and French (fr-fr). |Language ID      | You can install multiple languages at the same time you’re Installing Office 2019, or you can install them later.   <br/> <br/> For more information, see [Deploy languages for Office 2019](#deploy-languages-for-office-2019).   |
|Which proofing tools to install  |Product ID  | The Product ID is "ProofingTools" and is used in combination with the Language ID. <br/> <br/> For more information, see [Deploy languages for Office 2019](#deploy-languages-for-office-2019). |
|Which edition of Office 2019 to download or install. <br/> <br/>  For example, the 64-bit version.    | OfficeClientEdition  | Valid xml values are "32" and "64." <br/> <br/>All Office products on the computer must be of the same architecture. You can’t have both 32-bit and 64-bit Office products installed on the same computer. <br/><br/>  We recommend 64-bit on computers that have 4 GB or more of memory. But you should assess application compatibility and other factors that might require you to use the 32-bit version. <br/> <br/> For more information, see [Choose between the 64-bit or 32-bit version of Office](https://support.microsoft.com/office/2dee7807-8f95-4d0c-b5fe-6c6f49b8d261).   |
| Which apps to install <br/> <br/> For example, all apps except Publisher.  | ExcludeApp       | By default, all apps included in Office Professional Plus 2019 are installed. <br/> <br/> For example, to not install Publisher, you can include the following line in your configuration.xml:  <br/> <br/> \<ExcludeApp ID="Publisher" />  <br/> <br/> For more information, see [ExcludeApp element](/microsoft-365-apps/deploy/office-deployment-tool-configuration-options#excludeapp-element).    |
| Where to get security and quality updates from. <br/> <br/> For example, directly from the Office CDN on the internet. | UpdatePath |  The default is to get updates from the Office CDN on the internet, minimizing administrative work.  <br/> <br/> If you need to update computers that lack internet connectivity, you can specify that Office gets updates from a shared folder on your local network. But this means that you must download the updates from the Office CDN and copy them to the shared folder.  <br/> <br/> For more information, see [Update Office 2019 (for IT Pros)](update.md).  |
|Which update channel to install from and get updates from  |Channel  | Office uses the concept of update channels to determine which updates an installed version of Office receives.   <br/> <br/>  For more information, see [Update channel for Office 2019](update.md#update-channel-for-office-2019).  |
|Whether to remove previous Windows Installer (MSI) versions of Office before installing Office 2019  |RemoveMSI   | RemoveMSI is recommended.   <br/> <br/>  For more information, see [Remove existing versions of Office before installing Office 2019](#remove-existing-versions-of-office-before-installing-office-2019).    |


> [!TIP]
> More information about these configuration.xml settings is available here: [Configuration options for the Office Deployment Tool](/microsoft-365-apps/deploy/office-deployment-tool-configuration-options). Keep in mind that not all the information in that article applies to Office 2019. For example, the settings related to shared computer activation, such as SharedComputerLicensing and SCLCacheOverride, don’t apply to Office 2019.


## Sample configuration.xml file to use with the Office Deployment Tool
The following sample configuration.xml file can be used to download or install the 64-bit version of Office Professional Plus 2019 in English. It sets up the installation from a shared folder on your local network and activates using MAK. If you’re using this configuration.xml to install Office 2019, previous Windows Installer (MSI) versions of Office are removed as part of the installation process. Also, updates are enabled and set to download directly from the Office CDN by default, even if this setting isn't specified in the configuration.xml.

```xml
<Configuration>
  <Add SourcePath="\\Server\Share" OfficeClientEdition="64" Channel="PerpetualVL2019">
      <Product ID="ProPlus2019Volume"  PIDKEY="#####-#####-#####-#####-#####" >
         <Language ID="en-us" />
      </Product>
      <Product ID="ProofingTools">
        <Language ID="de-de" />
        <Language ID="ja-jp" />
      </Product>
  </Add>
  <RemoveMSI />
  <Display Level="None" AcceptEULA="TRUE" />  
</Configuration>
```

For the PIDKEY, replace #####-#####-#####-#####-##### with your MAK client activation key. 


## Remove existing versions of Office before installing Office 2019
Uninstall any previous versions of Office before installing volume-licensed versions of Office 2019. To uninstall Office versions that use Windows Installer (MSI) as the installation technology, use the Office Deployment Tool and include the RemoveMSI element in your configuration.xml file.

There are several ways that you can use the RemoveMSI element when installing volume licensed versions of Office 2019.
- Uninstall all Office products on the computer.
- Identify any existing language resources, like language packs, and install the same languages.
- Keep some Office products and uninstall all other Office products on the computer.

RemoveMSI can be used to uninstall 2010, 2013, or 2016 versions of Office, Visio, or Project that were installed using Windows Installer (MSI).

For more information about using RemoveMSI, see [Remove existing MSI versions of Office when upgrading to Microsoft 365 Apps](../upgrade-from-msi-version.md). Even though this article is about Microsoft 365 Apps, most of the information also applies to volume licensed versions of Office 2019.



## Download the Office 2019 installation files
Once you have a copy of the ODT and created your configuration.xml file, you can download the Office 2019 installation files to your local network. To do that, open an elevated command prompt, go to the folder where you saved the ODT and the configuration.xml file, and type this command:

```console
	setup /download configuration.xml
```

If you saved the configuration.xml file with a different name, use that name in the command.

Even though it appears that nothing is happening, the system is downloading the file in the background. After the download finishes, the system will return you to a command prompt.

If you want to check that the files are downloading, go to the location you specified for your SourcePath in the configuration.xml file. You should see a folder named "Office" with a subfolder named "Data."  Also, there's a folder named with the version number of the download. For example, 16.0.10336.20044. Which files you see and the names of the files depend on whether you're downloading the 32-bit or 64-bit version of Office and which languages you're downloading. 

Here are some more details about downloading Office 2019 installation files:
- You must download the 32-bit and 64-bit versions separately.
- Every volume-licensed version of Office 2019, including Office Professional Plus 2019, Visio Professional 2019, and Project Professional 2019, comes in a single download. This approach conserves disk space on your local network, no matter the products you choose in the configuration.xml file. The core files for the Office 2019 products are in the stream.x86.x-none.dat or stream.x64.x-none.dat file, depending if it’s the 32-bit or 64-bit version of Office. 

## Install Office 2019 by using the Office Deployment Tool
After obtaining the ODT and preparing your configuration.xml file, and once the Office 2019 installation files are downloaded to your local network (if needed), you can proceed with the Office 2019 installation. To do that, open an elevated command prompt, go to the folder where you saved the ODT and the configuration.xml file, and type the following command:

```console
	setup /configure configuration.xml
```

If you saved the configuration.xml file with a different name, use that name in the command. 

Once the installation is complete, you're returned to a command prompt and you can go open Office 2019 programs you installed.

## Install Office 2019 by using Microsoft Configuration Manager

You can also use Microsoft Configuration Manager (current branch) to deploy volume licensed versions of Office 2019. The Office 365 Client Installation wizard steps you through the process and builds the configuration.xml file for you. You see an entry for Office Professional Plus 2019 in the wizard. On that same page, you can also select to deploy Project and Visio. To get to the wizard, in the Configuration Manager console, navigate to **Software Library** > **Overview** > **Office 365 Client Management**.

## Deploy languages for Office 2019

You can use the ODT and the configuration.xml file to install volume licensed versions of Office 2019, including Project and Visio, in multiple languages. For more information, see [Language element](/microsoft-365-apps/deploy/office-deployment-tool-configuration-options#language-element).

You can also just install proofing tools by specifying the Product ID as "ProofingTools" in your configuration.xml file along with the appropriate Language IDs. Proofing tools packages, which are a new capability for Office 2019, are smaller than full language packs. Consider deploying proofing tools in cases where users work with documents in multiple languages but don’t need the Office product UI in all those languages. The proofing tools can be installed at the same time you’re installing Office 2019, or you can install them later. They can also be installed whether or not the language pack for a given language is installed.

If you're upgrading from a Windows Installer (MSI) version of Office, you can get Click-to-Run versions of the same language resources – for example, language packs, language interface packs, or proofing tools – installed when you deploy Office 2019. For more information, see [Remove existing MSI versions of Office when upgrading to Microsoft 365 Apps](../upgrade-from-msi-version.md). Even though this article is about Microsoft 365 Apps, most of the information also applies to volume licensed versions of Office 2019.


## Related articles

- [Overview of Office 2019 (for IT Pros)](overview.md)
- [Update Office 2019 (for IT Pros)](update.md)
- [Volume activation for Office](../volume-license-activation/plan-volume-activation-of-office.md)
