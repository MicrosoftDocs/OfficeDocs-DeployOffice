---
title: "Deploy Office LTSC 2024"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: conceptual
ms.service: office-perpetual-itpro
ms.localizationpriority: medium
ms.collection: Tier1
recommendations: false
description: "Provides IT admins with information on how to deploy Office LTSC 2024."
ms.date: 09/16/2024
---

# Deploy Office LTSC 2024

To configure and deploy Office LTSC 2024, including Project and Visio, within your organization, you'll use the Office Deployment Tool (ODT). The ODT provides flexibility and control, allowing you to customize and manage installations according to your specific needs.

## Download the Office Deployment Tool from the Microsoft Download Center

<!--Using include for odt-->
[!INCLUDE[odt-download.md](../../includes/odt-download.md)]

For an Office LTSC 2024-specific sample, see [Sample configuration.xml file to use with the Office Deployment Tool](#sample-configurationxml-file-to-use-with-the-office-deployment-tool).

## Create the configuration.xml file

Once you have a copy of the ODT, the next step is to create a configuration.xml file. You can create multiple configuration.xml files to be used with the ODT. For example, you can create a configuration.xml file to download and install the 64-bit version of Office LTSC Professional Plus 2024 in English. Then, you can create a different configuration.xml file to install the 32-bit version of Visio LTSC Professional 2024 in French. When you run the ODT from an elevated command prompt, you specify which configuration.xml file to use.

<!--Using include for use-oct-->
[!INCLUDE[use-oct.md](../../includes/use-oct.md)]

| Configuration  | configuration.xml setting  | Additional information  |
| :------------- | :------------------------ | :---------------------- |
| Where to download the Office installation files to and where to install Office from. For example, \\\server\share (a shared folder on your local network). | SourcePath  | If you don’t specify a SourcePath when installing Office, the ODT looks for the installation files in the folder it’s located in. If it doesn’t find the Office installation files there, it goes to the Office CDN to get the installation files. We recommend that you install Office directly from the Office CDN, if internet connectivity and network bandwidth make that possible. |
| Which products to download or install. For example, Office LTSC Professional Plus 2024. | Product ID  | Valid values include the following IDs: <br/> - ProPlus2024Volume <br/> - Standard2024Volume <br/> - ProjectPro2024Volume <br/> - ProjectStd2024Volume <br/> - VisioPro2024Volume <br/> - VisioStd2024Volume <br/><br/> For a list of Product IDs for other volume licensed Office products, such as Access LTSC 2024, see [List of Product IDs which are supported by the Office Deployment Tool for Click-to-Run](/microsoft-365/troubleshoot/installation/product-ids-supported-office-deployment-click-to-run).<br/><br/> If you have a Microsoft Services Provider License Agreement (SPLA), [review this information](spla.md). |
| Use Key Management Service (KMS) to activate Office LTSC 2024 | PIDKEY | Enter the [Generic Volume License Key (GVLK)](../../volume-license-activation/gvlks.md) for KMS activation. |
| Use Multiple Activation (MAK) to activate Office LTSC 2024 | PIDKEY | Enter the product key for MAK activation. |
| Which languages to download or install. For example, English (en-us) and French (fr-fr). | Language ID | You can install multiple languages at the same time you’re installing Office LTSC 2024, or you can install them later. For more information, see [Deploy languages for Office LTSC 2024](#deploy-languages-for-office-ltsc-2024). |
| Which proofing tools to install | Product ID | The Product ID is "ProofingTools" and is used in combination with the Language ID. For more information, see [Deploy languages for Office LTSC 2024](#deploy-languages-for-office-ltsc-2024). |
| Which edition of Office LTSC 2024 to download or install. For example, the 64-bit version. | OfficeClientEdition | Valid xml values are "32" and "64." All Office products on the device must be of the same architecture. You can’t have both 32-bit and 64-bit Office products installed on the same device. We recommend 64-bit on devices that have 4 GB or more of memory. But you should assess application compatibility and other factors that might require you to use the 32-bit version. For more information, see [Choose between the 64-bit or 32-bit version of Office](https://support.microsoft.com/office/2dee7807-8f95-4d0c-b5fe-6c6f49b8d261). |
| Which apps to install. For example, all apps except Publisher. | ExcludeApp | By default, all apps included in Office LTSC Professional Plus 2024 are installed. For example, to not install Publisher, you can include the following line in your configuration.xml: \<ExcludeApp ID="Publisher" /> For more information, see [ExcludeApp element](/microsoft-365-apps/deploy/office-deployment-tool-configuration-options#excludeapp-element). |
| Where to get security and quality updates from. For example, directly from the Office CDN on the internet. | UpdatePath | The default is to get updates directly from the Office CDN on the internet, which is recommended and requires the least amount of administrative effort. But if you need to update devices that don’t have internet connectivity, you can specify that Office gets updates, for example, from a shared folder on your local network. But this option means that you must download the updates from the Office CDN each month and copy them to the shared folder. For more information, see [Update Office LTSC 2024](update.md). |
| Which update channel to install from and get updates from | Channel | Office uses the concept of update channels to determine which updates an installed version of Office receives. For more information, see [Update channel for Office LTSC 2024](update.md#update-channel-for-office-ltsc-2024). |
| Whether to remove previous Windows Installer (MSI) versions of Office before installing Office LTSC 2024 | RemoveMSI | Recommended. For more information, see [Remove existing versions of Office before installing Office LTSC 2024](#remove-existing-versions-of-office-before-installing-office-ltsc-2024). |

For more information about these configuration.xml settings, see [Configuration options for the Office Deployment Tool](/microsoft-365-apps/deploy/office-deployment-tool-configuration-options). Keep in mind that not all the information in that article applies to Office LTSC 2024. For example, the settings related to shared computer activation, such as SharedComputerLicensing and SCLCacheOverride, don’t apply to Office LTSC 2024.

## Sample configuration.xml file to use with the Office Deployment Tool

The following sample configuration.xml file can be used to either download or install the 64-bit version of Office LTSC Professional Plus 2024 in English using a shared folder on your local network and activate by using MAK. If you’re using this configuration.xml to install Office LTSC 2024, previous Windows Installer (MSI) versions of Office are removed as part of the installation process. Even though it’s not specified in the configuration.xml file, updates are automatically enabled and are configured to come directly from the Office CDN, because those settings are the default.

> [!TIP]
> For the PIDKEY, replace #####-#####-#####-#####-##### with your MAK client activation key.

```xml
<Configuration>
  <Add OfficeClientEdition="64" Channel="PerpetualVL2024" SourcePath="\\Server\Share">
    <Product ID="ProPlus2024Volume" PIDKEY="#####-#####-#####-#####-#####">
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

## Remove existing versions of Office before installing Office LTSC 2024

Uninstall any previous versions of Office before installing Office LTSC 2024. To remove versions of Office that use Windows Installer (MSI) as the installation technology, use the Office Deployment Tool (ODT) and specify the `RemoveMSI` element in your configuration.xml file.

You can use the `RemoveMSI` element in several ways when installing Office LTSC 2024:
- Uninstall all Office products on the device.
- Identify and reinstall any existing language resources, such as language packs.
- Retain specific Office products while uninstalling all others on the device.

Use the `RemoveMSI` element to uninstall versions of Office, Visio, or Project from Office 2016 and earlier that were installed using Windows Installer (MSI)

For more information about using `RemoveMSI`, see [Remove existing MSI versions of Office when upgrading to Microsoft 365 Apps](/microsoft-365-apps/deploy/upgrade-from-msi-version). Although that article focuses on Microsoft 365 Apps, most of the information also applies to Office LTSC 2024.

To uninstall 2019 versions of Office, Visio, or Project from the device, use the [Remove element](/microsoft-365-apps/deploy/office-deployment-tool-configuration-options#remove-element). The `Remove` element is used because 2019 versions of Office, Visio, and Project are installed using Click-to-Run, not Windows Installer (MSI).


## Download the Office LTSC 2024 installation files
Once you have a copy of the ODT and created your configuration.xml file, you can download the Office LTSC 2024 installation files to your local network. To do this, open an elevated command prompt, navigate to the folder where you saved the ODT and the configuration.xml file, and enter the following command:

```console
setup /download configuration.xml
```

If you saved the configuration.xml file with a different name, use that name in the command.

It might look as though nothing is happening, but the download is occurring in the background. Once the download is complete, the command prompt will return.

To verify the files are downloading, check the location you specified for the SourcePath in your configuration.xml file. You should see a folder named "Office" with a subfolder named "Data." Inside the Data folder, there will be another subfolder named with the version number of the download. For example, 16.0.14332.20481. The files and their names will vary depending on whether you're downloading the 32-bit or 64-bit version of Office and which languages you're downloading.

Here are some additional details about downloading Office LTSC 2024 installation files:

- You must download the 32-bit and 64-bit versions separately.
- All volume-licensed Office products are included in the same download, regardless of which products you specify in the configuration.xml file. For example, if you download Office LTSC Professional Plus 2024, the download will also include Visio LTSC Professional 2024 and Project Professional 2024. This approach helps you save disk space on your local network. The core files for these products are located in the stream.x86.x-none.dat or stream.x64.x-none.dat file, depending on whether you’re downloading the 32-bit or 64-bit version of Office.

## Install Office LTSC 2024 by using the Office Deployment Tool

Once you have a copy of the ODT and have created your configuration.xml file (and downloaded the Office LTSC 2024 installation files to your local network, if necessary), you can install Office LTSC 2024. To do this, open an elevated command prompt, navigate to the folder where you saved the ODT and the configuration.xml file, and enter the following command:

```console
setup /configure configuration.xml
```
If you’ve saved the configuration.xml file with a different name, use that name in the command.

Once the installation is complete, the command prompt will return, and you can open the Office LTSC 2024 programs you’ve installed.

> [!NOTE]
> Office LTSC 2024 is installed on the system drive, typically the C:\ drive. The installation location can't be changed.

## Install Office LTSC 2024 by using Configuration Manager

You can also use Microsoft Configuration Manager (current branch) to deploy Office LTSC 2024. The Office 365 Client Installation wizard guides you through the process and builds the configuration.xml file for you. There’s an entry for Office LTSC Professional Plus 2024 in the wizard. On that same page, you can also choose to deploy Project and Visio. To access the wizard, navigate to **Software Library** > **Overview** > **Office 365 Client Management** in the Configuration Manager console.

## Deploy languages for Office LTSC 2024

You can use the ODT and the configuration.xml file to deploy Office LTSC 2024, including Project and Visio, in multiple languages. For more information, see [Language element](/microsoft-365-apps/deploy/office-deployment-tool-configuration-options#language-element).

You can also install proofing tools by specifying the Product ID as "ProofingTools" in your configuration.xml file along with the appropriate Language IDs. Proofing tools packages are smaller than full language packs, making them a good choice for users who work with documents in multiple languages but don’t need the Office product UI in all those languages. The proofing tools can be installed at the same time you’re installing Office LTSC 2024, or you can install them later. They can also be installed whether or not the language pack for a given language is installed.

If you're upgrading from a Windows Installer (MSI) version of Office, you can get Click-to-Run versions of the same language resources—such as language packs, language interface packs, or proofing tools—installed when you deploy Office LTSC 2024. For more information, see [Remove existing MSI versions of Office when upgrading to Microsoft 365 Apps](/microsoft-365-apps/deploy/upgrade-from-msi-version). Although that article focuses on Microsoft 365 Apps, most of the information also applies to Office LTSC 2024.

## Microsoft Teams in Office LTSC 2024
<!--Using include for teams-not-included-->
[!INCLUDE[teams-not-included.md](../../includes/teams-not-included.md)]

## Skype for Business in Office LTSC 2024

By default, Skype for Business is not installed when deploying Office LTSC 2024 unless you make the following changes:

- When you create the configuration.xml file with the [Office Customization Tool](https://config.office.com/deploymentsettings), under the Apps section, use the toggle to include Skype for Business.
  :::image type="content" source="media/admin-controlled-migration-policy/office-customization-tool-apps-deployment.png" alt-text="Configuration options in the Office Customization Tool showing toggles to include or exclude apps such as Skype for Business, Outlook, and Excel from being deployed.":::
  
- steps

These changes ensure that Skype for Business is included in the installation.


## Related articles
<!-- List related articles -->
- [Overview of Office LTSC 2024](overview.md)
- [Update Office LTSC 2024](update.md)
- [Overview of volume activation of Office](../../volume-license-activation/plan-volume-activation-of-office.md)
