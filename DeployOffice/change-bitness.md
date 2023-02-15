---
title: "Change a Microsoft 365 Apps installation from 32-bit to 64-bit"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: article
ms.service: o365-proplus-itpro
ms.collection: tier2
ms.localizationpriority: medium
recommendations: false
description: "Provides Office admins with information on how to use the MigrateArch attribute to change the bitness of an existing installation of Microsoft 365 Apps, such as from 32-bit to 64-bit."
ms.date: 04/15/2019
---

# Change a Microsoft 365 Apps installation from 32-bit to 64-bit

Up to now, if you had the 32-bit version of Microsoft 365 Apps installed on a device and you wanted to change to the 64-bit version, you needed to uninstall the existing 32-bit version and then install the 64-bit version. It also required that you account for all the other deployment settings configured for that device, such as the update path and the installed languages, so that those settings would be included when you did the 64-bit installation.

But now, to make it easier to change from a 32-bit to a 64-bit installation of Microsoft 365 Apps, the Office Deployment Tool and its configuration.xml file supports an optional attribute named MigrateArch. If the MigrateArch attribute is set to True, then your installation of Microsoft 365 Apps will be changed to the architecture (sometimes referred to as the bitness) that is specified in the OfficeClientEdition attribute.

With MigrateArch, you don't have to account for all the installed products and languages or other deployment settings. The migration process will preserve those during the migration process. But, if you want to make any changes to the installed products and languages, or other deployment settings, you can do that as part of the migration process by explicitly specifying those settings in your configuration.xml file. For more information, see [Sample configuration.xml file to use with the Office Deployment Tool](#sample-configurationxml-file-to-use-with-the-office-deployment-tool).

> [!NOTE]
> The 32-bit version will be uninstalled and then the 64-bit version will be installed.

## Requirements for using the MigrateArch attribute

To use the MigrateArch attribute, you need the following:

- At least Version 1902 of Microsoft 365 Apps installed on the device that you want to change the bitness of.
- At least version 16.0.11615.33602 of the Office Deployment Tool from the [Microsoft Download Center](https://www.microsoft.com/download/details.aspx?id=49117).
- A location that contains all the product and language files for the architecture that you are changing the installation to.

Before starting the migration process to a different bitness, you must have Version 1902 or later installed on the device that you want to change the bitness of. Migration is allowed to the same version, or to any later version, but you must have at least Version 1902 installed on the device before beginning the migration process.

Version 1902, or later, is available in Current Channel, Monthly Enterprise Channel, Semi-Annual Enterprise Channel (Preview), and Semi-Annual Enterprise Channel.

## Providing a source location to be used with the MigrateArch attribute

When using the MigrateArch attribute, you need a location that contains the installation source files of the bitness that you're moving to.

For this location, if network bandwidth or internet connectivity is not an issue, we recommend that you use the Office Content Delivery Network (CDN), because the CDN will always have the most up-to-date program and language installation files that you need.

If you are using a location that's on your local network, be sure to use the Office Deployment Tool to download all the necessary product and language files ahead of time. You can download the 32-bit and 64-bit installation files to the same share for a given update channel. For example, you can download the 32-bit and 64-bit installation files for Semi-Annual Enterprise Channel to \\\\server01\\sec. But, you need to download the installation files for Current Channel to a different location, such as \\\\server01\\current.

If your local network location doesn't contain files of the correct bitness, the migration fails and the bitness of the installation will remain as-is. If this location doesn't contain all the necessary language source files – for example, the French language files are missing – the migration will fail. To avoid this situation, we strongly recommend that you include [AllowCdnFallback="True"](office-deployment-tool-configuration-options.md#allowcdnfallback-attribute-part-of-add-element) in your configuration.xml file. This will use the Office Content Delivery Network (CDN) on the internet as a backup source from which to install the language files.

## Sample configuration.xml file to use with the Office Deployment Tool

The following is a sample configuration.xml that will change an existing 32-bit installation of Microsoft 365 Apps to a 64-bit installation. All existing products, languages, and other deployment settings, such as update path, will be preserved.

```xml
<Configuration>
  <Add OfficeClientEdition="64" MigrateArch="TRUE">
  </Add>
</Configuration>
```

Then, run the Office Deployment Tool in /configure mode and specify this configuration.xml file to make the change from 32-bit to 64-bit. The 32-bit version will be uninstalled and then the 64-bit version will be installed.

If you want to change the products or languages installed, or want to change other deployment settings, you need to specify those in your configuration.xml file. For example, if you want to change a 64-bit installation of Microsoft 365 Apps for enterprise in English to a 32-bit installation that includes English and German, changes the update path, and adds Visio in English, you would use a configuration.xml file that looks similar to the following example.

```xml
<Configuration>
  <Add OfficeClientEdition="32" MigrateArch="TRUE">
    <Product ID="O365ProPlusRetail">
     <Language ID="en-us"/>
     <Language ID="de-de"/>
    </Product>
    <Product ID="VisioProRetail">
     <Language ID="en-us"/>
    </Product>
  </Add>
<Updates UpdatePath="\\server02\updates" Enabled="TRUE"/>
</Configuration>
```

## Additional information about using MigrateArch attribute

- Before changing to a different architecture, especially when changing to 64-bit, make sure that your existing add-ins, macros, and complex Office files work on the new architecture. For more information, see [Use the Readiness Toolkit to assess application compatibility for Microsoft 365 Apps](readiness-toolkit-application-compatibility-microsoft-365-apps.md).

- The MigrateArch attribute can also be used to change the architecture of the subscription versions of the Project and Visio desktop apps.

- The MigrateArch attribute won't migrate the bitness of Office programs on the device that were installed by using Windows Installer (MSI). Those programs can be removed by the using the [RemoveMSI](upgrade-from-msi-version.md) element in your configuration.xml file.

- The MigrateArch attribute can only migrate Office products installed by using Click-to-Run and have a version number that starts with 16.0. For example, you can't use the MigrateArch attribute if Visio Professional 2013 was installed on the device by using Click-to-Run, because the 2013 version of Visio has a version number that starts with 15.0. You can find this version information by going to **Control Panel** > **Programs** > **Programs and Features**. If there are any Office products on the device that were installed by using Click-to-Run, and whose version number starts with 15.0, then the migration will fail.

- If the architecture that you specify to move to is already the architecture of the currently installed products, then no migration takes place when you run the Office Deployment Tool. Your existing installation will not be removed and reinstalled. But if your configuration.xml includes other changes, such as adding a language, then those changes will be implemented.

- If a user has an Office app, such as Word, open when the migration process begins, and the [Level](office-deployment-tool-configuration-options.md#level-attribute-part-of-display-element) attribute is set to Full for the [Display](office-deployment-tool-configuration-options.md#display-element) element in your configuration.xml file, then the user will be prompted to close the app. If they cancel the prompt, the migration is canceled. If the Level attribute is set to None, and Office apps are running on the device, then the migration will fail. You can use the [FORCEAPPSHUTDOWN](office-deployment-tool-configuration-options.md#forceappshutdown-property-part-of-property-element) property in your configuration.xml file, but that will close the user's apps without any warning.

## Related articles

- [Overview of the Office Deployment Tool](overview-office-deployment-tool.md)
- [Configuration options for the Office Deployment Tool](office-deployment-tool-configuration-options.md)
- [Choose between the 64-bit or 32-bit version of Office](https://support.microsoft.com/office/2dee7807-8f95-4d0c-b5fe-6c6f49b8d261)
