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


