---
title: "Assess your environment and requirements for deploying Microsoft 365 Apps"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: conceptual
ms.service: o365-proplus-itpro
ms.collection: Tier1
ms.localizationpriority: medium
recommendations: false
description: "This article gives step-by-step instructions for how to assess your environment and requirements before deploying Microsoft 365 Apps.  The article is intended for administrators in enterprise environments working with hundreds or thousands of computers."
ms.date: 12/15/2023
---

# Assess your environment and requirements for deploying Microsoft 365 Apps

Follow the steps in this article to assess your environment and requirements before deploying Microsoft 365 Apps in your organization. This assessment helps you make key decisions as part of planning your deployment. 

In addition to this guidance, we recommend that you use [Microsoft FastTrack](https://www.microsoft.com/fasttrack) to help with your deployment.

## Step 1 - Review infrastructure and requirements

Review the number and details of your client devices, including platform (Windows or Mac); operating systems; architectures (32-bit or 64-bit); required languages; and existing versions of Office, Visio, Project, and other Office applications. 

As part of this review, make sure that your client devices meet or exceed the [minimum system requirements for installing Microsoft 365 Apps](https://www.microsoft.com/microsoft-365/microsoft-365-and-office-resources).

Review the client requirements for your on-premises server workloads as well. For example, verify if your on-premises Exchange servers meet the minimum requirements as described in the [Exchange Server Supportability Matrix](/exchange/plan-and-deploy/supportability-matrix#clients).

Finally, you should review the deployment tools you use in your organization. We recommend using Microsoft Intune. If you're using Microsoft Configuration Manager, we recommend upgrading to the current branch and updating to the current release. For more information, see [Which branch of Configuration Manager should I use?](/mem/configmgr/core/understand/which-branch-should-i-use).

## Step 2 - Review licensing and accounts

Make sure that all your users have Office 365 (or Microsoft 365) accounts and licenses, and that those licenses include Microsoft 365 Apps. For details on how to manage accounts and licenses, see [Overview of licensing and activation in Microsoft 365 Apps](../licensing-activation/overview-licensing-activation-microsoft-365-apps.md), [Manage Microsoft 365 user accounts, licenses, and groups with PowerShell](/microsoft-365/enterprise/manage-user-accounts-and-licenses-with-microsoft-365-powershell), and [Subscriptions, licenses, accounts, and tenants for Microsoft's cloud offerings](/microsoft-365/enterprise/subscriptions-licenses-accounts-and-tenants-for-microsoft-cloud-offerings).

If you plan to install Visio or Project, make sure that you have the appropriate licenses and have identified the users who need them. Review the documentation on [deploying Project](deployment-guide-for-project.md) and [deploying Visio](deployment-guide-for-visio.md).

## Step 3 - Assess network capability

Review your network capability, including bandwidth and distribution of client devices, based on the following considerations:

- Installation files for Microsoft 365 Apps are at least 3 GB for the core files, plus at least 450 MB for each language deployed. 
- Client devices require internet access to activate their Microsoft 365 Apps subscription, and then must connect at least once every 30 days to verify their subscription. 
- The following ports and protocols must be open: [Microsoft 365 and Office 365 URLs and IP address ranges](/microsoft-365/enterprise/urls-and-ip-address-ranges).
- Microsoft 365 Apps updates vary in size, but you can review recent download sizes [here](/officeupdates/download-sizes-microsoft365-apps-updates). For details on the frequency and type of updates based on channel, see [Overview of update channels for Microsoft 365 Apps](../updates/overview-update-channels.md).  
- Updating client devices directly from the Office Content Delivery Network (CDN) can vastly reduce your administrative investment. To help decide whether this is appropriate for your organization, make sure to assess the connectivity between the internet and your client devices, including devices in remote sites. If you do manage updates from the Office CDN, updates are automatically deployed over several days to conserve your network bandwidth.
- To reduce the load on your internet links, we recommend enabling [Delivery Optimization](../updates/delivery-optimization.md) for downloading installations or updates from the internet. For Configuration Manager-based scenarios, we recommend using [PeerCache](/mem/configmgr/core/plan-design/hierarchy/client-peer-cache).
 
## Step 4 - Assess application compatibility

Before deploying Microsoft 365 Apps, you may want to test your business-critical VBA macros, add-ins, and complex documents and spreadsheets to assess their compatibility.

> [!NOTE]
> The vast majority of add-ins, VBA macros, and complex documents and spreadsheets that work with Office 2010 or newer will work with Microsoft 365 Apps as well. 

To complete that assessment, do the following steps:

1. Working with your business groups, define a pilot group of representative users and client devices from across the organization. Those client devices should include the architectures in your organization (32-bit and 64-bit) and all the critical line-of-business applications, add-ins, and macros that you want to test with Microsoft 365 Apps. 

1. If you use the current version of Configuration Manager, you can use the Office 365 ProPlus Pilot and Health Dashboard to help you plan, pilot, and perform your Microsoft 365 Apps deployment. For more information, see [Office 365 ProPlus Pilot and Health Dashboard](/mem/configmgr/sum/deploy-use/office-365-dashboard#bkmk_pilot).

As part of your deployment, you'll deploy the apps first to the targeted group from step 1, and then do another round of testing to ensure compatibility between Microsoft 365 Apps and the add-ins and client devices in that group. After verifying compatibility, you can deploy to the rest of your organization. That first group can continue to be a pilot for testing future updates ahead of the rest of your organization. For more information, see [Plan your enterprise deployment of Microsoft 365 Apps](plan-microsoft-365-apps.md).

## Review exit criteria 

Before planning your deployment, make sure you completed all the steps for assessing your environment and requirements.

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
|Validate compatibility                        |**Y/N**|
|Fix critical add-ins                        |**Y/N**|
|Define pilot group                        |**Y/N**|


## Next step

[Plan your deployment of Microsoft 365 Apps](plan-microsoft-365-apps.md).
