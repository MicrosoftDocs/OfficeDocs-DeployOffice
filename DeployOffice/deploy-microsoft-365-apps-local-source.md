---
title: "Deploy Microsoft 365 Apps from a local source"
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
ms.custom: Ent_Office_ProPlus
recommendations: false
description: "This article gives step-by-step instructions for how to use the Office Deployment Tool (ODT) to deploy Microsoft 365 Apps to client devices from a shared folder on your network."
---

# Deploy Microsoft 365 Apps from a local source


Follow the steps in this article to deploy Microsoft 365 Apps to client computers from a shared folder on your network by using the Office Deployment Tool (ODT).  

## Before you begin

Make sure your users have local admin privileges on their client devices. If that is not the case, then you should use your organization's standard deployment tools and processes to install Office.

If you haven't already, complete the [assessment](assess-microsoft-365-apps.md) and [planning](plan-microsoft-365-apps.md) phases for your Office deployment. 

This article is intended for administrators in enterprise environments working with hundreds or thousands of computers. If you want to install Office on a single device or small number of devices, we recommend reviewing [Download and install or reinstall Microsoft 365 or Office 2021 on a PC or Mac](https://support.microsoft.com/office/4414EAAF-0478-48BE-9C42-23ADC4716658) or [Use the Office offline installer](https://support.microsoft.com/office/f0a85fe7-118f-41cb-a791-d59cef96ad1c). 

## Best practices 

The steps in this article are based on the following best practices, if you've chosen to deploy Semi-Annual Enterprise Channel:

- **Manage updates to Office automatically**, without any administrative overhead. For more details, see [Choose how to manage updates](plan-microsoft-365-apps.md#step-2---choose-how-to-manage-updates). (If you want to manage updates from a local source, you need to change the configuration files. For more details, see [configuring updates](office-deployment-tool-configuration-options.md#updates-element)). 
- **Build two Office installation packages**: One package uses Semi-Annual Enterprise Channel for 64-bit and the other uses Semi-Annual Enterprise Channel (Preview) for 64-bit. Each installation package includes all the core Office apps. If you want to deploy the 32-bit version of Office instead, you can select that option when creating the installation package. To deploy both versions, you create additional installation packages. For more details, see [Define your source files](plan-microsoft-365-apps.md#step-4---define-your-source-files). 
- **Deploy to two deployment groups**: a pilot group that receives Semi-Annual Enterprise Channel (Preview) and a broad group that receives Semi-Annual Enterprise Channel. For more details, see [Choose your update channels](plan-microsoft-365-apps.md#step-3---choose-your-update-channels). 

You can customize these options to match the requirements for your organization, including deploying to more than two groups, changing update channels, and deploying Visio and Project. For more details, see [Customize your deployment](#customize-your-deployment).

## Step 1: Create shared folders for Office installation files 

Because you're deploying Microsoft 365 Apps from a local source, you have to create folders to store the Office installation files. You'll create one parent folder and two child folders, one for the pilot group, with the version of Office from Semi-Annual Enterprise Channel (Preview), and one for the broad group, with version of Office from Semi-Annual Enterprise Channel. This structure is similar to the one that the Office Content Delivery Network (CDN) uses.

1. Create the following folders:

    - **\\\Server\Share\M365**: Stores the ODT and the configuration files that define how to download and deploy Office.
    - **\\\Server\Share\M365\SECP**: Stores the Microsoft 365 Apps installation files from Semi-Annual Enterprise Channel (Preview).
    - **\\\Server\Share\M365\SEC**: Stores the Microsoft 365 Apps installation files from Semi-Annual Enterprise Channel.

 These folders will include all the Office installation files you need to deploy. 

2. Assign Read permissions for your users. Installing Office from a shared folder requires only that the user have Read permission for that folder, so you should assign Read permission to everyone. For details about how to create shared folders and assign permissions, see [Shared Folders](/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/cc770406(v=ws.11))

> [!NOTE]
> In this article, we have just one shared folder on the network, but many organizations make the Office installation files available from multiple locations. Using multiple locations can help improve availability and minimize the effect on network bandwidth. For example, if some of your users are located in a branch office, you can create a shared folder in the branch office. Those users can then install Office from the local network. You can use the Distributed File System (DFS) role service in Windows Server to create a network share that is replicated to multiple locations. For more information, see [DFS Management](/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/cc732006(v=ws.11)). 

## Step 2: Download the Office Deployment Tool

Download the ODT from the [Microsoft Download Center](https://www.microsoft.com/download/details.aspx?id=49117) to \\\Server\Share\M365. If you've already downloaded the ODT, make sure you have the latest version.

After downloading the file, run the self-extracting executable file, which contains the ODT executable (setup.exe) and a sample configuration file (configuration.xml).

## Step 3: Create a configuration file for the pilot group

To download and deploy Microsoft 365 Apps to the pilot group, you use a configuration file with the ODT. To create the configuration file, we recommend using the [Office Customization Tool](https://config.office.com/). 

1. Go to [Office Customization Tool](https://config.office.com/) and configure the desired settings for your Microsoft 365 Apps installation. We recommend the following options:
 - **Products:** Microsoft 365 Apps. You can also include Visio and Project if you plan to deploy those apps.
 - **Update channel:** Choose **Semi-Annual Enterprise Channel (Preview)** for the installation package for the pilot group 
 - **Language:** Include all the language packs you plan to deploy. We recommend selecting **Match operating system** to automatically install the same languages that are in use by the operating system and any user on the client device. We also recommend selecting **Fallback to the CDN** to use the Office CDN as a backup source for language packs. 
 - **Installation:** Select Local source, and type "\\\Server\Share\M365\SECP" for the source path. Office will be downloaded to and then installed from **\\\server\share\M365\SECP** on your network 
 - **Updates:** To update your client devices automatically, choose **CDN** and **Automatically check for updates**.
 - **Upgrades:** Choose to automatically remove all previous MSI versions of Office. You can also choose to install the same language as any removed MSI versions of Office, but make sure to include those languages in your installation package.
 - **Additional properties:** To silently install Office for your users, choose **Off** for the **Display level** and **On** for the **Automatically accept the EULA**.
 - **Application preferences:** Define any Office settings you want to enable, including VBA macro notifications, default file locations, and default file formats
2. When you complete the configuration, click **Export** in the upper right of the page, and then save the file as **config-pilot-SECP.xml** in the **\\\Server\Share\M365** folder.

For more details on how to use the Office Customization Tool, see [Overview of the Office Customization Tool](admincenter/overview-office-customization-tool.md). For more information about the configuration options, see [Configuration options for the Office Deployment Tool](office-deployment-tool-configuration-options.md).

Note that the Office installation files and Office updates will come from Semi-Annual Enterprise Channel (Preview). For more details on the most recent version of Office based on the different update channels, see [Release information for updates to Microsoft 365 Apps](/officeupdates/release-notes-microsoft365-apps).

## Step 4: Create a configuration file for the broad group

Using the [Office Customization Tool](https://config.office.com/), create the configuration file for the broad group.

1. Go to [Office Customization Tool](https://config.office.com/) and configure the desired settings for your Microsoft 365 Apps installation. We recommend matching the same options as the pilot group in Step 3, except for the following changes:
 - **Update channel:** Choose **Semi-Annual Enterprise Channel** for the installation package for the pilot group 
 - **Installation:** Select Local source, and type "\\\Server\Share\M365\SEC" for the source path. Office will be downloaded to and then installed from **\\\server\share\M365\SEC** on your network 
2. When you complete the configuration, click **Export** in the upper right of the page, and then save the file as **config-broad-SEC.xml** in the **\\\Server\Share\M365** folder.

This configuration file is used to download Office installation files and then deploy them to the broad group. The settings are exactly the same as the first configuration file, except the source path points to a different folder (SAC), and the update channel is set to Semi-Annual Enterprise Channel.

## Step 5: Download the Office installation package for the pilot group

From a command prompt, run the ODT executable in download mode and with a reference to the configuration file for the pilot group:

 `\\server\share\M365\setup.exe /download \\server\share\M365\config-pilot-SECP.xml`

The files should begin downloading immediately. After running the command, go to **\\\server\share\M365\SECP**  and look for an Office folder with the appropriate files in it.

Note that when you download Office to a folder that already contains that version of Office, the ODT will conserve your network bandwidth by downloading only the missing files. For example, if you use the ODT to download Office in English and German to a folder that already contains Office in English, only the German language pack will be downloaded.

If you run into problems, make sure you have the newest version of the ODT and make sure your configuration file and command reference the correct location. You can also troubleshoot issues by reviewing the log file in the %temp% folder.

## Step 6: Download the Office installation package for the broad group

From a command prompt, run the ODT executable in download mode and with a reference to the configuration file for the broad group:

 `\\server\share\M365\setup.exe /download \\server\share\M365\config-broad-SEC.xml`

The files should begin downloading immediately. After running the command, go to **\\\server\share\M365\SEC** and look for an Office folder with the appropriate files in it.

## Step 7: Deploy Office to the pilot group

To deploy Office, we'll provide commands that users can run from their client computers. The commands run the ODT in configure mode and with a reference to the appropriate configuration file, which defines which version of Office to install on the client computer. Users who run these commands must have local admin privileges on their computer and must have read permissions to the share (**\\\server\share\M365**).

From the client computers for the pilot group, run the following command from a command prompt with admin privileges:

 `\\Server\Share\M365\setup.exe /configure \\Server\Share\M365\config-pilot-SECP.xml`

> [!NOTE]
> Most organizations will use this command as part of a batch file, script, or other process that automates the deployment. In those cases, you can run the script under elevated permissions, so the users will not need to have admin privileges on their computers. 

After running the command, the Office installation should start immediately. If you run into problems, make sure you have the newest version of the ODT and make sure your configuration file and command reference the correct location. You can also troubleshoot issues by reviewing the log file in the %temp% folder.

After Office has deployed to the pilot group, test Office in your environment, particularly with your hardware and device drivers. For more details, see [Choose your update channels](plan-microsoft-365-apps.md#step-3---choose-your-update-channels).

## Step 8: Deploy Office to the broad group

After you've finished testing Office with the pilot group, you can deploy it to the broad group. To do so, run the following command from a command prompt with admin privileges:

 `\\Server\Share\M365\setup.exe /configure \\Server\Share\M365\config-broad-SEC.xml`

This command is the same as the pilot group, except that it references the configuration file for the broad group.

After running the command, the Office installation should start immediately. 

## Customize your deployment

The steps in this article cover the standard best practice recommendations from Microsoft, if you've chosen to deploy Semi-Annual Enterprise Channel. This section covers the most common customizations to these best practices.

### Build and deploy multiple packages to multiple deployment groups

If you want to deploy both the 32-bit and the 64-bit version of Office, you can create additional installation packages. (Two different architectures cannot be included in the same package.) For more details, see [Define your source files](plan-microsoft-365-apps.md#step-4---define-your-source-files). 

### Use different update channels for Office

With Microsoft 365 Apps, you can control how frequently your users receive feature updates to their Office applications. To do so, you choose an update channel for your users.  For more information, see [Overview of update channels for Microsoft 365 Apps](overview-update-channels.md).

In this article, we're using Semi-Annual Enterprise Channel (Preview) for your pilot group and Semi-Annual Enterprise Channel for the rest of your organization. You can, however, choose to deploy Current Channel, which provides users with the newest features of Office as soon as they're ready. In that scenario, you'd deploy Current Channel (Preview) to your pilot group.

A single Office installation package can only include one type of update channel, so each new update channel requires an additional package. 

### Deploy Visio and Project alongside the core Office apps

To deploy Visio and Project with Microsoft 365 Apps, you can include them as part of the Office application when building it in Configuration Manager. For more details on licensing and system requirements, see [Deployment guide for Visio](deployment-guide-for-visio.md) and [Deployment guide for Project](deployment-guide-for-project.md).

## Related topics

[Configuration options for the Office Deployment Tool](office-deployment-tool-configuration-options.md)

[Overview of the Office Deployment Tool](overview-office-deployment-tool.md)

[Overview of the Office Customization Tool](admincenter/overview-office-customization-tool.md)

[Deployment guide for Microsoft 365 Apps](deployment-guide-microsoft-365-apps.md)