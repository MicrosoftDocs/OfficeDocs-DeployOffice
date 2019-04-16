---
title: "Change an Office 365 ProPlus installation from 32-bit to 64-bit"
ms.author: danbrown
author: DHB-MSFT
manager: laurawi
ms.audience: ITPro
ms.topic: article
ms.service: o365-proplus-itpro
localization_priority: Normal
ms.collection: Ent_O365
ms.custom: Ent_Office_ProPlus
description: "Provides Office admins with information on how to use the MigrateArch attribute to change the bitness of an exsiting installation of Office 365 ProPlus, such as from 32-bit to 64-bit."
---

# Change an Office 365 ProPlus installation from 32-bit to 64-bit

Up to now, if you had the 32-bit version of Office 365 ProPlus installed on a device and you wanted to change to the 64-bit version, you needed to uninstall the existing 32-bit version and then install the 64-bit version. It also required that you account for all the other deployment settings configured for that device, such as the update path and the installed languages, so that those settings would be included when you did the 64-bit installation.

But now, to make it easier to change from a 32-bit to a 64-bit installation of Office 365 ProPlus, the Office Deployment Tool and its configuration.xml file supports an optional attribute named MigrateArch. If the MigrateArch attribute is set to True, then your installation of Office 365 ProPlus will be changed to the architecture (sometimes referred to as the bitness) that is specified in the OfficeClientEdition attribute.

With MigrateArch, you don’t have to account for all the installed products and languages or other deployment settings. The migration process will preserve those during the migration process. But, if you want to make any changes to the installed products and languages, or other deployment settings, you can do that as part of the migration process by explicitly specifying those settings in your configuration.xml file. For more information, see [Sample configuration.xml file to use with the Office Deployment Tool](#sample-configurationxml-file-to-use-with-the-office-deployment-tool).

## Requirements for using the MigrateArch attribute

To use the MigrateArch attribute, you need the following:

- At least Version 1902 of Office 365 ProPlus installed on the device that you want to change the bitness of.
- At least version 16.0.11608.33604 of the Office Deployment Tool from the [Microsoft Download Center](https://www.microsoft.com/download/details.aspx?id=49117).
- A location that contains all the product and language files for the architecture that you are changing the installation to.

Version 1902, or later, is available in Monthly Channel and Semi-Annual Channel (Targeted). Version 1904 is expected to be available in Semi-Annual Channel in July 2019.

## Providing a source location to be used with the MigrateArch attribute

When using the MigrateArch attribute, you need a location that contains the installation source files of the bitness that you’re moving to.

For this location, if network bandwidth or internet connectivity is not an issue, we recommend that you use the Office Content Delivery Network (CDN), because the CDN will always have the most up-to-date program and language installation files that you need.

If you are using a location that’s on your local network, be sure to use the Office Deployment Tool to download all the necessary product and language files ahead of time. You can download the 32-bit and 64-bit installation files to the same share for a given update channel. For example, you can download the 32-bit and 64-bit installation files for Semi-Annual Channel to \\\\server01\\sac. But, you need to download the installation files for Monthly Channel to a different location, such as \\\\server01\\monthly.

If your local network location doesn’t contain files of the correct bitness, the migration fails and the bitness of the installation will remain as-is. If this location doesn’t contain all the necessary language source files – for example, the French language files are missing – the migration will fail. To avoid this situation, we strongly recommend that you include [AllowCdnFallback="True"](configuration-options-for-the-office-2016-deployment-tool.md#allowcdnfallback-attribute-part-of-add-element) in your configuration.xml file. This will use the Office Content Delivery Network (CDN) on the internet as a backup source from which to install the language files.

## Sample configuration.xml file to use with the Office Deployment Tool

The following is a sample configuration.xml that will change an existing 32-bit installation of Office 365 ProPlus to a 64-bit installation. All existing products, languages, and other deployment settings, such as update path, will be preserved.

```xml
<Configuration>
  <Add OfficeClientEdition="64" MigrateArch="TRUE">
  </Add>
</Configuration>
```

Then, run the Office Deployment Tool in /configure mode and specify this configuration.xml file to make the change from 32-bit to 64-bit. The 32-bit version will be uninstalled and then the 64-bit version will be installed.

If you want to change the products or languages installed, or want to change other deployment settings, you need to specify those in your configuration.xml file. For example, if you want to change a 64-bit installation of Office 365 ProPlus in English to a 32-bit installation that includes English and German, changes the update path, and adds Visio in English, you would use a configuration.xml file that looks similar to the following example.

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

- Before changing to a different architecture, especially when changing to 64-bit, make sure that your existing add-ins, macros, and complex Office files work on the new architecture. For more information, see [Use the Readiness Toolkit to assess application compatibility for Office 365 ProPlus](use-the-readiness-toolkit-to-assess-application-compatibility-for-office-365-pro.md).

- The MigrateArch attribute can be used to change the architecture of the subscription versions of Project and Visio. For example, if you have a device that only has Project Online Desktop Client installed on it.

- The MigrateArch attribute won’t migrate the bitness of Office programs on the device that were installed by using Windows Installer (MSI). Those programs can be removed by the using the [RemoveMSI](upgrade-from-msi-version.md) element in your configuration.xml file.

- The MigrateArch attribute can only migrate Office products installed by using Click-to-Run and have a version number that starts with 16.0. For example, you can’t use the MigrateArch attribute if Visio Professional 2013 was installed on the device by using Click-to-Run, because the 2013 version of Visio has a version number that starts with 15.0. You can find this version information by going to **Control Panel** > **Programs** > **Programs and Features**. If there are any Office products on the device that were installed by using Click-to-Run, and whose version number starts with 15.0, then the migration will fail.

- If the architecture that you specify to move to is already the architecture of the currently installed products, then no migration takes place when you run the Office Deployment Tool. Your existing installation will not be removed and reinstalled. But if your configuration.xml includes other changes, such as adding a language, then those changes will be implemented.

- If a user has an Office app, such as Word, open when the migration process begins, and the [Level](configuration-options-for-the-office-2016-deployment-tool.md#level-attribute-part-of-display-element) attribute is set to Full for the [Display](configuration-options-for-the-office-2016-deployment-tool.md#display-element) element in your configuration.xml file, then the user will be prompted to close the app. If they cancel the prompt, the migration is cancelled. If the Level attribute is set to None, and Office apps are running on the device, then the migration will fail. You can use the [FORCEAPPSHUTDOWN](configuration-options-for-the-office-2016-deployment-tool.md#forceappshutdown-property-part-of-property-element) property in your configuration.xml file, but that will close the user’s apps without any warning.

## Related topics

- [Overview of the Office Deployment Tool](overview-of-the-office-2016-deployment-tool.md)
- [Configuration options for the Office Deployment Tool](configuration-options-for-the-office-2016-deployment-tool.md)
- [Choose between the 64-bit or 32-bit version of Office](https://support.office.com/article/2dee7807-8f95-4d0c-b5fe-6c6f49b8d261)
