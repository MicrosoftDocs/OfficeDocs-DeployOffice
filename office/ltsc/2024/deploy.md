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

To configure and perform deployments of Office LTSC 2024, including Project and Visio, for users in your organization, you use the Office Deployment Tool (ODT).

## Download the Office Deployment Tool from the Microsoft Download Center

<!--Using include for odt-->
[!INCLUDE[odt-download.md](../../includes/odt-download.md)]

For an Office LTSC 2024-specific sample, see [Sample configuration.xml file to use with the Office Deployment Tool](#sample-configurationxml-file-to-use-with-the-office-deployment-tool).

## Create the configuration.xml file

Once you have a copy of the ODT, the next step is to create a configuration.xml file. You can create multiple configuration.xml files to be used with the ODT. For example, you can create a configuration.xml file to download and install the 64-bit version of Office LTSC Professional Plus 2024 in English. Then, you can create a different configuration.xml file to install the 32-bit version of Visio LTSC Professional 2024 in French. When you run the ODT from an elevated command prompt, you specify which configuration.xml file to use.

<!--Using include for use-oct-->
[!INCLUDE[use-oct.md](../../includes/use-oct.md)]

> [!div class="mx-tdBreakAll"]
> | Configuration  | configuration.xml setting  | Additional information  |
> | :------------- | :------------------------ | :---------------------- |
> | Where to download the Office installation files to and where to install Office from <br/><br/>For example, \\\server\share (a shared folder on your local network). | SourcePath  | If you don’t specify a SourcePath when installing Office, the ODT looks for the installation files in the folder it’s located in. If it doesn’t find the Office installation files there, it goes to the Office CDN to get the installation files. <br/><br/> We recommend that you install Office directly from the Office CDN, if internet connectivity and network bandwidth make that possible. |
> | Which products to download or install <br/><br/>For example, Office LTSC Professional Plus 2024. | Product ID  | Valid values include the following IDs: <br/> - ProPlus2024Volume <br/> - Standard2024Volume <br/> - ProjectPro2024Volume <br/> - ProjectStd2024Volume <br/> - VisioPro2024Volume <br/> - VisioStd2024Volume <br/><br/> For a list of Product IDs for other volume licensed Office products, such as Access LTSC 2024, see [List of Product IDs which are supported by the Office Deployment Tool for Click-to-Run](/microsoft-365/troubleshoot/installation/product-ids-supported-office-deployment-click-to-run).<br/><br/> If you have a Microsoft Services Provider License Agreement (SPLA), [review this information](spla.md). |
> | Use Key Management Service (KMS) to activate Office LTSC 2024 | PIDKEY | Enter the [Generic Volume License Key (GVLK)](../../volume-license-activation/gvlks.md) for KMS activation. |
> | Use Multiple Activation (MAK) to activate Office LTSC 2024 | PIDKEY | Enter the product key for MAK activation. |
> | Which languages to download or install <br/><br/> For example, English (en-us) and French (fr-fr). | Language ID | You can install multiple languages at the same time you’re installing Office LTSC 2024, or you can install them later. <br/><br/> For more information, see [Deploy languages for Office LTSC 2024](#deploy-languages-for-office-ltsc-2024). |
> | Which proofing tools to install | Product ID | The Product ID is "ProofingTools" and is used in combination with the Language ID. <br/><br/> For more information, see [Deploy languages for Office LTSC 2024](#deploy-languages-for-office-ltsc-2024). |
> | Which edition of Office LTSC 2024 to download or install. <br/><br/> For example, the 64-bit version. | OfficeClientEdition | Valid xml values are "32" and "64." <br/><br/> All Office products on the device must be of the same architecture. You can’t have both 32-bit and 64-bit Office products installed on the same device. <br/><br/> We recommend 64-bit on devices that have 4 GB or more of memory. But you should assess application compatibility and other factors that might require you to use the 32-bit version. <br/><br/> For more information, see [Choose between the 64-bit or 32-bit version of Office](https://support.microsoft.com/office/2dee7807-8f95-4d0c-b5fe-6c6f49b8d261). |
> | Which apps to install <br/><br/> For example, all apps except Publisher. | ExcludeApp | By default, all apps included in Office LTSC Professional Plus 2024 are installed. <br/><br/> For example, to not install Publisher, you can include the following line in your configuration.xml: <br/><br/> \<ExcludeApp ID="Publisher" /> <br/><br/> For more information, see [ExcludeApp element](/microsoft-365-apps/deploy/office-deployment-tool-configuration-options#excludeapp-element). |
> | Where to get security and quality updates from. <br/><br/> For example, directly from the Office CDN on the internet. | UpdatePath | The default is to get updates directly from the Office CDN on the internet, which is recommended and requires the least amount of administrative effort. <br/><br/> But if you need to update devices that don’t have internet connectivity, you can specify that Office gets updates, for example, from a shared folder on your local network. But this option means that you must download the updates from the Office CDN each month and copy them to the shared folder. <br/><br/> For more information, see [Update Office LTSC 2024](update.md). |
> | Which update channel to install from and get updates from | Channel | Office uses the concept of update channels to determine which updates an installed version of Office receives. <br/><br/> For more information, see [Update channel for Office LTSC 2024](update.md#update-channel-for-office-ltsc-2024). |
> | Whether to remove previous Windows Installer (MSI) versions of Office before installing Office LTSC 2024 | RemoveMSI | Recommended. For more information, see [Remove existing versions of Office before installing Office LTSC 2024](#remove-existing-versions-of-office-before-installing-office-ltsc-2024). |

## Sample configuration.xml file to use with the Office Deployment Tool

The following sample configuration.xml file can be used to either download or install the 64-bit version of Office LTSC Professional Plus 2024 in English using a shared folder on your local network and activate by using MAK. If you’re using this configuration.xml to install Office LTSC 2024, previous Windows Installer (MSI) versions of Office are removed as part of the installation process. Even though it’s not specified in the configuration.xml file, updates are automatically enabled and are configured to come directly from the Office CDN, because those settings are the default.

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
<!-- Add instructions for removing existing versions of Office -->

## Download the Office LTSC 2024 installation files
<!-- Add details for downloading Office LTSC 2024 installation files -->

## Install Office LTSC 2024 by using the Office Deployment Tool
<!-- Add instructions for installing Office LTSC 2024 using the ODT -->

## Install Office LTSC 2024 by using Configuration Manager
<!-- Add instructions for installing Office LTSC 2024 using Configuration Manager -->

## Deploy languages for Office LTSC 2024
<!-- Add details for deploying languages -->

## Microsoft Teams in Office LTSC 2024
<!-- Add details about Microsoft Teams in Office LTSC 2024 -->

## Skype for Business in Office LTSC 2024
<!-- Add details about Skype for Business in Office LTSC 2024 -->

## Related articles
<!-- List related articles -->
- [Overview of Office LTSC 2024](overview.md)
- [Update Office LTSC 2024](update.md)
- [Overview of volume activation of Office](../../volume-license-activation/plan-volume-activation-of-office.md)
