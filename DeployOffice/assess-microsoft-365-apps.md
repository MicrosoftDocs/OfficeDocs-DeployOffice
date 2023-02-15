---
title: "Assess your environment and requirements for deploying Microsoft 365 Apps"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: article
ms.service: o365-proplus-itpro
ms.collection: tier1
ms.localizationpriority: medium
recommendations: false
description: "This article gives step-by-step instructions for how to assess your environment and requirements before deploying Microsoft 365 Apps.  The article is intended for administrators in enterprise environments working with hundreds or thousands of computers."
ms.date: 02/15/2023
---

# Assess your environment and requirements for deploying Microsoft 365 Apps

Follow the steps in this article to assess your environment and requirements before deploying Microsoft 365 Apps in your organization. This assessment will help you make key decisions as part of planning your deployment. 

In addition to this guidance, we recommend that you use [Microsoft FastTrack](https://fasttrack.microsoft.com/office) to help with your deployment.

## Step 1 - Review infrastructure and requirements

Review the number and details of your client devices, including platform (Windows or Mac); operating systems; architectures (32-bit or 64-bit); required languages; and existing versions of Office, Visio, Project, and other Office applications. 

As part of this review, make sure that your client devices meet or exceed the [minimum system requirements for installing Microsoft 365 Apps](https://www.microsoft.com/microsoft-365/microsoft-365-and-office-resources).

Review the system requirements for your Office server workloads as well. For example, Exchange 2007 does not support Outlook 2016. For more information, see [Exchange Server Supportability Matrix](/exchange/plan-and-deploy/supportability-matrix) and [System Requirements for Office server products](https://www.microsoft.com/microsoft-365/microsoft-365-and-office-resources).

Finally, you should review the deployment tools you use in your organization, such as Microsoft Configuration Manager. Most organizations deploy Office with the deployment tools they already have in place. If your organization uses Configuration Manager, we recommend upgrading to the current branch and updating to the current release. For more information, see [Which branch of Configuration Manager should I use?](/mem/configmgr/core/understand/which-branch-should-i-use).

## Step 2 - Review licensing and accounts

Make sure that all your users have Office 365 (or Microsoft 365) accounts and licenses, and that those licenses include Microsoft 365 Apps. For details on how to manage accounts and licenses, see [Overview of licensing and activation in Microsoft 365 Apps](overview-licensing-activation-microsoft-365-apps.md), [Manage Microsoft 365 user accounts, licenses, and groups with PowerShell](/microsoft-365/enterprise/manage-user-accounts-and-licenses-with-microsoft-365-powershell), and [Subscriptions, licenses, accounts, and tenants for Microsoft's cloud offerings](/microsoft-365/enterprise/subscriptions-licenses-accounts-and-tenants-for-microsoft-cloud-offerings).

If you plan to install Visio or Project, make sure that you have the appropriate licenses and have identified the users who need them. For more information, see [Use the Office Deployment Tool to install volume licensed editions of Visio 2016 and Project 2016](use-the-office-deployment-tool-to-install-volume-licensed-editions-of-visio-2016.md).

## Step 3 - Assess network capability

Review your network capability, including bandwidth and distribution of client devices, based on the following considerations:

- Installation files for Microsoft 365 Apps are at least 1.6 GB for the core files, plus at least 250 MB for each language deployed. 
- Client devices require internet access to activate their Microsoft 365 Apps subscription, and then must connect at least once every 30 days to verify their subscription. 
- The following ports and protocols must be open: [Office 365 URLs and IP address ranges](/microsoft-365/enterprise/urls-and-ip-address-ranges).
- Microsoft 365 Apps updates vary in size, but you can review recent download sizes [here](/officeupdates/download-sizes-microsoft365-apps-updates). For details on the frequency and type of updates based on channel, see [Overview of update channels for Microsoft 365 Apps](overview-update-channels.md).  
- Updating client devices directly from the Office Content Delivery Network (CDN) can vastly reduce your administrative investment. To help decide whether this is appropriate for your organization, make sure to assess the connectivity between the internet and your client devices, including devices in remote sites. If you do manage updates from the Office CDN, updates are automatically deployed over a number of days to conserve your network bandwidth.
- To reduce the load on your network and internet links, we recommend to leverage [PeerCache](/mem/configmgr/core/plan-design/hierarchy/client-peer-cache) when using Configuration Manager or [Delivery Optimization](delivery-optimization.md) when getting the installation or updates from the internet.
 
## Step 4 - Assess application compatibility

Before deploying Microsoft 365 Apps, you may want to test your business-critical VBA macros, third-party add-ins, and complex documents and spreadsheets to assess their compatibility with the new version of Office.  

> [!NOTE]
> The vast majority of add-ins, VBA macros, and complex documents and spreadsheets that work with Office 2010 or 2013 will work with Microsoft 365 Apps as well. 

To complete that assessment, do the following steps:

1. Discover and get readiness information about your VBA macros and add-ins by using the [Readiness Toolkit](https://go.microsoft.com/fwlink/p/?linkid=859119). You can run the Readiness Toolkit on client devices across your entire organization. For more information, see [Use the Readiness Toolkit to assess application compatibility for Microsoft 365 Apps](readiness-toolkit-application-compatibility-microsoft-365-apps.md). 
 
2. Use the reports to identify the readiness status of your add-ins and get recommendations about how to fix any VBA macro issues that were identified.

3. Working with your business groups, define a pilot group of representative users and client devices from across the organization. Those client devices should include the architectures in your organization (32-bit and 64-bit) and all the critical line-of-business applications, add-ins, and macros that you want to test with Microsoft 365 Apps. 

4. If you use the current version of Configuration Manager, you can use the Office 365 ProPlus Pilot and Health Dashboard to help you plan, pilot, and perform your Microsoft 365 Apps deployment. For more information, see [Office 365 ProPlus Pilot and Health Dashboard](/mem/configmgr/sum/deploy-use/office-365-dashboard#bkmk_pilot).

As part of your Office deployment, you'll deploy Office first to the targeted group from step 3, and then do an additional round of testing to ensure compatibility between Microsoft 365 Apps and the add-ins and client devices in that group. After you have verified compatibility, you can deploy to the rest of your organization. That first group will then continue to be a pilot for testing future updates from Office ahead of the rest of your organization. For more information, see [Plan your enterprise deployment of Microsoft 365 Apps](plan-microsoft-365-apps.md).  

## Review exit criteria 

Before planning your deployment, make sure you've completed all the steps for assessing your environment and requirements.

|Assessment         |Reviewed?            |
|-------------------|------------------|
|Number of clients                                |**Y/N**|
|Client platform (Windows or Mac)                 |**Y/N**|
|Operating systems                                |**Y/N**|
|Architectures (32-bit and 64-bit)                |**Y/N**|
|Required languages                                 |**Y/N**|
|Existing versions of Office                        |**Y/N**|
|Existing versions of Project and Visio              |**Y/N**|
|System requirements                              |**Y/N**|
|Existing deployment tools                          |**Y/N**|
|If using Configuration Manager, on current branch  |**Y/N**|
|Office 365 (or Microsoft 365) licensing and accounts                |**Y/N**|
|Network                                          |**Y/N**|
|Run Readiness Toolkit                        |**Y/N**|
|Fix critical add-ins                        |**Y/N**|
|Define pilot group                        |**Y/N**|


## Next step

[Plan your deployment of Microsoft 365 Apps](plan-microsoft-365-apps.md).
