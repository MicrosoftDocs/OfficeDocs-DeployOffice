---
title: "Deploy Microsoft 365 Apps from the cloud"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: conceptual
ms.service: o365-proplus-itpro
ms.collection: 
 - tier1
 - essentials-get-started
ms.localizationpriority: medium
recommendations: false
description: "Step-by-step instructions for deploying Microsoft 365 Apps to client computers from the Office Content Delivery Network (CDN) by using the Office Deployment Tool (ODT)."
ms.date: 04/29/2024
---

# Deploy Microsoft 365 Apps from the cloud

Follow the steps in this article to deploy Microsoft 365 Apps to client computers from the Office Content Delivery Network (CDN) by using the Office Deployment Tool (ODT). 

## Before you begin

This article is intended for administrators in managed environments where the account used to run the ODT has admin privileges on the client device. To reduce the complexity of deploying and managing the Microsoft 365 Apps, we recommend using Microsoft Intune. Check out [this video](https://youtu.be/fA8lcnRXmkI) and the [Intune documentation on Microsoft 365 Apps](/mem/intune/apps/apps-add-office365) to learn more.

If you haven't already, complete the [assessment](assess-microsoft-365-apps.md) and [planning](plan-microsoft-365-apps.md) phases for your Microsoft 365 Apps deployment. 

If you want to install Microsoft 365 Apps on a single device or small number of devices, we recommend reviewing [Download and install or reinstall Microsoft 365 or Office 2021 on a PC or Mac](https://support.microsoft.com/office/4414EAAF-0478-48BE-9C42-23ADC4716658) or [Use the Office offline installer](https://support.microsoft.com/office/f0a85fe7-118f-41cb-a791-d59cef96ad1c). 

## Best practices

The steps in this article are based on the following best practices:

- **Manage updates to Office automatically**, without any administrative overhead. For more information, see [Choose how to manage updates](plan-microsoft-365-apps.md#step-2---choose-how-to-manage-updates). If you want to manage updates for the Microsoft 365 Apps, we recommend using [cloud update](../admin-center/cloud-update.md).
- **Lead with Current Channel**: Deploy [Current Channel](../updates/overview-update-channels.md#current-channel-overview) to the majority of devices. This enables users to benefit from the latest features and product improvements as soon as possible. Create a second package for installing [Monthly Enterprise Channel](../updates/overview-update-channels.md#monthly-enterprise-channel-overview) for users who need more predictability and a fixed update cycle.

You can customize these options to match the requirements for your organization, including deploying additional or different update channels, and deploying Visio and Project. For more information, see [Customize your deployment](#customize-your-deployment).

## Step 1: Download the Office Deployment Tool 

You use the Office Deployment Tool (ODT) to deploy Office from the Office CDN. The deployment tool is run from the command line and uses a configuration file to determine what settings to apply when deploying Microsoft 365 Apps.

1. Create the shared folder **\\\\Server\Share\M365** and assign read permissions for your users. For details about how to create shared folders and assign permissions, see [Shared Folders](/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/cc770406(v=ws.11)).

2. Download the Office Deployment Tool from the [Microsoft Download Center](https://www.microsoft.com/download/details.aspx?id=49117) to \\\\Server\Share\M365. If you've already downloaded the ODT, make sure you have the latest version.

3. After downloading the file, run the self-extracting executable file, which contains the Office Deployment Tool executable (setup.exe) and sample configuration files.

## Step 2: Create a configuration file for Current Channel

To deploy Microsoft 365 Apps to the Current Channel group, you use a configuration file with the ODT. To create the configuration file, we recommend using the [Office Customization Tool](https://config.office.com/deploymentsettings). 

1. Go to [Office Customization Tool](https://config.office.com/deploymentsettings) and configure the desired settings for your Microsoft 365 Apps installation. We recommend the following options:
 - **Products and releases:** Microsoft 365 Apps. You can also include Visio and Project if you plan to deploy those apps to all devices.
 - **Update channel:** Choose **Current Channel** 
 - **Language:** Include all the language packs you plan to deploy. We recommend selecting **Match operating system** to automatically install the same languages that are in use by the operating system and any user on the client device. 
 - **Installation:** Select **Office Content Delivery Network (CDN)**. To silently install Office for your users, choose **Off** for **Show installation to user**.
 - **Update and upgrade:** To update your client devices automatically, choose **Office Content Delivery Network CDN** and **Automatically check for updates**. Choose to **Uninstall any MSI versions of Office, including Visio and Project**. You can also choose to install the same language as any removed MSI versions of Office.
 - **Licensing and activation:** To silently install Microsoft 365 Apps for your users, choose **On** for **Automatically accept the Microsoft Software License Terms**.
 - **Application preferences:** Define any settings you want to enable, including VBA macro notifications, default file locations, and default file formats
2. When you complete the configuration, click **Export** in the upper right of the page, and then save the file as **configuration-cc.xml** in the **\\\Server\Share\M365** folder.

For more details on how to use the Office Customization Tool, see [Overview of the Office Customization Tool](../admin-center/overview-office-customization-tool.md). For more information about the configuration options, see [Configuration options for the Office Deployment Tool](office-deployment-tool-configuration-options.md).

Note that the installation files and updates will come from Current Channel. For more details on what is included in the most recent release, see [Release information for updates to Microsoft 365 Apps](/officeupdates/release-notes-microsoft365-apps).

## Step 3: Create a configuration file for Monthly Enterprise Channel

Using the [Office Customization Tool](https://config.office.com/deploymentsettings), create the configuration file for the Monthly Enterprise Channel group.

1. Go to [Office Customization Tool](https://config.office.com/deploymentsettings) and configure the desired settings for your Microsoft 365 Apps installation. We recommend matching the options used in Step 2, except for the following change:
 - **Update channel:** Choose **Monthly Enterprise Channel**.
2. When you complete the configuration, click **Export** in the upper right of the page, and then save the file as **configuration-mec.xml** in the **\\\Server\Share\M365** folder.

## Step 4: Deploy to the Current Channel group

To deploy Microsoft 365 Apps, you provide commands that users can run from their client computers or you incorporate these commands into your installation automation. The commands run the ODT in configure mode and with a reference to the appropriate configuration file, which defines which version of Microsoft 365 Apps to install on the client computer. Users who run these commands must have local admin privileges and must have read permissions to the share (**\\\server\share\M365**).

From the client computers for the Current Channel group, run the following command from a command prompt with admin privileges:

 `\\Server\Share\M365\setup.exe /configure \\Server\Share\M365\configuration-cc.xml`

> [!NOTE]
> Most organizations will use this command as part of a batch file, script, or other process that automates the deployment. In those cases, you can run the script under elevated permissions, so the users will not need to have admin privileges on their computers. 

After running the command, the Microsoft 365 Apps installation should start immediately. If you run into problems, make sure you have the newest version of the ODT and your configuration file and command reference the correct location. You can also troubleshoot issues by reviewing the log file in the %temp% and C:\Windows\Temp folder.

## Step 5: Deploy to the Monthly Enterprise Channel group

If devices need a more predictable update schedule, those should be included in the Monthly Enterprise Channel group. To install Microsoft 365 Apps, run the following command from a command prompt with admin privileges:

 `\\Server\Share\M365\setup.exe /configure \\Server\Share\M365\configuration-mec.xml`

This command is the same as the Current Channel group, except that it references the configuration file for the Monthly Enterprise Channel group. After running the command, the installation should start immediately. 

## Customize your deployment

The steps in this article cover the standard best practice recommendations from Microsoft. This section covers common customizations.

### Build and deploy multiple packages to multiple deployment groups

If you want to deploy both the 32-bit and the 64-bit version in your environment, you can create additional installation packages. (Two different architectures can't be included in the same package.) For more information, see [Define your installation packages](plan-microsoft-365-apps.md#step-4---define-your-installation-packages). 

### Use different update channels

With Microsoft 365 Apps, you can control how frequently your users receive feature updates. To do so, you choose an update channel for your users. For more information, see [Overview of update channels for Microsoft 365 Apps](../updates/overview-update-channels.md).

In this article, we're using Current Channel, which provides users with the newest features as soon as they're ready. Also, quality updates and performance improvements are released more frequently to this update channel compared to others. We've created an installation package for Monthly Enterprise Channel for devices that should only receive one update per month.

A single Microsoft 365 Apps installation package can only include one type of update channel, so each new update channel requires an additional package.

### Deploy Visio and Project alongside the core apps

To deploy Visio and Project with Microsoft 365 Apps, you can include them as part of installation package. For more details on licensing and system requirements, see [Deployment guide for Visio](deployment-guide-for-visio.md) and [Deployment guide for Project](deployment-guide-for-project.md). If you're upgrading from an MSI-based Office, we also recommend using the [MSICondition attribute](office-deployment-tool-configuration-options.md#msicondition-attribute-part-of-product-element) in the configuration file.

## Related articles

[Configuration options for the Office Deployment Tool](office-deployment-tool-configuration-options.md)

[Overview of the Office Deployment Tool](overview-office-deployment-tool.md)

[Overview of the Office Customization Tool](../admin-center/overview-office-customization-tool.md)

[Deployment guide for Microsoft 365 Apps](deployment-guide-microsoft-365-apps.md)
