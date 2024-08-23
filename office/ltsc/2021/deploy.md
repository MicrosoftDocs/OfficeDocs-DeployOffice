---
title: "Deploy Office LTSC 2021"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: conceptual
ms.service: office-perpetual-itpro
ms.localizationpriority: medium
ms.collection: Tier1
recommendations: false
description: "Provides IT admins with information on how to deploy Office LTSC 2021."
ms.date: 03/11/2024
---

# Deploy Office LTSC 2021

To configure and perform deployments of Office LTSC 2021, including Project and Visio, for users in your organization, you use the Office Deployment Tool (ODT). The Office Customization Tool (OCT) that you previously used for Windows Installer (MSI) is no longer used.

The installation files for Office LTSC 2021 are available on the Office Content Delivery Network (CDN) on the internet instead of on the Volume Licensing Service Center (VLSC). You can install Office LTSC 2021 directly from the Office CDN. Or, you can download the installation files from the Office CDN to a location on your local network, such as a shared folder, and install Office LTSC 2021 from that location. You can use different methods for different sets of devices in your organization. Whichever method you choose, you use the ODT.

Installing directly from the Office CDN requires the least amount of administrative effort and is recommended. But you might have constraints that prevent you from installing directly from the internet. For example, some devices might not have connectivity to the internet or you might have limited bandwidth to the internet.

The following steps are the basic steps for deploying Office LTSC 2021:

1. [Download the Office Deployment Tool from the Microsoft Download Center](#download-the-office-deployment-tool-from-the-microsoft-download-center)
2. [Create the configuration.xml file](#create-the-configurationxml-file)
3. [Download the Office LTSC 2021 installation files](#download-the-office-ltsc-2021-installation-files) *(optional, if not installing directly from the Office CDN)*
4. [Install Office LTSC 2021 by using the Office Deployment Tool](#install-office-ltsc-2021-by-using-the-office-deployment-tool)

Alternatively, you can [use Configuration Manager to deploy Office LTSC 2021](#install-office-ltsc-2021-by-using-configuration-manager) if that's available in your organization.

Whichever way you choose to deploy Office LTSC 2021, we recommend that you [remove existing versions of Office before installing Office LTSC 2021](#remove-existing-versions-of-office-before-installing-office-ltsc-2021).

## Download the Office Deployment Tool from the Microsoft Download Center

<!--Using include for odt-->
[!INCLUDE[odt-download.md](../../includes/odt-download.md)]

For an Office LTSC 2021-specific sample, see [Sample configuration.xml file to use with the Office Deployment Tool](#sample-configurationxml-file-to-use-with-the-office-deployment-tool).

## Create the configuration.xml file

Once you have a copy of the ODT, you need to create a configuration.xml file. You can create multiple configuration.xml files to be used with the ODT. For example, you can create a configuration.xml file to download and install the 64-bit version of Office LTSC Professional Plus 2021 in English. Then, you can create a different configuration.xml file to install the 32-bit version of Visio LTSC Professional 2021 in French. When you run the ODT from an elevated command prompt, you specify which configuration.xml file to use.

<!--Using include for use-oct-->
[!INCLUDE[use-oct.md](../../includes/use-oct.md)]

There are a series of settings in the configuration.xml file that you configure to customize the Office LTSC 2021 download or installation. The following table lists the most common settings to configure in the configuration.xml file.


|Configuration  |configuration.xml setting  |Additional information  |
|---------|---------|---------|
|Where to download the Office installation files to and where to install Office from <br/> <br/>For example, \\\server\share (a shared folder on your local network).| SourcePath  |If you don’t specify a SourcePath when installing Office, the ODT looks for the installation files in the folder it’s located in. If it doesn’t find the Office installation files there, it goes to the Office CDN to get the installation files. <br/> <br/>  We recommend that you install Office directly from the Office CDN, if internet connectivity and network bandwidth make that possible.      |
|Which products to download or install <br/> <br/>For example, Office LTSC Professional Plus 2021. | Product ID  | Valid values include the following IDs:  <br/>- ProPlus2021Volume <br/> -	Standard2021Volume <br/>- ProjectPro2021Volume <br/> - ProjectStd2021Volume <br/> - VisioPro2021Volume <br/> - VisioStd2021Volume  <br/><br/> For a list of Product IDs for other volume licensed Office products, such as Access LTSC 2021, see [List of Product IDs which are supported by the Office Deployment Tool for Click-to-Run](/microsoft-365/troubleshoot/installation/product-ids-supported-office-deployment-click-to-run).<br/><br/> If you have a Microsoft Services Provider License Agreement (SPLA), [review this information](spla.md).|
|Use Key Management Service (KMS) to activate Office LTSC 2021|PIDKEY| Enter the [Generic Volume License Key (GVLK)](../../volume-license-activation/gvlks.md) for KMS activation.|
|Use Multiple Activation (MAK) to activate Office LTSC 2021     | PIDKEY  | Enter the product key for MAK activation.  |
|Which languages to download or install <br/> <br/> For example, English (en-us) and French (fr-fr). |Language ID      | You can install multiple languages at the same time you’re Installing Office LTSC 2021, or you can install them later.   <br/> <br/> For more information, see [Deploy languages for Office LTSC 2021](#deploy-languages-for-office-ltsc-2021).   |
|Which proofing tools to install  |Product ID  | The Product ID is "ProofingTools" and is used in combination with the Language ID. <br/> <br/> For more information, see [Deploy languages for Office LTSC 2021](#deploy-languages-for-office-ltsc-2021). |
|Which edition of Office LTSC 2021 to download or install. <br/> <br/>  For example, the 64-bit version.    | OfficeClientEdition  | Valid xml values are "32" and "64." <br/> <br/>All Office products on the device must be of the same architecture. You can’t have both 32-bit and 64-bit Office products installed on the same device. <br/><br/>  We recommend 64-bit on devices that have 4 GB or more of memory. But you should assess application compatibility and other factors that might require you to use the 32-bit version. <br/> <br/> For more information, see [Choose between the 64-bit or 32-bit version of Office](https://support.microsoft.com/office/2dee7807-8f95-4d0c-b5fe-6c6f49b8d261).   |
| Which apps to install <br/> <br/> For example, all apps except Publisher.  | ExcludeApp       | By default, all apps included in Office LTSC Professional Plus 2021 are installed. <br/> <br/> For example, to not install Publisher, you can include the following line in your configuration.xml:  <br/> <br/> \<ExcludeApp ID="Publisher" />  <br/> <br/> For more information, see [ExcludeApp element](/microsoft-365-apps/deploy/office-deployment-tool-configuration-options#excludeapp-element).    |
| Where to get security and quality updates from. <br/> <br/> For example, directly from the Office CDN on the internet. | UpdatePath |  The default is to get updates directly from the Office CDN on the internet, which is recommended and requires the least amount of administrative effort.  <br/> <br/> But if you need to update devices that don’t have internet connectivity, you can specify that Office gets updates, for example, from a shared folder on your local network. But this option means that you must download the updates from the Office CDN each month and copy them to the shared folder.  <br/> <br/> For more information, see [Update Office LTSC 2021](update.md).  |
|Which update channel to install from and get updates from  |Channel  | Office uses the concept of update channels to determine which updates an installed version of Office receives.   <br/> <br/>  For more information, see [Update channel for Office LTSC 2021](update.md#update-channel-for-office-ltsc-2021).  |
|Whether to remove previous Windows Installer (MSI) versions of Office before installing Office LTSC 2021  |RemoveMSI   | Recommended. For more information, see [Remove existing versions of Office before installing Office LTSC 2021](#remove-existing-versions-of-office-before-installing-office-ltsc-2021).    |


> [!TIP]
> More information about these configuration.xml settings is available here: [Configuration options for the Office Deployment Tool](/microsoft-365-apps/deploy/office-deployment-tool-configuration-options). Keep in mind that not all the information in that article applies to Office LTSC 2021. For example, the settings related to shared computer activation, such as SharedComputerLicensing and SCLCacheOverride, don’t apply to Office LTSC 2021.


## Sample configuration.xml file to use with the Office Deployment Tool
The following sample configuration.xml file can be used to either download or install the 64-bit version of Office LTSC Professional Plus 2021 in English using a shared folder on your local network and activate by using MAK. If you’re using this configuration.xml to install Office LTSC 2021, previous Windows Installer (MSI) versions of Office are removed as part of the installation process. Even though it’s not specified in the configuration.xml file, updates are automatically enabled and are configured to come directly from the Office CDN, because those settings are the default.

```xml
<Configuration>
  <Add SourcePath="\\Server\Share" OfficeClientEdition="64" Channel="PerpetualVL2021">
      <Product ID="ProPlus2021Volume"  PIDKEY="#####-#####-#####-#####-#####" >
         <Language ID="en-us" />
      </Product>
      <Product ID="ProofingTools">
        <Language ID="de-de" />
        <Language ID="es-es" />
      </Product>
  </Add>
  <RemoveMSI />
  <Display Level="None" AcceptEULA="TRUE" />  
</Configuration>
```

For the PIDKEY, replace #####-#####-#####-#####-##### with your MAK client activation key. 


## Remove existing versions of Office before installing Office LTSC 2021
We recommend that you uninstall any previous versions of Office before installing Office LTSC 2021. To help you uninstall versions of Office that use Windows Installer (MSI) as the installation technology, you can use the ODT and specify the RemoveMSI element in your configuration.xml file.

There are several ways that you can use the RemoveMSI element when installing Office LTSC 2021.
- Uninstall all Office products on the device.
- Identify any existing language resources, like language packs, and install the same languages.
- Keep some Office products and uninstall all other Office products on the device.

RemoveMSI can be used to uninstall 2007, 2010, 2013, or 2016 versions of Office, Visio, or Project that were installed using Windows Installer (MSI).

For more information about using RemoveMSI, see [Remove existing MSI versions of Office when upgrading to Microsoft 365 Apps](/microsoft-365-apps/deploy/upgrade-from-msi-version). Even though that article is about Microsoft 365 Apps, most of the information also applies to Office LTSC 2021.

To uninstall 2019 versions of Office, Visio, or Project from the device, use the [Remove element](/microsoft-365-apps/deploy/office-deployment-tool-configuration-options#remove-element). You use the Remove element because 2019 versions of Office, Visio, and Project are installed by using Click-to-Run, not Windows Installer (MSI).


## Download the Office LTSC 2021 installation files
Once you have a copy of the ODT and have created your configuration.xml file, you can download the Office LTSC 2021 installation files to your local network. To do that, open an elevated command prompt, go to the folder where you saved the ODT and the configuration.xml file, and type this command:

```console
setup /download configuration.xml
```

If you've saved the configuration.xml file with a different name, use that name in the command.

It looks as if nothing is happening, but the download is happening in the background. Once the download is complete, you're returned to a command prompt.

If you want to check that the files are downloading, go to the location you specified for your SourcePath in the configuration.xml file. You should see a folder named “Office” with a subfolder named “Data.”  Under Data, there's also a subfolder named with the version number of the download. For example, 16.0.14332.20481. Which files you see and the names of the files depend on whether you're downloading the 32-bit or 64-bit version of Office and which languages you're downloading.

Here are some other details about downloading Office LTSC 2021 installation files:
- You must download the 32-bit and 64-bit versions separately.
- All volume licensed Office products are included in the same download, regardless of which products you specify in the configuration.xml file. For example, if you download Office LTSC Professional Plus 2021, the download also includes Visio LTSC Professional 2021 and Project Professional 2021. Including all products in the download is designed to help you save disk space on your local network. The core files for these products are in the stream.x86.x-none.dat or stream.x64.x-none.dat file, depending if it’s the 32-bit or 64-bit version of Office.

## Install Office LTSC 2021 by using the Office Deployment Tool
Once you have a copy of the ODT and have created your configuration.xml file (and downloaded the Office LTSC 2021 installation files to your local network, if necessary), you can install Office LTSC 2021. To do that, open an elevated command prompt, go to the folder where you saved the ODT and the configuration.xml file, and type the following command:

```console
setup /configure configuration.xml
```
If you've saved the configuration.xml file with a different name, use that name in the command.

Once the installation is complete, you're returned to a command prompt, and you can go open the Office LTSC 2021 programs you’ve installed.

> [!NOTE]
> Office LTSC 2021 is installed on the system drive, which is usually the C:\ drive. The installation location can't be changed.


## Install Office LTSC 2021 by using Configuration Manager

You can also use Microsoft Configuration Manager (current branch) to deploy Office LTSC 2021. The Office 365 Client Installation wizard steps you through the process and builds the configuration.xml file for you. There's an entry for Office LTSC Professional Plus 2021 in the wizard. On that same page, you can also select to deploy Project and Visio. To get to the wizard, in the Configuration Manager console, navigate to **Software Library** > **Overview** > **Office 365 Client Management**.

## Deploy languages for Office LTSC 2021

You can use the ODT and the configuration.xml file to deploy Office LTSC 2021, including Project and Visio, in multiple languages. For more information, see [Language element](/microsoft-365-apps/deploy/office-deployment-tool-configuration-options#language-element).

You can also just install proofing tools by specifying the Product ID as "ProofingTools" in your configuration.xml file along with the appropriate Language IDs. Proofing tools packages are smaller than full language packs. Consider deploying proofing tools in cases where users work with documents in multiple languages but don’t need the Office product UI in all those languages. The proofing tools can be installed at the same time you’re installing Office LTSC 2021, or you can install them later. They can also be installed whether or not the language pack for a given language is installed.

If you're upgrading from a Windows Installer (MSI) version of Office, you can get Click-to-Run versions of the same language resources – for example, language packs, language interface packs, or proofing tools – installed when you deploy Office LTSC 2021. For more information, see [Remove existing MSI versions of Office when upgrading to Microsoft 365 Apps](/microsoft-365-apps/deploy/upgrade-from-msi-version). Even though that article is about Microsoft 365 Apps, most of the information also applies to Office LTSC 2021.

## Microsoft Teams in Office LTSC 2021

Office LTSC 2021 no longer includes the Teams client app. However, if the Teams client app was previously installed with Office LTSC 2021, it will continue to be automatically updated approximately every two weeks with new features and quality updates. The update process for Teams is different from the update process for other Office apps, such as Word and Excel. For more information, see [Teams update process](/microsoftteams/teams-client-update).

## Skype for Business in Office LTSC 2021

Skype for Business isn't included, by default, in the installation of Office LTSC 2021 when you use either of the following methods to deploy Office LTSC 2021:

- The Office Deployment Tool with a configuration.xml file created by using the [Office Customization Tool](https://config.office.com/deploymentsettings) and you don’t change the default settings under the **Apps** section.
- The Office 365 Client Installation wizard in Configuration Manager (current branch) and you don’t change the default settings under the **Apps** section.

For either method, you can adjust the settings in the UI so that Skype for Business is installed with Office LTSC 2021.

## Related articles

- [Overview of Office LTSC 2021](overview.md)
- [Update Office LTSC 2021](update.md)
- [Overview of volume activation of Office](../../volume-license-activation/plan-volume-activation-of-office.md)
