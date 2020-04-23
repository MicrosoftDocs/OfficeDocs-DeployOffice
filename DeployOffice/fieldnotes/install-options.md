---
title: Install options for Microsoft 365 Apps
author: davguent
ms.author: davguent
manager: daryltu
audience: ITPro 
ms.topic: article 
ms.service: o365-proplus-itpro
localization_priority: 
description: 
ms.custom: 
ms.collection: 
---

# Choose how to install Microsoft 365 Apps

> [!NOTE]
> This article was written by Microsoft experts in the field who work with enterprise customers to deploy Office.

There are a variety of options to choose from when installing Microsoft 365 Apps (formerly known as Office 365 Business or ProPlus).  This article outlines the advantages and disadvantages of each approach to help you make the right choice for your organization. We assume that most customers are coming from an on-premises only solution and are considering moving to a hybrid or cloud strategy to reduce the overall cost of ownership.

## Anatomy of the Microsoft 365 Apps package

Microsoft 365 Apps was designed to leverage Office 365 Content Delivery Network (CDN) which stores all the Office files needed for installation.  IT Pros use Office Deployment Tool (ODT) to optionally download installation files using parameter Setup.exe /download Configuration.xml. This creates a folder named ‘Office’ with all local Microsoft 365 Apps installation files with size approximately 2.8 GB (one language).  All files below are sorted by size.  You’ll notice one file stream.x64.x-none.dat, represents 80% of Office.  This is because this file contains all language neutral content of Office (all products Word, Excel, Visio, Project etc.).  The second set of .dat files represent support languages which ~370 MB a piece.  Finally, the last file I want to highlight is the v64.cab or v32.cab.  This file is required for ODT to deem installation media valid and is required for local installation, automatically provided for you when downloading the latest build for respective channel.  Omitting this file within deployment package may lead to downloading entire content from CDN.   

:::image type="content" source="../images/install-options-1.png" alt-text="Details of the installation package for Microsoft 365 Apps, including the Office Deployment Tool":::

The installation options are applicable to initial install\upgrade to Microsoft 365 Apps as well as subsequent additions, referred to as “2nd Installs” of language packs, proofing tools and the addition of products such as Visio or Project for existing installations.  Please see [Best practices from the field: Build dynamic, lean, and universal packages for Microsoft 365 Apps](build-dynamic-lean-universal-packages.md) for more information on this approach.

The flowchart below is a comparison of install options, including consideration of network transport.  Network optimization features may include peer to peer technologies such as Configuration Manager Peer Cache or Delivery Optimization (DO) to reduce network bandwidth demands where possible.  

:::image type="content" source="../images/install-options-2.png" alt-text="Options for installing Microsoft 365 Apps":::

Note: Regardless of selection, the [Office Deployment Tool (ODT)](../overview-of-the-office-2016-deployment-tool.md) will be used to install Microsoft 365 Apps.  

## Configuration Manager Hybrid – subset of content (Microsoft recommended)

Advantages:
- Continue to use well-known established processes for controlling the installation time, user experience, and compliance reporting
- Reduces the amount of data required to be pulled down by clients from DP, e.g. through VPN. Offloads work to Office CDN using local internet breakout
- Supports advanced network caching technologies such as Configuration Peer Cache, Microsoft Connected Cache and Delivery Optimization to reduce bandwidth consumption.
- Reduces the amount of content required to download each month if you have chosen to keep installation packages always up to date.

Consideration:
- Network optimization features like Configuration Peer Cache, Microsoft Connected Cache and Delivery Optimization require configuration review to ensure optimally configured.

Disadvantages:
- Hybrid workflow is not currently built natively into the Configuration Manager wizard.  The IT Pro must manually update the configuration.xml to support AllowCDNFallback + MatchPreviousMSI or MatchInstalled.  Additionally, intentional decision must be made to include or omit content in installation package.

## Configuration Manager On-premises – full content

Advantages: 
- Works with existing workflow within Configuration Manager wizard to build a Microsoft 365 Apps installation package.
- IT Pro can pre-stage content on workstation over time using Configuration Manager, so installation will have all local installation files present to ensure fastest installation times.
- IT Pro can leverage Peer Cache to reduce bandwidth consumption.

Considerations:
- Microsoft Connected Cache and Delivery Optimization technologies are not applicable.

Disadvantages:
- Office folder containing build\installation files will be superseded every month. IT Pro can either refresh and replicate content to all Distribution Points every month or rely on updates being applied shortly after installation.  Failure to do so may lead to downgrading clients for second install scenario.
- Will bloat storage space on Distribution Points for every permutation of installation media by architecture and channel.
- Large content replications to remote locations may cause network outage.

## Configuration Manager Hybrid – Cloud Management Gateway (CMG)

Advantages:
- Ideal for scenarios where workstations are primarily remote.  Clients do not need to connect to corporate network to pull installation media from Distribution Points.
- Cloud Distribution Points only need to host ODT + Configuration.xml for each installation package.
- Aligns with “Lean Install” best practice.

Consideration:
- Configuration Manager cannot dynamically assign deployment package to a collection based on where its geographically located.  For example, on-premises all content and remote no content.

Disadvantages:
- Cloud subscription cost
- Management data sent through cloud service.

## Intune Cloud 

Advantages:
- Intune native supports Microsoft 365 Apps installation.
- Intune allows customization of Configuration.xml.

Consideration:
- Customers moving to Intune for overall device management will have to evaluate the overall configuration of the service.

Disadvantages:
- Intune uses a configuration service provider (CSP) to install and manage Office.  This prevents flexibility of “Lean” second installs to add Visio, Project or additional languages.  Only one policy containing configuration can apply to a machine.  While it’s possible to support variations by group exclusions, additional planning is required.

## File Share On-premises

Advantages:
- Appropriate for customers who don’t use Configuration Manager or 3rd party tools which may not support Microsoft 365 Apps deployment.

Disadvantages:
- Overhead in repeatedly downloading and refreshing content on-premises for every permutation of Office by architecture and channel supported by customer.
- Customer may need to adopt other technologies like DFS-R and DFS-N to replicate content to file shares globally to remote sites.
- No caching technology available which can reduce network impact.

## Portal Cloud 

Advantages:
- The most direct and simple method of installing Microsoft 365 Apps.

Disadvantages:
- Requires end user Administrator rights to perform installation which is unlikely and against Microsoft security best practices.
- Does not permit advanced customization of configuration.xml.
