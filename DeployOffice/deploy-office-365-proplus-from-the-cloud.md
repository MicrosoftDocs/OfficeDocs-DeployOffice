---
title: "Deploy Office 365 ProPlus from the cloud"
ms.author: jwhit
author: jwhit-MSFT
manager: laurawi
ms.date: 9/14/2017
ms.audience: ITPro
ms.topic: get-started-article
ms.service: o365-proplus-itpro
localization_priority: Normal
ms.collection:
- Ent_O365
- Strat_O365_ProPlus
ms.custom:
- Strat_O365_ProPlus
- Ent_Office_ProPlus
ms.assetid: b18a9110-0d14-46ec-af54-a22793ef6b38
description: "This article gives step-by-step instructions for how to deploy Office 365 ProPlus to client computers from the Office Content Delivery Network (CDN) by using the Office Deployment Tool (ODT). The article is intended for administrators in enterprise environments working with hundreds or thousands of computers. If you want to install Office on a single device or small number of devices, we recommend reviewing Download and install or reinstall Office 365 or Office 2016 on your PC or Mac or Use the Office 2016 offline installer."
---

# Deploy Office 365 ProPlus from the cloud

This article gives step-by-step instructions for how to deploy Office 365 ProPlus to client computers from the Office Content Delivery Network (CDN) by using the Office Deployment Tool (ODT). The article is intended for administrators in enterprise environments working with hundreds or thousands of computers. If you want to install Office on a single device or small number of devices, we recommend reviewing [Download and install or reinstall Office 365 or Office 2016 on your PC or Mac](https://support.office.com/en-us/article/Download-and-install-or-reinstall-Office-365-or-Office-2016-on-a-PC-or-Mac-4414EAAF-0478-48BE-9C42-23ADC4716658) or [Use the Office 2016 offline installer](https://support.office.com/en-us/article/Use-the-Office-2016-offline-installer-f0a85fe7-118f-41cb-a791-d59cef96ad1c). 
  
The steps in this article can apply to a variety of environments, but we'll base our examples on the following infrastructure and requirements:
  
- Office will be installed and receive updates from the Office CDN
    
- Office 365 ProPlus will be deployed in English and in the 32-bit edition only
    
- Most clients will receive updates to Office from Semi-Annual Channel
    
- A small set of pilot clients will receive earlier updates from Semi-Annual Channel (Targeted)
    
- Office will install silently on all clients
    
- Users have local admin privileges on their client computers
    
Based on these requirements, we'll create two deployment groups: group 1 will receives updates from Semi-Annual Channel and group 2 will receive updates from Semi-Annual Channel (Targeted).
  
|**Group**|**Requirements**|
|:-----|:-----|
|Group 1: Semi-Annual Channel  <br/> |Office 365 ProPlus in English, silent installation, and installation and updates come from the Office CDN. Updates to Office come from Semi-Annual Channel, which is the default choice.  <br/> |
|Group 2: Semi-Annual Channel (Targeted)  <br/> |Same as above, except updates to Office come from Semi-Annual Channel (Targeted).  <br/> |
   
Each group will need a unique configuration file, which is used to define which versions of Office to deploy. Each configuration file deploys a different build of Office: one from Semi-Annual Channel and one from Semi-Annual Channel (Targeted). For more details on the update channels, see [Overview of update channels for Office 365 ProPlus](overview-of-update-channels-for-office-365-proplus.md).
  
## Download the Office Deployment Tool and create the configuration files

We'll use the Office Deployment Tool (ODT) to deploy Office from the Office CDN. The deployment tool is run from the command line and uses a configuration file to determine what settings to apply when deploying Office.
  
 **Step 1: Create a shared folder**
  
Create the shared folder **\\\\Server\Share\O365** and assign read permissions for your users.
  
You can create whatever structure works for your organization, of course, but we'll refer to this setup in our examples. For details about how to create shared folders and assign permissions, see [Shared Folders](https://technet.microsoft.com/library/cc770406.aspx).
  
 **Step 2: Download the Office Deployment Tool**
  
Download the Office Deployment Tool from the [Microsoft Download Center](https://www.microsoft.com/en-us/download/details.aspx?id=49117) to \\\\Server\Share\O365. If you've already downloaded the ODT, make sure you have the latest version.
  
After downloading the file, run the self-extracting executable file, which contains the Office Deployment Tool executable (setup.exe) and a sample configuration file (configuration.xml).
  
 **Step 3: Create a configuration file for group 1**
  
To download and deploy Office 365 ProPlus for group 1, we'll create a configuration file that defines the appropriate settings for the Office Deployment Tool.
  
Using a text editor, copy and paste the following into a text file and save it as **config-group1-SAC.xml** in the \\\\server\share\O365 folder.
  
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
  
Using a text editor, copy and paste the following into a text file and save it as **config-group2-SACT.xml** in the \\\\Server\Share\O365 folder.
  
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
  
For more information about the configuration options, see [Configuration options for the Office Deployment Tool](configuration-options-for-the-office-2016-deployment-tool.md).
  
## Deploying Office 365 ProPlus

To deploy Office, we'll provide two commands that users can run from their client computers. The first command installs Office for client computers in group 1 and the second for group 2. The commands run the ODT in configure mode and with a reference to the appropriate configuration file, which defines which version of Office to install on the client computer.
  
Users who run these commands must have local admin privileges on their computer and must have read permissions to the share (\\\\server\share\O365, in our case).
  
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
  
## Related topics

[Configuration options for the Office Deployment Tool](configuration-options-for-the-office-2016-deployment-tool.md)
  
[Overview of the Office Deployment Tool](overview-of-the-office-2016-deployment-tool.md)
  
[Deployment guide for Office 365 ProPlus](deployment-guide-for-office-365-proplus.md)
  
[Best practices](best-practices/best-practices.md)
  

