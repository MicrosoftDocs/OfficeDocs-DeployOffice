---
title: "Deploy Office 365 ProPlus from a local source"
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
description: "This article gives step-by-step instructions for how to use the Office Deployment Tool (ODT) to deploy Office 365 ProPlus to client devices from a shared folder on your network."
---

# Deploy Office 365 ProPlus from a local source

Follow the steps in this article to deploy Office 365 ProPlus to client computers from a shared folder on your network by using the Office Deployment Tool (ODT). 

## Before you begin

If you haven't already, complete the [assessment](assess-office-365-proplus.md) and [planning](plan-office-365-proplus.md) phases for your Office deployment. 

This article is intended for administrators in enterprise environments working with hundreds or thousands of computers. If you want to install Office on a single device or small number of devices, we recommend reviewing [Download and install or reinstall Office 365 or Office 2016 on your PC or Mac](https://support.office.com/en-us/article/Download-and-install-or-reinstall-Office-365-or-Office-2016-on-a-PC-or-Mac-4414EAAF-0478-48BE-9C42-23ADC4716658) or [Use the Office 2016 offline installer](https://support.office.com/en-us/article/Use-the-Office-2016-offline-installer-f0a85fe7-118f-41cb-a791-d59cef96ad1c). 
  
## Best practices and requirements

The steps in this article are based on the following best practices, requirements, and options:
  
Best practices:

- **Deploy Office from a local source with the Office Deployment Tool**. For more details, see [Choose how to deploy](plan-office-365-proplus.md#step-1---choose-how-to-deploy).
- **Manage updates to Office automatically**, without any adminstrative overhead. For more details, see [Choose how to manage updates](plan-office-365-proplus.md#step-2---choose-how-to-manage-updates). (If you want to manage updates from a local source, you need to change the configuration files. For more details, see [configuring updates](configuration-options-for-the-office-2016-deployment-tool.md#updates-element)).
- **Build two Office installation packages**: Semi-Annual Channel for 32-bit and Semi-Annual Channel (Targeted) for 32-bit. Each installation package includes all the core Office apps. (If you want to deploy the 64-bit version of Office, you can create additional installation packages.) For more details, see [Define your source files](plan-office-365-proplus.md#step-4---define-your-source-files).
- **Deploy to two deployment groups**: a pilot group that receives the Semi-Annual Channel (Targeted) and a broad group that recieves the Semi-Annual Channel. Note that in this scenario, the installation packages and deployment groups match exactly. In more complex deployments, you might have multiple deployment groups that use the same installation package. For more details, see [Choose your update channels](plan-office-365-proplus.md#step-3---choose-your-update-channels).

Requirements:

- **Your users must have local admin privileges** on their client devices. If that is not the case, then you should use your standard deployment tools and processes to install Office.
- **All requirements met in the [assessment](assess-office-365-proplus.md) and [planning](plan-office-365-proplus.md) phases for your Office deployment**. 

Options:

- **Install Office in English and Japanese**. For more details on installing additional languages, including matching the language of the client device's operating system, see [Overview of deploying languages](overview-of-deploying-languages-in-office-365-proplus.md).
- **Install Office silently**. For more details, see [Display options](configuration-options-for-the-office-2016-deployment-tool.md#display-element).
- **Install core Office apps only**. If you want to include Project or Visio, see [Deploy Visio](https://docs.microsoft.com/en-us/deployoffice/deployment-guide-for-visio) and [Deploy Project](https://docs.microsoft.com/en-us/deployoffice/deployment-guide-for-project).

You can change the options by customizing the configuration files, as shown later in the article. 
  
## Step 1: Create shared folders for Office installation files 

Because you're deploying Office 365 ProPlus from a local source, you have to create folders to store the Office installation files. You'll create one parent folder and two child folders, one for the pilot group, with the version of Office from Semi-Annual Channel (Targeted), and one for the broad group, with version of Office from Semi-Annual Channel. This structure is similar to the one that the Office Content Delivery Network (CDN) uses.
  
1. Create the following folders:
  
	- **\\\Server\Share\O365**: Stores the ODT and the configuration files that define how to download and deploy Office.
	- **\\\Server\Share\O365\SACT**: Stores the Office 365 ProPlus installation files from Semi-Annual Channel (Targeted).
	- **\\\Server\Share\O365\SAC**: Stores the Office 365 ProPlus installation files from Semi-Annual Channel.
   
These folders will include all the Office installation files you need to deploy. 
  
2. Assign Read permissions for your users. 

	Installing Office from a shared folder requires only that the user have Read permission for that folder, so you should assign Read permission to everyone. For details about how to create shared folders and assign permissions, see [Shared Folders](https://go.microsoft.com/fwlink/p/?LinkId=184710)
  
> [!NOTE]
> In this article, we have just one shared folder on the network, but many organizations make the Office installation files available from multiple locations. Using multiple locations can help improve availability and minimize the effect on network bandwidth. For example, if some of your users are located in a branch office, you can create a shared folder in the branch office. Those users can then install Office from the local network. You can use the Distributed File System (DFS) role service in Windows Server to create a network share that is replicated to multiple locations. For more information, see [DFS Management](https://technet.microsoft.com/library/cc732006.aspx). 
  
## Step 2: Download the Office Deployment Tool
  
Download the ODT from the [Microsoft Download Center](https://www.microsoft.com/en-us/download/details.aspx?id=49117) to \\\Server\Share\O365. If you've already downloaded the ODT, make sure you have the latest version.
  
After downloading the file, run the self-extracting executable file, which contains the ODT executable (setup.exe) and a sample configuration file (configuration.xml).
  
## Step 3: Create a configuration file for the pilot group
  
To download and deploy Office 365 ProPlus to the pilot group, you create a configuration file that defines the appropriate settings for the ODT.

> [!NOTE]
> These steps have you use a text editor to create the configuration files. You can also create configuration files using the [Office Customization Tool for Click-to-Run (preview)](https://config.office.com/), a web application with a full user interface. Note that this tool is still in preview and is subject to change.
  
Using a text editor, copy and paste the following into a text file and save it as **config-pilot-SACT.xml** in the **\\\Server\Share\O365** folder.
  
```
<Configuration> 
  <Add SourcePath="\\server\share\O365\SACT" 
       OfficeClientEdition="32" 
       Channel="Targeted"> 
   <Product ID="O365ProPlusRetail" > 
     <Language ID="en-us" />      
     <Language ID="ja-jp" />      
   </Product> 
  </Add> 
<Updates Enabled="TRUE" 
         UpdatePath=""
         Channel="Targeted" />  
<Display Level="None" 
         AcceptEULA="TRUE" />
</Configuration>
```

This configuration file is used to download Office 365 ProPlus installation files and then deploy them to the pilot group. Here's more detail on how the XML settings define what to download and what to install:
  
- SourcePath="\\\Server\Share\O365\SACT": Office will be downloaded to and then installed from **\\\server\share\O365\SACT** on your network 
- OfficeClientEdition="32": Downloads and installs the 32-bit edition of Office
- Channel="Targeted": Downloads and installs the Office installation files from Semi-Annual Channel (Targeted)
- Product ID="O365ProPlusRetail": Downloads and installs Office 365 ProPlus  
- Language ID="en-us" and Language ID="ja-jp": Downloads and installs English and Japanese versions of Office  
- Updates Enabled="TRUE": After installation, Office will check for updates
- UpdatePath="": After installation, updates for Office will come from the Office CDN
- Channel="Targeted": After installation, updates to Office will come from Semi-Annual Channel (Targeted)
- Display Level="None": Installs Office silently, without displaying the user interface
- AcceptEULA="TRUE": When installing Office, accepts the Microsoft Software License Terms automatically  
   
Note that the Office installation files and Office updates will come from Semi-Annual Channel (Targeted). For more details on the most recent version of Office based on the different update channels, see [Release information for updates to Office 365 ProPlus](https://docs.microsoft.com/officeupdates/release-notes-office365-proplus).
  
## Step 4: Create a configuration file for the broad group
  
Using a text editor, copy and paste the following into a text file and save it as **config-broad-SAC.xml** in the \\\Server\Share\O365 folder.
  
```
<Configuration> 
  <Add SourcePath="\\server\share\O365\SAC" 
       OfficeClientEdition="32" 
       Channel="Broad"> 
   <Product ID="O365ProPlusRetail" > 
     <Language ID="en-us" />      
     <Language ID="ja-jp" />      
   </Product> 
  </Add> 
  <Updates Enabled="TRUE" 
           UpdatePath=""
           Channel="Broad" />  
  <Display Level="None" 
           AcceptEULA="TRUE" />
</Configuration>

```

This configuration file is used to download Office installation files and then deploy them to the broad group. The settings are exactly the same as the first configuration file, except the source path points to a different folder (SAC), and the installation channel and update channel are both set to Semi-Annual Channel ("Broad").
  
## Step 5: Customize the configuration files for your environment
  
To change the options from our example, you can edit the XML elements and attributes in the configuration files. For example, if you want to add a third language, you can insert an additional language element with the appropriate ID. You can also create additional configuration files for other groups you want to deploy to, such as a group that needs to receive updates from a different channel.
  
For more information about the configuration options, see [Configuration options for the Office Deployment Tool](configuration-options-for-the-office-2016-deployment-tool.md).
  
## Step 6: Download the Office installation package for the pilot group
  
From a command prompt, run the ODT executable in download mode and with a reference to the configuration file for the pilot group:
  
 `\\server\share\O365\setup.exe /download \\server\share\O365\config-pilot-SACT.xml`
  
The files should begin downloading immediately. After running the command, go to **\\\server\share\O365\SACT**  and look for an Office folder with the appropriate files in it.

Note that when you download Office to a folder that already contains that version of Office, the ODT will conserve your network bandwidth by downloading only the missing files. For example, if you use the ODT to download Office in English and German to a folder that already contains Office in English, only the German language pack will be downloaded.

If you run into problems, make sure you have the newest version of the ODT and make sure your configuration file and command reference the correct location. You can also troubleshoot issues by reviewing the log file in the %temp% and %windir%\temp directories.

## Step 7: Download the Office installation package for the broad group
  
From a command prompt, run the ODT executable in download mode and with a reference to the configuration file for the broad group:
  
 `\\server\share\O365\setup.exe /download \\server\share\O365\config-broad-SAC.xml`
  
The files should begin downloading immediately. After running the command, go to **\\\server\share\O365\SAC** and look for an Office folder with the appropriate files in it.
    
## Step 8: Deploy Office to the pilot group

To deploy Office, we'll provide commands that users can run from their client computers. The commands run the ODT in configure mode and with a reference to the appropriate configuration file, which defines which version of Office to install on the client computer. Users who run these commands must have local admin privileges on their computer and must have read permissions to the share (**\\\server\share\O365**).
    
From the client computers for the pilot group, run the following command from a command prompt with admin privileges:
  
 `\\Server\Share\O365\setup.exe /configure \\Server\Share\O365\config-pilot-SACT.xml`
 
> [!NOTE]
> Most organizations will use this command as part of a batch file, script, or other process that automates the deployment. In those cases, you can run the script under elevated permissions, so the users will not need to have admin privileges on their computers. 

After running the command, the Office installation should start immediately. If you run into problems, make sure you have the newest version of the ODT and make sure your configuration file and command reference the correct location. You can also troubleshoot issues by reviewing the log file in the %temp% and %windir%\temp directories.

After Office has deployed to the pilot group, test Office in your environment, particularly with your hardware and device drivers. For more details, see [Choose your update channels](plan-office-365-proplus.md#step-3---choose-your-update-channels).

## Step 9: Deploy Office to the broad group
  
After you've finished testing Office with the pilot group, you can deploy it to the broad group. To do so, run the following command from a command prompt with admin privileges:
  
 `\\Server\Share\O365\setup.exe /configure \\Server\Share\O365\config-broad-SAC.xml`
  
This command is the same as the pilot group, except that it references the configuration file for the broad group.

After running the command, the Office installation should start immediately. 
  
## Related topics

[Configuration options for the Office Deployment Tool](configuration-options-for-the-office-2016-deployment-tool.md)
  
[Overview of the Office Deployment Tool](overview-of-the-office-2016-deployment-tool.md)
  
[Deployment guide for Office 365 ProPlus](deployment-guide-for-office-365-proplus.md)  

