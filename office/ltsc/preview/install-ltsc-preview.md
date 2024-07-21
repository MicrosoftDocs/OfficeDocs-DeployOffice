---
title: "Install Office LTSC preview"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: conceptual
ms.service: office-perpetual-itpro
ms.localizationpriority: medium
ms.collection: Tier1
ROBOTS: NOINDEX, NOFOLLOW
recommendations: false
hideEdit: true
description: "Technical guidance for IT Pros about how to install the preview version of Office LTSC"
ms.date: 04/18/2024
---

# Install Office LTSC preview

> [!NOTE]
> - This article is for a preview program and is subject to change.
> - This preview program is intended for organizations that expect to buy and deploy Office LTSC 2024, the new volume licensed (perpetual) version of Office.
> - This preview program isn’t intended for organizations that have already purchased and deployed Office from a Microsoft 365 plan.
> - This preview program isn't intended for home users of Office.

Preview versions of the following products are available for you to install and test on devices running Windows in your organization.

- Microsoft Office LTSC 2024 for commercial preview 
- Microsoft Project 2024 preview
- Microsoft Visio 2024 preview

For information about the preview version of Office for devices running macOS, see [Overview of Office LTSC 2024 for Mac preview](overview-mac-preview.md).

## Installation considerations for Office LTSC preview

Before installing Office LTSC preview, review the following information.

#### Supported operating systems

Office LTSC preview can be installed on the following operating systems:

- Windows 11 (minimum for ARM-based devices) 
- Windows 10 LTSC 2021
- Windows 10 LTSC 2019
- Windows 10
- Windows Server 2022

#### Memory and disk space

The device on which you’re installing the preview products should have at least 4 GB of memory and at least 4 GB of available disk space for each product that you’re installing.

#### 32-bit and 64-bit versions

The Office LTSC 2024 for commercial preview, Project 2024 preview, and Visio 2024 preview are available in both 32-bit and 64-bit versions. We recommend 64-bit, especially on devices that have 4 GB or more of memory. But you should assess application compatibility and other factors that might require you to use the 32-bit version. For more information, see [Choose between the 64-bit or 32-bit version of Office](https://support.microsoft.com/office/2dee7807-8f95-4d0c-b5fe-6c6f49b8d261).

All installed products must be either the 32-bit version or the 64-bit version. For example, you can't install a 32-bit version of Visio on the same device with a 64-bit version of Office.

#### Previous versions of Office

Uninstall any previous version of Office, Project, and Visio before installing the preview products. You can use the RemoveMSI attribute in your configuration.xml file to remove products on the device that were installed by using the Windows Installer (MSI) installation technology. For example, volume licensed versions of Office 2016.

For more information, see [Remove existing MSI versions of Office when upgrading to Microsoft 365 Apps](/microsoft-365-apps/deploy/upgrade-from-msi-version). Even though the article is aimed at customers upgrading to Microsoft 365 Apps, the information does apply to installing the preview products.

To remove Office products that were installed by using Click-to-Run, such as Office LTSC 2021, you need to use the [Remove element](/microsoft-365-apps/deploy/office-deployment-tool-configuration-options#remove-element).

#### Installation location

Preview products are installed on the system drive, which is usually the C:\ drive. The installation location can’t be changed.

#### Apps installed

Microsoft Office LTSC 2024 for commercial preview includes Access, Excel, OneNote, Outlook, PowerPoint, Skype for Business, and Word. You can control which apps are installed, for example by using the [ExcludeApp element](/microsoft-365-apps/deploy/office-deployment-tool-configuration-options#excludeapp-element).

#### Internet connectivity

After you download the installation files, internet connectivity isn’t required to install the Office LTSC preview. Internet connectivity is required if you're using MAK activation, but not for KMS activation. After activation, internet connectivity isn't required to use the preview products.

## Install Office LTSC preview by using the Office Deployment Tool

The [Office Deployment Tool](https://www.microsoft.com/download/details.aspx?id=49117) (ODT) is a free download from the Microsoft Download Center. Always download and use the most current version of the ODT. The ODT is used to download and install Office products, such as preview products, that use Click-to-Run installation technology.

After downloading the file, run the self-extracting executable file, which contains the Office Deployment Tool executable (setup.exe).

Create a configuration.xml file to define the installation settings. Choose which preview products and languages to install, select the architecture (32-bit or 64-bit), and specify where to install and update the preview products from.

For more information about using the Office Deployment Tool and the settings available for your configuration.xml file, see the following articles:

- [Overview of the Office Deployment Tool](/microsoft-365-apps/deploy/overview-office-deployment-tool)
- [Configuration options for the Office Deployment Tool](/microsoft-365-apps/deploy/office-deployment-tool-configuration-options)

Copy the ODT (setup.exe) and your configuration.xml file to the device. From an elevated command prompt, run the following command to install the preview products:

```console
setup.exe /configure configuration.xml
```

#### Example configuration.xml file

The following sample configuration.xml installs the 64-bit version of the three preview products in English. Also, any previous versions of Office that were installed by using the Windows Installer (MSI) installation technology is removed from the device. Because no [UpdatePath attribute](/microsoft-365-apps/deploy/office-deployment-tool-configuration-options#updatepath-attribute-part-of-updates-element) is specified, the preview products are updated directly from the Office Content Delivery Network (CDN) on the internet.


```xml
<Configuration>
  <Add OfficeClientEdition="64"  Channel="PerpetualVL2024">
     <Product ID="ProPlus2024Volume" PIDKEY="#####-#####-#####-#####-#####" >
         <Language ID="en-us" />
    </Product>
    <Product ID="VisioPro2024Volume" PIDKEY="#####-#####-#####-#####-#####">
        <Language ID="en-us" />
    </Product>
    <Product ID="ProjectPro2024Volume" PIDKEY="#####-#####-#####-#####-#####" >
        <Language ID="en-us" />
    </Product>
  </Add>
  <RemoveMSI />
  <Property Name="AUTOACTIVATE" Value="1" />
</Configuration>
```

For the PIDKEY attribute, replace #####-#####-#####-#####-##### with the appropriate Key Management Service (KMS) or Multiple Activation Key (MAK) product key. For more information, see [Activate Office LTSC preview](#activate-office-ltsc-preview).

If you want to download and install the preview products from a shared folder from within your internal network, you can specify that location with the [SourcePath attribute](/microsoft-365-apps/deploy/office-deployment-tool-configuration-options#sourcepath-attribute-part-of-add-element).

If you don’t want certain Office apps to be installed, you can use the [ExcludeApp element](/microsoft-365-apps/deploy/office-deployment-tool-configuration-options#excludeapp-element).

## Activate Office LTSC preview

There are special product keys to activate the preview versions of Office LTSC, Project, and Visio. You can use either Key Management Service (KMS) or Multiple Activation Key (MAK) to activate the preview products.

### Use KMS to activate

To use KMS to activate the preview products, you need a KMS host computer, and it must be configured to support Office 2021 activation. Even though the KMS host computer is configured to activate Office 2021 products, that KMS host computer is able to activate the preview products.

If you don’t have a KMS host computer that supports Office 2021 activation, you can use the [MAK product keys](#use-mak-to-activate) to activate the preview products.

For more information about configuring KMS activation, see the following articles:

- [Configure a KMS host computer to activate volume licensed versions of Office](../../volume-license-activation/configure-a-kms-host-computer-for-office.md)
- [Configure DNS for activating volume licensed versions of Office by using KMS](../../volume-license-activation/configure-dns-to-activate-office-by-using-kms.md)
- [Activate volume licensed versions of Office by using KMS](../../volume-license-activation/activate-office-by-using-kms.md)

Internet connectivity isn’t required for KMS activation. The devices running the preview products only need to be able to contact a KMS host computer on your internal network to be activated.

The following table lists the product keys for KMS activation of the preview products.


|Product  |Product key for KMS activation  |
|---------|---------|
|Office LTSC 2024 for commercial preview |2TDPW-NDQ7G-FMG99-DXQ7M-TX3T2|
|Project 2024 preview |D9GTG-NP7DV-T6JP3-B6B62-JB89R|
|Visio 2024 preview |YW66X-NH62M-G6YFP-B7KCT-WXGKQ|

You include this product key as the PIDKEY attribute in the configuration.xml file when you use the ODT to install the preview products. For more information, see [Example configuration.xml file](#example-configurationxml-file).

If you don’t specify the product key in the configuration.xml file, you can enter the product key manually by opening an Office app, such as Word, and going to **File** > **Account** > **Change Product Key**.

> [!NOTE]
> Activation might not occur right away. In some cases, it might take up to 24 hours for activation to occur. There's a grace period of three days for activation.

### Use MAK to activate

The following table lists the product keys for MAK activation of the preview products.

|Product  |Product key for MAK activation  |
|---------|---------|
|Office LTSC 2024 for commercial preview |Y63J7-9RNDJ-GD3BV-BDKBP-HH966|
|Project 2024 preview |GQRNR-KHGMM-TCMK6-M2R3H-94W9W|
|Visio 2024 preview |3HYNG-BB9J3-MVPP7-2W3D8-CPVG7|

You include this product key as the PIDKEY attribute in the configuration.xml file when you use the Office Deployment Tool to install the preview products. For more information, see [Example configuration.xml file](#example-configurationxml-file). 

If you don’t specify the product key in the configuration.xml file, you can enter the product key manually by opening an Office app, such as Word, and going to **File** > **Account** > **Change Product Key**.

## Update Office LTSC preview

Updates for preview products include security and nonsecurity updates that provide stability and performance improvements for Office, as needed.

To manually check for updates, open any Office app, such as Word, and go to **File** > **Account** > **Update Options** > **Update Now**.

### Update from the Office Content Delivery Network

If network connectivity and other considerations based on your organizational requirements aren’t an issue, let the preview products automatically update themselves directly from the Office Content Delivery Network (CDN) on the internet. This option requires the least administrative effort and is the easiest way to keep the preview products up to date.

While the updates are being downloaded in the background, you can continue to use your Office apps, such as Word. After the updates are downloaded, the updates are installed. If you have any Office apps open, you’re prompted to save your work and close the apps, so that the updates can be installed.

### Update by using a network share

If you don’t want devices in your organization to connect to the Office CDN to get updates, you can configure the preview products to get updates from a shared folder from within your internal network. You can use the Office Deployment Tool to download the latest version of the preview products from the Office CDN to a shared folder on your internal network. You can then configure the preview products to check that shared folder for updates by using the [UpdatePath attribute](/microsoft-365-apps/deploy/office-deployment-tool-configuration-options#updatepath-attribute-part-of-updates-element) in your configuration.xml file.

This option requires more administrative effort and more disk space. For example, you must keep track of when new builds of the preview products are available and then download the updated version to the shared folder on your network. The main installation file that contains all three preview products is at least 2.3 GB and each language file is at least 400 MB. There aren’t separate downloads for each preview product, and you can’t download just the security updates or nonsecurity updates.

## Getting support and providing feedback

Microsoft support isn’t available for the preview program.

Use preview products only for testing purposes. For example, to familiarize yourself with deploying preview products and using the new features in the Office apps. Preview products shouldn’t be used in your normal production environment or on a production device.

If you want to provide feedback about an Office app or feature, go to **File**, and select **Feedback** in that app.

If you have questions about Office LTSC preview or want to provide feedback, go to the [Microsoft 365 and Office forum for business customers](https://answers.microsoft.com/lang/msoffice/forum/msoffice_OfB) on Microsoft Community.
