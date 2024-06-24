---
title: "Manage updates to Microsoft 365 Apps with Microsoft Configuration Manager"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: conceptual
ms.service: o365-proplus-itpro
ms.collection: Tier1
ms.localizationpriority: medium
recommendations: true
description: "Provides admins with guidance on how to update Microsoft 365 Apps by using Microsoft Configuration Manager"
ms.date: 06/21/2024
---

# Manage updates to Microsoft 365 Apps with Microsoft Configuration Manager

Microsoft Configuration Manager has the ability to manage Office updates by using the Software Update management workflow. You can use Configuration Manager to update Microsoft 365 Apps for enterprise or Microsoft 365 Apps for business, and the subscription versions of the Project and Visio desktop apps.

When Microsoft publishes a new Office update to the Office Content Delivery Network (CDN), Microsoft simultaneously publishes an [update package](#contents-of-the-microsoft-365-apps-client-update-package-for-wsus) to Windows Server Update Services (WSUS). Then, Configuration Manager synchronizes the Office update from the WSUS catalog to the site server. Configuration Manager can then download the update and distribute it to distribution points selected by the administrator. The Configuration Manager desktop client then tells Office where to get the update and when to start the update installation process.

Here's an overview of the steps to enable Configuration Manager to manage Office updates:

1. [Review the requirements](#requirements-for-using-configuration-manager-to-manage-office-updates)

2. [Enable Configuration Manager to receive Microsoft 365 Apps client package notifications](#enable-configuration-manager-to-receive-microsoft-365-apps-client-package-notifications)

3. [Enable Microsoft 365 Apps clients to receive updates from Configuration Manager](#enable-microsoft-365-apps-clients-to-receive-updates-from-configuration-manager)

After you perform these steps, you can use the software update management capabilities of Configuration Manager to deploy the updates. For more information, see [Deploy software updates](/mem/configmgr/sum/deploy-use/deploy-software-updates).

## Requirements for using Configuration Manager to manage Office updates

To enable Configuration Manager to manage Office updates, you need the following:

- Microsoft Configuration Manager (current branch)

- Microsoft 365 Apps for enterprise, Microsoft 365 Apps for business, the subscription version of the Project desktop app, or the subscription version of the Visio desktop app.

- Supported update channel version for Office. For more information, see [Update history for Microsoft 365 Apps](/officeupdates/update-history-microsoft365-apps-by-date)

- Windows Server Update Services (WSUS) 4.0

    You can't use WSUS by itself to deploy these updates. You need to use WSUS with Configuration Manager

- The hierarchy's top-level WSUS server and the top-level Configuration Manager site server must have access to the following URLs: *.microsoft.com, *.msocdn.com, *.office.com, *.office.net, *.onmicrosoft.com, officecdn.microsoft.com, and officecdn.microsoft.com.edgesuite.net. For more information, see [Office 365 URLs and IP address ranges](/microsoft-365/enterprise/urls-and-ip-address-ranges#microsoft-365-common-and-office-online) and [Internet access requirements](/mem/configmgr/core/plan-design/network/internet-endpoints).

- On the computers that have the Office installed, the [Office COM object is enabled](#enable-microsoft-365-apps-clients-to-receive-updates-from-configuration-manager).

## Enable Configuration Manager to receive Microsoft 365 Apps client package notifications

To start, you need to configure Configuration Manager to receive notifications when Office update packages are available. To do that, use the following steps:

1. In the Configuration Manager console, choose **Site Configuration** > **Sites**, and then select your site server.

2. On the **Home** tab, in the **Settings** group, choose **Configure Site Components**, and then choose **Software Update Point**.

3. In the **Software Update Point Component Properties** dialog box, do the following:

   - On the **Products** tab, under **Office**, select **Microsoft 365 Apps/Office 2019/Office LTSC**.

   - On the **Classifications** tab, select **Updates**.

     You can have other check boxes selected in the **Products** and **Classifications** tabs. But, **Microsoft 365 Apps/Office 2019/Office LTSC** and **Updates** need to be selected for Configuration Manager to receive notifications when Office update packages are available.

4. Next, synchronize software updates. If you don't do that, you won't see the updates in the console and the updates won't be available to deploy. For more information about how to synchronize software updates, see [Introduction to software updates in Configuration Manager](/mem/configmgr/sum/understand/software-updates-introduction).

## Enable Microsoft 365 Apps clients to receive updates from Configuration Manager

For Configuration Manager to be able to manage Office updates, an Office COM object needs to be enabled on the computer where Office is installed. The Office COM object takes commands from Configuration Manager to download and install client updates.

You can enable the Office COM object by using client policy in Configuration Manager, Group Policy, or the Office Deployment Tool. If you use more than one method, the Group Policy setting determines the final configuration.

### Method 1: Use client policy in Configuration Manager to enable updates from Configuration Manager

To enable Configuration Manager to manage Office updates on specific computers by using client policy, do the following steps:

- In the Configuration Manager console, go to **Administration** > **Overview** > **Client Settings**.
- Open the client settings, choose **Software Updates** and select **Yes** for the **Enable management of the Office 365 Client Agent** setting.

For more information, see [About client settings in Configuration Manager](/mem/configmgr/core/clients/deploy/about-client-settings).

### Method 2: Use Group Policy to enable updates from Configuration Manager

You can enable Configuration Manager to manage Office updates on specific computers by using Group Policy. You can apply this setting to multiple computers, an organizational unit (OU), or a domain.

To use Group Policy, do the following steps:

- Download and install the [Administrative Template files (ADMX/ADML) for Office](https://www.microsoft.com/download/details.aspx?id=49030) from the Microsoft Download Center.

- Enable the *Management of Microsoft 365 Apps for enterprise* policy setting. You can find this policy setting under Computer Configuration\\Policies\\Administrative Templates\\Microsoft Office 2016 (Machine)\\Updates.

### Method 3: Use the Office Deployment Tool to enable updates from Configuration Manager

You can use the latest version of the [Office Deployment Tool](https://go.microsoft.com/fwlink/p/?LinkID=626065) to configure Office to receive updates from Configuration Manager.

To configure this capability, use a text editor, such as Notepad, to modify the configuration file for the Office Deployment Tool. In the Add element, include the OfficeMgmtCOM attribute, and set its value to True, as seen in the following example.

```xml
<Configuration>
  <Add OfficeClientEdition="32" Channel="Current" OfficeMgmtCOM="True" >
    <Product ID="O365ProPlusRetail">
      <Language ID="en-us" />
    </Product>
  </Add>  
  <Updates Enabled="True"  /> 
 </Configuration>
```

We recommend that you also set the value of the Enabled attribute to **True** in the Updates element, which is the default setting. When OfficeMgmtCOM and Updates element are both set to true, updates are delivered only by Configuration Manager. The scheduled task Office Automatic Updates 2.0, which is registered during Microsoft 365 Apps installation, must remain enabled. That task initiates product configuration tasks such as channel management.

## Enable Microsoft 365 Apps clients to receive updates from the Office CDN instead of Configuration Manager

If it meets your business and technical requirements, we recommend updating your client devices automatically from the Office CDN. To enable a device to receive updates from the Office CDN instead of from Configuration Manager, use one of the following methods:

### Method 1: Use client policy in Configuration Manager to enable updates from the CDN

- In the Configuration Manager console, go to **Administration** > **Overview** > **Client Settings**.
- Open the appropriate device settings to enable the client agent. For more information about default and custom client settings, see [How to configure client settings in Configuration Manager](/mem/configmgr/core/clients/deploy/configure-client-settings).
- Choose **Software Updates** and select **No** for the **Enable management of the Office 365 Client Agent setting**.

For more information, see [About client settings in Configuration Manager](/mem/configmgr/core/clients/deploy/about-client-settings).

### Method 2: Use Group Policy to enable updates from the CDN

- Download and install the [Administrative Template files (ADMX/ADML) for Office](https://www.microsoft.com/download/details.aspx?id=49030) from the Microsoft Download Center.

- Disable the *Management of Microsoft 365 Apps for enterprise* policy setting. You can find this policy setting under Computer Configuration\\Policies\\Administrative Templates\\Microsoft Office 2016 (Machine)\\Updates.

> [!IMPORTANT]
> The Microsoft Office Click-to-Run Service is responsible for registering and unregistering Office COM application during service startup. Change domain policy or Configuration Manager client settings require explicit **Disable** selection for Office COM to be successfully deregistered and restore default configuration. Toggling *Management of Microsoft 365 Apps for enterprise* via Group Policy or **Client Settings** for Configuration Manager from **Enabled** to **Not Configured** is not sufficient.

## Contents of the Microsoft 365 Apps client update package for WSUS

The update package that Microsoft publishes to WSUS only appears in the WSUS catalog. It doesn't contain a copy of the updated version of Office that's on the Office CDN. Instead, it contains information that Configuration Manager needs to be able to download and distribute the updated version of Office.

The package contains a file named noop.exe. But, that file doesn't contain any code and shouldn't be downloaded or run.

For each update release, there are different packages for each architecture and for each update channel. For example, for the May update release, there's a package for the 32-bit edition of Current Channel and a package for the 64-bit edition of Current Channel. In June, there are two new packages for Current Channel, one for each architecture. The packages contain information so that Configuration Manager knows which packages are more recent than other packages. For example, that the June package supersedes the May package.

There aren't separate packages for the different Office clients. For example, an update package for the 32-bit edition of Current Channel has information about Microsoft 365 Apps for enterprise and Microsoft 365 Apps for business, and the subscription versions of the Project and Visio desktop apps.
