---
title: "Use the Office Deployment Tool to install Microsoft 365 Insider on Windows devices"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: how-to
ms.service: o365-proplus-itpro
ms.localizationpriority: medium
ms.collection: Tier1
recommendations: false
description: "Provides steps for admins to use the Office Deployment Tool to install Microsoft 365 Insider on Windows devices"
ms.date: 02/05/2024
---

# Use the Office Deployment Tool to install Microsoft 365 Insider on Windows devices

If you want to configure a limited number of Windows devices to use Microsoft 365 Insider, you can use the Office Deployment Tool. The Office Deployment Tool supports both of these scenarios:

- [Change an existing Microsoft 365 Apps installation to Microsoft 365 Insider](#change-an-existing-microsoft-365-apps-installation-to-microsoft-365-insider)
- [Install Microsoft 365 Insider when you do a new Microsoft 365 Apps installation](#install-microsoft-365-insider-when-you-do-a-new-microsoft-365-apps-installation)

## Change an existing Microsoft 365 Apps installation to Microsoft 365 Insider

If Microsoft 365 Apps is already installed on the Windows device, follow these steps to change to Microsoft 365 Insider.

1. Download the latest version of the [Office Deployment Tool](https://www.microsoft.com/download/details.aspx?id=49117) from the Microsoft Download Center.
2. Double-click the officedeploymenttool executable file to extract the setup.exe file and the sample configuration.xml files. The setup.exe file is the Office Deployment Tool.
3. Use a text editor, such as Notepad, to create a file named configuration.xml. To change to Current Channel (Preview), use the following text.

```xml
<Configuration>
  <Updates Channel="CurrentPreview" />
</Configuration>
```

> [!NOTE]
> - If you want to change to Beta Channel, use Channel="BetaChannel".
> - Keep in mind that Beta Channel isn't supported.

4. Copy the setup.exe file and your configuration.xml file to the device where you want to install Microsoft 365 Apps. An Internet connection is required and you must have local administrator permissions on that device.
5. From an elevated command prompt, go to the folder where you copied the files and run the following command. Then run the following command, which downloads any Microsoft 365 Apps files needed to change to the Microsoft 365 Insider channel that you specified.

```console
setup.exe /configure configuration.xml
```

6. After you run the command, open an app, such as Word, and go to **File** › **Account**. Then select **Update Options** > **Update Now** to start downloading the updates needed to change to the Microsoft 365 Insider channel that you chose.
7. After the updates are installed, open an app, such as Word, and go to **File** › **Account**. Under the **About** section, you should see **Current Channel (Preview)** or **Beta Channel**, depending on which channel you chose in your configuration.xml file.

## Install Microsoft 365 Insider when you do a new Microsoft 365 Apps installation

Follow these steps to use the Office Deployment Tool to install Microsoft 365 Insider on a Windows device that doesn't already have Microsoft 365 Apps installed.

1. Download the latest version of the [Office Deployment Tool](https://www.microsoft.com/download/details.aspx?id=49117) from the Microsoft Download Center.
2. Double-click the officedeploymenttool executable file to extract the setup.exe file and the sample configuration.xml files. The setup.exe file is the Office Deployment Tool.
3. Use a text editor, such as Notepad, to create a file named configuration.xml. To install Current Channel (Preview), use the following text.

```xml
<Configuration>
  <Add OfficeClientEdition="64" Channel="CurrentPreview" >
    <Product ID="O365ProPlusRetail">
      <Language ID="en-us" />
    </Product>
  </Add>
 </Configuration>
```

> [!NOTE]
> - If you want to install Beta Channel, use Channel="BetaChannel".
> - Keep in mind that Beta Channel isn't supported.

4. Copy the setup.exe file and your configuration.xml file to the device where you want to install Microsoft 365 Apps. An Internet connection is required to install Microsoft 365 Apps and you must have local administrator permissions on that device.
5. From an elevated command prompt, go to the folder where you copied the files. Then run the following command to copy the Microsoft 365 Apps files from the internet directly to your device and start the installation.

```console
setup.exe /configure configuration.xml
```

6. After the installation is complete, open an app, such as Word, and go to **File** › **Account**. Under the **About** section, you should see **Current Channel (Preview)** or **Beta Channel**, depending on which channel you chose in your configuration.xml file.

## Frequently asked questions

### How do I install the 32-bit version of Microsoft 365 Apps?

To install the 32-bit version of Microsoft 365 Apps, use OfficeClientEdition="32" in the configuration.xml file.

64-bit is the default and is recommended, but if you’re not sure which to use, see [Choose between the 64-bit or 32-bit version of Office](https://support.microsoft.com/office/2dee7807-8f95-4d0c-b5fe-6c6f49b8d261).

### I have Microsoft 365 Apps for business, not Microsoft 365 Apps for enterprise. What do I do?

If you have Microsoft 365 Apps for business, use ID="O365BusinessRetail" in the configuration.xml file.

Microsoft 365 Apps is the version that comes with certain business plans, such as Microsoft 365 Business Standard or Microsoft 365 Business Premium.

### What other configuration options are available for deploying Microsoft 365 Apps?

For more information about other settings that you can specify in the configuration.xml file, see [Configuration options for the Office Deployment Tool](../../office-deployment-tool-configuration-options.md).

For example, how to install other languages or how to install Project or Visio, if you have a subscription for those products.

### I don’t want a device to be on Microsoft 365 Insider anymore. What do I do?

Follow the same steps as when you [change an existing installation of Microsoft 365 Apps to Microsoft 365 Insider](#change-an-existing-microsoft-365-apps-installation-to-microsoft-365-insider). In the configuration.xml file, set the value of the Channel attribute to the channel that you want to change to.

For example, if you want the device to change to Monthly Enterprise Channel, use a configuration.xml file with the following text.

```xml
<Configuration>
  <Updates Channel="MonthlyEnterprise" />
</Configuration>
```

### Does the xml file have to be named configuration.xml?

You can give the configuration.xml file any name that you want, as long as it has an .xml file extension.

For example, you could name your file CCP64English.xml, which might be more meaningful if you have several different files that you’re using with the Office Deployment Tool.

### Is there another way to create the configuration.xml file?

Yes, you can use the web-based interface of the Office Customization Tool to create your configuration.xml file. For more information, see [Overview of the Office Customization Tool](../../admin-center/overview-office-customization-tool.md).

## Related articles
- [Overview of the Office Deployment Tool](../../overview-office-deployment-tool.md)
- [Configuration options for the Office Deployment Tool](../../office-deployment-tool-configuration-options.md)
