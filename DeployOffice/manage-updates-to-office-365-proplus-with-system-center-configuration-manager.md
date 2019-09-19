---
title: "Manage updates to Office 365 ProPlus with System Center Configuration Manager"
ms.author: jwhit
author: jwhit-MSFT
manager: laurawi
audience: ITPro
ms.topic: article
ms.service: o365-proplus-itpro
localization_priority: Priority
ms.collection:
- Ent_O365
- M365-modern-desktop
ms.custom: Ent_Office_ProPlus
description: "System Center Configuration Manager has the ability to manage Office 365 client updates by using the Software Update management workflow. You can use Configuration Manager to update Office 365 ProPlus, Visio Online Plan 2, Project Online Desktop Client, and Office 365 Business."
---

# Manage updates to Office 365 ProPlus with System Center Configuration Manager

System Center Configuration Manager has the ability to manage Office 365 client updates by using the Software Update management workflow. You can use Configuration Manager to update Office 365 ProPlus, Visio Online Plan 2 (previously named Visio Pro for Office 365), Project Online Desktop Client, and Office 365 Business.

When Microsoft publishes a new Office 365 client update to the Office Content Delivery Network (CDN), Microsoft simultaneously publishes an [update package](manage-updates-to-office-365-proplus-with-system-center-configuration-manager.md#BKMK_Package) to Windows Server Update Services (WSUS). Then, Configuration Manager synchronizes the Office 365 client update from the WSUS catalog to the site server. Configuration Manager can then download the update and distribute it to distribution points selected by the administrator. The Configuration Manager desktop client then tells the Office client where to get the update and when to start the update installation process.

Here's an overview of the steps to enable Configuration Manager to manage Office 365 client updates:

1. [Review the requirements](manage-updates-to-office-365-proplus-with-system-center-configuration-manager.md#BKMK_Reqs)

2. [Enable Configuration Manager to receive Office 365 client package notifications](manage-updates-to-office-365-proplus-with-system-center-configuration-manager.md#BKMK_EnableCM)

3. [Enable Office 365 clients to receive updates from Configuration Manager](manage-updates-to-office-365-proplus-with-system-center-configuration-manager.md#BKMK_EnableClient)

After you perform these steps, you can use the software update management capabilities of Configuration Manager to deploy the updates. For more information, see [Manage software updates in System Center Configuration Manager](https://technet.microsoft.com/library/mt613209.aspx).

<a name="BKMK_Reqs"> </a>
## Requirements for using Configuration Manager to manage Office 365 client updates

To enable Configuration Manager to manage Office 365 client updates, you need the following:

- System Center Configuration Manager, update 1602 or later

- An Office 365 client - Office 365 ProPlus, Visio Online Plan 2 (previously named Visio Pro for Office 365), Project Online Desktop Client, or Office 365 Business

- Supported channel version for Office 365 client. For more details, see [Release information for updates to Office 365 ProPlus](https://docs.microsoft.com/officeupdates/release-notes-office365-proplus)

- Windows Server Update Services (WSUS) 4.0

    You can't use WSUS by itself to deploy these updates. You need to use WSUS in conjunction with Configuration Manager

- The hierarchy's top level WSUS server and the top level Configuration Manager site server must have access to the following URLs: *.microsoft.com, *.msocdn.com, *.office.com, *.office.net, *.onmicrosoft.com, officecdn.microsoft.com, officecdn.microsoft.com.edgesuite.net. For more details, see [Office 365 URLs and IP address ranges](https://docs.microsoft.com/office365/enterprise/urls-and-ip-address-ranges#microsoft-365-common-and-office-online).

- On the computers that have the Office 365 client installed, the [Office COM object is enabled](manage-updates-to-office-365-proplus-with-system-center-configuration-manager.md#BKMK_EnableClient).

<a name="BKMK_EnableCM"> </a>
## Enable Configuration Manager to receive Office 365 client package notifications

To start, you need to configure Configuration Manager to receive notifications when Office 365 client update packages are available. To do that, use the following steps:

1. In the Configuration Manager console, choose **Site Configuration** > **Sites**, and then select your site server.

2. On the **Home** tab, in the **Settings** group, choose **Configure Site Components**, and then choose **Software Update Point**.

3. In the **Software Update Point Component Properties** dialog box, do the following:

   - On the **Products** tab, under **Office**, select **Office 365 Client**.

   - On the **Classifications** tab, select **Updates**.

     You can have other check boxes selected in the **Products** and **Classifications** tabs. But, **Office 365 Client** and **Updates** need to be selected for Configuration Manager to receive notifications when Office 365 client update packages are available.

4. Next, synchronize software updates. If you don't do that, you won't see the updates in the console and the updates won't be available to deploy. For more information about how to synchronize software updates, see [Introduction to software updates in System Center Configuration Manager](https://docs.microsoft.com/en-us/sccm/sum/understand/software-updates-introduction).

<a name="BKMK_EnableClient"> </a>
## Enable Office 365 clients to receive updates from Configuration Manager

For Configuration Manager to be able to manage Office 365 client updates, an Office COM object needs to be enabled on the computer where Office is installed. The Office COM object takes commands from Configuration Manager to download and install client updates.

You can enable the Office COM object by using either of the following methods: the Office Deployment Tool or Group Policy.

<a name="BKMK_ODT"> </a>
### Method 1: Use Office Deployment Tool to enable Office 365 clients to receive updates from Configuration Manager

You can use the latest version of the [Office Deployment Tool](https://go.microsoft.com/fwlink/p/?LinkID=626065) to configure Office 365 clients to receive updates from Configuration Manager.

To configure this capability, use a text editor, such as Notepad, to modify the configuration file for the Office Deployment Tool. In the Add element, include the OfficeMgmtCOM attribute and set its value to True, as seen in the following example.

```xml
<Configuration>
  <Add OfficeClientEdition="32" Channel="Monthly" OfficeMgmtCOM="True" >
    <Product ID="O365ProPlusRetail">
      <Language ID="en-us" />
    </Product>
  </Add>  
  <Updates Enabled="True"  /> 
 </Configuration>
```

Also, we recommend that you set the value of the Enabled attribute to True in the Updates element. If you set the value of the Enabled attribute to False, Office 365 clients can still receive updates from Configuration Manager. But, users won't see any notifications when updates are pending.

Then, use the Office Deployment Tool and the configuration file to install, for example, Office 365 ProPlus. If you've already installed Office 365 clients to your users, you can run the Office Deployment Tool with the configuration file on those computers to update the configuration.

<a name="BKMK_GP"> </a>
### Method 2: Use Group Policy to enable Office 365 clients to receive updates from Configuration Manager

You can enable Configuration Manager to manage Office 365 client updates on specific computers by using Group Policy. This does the same thing as setting the OfficeMgmtCOM attribute to True in the configuration file used by the Office Deployment Tool. But, with Group Policy, you can apply this setting to multiple computers, an organizational unit (OU), or a domain.

To use Group Policy to enable this capability, you do the following:

- Download and install the [Administrative Template files (ADMX/ADML) for Office](https://www.microsoft.com/download/details.aspx?id=49030) from the Microsoft Download Center.

- Enable the **Office 365 Client Management** policy setting. You can find this policy setting under Computer Configuration\\Policies\\Administrative Templates\\Microsoft Office 2016 (Machine)\\Updates.

<a name="BKMK_Package"> </a>
## Contents of the Office 365 client update package for WSUS

The update package that Microsoft publishes to WSUS only appears in the WSUS catalog. It doesn't contain a copy of the updated version of Office that's on the Office CDN. Instead, it contains information that Configuration Manager needs to be able to download and distribute the updated version of Office.

The package contains a file named noop.exe. But, that file doesn't contain any code and shouldn't be downloaded or run.

For each update release there are different packages for each architecture and for each update channel. For example, for the May update release, there is a package for the 32-bit edition of the Monthly Channel and a package for the 64-bit edition of the Monthly Channel. In June, there will be two new packages for Monthly Channel, one for each architecture. The packages contain information so that Configuration Manager knows which packages are more recent than other packages. For example, that the June package supersedes the May package.

There aren't separate packages for the different Office 365 clients. For example, an update package for the 32-bit edition of the Monthly Channel has information about the Office 365 ProPlus, Visio Online Plan 2 (previously named Visio Pro for Office 365), Project Online Desktop Client, and Office 365 Business clients.


