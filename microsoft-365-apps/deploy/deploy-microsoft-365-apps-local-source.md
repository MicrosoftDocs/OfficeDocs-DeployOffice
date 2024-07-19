---
title: "Deploy Microsoft 365 Apps from a local source"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: conceptual
ms.service: o365-proplus-itpro
ms.collection: Tier1
ms.localizationpriority: medium
recommendations: false
description: "This article gives step-by-step instructions for how to use the Office Deployment Tool (ODT) to deploy Microsoft 365 Apps to client devices from a shared folder on your network."
ms.date: 04/29/2024
---

# Deploy Microsoft 365 Apps from a local source


Follow the steps in this article to deploy Microsoft 365 Apps to client computers from a shared folder on your network by using the Office Deployment Tool (ODT).  

## Before you begin

This article is intended for admins using ODT with admin rights on client devices. Admin rights can be obtained either through a software deployment tool or by allowing users to install with admin rights. For a more streamlined approach to deploying and managing Microsoft 365 Apps, Microsoft Intune or [Microsoft Configuration Manager](deploy-microsoft-365-apps-configuration-manager.md) are recommended. For more information, see [Explained - Your options for deploying Microsoft 365 Apps with Microsoft Intune](https://youtu.be/fA8lcnRXmkI) and  [Intune documentation on Microsoft 365 Apps](/mem/intune/apps/apps-add-office365).

If you haven't already, complete the [assessment](assess-microsoft-365-apps.md) and [planning](plan-microsoft-365-apps.md) phases for your Microsoft 365 Apps deployment. 

To install Microsoft 365 Apps on one or a few devices, check out [Download and install or reinstall Microsoft 365 or Office 2021 on a PC or Mac](https://support.microsoft.com/office/4414EAAF-0478-48BE-9C42-23ADC4716658) or [Use the Office offline installer](https://support.microsoft.com/office/f0a85fe7-118f-41cb-a791-d59cef96ad1c).

## Best practices 

Installing Microsoft 365 Apps directly from the cloud is recommended, using  [Microsoft Intune](/mem/intune/apps/apps-add-office365) or  [Microsoft Configuration Manager](deploy-microsoft-365-apps-configuration-manager.md). This method reduces the complexity of configuring the installation and having to the local shares on a regular base.

The steps in this article are based on the following approach:

- **Manage updates to Office automatically**, without any administrative overhead. For more information, see [Choose how to manage updates](plan-microsoft-365-apps.md#step-2---choose-how-to-manage-updates). To manage updates for the Microsoft 365 Apps, use [cloud update](../admin-center/cloud-update.md).
- **Lead with Current Channel**: Deploy [Current Channel](.../updates/overview-update-channels.md#current-channel-overview) to most devices to give users immediate access to the latest features and improvements. Create a second package for installing [Monthly Enterprise Channel](.../updates/overview-update-channels.md#monthly-enterprise-channel-overview) for users who need more predictability and a fixed update cycle.

You can customize these options to match your organization's requirements, including setting up various update channels, and deploying Visio and Project. For more information, see [Customize your deployment](#customize-your-deployment).

## Step 1: Create shared folders for installation files 

Because you're deploying Microsoft 365 Apps from a local source, you have to create folders to store the installation files. Create one parent folder and two child folders, one for the Current Channel sources, and one for the Monthly Enterprise Channel sources.

1. Create the following folders:

    - **\\\Server\Share\Microsoft365Apps**: Stores the ODT and the configuration files that define how to download and deploy Office.
    - **\\\Server\Share\Microsoft365Apps\Current**: Stores the Microsoft 365 Apps installation files from Current Channel.
    - **\\\Server\Share\Microsoft365Apps\MonthlyEnterprise**: Stores the Microsoft 365 Apps installation files from Monthly Enterprise Channel.

These folders include all the installation files you need to deploy.

2. Assign Read permissions for your users. To install Microsoft 365 Apps from a shared folder, users need Read permission for the folder, so you should assign Read permission to everyone. For details about how to create shared folders and assign permissions, see [Shared Folders](/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/cc770406(v=ws.11))

> [!NOTE]
> In this article, we have just one shared folder on the network, but many organizations make installation files available from multiple locations. Using multiple locations can help improve availability and minimize the effect on network bandwidth. For example, if some of your users are located in a branch office, you can create a shared folder in the branch office. Those users can then install Microsoft 365 Apps from the local network. You can use the Distributed File System (DFS) role service in Windows Server to create a network share that is replicated to multiple locations. For more information, see [DFS Management](/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/cc732006(v=ws.11)). 

## Step 2: Download the Office Deployment Tool

Download the latest version of the ODT from the [Microsoft Download Center](https://www.microsoft.com/download/details.aspx?id=49117) to \\\Server\Share\Microsoft365Apps.

After downloading the file, run the self-extracting executable file, which contains the Office Deployment Tool executable (setup.exe) and sample configuration files.

## Step 3: Create a configuration file for Current Channel

To download and deploy Microsoft 365 Apps to the first group, you use a configuration file with the ODT. To create the configuration file, we recommend using the [Office Customization Tool](https://config.office.com/deploymentsettings).

1. Go to [Office Customization Tool](https://config.office.com/deploymentsettings) and configure the desired settings for your Microsoft 365 Apps installation. We recommend the following options:
    - **Products and releases:** Microsoft 365 Apps. You can also include Visio and Project if you plan to deploy those apps to all devices.
    - **Update channel:** Choose **Current Channel** 
    - **Language:** Include all the language packs you plan to deploy. 
    - **Installation:** Select **Local Source**, and type "\\\Server\Share\Microsoft365Apps\Current" for the source path. To silently install Office for your users, choose **Off** for **Show installation to user**.
    - **Update and upgrade:** To update your client devices automatically, choose **Office Content Delivery Network CDN** and **Automatically check for updates**. Choose to **Uninstall any MSI versions of Office, including Visio and Project**. You can also choose to install the same language as any removed MSI versions of Office.
    - **Licensing and activation:** To silently install Microsoft 365 Apps for your users, choose **On** for **Automatically accept the Microsoft Software License Terms**.
    - **Application preferences:** Define any settings you want to enable, including VBA macro notifications, default file locations, and default file formats

> [!TIP]
> Each additional language specified in the configuration file will increase the size of the files which we will download later. Check [Right-sizing your initial deployment](../best-practices/right-sizing-initial-deployment.md) for tips on how offload storing language packs to the cloud.

2. When you complete the configuration, select **Export** in the upper right of the page, and then save the file as **configuration-cc.xml** in the **\\\Server\Share\Microsoft365Apps** folder.

For more information on how to use the Office Customization Tool, see [Overview of the Office Customization Tool](../admin-center/overview-office-customization-tool.md). For more information about the configuration options, see [Configuration options for the Office Deployment Tool](office-deployment-tool-configuration-options.md).

The installation files and updates come from Current Channel. For more information on what is included in the most recent release, see [Release information for updates to Microsoft 365 Apps](/officeupdates/release-notes-microsoft365-apps).

## Step 4: Create a configuration file for Monthly Enterprise Channel

Using the [Office Customization Tool](https://config.office.com/deploymentsettings), create the configuration file for the Monthly Enterprise Channel group.

1. Go to [Office Customization Tool](https://config.office.com/deploymentsettings) and configure the desired settings for your Microsoft 365 Apps installation. We recommend matching the options used in Step 3, except for the following changes:
    - **Update channel:** Choose **Monthly Enterprise Channel**.
    - **Installation:** Select **Local Source**, and type "\\\Server\Share\Microsoft365Apps\MonthlyEnterprise" for the source path.
 
2. When you complete the configuration, select **Export** in the upper right of the page, and then save the file as **configuration-mec.xml** in the **\\\Server\Share\Microsoft365Apps** folder.

## Step 5: Download the installation files for Current Channel

From a command prompt, run the ODT executable in download mode and with a reference to the Current Channel configuration file:

 `\\server\share\Microsoft365Apps\setup.exe /download \\server\share\Microsoft365Apps\configuration-cc.xml`

The files should begin downloading immediately. After running the command, go to **\\\server\share\Microsoft365Apps\CurrentChannel** and look for an Office folder with the appropriate files in it.

When you download Microsoft 365 Apps to a folder that already contains the same build, the ODT conserves your network bandwidth by downloading only the missing files. For example, if you use the ODT to download Microsoft 365 Apps in English and German to a folder that already contains Microsoft 365 Apps in English, only the German language pack is downloaded.

If you run into problems, make sure you have the newest version of the ODT and your configuration file and command reference the correct locations. You can also troubleshoot issues by reviewing the log file in the %temp% folder.

## Step 6: Download the installation files for Monthly Enterprise Channel

From a command prompt, run the ODT executable in download mode and with a reference to the Monthly Enterprise Channel configuration file:

 `\\server\share\Microsoft365Apps\setup.exe /download \\server\share\Microsoft365Apps\configuration-mec.xml`

The files should begin downloading immediately. After running the command, go to **\\\server\share\Microsoft365Apps\MonthlyEnterprise** and look for an Office folder with the appropriate files in it.

## Step 7: Deploy to the Current Channel group

To deploy Microsoft 365 Apps, you provide commands that users can run from their client computers, or you incorporate these commands into your installation automation. The commands run the ODT in configure mode and with a reference to the appropriate configuration file, which defines which version of Microsoft 365 Apps to install on the client computer. Users who run these commands must have local admin privileges and read permissions to the share (**\\\server\share\Microsoft365Apps**).

From the client computers for the Current Channel group, run the following command from a command prompt with admin privileges:

 `\\Server\Share\Microsoft365Apps\setup.exe /configure \\Server\Share\Microsoft365Apps\configuration-cc.xml`

> [!NOTE]
> Most organizations will use this command as part of a batch file, script, or other process that automates the deployment. In those cases, you can run the script under elevated permissions, so the users will not need to have admin privileges on their computers.

After you run the command, the Microsoft 365 Apps installation should start immediately. If you run into problems, make sure you have the newest version of the ODT and your configuration file and command reference the correct locations. You can also troubleshoot issues by reviewing the log file in the %temp% and C:\Windows\Temp folder.

## Step 8: Deploy to the Monthly Enterprise Channel group

If devices need a more predictable update schedule, they should be included in the Monthly Enterprise Channel group. To install Microsoft 365 Apps, run the following command from a command prompt with admin privileges:

 `\\Server\Share\Microsoft365Apps\setup.exe /configure \\Server\Share\Microsoft365Apps\configuration-mec.xml`

This command is the same as the Current Channel group, except that it references the configuration file for the Monthly Enterprise Channel group. After you run the command, the installation should start immediately. 

## Customize your deployment

The steps in this article cover the standard best practice recommendations from Microsoft. This section covers common customizations.

### Build and deploy multiple packages to multiple deployment groups

If you want to deploy both the 32-bit and the 64-bit version in your environment, you can create more installation packages. (Two different architectures can't be included in the same package.) For more information, see [Define your installation packages](plan-microsoft-365-apps.md#step-4---define-your-installation-packages). 

### Use different update channels

With Microsoft 365 Apps, you can control how frequently your users receive feature updates. To do so, you choose an update channel for your users. For more information, see [Overview of update channels for Microsoft 365 Apps](.../updates/overview-update-channels.md).

In this article, we're using Current Channel, which provides users with the newest features as soon as they're ready. Also, quality updates and performance improvements are released more frequently to this update channel compared to others. We created an installation package for Monthly Enterprise Channel for devices that should only receive one update per month.

A single Microsoft 365 Apps installation package can only include one type of update channel, so each new update channel requires an extra package.

### Deploy Visio and Project alongside the core apps

To deploy Visio and Project with Microsoft 365 Apps, you can include them as part of installation package. For more information on licensing and system requirements, see [Deployment guide for Visio](deployment-guide-for-visio.md) and [Deployment guide for Project](deployment-guide-for-project.md). If you're upgrading from an MSI-based Office, we also recommend using the [MSICondition attribute](office-deployment-tool-configuration-options.md#msicondition-attribute-part-of-product-element) in the configuration file. Adding Visio or Project to the configuration file doesn't require a redownload of the source files.

## Related articles

[Configuration options for the Office Deployment Tool](office-deployment-tool-configuration-options.md)

[Overview of the Office Deployment Tool](overview-office-deployment-tool.md)

[Overview of the Office Customization Tool](../admin-center/overview-office-customization-tool.md)

[Deployment guide for Microsoft 365 Apps](deployment-guide-microsoft-365-apps.md)

[Right-size your deployment](../best-practices/right-sizing-initial-deployment.md)
