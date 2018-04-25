---
title: "Deploy Office 365 ProPlus from a local source"
ms.author: jwhit
author: jwhit-MSFT
manager: laurawi
ms.date: 9/29/2017
ms.audience: ITPro
ms.topic: get-started-article
ms.service: o365-proplus-itpro
localization_priority: Priority
ms.collection:
- Ent_O365
- Strat_O365_ProPlus
ms.custom:
- LIL_Placement
- Ent_Office_ProPlus
ms.assetid: 35d4cb3b-4cc9-4bc9-9f20-eaf3c50f8331

description: "This article gives step-by-step instructions for how to use the Office Deployment Tool (ODT) to deploy Office 365 ProPlus to client devices from a shared folder on your network. As part of this deployment, we will install multiple languages, use two update channels for Office, and exclude an Office application."
---

# Deploy Office 365 ProPlus from a local source

This article gives step-by-step instructions for how to use the Office Deployment Tool (ODT) to deploy Office 365 ProPlus to client devices from a shared folder on your network. As part of this deployment, we will install multiple languages, use two update channels for Office, and exclude an Office application.
  
The steps in this article can apply to a variety of environments, but we'll base our examples on the following infrastructure and requirements.
  
- Users have local admin privileges on their client computers
    
- Office 365 ProPlus will be deployed in English and Japanese
    
- Most clients will receive updates to Office from Semi-Annual Channel
    
- A small set of pilot clients will receive earlier updates from Semi-Annual Channel (Targeted)
    
- Office will be installed without Publisher on all clients
    
- Office will install silently on all clients
    
- After install, all updates to Office will come directly from the Office Content Delivery Network (CDN)
    
Based on these requirements, we'll create two deployment groups: group one will receives updates from Semi-Annual Channel and group two will receive updates from Semi-Annual Channel (Targeted).
  
|**Group**|**Requirements**|
|:-----|:-----|
|Group 1: Semi-Annual Channel  <br/> |Office 365 ProPlus in English and Japanese, no Publisher, silent installation, and updates come from the Office CDN. Updates to OfficOffice come from Semi-Annual Channel, which is the default choice.  <br/> |
|Group 2: Semi-Annual Channel (Targeted)  <br/> |Same as above, except updates to Office come from Semi-Annual Channel (Targeted).  <br/> |
   
Each group will need a unique set of Office installation files: one that comes from the most recent release of Semi-Annual Channel, and one that comes from the most recent release of the Semi-Annual Channel (Targeted). To download and deploy these different releases of Office to our two groups, we'll create two configuration files, which are used to define which versions of Office to download and deploy. Each of the configuration files downloads and deploys a different build of Office: one from Semi-Annual Channel and one from Semi-Annual Channel (Targeted). For more details on the update channels, see [Overview of update channels for Office 365 ProPlus](overview-of-update-channels-for-office-365-proplus.md).
  
This article includes recommendations on how to deploy Office 365 ProPlus and why we make those recommendations. We can't cover all possible situations, of course, so we've aimed for a common scenario that can be used as a template for your own deployment. Where appropriate, we link to reference articles for further customizing your Office deployment, such as adding more languages
  
## Create shared folders for Office installation files and updates

Because we're deploying Office 365 ProPlus from a local source, we have to create folders to store the Office installation files. We'll create one parent folder and two child folders, one for the version of Office from Semi-Annual Channel and one for the version of Office from Semi-Annual Channel (Targeted). This structure is similar to the Office CDN structure.
  
 **Step 1: Create the following folders:**
  
|**Folder Path**|**Purpose**|
|:-----|:-----|
|\\\Server\Share\O365  <br/> |Stores the ODT and the configuration files that define how to download and deploy Office  <br/> |
|\\\Server\Share\O365\SAC  <br/> |Stores the Office 365 ProPlus installation files from Semi-Annual Channel  <br/> |
|\\\Server\Share\O365\SACT  <br/> |Stores the Office 365 ProPlus installation files from Semi-Annual Channel (Targeted)  <br/> |
   
These folders will include all the Office installation files we need to deploy. You can create whatever structure works for your organization, of course, but we'll refer to this setup in our examples.
  
 **Step 2: Assign Read permissions for your users**
  
Installing Office from a shared folder requires only that the user have Read permission for that folder, so we'll assign Read permission to everyone. For details about how to create shared folders and assign permissions, see [Shared Folders](http://go.microsoft.com/fwlink/p/?LinkId=184710)
  
> [!NOTE]
> In our example, we have just one shared folder on the network, but many organizations make the Office installation files available from multiple locations. Using multiple locations can help improve availability and minimize the effect on network bandwidth. For example, if some of your users are located in a branch office, you can create a shared folder in the branch office. Those users can then install Office from the local network. You can use the Distributed File System (DFS) role service in Windows Server to create a network share that is replicated to multiple locations. For more information, see [DFS Management](https://technet.microsoft.com/library/cc732006.aspx). 
  
## Download the installation files for Office 365 ProPlus

We'll use the ODT to download the installation files for Office from the CDN. The deployment tool is run from the command line and uses a configuration file to determine what settings to apply when downloading or deploying Office.
  
 **Step 1: Download the Office Deployment Tool**
  
Download the ODT from the [Microsoft Download Center](https://www.microsoft.com/en-us/download/details.aspx?id=49117) to \\\Server\Share\O365 (or the folder you created above). If you've already downloaded the ODT, make sure you have the latest version.
  
After downloading the file, run the self-extracting executable file, which contains the ODT executable (setup.exe) and a sample configuration file (configuration.xml).
  
 **Step 2: Create a configuration file for group 1**
  
To download and deploy Office 365 ProPlus for group 1, we'll create a configuration file that defines the appropriate settings for the ODT.
  
Using a text editor, copy and paste the following into a text file and save it as **config-group1-SAC.xml** in the **\\\Server\Share\O365** folder.
  
```
<Configuration> 
  <Add SourcePath="\\server\share\O365\SAC" 
       OfficeClientEdition="32" 
       Channel="Broad"> 
   <Product ID="O365ProPlusRetail" > 
     <Language ID="en-us" />      
     <Language ID="ja-jp" />      
     <ExcludeApp ID="Publisher" />
   </Product> 
  </Add> 
  <Updates Enabled="TRUE" 
           UpdatePath=""
           Channel="Broad" />  
  <Display Level="None" 
           AcceptEULA="TRUE" />
</Configuration>

```

This configuration file is used to download Office 365 ProPlus installation files and then deploy them to the group 1 users. Here's more detail on how the XML settings define what to download and what to install:
  
|**Value**|**Description**|
|:-----|:-----|
|SourcePath="\\\Server\Share\O365\SAC"  <br/> |Office will be downloaded to and then installed from **\\\server\share\O365\SAC** on our network. <br/> |
|OfficeClientEdition="32"  <br/> |Downloads and installs the 32-bit edition of Office  <br/> |
|Channel="Broad"  <br/> |Downloads and installs the Office installation files from Semi-Annual Channel  <br/> |
|Product ID="O365ProPlusRetail"  <br/> |Downloads and installs Office 365 ProPlus  <br/> |
|Language ID="en-us"  <br/> Language ID="ja-jp"  <br/> |Downloads and installs English and Japanese versions of Office  <br/> |
|ExcludeApp ID="Publisher"  <br/> |When installing Office, Publisher will be excluded  <br/> |
|Updates Enabled="TRUE"  <br/> |After installation, Office will check for updates  <br/> |
|UpdatePath=""  <br/> |After installation, updates for Office will come from the Office CDN  <br/> |
|Channel="Broad"  <br/> |After installation, updates to Office will come from Semi-Annual Channel  <br/> |
|Display Level="None"  <br/> |Installs Office silently, without displaying the user interface.  <br/> |
|AcceptEULA="TRUE"  <br/> |When installing Office, accepts the Microsoft Software License Terms automatically  <br/> |
   
Note that the Office installation files and Office updates will come from Semi-Annual Channel. For more details on the most recent version of Office based on the different update channels, see [Office 365 client update channel releases](https://technet.microsoft.com/en-us/office/mt465751.aspx).
  
 **Step 3: Create a configuration file for group 2**
  
Using a text editor, copy and paste the following into a text file and save it as **config-group2-SACT.xml** in the \\\Server\Share\O365 folder.
  
```
<Configuration> 
  <Add SourcePath="\\server\share\O365\SACT" 
       OfficeClientEdition="32" 
       Channel="Targeted"> 
   <Product ID="O365ProPlusRetail" > 
     <Language ID="en-us" />      
     <Language ID="ja-jp" />      
     <ExcludeApp ID="Publisher" />
   </Product> 
  </Add> 
<Updates Enabled="TRUE" 
         UpdatePath=""
         Channel="Targeted" />  
<Display Level="None" 
         AcceptEULA="TRUE" />
</Configuration>
```

This configuration file is used to download Office installation files and then deploy them to the group 2 users. The settings are exactly the same as the first configuration file, except the source path points to a different folder (SACT), and the installation channel and update channel are both set to Semi-Annual Channel (Targeted).
  
 **Step 4: Customize the configuration files for your environment**
  
To change the options from our example, you can edit the XML elements and attributes in the configuration files. For example, if you want to add a third language, you can insert an additional language element with the appropriate ID. You can also create additional configuration files for other groups you want to deploy to, such as a group that needs to receive updates from a different channel.
  
For more information about the configuration options, see [Configuration options for the Office Deployment Tool](configuration-options-for-the-office-2016-deployment-tool.md).
  
 **Step 5: Run the ODT executable in download mode for group 1**
  
From a command prompt, run the ODT executable in download mode and with a reference to the configuration file for group 1:
  
 `\\server\share\O365\setup.exe /download \\server\share\O365\config-group1-SAC.xml`
  
The files should begin downloading immediately. After running the command, go to **\\\server\share\O365\SAC** (or the download location you defined in the configuration file) and look for an Office folder with the appropriate files in it.
  
If you run into problems, make sure you have the newest version of the ODT and make sure your configuration file and command reference the correct location. You can also troubleshoot issues by reviewing the log file in the %temp% directory.
  
 **Step 6: Run the ODT executable in download mode for group 2**
  
From a command prompt, run the ODT executable in download mode and with a reference to the configuration file for group 2:
  
 `\\server\share\O365\setup.exe /download \\server\share\O365\config-group2-SACT.xml`
  
The files should begin downloading immediately. After running the command, go to **\\\server\share\O365\SACT** (or the download location you defined in the configuration file) and look for an Office folder with the appropriate files in it.
  
## Deploying Office 365 ProPlus

To deploy Office, we'll provide two commands that users can run from their client computers. The first command installs Office for client computers in group 1 and the second for group 2. The commands run the ODT in configure mode and with a reference to the appropriate configuration file, which defines which version of Office to install on the client computer.
  
Users who run these commands must have local admin privileges on their computer and must have read permissions to the share (**\\\server\share\O365**, in our case).
  
 **Step 1: Run the commands for group 1**
  
From the client computers for group 1, run the following command from a command prompt with admin privileges:
  
 `\\Server\Share\O365\setup.exe /configure \\Server\Share\O365\config-group1-SAC.xml`
  
 **Step 2: Run the commands for group 2**
  
From the client computers for group 2, run the following command from a command prompt with admin privileges:
  
 `\\Server\Share\O365\setup.exe /configure \\Server\Share\O365\config-group2-SACT.xml`
  
This command is the same as group 1, except that it references the configuration file for group 2.
  
> [!NOTE]
> Most organizations will use this command as part of a batch file, script, or other process that automates the deployment. In those cases, you can run the script under elevated permissions, so the users will not need to have admin privileges on their computers. 
  
 **Step 3: Verify that installation was successful**
  
After running the command, the Office installation should start immediately. If you run into problems, make sure you have the newest version of the ODT and make sure your configuration file and command reference the correct location. You can also troubleshoot issues by reviewing the log file in the %temp% and %windir%\temp directories.

## Related topics

[Configuration options for the Office Deployment Tool](configuration-options-for-the-office-2016-deployment-tool.md)
  
[Overview of the Office Deployment Tool](overview-of-the-office-2016-deployment-tool.md)
  
[Deployment guide for Office 365 ProPlus](deployment-guide-for-office-365-proplus.md)
  
[Best practices](best-practices/best-practices.md)
  

