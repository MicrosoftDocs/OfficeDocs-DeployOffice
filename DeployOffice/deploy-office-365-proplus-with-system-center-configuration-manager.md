---
title: "Deploy Office 365 ProPlus with System Center Configuration Manager"
ms.author: jwhit
author: jwhit-MSFT
manager: laurawi
ms.audience: ITPro
ms.topic: article
ms.service: o365-proplus-itpro
localization_priority: Priority
ms.collection:
- Ent_O365
- M365-modern-desktop
ms.custom: Ent_Office_ProPlus
description: "This article gives step-by-step instructions for how to deploy Office 365 ProPlus with System Center Configuration Manager (Current Branch)."
---

# Deploy Office 365 ProPlus with System Center Configuration Manager (Current Branch)

Follow the steps in this article to deploy Office 365 ProPlus with System Center Configuration Manager (Current Branch). 

This article applies to deploying with Configuration Manager (Current Branch). For information on how to deploy Office 365 ProPlus with System Center 2012 R2 Configuration Manager, see [here](deploy-office-365-proplus-with-system-center-configuration-manager-2012R2.md).
    
## Overview

If your organization already uses Configuration Manager, we recommend upgrading to the Current Branch and using it to deploy Office 365 ProPlus. Configuration Manager scales for large environments and provides extensive control over installation, updates, and settings. It also has built-in features to make it easier and more efficient to deploy and manage Office, including:

- The Office Client Management dashboard, where you can deploy Office and monitor updates
- Integration of the Office Customization Tool for Click-to-Run, which means administrators always have access to the latest Click-to-Run deployment and management features
- Fully supported method of removing existing versions of Office from a client during deployment
- Deployment of application settings for Office, including VBA macro notifications, default file locations, and default file formats
- Peer cache, which can help with limited network capacity when deploying updates to devices in remote locations

The steps in this article covers these features and shows you how to implement our best practice recommendations. 

> [!NOTE] 
> When deploying with the Office Client Management dashboard and Office 365 Installer wizard, you must manage updates with Configuration Manager as well. For more details, see [Manage updates to Office 365 ProPlus with System Center Configuration Manager](manage-updates-to-office-365-proplus-with-system-center-configuration-manager.md).

## Before you begin

If you haven't already, complete the [assessment](assess-office-365-proplus.md) and [planning](plan-office-365-proplus.md) phases for your Office deployment. 

This article assumes you already use Configuration Manager. If you're not familiar with it, see  [Introduction to System Center Configuration Manager](https://docs.microsoft.com/sccm/core/understand/introduction). 

We recommend customers use [Microsoft Fastrack](https://fasttrack.microsoft.com/office) to help with their deployment. FastTrack onboarding and adoption resources and services are available with the purchase of 50 or more seats of Office 365 Enterprise and Office 365 Business SKUs, along with paid Government, Kiosk, and Nonprofit SKUs.  

## Best practices 

The steps in this article are based on the following best practices: 

- **Build two Office [applications](https://docs.microsoft.com/en-us/sccm/apps/understand/introduction-to-application-management) used for deployment**: One application uses Semi-Annual Channel for 64-bit and the other uses Semi-Annual Channel (Targeted) for 64-bit. Each application includes all the core Office apps. If you want to deploy the 32-bit version of Office instead, you can select that option when creating the application. To deploy both 64-bit and 32-bit, you can create additional applications. For more details, see [Define your source files](plan-office-365-proplus.md#step-4---define-your-source-files). 
- **Deploy to two [collections](https://docs.microsoft.com/en-us/sccm/core/clients/manage/collections/introduction-to-collections)**: One collection represents your pilot group, which receives the Semi-Annual Channel (Targeted). The other collection represents the broad group, which recieves the Semi-Annual Channel. For more details, see [Choose your update channels](plan-office-365-proplus.md#step-3---choose-your-update-channels). 

You can customize these options to match the requirements for your organization, including deploying to more than two collections, changing update channels, and deploying Visio and Project. For more detils, see [Customize your deployment](#customize-your-deployment).

## Step 1 - Review and update your Configuration Manager infrastructure 

From an infrastructure standpoint, deploying Office 365 ProPlus with Configuration Manager is similar to other software deployments and doesn't require any special customization. That said, the following options can make your Office deployment easier and more efficient: 

- Use the Current Branch of Configuration Manager. For more details, see [Which branch of Configuration Manager should I use?](https://docs.microsoft.com/sccm/core/understand/which-branch-should-i-use) 
- Enable peer cache on your client devices. Peer cache is a feature in the Current Branch of Configuration Manager that can help with limited network capacity when deploying updates to client devices in remote locations. For more details, see [Peer Cache for Configuration Manager clients](https://docs.microsoft.com/sccm/core/plan-design/hierarchy/client-peer-cache). Office can benefit both during initial deployment as well as later servicing with updates from peer cache.
- Deploy Office as an application using the Office Client Management dashboard and Office 365 Installer wizard in Configuration Manager. The dashboard and wizard enable all the Configuration Manager features designed for Office, including removal of existing versions of Office and the ability to define application preferences.

Make sure to complete the following requirements as well:

- Enable internet access for your client devices so they can activate Office 365 ProPlus after installation.   
- The computer running the Configuration Manager console requires IE 11 or greater and needs internet access via HTTPS port 443. The Office 365 Client Installation Wizard uses a Windows standard web browser API to open https://config.office.com. If an internet proxy is used, the user must be able to access this URL.
- Add the following sites to the Trusted Sites list if you have Enhanced Security Configuration enabled for IE (which is enabled by default on Windows Server): https://*.office.com and https://*.officeconfig.msocdn.com

## Step 2 - Review your collections 

The deployment groups that you defined in your deployment plan are represented as collections in Configuration Manager. For each deployment group, make sure you have a specific collection. Our standard best practices recommend two deployment groups:

- A pilot group that receives the Semi-Annual Channel (Targeted)
- A broad group that recieves the Semi-Annual Channel

In more complex deployments, you would use multiple deployment groups. For more details, see [Choose your update channels](plan-office-365-proplus.md#step-3---choose-your-update-channels). For more details on creating and managing collections, see [Introduction to collections in System Center Configuration Manager](https://docs.microsoft.com/sccm/core/clients/manage/collections/introduction-to-collections).  

## Step 3 - Create and deploy the Office application to the pilot group

The Office installation packages are represented as applications in Configuration Manager. For each deloyment group that you defined in your deployment plan, you create a unique Office application using the steps below. 

1. In the Configuration Manager console, navigate to **Software Library** > **Overview** > **Office 365 Client Management**.
2. Click **Office 365 Installer** in the upper-right pane. The Office 365 Client Installation Wizard opens.
3. On the **Application Settings** page, provide a name and description for the app, enter the download location for the files, and then click **Next**. The location must be specified as &#92;&#92;*server*&#92;*share*.
4. On the **Office Settings** page, click on **Go to the Office Customization Tool**, and configure the desired settings for your Office 365 installation. We recommend the following options:
    - **Software:** Office 365 ProPlus. You can also include Visio and Project if you plan to deploy those products.
      - **Update channel:** Choose **Semi-Annual Channel (Targeted)** for the installation package for the pilot group 
      - **Languages:** Include all the language packs you plan to deploy. 
      - **Upgrades:** Choose to automatically remove all previous MSI versions of Office. 
      - **Additional properties:** To silently install Office for your users, choose **Off** for the **Display level** and **On** for the **Automatically accept the EULA**.
      - **Application settings:** Define any Office settings you want to enable, including VBA macro notifications, default file locations, and default file formats
5. When you complete the configuration, click **Submit**. 
6. On the **Deployment** page, select **Yes** to deploy the application, and then click **Next**. 

 > [!NOTE] 
 > If you choose not to deploy the package in the wizard, you can deploy it later. To find the application, go to **Software Library** > **Application Management** > **Applications**.  For details on deploying an application, see [Create and deploy an application](https://docs.microsoft.com/sccm/apps/get-started/create-and-deploy-an-application). 

7. On the **General** page, choose a collection to deploy to, and then click **Next**. The collection should match the deployment group that receives the Office application you just defined. 
8. Configure the remainder of the wizard pages as you would for a typical application deployment. For details, see [Create and deploy an application](https://docs.microsoft.com/sccm/apps/get-started/create-and-deploy-an-application).
9. Complete the wizard.
10. You can deploy or edit the application from **Software Library** > **Overview** > **Application Management** > **Applications**.    

After you create and deploy Office 365 applications using the Office 365 Installer, Configuration Manager will not manage the Office updates by default. Instead, Office will update automatically. To enable Office 365 clients to receive updates from Configuration Manager, see [Manage updates to Office 365 ProPlus with System Center Configuration Manager](manage-updates-to-office-365-proplus-with-system-center-configuration-manager.md).

## Step 4 - Create and deploy the Office application to the broad group

After you've finished testing Office with the pilot group, you can repeat the above steps to create and deploy an Office application to the broad group. When defining the application, include the same options you did with the pilot group, except choose **Semi-Annual Channel** for the update channel. 

## Step 5: Review exit criteria 

To make sure you have deployed the correct Office package to your client devices, you can use the Office 365 Client Management dashboard. This dashboard provides charts for the following information: 

- Number of Office 365 clients 
- Office 365 client versions 
- Office 365 client languages 
- Office 365 client channels      

To view the Office 365 Client Management dashboard in the Configuration Manager console, go to **Software Library** > **Overview** > **Office 365 Client Management**. At the top of the dashboard, use the **Collection** drop-down setting to filter the dashboard data by members of a specific collection.  

In the dashboard, make sure you see the Office versions, languages, and update channels that you deployed for each collection. 

> [!IMPORTANT] 
> If the data is not displaying, you might need to enable hardware inventory and select the **Office 365 ProPlus Configurations** hardware inventory class. For more details, see [Configure hardware inventory](https://docs.microsoft.com/sccm/core/clients/manage/inventory/configure-hardware-inventory). 

## Customize your deployment
The steps in this article cover the standard best practice recommendations from Microsoft. This section covers the most common customizations to these best practices. If you want to build a customized deployment, we still recommend that you start with the Office 365 Installer. The wizard automates the creation of detection rules, deployment types, and fetching the required source and setup files. It's easier to start with the wizard and customize later than to start from scratch. 

### Build and deploy multiple packages to multiple deployment groups
If you want to deploy the 32-bit version of Office, you can create additional installation packages. (Two different architectures cannot be included in the same package.) For more details, see [Define your source files](plan-office-365-proplus.md#step-4---define-your-source-files). 

### Use different update channels for Office
With Office 365 ProPlus, you can control how frequently your users receive feature updates to their Office applications. To do so, you choose an update channel for your users. In this article, we recommend the Semi-Annual Channel (Targeted) for your pilot group and the Semi-Annual Channel for the rest of your organization. You can, however, choose the Monthly Channel, which provides users with the newest features of Office as soon as they're available. A single Office installation package can only include one type of channel, so each new channel requires an additional package. For more details, see [Overview of update channels for Office 365 ProPlus](overview-of-update-channels-for-office-365-proplus.md).

### Deploy Visio and Project alongside the core Office apps
To deploy Visio and Project with Office 365 ProPlus, you can include them as part of the Office application when building it in Configuration Manager. For more details on licensing and system requirements, see [Deployment guide for Visio](deployment-guide-for-visio.md) and [Deployment guide for Project](deployment-guide-for-project.md).

## Related topics

[Configuration options for the Office Deployment Tool](configuration-options-for-the-office-2016-deployment-tool.md)

[Overview of the Office Deployment Tool](overview-of-the-office-2016-deployment-tool.md)

[Overview of the Office Customization Tool](overview-of-the-office-customization-tool-for-click-to-run.md)

[Deployment guide for Office 365 ProPlus](deployment-guide-for-office-365-proplus.md)  


