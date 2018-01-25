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
description: "This article gives step-by-step instructions for how to plan your deployment of Office 365 ProPlus. The article is intended for administrators in enterprise environments working with hundreds or thousands of computers."
---

# Plan your deployment of Office 365 ProPlus

Follow the steps in this article to plan your deployment of Office 365 ProPlus in your organization. As part of this plan, you will choose how to deploy Office, how to manage updates to Office, what deployment tool to use, and whether to deploy and install from a local source on your network or from the cloud.

![Deployment framework for Office 365 ProPlus](images/plan-office-365-proplus-01.png)

In addition to this guidance, we recommend customers use [Microsoft Fastrack](https://fasttrack.microsoft.com/office) to help with their deployment. FastTrack onboarding services are available with the purchase of 50 or more seats of Office 365 Enterprise and Office 365 Business SKUs, along with paid Government, Kiosk, and Nonprofit SKUs. 

## Before you begin 

If you haven't already, complete the [asssessment of your environment and infrastructure](assess-deploy-office-365-proplus-with-Configuration-Manager.md). This assessment will help you make key decisions as part of planning your deployment.

## Step 1 - Choose how you want to deploy Office 365 ProPlus 

Choose what tool you want to use to deploy Office 365 ProPlus:

- System Center Configuration Manager (Current Branch): We recommend this tool for organizations that already use Configuration Manager to distribute and manage software.  Configuration Manager scales for large environments and enables extensive control over installation, updates, and settings.

- Office Deployment Tool: We recommend this tool for organizations that do not have Configuration Manager and that still want to manage their deployment. Like Configuration Manager, the Office Deployment Tool gives you contorl over which Office applications are installed, how Office is updated, as well as the architecture, languages, and installation experience for your users. You can also use the ODT to download installation files that can be deployed using third-party software distribution tools.
    
- Self-install: You can also have your users install Office 365 ProPlus directly from the Office 365 portal. This method requires the least amount of administrative setup, but gives you less control over the deployment. For more details self-installation, see [Set up Office 365 for business](https://support.office.com/en-US/Article/set-up-Office-365-for-business-6a3a29a0-e616-4713-99d1-15eda62d04fa).

Many organizations will use a combination of these tools for different users. For example, an organization might use Configuration Manager to deploy Office to most of their users, but enable self-install for a small group of remote workers.

> [!NOTE]
> **Best practice:** If you already use Configuration Manager, use that. If you don't, use the Office Deployment Tool--that can be used on its own or in conjunction with a third-party tool. For small groups of  users who are not frequently connected to your network, consider allowing them to self-install directly from the Office portal.     

##Step 2 - Choose the source location of the Office installation files

You can deploy Office directly from the cloud or download the Office files and deployment them from your network. In some cases, your choice of distribution method determines your source location:

- Configuration Manager from a local source: If you use Configuration Manager, you will download the files from the Office CDN and deploy them from distribution points on your network.
- Office Deployment Tool from the cloud: You manage your deployment with the ODT and Office is installed on client devices directly from the Office CDN.
- Office Deployment Tool from a local source: You manage your deployment with the ODT and Office is downloaded to a local source on your netowrk and installed on client devices from there. 
- Self-install from the cloud: If users self-install from the Office portal, that installation will always use the Office CDN.
- 
  > [!NOTE]
> **Best practice:** If you're using the Office Deployment Tool and if you have the network capacity, we recommend installing Office from the cloud. It's more efficient. If you use Configuration Manager, it will deploy from a local source. If you use self-install, your users will install from the cloud. 

##Step 3 - Choose how to manage updates to Office

You can manage updates with the same tool that you deploy Office, but it's not required. Same with location: you can manage them from the cloud or from a local source.

Choose how to manage updates:

- Manage updates automatically from the cloud: Many organizations deploy with one tool (such as Configuration Manager), but allow updates to be automically applied from the Office Content Delivery Network. You still control frequency of the updates--it's defined as part of the initial deployment--but it's much less work for the administrators.  

- System Center Configuration Manager (Current Branch):  If you deploy  Office with System Center Configuration, you can also use it to manage Office updates. The benefits are the same:  Configuration Manager scales for large environments and enables extensive control over installation, updates, and settings.

- Office Deployment Tool: Like Configuration Manager, the Office Deployment Tool gives you more control over how Office is updated. You can also use the ODT to download update files that can be deployed using third-party software distribution tools.

- Self-manage. All users who sef-install Office will either be automatically updated from the Office CDN or manage their updates on their own. 
    
As with installation, you can use a combination of methods for different users. 

> [!NOTE]
> **Best practice:** We recommend managing your updates automatically from the cloud. It might require more network capacity, but it's more efficient.

## Step 2 - Choose your udpate channels

With Office 365 ProPlus, you can control how frequently your users receive feature updates to their Office applications. To do so, you deploy one of three different update channels to different groups of users:

- Monthly Channel: Provide users with the newest features of Office as soon as they're available.

- Semi-Annual Channel: Provide users with new features of Office every six months, in January and July

- Semi-Annual Channel (Targeted): Provide pilot users and application compatibility testers the opportunity to test the next Semi-Annual Channel. Releases every six months in March and September, four months ahead of the Semi-Annual Channel.

Which users get which update channel depends on several factors, including how many line-of-business applications, add-ins, or macros that you need to test. To help you make this decision, see [Overview of update channels for Office 365 ProPlus](overview-of-update-channels-for-office-365-proplus.md).

We recommend identifying a small group of representative users who can pilot new features of Office,and deploying the Semi-Annual (Targeted) channel to them. This group should cover critical business functions and their devices should include all your critical line-of-business applications, add-ins, and macros. This group--the **Pilot Deployment Ring**--will receive updates six months ahead of the rest of your organization.

You should deploy the Semi-Annual Channel to the remainder of your users as part of the  **Broad Deployment Ring**. 

> [!NOTE]
> **Best practice:** We recommend creating a Pilot Deployment Ring of a small group of representative users and deploying the Semi-Annual Channel (Targeted) to them. Deploy the Semi-Annual Channel (the Broad Deployment Ring)to the rest of your organization. This process ensures a six-month lead time for testing new  Office feature updates before they're deployed to your entire organization. 

## Step 3 - Choose what Office applications to deploy

You can choose what product suite to deploy and, within the suite, which Office applications to include. Applications that are initially excluded can be added back later, just as applications that are initially included can be removed later. When deciding what to deploy, consider the following: 

- We recommend Office 365 ProPlus for most organizations, as that xx.
- Microsoft supports different versions of Project and Visio running alongside  Office 365 ProPlus. Customers can use their existing Project and Visio MSI versions, or deploy the Click-to-Run versions that support traditional volume licensing and Office 365 licensing models. We recommend xx as a best practice.



|What to deploy    |Choices                   |Best practices                                 |
|-------------------------|-------------------------|--------------------------------------|
|Product suite      |         |         |
|Office apps      |         |         |
|Project and Visio      |         |         |

## Step 3 - Choose what architectures to deploy 

xxxxPlanning should be completed to identify the deployment scenarios and use cases for the 64-bit architecture version of Office 365 ProPlus. The deployment plan should include how existing Office 64-bit users will be transitioned to the new Office 365 ProPlus client.

## Step 4 - Choose what languages to deploy--and how to deploy them

[Recommend regional packages. Can run a report and gather their top language packs with very high usage. Include high usage languages and the other. Include all languages in configuring updates for languages--need to include all required and optional languages.]

You can install language accessory packs after you’ve deployed Office 365 ProPlus in one of its base languages. There are two ways to install language accessory packs:

- Have your users download and install the language accessory packs that they need from the Office 365 portal.
- Use Configuration Manager to deploy the appropriate language accessory packs to your users.

For more details, see [Overview of deploying languages in Office 365 ProPlus](overview-of-deploying-languages-in-office-365-proplus.md).


xxx
Languages are downloaded and installed by using the Office Deployment Tool. System Center Configuration Manager packages will be broken up by regions, where each region will have its own set of languages that accompany the Office 365 ProPlus files. Enterprise Managed has adds each language to the self-service catalog for users to install post-Office deployment. Because the language packs are about 200 MB each, and self-service of languages outside the region is an occurrence that happens rarely, all languages are not replicated to all regions. The default language is the one that is most commonly used in that region, together with instructions on how to change the default language. For the self-service languages, such as a user in the LATAM region who wants to add German, the ** Product ID=" LanguagePack"** element in the Office Deployment Tool is used.

Regarding Language Packs, if you have many different Languages, you can include say top 3  Language Packs in package and rest could be published as an Optional leaving to users to download.


Languages are downloaded and installed by using the Office Deployment Tool. System Center Configuration Manager packages will be broken up by regions, where each region will have its own set of languages that accompany the Office 365 ProPlus files. Enterprise Managed has adds each language to the self-service catalog for users to install post-Office deployment. Because the language packs are about 200 MB each, and self-service of languages outside the region is an occurrence that happens rarely, all languages are not replicated to all regions. The default language is the one that is most commonly used in that region, together with instructions on how to change the default language. For the self-service languages, such as a user in the LATAM region who wants to add German, the ** Product ID=" LanguagePack"** element in the Office Deployment Tool is used.
xxxxx


## Step 5 - Plan the installation and update experience for your users

xxxxxUser experience
Expose updates or run silent
Wait for user or force installation
Enforce installation and reboot
Wait till a specified deadline for installation


|Installation experience    |Choices                   |Notes                                 |
|-------------------------|-------------------------|--------------------------------------|
|Install experience      |         |         |

## Step 6 - Define your client packages
Because Office 365 ProPlus is a customizable package, you should determine what application sets each business group should get. Applications that are initially excluded can be added back in later; specific applications can be removed after Office 365 ProPlus has already been installed. If an application isto be excluded from the Office 365 ProPlus deployment, you should create a plan to restore or replace the application. 


## Step 6 - Define your deployment groups
[investigate deployment rings vs validation rings]

Deployment groups are collections of clients that will receive the same Office bits and the same updates from the same channel. For example, you can define one deployment group for all the devices in your organization meet the following requirements:

- Tool: Office will be installed by Configuration Manager (Current Branch)
- Updates: Office updates will be managed automatically from the cloud    
- Product suite: Office 365 ProPlus 
- Languages: English and Japanese
- Architecture: 64-bit editions
- Update channels: Semi-Annual Channel 
- Install experience: Office will install silently on all clients

Clients with different requirements, such as 32-bit architecture or different update, will need to be in different deployment groups. 
## Step 7 - Define your group policy settings

xxxOffice offers about 3,000 group policy settings to allow a granular control of security, privacy, and user experience. In most cases, only a subset of these are needed to adjust the configuration to the needs, requirements, and intended user experience of an organization. It is important to include other departments that are responsible for IT security, data protection, and privacy early to get a sign-off of the GPOs before the actual deployment happens.

Call to action
Review Best practices: Group policy and Office 365 ProPlus with more than 250 proven, commonly set policies for users and computers. Check the listed additional settings.
Adjust the settings to fit your needs and requirements.
Get a Resultant Set of Policy (RSOP) of today's policies and review them. Identify settings not covered in the Best Practices for Office 365 ProPlus, and consider adding them if the setting is still needed.
Check which settings where introduced in Office 2013 and Office 2016 and consider adding them to your list of settings.
Identify which entity in your organization must sign off security and privacy related settings, present them and get a sign-off.
Get a sign off and hand the settings over to the team that administers the group Policy Settings. The Best Practices settings can easily be imported into your environment.


## Step 7 - Plan for shared computers

## Step 8 - Plan for deploying Office 365 ProPlus to Macs
- Microsoft supports installing Office 365 ProPlus alongside the most recent previous version of the Office suite, but we don't recommend it. If you plan to have two versions of Office on the same computer, you should plan to transition to using only Office 365 ProPlus when possible.  

## Step 8 - Plan your upgrade from existing versions of Office
- Microsoft supports installing Office 365 ProPlus alongside the most recent previous version of the Office suite, but we don't recommend it. If you plan to have two versions of Office on the same computer, you should plan to transition to using only Office 365 ProPlus when possible.  

## Step 9 - Review exit criteria

Before beginning your deployment, make sure you've completed the planning exit criteria:

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
  

