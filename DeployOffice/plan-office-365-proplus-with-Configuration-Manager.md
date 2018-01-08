---
title: "Plan your Deployment of Office 365 ProPlus with System Center Configuration Manager"
ms.author: jwhit
author: jwhit-MSFT
manager: laurawi
ms.date: 9/14/2017
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

# Plan your deployment of Office 365 ProPlus with System Center Configuration Manager

This article provides guidance and recommendations for completing a deployment plan that covers the major decisions and requirements for deploying Office 365 ProPlus with System Center Configuration Manager. The article is intended for administrators in enterprise environments working with hundreds or thousands of computers. 

The deployment plan is based on five key questions:

1. How do you want to manage your deployment of Office?
2. How do you want to manage updates to Office?
3. What products, languages, and architectures are you deploying?
4. What kind of installation experience do you want your users to have?
5. What other infrastructure requirements do you have?

Each of the following sections provides details on these questions, as well as Microsoft-recommended best practices.

# Choose how to manage your deployment of Office

Because this is the planning article for deploying wth System Center Configuration Manager, we assume you've already answered most of these initial questions in the deployment plan:

- Do you want to manage the deployment? We recommend managed for enterprise deployments, because that gives you control over how and when Office and Office updates are installed on your client computers.  
- What tool do you want to use? We recommend System Center Configuration Manager for organizations that already use it to distribute and manage software.
- From what location  do you want to deploy the Office source files? When deploying Office with Configuration Manager, the source files must be downloaded and availalbe on your local network, rather than in the cloud.   

|Manage deployment            |Choice                   |Notes                                 |
|-------------------------|-------------------------|--------------------------------------|
|Management               |Managed|               |Recommended for enterprise deployments|
|Deployment tool          |Configuration Manager  |Recommended for organizations using Configuration Manager|
|Source location          |Local                  |Required by Configuration Manager|
|

For more details on these choices, including other options, see [Choose how to deploy Office 365 ProPlus](choose-how-to-deploy-office-365-proplus.md).

# Choose how to manage updates

Because this is the planning article for deploying wth System Center Configuration Manager, we assume you've already answered most of these initial questions in the deployment plan:

- Do you want to manage the deployment? We recommend managed for enterprise deployments, because that gives you control over how and when Office and Office updates are installed on your client computers.  
- What tool do you want to use? We recommend System Center Configuration Manager for organizations that already use it to distribute and manage software.
- From what location  do you want to deploy the Office source files? When deploying Office with Configuration Manager, the source files must be downloaded and availalbe on your local network, rather than in the cloud.   

|Manage updates    |Choice                   |Notes                                 |
|-------------------------|-------------------------|--------------------------------------|
|Update management        |Unmanaged <br/> OR <br/> Managed <br/> |Recommend unmanaged when possible|
|Update channels      |         |         |
|

# Choose what to deploy

|What to deploy    |Choices                   |Notes                                 |
|-------------------------|-------------------------|--------------------------------------|
|Office suite      |         |         |
|Office apps      |         |         |
|Languages      |         |         |
|Architecture      |         |         |

# Choose the installation experience

|Installation experience    |Choices                   |Notes                                 |
|-------------------------|-------------------------|--------------------------------------|
|Install experience      |         |         |

# Support for additional infrastructure requirements

|Additional deployment options    |Choices                   |Notes                                 |
|-------------------------|-------------------------|--------------------------------------|
|Manage languages      |         |         |
|Licensing      |         |         |
|Shared computing      |         |         |


# What tool?
The steps in this article can apply to a variety of environments, but we'll base our examples on the following infrastructure and requirements, all defined as part of a deployment plan. For a step-by-step guide to setting up your deployment plan, see Plan your deployment of Office 365 ProPlus with System Center Configurtion Manager:
  
- Tool: Office will be installed and receive updates using System Center Configuration Manager (Current Branch)    
- Product suite: Office 365 ProPlus 
- Language: English and Japanese
- Architecture: 32-bit and 64-bit editions
- Update channels: Semi-Annual Channel and Semi-Annual Channel (Targeted) 
- Install experience: Office will install silently on all clients

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
  

