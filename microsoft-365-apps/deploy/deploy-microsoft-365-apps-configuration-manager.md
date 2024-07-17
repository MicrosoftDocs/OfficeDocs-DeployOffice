---
title: "Deploy Microsoft 365 Apps with Microsoft Configuration Manager (current branch)"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: conceptual
ms.service: o365-proplus-itpro
ms.collection: Tier1
ms.localizationpriority: medium
recommendations: false
description: "This article gives step-by-step instructions for how to deploy Microsoft 365 Apps with Microsoft Configuration Manager (current branch)."
ms.date: 04/29/2024
---

# Deploy Microsoft 365 Apps with Microsoft Configuration Manager (current branch)

Follow the steps in this article to deploy Microsoft 365 Apps to client computers by using Microsoft Configuration Manager (current branch).

## Before you begin

This article is intended for administrators in managed environments. To reduce the complexity of deploying and managing the Microsoft 365 Apps, we recommend using Microsoft Intune. Check out [this video](https://youtu.be/fA8lcnRXmkI) and the [Intune documentation on Microsoft 365 Apps](/mem/intune/apps/apps-add-office365) to learn more.

If you haven't already, complete the [assessment](assess-microsoft-365-apps.md) and [planning](plan-microsoft-365-apps.md) phases for your Microsoft 365 Apps deployment.

If you need to install Microsoft 365 Apps on a single device or just a few, you have two options to choose from. You can either follow the steps provided in [Download and install or reinstall Microsoft 365 or Office 2021 on a PC or Mac](https://support.microsoft.com/office/4414EAAF-0478-48BE-9C42-23ADC4716658) or [Use the Office offline installer](https://support.microsoft.com/office/f0a85fe7-118f-41cb-a791-d59cef96ad1c). 

## Best practices

The steps in this article are based on the following best practices for Microsoft Configuration Manager environments:

- **Use [Monthly Enterprise Channel](updates/overview-update-channels.md#monthly-enterprise-channel-overview)**: For Configuration Manager environments, this strikes a balance of getting the latest features and quality improvements quickly and having a predictable update schedule. While we generally recommend using Current Channel, this is often not feasible for on-premises-managed environments.

- **Build a Microsoft 365 Apps [applications](/mem/configmgr/apps/understand/introduction-to-application-management) using the built-in wizard**: We'll use the built-in wizard to create the application and allow Configuration Manager to build the application sources for us.

- **Leverage dynamic [collections](/mem/configmgr/core/clients/manage/collections/introduction-to-collections)**: We'll use a combination of static and  dynamically updated collections to apply the automation capabilities of Configuration Manager and improve targeting of, for example, updates.

You can customize these options for matching the requirements for your organization, including right-sizing your deployment, changing update channels, and deploying Visio and Project. For more information, see [Customize your deployment](#customize-your-deployment).

## Step 1: Review and update your Configuration Manager infrastructure

From an infrastructure standpoint, deploying Microsoft 365 Apps with Configuration Manager is like other software deployments and doesn't require any special customization. That said, the following options can make your deployment easier and more efficient:

- Use the current branch of Configuration Manager. For more information, see [Which branch of Configuration Manager should I use?](/mem/configmgr/core/understand/which-branch-should-i-use).
- Enable peer cache on your client devices. Peer cache is a feature in the current branch of Configuration Manager that can help with limited network capacity when deploying Microsoft 365 Apps in remote locations. For more information, see [Peer Cache for Configuration Manager clients](/mem/configmgr/core/plan-design/hierarchy/client-peer-cache). The Microsoft 365 Apps can benefit both during initial deployment as well as later servicing with updates from peer cache.

Make sure to complete the following requirements as well:

- The computer running the Configuration Manager console requires Microsoft Edge Webview2 runetime and needs internet access via HTTPS port 443. The Office 365 Client Installation Wizard uses a Windows standard web browser API to open https://config.office.com. If an internet proxy is used, the user must be able to access this URL.
- Add the following sites to the Trusted Sites list if you have Enhanced Security Configuration enabled for IE (which is enabled by default on Windows Server): https://\*.office.com and https://\*.officeconfig.msocdn.com.

## Step 2: Create collections

We recommend creating two sets of collections:

- One set for the initial deployment of Microsoft 365 Apps. This can be one or multiple collections.
- One set for the ongoing maintenance of Microsoft 365 Apps. These collections are used for assigning updates and deployed update channels.

For the initial deployment, create collections aligned to your deployment plan. You could go with just one group and add an initial set of devices to it, adding more devices later. Or create multiple collections (for example, four in a 5/15/40/40 split) and add collections to the application's deployment over time. You can merge these collections later to reduce management overhead. For more information on creating and managing collections, see [Introduction to collections in Microsoft Configuration Manager](/mem/configmgr/core/clients/manage/collections/introduction-to-collections).

For the ongoing maintenance, create collections as described in [Build dynamic collections for Microsoft 365 Apps with Configuration Manager](./best-practices/build-dynamic-lean-configuration-manager.md), except the collection to "Catch Devices on builds below a certain threshold". This leaves you with three sets of collections:

- One or multiple collections to easily identify how many devices are on a given update channel.
- One collection that captures all devices running Microsoft 365 Apps. This collection will be used to deploy the monthly updates.
- One collection that captures all devices that are on update channels you didn't catch above. This can help to identify and remediate configuration drift.

## Step 3: Create and deploy the Microsoft 365 Apps application

The Microsoft 365 Apps installation is represented as an application in Configuration Manager. We don't recommend using the legacy package mode for such installations.

Create a Microsoft 365 Apps application using the steps below.

1. In the Configuration Manager console, navigate to **Software Library** > **Overview** > **Office 365 Client Management**.
2. Select **Office 365 Installer** in the upper-right pane. The Office 365 Client Installation Wizard opens.
3. On the **Application Settings** page, provide a name and description for the app, enter the download location for the files, and then select **Next**. The location must be specified as &#92;&#92;*server*&#92;*share*.
4. On the **Office Settings** page, select **Go to the Office Customization Tool**, and configure the desired settings for your Microsoft 365 Apps installation. We recommend the following options:
    - **Software:** **Microsoft 365 Apps for enterprise** or **Microsoft 365 Apps for business** based on your licenses. You can also include Visio and Project if you plan to deploy those products to all users.
      - **Update channel:** Choose **Monthly Enterprise Channel**.
      - **Languages:** Include all the language packs you plan to deploy.
      - **Upgrades:** Choose to automatically remove all previous MSI versions of Office.
      - **Additional properties:** To silently install the application for your users, choose **Off** for the **Display level** and **On** for the **Automatically accept the Microsoft Software License Terms**.
      - **Application settings:** Define any settings you want to enable, including VBA macro notifications, default file locations, and default file formats.
5. When you've completed the configuration, select **Submit**.
6. On the **Deployment** page, select **Yes** to deploy the application, and then select **Next**.

 > [!NOTE]
 > If you choose not to deploy the package in the wizard, you can deploy it later. To find the application, go to **Software Library** > **Application Management** > **Applications**. For details on deploying an application, see [Create and deploy an application](/mem/configmgr/apps/get-started/create-and-deploy-an-application).

7. On the **General** page, choose a collection to deploy to, and then select **Next**.
8. Configure the remainder of the wizard pages as you would for a typical application deployment. For details, see [Create and deploy an application](/mem/configmgr/apps/get-started/create-and-deploy-an-application).
9. Complete the wizard.

## Step 4: Configure updates

Creating the application using the Office 365 Installer will automatically configure Microsoft 365 Apps to listen to the Configuration Manager for update instructions. Review and implement the steps outlined in [Manage updates to Microsoft 365 Apps with Microsoft Configuration Manager](updates/manage-microsoft-365-apps-updates-configuration-manager.md) to start offering updates through Configuration Manager. You can use the collection that catches all Microsoft 365 Apps installation you've created in step 2.

## Step 5: Monitor progress

If you've selected to deploy the application in the wizard, devices should start downloading and installing the Microsoft 365 Apps with the next evaluation cycle. Otherwise, you must manually deploy and distribute the application to devices and distribution points. After the deployment has been initiated, monitor the appropriate reports in Configuration Manager for progress and potential issues.

If you opted to use multiple collections for the initial deployment, don't forget to extend the deployment to these additional collections over time.

After devices have finished the installation of/upgrade to Microsoft 365 Apps, they'll report back to their Management Point with the next hardware inventory cycle. Based on a schedule, the dynamic collections will then start adding/removing devices based on the set criteria. This allows you to easily monitor the overall progress of the deployment as well as if all devices are in the intended update channels or if some configuration drift is happening.

You can also use the Office 365 Client Management dashboard. This dashboard provides charts for the following information:

- Number of Office 365 clients
- Office 365 client versions
- Office 365 client languages
- Office 365 client channels

To view the Office 365 Client Management dashboard in the Configuration Manager console, go to **Software Library** > **Overview** > **Office 365 Client Management**. At the top of the dashboard, use the **Collection** drop-down setting to filter the dashboard data by members of a specific collection.

In the dashboard, make sure you see the versions, languages, and update channels that you deployed for each collection.

> [!IMPORTANT]
> If the data is not displaying, you might need to enable hardware inventory and select the **Office 365 ProPlus Configurations** hardware inventory class. For more information, see [Configure hardware inventory](/mem/configmgr/core/clients/manage/inventory/configure-hardware-inventory).

## Customize your deployment

The steps in this article cover the standard best practice recommendations from Microsoft. This section covers the most common customizations to these best practices. If you want to build a customized deployment, we still recommend that you start with the Office 365 Installer. The wizard automates the creation of detection rules, deployment types, and fetching the required source and setup files. It's easier to start with the wizard and customize later than to start from scratch.

### Right-size the deployment for multi-language environments
If you support multiple languages in your environment and select to include them all in the application, it might grow in size substantially. As all devices download the application from a distribution point first and then run the setup, it might be that many devices are downloading the source files for language packs that aren't needed during installation. We've documented some best practices on [how to right-size your deployment](./best-practices/right-sizing-initial-deployment.md), finding a balance between which languages to include (to conserve internet bandwidth) and which to leave out (to conserve LAN/WAN traffic).

### Build and deploy multiple packages to multiple deployment groups

If you need to deploy the 32-bit version of Microsoft 365 Apps, you can create additional applications. Two different architectures (x86 and x64 in this case) can't be included in the same application. For more information, see [Define your installation packages](plan-microsoft-365-apps.md#step-4---define-your-installation-packages).

### Use different update channels

With Microsoft 365 Apps, you can control how frequently your users receive feature updates. To do so, you choose an update channel for your users. For more information, see [Overview of update channels for Microsoft 365 Apps](updates/overview-update-channels.md).

In this article, we're using Monthly Enterprise Channel, which provides users with new features on a monthly schedule. You can, however, choose to deploy Current Channel, which provides users with the newest features as soon as they're ready.

A single Microsoft 365 Apps installation package can only include one type of update channel, so each new update channel requires an additional package.

### Deploy Visio and Project alongside the core apps

To deploy Visio and Project with Microsoft 365 Apps, you can include them as part of the application when building it in Configuration Manager. For more information on licensing and system requirements, see [Deployment guide for Visio](deployment-guide-for-visio.md) and [Deployment guide for Project](deployment-guide-for-project.md). When deploying with the Office 365 Installer Wizard in Configuration Manager, the same detection method is used for Microsoft 365 Apps, Visio, Project, and other products. We recommend updating the detection method, so it's unique for each product. For more information, see [Detection Methods](/mem/configmgr/apps/deploy-use/create-applications#bkmk_dt-detect).

## Configure uninstall with Configuration Manager

To allow the application to be uninstalled, do the following:

1. Review the description of the **Remove** attribute in the [ODT Reference](office-deployment-tool-configuration-options.md#remove-element). Create a matching **uninstall.xml** file and place it in the previously chosen download location.
2. Navigate to **Software Library** > **Overview** > **Application Management** > **Applications**, select the created application, switch to the **Deployment Type** tab and edit the **Office 365 Default Deployment Type**.
3. Switch to the **Programs** tab and specify the following **Uninstall Program**: setup.exe /configure uninstall.xml
4. Choose **OK**, right-click the deployment type and select  **Update Content**. For more information, see [Deploy and manage content](/mem/configmgr/core/servers/deploy/configure/deploy-and-manage-content#bkmk_manage).

You can deploy or edit the application from **Software Library** > **Overview** > **Application Management** > **Applications**.

## Related articles

[Configuration options for the Office Deployment Tool](office-deployment-tool-configuration-options.md)

[Overview of the Office Deployment Tool](overview-office-deployment-tool.md)

[Overview of the Office Customization Tool](admin-center/overview-office-customization-tool.md)

[Deployment guide for Microsoft 365 Apps](deployment-guide-microsoft-365-apps.md)
