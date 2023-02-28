---
title: "Deploy Microsoft 365 Apps with Microsoft Configuration Manager (current branch)"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: article
ms.service: o365-proplus-itpro
ms.collection: Tier1
ms.localizationpriority: medium
recommendations: false
description: "This article gives step-by-step instructions for how to deploy Microsoft 365 Apps with Microsoft Configuration Manager (current branch)."
ms.date: 03/01/2023
---

# Deploy Microsoft 365 Apps with Microsoft Configuration Manager (current branch)

Follow the steps in this article to deploy Microsoft 365 Apps to client computers from by using Microsoft Configuration Manager (current branch).

## Before you begin

This article is intended for administrators in managed environments. In order to reduce the complexity of deploying and managing the Microsoft 365 Apps, we recommend to use Microsoft Intune for deployment. Check out [this video](https://youtu.be/fA8lcnRXmkI) and the [Intune documentation](/mem/intune/apps/apps-add-office365) to learn more about deploying the Microsoft 365 Apps this way.

If you haven't already, complete the [assessment](assess-microsoft-365-apps.md) and [planning](plan-microsoft-365-apps.md) phases for your Microsoft 365 Apps deployment.

If you want to install Microsoft 365 Apps on a single device or small number of devices, we recommend reviewing [Download and install or reinstall Microsoft 365 or Office 2021 on a PC or Mac](https://support.microsoft.com/office/4414EAAF-0478-48BE-9C42-23ADC4716658) or [Use the Office offline installer](https://support.microsoft.com/office/f0a85fe7-118f-41cb-a791-d59cef96ad1c). 

## Best practices

The steps in this article are based on the following best practices for Microsoft Configuration Manager environments:

- **Build a Microsoft 365 Apps [applications](/mem/configmgr/apps/understand/introduction-to-application-management) using the built-in wizard**: We will use the built-in wizard to create the application and allow Configuration Manager to build the application sources for us.

- **Leverage dynamic [collections](/mem/configmgr/core/clients/manage/collections/introduction-to-collections)**: We will leverage a combination of static and  dynamically updated collections to leverage the automation capabilities of Configuration Manager and improve targeting of e.g. updates.

- **Right-sizing the deployment**: For multi-language scenarios, we will show how the size of the initial application package can be reduced to reduce load on the network.

You can customize these options to match the requirements for your organization, including deploying to additional collections, changing update channels, and deploying Visio and Project. For more information, see [Customize your deployment](#customize-your-deployment).

## Step 1 - Review and update your Configuration Manager infrastructure

From an infrastructure standpoint, deploying Microsoft 365 Apps with Configuration Manager is similar to other software deployments and doesn't require any special customization. That said, the following options can make your deployment easier and more efficient:

- Use the current branch of Configuration Manager. For more information, see [Which branch of Configuration Manager should I use?](/mem/configmgr/core/understand/which-branch-should-i-use).
- Enable peer cache on your client devices. Peer cache is a feature in the current branch of Configuration Manager that can help with limited network capacity when deploying to client devices in remote locations. For more information, see [Peer Cache for Configuration Manager clients](/mem/configmgr/core/plan-design/hierarchy/client-peer-cache). The Microsoft 365 Apps can benefit both during initial deployment as well as later servicing with updates from peer cache.

Make sure to complete the following requirements as well:

- The computer running the Configuration Manager console requires IE 11 or greater and needs internet access via HTTPS port 443. The Office 365 Client Installation Wizard uses a Windows standard web browser API to open https://config.office.com. If an internet proxy is used, the user must be able to access this URL.
- Add the following sites to the Trusted Sites list if you have Enhanced Security Configuration enabled for IE (which is enabled by default on Windows Server): https://\*.office.com and https://\*.officeconfig.msocdn.com.

## Step 2 - Review your collections

The deployment groups that you defined in your deployment plan are represented as collections in Configuration Manager. For each deployment group, make sure you have a specific collection. Our standard best practices recommend two deployment groups:

- A pilot group that receives Semi-Annual Enterprise Channel (Preview)
- A broad group that receives Semi-Annual Enterprise Channel

In more complex deployments, you would use multiple deployment groups. For more information, see [Choose your update channels](plan-microsoft-365-apps.md#step-3---choose-your-update-channels). For more details on creating and managing collections, see [Introduction to collections in Microsoft Configuration Manager](/mem/configmgr/core/clients/manage/collections/introduction-to-collections).

## Step 3 - Create and deploy the Office application to the pilot group

The Office installation packages are represented as applications in Configuration Manager. For each deployment group that you defined in your deployment plan, you create a unique Office application using the steps below.

1. In the Configuration Manager console, navigate to **Software Library** > **Overview** > **Office 365 Client Management**.
2. Select **Office 365 Installer** in the upper-right pane. The Office 365 Client Installation Wizard opens.
3. On the **Application Settings** page, provide a name and description for the app, enter the download location for the files, and then select **Next**. The location must be specified as &#92;&#92;*server*&#92;*share*.
4. On the **Office Settings** page, select on **Go to the Office Customization Tool**, and configure the desired settings for your Microsoft 365 Apps installation. We recommend the following options:
    - **Software:** Microsoft 365 Apps for enterprise (if you're licensed for it). You can also include Visio and Project if you plan to deploy those products.
      - **Update channel:** Choose **Semi-Annual Enterprise Channel (Preview)** for the installation package for the pilot group
      - **Languages:** Include all the language packs you plan to deploy.
      - **Upgrades:** Choose to automatically remove all previous MSI versions of Office.
      - **Additional properties:** To silently install Office for your users, choose **Off** for the **Display level** and **On** for the **Automatically accept the EULA**.
      - **Application settings:** Define any Office settings you want to enable, including VBA macro notifications, default file locations, and default file formats.
5. When you complete the configuration, select **Submit**.
6. On the **Deployment** page, select **Yes** to deploy the application, and then select **Next**.

 > [!NOTE]
 > If you choose not to deploy the package in the wizard, you can deploy it later. To find the application, go to **Software Library** > **Application Management** > **Applications**. For details on deploying an application, see [Create and deploy an application](/mem/configmgr/apps/get-started/create-and-deploy-an-application).

7. On the **General** page, choose a collection to deploy to, and then select **Next**. The collection should match the deployment group that receives the Office application you just defined.
8. Configure the remainder of the wizard pages as you would for a typical application deployment. For details, see [Create and deploy an application](/mem/configmgr/apps/get-started/create-and-deploy-an-application).
9. Complete the wizard.
After you create and deploy Microsoft 365 Apps using the Office 365 Installer, Configuration Manager won't manage the Office updates by default. Instead, Office will update automatically. To enable Microsoft 365 Apps to receive updates from Configuration Manager, see [Manage updates to Microsoft 365 Apps with Microsoft Configuration Manager](manage-microsoft-365-apps-updates-configuration-manager.md).

## Step 4 - Create and deploy the Office application to the broad group

After you've finished testing Office with the pilot group, you can repeat the above steps to create and deploy an Office application to the broad group. When defining the application, include the same options you did with the pilot group, except choose **Semi-Annual Enterprise Channel** for the update channel.


Step 5 - Configure Microsoft 365 Apps updates

> [!NOTE]
> When deploying with the Office Client Management dashboard and Office 365 Installer wizard, you must manage updates with Configuration Manager as well. For more information, see [Manage updates to Microsoft 365 Apps with Microsoft Configuration Manager](manage-microsoft-365-apps-updates-configuration-manager.md).



## Step 5 - Review exit criteria

To make sure you've deployed the correct Office package to your client devices, you can use the Office 365 Client Management dashboard. This dashboard provides charts for the following information:

- Number of Office 365 clients
- Office 365 client versions
- Office 365 client languages
- Office 365 client channels

To view the Office 365 Client Management dashboard in the Configuration Manager console, go to **Software Library** > **Overview** > **Office 365 Client Management**. At the top of the dashboard, use the **Collection** drop-down setting to filter the dashboard data by members of a specific collection.

In the dashboard, make sure you see the Office versions, languages, and update channels that you deployed for each collection.

> [!IMPORTANT]
> If the data is not displaying, you might need to enable hardware inventory and select the **Office 365 ProPlus Configurations** hardware inventory class. For more information, see [Configure hardware inventory](/mem/configmgr/core/clients/manage/inventory/configure-hardware-inventory).

## Customize your deployment

The steps in this article cover the standard best practice recommendations from Microsoft, if you've chosen to deploy Semi-Annual Enterprise Channel. This section covers the most common customizations to these best practices. If you want to build a customized deployment, we still recommend that you start with the Office 365 Installer. The wizard automates the creation of detection rules, deployment types, and fetching the required source and setup files. It's easier to start with the wizard and customize later than to start from scratch.

### Build and deploy multiple packages to multiple deployment groups

If you want to deploy the 32-bit version of Office, you can create additional installation packages. (Two different architectures can't be included in the same package.) For more information, see [Define your installation packages](plan-microsoft-365-apps.md#step-4---define-your-installation-packages).

### Use different update channels for Office

With Microsoft 365 Apps, you can control how frequently your users receive feature updates to their Office applications. To do so, you choose an update channel for your users. For more information, see [Overview of update channels for Microsoft 365 Apps](overview-update-channels.md).

In this article, we're using Semi-Annual Enterprise Channel (Preview) for your pilot group and Semi-Annual Enterprise Channel for the rest of your organization. You can, however, choose to deploy Current Channel, which provides users with the newest features of Office as soon as they're ready. In that scenario, you'd deploy Current Channel (Preview) to your pilot group.

A single Office installation package can only include one type of update channel, so each new update channel requires an additional package.

### Deploy Visio and Project alongside the core Office apps

To deploy Visio and Project with Microsoft 365 Apps, you can include them as part of the Office application when building it in Configuration Manager. For more information on licensing and system requirements, see [Deployment guide for Visio](deployment-guide-for-visio.md) and [Deployment guide for Project](deployment-guide-for-project.md). Note that when deploying with the Office 365 Installer Wizard in Configuration Manager, the same detection method is used for Office, Visio, Project and other products. We recommend updating the detection method so it's unique for each product. For more information, see [Detection Methods](/mem/configmgr/apps/deploy-use/create-applications#bkmk_dt-detect).

## Remove Office with Configuration Manager

To remove Office, do the following:

1. Review the description of the **Remove** attribute in the [ODT Reference](office-deployment-tool-configuration-options.md#remove-element). Create a matching **uninstall.xml** file and place it in the previously chosen download location.
2. Navigate to **Software Library** > **Overview** > **Application Management** > **Applications**, select the just created application, switch to the **Deployment Type** tab and edit the **Office 365 Default Deployment Type**.
3. Switch to the **Programs** tab and specify the following **Uninstall Program**: setup.exe /configure uninstall.xml
4. Choose **OK**, right-click the deployment type and select  **Update Content**. For more information, see [Deploy and manage content](/mem/configmgr/core/servers/deploy/configure/deploy-and-manage-content#bkmk_manage).

You can deploy or edit the application from **Software Library** > **Overview** > **Application Management** > **Applications**.

## Related articles

[Configuration options for the Office Deployment Tool](office-deployment-tool-configuration-options.md)

[Overview of the Office Deployment Tool](overview-office-deployment-tool.md)

[Overview of the Office Customization Tool](admincenter/overview-office-customization-tool.md)

[Deployment guide for Microsoft 365 Apps](deployment-guide-microsoft-365-apps.md)
