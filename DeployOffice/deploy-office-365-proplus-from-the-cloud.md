---
title: "Deploy Office 365 ProPlus from the cloud"
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
ms.assetid: b18a9110-0d14-46ec-af54-a22793ef6b38
description: "This article gives step-by-step instructions for how to deploy Office 365 ProPlus to client computers from the Office Content Delivery Network (CDN) by using the Office Deployment Tool (ODT)."
---

# Deploy Office 365 ProPlus from the cloud

Follow the steps in this article to deploy Office 365 ProPlus to client computers from the Office Content Delivery Network (CDN) by using the Office Deployment Tool (ODT). 

## Before you begin

If you haven't already, complete the [asssessment](assess-office-365-proplus.md) and [planning](plan-office-365-proplus) phases for your Office deployment. 

This article is intended for administrators in enterprise environments working with hundreds or thousands of computers. If you want to install Office on a single device or small number of devices, we recommend reviewing [Download and install or reinstall Office 365 or Office 2016 on your PC or Mac](https://support.office.com/en-us/article/Download-and-install-or-reinstall-Office-365-or-Office-2016-on-a-PC-or-Mac-4414EAAF-0478-48BE-9C42-23ADC4716658) or [Use the Office 2016 offline installer](https://support.office.com/en-us/article/Use-the-Office-2016-offline-installer-f0a85fe7-118f-41cb-a791-d59cef96ad1c). 
  
## Best practices and requirements

The steps in this article are based on the following best practices, requirements, and options:
  
Best practices:

- **Deploy Office from the cloud with the Office Deployment Tool**. For more details, see [Choose how to deploy](plan-office-365-proplus#step-1---choose-how-to-deploy).
- **Manage updates to Office automatically**, without any adminstrative overhead. For more details, see [Choose how to manage updates](plan-office-365-proplus#step-2---choose-how-to-manage-updates).
- **Build two Office installation packages**: Semi-Annual Channel for 32-bit and Semi-Annual Channel (Targeted) for 32-bit. Each installation package includes all the core Office apps. (If you want to deploy the 64-bit version of Office, you can create additional installation packages.) For more details, see [Define your source files](plan-office-365-proplus#step-4---define-your-source-files).
- **Deploy to two deployment groups**: a pilot group that receives the Semi-Annual Channel (Targeted) and a broad group that recieves the Semi-Annual Channel. Note that in this scenario, the installation packages and deployment groups match exactly. In more complex deployments, you might have multiple deployment groups that use the same installation package. For more details, see [Choose your update channels](plan-office-365-proplus#step-3---choose-your-update-channels). 

Requirements:

- **Your users must have local admin privileges** on their client devices. If that is not the case, then you should use your standard deployment tools and proceses to install Office.
- **All requirements met in the [asssessment](assess-office-365-proplus.md) and [planning](plan-office-365-proplus) phases for your Office deployment**. 

Options:

- **Install Office in English and Japanese**. For more details, see on installing additional languages, including matching the language of the client device's operating system, see [Overview of deploying languages](overview-of-deploying-languages-in-office-365-proplus.md).
- **Install Office silently**. For more details, see [Display options](configuration-options-for-the-office-2016-deployment-tool#display-element).
- **Install core Office apps only**. If you want to include Project or Visio, see [Deploy Visio](https://docs.microsoft.com/en-us/deployoffice/deployment-guide-for-visio) and [Deploy Project](https://docs.microsoft.com/en-us/deployoffice/deployment-guide-for-project).

You can change the options by customizing the configuration files, as shown later in the article. 

## Step 1: Download the Office Deployment Tool 

You use the Office Deployment Tool (ODT) to deploy Office from the Office CDN. The deployment tool is run from the command line and uses a configuration file to determine what settings to apply when deploying Office.
  
1. Create the shared folder **\\\\Server\Share\O365** and assign read permissions for your users. For details about how to create shared folders and assign permissions, see [Shared Folders](https://technet.microsoft.com/library/cc770406.aspx).
  
2. Download the Office Deployment Tool from the [Microsoft Download Center](https://www.microsoft.com/en-us/download/details.aspx?id=49117) to \\\\Server\Share\O365. If you've already downloaded the ODT, make sure you have the latest version.
  
3. After downloading the file, run the self-extracting executable file, which contains the Office Deployment Tool executable (setup.exe) and a sample configuration file (cosnfiguration.xml).

## Step 2: Create a configuration file for the pilot group

To deploy Office 365 ProPlus to the pilot group, you create a configuration file that defines the appropriate settings for the ODT.

> [!NOTE]
> These steps have you use a text editor to create the configuration files. You can also create configuration files using the [Office Customization Tool for Click-to-Run (preview)](https://config.office.com/), a web application with a full user interface. Note that this tool is still in preview and is subject to change.

Using a text editor, copy and paste the following into a text file and save it as **config-pilot-SACT.xml** in the \\\\server\share\O365 folder.
  
```
<Configuration> 
  <Add OfficeClientEdition="32" 
       Channel="Targeted"> 
   <Product ID="O365ProPlusRetail" > 
     <Language ID="en-us" />      
     <Language ID="ja-jp" />
   </Product> 
  </Add> 
  <Display Level="None" 
           AcceptEULA="TRUE" />
	 <Updates Enabled="TRUE" 
         UpdatePath=""
         Channel="Targeted" />
</Configuration>

```

This configuration file is used to deploy Office to the pilot group. Here's more detail on how the XML settings define what to install:

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
   
## Step 3: Create a configuration file for the broad group

Using a text editor, copy and paste the following into a text file and save it as **config-broad-SAC.xml** in the \\\\Server\Share\O365 folder.
  
```
<Configuration> 
  <Add OfficeClientEdition="32" 
       Channel="Broad"> 
   <Product ID="O365ProPlusRetail" > 
     <Language ID="en-us" />      
     <Language ID="ja-jp" />
   </Product> 
  </Add> 
  <Display Level="None" 
           AcceptEULA="TRUE" />
	 <Updates Enabled="TRUE" 
         UpdatePath=""
         Channel="Broad" />
</Configuration>

```

This configuration file is used deploy Office to the broad group users. The settings are exactly the same as the first configuration file, except the installation channel and update channel are both set to Semi-Annual Channel ("Broad").
  
## Step 4: Customize the configuration files for your environment
  
To change the options from our example, you can edit the XML elements and attributes in the configuration files. For example, if you want to add a third language, you can insert an additional language element with the appropriate ID. You can also create additional configuration files for other groups you want to deploy to, such as a group that needs to receive updates from a different channel or a group that needs the 64-bit edition of Office.
  
For more information about the configuration options, see [Configuration options for the Office Deployment Tool](configuration-options-for-the-office-2016-deployment-tool.md).
  
## Step 5: Deploy Office to the pilot group

To deploy Office, you provide commands that users can run from their client computers. The commands run the ODT in configure mode and with a reference to the appropriate configuration file, which defines which version of Office to install on the client computer. Users who run these commands must have local admin privileges and must have read permissions to the share (**\\\server\share\O365**).

From the client computers for the pilot group, run the following command from a command prompt with admin privileges:
  
 `\\Server\Share\O365\setup.exe /configure \\Server\Share\O365\config-pilot-SACT.xml`
   
> [!NOTE]
> Most organizations will use this command as part of a batch file, script, or other process that automates the deployment. In those cases, you can run the script under elevated permissions, so the users will not need to have admin privileges on their computers. 
 
After running the command, the Office installation should start immediately. If you run into problems, make sure you have the newest version of the ODT and make sure your configuration file and command reference the correct location. You can also troubleshoot issues by reviewing the log file in the %temp% and %windir%\temp directories.

After Office has deployed to the pilot group, you can test Office in your environment, particularly with your hardware and device drivers. For more details, see [Choose your update channels](plan-office-365-proplus#step-3---choose-your-update-channels). 

## Step 6: Deploy Office to the broad group
  
After you've finished testing Office with the pilot group, you can deploy it to the broad group. To do so, run the following command from a command prompt with admin privileges:
  
 `\\Server\Share\O365\setup.exe /configure \\Server\Share\O365\config-broad-SAC.xml`
  
This command is the same as the pilot group, except that it references the configuration file for the broad group. After running the command, the Office installation should start immediately. 
  
## Related topics

[Configuration options for the Office Deployment Tool](configuration-options-for-the-office-2016-deployment-tool.md)
  
[Overview of the Office Deployment Tool](overview-of-the-office-2016-deployment-tool.md)
  
[Deployment guide for Office 365 ProPlus](deployment-guide-for-office-365-proplus.md)  






