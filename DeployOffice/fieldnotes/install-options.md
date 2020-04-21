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
 
Note: Regardless of selection, the Office Deployment Tool (ODT) will be used to install Microsoft 365 Apps.  
Configuration Manager Hybrid – subset of content (Microsoft recommended)
Advantages:
•	Continue to use well-known established processes for controlling the installation time, user experience as well as compliance reporting
•	Reduces the amount of data required to be pulled down by clients from DP, e.g. through VPN. Offloads work to Office CDN using local internet breakout
•	Supports advanced network caching technologies such as Configuration Peer Cache, Microsoft Connected Cache and Delivery Optimization to reduce bandwidth consumption.
•	Reduces the amount of content required to download each month if you have chosen to keep installation packages always up to date.
Consideration:
•	Network optimization features like Configuration Peer Cache, Microsoft Connected Cache and Delivery Optimization require configuration review to ensure optimally configured.
Disadvantages:
•	Hybrid workflow is not currently built natively into the Configuration Manager wizard.  The IT Pro must manually update the configuration.xml to support AllowCDNFallback + MatchPreviousMSI or MatchInstalled.  Additionally, intentional decision must be made to include or omit content in installation package.
Configuration Manager On-premises – full content
Advantages: 
•	Works with existing workflow within Configuration Manager wizard to build a Microsoft 365 Apps installation package.
•	IT Pro can pre-stage content on workstation over time using Configuration Manager, so installation will have all local installation files present to ensure fastest installation times.
•	IT Pro can leverage Peer Cache to reduce bandwidth consumption.
Considerations:
•	Microsoft Connected Cache and Delivery Optimization technologies are not applicable.
Disadvantages:
•	Office folder containing build\installation files will be superseded every month. IT Pro can either refresh and replicate content to all Distribution Points every month or rely on updates being applied shortly after installation.  Failure to do so may lead to downgrading clients for second install scenario.
•	Will bloat storage space on Distribution Points for every permutation of installation media by architecture and channel.
•	Large content replications to remote locations may cause network outage.
Configuration Manager Hybrid – Cloud Management Gateway (CMG)
Advantages:
•	Ideal or scenarios where workstations are primarily remote.  Clients do not need to connect to corporate network to pull installation media from Distribution Points.
•	Cloud Distribution Points only need to host ODT + Configuration.xml for each installation package.
•	Aligns with “Lean Install” best practice.
Consideration:
•	Configuration Manager cannot dynamically assign deployment package to a collection based on where its geographically located.  For example, on-premises all content and remote no content.
Disadvantages:
•	Cloud subscription cost
•	Management data sent through cloud service.
Intune Cloud 
Advantages:
•	Intune native supports Microsoft 365 Apps installation.
•	Intune allows customization of Configuration.xml.
Consideration:
•	Customers moving to Intune for overall device management will have to evaluate the overall configuration of the service.
Disadvantages:
•	Intune uses a configuration service provider (CSP) to install and manage Office.  This prevents flexibility of “Lean” second installs to add Visio, Project or additional languages.  Only one policy containing configuration can apply to a machine.  While it’s possible to support variations by group exclusions, additional planning is required.
File Share On-premises
Advantages:
•	Appropriate for customers who don’t use Configuration Manager or 3rd party tools which may not support Microsoft 365 Apps deployment.
Disadvantages:
•	Overhead in repeatedly downloading and refreshing content on-premises for every permutation of Office by architecture and channel supported by customer.
•	Customer may need to adopt other technologies like DFS-R and DFS-N to replicate content to file shares globally to remote sites.
•	No caching technology available which can reduce network impact.
Portal Cloud 
Advantages:
•	The most direct and simple method of installing Microsoft 365 Apps.
Disadvantages:
•	Requires end user Administrator rights to perform installation which is unlikely and against Microsoft security best practices.
•	Does not permit advanced customization of configuration.xml.
Additional References:
Plan for the cloud management gateway in Configuration Manager























There are a variety of options to choose from when delivering software updates for Microsoft 365 Apps (formerly known as Office 365 ProPlus).  This article outlines the advantages and disadvantages of each approach to help you make the right choice. We assume that most customers are coming from an on-premises only solution and are contemplating moving to a hybrid or cloud strategy to reduce the overall cost of ownership.

## Evaluating the Options

The overwhelming majority of customers we work with in the field remain on-premises when delivering software updates for Microsoft 365 Apps.  The original version of Office 2013 Click-to-Run was released years ago when update options were  limited and network transport optimizations didn't exist.  Many customers used an on-premises file share and mirrored Office CDN content each month.  Microsoft 365 Apps has evolved since then to provide customers with many more options, including multiple channels, languages, and 64-bit architecture. These additional options can lead to a large increase in the number of content IT Pros must download and replicate on-premises.

Since that time, there have been tremendous innovations in Windows and Configuration Manager that provide many new capabilities for servicing Office.  With so many choices and combinations, a visual aid may help you choose how to manage updates.  The flowchart below is a comparison of update options, with a special focus on network transport. Choosing an update option also determines what process is delivering notifications to the end user (Office or Configuration Manager or both).  For example, if the customer wants to hide or control the precise timing of software updates and the level of notifications, then Configuration Manager should be considered.  If the customer values network optimization and lowest cost of ownership to service Office, then update from CDN with Delivery Optimization (DO) should be considered.  

By default, Microsoft 365 Apps will update from Office CDN.  If you are a customer who currently delivers updates using one of the on-premises selections, you must [reverse policies and configurations to restore default behavior](../manage-office-365-proplus-updates-with-configuration-manager.md).  For example, if Office 365 Client Management was enabled to support Configuration Manager integration, those steps must be reversed. Configuration Manager client settings or domain policy should be set so that Office 365 Client Management is disabled. Once the change is made, Office will update against CDN  after the next restart of the  Microsoft Office Click-to-Run service. It is always a good idea to perform such an action with phased deployment processes to monitor compliance and network impact.

:::image type="content" source="../images/update-options-flowchart.png" alt-text="Update options for Microsoft 365 Apps":::

## Network options for updates

Network optimization is an important consideration when delivering Office updates.  Microsoft recommends selecting an update option that includes peer-to-peer sharing technologies such as Configuration Manager or Office CDN. 

- File share: Server Message Block (SMB)
- Configuration Manager: Office 365 Client Management is Enabled, Background Intelligent Transfer Service (BITS) is used.
- Office CDN (optional Configuration Manager Connected Cache), Delivery Optimization (DO) is used.

By default, Office Click-To-Run installer uses the Windows' built in implementation of DO to download the content from the CDN.  When Configuration Manager has Office 365 Client Management enabled, BITS will be used.

## End-user notifications

End-user notifications for software updates are a key concern for any IT department.  By default, Microsoft 365 Apps updates automatically in the background.  If Office is open, notifications will be delivered to the end user over a period of days. For a full description of notifications and end-user experience, see [End-user update notifications for Office 365 ProPlus](../end-user-update-notifications-for-office-365-proplus.md). IT Pros can optionally silence all end-user Office notifications by using the "Hide update notifications from users" policy. 

> [!NOTE]
> Notifications related to deadlines cannot be suppressed.

When Office 365 Client Management is enabled (OfficeMgmtCom=1), Configuration Manager will also deliver notifications. To learn more, see [Understanding Office 365 ProPlus Updates for IT Pros](https://techcommunity.microsoft.com/t5/office-365-blog/understanding-office-365-proplus-updates-for-it-pros-cdn-vs-sccm/ba-p/795728).  It is important to carefully consider ramifications of user notifications when considering an update strategy. 

- File share: Office notifications only
- Configuration Manager: Configuration Manager notifications only unless Office updates are pre-staged.
- Office CDN: Office notifications only

Office and Configuration Manager notifications can both occur when Office 365 Client Management Enabled (OfficeMgmtCom=1) and when Configuratiion Manager software deployment has Available time prior to deadline.  Meaning, IT Pro pre-staged Office content using Configuration Manager on the machine prior to deadline. In this scenario, both Configuration Manager and Office will deliver end-user notifications independently based on deadline defined in Configuration Manager. 

## Considerations for choosing how to deliver updates

The section below compares Office update approaches to help you choose the right option for your environment. For customers who are exclusively on-premises today, moving to a hybrid model is a likely outcome.  For customers who are green field or have goal to reduce long-term dependency on on-premises infrastructure, cloud only is best.

### Updates delivered from Office CDN (Microsoft recommended)

Advantages: 
- Supports advanced network optimization technologies like Delivery Optimization and Configuration Manager Connected Cache.  These solutions also support other Microsoft workloads such as Windows 10 updates (feature updates and quality updates), Windows 10 drivers, Windows Store files, Windows Store for Business files, Windows Defender definition updates, Win32 apps for Intune and SCCM Express Updates.
- IT Pro remains in control, but clients pull what is needed automatically.  No need for admin to micro-manage intentional downloads each month.
- Office was designed to update from the Microsoft CDN, which allows additional capabilities such as rollback or roll forward based on group policy configuration.
- Aligns with Microsoft's "Modern Workplace" where users roam and work remotely.

Considerations:
- The IT Pro must transition from push mentality to allow clients to pull content dynamically.
- The IT Pro will need to review the network topology to ensure clients are performing peer to peer sharing is optimal.
- Extensive controls of Delivery Optimization are available and require review.
- Microsoft validates signals from builds released prior to broad deployment referred to as "Throttling". This throttling means not all clients will receive the update at the same time and not appropriate for traditional Configuration Manager "maintenance windows" scenarios.

End-user notifications: Delivered by Office only.

### Updates delivered by Configuration Manager (on-premises)

Advantages: 
- Office clients fetch updates only from the closest distribution point.
- Full control over end-user notifications from Configuration Manager.

Disadvantages:
- Requires the IT Pro to download all the content required to support every permutation of channel, architecture, and combination of languages the organization supports.
- Every permutation of Office supported leads to exponential growth of package content. This content must then be replicated to every Distribution Point.
- By default, any required content not found on the Distribution Point will result in Office 365 client update failure.

> [!NOTE]
> A managed device downloads only the required changes from a Distribution Point. So when making multiple channels and architectures availble to clients, they will not download all the content, but only what's required for that client.

End-user notifications: Delivered by Configuration Manager only when Available time and Deadline are the same.  If Available time is prior to Deadline updates may be pre-staged, notifications may be delivered either by Configuration Manager or Office prior to deadline.

### Updates delivered by Configuration Manager (on-premises and cloud)

Advantages: 
- Optimizes bandwidth where IT Pro can stage the on-premises content that is required and offload content that isn't required to the CDN. A great example is languages. Use Configuration Manager inventory to identify primary languages and stage only those on-premises, offload secondary languages and proofing tools to pull from CDN. Fallback for non-downloaded content can be achieved by selecting 'If software updates are not available on distribution point in current, neighbor or site boundary groups, download content from Microsoft Updates' within Configuration Manager software deployment.
- Supports Configuration Manager Peer Cache feature but only for content which is staged on Distribution Points.

Disadvantages:
- The IT Pro must carefully consider which content to download and what should come from CDN.
- The IT Pro must make intentional decisions regarding specific builds\versions by channels to download each month.

Consideration:
- A subset of content not found on the Distribution Point is downloaded using BITS from the Microsoft CDN. (Note that the Configuration Manager Peer Cache feature does not support content that is downloaded from the Office CDN.)

End-user notifications: Delivered by Configuration Manager only when available time and deadline are the same.  If available time is prior to deadline updates may be pre-staged, notifications may be delivered either by Configuration Manager or Office prior to deadline.

### Updates delivered by Configuration Manager (cloud)

Advantages: 
- IT Pro remains in full control of software deployment available vs deadlines using Configuration Manager.  

Disadvantages:
- Each workstation will egress to the internet to download content via BITS from the Microsoft CDN. (Note that the Configuration Manager Peer Cache feature does not support content that is downloaded from the Office CDN.)
- The IT Pro must make intentional decisions regarding specific builds\versions by channels to download each month.

Consideration:
- All content will download from CDN as content is not present on distribution points.

End-user notifications: Delivered by Configuration Manager only when Available time and Deadline are the same.  If Available time is prior to deadline updates may be pre-staged, notifications may be delivered either by Configuration Manager or Office prior to deadline.

### Updates delivered from file share

Advantages: none

Disadvantages: This method is discouraged due to the high cost of ownership and repetitive, manual intensive processes.  Modern network peer to peer solutions like Delivery Optimization and Peer Cache don't apply when updating Microsoft 365 Apps update from a file share.

End-user notifications: Delivered only by Office.
