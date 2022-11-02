---
title: "Deploy Microsoft 365 Apps from the cloud"
ms.author: danbrown
author: DHB-MSFT
manager: dougeby
audience: ITPro
ms.topic: article
ms.service: o365-proplus-itpro
ms.localizationpriority: medium
ms.collection:
- Ent_O365
- M365-modern-desktop
- m365initiative-coredeploy
ms.custom: Ent_Office_ProPlus
recommendations: false
description: "This article gives step-by-step instructions for how to deploy Microsoft 365 Apps to client computers from the Office Content Delivery Network (CDN) by using the Office Deployment Tool (ODT)."
---

# Deploy Microsoft 365 Apps from the cloud

Follow the steps in this article to deploy Microsoft 365 Apps to client computers from the Office Content Delivery Network (CDN) by using the Office Deployment Tool (ODT). 

## Before you begin

Make sure your users have local admin privileges on their client devices. If that is not the case, then you should use your standard deployment tools and processes to install Office.

If you haven't already, complete the [assessment](assess-microsoft-365-apps.md) and [planning](plan-microsoft-365-apps.md) phases for your Office deployment. 

This article is intended for administrators in enterprise environments working with hundreds or thousands of computers. If you want to install Office on a single device or small number of devices, we recommend reviewing [Download and install or reinstall Microsoft 365 or Office 2021 on a PC or Mac](https://support.microsoft.com/office/4414EAAF-0478-48BE-9C42-23ADC4716658) or [Use the Office offline installer](https://support.microsoft.com/office/f0a85fe7-118f-41cb-a791-d59cef96ad1c). 

## Best practices

The steps in this article are based on the following best practices, if you've chosen to deploy Semi-Annual Enterprise Channel:

- **Manage updates to Office automatically**, without any administrative overhead. For more details, see [Choose how to manage updates](plan-microsoft-365-apps.md#step-2---choose-how-to-manage-updates).
- **Build two Office installation packages**: Semi-Annual Enterprise Channel for 64-bit and Semi-Annual Enterprise Channel (Preview) for 64-bit. Each installation package includes all the core Office apps. (If you want to deploy the 32-bit version of Office as well, you can create additional installation packages.) For more details, see [Define your source files](plan-microsoft-365-apps.md#step-4---define-your-source-files).
- **Deploy to two deployment groups**: a pilot group that receives Semi-Annual Enterprise Channel (Preview) and a broad group that receives Semi-Annual Enterprise Channel. Note that in this scenario, the installation packages and deployment groups match exactly. In more complex deployments, you might have multiple deployment groups that use the same installation package. For more details, see [Choose your update channels](plan-microsoft-365-apps.md#step-3---choose-your-update-channels). 

You can customize these options to match the requirements for your organization, including deploying to more than two groups, changing update channels, and deploying Visio and Project. For more details, see [Customize your deployment](#customize-your-deployment).

## Step 1: Download the Office Deployment Tool 

You use the Office Deployment Tool (ODT) to deploy Office from the Office CDN. The deployment tool is run from the command line and uses a configuration file to determine what settings to apply when deploying Office.

1. Create the shared folder **\\\\Server\Share\M365** and assign read permissions for your users. For details about how to create shared folders and assign permissions, see [Shared Folders](/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/cc770406(v=ws.11)).

2. Download the Office Deployment Tool from the [Microsoft Download Center](https://www.microsoft.com/download/details.aspx?id=49117) to \\\\Server\Share\M365. If you've already downloaded the ODT, make sure you have the latest version.

3. After downloading the file, run the self-extracting executable file, which contains the Office Deployment Tool executable (setup.exe) and a sample configuration file (configuration.xml).

## Step 2: Create a configuration file for the pilot group

To download and deploy Microsoft 365 Apps to the pilot group, you use a configuration file with the ODT. To create the configuration file, we recommend using the [Office Customization Tool](https://config.office.com/). 

1. Go to [Office Customization Tool](https://config.office.com/) and configure the desired settings for your Microsoft 365 Apps installation. We recommend the following options:
 - **Products:** Microsoft 365 Apps. You can also include Visio and Project if you plan to deploy those apps.
 - **Update channel:** Choose **Semi-Annual Enterprise Channel (Preview)** for the installation package for the pilot group 
 - **Language:** Include all the language packs you plan to deploy. We recommend selecting **Match operating system** to automatically install the same languages that are in use by the operating system and any user on the client device. We also recommend selecting **Fallback to the CDN** to use the Office CDN as a backup source for language packs. 
 - **Installation:** Select Office Content Delivery Network (CDN). 
 - **Updates:** To update your client devices automatically, choose **CDN** and **Automatically check for updates**.
 - **Upgrades:** Choose to automatically remove all previous MSI versions of Office. You can also choose to install the same language as any removed MSI versions of Office, but make sure to include those languages in your installation package.
 - **Additional properties:** To silently install Office for your users, choose **Off** for the **Display level** and **On** for the **Automatically accept the EULA**.
 - **Application preferences:** Define any Office settings you want to enable, including VBA macro notifications, default file locations, and default file formats
2. When you complete the configuration, click **Export** in the upper right of the page, and then save the file as **config-pilot-SECP.xml** in the **\\\Server\Share\M365** folder.

For more details on how to use the Office Customization Tool, see [Overview of the Office Customization Tool](admincenter/overview-office-customization-tool.md). For more information about the configuration options, see [Configuration options for the Office Deployment Tool](office-deployment-tool-configuration-options.md).

Note that the Office installation files and Office updates will come from Semi-Annual Enterprise Channel (Preview). For more details on the most recent version of Office based on the different update channels, see [Release information for updates to Microsoft 365 Apps](/officeupdates/release-notes-microsoft365-apps).

## Step 3: Create a configuration file for the broad group

Using the [Office Customization Tool](https://config.office.com/), create the configuration file for the broad group.

1. Go to [Office Customization Tool](https://config.office.com/) and configure the desired settings for your Microsoft 365 Apps installation. We recommend matching the same options as the pilot group in Step 2, except for the following change:
 - **Update channel:** Choose **Semi-Annual Enterprise Channel** for the installation package for the broad group 
2. When you complete the configuration, click **Export** in the upper right of the page, and then save the file as **config-broad-SEC.xml** in the **\\\Server\Share\M365** folder.

This configuration file is used to download Office installation files and then deploy them to the broad group. The settings are exactly the same as the first configuration file, except the update channel is set to Semi-Annual Enterprise Channel.

## Step 4: Deploy Office to the pilot group

To deploy Office, you provide commands that users can run from their client computers. The commands run the ODT in configure mode and with a reference to the appropriate configuration file, which defines which version of Office to install on the client computer. Users who run these commands must have local admin privileges and must have read permissions to the share (**\\\server\share\M365**).

From the client computers for the pilot group, run the following command from a command prompt with admin privileges:

 `\\Server\Share\M365\setup.exe /configure \\Server\Share\M365\config-pilot-SECP.xml`

> [!NOTE]
> Most organizations will use this command as part of a batch file, script, or other process that automates the deployment. In those cases, you can run the script under elevated permissions, so the users will not need to have admin privileges on their computers. 

After running the command, the Office installation should start immediately. If you run into problems, make sure you have the newest version of the ODT and make sure your configuration file and command reference the correct location. You can also troubleshoot issues by reviewing the log file in the %temp% folder.

After Office has deployed to the pilot group, you can test Office in your environment, particularly with your hardware and device drivers. For more details, see [Choose your update channels](plan-microsoft-365-apps.md#step-3---choose-your-update-channels). 

## Step 5: Deploy Office to the broad group

After you've finished testing Office with the pilot group, you can deploy it to the broad group. To do so, run the following command from a command prompt with admin privileges:

 `\\Server\Share\M365\setup.exe /configure \\Server\Share\M365\config-broad-SEC.xml`

This command is the same as the pilot group, except that it references the configuration file for the broad group. After running the command, the Office installation should start immediately. 

## Customize your deployment

The steps in this article cover the standard best practice recommendations from Microsoft, if you've chosen to deploy Semi-Annual Enterprise Channel. This section covers the most common customizations to these best practices.

### Build and deploy multiple packages to multiple deployment groups

If you want to deploy both the 32-bit and the 64-bit version of Office, you can create additional installation packages. (Two different architectures cannot be included in the same package.) For more details, see [Define your source files](plan-microsoft-365-apps.md#step-4---define-your-source-files). 

### Use different update channels for Office

With Microsoft 365 Apps, you can control how frequently your users receive feature updates to their Office applications. To do so, you choose an update channel for your users. For more information, see [Overview of update channels for Microsoft 365 Apps](overview-update-channels.md).

In this article, we're using Semi-Annual Enterprise Channel (Preview) for your pilot group and Semi-Annual Enterprise Channel for the rest of your organization. You can, however, choose to deploy Current Channel, which provides users with the newest features of Office as soon as they're ready. In that scenario, you'd deploy Current Channel (Preview) to your pilot group.

A single Office installation package can only include one type of update channel, so each new update channel requires an additional package.

### Deploy Visio and Project alongside the core Office apps

To deploy Visio and Project with Microsoft 365 Apps, you can include them as part of the Office application when building it in Configuration Manager. For more details on licensing and system requirements, see [Deployment guide for Visio](deployment-guide-for-visio.md) and [Deployment guide for Project](deployment-guide-for-project.md).

## Related topics

[Configuration options for the Office Deployment Tool](office-deployment-tool-configuration-options.md)

[Overview of the Office Deployment Tool](overview-office-deployment-tool.md)

[Overview of the Office Customization Tool](admincenter/overview-office-customization-tool.md)

[Deployment guide for Microsoft 365 Apps](deployment-guide-microsoft-365-apps.md)
