---
title: "Plan your Deployment of Office 365 ProPlus with System Center Configuration Manager"
ms.author: jwhit
author: jwhit-MSFT
manager: laurawi
ms.date: 1/31/2018
ms.audience: ITPro
ms.topic: get-started-article
ms.service: o365-administration
localization_priority: Normal
ms.collection: Ent_O365
ms.custom:
- Strat_O365_ProPlus
- Ent_Office_ProPlus
ms.assetid: b18a9110-0d14-46ec-af54-a22793ef6b38
description: "This article gives step-by-step instructions for how to plan your deployment of Office 365 ProPlus with System Center Configuration Manager. The article is intended for administrators in enterprise environments working with hundreds or thousands of computers."
---

# Create a deployment plan for deploying Office 365 ProPlus with System Center Configuration Manager

Follow the steps in this article to create a deployment plan for deploying Office 365 ProPlus in your organization. This is the third article in the series:

 - 1 - [Overview of deploying Office 365 ProPlus with System Center Configuration Manager](overview-deploy-office-365-proplus-with-Configuration-Manager.md)
 - 2 - [Assess your environment and requirements](assess-deploy-office-365-proplus-with-Configuration-Manager.md) 
 - 3 - **[Create a deployment plan](plan-deploy-office-365-proplus-with-Configuration-Manager.md)**
 - 4 - [Deploy Office 365 ProPlus](deploy-office-365-proplus-with-Configuration-Manager.md) 
 - 5 - [Manage updates to Office 365 ProPlus](manage-updates-to-office-365-proplus-with-system-center-configuration-manager.md)
 -  
In addition to this guidance, we recommend customers use [Microsoft Fastrack](https://fasttrack.microsoft.com/office) to help with their deployment. FastTrack onboarding services are available with the purchase of 50 or more seats of Office 365 Enterprise and Office 365 Business SKUs, along with paid Government, Kiosk, and Nonprofit SKUs. Migration assistance for mail and files is available with the purchase of 500 or more seats.

## Step 1 - Plan how to manage your deployment 

Because this is the planning article for deploying wth System Center Configuration Manager, you've likely already answered most of the questions about how to manage your deployment:

- Do you want to manage the deployment? We recommend managed for enterprise deployments, because that gives you control over how and when Office and Office updates are installed on your client computers.  
- What tool do you want to use? We recommend  System Center Configuration Manager (Current Branch) for organizations that already use it to distribute and manage software.  Configuration Manager scales for large environments and enables extensive control over installation, updates, and settings.
- From what location do you want to deploy the Office source files? When deploying Office with Configuration Manager, the source files must be downloaded and availalbe on your local network, rather than in the cloud.   

|Manage deployment            |Choices                   |Best practice                                 |
|-------------------------|-------------------------|--------------------------------------|
|Management               |Managed|               |Managed is recommended for enterprise deployments|
|Deployment tool          |Configuration Manager (Current Branch) </br> Office Deployment Tool |Configuration Manager is recommended for organizations already using it|
|Source location          |Local </br> Cloud                  |Local is required by Configuration Manager|
|

For more details on these choices, including other options, see [Choose how to deploy Office 365 ProPlus](choose-how-to-deploy-office-365-proplus.md).

## Step 2 - Plan how to manage updates

With Office 365 ProPlus, you can control how frequently your users receive feature updates to their Office applications. For more information, see [Overview of update channels for Office 365 ProPlus](overview-of-update-channels-for-office-365-proplus.md).

To plan for managing updates in your organization, answer the following questions:

- How do you want to manage updates? We recommend managing updates automaticaly from the cloud. Updates will be installed directly on client devices the Office CDN. You can also manage updates with System Center Configuration Manager.   
- From what location do you want to deploy  Office updates? We recommend the cloud, as noted above. If you decide to manage updates with Configuration Manager, you will download the updates and manage them from a local source.   
- What validation rings do you want to use? We recommend defining a targeted ring with a small group of devices and a broad ring with the rest of your devices. Devices in the Targeted ring will receive updates earlier and validate those updates in your environment. After validation, you can deploy the updates to the devices in the Broad ring.   
- What update channels do you want to use? We recommend using two update channels, one for each of the validation rings. For the targeted ring, use the Semi-Annual Channel (Targeted), which releases feature updates in March and September. For the broad ring, use the Semi-Annual Channel, which releases feature updates four months after the targeted channel.

|Manage updates    |Choice                   |Best practices                                 |
|-------------------------|-------------------------|--------------------------------------|
|Update management        |Unmanaged <br/> OR <br/> Managed <br/> |Recommend unmanaged when possible|
|Update channels      |         |         |
|Validation rings      |         |         |
|

## Step 3 - Choose what Office applications to deploy

You can choose waht product suite to deploy and, within the suite, which Office applications to include. Applications that are initially excluded can be added back later, just as applications that are initially included can be removed later. For each suite, you can decide what languages and architectures to deploy. When deciding what to deploy, consider the following: 

- We recommend Office 365 ProPlus for most organizations, as that xx.
- Microsoft supports installing Office 365 ProPlus alongside the most recent previous version of the Office suite, but we don't recommend it. If you plan to have two versions of Office on the same computer, you should plan to transition to using only Office 365 ProPlus when possible.  
- Microsoft supports different versions of Project and Visio running alongside  Office 365 ProPlus. Customers can use their existing Project and Visio MSI versions, or deploy the Click-to-Run versions that support traditional volume licensing and Office 365 licensing models. We recommend xx as a best practice.



|What to deploy    |Choices                   |Best practices                                 |
|-------------------------|-------------------------|--------------------------------------|
|Product suite      |         |         |
|Office apps      |         |         |
|Project and Visio      |         |         |
|Languages      |         |         |
|Architecture      |         |         |

## Step 4 - Choose what languages to deploy--and how to deploy them

You can install language accessory packs after you’ve deployed Office 365 ProPlus in one of its base languages. There are two ways to install language accessory packs:

- Have your users download and install the language accessory packs that they need from the Office 365 portal.
- Use Configuration Manager to deploy the appropriate language accessory packs to your users.

For more details, see [Overview of deploying languages in Office 365 ProPlus](overview-of-deploying-languages-in-office-365-proplus.md).

## Step 5 - Plan the installation experience for your users

|Installation experience    |Choices                   |Notes                                 |
|-------------------------|-------------------------|--------------------------------------|
|Install experience      |         |         |

## Step 6 - Define your deployment groups
Deployment groups are collections of clients that will receive the same Office bits and the same updates from the same channel. For example, you can define one deployment group for all the devices in your organization meet the following requirements:

- Tool: Office will be installed by Configuration Manager (Current Branch)
- Updates: Office updates will be managed automatically from the cloud    
- Product suite: Office 365 ProPlus 
- Languages: English and Japanese
- Architecture: 64-bit editions
- Update channels: Semi-Annual Channel 
- Install experience: Office will install silently on all clients

Clients with different requirements, such as 32-bit architecture or different update, will need to be in different deployment groups. 

## Step 7 - Plan for shared computers

## Step 8 - Plan for deploying Office 365 ProPlus to Macs

## Step 9 - Review exit criteria

Before beginning your deployment, make sure you've completed your deployment plan.

|Plan                                              |Details                                 |Best practice                           |
|--------------------------------------------------|----------------------------------------|----------------------------------------|

## Next steps

Deploy Office 365 ProPlus with System Center Configuration Manager.


fXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX





Based on these requirements, we've defined four deployment groups:

|**Group**|**Requirements**|
|:-----|:-----|
|Group 1: Semi-Annual Channel  <br/> |Office 365 ProPlus in English, silent installation, and installation and updates come from the Office CDN. Updates to Office come from Semi-Annual Channel, which is the default choice.  <br/> |
|Group 2: Semi-Annual Channel (Targeted)  <br/> |Same as above, except updates to Office come from Semi-Annual Channel (Targeted).  <br/> |

Each group will need a unique configuration file, which is used to define which versions of Office to deploy. Each configuration file deploys a different build of Office: one from Semi-Annual Channel and one from Semi-Annual Channel (Targeted). For more details on the update channels, see [Overview of update channels for Office 365 ProPlus](overview-of-update-channels-for-office-365-proplus.md).
  
## Download the Office 2016 Deployment Tool and create the configuration files

We'll use the Office 2016 Deployment Tool (ODT) to deploy Office from the Office CDN. The deployment tool is run from the command line and uses a configuration file to determine what settings to apply when deploying Office.
  
 **Step 1: Create a shared folder**
  
Create the shared folder **\\Server\Share\O365** and assign read permissions for your users.
  
You can create whatever structure works for your organization, of course, but we'll refer to this setup in our examples. For details about how to create shared folders and assign permissions, see [Shared Folders](https://technet.microsoft.com/library/cc770406.aspx).
  
 **Step 2: Download the Office 2016 Deployment Tool**
  
Download the Office 2016 Deployment Tool from the [Microsoft Download Center](https://www.microsoft.com/en-us/download/details.aspx?id=49117) to \\Server\Share\O365. If you've already downloaded the ODT, make sure you have the latest version.
  
After downloading the file, run the self-extracting executable file, which contains the Office 2016 Deployment Tool executable (setup.exe) and a sample configuration file (configuration.xml).
  
 **Step 3: Create a configuration file for group 1**
  
To download and deploy Office 365 ProPlus for group 1, we'll create a configuration file that defines the appropriate settings for the Office 2016 Deployment Tool.
  
Using a text editor, copy and paste the following into a text file and save it as **config-group1-SAC.xml** in the \\server\share\O365 folder.
  
```
<Configuration> 
  <Add OfficeClientEdition="32" 
       Channel="Broad"> 
   <Product ID="O365ProPlusRetail" > 
     <Language ID="en-us" />      
   </Product> 
  </Add> 
  <Display Level="None" 
           AcceptEULA="TRUE" />
</Configuration>

```

This configuration file is used to deploy Office to the group 1 users. Here's more detail on how the XML settings define what to install:
  
|**Value**|**Description**|
|:-----|:-----|
|OfficeClientEdition="32"  <br/> |Installs the 32-bit edition of Office  <br/> |
|Channel="Broad"  <br/> |Installs the Office installation files from Semi-Annual Channel  <br/> |
|Product ID="O365ProPlusRetail"  <br/> |Installs Office 365 ProPlus  <br/> |
|Language ID="en-us"  <br/> |Installs English version of Office  <br/> |
|Display Level="None"  <br/> |Installs Office silently, without displaying the user interface.  <br/> |
|AcceptEULA="TRUE"  <br/> |When installing Office, accepts the Microsoft Software License Terms automatically  <br/> |
   
Note that the Office installation files and Office updates will come from Semi-Annual Channel. For more details on the most recent version of Office based on the different update channels, see [Office 365 client update channel releases](https://technet.microsoft.com/en-us/office/mt465751.aspx).
  
 **Step 4: Create a configuration file for group 2**
  
Using a text editor, copy and paste the following into a text file and save it as **config-group2-SACT.xml** in the \\Server\Share\O365 folder.
  
```
<Configuration> 
  <Add OfficeClientEdition="32" 
       Channel="Targeted"> 
   <Product ID="O365ProPlusRetail" > 
     <Language ID="en-us" />      
     </Product> 
  </Add> 
<Display Level="None" 
         AcceptEULA="TRUE" />
</Configuration>

```

This configuration file is used deploy Office to the group 2 users. The settings are exactly the same as the first configuration file, except the installation channel and update channel are both set to Semi-Annual Channel (Targeted).
  
 **Step 5: Customize the configuration files for your environment**
  
To change the options from our example, you can edit the XML elements and attributes in the configuration files. For example, if you want to add a second language, you can insert an additional language element with the appropriate ID. You can also create additional configuration files for other groups you want to deploy to, such as a group that needs to receive updates from a different channel or a group that needs the 64-bit edition of Office.
  
For more information about the configuration options, see [Configuration options for the Office 2016 Deployment Tool](configuration-options-for-the-office-2016-deployment-tool.md).
  
## Deploying Office 365 ProPlus

To deploy Office, we'll provide two commands that users can run from their client computers. The first command installs Office for client computers in group 1 and the second for group 2. The commands run the ODT in configure mode and with a reference to the appropriate configuration file, which defines which version of Office to install on the client computer.
  
Users who run these commands must have local admin privileges on their computer and must have read permissions to the share (\\server\share\O365, in our case).
  
Most organizations will use this command as part of a batch file, script, or other process that automates the deployment. In those cases, you can run the script under elevated permissions, so the users will not need to have admin privileges on their computers.
  
 **Step 1: Run the commands for group 1**
  
From the client computers for group 1, run the following command from a command prompt with admin privileges:
  
 `\\Server\Share\O365\setup.exe /configure \\Server\Share\O365\config-group1-SAC.xml`
  
 **Step 2: Run the commands for group 2**
  
From the client computers for group 2, run the following command from a command prompt with admin privileges:
  
 `\\Server\Share\O365\setup.exe /configure \\Server\Share\O365\config-group2-SACT.xml`
  
This command is the same as group 1, except that it references the configuration file for group 2.
  
 **Step 3: Verify that installation was successful**
  
After running the command, the Office installation should start immediately. If you run into problems, make sure you have the newest version of the ODT and make sure your configuration file and command reference the correct location. You can also troubleshoot issues by reviewing the log file in the %temp% and %windir%\\temp directories.
  
## Related Topics

[Configuration options for the Office 2016 Deployment Tool](configuration-options-for-the-office-2016-deployment-tool.md)
  
[Overview of the Office 2016 Deployment Tool](overview-of-the-office-2016-deployment-tool.md)
  
[Deployment guide for Office 365 ProPlus](deployment-guide-for-office-365-proplus.md)
  
[Best practices](best-practices/best-practices.md)
  

