---
title: "Change a Microsoft 365 Apps installation from 32-bit to 64-bit"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: conceptual
ms.service: o365-proplus-itpro
ms.collection: Tier2
ms.localizationpriority: medium
recommendations: false
description: "Provides Office admins with information on how to use the MigrateArch attribute to change the bitness of an existing installation of Microsoft 365 Apps, such as from 32-bit to 64-bit."
ms.date: 05/17/2024
---

# Change a Microsoft 365 Apps installation from 32-bit to 64-bit

Admins can streamline the transition from the 32-bit to 64-bit version of Microsoft 365 Apps using the Office Deployment Tool, its configuration.xml file, and the MigrateArch attribute. With the MigrateArch attribute set to True, your installation of Microsoft 365 Apps change to the architecture (sometimes referred to as the bitness) that is specified in the OfficeClientEdition attribute.

MigrateArch ensures a seamless migration, maintaining all previous deployment settings, including update paths and installed languages. However, should there be a need to modify any installed products, languages, or other deployment settings, these changes can be incorporated into the migration by specifying them in the configuration.xml file. For more information, see [Sample configuration.xml file to use with the Office Deployment Tool](#sample-configurationxml-file-to-use-with-the-office-deployment-tool).

> [!NOTE]
> The 32-bit version will be uninstalled and then the 64-bit version will be installed.

## Requirements for using the MigrateArch attribute

- Version 1902 or later of Microsoft 365 Apps installed on the device that you want to change the bitness of.
- The Office Deployment Tool (version 16.0.11615.33602 or later) from the [Microsoft Download Center](https://www.microsoft.com/download/details.aspx?id=49117).
- A location that contains all the product and language files for the architecture that you're changing the installation to.

Version 1902, or later, is available in Current Channel, Monthly Enterprise Channel, Semi-Annual Enterprise Channel (Preview), and Semi-Annual Enterprise Channel.

## Providing a source location to be used with the MigrateArch attribute

When using the MigrateArch attribute, you need a location that contains the installation source files of the bitness that you're moving to.

We recommend that you use the Office Content Delivery Network (CDN) for this location, if network bandwidth or internet connectivity isn't an issue. The CDN  always has the most up-to-date program and language installation files that you need.

If you're using a location that's on your local network, be sure to use the Office Deployment Tool to download all the necessary product and language files ahead of time. You can download the 32-bit and 64-bit installation files to the same share for a given update channel. For example, you can download the 32-bit and 64-bit installation files for Semi-Annual Enterprise Channel to \\\\server01\\sec. But, you need to download the installation files for Current Channel to a different location, such as \\\\server01\\current.

If your local network location doesn't contain files of the correct bitness, the migration fails and the bitness of the installation remains as-is. If this location doesn't contain all the necessary language source files – for example, the French language files are missing – the migration fails. To avoid this situation, we strongly recommend that you include [AllowCdnFallback="True"](office-deployment-tool-configuration-options.md#allowcdnfallback-attribute-part-of-add-element) in your configuration.xml file. This attribute uses the Office Content Delivery Network (CDN) on the internet as a backup source from which to install the language files.

## Sample configuration.xml file to use with the Office Deployment Tool

The following sample configuration.xml changes an existing 32-bit installation of Microsoft 365 Apps to a 64-bit installation. All existing products, languages, and other deployment settings, such as update path, is preserved.

```xml
<Configuration>
  <Add OfficeClientEdition="64" MigrateArch="TRUE">
  </Add>
</Configuration>
```

Then, run the Office Deployment Tool in /configure mode and specify this configuration.xml file to make the change from 32-bit to 64-bit. The 32-bit version is uninstalled and the 64-bit version is installed.

For instance, lets say that you need to modify a 64-bit installation of Microsoft 365 Apps for enterprise in English. You want to switch to a 32-bit installation that supports both English and German. Additionally, you plan to change the update path and add Visio in English. To make these changes, you would use a configuration .xml file that looks similar to the following example.

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

## Upgrade to 64-bit (x64) Microsoft 365 Apps

To upgrade your Microsoft 365 Apps to the 64-bit version while adding a language pack, follow these steps:

1. **Prepare Your Configuration.xml File**: Modify your configuration.xml file to include the 64-bit version of the Office Deployment Tool. Set the `OfficeClientEdition` to '64' and specify the language pack you want to add in the `<Add>` section.

2. **Include the MigrateArch Setting**: In the configuration.xml file, ensure that the `MigrateArch` attribute is set to 'TRUE' to allow the transition from 32-bit to 64-bit.

3. **Run the Office Deployment Tool**: Execute the Office Deployment Tool with the updated configuration.xml file. This action starts the upgrade process and installs the other language pack simultaneously.

4. **Verify the Installation**: After the installation completes, check that Microsoft 365 Apps is now running the 64-bit version and that the new language pack is installed.

## Revert to 32-bit (x86) Microsoft 365 Apps

To revert to the 32-bit version of Microsoft 365 Apps, follow these steps:

1. **Update Configuration.xml File**: Change the `OfficeClientEdition` to '32' in your configuration.xml file.

2. **Set MigrateArch to True**: Add the attribute `MigrateArch='TRUE'` in the configuration.xml file to allow the transition from 64-bit to 32-bit.

3. **Execute Office Deployment Tool**: Run the tool with the modified configuration file. This action initiates the process to revert back to the 32-bit version of Microsoft 365 Apps.

## Additional information about using MigrateArch attribute

- The MigrateArch attribute can also be used to change the architecture of the subscription versions of the Project and Visio desktop apps.

- The MigrateArch attribute can't migrate the bitness of Office programs on the device that were installed by using Windows Installer (MSI). Use the [RemoveMSI](upgrade-from-msi-version.md) element in your configuration.xml file to remove those programs.

- The MigrateArch attribute can only migrate Office products installed by using Click-to-Run and have a version number that starts with 16.0. For example, if you installed Visio Professional 2013 on your device using Click-to-Run, you can't use the MigrateArch attribute. This limitation exists because the version number for Visio 2013 begins with 15.0. You can find this version information by going to **Control Panel** > **Programs** > **Programs and Features**. If any Office products on the device used Click-to-Run to install, and whose version number starts with 15.0, then the migration fails.

- If the architecture that you specify to move to is already the architecture of the currently installed products, then no migration takes place when you run the Office Deployment Tool. Your existing installation isn't removed and reinstalled. However, if your configuration.xml includes other changes, such as adding a language, then those changes are implemented.

- When the migration process starts, if a user has an Office app like Word open, they receive a prompt to close the app. This prompt is shown if the [Level](office-deployment-tool-configuration-options.md#level-attribute-part-of-display-element) attribute in your configuration.xml file is set to 'Full' under the [Display](office-deployment-tool-configuration-options.md#display-element) element. If they cancel the prompt, the migration is canceled. If the Level attribute is set to None, and Office apps are running on the device, then the migration fails. You can use the [FORCEAPPSHUTDOWN](office-deployment-tool-configuration-options.md#forceappshutdown-property-part-of-property-element) property in your configuration.xml file, but that closes the user's apps without any warning.

## Related articles

- [Overview of the Office Deployment Tool](overview-office-deployment-tool.md)
- [Configuration options for the Office Deployment Tool](office-deployment-tool-configuration-options.md)
- [Choose between the 64-bit or 32-bit version of Office](https://support.microsoft.com/office/2dee7807-8f95-4d0c-b5fe-6c6f49b8d261)
