---
title: "Plan your Deployment of Office 365 ProPlus with System Center Configuration Manager"
ms.author: jwhit
author: jwhit-MSFT
manager: laurawi
ms.date: 2/15/2018
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

You can deploy Office 365 ProPlus with System Center Configuration Manager, with the Office Deployment Tool, with a third-party software deployment tool, or by having your users self-install. In addition, you can choose whether to deploy Office directly from the cloud or from a local source on your network.

We recommend Configuration Manager for organizations that already use it  to distribute and manage software.  Configuration Manager scales for large environments and enables extensive control over installation, updates, and settings.

For organizations that do not have Configuration Manager and that still want to manage their deployment, we recommend using the Office Deployment Tool (ODT). You can use the ODT as a standalone tool, or you can use it to download installation files that can be deployed using third-party software deployment tools. For more details, see [Overview of the Office 2016 Deployment Tool](overview-of-the-office-2016-deployment-tool.md).

Choose how you want to deploy:

- **Deploy from a local source with Configuration Manager:** Manage your deployment with Configuration Manager, and have Office downloaded and deployed from distribution points on your network.

- **Deploy from the cloud with Configuration Manager:** Manage your deployment with Configuration Manager, but have Office install directly on client devices from the Office CDN rather than from distribution points on your network.

- **Deploy from the cloud with the Office Deployment Tool:** Manage your deployment with the ODT and have Office installed on client devices directly from the Office CDN.
 
- **Deploy from a local source with the Office Deployment Tool:** Manage your deployment with the ODT and have Office downloaded to a local source on your netowrk and installed on client devices from there. **This option is supported, but we do not recommend it because of the complexity and netowrk impact of managing installation packages from a local source.**
- 
- Self-install from the cloud: Manage your deployment from the Office portal and have your users install Office on their client devices directly from the portal. This method requires the least amount of administrative setup, but gives you less control over the deployment. You can, however, stll define how frequently your users receive updates. For more details, see [Manage user software in Office 365](https://support.office.com/en-us/article/manage-user-software-in-office-365-c13051e6-f75c-4737-bc0d-7685dcedf360). This option requires that your users have local adminsitrative rights on their client devices.

Many organizations will use a combination of these tools for different users. For example, an organization might use Configuration Manager to deploy Office to most of their users, but enable self-install for a small group of workers who are not frequently connected to the internal network.
 
> [!NOTE]
> **Best practice:** If you're using the Office Deployment Tool and if you have the network capacity, we recommend deploying Office with the ODT from the cloud. It's more efficient. If you use Configuration Manager, deploy from distribution points or from the cloud, depending on your existing infrastructure and network requirements. We recommend self-install for situations in which you require less administrative control and you have the network capacity to have your users install directly from the Office portal.  

## Step 2 - Choose how to manage updates to Office

You can manage updates with the same tool that you deploy Office, but it's not required. You can also choose whether to have the updates install directly from the cloud or from a local source on your network. 

> [!IMPORTANT]
> If you manage updates from the cloud (using the Office CDN), your network usage is more efficient: Binary delta compression reduces the size of the updates and Background Intelligent Transfer Service (BITS) transfers updates to a user’s device only when bandwidth isn't being used by other critical applications. The Office CDN also automatically deploys an update over a number of days to prevent your devices from trying to update at the same time. These features are not available when managing updates from a local source.

Choose how to manage updates:

- **Manage updates automatically from the cloud:** Many organizations deploy with one tool (such as Configuration Manager), but allow updates to be automically applied from the Office CDN. You still control frequency and type of update--those settings are defined as part of the initial deployment--but the overall process is much less work for the administrator.  

- **Manage updates with Configuration Manager:**  If you deploy Office with  Configuration Manager, you can also use it to manage Office updates. 

- **Office Deployment Tool:** You can use the ODT to download update files and manage those updates, either directly with the ODT or with a third-party software deployment tool. **This option is supported, but we do not recommend it because of the complexity and netowrk impact of managing updates from a local source.**

- **Self-manage:** All users who sef-install Office will either be automatically updated from the Office CDN or manage their updates on their own. 
    
As with installation, you can use a combination of methods for different users. 

> [!NOTE]
> **Best practice:** We recommend managing your updates automatically from the cloud. You limit your administrative overhead and receive all the network efficiencies built into udpating from the Office CDN, including binary data compression.

## Step 3 - Choose your update channels and deployment rings

With Office 365 ProPlus, you can control how frequently your users receive feature updates to their Office applications. To do so, you deploy one of three different update channels to different groups of users:

- Monthly Channel: Provide users with the newest features of Office as soon as they're available.

- Semi-Annual Channel: Provide users with new features of Office every six months, in January and July

- Semi-Annual Channel (Targeted): Provide pilot users and application compatibility testers the opportunity to test the next Semi-Annual Channel. Releases every six months in March and September, four months ahead of the Semi-Annual Channel.

Which users get which update channel depends on several factors, including how many line-of-business applications, add-ins, or macros that you need to test. To help you make this decision, see [Overview of update channels for Office 365 ProPlus](overview-of-update-channels-for-office-365-proplus.md).

To ensure you can test new updates to Office before deploying them to your entire organization, we recommend creating two deployment rings:

- Pilot deployment ring: A small group of representative users who can pilot new features of Office. This ring will use Semi-Annual (Targeted) channel. The users should include people from different areas of the organization and their devices should include all your critical line-of-business applications, add-ins, and macros. This ring will receive feature updates four months ahead of the rest of your organization.

- Broad deployment ring: The remaining users in your organization will be part of the broad deployment ring and will use the Semi-Annual Channel. 

With this approach, you can test new Office features in your environment, particularly with your hardware and device drivers. 
 
> [!NOTE]
> **Best practice:** Create a pilot deployment ring of a small group of representative users and deploy the Semi-Annual Channel (Targeted) to them. Deploy the Semi-Annual Channel to the rest of your organization (the Broad Deployment Ring). This process ensures a four-month lead time for testing new Office feature updates before they're deployed to your entire organization. 

## Step 4 - Choose your Office applications, architectures, and languages

You can deploy all the Office applications in Office 365 ProPlus or exlude some. Applications that are initially excluded can be added back later, just as aspplications that are initially included can be removed later. You can also choose the languages and architectures (32-bit or 64-bit) to install.

We recommend identifying required languages in each region. You can deploy these languages directly as part of the first installation of Office. After you've deployed, you can install additional language accessory packs at any time:

- Have your users download and install the language accessory packs that they need from the Office 365 portal (requires local administrator permissions).
- Use Configuration Manager or the Office Deployment Tool to deploy the appropriate language accessory packs to your users.

For more details, see [Overview of deploying languages in Office 365 ProPlus](overview-of-deploying-languages-in-office-365-proplus.md).

For details on which architecture to choose, see [Choose the 32-bit or 64-bit version of Office](https://support.office.com/en-us/article/Choose-the-32-bit-or-64-bit-version-of-Office-CA3253E5-AC01-4242-8A64-B56111A6F32D).

> [!NOTE]
> **Best practice:** For Office applications and architectures, define the packages based on your requirements. For languages, choose a small set  that are highly used throughout the region. You can deploy those directly, and then make additional languages available for user installation.

## Step 5 - Choose whether to install Visio and Project alongisde Office

[FROM BILL: Best practice is to strip these and use click-to-run versions of Project and Visio.]

Note that Microsoft supports different versions of Project and Visio running alongside Office 365 ProPlus. Customers can use their existing Project and Visio MSI versions, or deploy the Click-to-Run versions that support traditional volume licensing and Office 365 licensing models. For details on deploying Visio and Project, see [Use the Office Deployment Tool to install volume licensed editions of Visio 2016 and Project 2016](use-the-office-deployment-tool-to-install-volume-licensed-editions-of-visio-2016.md).

> [!IMPORTANT]
> TO ADD: More details on Visio and Project deployment

## Step 6 - Define your client packages and deployment groups

To deploy Office 365 ProPlus, you create a client package of the Office installation files. Because the Office installation files are different based on their architecture and update channel, you'll likely need to create multiple packages for your organization. The six basic packages are: 

- Monthly Channel for 32-bit
- Monthly Channel for 64-bit
- Semi-Annual Channel for 32-bit
- Semi-Annual Channel for 64-bit
- Semi-Annual Channel (Targeted) for 32-bit
- Semi-Annual Channel (Targeted) for 64-bit

You can also create separate packages based on different langauges, Office applications, or installation settings, but we don't recommend it. Instead, we recommend including all the Office applications and all the languages your organization requires in each of your client package. Later, when you deploy the packages to different groups of client devices, you can specify which language and Office applications are actually installed. 

## Step 7 - Define your group policy settings

[DAN to revise]

If you plan to configure and manage Office with Group Policy settings, review the Administrative Template files (ADMX/ADML) for Group Policy settings for Office 365 ProPlus. You can download an [Excel file](https://www.microsoft.com/en-us/download/details.aspx?id=49030) that lists all the Group Policy settings and the new policy settings for Office 365 ProPlus. Note that all Group Policy settings for Office are now located in HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Office\16.0 and HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft\Office\16.0.

Office offers many group policy settings to allow granular control over security, privacy, and user experience. In most cases, only a small subset of these are needed for an organization. To see a list of the most important settings, see [Best practices: Management for cloud managed](best-practices/best-practices-management-for-cloud-managed.md).

## Step 8 - Plan your upgrade from existing versions of Office 

As part of your Microsoft supports installing Office 365 ProPlus alongside the most recent previous version of the Office suite, but we don't recommend it. If you plan to have two versions of Office on the same computer, you should plan to transition to using only Office 365 ProPlus when possible. Other versions of Office should be removed prior to or as part of the deployment of Office 365 ProPlus

## Step 9 - Plan for shared computers (optional)

[DAN to revise]

## Review exit criteria

Before beginning your deployment, make sure you've completed the planning exit criteria:

> [!IMPORTANT]
> TO ADD: Table of all planning decision, once those are locked

## Next steps
Depending on your deployment  plan, go to one of the following articles:

- [Deploy Office 365 ProPlus with System Center Configuration Manager](deploy-office-365-proplus-with-Configuration-Manager.md)
- [Deploy Office 365 ProPlus with the ODT from the cloud](deploy-office-365-proplus-from-the-cloud.md)
- [Deploy Office 365 ProPlus with the ODT from a local source](deploy-office-365-proplus-from-a-local-source.md)


