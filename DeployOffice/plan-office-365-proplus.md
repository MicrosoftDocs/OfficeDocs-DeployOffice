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

![Deploy with ODT or Configuration Manager](images/plan-office-365-proplus-03.png)

## Step 1 - Choose how you want to deploy Office 365 ProPlus 

Choose what tool you want to use to deploy Office 365 ProPlus:

- System Center Configuration Manager (Current Branch): We recommend this tool for organizations that already use Configuration Manager to distribute and manage software.  Configuration Manager scales for large environments and enables extensive control over installation, updates, and settings.

TO ADD: should we list the specific scenarios that are aviable vis this method for both install and update
Install from cloud - updates from cloud
Install from local source - updates from cloud
Install from local source - updates from local source
Optional - GPO control

- Office Deployment Tool: We recommend this tool for organizations that do not have Configuration Manager and that still want to manage their deployment. Like Configuration Manager, the Office Deployment Tool gives you control over which Office applications are installed, how Office is updated, as well as the architecture, languages, and installation experience for your users. You can also use the ODT to download installation files that can be deployed using third-party software distribution tools. For more details, see [Overview of the Office 2016 Deployment Tool](overview-of-the-office-2016-deployment-tool.md).

TO ADD: should we list the specific scenarios that are aviable vis this method for both install and update
Install from cloud - updates from cloud
Install from local source - updates from cloud
Install from local source - updates from local source
Optional - GPO control

- Self-install: You can also have your users install Office 365 ProPlus directly from the Office 365 portal. This method requires the least amount of administrative setup, but gives you less control over the deployment. For more details, see [Set up Office 365 for business](https://support.office.com/en-US/Article/set-up-Office-365-for-business-6a3a29a0-e616-4713-99d1-15eda62d04fa).

TO ADD: should we list the specific scenarios that are aviable vis this method for both install and update
Install from cloud - updates from cloud
Optional - GPO control

Many organizations will use a combination of these tools for different users. For example, an organization might use Configuration Manager to deploy Office to most of their users, but enable self-install for a small group of workers who are not frequently connected to the internal network.

> [!NOTE]
> **Best practice:** If you already use Configuration Manager, use it for deploying Office. If you don't use Configuration Manager, use the Office Deployment Tool--that can be used on its own or in combination with a third-party tool. For small groups of  users who are not frequently connected to your network, consider allowing them to self-install directly from the Office portal.     

## Step 2 - Choose the source location of the Office installation files

You can deploy Office directly from the cloud or download the Office files and deployment them from your network. In some cases, your choice of distribution method determines your source location:

- Configuration Manager from the cloud: You can configure Office settings and push a deployment to targeted devices which will install directly from the CDN.
- Configuration Manager from a local source: You can download the files from the Office CDN and deploy them from distribution points on your network.
- Office Deployment Tool from the cloud: You manage your deployment with the ODT and Office is installed on client devices directly from the Office CDN.
- Office Deployment Tool from a local source: You manage your deployment with the ODT and Office is downloaded to a local source on your netowrk and installed on client devices from there. 
- Self-install from the cloud: If users self-install from the Office portal, that installation will always use the Office CDN.
 
> [!NOTE]
> **Best practice:** If you're using the Office Deployment Tool and if you have the network capacity, we recommend installing Office from the cloud. It's more efficient. If you use Configuration Manager, it will deploy from a local source. If you use self-install, your users will install from the cloud. 

## Step 3 - Choose how to manage updates to Office

You can manage updates with the same tool that you deploy Office, but it's not required. Same with location: you can manage them from the cloud or from a local source.

Choose how to manage updates:

- Manage updates automatically from the cloud: Many organizations deploy with one tool (such as Configuration Manager), but allow updates to be automically applied from the Office Content Delivery Network. You still control frequency and type of update--those settings are defined as part of the initial deployment--but the overall process is much less work for the administrator.  

- System Center Configuration Manager (Current Branch):  If you deploy  Office with System Center Configuration, you can also use it to manage Office updates. The benefits are the same:  Configuration Manager scales for large environments and enables extensive control over installation, updates, and settings. However, there's a higher administrative overhead.

- Office Deployment Tool: Like Configuration Manager, the Office Deployment Tool gives you more control over how Office is updated. You can also use the ODT to download update files that can be deployed using third-party software distribution tools. In both cases, there is an administrative cost.

- Self-manage. All users who sef-install Office will either be automatically updated from the Office CDN or manage their updates on their own. 
    
As with installation, you can use a combination of methods for different users. 

> [!NOTE]
> **Best practice:** We recommend managing your updates automatically from the cloud. It might require more network capacity, but it's more efficient.

> [!IMPORTANT]
> REVIEWERS: What else can we say about why? I think more secure is overstating it.

## Step 4 - Choose your update channels

With Office 365 ProPlus, you can control how frequently your users receive feature updates to their Office applications. To do so, you deploy one of three different update channels to different groups of users:

- Monthly Channel: Provide users with the newest features of Office as soon as they're available.

- Semi-Annual Channel: Provide users with new features of Office every six months, in January and July

- Semi-Annual Channel (Targeted): Provide pilot users and application compatibility testers the opportunity to test the next Semi-Annual Channel. Releases every six months in March and September, four months ahead of the Semi-Annual Channel.

Which users get which update channel depends on several factors, including how many line-of-business applications, add-ins, or macros that you need to test. To help you make this decision, see [Overview of update channels for Office 365 ProPlus](overview-of-update-channels-for-office-365-proplus.md).

To ensure you can test new updates to Office before deploying them to your entire organization, we recommend creating two deployment rings:

- Pilot deployment ring: A small group of representative users who can pilot new features of Office. This ring will use Semi-Annual (Targeted) channel. The users should include people from different areas of the organization and their devices should include all your critical line-of-business applications, add-ins, and macros. This ring will receive updates six months ahead of the rest of your organization.

- Broad deployment ring: The remaining users in your organization will be part of the broad deployment ring and will use the Semi-Annual Channel. 

> [!NOTE]
> **Best practice:** Create a pilot deployment ring of a small group of representative users and deploy the Semi-Annual Channel (Targeted) to them. Deploy the Semi-Annual Channel to the rest of your organization (the Broad Deployment Ring). This process ensures a six-month lead time for testing new Office updates before they're deployed to your entire organization. 

## Step 5 - Choose what Office applications to deploy
You can deploy all the Office applications in Office 365 ProPlus or exlude some. Applications that are initially excluded can be added back later, just as aspplications that are initially included can be removed later. 

## Step 6 - Choose what architectures to deploy 
We recommend the 32-bit version of Office, because it helps prevent compatibility issues with most other applications, especially third-party add-ins. When self-installing, Office installs the 32-bit version automatically even if your computer is running 64-bit editions of Windows. You might want to install the 64-bit version of Office if you usually work with extra-large databases or worksheets or develop for the 64-bit platform.

For more details, see [Choose the 32-bit or 64-bit version of Office](https://support.office.com/en-us/article/Choose-the-32-bit-or-64-bit-version-of-Office-CA3253E5-AC01-4242-8A64-B56111A6F32D).

> [!NOTE]
> **Best practice:** Deploy the 32-bit version of Office in most cases. Separate architectures require separate deployment packages.

## Step 7 - Choose whether to install Visio and Project alongisde Office
Note that Microsoft supports different versions of Project and Visio running alongside Office 365 ProPlus. Customers can use their existing Project and Visio MSI versions, or deploy the Click-to-Run versions that support traditional volume licensing and Office 365 licensing models. For details on deploying Visio and Project, see [Use the Office Deployment Tool to install volume licensed editions of Visio 2016 and Project 2016](use-the-office-deployment-tool-to-install-volume-licensed-editions-of-visio-2016.md).

> [!IMPORTANT]
> TO ADD: More details on Visio and Project deployment

## Step 8 - Choose what languages to deploy--and how to deploy them

We recommend identifying required languages in each region. You can deploy these languages directly as part of the first installation of Office. After you've deployed, you can install additional language accessory packs at any time:

- Have your users download and install the language accessory packs that they need from the Office 365 portal (requires elevated privlidges).
- Use Configuration Manager or the Office Deployment Tool to deploy the appropriate language accessory packs to your users.

For more details, see [Overview of deploying languages in Office 365 ProPlus](overview-of-deploying-languages-in-office-365-proplus.md).

> [!NOTE]
> **Best practice:** Define a small set of regional languages that are highly used throughout the region. You can deploy those directly, and then make additional languages available for user installation.

## Step 9 - Plan the installation and update experience for your users
As part of the deployment of Office, you can define the installation and update experience for your users, including:

- Silent install, in which your users do not see any installation screens.
- Automatic acceptance of the EULA.
- Waiting for user to initiate install or requiring installation at a scheduled time.
- How and when to notify users of the availability of the Office installation

## Step 10 - Define your deployment groups and client packages
Deployment groups are collections of client devices that will receive the same Office bits and the same updates from the same channel. For example, you can define one deployment group for all the devices in your organization that meet the following requirements:

- Tool: Office will be installed by Configuration Manager (Current Branch)
- Updates: Office updates will be managed automatically from the cloud    
- Product suite: Office 365 ProPlus with all applications
- Languages: English and Japanese
- Architecture: 64-bit editions
- Update channels: Semi-Annual Channel 
- Install experience: Office will install silently on all clients with automatic acceptance of the EULA

Clients with different requirements, such as 32-bit architecture or different update, will need to be in different deployment groups. 

For each deployment group, you'll create a unique client package. The client package includes all the above details about update channel, applications, langauges, architectures, and installation experience. 

## Step 11 - Define your group policy settings
Office offers many group policy settings to allow granular control over security, privacy, and user experience. In most cases, only a subset of these are needed for an organization. Review Best practices: Group policy and Office 365 ProPlus with more than 250 proven, commonly set policies for users and computers. Check the listed additional settings. Adjust the settings to fit your needs and requirements.

## Step 12 - Plan your upgrade from existing versions of Office 
Microsoft supports installing Office 365 ProPlus alongside the most recent previous version of the Office suite, but we don't recommend it. If you plan to have two versions of Office on the same computer, you should plan to transition to using only Office 365 ProPlus when possible. Other versions of Office should be removed prior to or as part of the deployment of Office 365 ProPlus

## Step 13 - Plan for shared computers (optional)
> [!IMPORTANT]
> TO ADD: Will include short note with links if necessary.

## Step 14 - Plan for deploying Office 365 ProPlus to Macs (optional)
> [!IMPORTANT]
> TO ADD: Will include short note with links if necessary.

## Step 15 - Review exit criteria
Before beginning your deployment, make sure you've completed the planning exit criteria:

> [!IMPORTANT]
> TO ADD: Table of all planning decision, once those are locked

## Next steps
Depending on your deployment plan, go to one of the following articles:

- [Deploy Office 365 ProPlus with System Center Configuration Manager](deploy-office-365-proplus-with-Configuration-Manager.md)
- [Deploy Office 365 ProPlus with the ODT from the cloud](deploy-office-365-proplus-from-the-cloud.md)
- [Deploy Office 365 ProPlus with the ODT from a local source](deploy-office-365-proplus-from-a-local-source.md)


