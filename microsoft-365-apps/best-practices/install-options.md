---
title: Choose how to install Microsoft 365 Apps
author: manoth-msft
ms.author: manoth
manager: dougeby
audience: ITPro 
ms.topic: conceptual 
ms.service: o365-proplus-itpro
ms.localizationpriority: medium
ms.collection: Tier3
description: "Choose how to install Microsoft 365 Apps for enterprise"
ms.date: 05/25/2024
---

# Choose how to install Microsoft 365 Apps

> [!NOTE]
> Authored by the Microsoft 365 Apps Rangers, this article outlines common practices observed across customer implementations. We advise assessing the relevance of this guidance for your organization and adapting the approach as necessary.

There are various options to choose from when installing Microsoft 365 Apps for enterprise. This article outlines the advantages and disadvantages of each approach to help you make the right choice for your organization. We assume that most customers are coming from an on-premises only solution and are considering moving to a hybrid or cloud strategy to reduce the overall cost of ownership.

## Anatomy of the Microsoft 365 Apps package

Microsoft 365 Apps was designed to use the Office 365 Content Delivery Network (CDN), which stores all the Office files needed for installation.  IT Pros can use the Office Deployment Tool (ODT) to download the installation files by using the setup.exe /download command in their configuration file. This download creates a folder named **Office** with all the Microsoft 365 Apps installation files. The size of the folder with one language is approximately 2.8 GB. 

The files shown here are sorted by size. You’ll notice that one file, stream.x64.x-none.dat, is over 2 GB. This file contains all the language-neutral content.  The second set of .dat files contain support languages, which are typically  about 370 MB each. The v64.cab or v32.cab file lets the ODT validate the installation media. This file is required for local installation and is automatically provided  when downloading the latest build for a respective channel. Omitting this file within a deployment package might lead to downloading entire content from the CDN instead of using the local source.

:::image type="content" source="./media/install-options/install-options-1.png" alt-text="A screenshot showing details of the installation package for Microsoft 365 Apps, including the Office Deployment Tool.":::

The installation options apply to initial install and upgrade to Microsoft 365 Apps as well as subsequent installations of language packs, proofing tools, and the addition of products such as Visio or Project. We call these subsequent installations "second installs". For more information on this approach, see [Best practices from the field: Build dynamic, lean, and universal packages for Microsoft 365 Apps](build-dynamic-lean-universal-packages.md).

The following flowchart is a comparison of install options, including the consideration of network transport.  Network optimization features can include peer to peer technologies such as Configuration Manager Peer Cache or Delivery Optimization (DO) to reduce network bandwidth demand.  

:::image type="content" source="./media/install-options/install-options-2.png" alt-text="A screenshot showing options for installing Microsoft 365 Apps.":::

The [Office Deployment Tool (ODT)](../deploy/overview-office-deployment-tool.md) is used to install Microsoft 365 Apps in all these options. 

## Configuration Manager hybrid – subset of content (Microsoft recommended)

Advantages:

- Continue to use well-known established processes for controlling the installation time, user experience, and compliance reporting.
- Reduces the amount of data required to be pulled down by clients from a distribution point. Offloads work to Office CDN using local internet breakout.
- Supports advanced network caching technologies such as Configuration Peer Cache, Microsoft Connected Cache, and Delivery Optimization to reduce bandwidth consumption.
- Reduces the amount of content required to download each month if you have chosen to keep installation packages always up to date.

Consideration:
- Network optimization features like [Configuration Peer Cache](/mem/configmgr/core/plan-design/hierarchy/client-peer-cache), [Microsoft Connected Cache](/mem/configmgr/core/plan-design/hierarchy/microsoft-connected-cache), and [Delivery Optimization](../updates/delivery-optimization.md) require configuration review to ensure they're optimally configured.

Disadvantages:
- Hybrid workflow isn't currently built into the Configuration Manager wizard. The IT Pro must manually update the configuration.xml to support AllowCDNFallback + MatchPreviousMSI or MatchInstalled.

To learn more about how to decide which content to include/exclude and implement this approach, have a look at [Right-sizing your initial deployment of Microsoft 365 Apps](right-sizing-initial-deployment.md).

## Configuration Manager on-premises – full content

Advantages: 
- Works with existing workflow within the Configuration Manager wizard to build a Microsoft 365 Apps installation package.
- IT Pro can pre-stage content on workstation over time using Configuration Manager, so installation will have all local installation files present to ensure fastest installation times.
- IT Pro can use Peer Cache to reduce bandwidth consumption.

Considerations:
- Microsoft Connected Cache and Delivery Optimization technologies aren't applicable.

Disadvantages:
- The Office folder containing the installation files is superseded every month. You can either refresh and replicate content to all distribution points every month or rely on updates being applied to the client shortly after installation. Failure to do so might lead to downgrading clients for second install scenario.
- Will increase storage space on distribution points for every permutation of installation media by architecture and channel.
- Large content replications to remote locations may cause network issues.

## Configuration Manager hybrid – Cloud Management Gateway (CMG)

Advantages:
- Ideal for scenarios where workstations are primarily remote. Clients don't need to connect to corporate network to pull installation media from distribution points.
- Cloud distribution points only need to host ODT + Configuration.xml for each installation package.
- Aligns with “Lean Install” best practice.

Consideration:
- Configuration Manager can't dynamically assign deployment package to a collection based on where it's geographically located.

Disadvantage:
- Cloud subscription cost.

## Intune cloud 

Advantages:
- Intune native supports Microsoft 365 Apps installation.
- Intune allows customization of Configuration.xml.

Consideration:
- Customers moving to Intune for overall device management would have to evaluate the overall configuration of the service.

Disadvantages:
- Intune uses a configuration service provider (CSP) to install and manage Office.  This prevents flexibility of “Lean” second installs to add Visio, Project, or additional languages.  Only one policy containing the configuration can apply to a machine.  While it’s possible to support variations by group exclusions, additional planning is required.

## File share on-premises

Advantages:
- Appropriate for customers who don’t use Configuration Manager or who use third-party tools that don't directly support Microsoft 365 Apps deployment.

Disadvantages:
- Admin overhead in repeatedly downloading and refreshing content on-premises for each permutation of Office by architecture and channel.
- Customer might need to adopt other technologies like DFS-R and DFS-N to replicate content to file shares globally to remote sites.
- No caching technology available to reduce network impact.

## Self-install from the portal

Advantages:
- The most direct and simple method of installing Microsoft 365 Apps.

Disadvantages:
- Requires end-user administrator permissions to install.
- Doesn't permit advanced customization of the installation with the configuration file.

## Related topics

[Build dynamic collections for Microsoft 365 Apps with Configuration Manager](build-dynamic-lean-configuration-manager.md)</br>
[Right-sizing your initial deployment](right-sizing-initial-deployment.md)
