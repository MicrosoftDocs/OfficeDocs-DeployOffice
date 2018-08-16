---
title: "Deploy Office 365 ProPlus with System Center Configuration Manager"
ms.author: jwhit
author: jwhit-MSFT
manager: laurawi
ms.audience: ITPro
ms.topic: get-started-article
ms.service: o365-proplus-itpro
localization_priority: Priority
ms.collection:
- Ent_O365
- Strat_O365_ProPlus
ms.custom: Ent_Office_ProPlus
ms.assetid: 4dd6a023-0a5d-4dc9-9bad-ff70e01840b8
description: "This article gives step-by-step instructions for how to deploy Office 365 ProPlus with System Center Configuration Manager (Current Branch)."
---

# Deploy Office 365 ProPlus with System Center Configuration Manager (Current Branch)

Follow the steps in this article to deploy Office 365 ProPlus with System Center Configuration Manager (Current Branch). 
    
## Overview

If your organization already uses Configuration Manager, we recommend upgrading to the Current Branch and using it to deploy Office 365 ProPlus. Configuration Manager scales for large environments and provides extensive control over installation, updates, and settings. It also has built-in features to make it easier and more efficient to deploy and manage Office, including:

- The Office Client Management dashboard, where you can deploy Office and monitor updates
- Integration of the Office Customization Tool for Click-to-Run, which means administrators always have access to the latest Click-to-Run deployment and management features
- Intelligent language pack deployment, including automatically deploying the same langauge as the operating system
- Fully supported method of removing existing versions of Office from a client during deployment
- Deployment of application settings for Office, including VBA macro notifications, default file locations, and default file formats
- Peer cache, which can help with limited network capacity when deploying to devices in remote locations

The steps in this article covers these features and shows you how to implement our best practice recommendations. 

## Before you begin

If you haven't already, complete the [assessment](assess-office-365-proplus.md) and [planning](plan-office-365-proplus.md) phases for your Office deployment. 

This article assumes you already use Configuration Manager. If you're not familiar with it, see  [Introduction to System Center Configuration Manager](https://docs.microsoft.com/en-us/sccm/core/understand/introduction). 

## Best practices 

The steps in this article are based on the following best practices: 

- **Deploy Office with Configuration Manager (Current Branch)**. For more details, see [Choose how to deploy](plan-office-365-proplus.md#step-1---choose-how-to-deploy).
- **Manage updates to Office automatically**, without any adminstrative overhead. For more details, see [Choose how to manage updates](plan-office-365-proplus.md#step-2---choose-how-to-manage-updates). You can also manage updates to Office using Configuration Manager. For more details, see Manage updates with Configuration Manager [[add link]].
- **Build two Office installation packages**: One package uses Semi-Annual Channel for 32-bit and the other uses Semi-Annual Channel (Targeted) for 32-bit. Each installation package includes all the core Office apps. If you want to deploy the 64-bit version of Office, you can create additional installation packages. For more details, see [Define your source files](plan-office-365-proplus.md#step-4---define-your-source-files). You can also include Visio and Proect as part of your installation package. For more details see Deploy Visio and Project [[add link]].
- **Deploy to two deployment groups**: a pilot group that receives the Semi-Annual Channel (Targeted) and a broad group that recieves the Semi-Annual Channel. In this scenario, the installation packages and deployment groups match exactly. In more complex deployments, you might have multiple deployment groups that use the same installation package. For more details, see [Choose your update channels](plan-office-365-proplus.md#step-3---choose-your-update-channels). 

You can customize these steps by managing updates differently, building more installation packages, including Visio and Project, and deploying to more groups. These options are shown later in the article. 

## Step 1 - Review and update your Configuration Manager infrastructure 

From an infrastructure standpoint, deploying Office 365 ProPlus with Configuration Manager is similar to other software deployments and doesn't require any special customization. When using Configuration Manager, we recommend the following options: 

- Use the Current Branch of Configuration Manager. For more details, see [Which branch of Configuration Manager should I use?](https://docs.microsoft.com/en-us/sccm/core/understand/which-branch-should-i-use) 
- Enable peer cache on your clicent devices. Peer Cache is a feature in the Current Branch of Configuration Manager that can help with limited network capacity when deploying to  client devices in remote locations. For more details, see [Peer Cache for Configuration Manager clients](https://docs.microsoft.com/en-us/sccm/core/plan-design/hierarchy/client-peer-cache). 
- Deploy Office using the Office Client Management dashboard and Office 365 Installer wizard in Configuration Manager. The dashboard and wizard enable all the Configuration Manager features designed for Office, including intelligent language pack deployment and removal of existing versions of Office

Make sure to complete the following requirements as well:

- Enable internet access for your client devices so they can activate Office 365 ProPlus after installation.   
- The computer running the Configuration Manager console requires IE 11 or greater and needs internet access via HTTPS port 443. The Office 365 Client Installation Wizard uses a Windows standard web browser API to open https://config.office.com. If an internet proxy is used, the user must be able to access this URL.
- Add the following sites to the Trusted Sites list if you have Enhanced Security Configuration enabled for IE (which is enabled by default on Windows Server): https://*.office.com and https://*.officeconfig.msocdn.com

## Step 2 - Review your collections 

The deployment groups that you defined in your deployment plan are represented as collections in Configuration Manager. For each deloyment group, make sure you have a specific collection. Our standard best practices recommend two deployment groups:

- A pilot group that receives the Semi-Annual Channel (Targeted)
- A broad group that recieves the Semi-Annual Channel

In more complex deployments, you might have multiple deployment groups that use the same installation package. For more details, see [Choose your update channels](plan-office-365-proplus.md#step-3---choose-your-update-channels). For more details on creating and managing collections, see [Introduction to collections in System Center Configuration Manager](https://docs.microsoft.com/en-us/sccm/core/clients/manage/collections/introduction-to-collections).  

## Step 3 - Create and deploy the Office applications    

The installation packages are represented as applications in Configuration Manager. For each deloyment group that you defined in your deployment plan, you create a unique Office application using the steps below. For example, for example, if you have two deployment groups, you'll create two Office applications and deploy them to two different collections. 

1. In the Configuration Manager console, navigate to **Software Library** > **Overview** > **Office 365 Client Management**.
2. Click **Office 365 Installer** in the upper-right pane. The Office 365 Client Installation Wizard opens.
3. On the **Application Settings** page, provide a name and description for the app, enter the download location for the files, and then click **Next**. The location must be specified as &#92;&#92;*server*&#92;*share*.
4. On the **Office Settings** page, click on **Go to the Office Customization Tool**, and configure the desired settings for your Office 365 installation. We recommend the following options:
 - Software: Office 365 ProPlus. If you want to include Visio and Project in the installation package, select those as well. [[Fix language.]]
 - Languages: To install the same language as the operating system, choose Match Operating System. You can also select **Fallback to the CDN** to use the Office CDN as a backup source for language packs. [[Add details about how to set up multiple languages and making sure to include all possible languages.]] 
 - Installation channel: Choose **Semi-Annual Channel (Targeted)** for the installation package for the pilot group and **Semi-Annual Channel** for the broad group.
 - Updates: To manage updates to Office automatically, choose **Retrieve updates from the Office CDN** and make sure **Automatically check for updates** is selected. If you want to manage updates with Configuration Manager, choose that option. For more details, see Managing updates with Configuration Manager [[add link]].
 - Upgrades: Choose to automatically remove all previous MSI versions of Office and to automatically upgrade 2013 Click-to-Run versions of Office. You can also choose to install the same language as any removed MSI versions of Office, but make sure to include those languages in your installation package.
 - Additional properties: To silently install Office for your users, choose **Off** for the **Display level** and **On** for the **Automatically accept the EULA**.
 - Application settings: Define any Office settings you want to enable, including VBA macro notifications, default file locations, and default file formats
7. When you complete the configuration, click **Submit** in the upper right of the page. 
7. On the **Deployment** page, determine if you would like to deploy now or at a later time. If you choose to deploy later, you can find the application in **Software Library** < **Application Management** < **Applications**.  
8. Confirm the settings on the **Summary** page. 
9. Click **Next** then click **Close** once the Office 365 Client Installation Wizard completes. 

6. On the **Deployment** page, select **Yes** to deploy the application, and then click **Next**. 

> [!NOTE] 
> If you choose not to deploy the package in the wizard, you can deploy or edit the application later from **Software Library** > **Overview** > **Application Management** > **Applications**. For details on deploying an application, see [Create and deploy an application](/sccm/apps/get-started/create-and-deploy-an-application). 

8. On the **General** page, choose a collection to deploy to, and then click **Next**. The collection should match the deployment group that receives the Office application you just defined. 
9. On the **Content** page, choose distribution points to host the content, and then click **Next**.  
10. On the **Deployment Settings** page, choose how the software should be deployed, and then click **Next**.  
11. On the **Scheduling** page, specify when the application should be made available, and then click **Next**. 
12. On the **User Experience** page, choose the type of notifications and installation experience, and then click **Next**. 
13. On the **Summary** page, review the settings, and then click **Next**. 
14. On the **Alerts** page, choose the type of alerts you want, and then click **Next**. 
5. On the **Confirm the settings** page, review the application settings, and then click **Close**. 
16. Repeat this process for each Office application you want to create and deploy--so, once for each deployment group you defined. 


-> [!IMPORTANT]  
-> After you create and deploy Office 365 ProPlus using the Office 365 Installer, Configuration Manager will not manage the Office updates by default. If you want to enable Office 365 clients to receive updates from Configuration Manager, see [Manage updates to Office 365 ProPlus with System Center Configuration Manager](manage-updates-to-office-365-proplus-with-system-center-configuration-manager.md). 
-> [!IMPORTANT] 
-> FROM CHRIS: This is why I made the comment at the top of the doc about managing updates.  This is obviously a setting to set during deployment and if you want to manage updates yourself then there is a whole set of other practices to follow for that. 

## Review exit criteria 

To make sure you have deployed the correct Office package to your client devices, you can use the Office 365 Client Management dashboard. This dashboard provides charts for the following information: 

- Number of Office 365 clients 
- Office 365 client versions 
- Office 365 client languages 
- Office 365 client channels      

To view the Office 365 Client Management dashboard in the Configuration Manager console, go to **Software Library** > **Overview** > **Office 365 Client Management**. At the top of the dashboard, use the **Collection** drop-down setting to filter the dashboard data by members of a specific collection.  

In the dashboard, make sure you see the Office versions, languages, and update channels that you deployed for each collection. 

> [!IMPORTANT] 
> If the data is not displaying, you might need to enable hardware inventory and select the **Office 365 ProPlus Configurations** hardware inventory class. For more details, see [Configure hardware inventory](\sccm\core\clients\manage\configure-hardware-inventory). 

## Next steps 

[Manage updates to Office 365 ProPlus with System Center Configuration Manager](manage-updates-to-office-365-proplus-with-system-center-configuration-manager.md) 





***********************************************
  


## Deploy Office 365 ProPlus client devices 
1. In the Configuration Manager console, navigate to **Software Library** > **Overview** > **Office 365 Client Management**.
2. Click **Office 365 Installer** in the upper-right pane. The Office 365 Client Installation Wizard opens.
3. On the **Application Settings** page, provide a name and description for the app, enter the download location for the files, and then click **Next**. The location must be specified as &#92;&#92;*server*&#92;*share*.
4. On the **Import Client Settings** page, choose whether to import the Office 365 client settings from an existing XML configuration file or to manually specify the settings. Click **Next** when you are done.  

    When you have an existing configuration file, enter the location for the file and skip to step 7. You must specify the location in the form &#92;&#92;*server*&#92;*share*&#92;*filename*.XML.
    > [!IMPORTANT]    
    > The XML configuration file must contain only [languages supported by the Office 365 ProPlus client](/DeployOffice/office2016/language-identifiers-and-optionstate-id-values-in-office-2016).

5. On the **Client Products** page, select the Office 365 suite that you use. Select the applications that you want to include. Select any additional Office products that should be included, and then click **Next**.
6. On the **Client Settings** page, choose the settings to include, and then click **Next**.
7. On the **Deployment** page, choose whether to deploy the application, and then click **Next**. <br/>If you choose not to deploy the package in the wizard, skip to step 9.
8. Configure the remainder of the wizard pages as you would for a typical application deployment. For details, see [Create and deploy an application](/sccm/apps/get-started/create-and-deploy-an-application).
9. Complete the wizard.
10. You can deploy or edit the application from **Software Library** > **Overview** > **Application Management** > **Applications**.    

After you create and deploy Office 365 applications using the Office 365 Installer, Configuration Manager will not manage the Office updates by default. To enable Office 365 clients to receive updates from Configuration Manager, see [Deploy Office 365 updates with Configuration Manager](#deploy-office-365-updates-with-configuration-manager).

>[!NOTE]
>After you deploy Office 365 apps, you can create automatic deployment rules to maintain the apps. To create an automatic deployment rule for Office 365 apps, click **Create an ADR** from the Office 365 Client Management dashboard. Select **Office 365 Client** when you choose the product. For more information, see [Automatically deploy software updates](/sccm/sum/deploy-use/automatically-deploy-software-updates).

Manage updates to 
**********************************************************
NOTES TO INCLUDE
**********************************************************
## Change update channels 



**********************************************************
SCCM doc
**********************************************************

---
title: Manage Office 365 ProPlus updates
titleSuffix: "Configuration Manager"
description: "Configuration Manager synchronizes Office 365 client updates from the WSUS catalog to the site server to make updates available to deploy to clients."
author: aczechowski
ms.author: aaroncz
manager: dougeby
ms.date: 03/26/2018
ms.topic: conceptual
ms.prod: configuration-manager
ms.technology: configmgr-sum
ms.assetid: eac542eb-9aa1-4c63-b493-f80128e4e99b
---

# Manage Office 365 ProPlus with Configuration Manager

*Applies to: System Center Configuration Manager (Current Branch)*

Configuration Manager lets you manage Office 365 ProPlus apps in the following ways:

- [Office 365 Client Management dashboard](#office-365-client-management-dashboard): You can review Office 365 client information from the Office 365 Client Management dashboard. Beginning in Configuration Manager version 1802, the Office 365 client management dashboard displays a list of relevant devices when graph sections are selected. <!--1357281 -->

- [Deploy Office 365 apps](#deploy-office-365-apps): Beginning in version 1702, you can start the Office 365 Installer from the Office 365 Client Management dashboard to make the initial Office 365 App installation experience easier. The wizard lets you configure Office 365 installation settings, download files from Office Content Delivery Networks (CDNs), and create and deploy a script application with the content.    

- [Deploy Office 365 updates](#deploy-office-365-updates): You can manage Office 365 client updates by using the software update management workflow. When Microsoft publishes a new Office 365 client update to the Office Content Delivery Network (CDN), Microsoft also publishes an update package to Windows Server Update Services (WSUS). After Configuration Manager synchronizes the Office 365 client update from the WSUS catalog to the site server, the update is available to deploy to clients.    

- [Add languages for Office 365 update downloads](#add-languages-for-office-365-update-downloads): You can add support for Configuration Manager to download updates for any languages supported by Office 365. Meaning Configuration Manager does not have to support the language as long as Office 365 does. Prior to Configuration Manager version 1610 you must download and deploy updates in the same languages configured on Office 365 clients. 

- [Change the update channel](#change-the-update-channel-after-you-enable-office-365-clients-to-receive-updates-from-configuration-manager): You can use group policy to distribute a registry key value change to Office 365 clients to change the update channel.


## Office 365 Client Management dashboard  
The Office 365 Client Management dashboard provides charts for the following information:

- Number of Office 365 clients
- Office 365 client versions
- Office 365 client languages
- Office 365 client channels     
  For more information, see [Overview of update channels for Office 365 ProPlus](/DeployOffice/overview-of-update-channels-for-office-365-proplus).

To view the Office 365 Client Management dashboard in the Configuration Manager console, go to **Software Library** > **Overview** > **Office 365 Client Management**. At the top of the dashboard, use the **Collection** drop-down setting to filter the dashboard data by members of a specific collection. Beginning in Configuration Manager version 1802, the Office 365 client management dashboard displays a list of relevant devices when graph sections are selected.

### Display data in the Office 365 Client Management dashboard
The data that is displayed in the Office 365 Client Management dashboard comes from hardware inventory. Enable hardware inventory and select the **Office 365 ProPlus Configurations** hardware inventory class for data to display in the dashboard. 
#### To display data in the Office 365 Client Management dashboard
1. Enable hardware inventory, if it is not yet enabled. For details, see [Configure hardware inventory](/sccm/core/clients/manage/inventory/configure-hardware-inventory).
2. In the Configuration Manager console, navigate to **Administration** > **Client Settings** > **Default Client Settings**.  
3. On the **Home** tab, in the **Properties** group, click **Properties**.  
4. In the **Default Client Settings** dialog box, click **Hardware Inventory**.  
5. In the **Device Settings** list, click **Set Classes**.  
6. In the **Hardware Inventory Classes** dialog box, select **Office 365 ProPlus Configurations**.  
7.  Click **OK** to save your changes and close the **Hardware Inventory Classes** dialog box. <br/>The Office 365 Client Management dashboard starts displaying data as hardware inventory is reported.

## Deploy Office 365 apps  
Beginning in version 1702, start the Office 365 Installer from the Office 365 Client Management dashboard for the initial Office 365 App installation. The wizard lets you configure Office 365 installation settings, download files from Office Content Delivery Networks (CDNs), and create and deploy a script application for the files. Until Office 365 is installed on clients, Office 365 updates are not applicable.

For previous Configuration Manager versions, you must take the following steps to install Office 365 apps for the first time on clients:
- Download Office 365 Deployment Tool (ODT)
- Download the Office 365 installation source files, including all of the language packs that you need.
- Generate the Configuration.xml that specifies the correct Office version and channel.
- Create and deploy either a legacy package or a script application for clients to install the Office 365 apps.

### Requirements
- The computer that runs the Office 365 Installer must have Internet access.  
- The user that runs the Office 365 Installer must have **Read** and **Write** access to the content location share provided in the wizard.
- If you receive a 404 download error, copy the following files to the user %temp% folder:
  - [releasehistory.xml](http://officecdn.microsoft.com/pr/wsus/releasehistory.cab)
  - [o365client_32bit.xml](http://officecdn.microsoft.com/pr/wsus/ofl.cab)  





## Deploy Office 365 updates
Starting in Configuration Manager version 1706 Office 365 client updates have moved to the **Office 365 Client Management** >**Office 365 Updates** node. This move will not impact your current ADR configuration. 

Use the following steps to deploy Office 365 updates with Configuration Manager:

1.  [Verify the requirements](/DeployOffice/manage-updates-to-office-365-proplus-with-system-center-configuration-manager#requirements-for-using-configuration-manager-to-manage-office-365-client-updates) for using Configuration Manager to manage Office 365 client updates in the **Requirements for using Configuration Manager to manage Office 365 client updates** section of the article.  

2.  [Configure software update points](../get-started/configure-classifications-and-products.md) to synchronize the Office 365 client updates. Set **Updates** for the classification and select **Office 365 Client** for the product. Synchronize software updates after you configure the software update points to use the **Updates** classification.
3.  Enable Office 365 clients to receive updates from Configuration Manager. Use Configuration Manager client settings or group policy to enable the client.   

    **Method 1**: Beginning in Configuration Manager version 1606, you can use the Configuration Manager client setting to manage the Office 365 client agent. After you configure this setting and deploy Office 365 updates, the Configuration Manager client agent communicates with the Office 365 client agent to download the updates from a distribution point and install them. Configuration Manager takes inventory of Office 365 ProPlus Client settings.    

      1.  In the Configuration Manager console, click **Administration** > **Overview** > **Client Settings**.  

      2.  Open the appropriate device settings to enable the client agent. For more information about default and custom client settings, see [How to configure client settings in System Center Configuration Manager](../../core/clients/deploy/configure-client-settings.md).  

      3.  Click **Software Updates** and select **Yes** for the **Enable management of the Office 365 Client Agent** setting.  

    **Method 2**:
    [Enable Office 365 clients to receive updates](/DeployOffice/manage-updates-to-office-365-proplus-with-system-center-configuration-manager#BKMK_EnableClient) from Configuration Manager by using the Office Deployment Tool or Group Policy.  

4. [Deploy the Office 365 updates](deploy-software-updates.md) to clients.   

> [!Important]
> Prior to Configuration Manager version 1610 you must download and deploy updates in the same languages configured on Office 365 clients. For example, let's say you have an Office 365 client configured with the en-us and de-de languages. On the site server, you download and deploy only en-us content for an applicable Office 365 update. When the user starts the installation from Software Center for this update, the update hangs while downloading the content for de-de.   

## Restart behavior and client notifications for Office 365 updates
When you deploy an update to an Office 365 client, the restart behavior and client notifications are different depending on the version of Configuration Manager. The following table provides information about the end-user experience when the client receives an Office 365 update:

|Configuration Manager version |End-user experience|  
|----------------|---------------------|
|Prior to 1610|A restart flag is set and the update is installed after the computer restarts.|
|1610|Office 365 apps are shut down without warning before installing the update|
|1610 with update <br/>1702|A restart flag is set and the update is installed after the computer restarts.|
|1706|The client receives pop-up and in-app notifications, as well as a countdown dialog, prior to installing the update.|
|1802| The client receives pop-up and in-app notifications, as well as a countdown dialog, prior to installing the update. </br>If any Office 365 applications are running during an Office 365 client update enforcement, the Office applications will not be forced to close. Instead, the update install will return as requiring a system restart <!--510006-->|

> [!Important]
>
>In Configuration Manager version 1706, note the following details:
>
>- A notification icon displays in the notification area on the task bar for required apps where the deadline is within 48 hours in the future and the update content has been downloaded. 
>- A countdown dialog displays for required apps where the deadline is within 7.5 hours in the future and the update has been downloaded. The user can postpone the countdown dialog up to three times before the deadline. When postponed, the countdown displays again after two hours. If not postponed, there is a 30-minute countdown and update gets installed when the countdown expires.
>- A pop-up notification might not display until the user clicks the icon in the notification area. In addition, if the notification area has minimal space, the notification icon might not be visible unless the user opens or expands the notification area. 
>- The notification and countdown dialog could start while the user is not actively working on the device. For example, when the device is locked overnight it’s possible Office apps running on the device could be forced to close to install the update. Before closing the app, Office saves app data to prevent data loss. 
>- If the deadline is in the past or configured to start as soon as possible, running Office apps might be forced to close without notifications. 
>- If the user installs an Office update before the deadline, Configuration Manager verifies that the update is installed when the deadline is reached. If the update is not detected on the device, the update is installed. 
>- The in-app notification bar does not display on an Office app that is running before the update is downloaded. After the update is downloaded, the in-app notification displays only for newly opened apps.
>- For Office updates triggered by a service window or scheduled for non-business hours, it's possible that running Office apps might be forced to close to install the update without notifications. 



## Add languages for Office 365 update downloads
You can add support for Configuration Manager to download updates for any languages that are supported by Office 365, regardless of whether they are supported in Configuration Manager.    

> [!IMPORTANT]  
> Configuring additional Office 365 update languages is a site-wide setting. After you add the languages using the following procedure, all Office 365 updates are downloaded in those languages, as well as the languages that you select on the **Language Selection** page in the Download Software Updates or Deploy Software Updates wizards.

### To add support to download updates for additional languages
Use the following procedure on the software update point at the central administration site or stand-alone primary site.
1. From a command prompt, type *wbemtest* as an administrative user to open the Windows Management Instrumentation Tester.
2. Click **Connect**, and then type *root\sms\site_&lt;siteCode&gt;*.
3. Click **Query**, and then run the following query:
   *select &#42; from SMS_SCI_Component where componentname ="SMS_WSUS_CONFIGURATION_MANAGER"*  
![WMI query](..\media\1-wmiquery.png)
4. In the results pane, double-click the object with the site code for the central administration site or stand-alone primary site.
5. Select the **Props** property, click **Edit Property**, and then click **View Embedded**.
![Property editor](..\media\2-propeditor.png)
6. Starting at the first query result, open each object until you find the one with **AdditionalUpdateLanguagesForO365** for the **PropertyName** property.
7. Select **Value2** and click **Edit Property**.  
![Edit the Value2 property](..\media\3-queryresult.png)
8. Add additional languages to the **Value2** property and click **Save Property**. <br/> 
For example, pt-pt (for Portuguese - Portugal), af-za (for Afrikaans - South Africa), nn-no (for Norwegian (Nynorsk) - Norway), etc.  
![Add languages in Property Editor](..\media\4-props.png)  
9. Click **Close**, click **Close**, click **Save Property**, and click **Save Object** (if you click **Close** here the values are discarded). Click **Close**, and then click **Exit** to exit the Windows Management Instrumentation Tester.
10. In the Configuration Manager console, go to **Software Library** > **Overview** > **Office 365 Client Management** > **Office 365 Updates**.
11. Now when you download Office 365 updates, the updates are downloaded in the languages that you select in the wizard and configured in this procedure. To verify that the updates download in the correct languages, go to the package source for the update and look for files with the language code in the filename.  
![Filenames with additional languages](..\media\5-verification.png)

## Updating Office 365 during task sequences when Office 365 is installed in the base image
When you install an operating system where Office 365 is already installed in the image, it is possible that the update channel registry key value has the original install location. In this case, the update scan will not show any Office 365 client updates as applicable. There is a scheduled Office automatic updates task that runs several times a week. After that task runs, the update channel will point to the configured Office CDN URL and the scan will then show these updates as applicable. <!--510452-->

To ensure that the update channel is set so applicable updates will be found, do the following steps:
1. On a machine with the same version of Office 365 as the OS base image, open Task Scheduler (taskschd.msc) and identify the Office 365 automatic updates task. Typically, it is located under **Task Scheduler Library** >**Microsoft**>**Office**.
2. Right-click on the automatic updates task and select **Properties**.
3. Go to the **Actions** tab and click **Edit**. Copy the command and any arguments. 
4. In the Configuration Manager console, edit your task sequence.
5. Add a new **Run Command Line** step before the **Install Updates** step in the task sequence. 
6. Copy in the command and arguments that you gathered from the Office automatic updates scheduled task. 
7. Click **OK**. 

## Change the update channel after you enable Office 365 clients to receive updates from Configuration Manager
To change the update channel after you enable Office 365 clients to receive updates from Configuration Manager, use group policy to distribute a registry key value change to Office 365 clients. Change the **HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Office\ClickToRun\Configuration\CDNBaseUrl** registry key to use one of the following values:

- Monthly Channel <br/>
<i>(formerly Current Channel)</i>:  
  **CDNBaseUrl** = http&#58;//officecdn.microsoft.com/pr/492350f6-3a01-4f97-b9c0-c7c6ddf67d60

- Semi-Annual Channel <br/>
<i>(formerly Deferred Channel)</i>:  
  **CDNBaseUrl** = http&#58;//officecdn.microsoft.com/pr/7ffbc6bf-bc32-4f92-8982-f9dd17fd3114

- Monthly Channel (Targeted)<Br/>
 <i>(formerly First Release for Current Channel)</i>:  
  **CDNBaseUrl** = http&#58;//officecdn.microsoft.com/pr/64256afe-f5d9-4f86-8936-8840a6a4f5be

- Semi-Annual Channel (Targeted) <br/>
<i>(formerly First Release for Deferred Channel)</i>:  
  **CDNBaseUrl** = http&#58;//officecdn.microsoft.com/pr/b8f9b850-328d-4355-9145-c59439a0c4cf
<!--the channel names changed in Sept 2017- https://docs.microsoft.com/en-us/DeployOffice/overview-of-update-channels-for-office-365-proplus?ui=en-US&rs=en-US&ad=US>


<!--- You can create an Office 365 app without using the Office 365 Installation Wizard. To do this, you use the Office 2016 Deployment Tool (ODT) to download Office installation source files to a network share, generate Configure.xml that specifies the correct Office version and channel, and so on. Then, create an app for the files using the normal app management process.
> [!Note]
> The Office 365 Installation Wizard was introduced in Configuration Manager version 1702 and provides an easy way to create Office 365 apps.

- [Download the Office 2016 Deployment Tool](http://aka.ms/ODT2016) from the Microsoft Download Center.  
- Review the [configuration options for the Office Deployment Tool](https://technet.microsoft.com/library/jj219426.aspx).

You can create an application just as you would with any other application in Configuration Manager from **Software Library** > **Overview** > **Application Management** > **Applications**. For details, see [Create and deploy an application](/sccm/apps/get-started/create-and-deploy-an-application).
--->

<!--- ## Next steps
Use the Office 365 Client Management dashboard in Configuration Manager to review Office 365 client information and deploy Office 365 apps. For details, see [Manage Office 365 apps](manage-office-365-apps.md). --->

**********************************************************
ARCHIVE
**********************************************************





## Prepare the Office 365 ProPlus installation files to be deployed by Configuration Manager

To get started, download the Office 2016 version of the Office Deployment Tool from the [Microsoft Download Center](https://go.microsoft.com/fwlink/p/?LinkID=626065) to a shared folder on your organization's network. Then, use the Office Deployment Tool to [download the Office 365 ProPlus installation files](overview-of-the-office-2016-deployment-tool.md#BKMK_downloadinstallationfiles) from the Internet to the same shared folder.
  
Next, edit the configuration.xml, and review [Configuration options for the Office Deployment Tool](configuration-options-for-the-office-2016-deployment-tool.md) to decide how you want to install Office 365 ProPlus. The following example shows a configuration.xml that you can use to install the 32-bit, English version of Office 365 ProPlus.
  
```
<Configuration> 
   <Add OfficeClientEdition="32"> 
    <Product ID="O365ProPlusRetail"> 
     <Language ID="en-us" /> 
    </Product> 
   </Add>
   <Display Level="None" AcceptEULA="TRUE" />
</Configuration>
```

It's important that you don't include the SourcePath attribute in the Add section of your configuration.xml file. That's because Configuration Manager copies the installation files for an application into a folder under the Configuration Manager client cache folder, and the name of that subfolder is different for each computer. Because the folder name is different for each computer, you can't specify a SourcePath that will work for every computer that you're deploying Office 365 ProPlus to. Instead, leave out the SourcePath attribute. When a SourcePath isn't specified, the Office Deployment Tool automatically looks for the Office 365 ProPlus installation files in the same folder that the Office Deployment Tool is located. That's why we're including the Office Deployment Tool, the configuration.xml, and the Office 365 ProPlus installation files together in the same shared folder.
  
![Office 365 installation file folder](images/b556bbf7-f881-4d34-98fb-b96de5d6e0ec.png)
  
## Create an application for Office 365 ProPlus in Configuration Manager

The next step is to [create an application](https://go.microsoft.com/fwlink/p/?LinkId=535035) in Configuration Manager. An application contains the files and information that Configuration Manager needs to deploy software to a user's computer.
  
 **To create an application**
  
1. In the Configuration Manager console, choose **Software Library** > **Application Management** > **Applications**.
    
2. On the **Home** tab, in the **Create** group, choose ** Create Application**.
    
3. On the **General** page of the Create Application Wizard, select **Manually specify the application information**, and then choose **Next**.
    
4. On the **General information** page, enter a name for the application, enter any optional information, and then choose **Next.**
    
5. On the **Application Catalog** page, provide the information that's appropriate for your environment, and then choose **Next**.
    
6. On the **Deployment Types** page, choose **Next**. We'll add a deployment type later.
    
7. On the **Summary** page, review the settings you've chosen, and then choose **Next** to create the application.
    
8. After the application is created, on the **Completion** page, choose **Close**.
    
## Create a deployment type for the Office 365 ProPlus application in Configuration Manager
<a name="BKMK_DeployType"> </a>

An application in Configuration Manager must contain at least one [deployment type](https://go.microsoft.com/fwlink/p/?LinkId=535030). The deployment type contains the installation files for a software package as well as rules that specify when and how the software is deployed.
  
For the Office 365 ProPlus application, the deployment type includes the following:
  
- The path of the shared folder that contains the Office Deployment Tool, your configuration.xml file, and the Office 365 ProPlus installation files that you downloaded from the Internet. For example, \\\\server1\share1.
    
- The command line that gets the Office Deployment Tool to start the installation of Office 365 ProPlus.
    
- A [detection method](https://go.microsoft.com/fwlink/p/?LinkId=535032), which Configuration Manager uses to determine if Office 365 ProPlus is already installed on the user's computer.
    
 **To create a deployment type**
  
1. In the Configuration Manager console, choose **Software Library** > **Application Management** > **Applications**.
    
2. Select the Office 365 ProPlus application, and then on the **Home** tab, in the **Application** group, choose ** Create Deployment Type**.
    
3. On the **General** page of the Create Deployment Type Wizard, in the **Type** list, select **Script Installer**, and then choose **Next**.
    
4. On the **General Information** page, enter a name for the deployment type, enter any optional information, and then choose **Next.**
    
5. On the **Content** page, do the following:
    
  - In the **Content location** box, enter the network share where you put the Office Deployment Tool, your configuration.xml file, and the Office 365 ProPlus installation files that you downloaded from the Internet.
    
  - In the **Installation program** box, enter the following text: setup.exe /configure configuration.xml
    
    After you enter this information, choose **Next**.
    
6. On the **Detection Method** page, choose **Add Clause**.
    
7. In the **Detection Rule** dialog box, do the following:
    
  - In the **Setting Type** list, select **Registry**.
    
  - In the **Hive** list, select **HKEY_LOCAL_MACHINE**.
    
  - In the **Key** box, enter the following text: Software\Microsoft\Windows\CurrentVersion\Uninstall\O365ProPlusRetail - en-us
    
  - Select the **Use (Default) registry key value for detection** check box.
    
     ![Detection rule](images/c6565ea7-2326-490e-8e1f-c2daaa928193.png)
  
    After you enter this information, choose **OK**, and then on the **Detection Method** page, choose **Next**.
    
8. On the **User Experience** page, in the **Installation behavior** list, select **Install for system**, and then choose **Next**.
    
9. If you want to specify any requirements or dependencies for the deployment type, choose **Next** to go through those pages in the wizard. Otherwise, choose **Summary**.
    
10. On the **Summary** page, review the settings you've chosen, choose **Next**, and then choose **Close.**
    
## Distribute the Office 365 ProPlus application to distribution points in Configuration Manager
<a name="BKMK_Distribute"> </a>

After you create the Office 365 ProPlus application and configure its deployment type, the next step is to copy all the files needed by the application to the appropriate [distribution points](https://go.microsoft.com/fwlink/p/?LinkId=535033) in your Configuration Manager environment.
  
 **To distribute the application to distribution points**
  
1. In the Configuration Manager console, choose **Software Library** > **Application Management** > **Applications**.
    
2. Select the Office 365 ProPlus application, and then on the **Home** tab, in the **Deployment** group, choose ** Distribute Content**.
    
3. On the **General** page of the Distribute Content Wizard, choose **Next**, and then on the **Content** page, choose **Next**.
    
4. On the **Content Destination** page, choose **Add** > **Distribution Point**, select the appropriate distribution points, and then choose **OK**. Then, select **Next**.
    
5. On the **Summary** page, review the settings you've chosen, and then choose **Next**.
    
6. On the **Confirmation** page, check that the content was successfully assigned to the distribution points, and then choose **Close**.
    
7. To monitor the distribution, go to **Monitoring** > **Distribution Status** > **Content Status**.
    
8. Select the application, and then view the **Completion Statistics**.
    
     ![Completion Statistics](images/2023e38c-7c9d-4981-a336-ca676b81e430.png)
  
## Deploy the Office 365 ProPlus application in Configuration Manager
<a name="BKMK_Deploy"> </a>

After the files for the Office 365 ProPlus application are copied to the appropriate distribution points, the next step is to [deploy the application](https://go.microsoft.com/fwlink/p/?LinkId=535036). When you deploy the application, you specify which computers or users get the application and when.
  
 **To deploy the application**
  
1. In the Configuration Manager console, choose **Software Library** > **Application Management** > **Applications**.
    
2. Select the Office 365 ProPlus application, and then on the **Home** tab, in the **Deployment** group, choose **Deploy**.
    
3. On the **General** page of the Deploy Software Wizard, choose **Browse** for the **Collection** box, and then select which computers or users that you want to deploy Office 365 ProPlus to. After you've made your selection, choose **OK**, and then choose **Next**.
    
4. On the **Content** page, choose **Next** because we've already specified the distribution points for the application.
    
5. On the **Deployment Settings** page, in the **Purpose** list, select **Required**.
    
6. If you want to specify a schedule, configure the user experience, or create an alert, choose **Next** to go through those pages in the wizard. Otherwise, choose **Summary**.
    
7. On the **Summary** page, review the settings you've chosen, and then choose **Next**.
    
8. On the **Confirmation** page, check that the application was successfully deployed, and then choose **Close**.
    
After you deploy the application, a targeted computer becomes aware of the deployed application during the computer's next client policy polling cycle, which is once every sixty minutes by default. Then, the computer downloads the installation files for the application from a distribution point into the Configuration Manager client cache. The installation of Office 365 ProPlus takes place from the client cache and no additional files are downloaded from the network or from the Internet.
  
![Office installation status](images/3804d212-3bbc-4768-a90a-864fa69b1dfb.png)
  
## Related topics
- [Application Management in Configuration Manager](https://go.microsoft.com/fwlink/p/?LinkId=535034)
  
  
  
  

 
 
 
View  
144 DeployOffice/overview-deploy-office-365-proplus-with-Configuration-Manager.md 





@@ -1,144 +0,0 @@

 
---- 



 
-title: "Overview: deploy Office 365 ProPlus with System Center Configuration Manager" 



 
-ms.author: jwhit 



 
-author: jwhit-MSFT 



 
-manager: laurawi 



 
-ms.date: 1/31/2018 



 
-ms.audience: ITPro 



 
-ms.topic: get-started-article 



 
-ms.service: o365-administration 



 
-localization_priority: Normal 



 
-ms.collection: Ent_O365 



 
-ms.custom: 



 
-- Strat_O365_ProPlus 



 
-- Ent_Office_ProPlus 



 
-ms.assetid:  



 
-description: "This article gives an overview of deploying Office 365 ProPlus with System Center Configuration Manager, including reasons to choose Office 365 ProPlus and Configuration Manager,and how deployment and update management works with Configuration Manager and Office." 



 
---- 



 
- 



 
-# Overview on how to deploy Office 365 ProPlus with System Center Configuration Manager 



 
- 



 
-This article gives an overview of deploying Office 365 ProPlus with System Center Configuration Manager, including reasons to choose Office 365 ProPlus and Configuration Manager,and how deployment and update management works with Configuration Manager and Office. 



 
- 



 
-# Use Microsoft FastTrack to help with your deployment 



 
- 



 
-We recommend customers use [Microsoft Fastrack](https://fasttrack.microsoft.com/office) to help with their deployment. FastTrack onboarding and adoption resources and services are available with the purchase of 50 or more seats of Office 365 Enterprise and Office 365 Business SKUs, along with paid Government, Kiosk, and Nonprofit SKUs. Migration assistance for mail and files is available with the purchase of 500 or more seats. 



 
- 



 
-# How to plan, deploy, and manage Office 365 ProPlus 



 
- 



 
-We recommend customers  



 
-- Assess 



 
-- Plan 



 
-- Deploy 



 
-- Manage  



 
- 



 
-# Why Office 365 ProPlus? 



 
- 



 
-Office 365 ProPlus is a user-based service that allows people to access Office experiences on up to 5 PCs or Macs and on their mobile devices. Because Office 365 ProPlus is a delivered as a service, there are differences in how you deploy, license, and activate it. For more details about these differences, see the Office 365 ProPlus product page, Getting started guide for deploying Office 365 ProPlus, and Overview of Office 365 ProPlus. 



 
- 



 
-Office 365 ProPlus includes 



 
-the full Office applications 



 
-User-licensing (each user can install Office on up to 5 PCs, 5 tablets, and 5 mobile devices) 



 
-Subscription model 



 
-Regular feature updates 



 
-Use Office while update packages install in the background 



 
-Cloud-powered, intelligent features in the Office apps 



 
-Streamed to your deployment infrastructure or directd to PC 



 
- 



 
- 



 
-# Why System Center Configuration Manager (Current Brancy)? 



 
- 



 
-xxDeploy Office on your terms 



 
-Configure & Deliver Office applications across your environment 



 
-Advertised optional packages and applications  



 
- 



 
-Orchestrated Updates 



 
-Integration into Software Updates workflow (CM 1602) 



 
-Integrates with Automatic Deployment Rules (ADR) (CM 1606) 



 
- 



 
-Actionable Insights 



 
-Available Inventory & Reports 



 
- 



 
-Config Mgr minimum version 1602 



 
-Supported Office 365 client channel version: 



 
-Monthly Channel 



 
-Semi-Annual Channel 



 
-Semi-Annual Targeted Channel 



 
-WSUS minimum version 4.0 



 
-Office COM object enabled for Office 365 client 



 
-COM object receives commands from Config Mgr 



 
-Configurable through Config Mgr, ODT, or GPO 



 
- 



 
-Update process 



 
-Office publishes Office 365 client update packages through WSUS 



 
- 



 
-ConfigMgr identifies applicable desktops 



 
- 



 
-ConfigMgr refers to Office CDN for file list and downloads, and distributes required files to created update image 



 
- 



 
-ConfigMgr informs desktops to update using distribution points as source path 



 
- 



 
-PEER CACHE 



 
-What 



 
-Peer Cache is OS-independent, native ConfigMgr solution
providing peer-to-peer content sharing “in” and “across” subnets 



 
-Allows a ConfigMgr client to share it’s content cache with peers 



 
-Easy to configure, no management 



 
-Introduced in earlier release but enhancements in CM 1706 specific for the management of ProPlus updates across service channels 



 
- 



 
-HOW 



 
-Ensure you have CM 1706 



 
-Including updated CM agents on all clients 



 
-Opt in to pre-release features & enable site feature 



 
-Deploy client settings to select clients to configure them as Peer Cache Sources 



 
-Account for boundary group and subnet to maximize effectiveness 



 
- 



 
-# How deploying and update management work with Office and Configuration Manager  



 
- 



 
-xxxx 



 
-Self-installation - good for BYOD, can't customize packages, requires updates from the CDN, requires admin privileges on device 



 
-Managed deployment 



 
- 



 
- 



 
-xx 



 
- 



 
- 



 
- 



 
-# Manage Office 365 ProPlus with Configuration Manager 



 
- 



 
-*Applies to: System Center Configuration Manager (Current Branch)* 



 
- 



 
-Configuration Manager lets you manage Office 365 ProPlus apps in the following ways: 



 
- 



 
-- [Office 365 Client Management dashboard](#office-365-client-management-dashboard): Beginning in Configuration Manager version 1610, you can review Office 365 client information from the Office 365 Client Management dashboard.     



 
- 



 
-- [Deploy Office 365 apps](#deploy-office-365-apps): Beginning in version 1702, you can start the Office 365 Installer from the Office 365 Client Management dashboard to make the initial Office 365 App installation experience easier. The wizard lets you configure Office 365 installation settings, download files from Office Content Delivery Networks (CDNs), and create and deploy a script application with the content.     



 
- 



 
-- [Deploy Office 365 updates](#deploy-office-365-updates): Beginning in Configuration Manager version 1602, you can manage Office 365 client updates by using the software update management workflow. When Microsoft publishes a new Office 365 client update to the Office Content Delivery Network (CDN), Microsoft also publishes an update package to Windows Server Update Services (WSUS). After Configuration Manager synchronizes the Office 365 client update from the WSUS catalog to the site server, the update is available to deploy to clients.     



 
- 



 
-- [Add languages for Office 365 update downloads](#add-languages-for-office-365-update-downloads): Beginning in Configuration Manager version 1610, you can add support for Configuration Manager to download updates for any languages supported by Office 365. Meaning Configuration Manager does not have to support the language as long as Office 365 does.   



 
- 



 
-- [Change the update channel](#change-the-update-channel-after-you-enable-office-365-clients-to-receive-updates-from-configuration-manager): You can use group policy to distribute a registry key value change to Office 365 clients to change the update channel. 



 
- 



 
- 



 
-## Office 365 Client Management dashboard   



 
-The Office 365 Client Management dashboard provides charts for the following information: 



 
- 



 
-- Number of Office 365 clients 



 
-- Office 365 client versions 



 
-- Office 365 client languages 



 
-- Office 365 client channels      



 
-  For more information, see [Overview of update channels for Office 365 ProPlus](https://technet.microsoft.com/library/mt455210.aspx). 



 
- 



 
-To view the Office 365 Client Management dashboard in the Configuration Manager console, go to **Software Library** > **Overview** > **Office 365 Client Management**. At the top of the dashboard, use the **Collection** drop-down setting to filter the dashboard data by members of a specific collection. 



 
- 



 
-### Display data in the Office 365 Client Management dashboard 



 
-The data that is displayed in the Office 365 Client Management dashboard comes from hardware inventory. Enable hardware inventory and select the **Office 365 ProPlus Configurations** hardware inventory class for data to display in the dashboard. 



 
-#### To display data in the Office 365 Client Management dashboard 



 
-1. Enable hardware inventory, if it is not yet enabled. For details, see [Configure hardware inventory](\sccm\core\clients\manage\configure-hardware-inventory). 



 
-2. In the Configuration Manager console, navigate to **Administration** > **Client Settings** > **Default Client Settings**.   



 
-3. On the **Home** tab, in the **Properties** group, click **Properties**.   



 
-4. In the **Default Client Settings** dialog box, click **Hardware Inventory**.   



 
-5. In the **Device Settings** list, click **Set Classes**.   



 
-6. In the **Hardware Inventory Classes** dialog box, select **Office 365 ProPlus Configurations**.   



 
-7.  Click **OK** to save your changes and close the **Hardware Inventory Classes** dialog box. <br/>The Office 365 Client Management dashboard starts displaying data as hardware inventory is reported. 




