---
title: "Install Office LTSC Preview"
ms.author: danbrown
author: DHB-MSFT
manager: dougeby
audience: ITPro
ms.topic: article
ms.prod: office-perpetual-itpro
ms.localizationpriority: medium
ms.collection: Ent_O365
ms.custom: 
- Ent_Office_VL
- OfficeLTSC2021
ROBOTS: NOINDEX, NOFOLLOW
recommendations: false
description: "Technical guidance for IT Pros about how to install the preview version of Office LTSC"
---

# Install Office LTSC Preview

> [!IMPORTANT]
> - This is pre-release documentation for a preview program and is subject to change.
>
> - This preview program is intended for organizations that expect to buy and deploy the new volume licensed (perpetual) version of Office that is scheduled to be released later this year. This preview program isn’t intended for organizations that have already purchased and deployed Office from a Microsoft 365 (or Office 365) plan. 
>
> - This preview program isn't intended for home users of Office.

Microsoft is planning to release new volume licensed versions of Office, Project, and Visio later this year. Preview versions of those products are available now for you to install and test on devices running Windows in your organization.

The following products are available as part of this preview program:
- Office LTSC Professional Plus 2021 Preview
- Project Professional 2021 Preview
- Visio Professional 2021 Preview

For an overview of this preview program, including what’s changed since Office 2019, see [Overview of Office LTSC Preview](overview-ltsc-preview.md).

For information about the preview version of Office for devices running macOS, see [Overview of Office LTSC for Mac 2021 (Preview)](overview-mac-preview.md).

## Installation considerations for Office LTSC Preview

Before installing Office LTSC Preview, review the following information.


#### Supported operating systems

Office LTSC Preview can be installed on the following operating systems:

- Windows 10 Semi-Annual Channel
- Windows 10 LTSC 2019
- Windows Server 2019


#### Memory and disk space

The device on which you’re installing the preview products should have at least 4 GB of memory and at least 4 GB of available disk space for each product that you’re installing.


#### 32-bit and 64-bit versions

The preview versions of Office LTSC, Project 2021, and Visio 2021 are available in both 32-bit and 64-bit versions. We recommend 64-bit, especially on devices that have 4 GB or more of memory. But you should assess application compatibility and other factors that might require you to use the 32-bit version. For more information, see [Choose between the 64-bit or 32-bit version of Office](https://support.microsoft.com/office/2dee7807-8f95-4d0c-b5fe-6c6f49b8d261).

All installed products must be either the 32-bit version or the 64-bit version. For example, you can't install a 32-bit version of Visio on the same device with a 64-bit version of Office.


#### Previous versions of Office

We recommend that you uninstall any previous version of Office, Project, and Visio before installing the preview products. You can use the RemoveMSI attribute in your configuration.xml file to remove products on the device that were installed by using the Windows Installer (MSI) installation technology. For example, volume licensed versions of Office 2016 or Office 2013.

For more information, see [Remove existing MSI versions of Office when upgrading to Microsoft 365 Apps](../upgrade-from-msi-version.md). Even though the article is aimed at customers upgrading to Microsoft 365 Apps, the information does apply to installing the preview products.

To remove Office products that were installed by using Click-to-Run, such as Office Professional Plus 2019, you need to use the [Remove element](../office-deployment-tool-configuration-options.md#remove-element).

#### Installation location

The preview products are installed on the system drive, which is usually the C:\ drive. The installation location can’t be changed.


#### Apps installed

Office LTSC Professional Plus 2021 Preview includes Access, Excel, OneNote, Outlook, PowerPoint, Publisher, Skype for Business, Teams, and Word. You can control which are apps are installed, for example by using the [ExcludeApp element](../office-deployment-tool-configuration-options.md#excludeapp-element).

Here is some additional information about OneNote, Teams, and Skype for Business.

**OneNote**

Office LTSC Preview includes the OneNote desktop app. This is the same version of OneNote that's included with volume licensed versions of Office 2019, such as Office Professional Plus 2019, and with Microsoft 365 Apps. It's different than OneNote for Windows 10, which is a Microsoft Store app that's available only on Windows 10. For more information, see [Deployment guide for OneNote](../deployment-guide-onenote.md).

**Microsoft Teams**

To complete the installation of the Teams client app after installing Office LTSC Preview, either restart the device or sign out and then sign in again.

After Teams is installed, it's automatically updated approximately every two weeks with new features and quality updates. This update process for Teams is different than the update process for the other Office apps, such as Word and Excel. For more information, see [Teams update process](/microsoftteams/teams-client-update).

If you don’t want the Teams client app included when you install Office LTSC Preview, you can use either of these methods:
- The [ExcludeApp element](../office-deployment-tool-configuration-options.md#excludeapp-element) in your configuration xml file if you’re using the Office Deployment Tool to install Office LTSC Preview.
- The “Don't install Microsoft Teams with new installations or updates of Office” policy setting if you’re using Group Policy. You can find this policy setting under Computer Configuration\Policies\Administrative Templates\Microsoft Office 2016 (Machine)\Updates in the Group Policy Management tool.

**Skype for Business**

Skype for Business won’t be included in the installation of Office LTSC Preview when you use either of the following methods to install Office LTSC Preview:

- The Office Deployment Tool with a configuration xml file created by using the [Office Customization Tool](https://config.office.com/deploymentsettings) and you don’t change the default settings under the **Apps** section.
- The Office 365 Client Installation wizard in Microsoft Endpoint Configuration Manager (current branch) and you don’t change the default settings under the **Apps** section.


#### Internet access

After downloading the installation files, internet access isn’t required to install, activate, or use the preview products.


## Install Office LTSC Preview

The following information provides steps on how to install the preview products by using either the Office Deployment Tool (ODT) or Microsoft Endpoint Configuration Manager (current branch).

### Install by using the Office Deployment Tool

The [Office Deployment Tool](https://www.microsoft.com/download/details.aspx?id=49117) (ODT) is a free download from the Microsoft Download Center. We recommend that you always download and use the most current version of the ODT. The ODT is used to download and install Office products, such as the preview products, that use the Click-to-Run installation technology.

> [!NOTE]
> You must be using at least Version 16.0.13901.20336 (setup.exe version 16.0.13901.20328) of the ODT to install the preview products. This version was released on April 13, 2021.

After downloading the file, run the self-extracting executable file, which contains the Office Deployment Tool executable (setup.exe).

You’ll need to create a configuration.xml file that defines the installation settings, such as which preview products and languages to install, which architecture (32-bit or 64-bit) to use, and where to install and update the preview products from.

For more information about using the Office Deployment Tool and the settings available for your configuration.xml file, see the following articles:

- [Overview of the Office Deployment Tool](../overview-office-deployment-tool.md)
- [Configuration options for the Office Deployment Tool](../office-deployment-tool-configuration-options.md)

> [!TIP]
> To help you create your configuration.xml, we recommend that you use the [Office Customization Tool](https://config.office.com/deploymentsettings). This tool provides a web-based interface for making your selections and helps reduce syntax errors.

Copy the ODT (setup.exe) and your configuration.xml file to the device, and then from an elevated command prompt, run the following command to install the preview products:

&nbsp;&nbsp;&nbsp; `setup.exe /configure  configuration.xml`

##### Example configuration.xml file

The following sample configuration.xml will install the 64-bit version of the three preview products in English. Also, any previous versions of Office that were installed by using the Windows Installer (MSI) installation technology will be removed from the device. Because no [UpdatePath attribute](../office-deployment-tool-configuration-options.md#updatepath-attribute-part-of-updates-element) is specified, the preview products will be updated directly from the Office Content Delivery Network (CDN) on the internet. 


```xml
<Configuration>
  <Add OfficeClientEdition="64"  Channel="PerpetualVL2021">
     <Product ID="ProPlus2021Volume" PIDKEY="#####-#####-#####-#####-#####" >
         <Language ID="en-us" />
    </Product>
    <Product ID="VisioPro2021Volume" PIDKEY="#####-#####-#####-#####-#####">
        <Language ID="en-us" />
    </Product>
    <Product ID="ProjectPro2021Volume" PIDKEY="#####-#####-#####-#####-#####" >
        <Language ID="en-us" />
    </Product>
  </Add>
  <RemoveMSI />
  <Updates Enabled="TRUE" />
  <Property Name="AUTOACTIVATE" Value="1" />
</Configuration>
```

For the PIDKEY attribute, replace #####-#####-#####-#####-##### with the appropriate Key Management Service (KMS) or Multiple Activation Key (MAK) product key. For more information, see [Activate Office LTSC Preview](#activate-office-ltsc-preview).

If you want to download and install the preview products from a shared folder from within your internal network, you can specify that location with the [SourcePath attribute](../office-deployment-tool-configuration-options.md#sourcepath-attribute-part-of-add-element).

If you don’t want certain Office apps to be installed, such as Publisher, you can use the [ExcludeApp element](../office-deployment-tool-configuration-options.md#excludeapp-element).


### Install by using Configuration Manager

If you’re using Configuration Manager (current branch) in your organization, you can use the Office 365 Client Installation wizard to deploy the preview products.

To use the wizard, perform the following steps:

1. In the Configuration Manager console, navigate to **Software Library** > **Overview** > **Office 365 Client Management**.
2. Select **Office 365 Installer** in the upper-right pane. The installation wizard opens.
3. On the **Application Settings** page, provide a name and description for the app, enter the download location for the files, and then choose **Next**. The location must be specified as *\\\server\share*.
4. On the **Office Settings** page, select **Go to the Office Customization Tool**. This will open the Office Customization Tool.
5. Configure the desired settings for the installation of the preview products. Then select **Submit** in the upper right of the page when you complete the configuration.
6. Finish the rest of the steps in the wizard.


## Activate Office LTSC Preview

There are special product keys to activate the preview versions of Office LTSC, Project 2021, and Visio 2021. You can use either Key Management Service (KMS) or Multiple Activation Key (MAK) to activate the preview products. 

> [!IMPORTANT]
> - The special product keys for the preview products expire on January 17, 2022.
>
> - After that date, the preview products will go into reduced functionality mode, which means you’ll only be able to read and print documents in the preview products. You won’t be able to create new documents or edit existing documents using the preview products.
> 
> - In Outlook, you’ll be able to read existing items that have been synchronized to your mailbox, but Outlook won’t be able to connect to your email server and synchronize more items.

When Office LTSC, Project 2021, and Visio 2021 are released later this year, new product keys for KMS and MAK activation will be made available on the Volume Licensing Service Center (VLSC). At that time, we'll provide documentation on how to transition from using the preview product keys to using the new product keys for activation.

### Use KMS to activate

To use KMS to activate the preview products, you need a KMS host computer, and it must be configured to support Office 2019 activation. Even though the KMS host computer is configured to activate Office 2019 products, that KMS host computer will be able to activate the preview products. When Office LTSC, Project 2021, and Visio 2021 are released later this year, we'll provide instructions on how to configure your KMS host computer to activate those products.

If you don’t have a KMS host computer that supports Office 2019 activation, you can use the [MAK product keys](#use-mak-to-activate) to activate the preview products.

For more information about configuring KMS activation, see the following articles:

- [Configure a KMS host computer to activate volume licensed versions of Office](../vlactivation/configure-a-kms-host-computer-for-office.md)
- [Configure DNS for activating volume licensed versions of Office by using KMS](../vlactivation/configure-dns-to-activate-office-by-using-kms.md)
- [Activate volume licensed versions of Office by using KMS](../vlactivation/activate-office-by-using-kms.md)

Internet connectivity isn’t required for KMS activation. The devices running the preview products only need to be able to contact a KMS host computer on your internal network to be activated.

The following table lists the product keys for KMS activation of the preview products.


|Product  |Product key for KMS activation  |
|---------|---------|
|Office LTSC Professional Plus 2021 Preview |HFPBN-RYGG8-HQWCW-26CH6-PDPVF |
|Project Professional 2021 Preview |WDNBY-PCYFY-9WP6G-BXVXM-92HDV |
|Visio Professional 2021 Preview |2XYX7-NXXBK-9CK7W-K2TKW-JFJ7G  |

You include this product key as the PIDKEY attribute in the configuration.xml file when you use the Office Deployment Tool to install the preview products. For more information, see [Example configuration.xml file](#example-configurationxml-file). 

If you don’t specify the product key in the configuration.xml file, you can enter the product key manually by opening an Office app, such as Word, and going to **File** > **Account** > **Change Product Key**.

Activation might not occur right away. In some cases, activation might take up to 24 hours for activation to occur. There is a grace period of three days for activation.

### Use MAK to activate

The following table lists the product keys for MAK activation of the preview products.

|Product  |Product key for MAK activation  |
|---------|---------|
|Office LTSC Professional Plus 2021 Preview |T3N47-WVHW9-VCT2V-QKP29-P393W |
|Project Professional 2021 Preview | 2NYG6-3BBBX-M97JW-B7DFV-G6RMB |
|Visio Professional 2021 Preview |M9N3Y-CCB6D-J66FD-KKGF4-8B799|

You include this product key as the PIDKEY attribute in the configuration.xml file when you use the Office Deployment Tool to install the preview products. For more information, see [Example configuration.xml file](#example-configurationxml-file). 

If you don’t specify the product key in the configuration.xml file, you can enter the product key manually by opening an Office app, such as Word, and going to **File** > **Account** > **Change Product Key**.


## Update Office LTSC Preview

The preview products will be updated a few times each month during the preview program. These updates will include, as needed, security updates and non-security updates, such as updates that provide stability or performance improvements for Office.

To manually check for updates, open any Office app, such as Word, and go to **File** > **Account** > **Update Options** > **Update Now**.

You have several options on how to update the preview products.

### Update from the Office CDN

If network connectivity and other considerations based on your organizational requirements aren’t an issue, we recommend that you let the preview products automatically update themselves directly from the Office Content Delivery Network (CDN) on the internet. This option requires the least administrative effort and is the easiest way to keep the preview products up to date.

While the updates are being downloaded in the background, you can continue to use your Office apps, such as Word. After the updates are downloaded, the updates are installed. If you have any Office apps open, you’re prompted to save your work and close the apps, so that the updates can be installed.

### Update by using Configuration Manager

You can use the software update management workflow in Microsoft Endpoint Configuration Manager (current branch) to update the preview products. 

When an updated version of the preview products is published to the Office CDN, an update package will also be published to Windows Server Update Services (WSUS). Then, Configuration Manager synchronizes the Office update from the WSUS catalog to the site server. Configuration Manager can then download the update and distribute the update to distribution points selected by the administrator. The Configuration Manager desktop client then tells Office where to get the update and when to start the update installation process.

For more information, see [Manage updates to Microsoft 365 Apps with Microsoft Endpoint Configuration Manager](../manage-microsoft-365-apps-updates-configuration-manager.md). Even though the article isn’t specifically for the preview products, the information covered in the article does apply.

### Update by using a network share

If you don’t want devices in your organization to connect to the Office CDN to get updates, you can configure the preview products to get updates from a shared folder from within your internal network. You can use the Office Deployment Tool to download the latest version of the preview products from the Office CDN to a shared folder on your internal network. You can then configure the preview products to check that shared folder for updates by using the [UpdatePath attribute](../office-deployment-tool-configuration-options.md#updatepath-attribute-part-of-updates-element) in your configuration.xml file.

This option requires more administrative effort and more disk space. For example, you have to keep track of when new builds of the preview products are available and then download the updated version to the shared folder on your network. The main installation file that contains all three preview products is at least 2.3 GB and each language file is at least 400 MB. There aren’t separate downloads for each preview product, and you can’t download just the security updates or non-security updates.

## Getting support and providing feedback

Since this is a preview program, Microsoft support isn’t available. 

Therefore, we recommend that you use the preview products only for testing purposes. For example, to familiarize yourself with deploying the preview products and using the new features in the Office apps. The preview products shouldn’t be used in your normal production environment or on a production device. 

If you want to provide feedback about an Office app or feature, go to **File** > **Feedback** in that app.

If you have questions about Office LTSC Preview or want to provide additional feedback, go to the [Office LTSC Commercial Preview forum](https://answers.microsoft.com/lang/msoffice/forum/msoffice_LTSC) on Microsoft Community.

> [!NOTE]
> When Office LTSC, Project 2021, and Visio 2021 are released later this year, they will have five years of Mainstream Support. There won’t be any Extended Support available for these products after the five years of Mainstream Support ends.