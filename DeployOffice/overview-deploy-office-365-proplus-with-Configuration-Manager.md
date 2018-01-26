---
title: "Overview: deploy Office 365 ProPlus with System Center Configuration Manager"
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
ms.assetid: 
description: "This article gives an overview of deploying Office 365 ProPlus with System Center Configuration Manager, including reasons to choose Office 365 ProPlus and Configuration Manager,and how deployment and update management works with Configuration Manager and Office."
---

# Overview on how to deploy Office 365 ProPlus with System Center Configuration Manager

This article gives an overview of deploying Office 365 ProPlus with System Center Configuration Manager, including reasons to choose Office 365 ProPlus and Configuration Manager,and how deployment and update management works with Configuration Manager and Office.

# Use Microsoft FastTrack to help with your deployment

We recommend customers use [Microsoft Fastrack](https://fasttrack.microsoft.com/office) to help with their deployment. FastTrack onboarding and adoption resources and services are available with the purchase of 50 or more seats of Office 365 Enterprise and Office 365 Business SKUs, along with paid Government, Kiosk, and Nonprofit SKUs. Migration assistance for mail and files is available with the purchase of 500 or more seats.

# How to plan, deploy, and manage Office 365 ProPlus

We recommend customers 
- Assess
- Plan
- Deploy
- Manage 

# Why Office 365 ProPlus?

Office 365 ProPlus is a user-based service that allows people to access Office experiences on up to 5 PCs or Macs and on their mobile devices. Because Office 365 ProPlus is a delivered as a service, there are differences in how you deploy, license, and activate it. For more details about these differences, see the Office 365 ProPlus product page, Getting started guide for deploying Office 365 ProPlus, and Overview of Office 365 ProPlus.

Office 365 ProPlus includes
the full Office applications
User-licensing (each user can install Office on up to 5 PCs, 5 tablets, and 5 mobile devices)
Subscription model
Regular feature updates
Use Office while update packages install in the background
Cloud-powered, intelligent features in the Office apps
Streamed to your deployment infrastructure or directd to PC


# Why System Center Configuration Manager (Current Brancy)?

xxDeploy Office on your terms
Configure & Deliver Office applications across your environment
Advertised optional packages and applications 

Orchestrated Updates
Integration into Software Updates workflow (CM 1602)
Integrates with Automatic Deployment Rules (ADR) (CM 1606)

Actionable Insights
Available Inventory & Reports

Config Mgr minimum version 1602
Supported Office 365 client channel version:
Monthly Channel
Semi-Annual Channel
Semi-Annual Targeted Channel
WSUS minimum version 4.0
Office COM object enabled for Office 365 client
COM object receives commands from Config Mgr
Configurable through Config Mgr, ODT, or GPO

Update process
Office publishes Office 365 client update packages through WSUS

ConfigMgr identifies applicable desktops

ConfigMgr refers to Office CDN for file list and downloads, and distributes required files to created update image

ConfigMgr informs desktops to update using distribution points as source path

PEER CACHE
What
Peer Cache is OS-independent, native ConfigMgr solutionproviding peer-to-peer content sharing “in” and “across” subnets
Allows a ConfigMgr client to share it’s content cache with peers
Easy to configure, no management
Introduced in earlier release but enhancements in CM 1706 specific for the management of ProPlus updates across service channels

HOW
Ensure you have CM 1706
Including updated CM agents on all clients
Opt in to pre-release features & enable site feature
Deploy client settings to select clients to configure them as Peer Cache Sources
Account for boundary group and subnet to maximize effectiveness

# How deploying and update management work with Office and Configuration Manager 

xxxx
Self-installation - good for BYOD, can't customize packages, requires updates from the CDN, requires admin privileges on device
Managed deployment


xx



# Manage Office 365 ProPlus with Configuration Manager

*Applies to: System Center Configuration Manager (Current Branch)*

Configuration Manager lets you manage Office 365 ProPlus apps in the following ways:

- [Office 365 Client Management dashboard](#office-365-client-management-dashboard): Beginning in Configuration Manager version 1610, you can review Office 365 client information from the Office 365 Client Management dashboard.    

- [Deploy Office 365 apps](#deploy-office-365-apps): Beginning in version 1702, you can start the Office 365 Installer from the Office 365 Client Management dashboard to make the initial Office 365 App installation experience easier. The wizard lets you configure Office 365 installation settings, download files from Office Content Delivery Networks (CDNs), and create and deploy a script application with the content.    

- [Deploy Office 365 updates](#deploy-office-365-updates): Beginning in Configuration Manager version 1602, you can manage Office 365 client updates by using the software update management workflow. When Microsoft publishes a new Office 365 client update to the Office Content Delivery Network (CDN), Microsoft also publishes an update package to Windows Server Update Services (WSUS). After Configuration Manager synchronizes the Office 365 client update from the WSUS catalog to the site server, the update is available to deploy to clients.    

- [Add languages for Office 365 update downloads](#add-languages-for-office-365-update-downloads): Beginning in Configuration Manager version 1610, you can add support for Configuration Manager to download updates for any languages supported by Office 365. Meaning Configuration Manager does not have to support the language as long as Office 365 does.  

- [Change the update channel](#change-the-update-channel-after-you-enable-office-365-clients-to-receive-updates-from-configuration-manager): You can use group policy to distribute a registry key value change to Office 365 clients to change the update channel.


## Office 365 Client Management dashboard  
The Office 365 Client Management dashboard provides charts for the following information:

- Number of Office 365 clients
- Office 365 client versions
- Office 365 client languages
- Office 365 client channels     
  For more information, see [Overview of update channels for Office 365 ProPlus](https://technet.microsoft.com/library/mt455210.aspx).

To view the Office 365 Client Management dashboard in the Configuration Manager console, go to **Software Library** > **Overview** > **Office 365 Client Management**. At the top of the dashboard, use the **Collection** drop-down setting to filter the dashboard data by members of a specific collection.

### Display data in the Office 365 Client Management dashboard
The data that is displayed in the Office 365 Client Management dashboard comes from hardware inventory. Enable hardware inventory and select the **Office 365 ProPlus Configurations** hardware inventory class for data to display in the dashboard.
#### To display data in the Office 365 Client Management dashboard
1. Enable hardware inventory, if it is not yet enabled. For details, see [Configure hardware inventory](\sccm\core\clients\manage\configure-hardware-inventory).
2. In the Configuration Manager console, navigate to **Administration** > **Client Settings** > **Default Client Settings**.  
3. On the **Home** tab, in the **Properties** group, click **Properties**.  
4. In the **Default Client Settings** dialog box, click **Hardware Inventory**.  
5. In the **Device Settings** list, click **Set Classes**.  
6. In the **Hardware Inventory Classes** dialog box, select **Office 365 ProPlus Configurations**.  
7.  Click **OK** to save your changes and close the **Hardware Inventory Classes** dialog box. <br/>The Office 365 Client Management dashboard starts displaying data as hardware inventory is reported.

