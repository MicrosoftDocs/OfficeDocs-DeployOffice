---
title: "Deploy Office LTSC 2021"
ms.author: danbrown
author: DHB-MSFT
manager: dougeby
audience: ITPro
ms.topic: overview
ms.service: office-perpetual-itpro
ms.localizationpriority: medium
ms.collection: tier2
recommendations: false
description: "Provides IT admins with information on how to deploy Office LTSC 2021."
ms.date: 09/14/2021
---

# Deploy Office LTSC 2021

To configure and perform deployments of Office LTSC 2021, including Project and Visio, for users in your organization, you use the Office Deployment Tool (ODT). The Office Customization Tool (OCT) that you previously used for Windows Installer (MSI) is no longer used.

The installation files for Office LTSC 2021 are available on the Office Content Delivery Network (CDN) on the internet instead of on the Volume Licensing Service Center (VLSC). You can install Office LTSC 2021 directly from the Office CDN. Or, you can download the installation files from the Office CDN to a location on your local network, such as a shared folder, and install Office LTSC 2021 from that location. You can use different methods for different sets of devices in your organization. Whichever method you choose, you use the ODT.

Installing directly from the Office CDN requires the least amount of administrative effort and is recommended. But you might have constraints that prevent you from installing directly from the internet. For example, some devices might not have connectivity to the internet or you may have limited bandwidth to the internet.

The following steps are the basic steps for deploying Office LTSC 2021:

1. [Download the Office Deployment Tool from the Microsoft Download Center](#download-the-office-deployment-tool-from-the-microsoft-download-center)
2. [Create the configuration.xml file](#create-the-configurationxml-file)
3. [Download the Office LTSC 2021 installation files](#download-the-office-ltsc-2021-installation-files) *(optional, if not installing directly from the Office CDN)*
4. [Install Office LTSC 2021 by using the Office Deployment Tool](#install-office-ltsc-2021-by-using-the-office-deployment-tool)

Alternatively, you can [use Configuration Manager to deploy Office LTSC 2021](#install-office-ltsc-2021-by-using-configuration-manager) if that's available in your organization.

Whichever way you choose to deploy Office LTSC 2021, we recommend that you [remove existing versions of Office before installing Office LTSC 2021](#remove-existing-versions-of-office-before-installing-office-ltsc-2021).

## Download the Office Deployment Tool from the Microsoft Download Center

The [Office Deployment Tool](https://www.microsoft.com/download/details.aspx?id=49117) is a free download from the Microsoft Download Center. We recommend that you always download and use the most current version of the ODT.

After you download the Office Deployment Tool, double-click on the officedeploymenttool executable (.exe) file to extract the ODT files. When you're finished, you should have several files: setup.exe and some sample configuration.xml files. For an Office LTSC 2021-specific sample, see [Sample configuration.xml file to use with the Office Deployment Tool](#sample-configurationxml-file-to-use-with-the-office-deployment-tool).

The setup.exe file is the ODT and is a command-line tool that supports downloading and installing Office LTSC 2021. The configuration.xml files are sample files to get you started. You use the configuration.xml file to provide settings for the ODT to use when downloading or installing Office LTSC 2021. The configuration.xml is a simple xml file that can be created and edited in any text editor, such as Notepad. You can name the file anything that you want, as long as it retains the xml file extension.

## Create the configuration.xml file

Once you have a copy of the ODT, you need to create a configuration.xml file. You can create multiple configuration.xml files to be used with the ODT. For example, you would create a configuration.xml file to download and install the 64-bit version of Office LTSC Professional Plus 2021 in English and a different configuration.xml file to install the 32-bit version of Visio LTSC Professional 2021 in French. When you run the ODT from an elevated command prompt, you specify which configuration.xml file to use.

> [!TIP]
> Instead of using a text editor to create your configuration.xml file, we recommend that you use the [Office Customization Tool (OCT)](https://config.office.com). The OCT provides a web-based interface for making your selections and creating your configuration.xml file to be used with the Office Deployment Tool. For more information, see [Overview of the Office Customization Tool](../admincenter/overview-office-customization-tool.md). Please note that this is different than the Office Customization Tool that you might have used in the past to install volume licensed versions of Office that used Windows Installer (MSI) as the installation technology.

There are a series of settings in the configuration.xml file that you configure to customize the Office LTSC 2021 download or installation. The following table lists the most common settings to configure in the configuration.xml file.


|Configuration  |configuration.xml setting  |Additional information  |
|---------|---------|---------|
|Where to download the Office installation files to and where to install Office from <br/> <br/>For example, \\\server\share (a shared folder on your local network).| SourcePath  |If you don’t specify a SourcePath when using the ODT to install Office, the ODT looks for the installation files in the folder it’s located in. If it doesn’t find the Office installation files there, it goes to the Office CDN to get the installation files. <br/> <br/>  We recommend that you install Office directly from the Office CDN, if internet connectivity and network bandwidth make that possible.      |
|Which products to download or install <br/> <br/>For example, Office LTSC Professional Plus 2021. | Product ID  | Valid values include the following:  <br/>- ProPlus2021Volume <br/> -	Standard2021Volume <br/>- ProjectPro2021Volume <br/> - ProjectStd2021Volume <br/> - VisioPro2021Volume <br/> - VisioStd2021Volume  <br/><br/> For a list of Product IDs for other volume licensed Office products, such as Access LTSC 2021, see [Product IDs that are supported by the Office Deployment Tool for Click-to-Run](/office365/troubleshoot/installation/product-ids-supported-office-deployment-click-to-run).<br/><br/> If you have a Microsoft Services Provider License Agreement (SPLA), [review this information](spla.md).|
|Use Key Management Service (KMS) to activate Office LTSC 2021|PIDKEY| Enter the [Generic Volume License Key (GVLK)](../vlactivation/gvlks.md) for KMS activation.|
|Use Multiple Activation (MAK) to activate Office LTSC 2021     | PIDKEY  | Enter the product key for MAK activation.  |
|Which languages to download or install <br/> <br/> For example, English (en-us) and French (fr-fr). |Language ID      | You can install multiple languages at the same time you’re Installing Office LTSC 2021, or you can install them later.   <br/> <br/> For more information, see [Deploy languages for Office LTSC 2021](#deploy-languages-for-office-ltsc-2021).   |
|Which proofing tools to install  |Product ID  | The Product ID is "ProofingTools" and is used in combination with the Language ID. <br/> <br/> For more information, see [Deploy languages for Office LTSC 2021](#deploy-languages-for-office-ltsc-2021). |
|Which edition of Office LTSC 2021 to download or install. <br/> <br/>  For example, the 64-bit version.    | OfficeClientEdition  | Valid xml values are "32" and "64." <br/> <br/>All Office products on the device must be of the same architecture. You can’t have both 32-bit and 64-bit Office products installed on the same device. <br/><br/>  We recommend 64-bit on devices that have 4 GB or more of memory. But you should assess application compatibility and other factors that might require you to use the 32-bit version. <br/> <br/> For more information, see [Choose between the 64-bit or 32-bit version of Office](https://support.microsoft.com/office/2dee7807-8f95-4d0c-b5fe-6c6f49b8d261).   |
| Which apps to install <br/> <br/> For example, all apps except Publisher.  | ExcludeApp       | By default, all apps included in Office LTSC Professional Plus 2021 are installed. <br/> <br/> For example, to not install Publisher, you can include the following line in your configuration.xml:  <br/> <br/> \<ExcludeApp ID="Publisher" />  <br/> <br/> For more information, see [ExcludeApp element](../office-deployment-tool-configuration-options.md#excludeapp-element).    |
| Where to get security and quality updates from. <br/> <br/> For example, directly from the Office CDN on the internet. | UpdatePath |  The default is to get updates directly from the Office CDN on the internet. This is recommended and requires the least amount of administrative effort.  <br/> <br/> But if you need to update devices that don’t have connectivity to the internet, you can specify that Office gets updates, for example, from a shared folder on your local network. But this means that you must download the updates from the Office CDN and copy them to the shared folder.  <br/> <br/> For more information, see [Update Office LTSC 2021](update.md).  |
|Which update channel to install from and get updates from  |Channel  | Office uses the concept of update channels to determine which updates an installed version of Office receives.   <br/> <br/>  For more information, see [Update channel for Office LTSC 2021](update.md#update-channel-for-office-ltsc-2021).  |
|Whether to remove previous Windows Installer (MSI) versions of Office before installing Office LTSC 2021  |RemoveMSI   | This is recommended.   <br/> <br/>  For more information, see [Remove existing versions of Office before installing Office LTSC 2021](#remove-existing-versions-of-office-before-installing-office-ltsc-2021).    |


> [!TIP]
> More information about these configuration.xml settings is available here: [Configuration options for the Office Deployment Tool](../office-deployment-tool-configuration-options.md). Keep in mind that not all the information in that article applies to Office LTSC 2021. For example, the settings related to shared computer activation, such as SharedComputerLicensing and SCLCacheOverride, don’t apply to Office LTSC 2021.


## Sample configuration.xml file to use with the Office Deployment Tool
The following is a sample configuration.xml file that can be used to either download or install the 64-bit version of Office LTSC Professional Plus 2021 in English using a shared folder on your local network and activate by using MAK. If you’re using this configuration.xml to install Office LTSC 2021, previous Windows Installer (MSI) versions of Office are removed as part of the installation process. Also, even though it’s not specified in the configuration.xml file, updates are automatically enabled and are configured to come directly from the Office CDN, because those are the default settings.

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
We recommend that you uninstall any previous versions of Office before installing Office LTSC 2021. To help you uninstall versions of Office that use Windows Installer (MSI) as the installation technology, you can use the Office Deployment Tool and specify the RemoveMSI element in your configuration.xml file.

There are several ways that you can use the RemoveMSI element when installing Office LTSC 2021.
- Uninstall all Office products on the device.
- Identify any existing language resources, like language packs, and install the same languages.
- Keep some Office products and uninstall all other Office products on the device.

RemoveMSI can be used to uninstall 2007, 2010, 2013, or 2016 versions of Office, Visio, or Project that were installed using Windows Installer (MSI).

For more information about using RemoveMSI, see [Remove existing MSI versions of Office when upgrading to Microsoft 365 Apps](../upgrade-from-msi-version.md). Even though this article is about Microsoft 365 Apps, most of the information also applies to Office LTSC 2021.

To uninstall 2019 versions of Office, Visio, or Project from the device, use the [Remove element](../office-deployment-tool-configuration-options.md#remove-element). You use the Remove element because 2019 versions of Office, Visio, and Project are installed by using Click-to-Run, not Windows Installer (MSI).


## Download the Office LTSC 2021 installation files
Once you have a copy of the ODT and have created your configuration.xml file, you can download the Office LTSC 2021 installation files to your local network. To do that, open an elevated command prompt, go to the folder where you saved the ODT and the configuration.xml file, and type this command:

```console
setup /download configuration.xml
```

If you've saved the configuration.xml file with a different name, use that name in the command.

It will look as if nothing is happening, but the download is happening in the background. Once the download is complete, you're returned to a command prompt.

If you want to check that the files are downloading, go to the location you specified for your SourcePath in the configuration.xml file. You should see a folder named “Office” with a subfolder named “Data.”  There will also be a folder named with the version number of the download. For example, 16.0.14332.20099. Which files you see and the names of the files depend on whether you're downloading the 32-bit or 64-bit version of Office and which languages you're downloading.

Here are some additional details about downloading Office LTSC 2021 installation files:
- You must download the 32-bit and 64-bit versions separately.
- All volume licensed Office products – such as Office LTSC Professional Plus 2021, Visio LTSC Professional 2021, and Project Professional 2021 – are included in the same download, regardless of which products you specify in the configuration.xml file. This helps you save disk space on your local network. The core files for these products are in the stream.x86.x-none.dat or stream.x64.x-none.dat file, depending if it’s the 32-bit or 64-bit version of Office.

## Install Office LTSC 2021 by using the Office Deployment Tool
Once you have a copy of the ODT and have created your configuration.xml file (and downloaded the Office LTSC 2021 installation files to your local network, if necessary), you can install Office LTSC 2021. To do that, open an elevated command prompt, go to the folder where you saved the ODT and the configuration.xml file, and type the following command:

```console
setup /configure configuration.xml
```
If you've saved the configuration.xml file with a different name, use that name in the command.

Once the installation is complete, you're returned to a command prompt and you can go open the Office LTSC 2021 programs you’ve installed.

> [!NOTE]
> Office LTSC 2021 is installed on the system drive, which is usually the C:\ drive. The installation location can't be changed.


## Install Office LTSC 2021 by using Configuration Manager

You can also use Microsoft Configuration Manager (current branch) to deploy Office LTSC 2021. The Office 365 Client Installation wizard steps you through the process and builds the configuration.xml file for you. You’ll see an entry for Office LTSC Professional Plus 2021 in the wizard. On that same page, you can also select to deploy Project and Visio. To get to the wizard, in the Configuration Manager console, navigate to **Software Library** > **Overview** > **Office 365 Client Management**.

## Deploy languages for Office LTSC 2021

You can use the ODT and the configuration.xml file to deploy Office LTSC 2021, including Project and Visio, in multiple languages. For more information, see [Language element](../office-deployment-tool-configuration-options.md#language-element).

You can also just install proofing tools by specifying the Product ID as "ProofingTools" in your configuration.xml file along with the appropriate Language IDs. Proofing tools packages are much smaller than full language packs. Consider deploying proofing tools in cases where users work with documents in multiple languages but don’t need the Office product UI in all those languages. The proofing tools can be installed at the same time you’re installing Office LTSC 2021, or you can install them later. They can also be installed whether or not the language pack for a given language is installed.

If you're upgrading from a Windows Installer (MSI) version of Office, you can get Click-to-Run versions of the same language resources – for example, language packs, language interface packs, or proofing tools – installed when you deploy Office LTSC 2021. For more information, see [Remove existing MSI versions of Office when upgrading to Microsoft 365 Apps](../upgrade-from-msi-version.md). Even though this article is about Microsoft 365 Apps, most of the information also applies to Office LTSC 2021.

## Microsoft Teams in Office LTSC 2021

Office LTSC 2021 includes the Teams client app. To complete the installation of the Teams client app after installing Office LTSC 2021, either restart the device or sign out and then sign in again.

After Teams is installed, it's automatically updated approximately every two weeks with new features and quality updates. This update process for Teams is different than the update process for the other Office apps, such as Word and Excel. For more information, see [Teams update process](/microsoftteams/teams-client-update).

If you don’t want the Teams client app included when you deploy Office LTSC 2021, you can use either of these methods:
- The [ExcludeApp element](../office-deployment-tool-configuration-options.md#excludeapp-element) in your configuration xml file.
- The “Don't install Microsoft Teams with new installations or updates of Office” policy setting if you’re using Group Policy. You can find this policy setting under Computer Configuration\Policies\Administrative Templates\Microsoft Office 2016 (Machine)\Updates in the Group Policy Management tool.

## Skype for Business in Office LTSC 2021

Skype for Business won’t be included, by default, in the installation of Office LTSC 2021 when you use either of the following methods to deploy Office LTSC 2021:

- The Office Deployment Tool with a configuration.xml file created by using the [Office Customization Tool](https://config.office.com/deploymentsettings) and you don’t change the default settings under the **Apps** section.
- The Office 365 Client Installation wizard in Microsoft Configuration Manager (current branch) and you don’t change the default settings under the **Apps** section.

For either method, you can adjust the settings in the UI so that Skype for Business is installed with Office LTSC 2021.

## Related articles

- [Overview of Office LTSC 2021](overview.md)
- [Update Office LTSC 2021](update.md)
- [Overview of volume activation of Office](../vlactivation/plan-volume-activation-of-office.md)