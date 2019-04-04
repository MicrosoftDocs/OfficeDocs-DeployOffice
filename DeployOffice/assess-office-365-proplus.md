---
title: "Assess your deployment of Office 365 ProPlus"
ms.author: jwhit
author: jwhit-MSFT
manager: laurawi
ms.date: 4/2/2018
ms.audience: ITPro
ms.topic: article
ms.service: o365-proplus-itpro
localization_priority: Priority
ms.collection: 
- Ent_O365
- M365-modern-desktop
ms.custom: Ent_Office_ProPlus
ms.assetid:
description: "This article gives step-by-step instructions for how to assess your enivorment and requirements before deploying Office 365 ProPlus.  The article is intended for administrators in enterprise environments working with hundreds or thousands of computers."
---

# Assess your environment and requirements for deploying Office 365 ProPlus

Follow the steps in this article to assess your environment and requirements before deploying Office 365 ProPlus in your organization. This assessment will help you make key decisions as part of planning your deployment. 

In addition to this guidance, we recommend that you use [Microsoft Fastrack](https://fasttrack.microsoft.com/office) to help with your deployment.

## Step 1 - Review infrastructure and requirements

Review the number and details of your client devices, including platform (Windows or Mac); operating systems; architectures (32-bit or 64-bit); required languages; and existing versions of Office, Visio, Project, and other Office applications. 

As part of this review, make sure that your client devices meet or exceed the [minimum system requirements for installing Office 365 ProPlus](https://products.office.com/office-system-requirements).

In addition, you should review the system requirements for your Office server workloads. For example, Exchange 2007 does not support Outlook 2016. For more details, see [Exchange Server Supportability Matrix](https://technet.microsoft.com/library/ff728623(v=exchg.150).aspx) and [System Requirements for Office server products](https://products.office.com/office-system-requirements).

Finally, you should review the deployment tools you use in your organization, such as System Center Configuration Manager. Most organizations deploy Office with the deployment tools they already have in place. If your organization uses Configuration Manager, we recommend upgrading to the Current Branch and updating to the current release. For more details, see [Which branch of Configuration Manager should I use?](https://docs.microsoft.com/sccm/core/understand/which-branch-should-i-use).

## Step 2 - Review licensing and accounts

Make sure that all your users have Office 365 accounts and licenses, and that those licenses include Office 365 ProPlus. For details on how to manage accounts and licenses, see [Overview of licensing and activation in Office 365 ProPlus](overview-of-licensing-and-activation-in-office-365-proplus.md), [Manage user accounts and licenses with Office 365 PowerShell](https://docs.microsoft.com/office365/enterprise/powershell/manage-user-accounts-and-licenses-with-office-365-powershell), and [Subscriptions, licenses, accounts, and tenants for Microsoft's cloud offerings](https://docs.microsoft.com/office365/enterprise/subscriptions-licenses-accounts-and-tenants-for-microsoft-cloud-offerings).

If you plan to install Visio or Project, make sure that you have the appropriate licenses and have identified the users who need them. For more details, see [Use the Office Deployment Tool to install volume licensed editions of Visio 2016 and Project 2016](use-the-office-deployment-tool-to-install-volume-licensed-editions-of-visio-2016.md).

## Step 3 - Assess network capability

Review your network capability, including bandwidth and distribution of client devices, based on the following considerations:

- Installation files for Office 365 ProPlus are at least 1.6 GB for the core files, plus at least 250 MB for each language deployed. 
- Client devices require Internet access to activate their Office 365 ProPlus subscription, and then must connect at least once every thirty days to verify their subscription. 
- The following ports and protocols must be open: [Office 365 URLs and IP address ranges](https://docs.microsoft.com/office365/enterprise/urls-and-ip-address-ranges).
- Office 365 updates vary in size, but you can review recent download sizes [here](https://docs.microsoft.com/officeupdates/download-sizes-office365-proplus-updates). For details on the frequency and type of updates based on channel, see [Overview of update channels for Office 365 ProPlus](overview-of-update-channels-for-office-365-proplus.md).  
- Updating client devices directly from the Office Content Delivery Network (CDN) can vastly reduce your administrative investment. To help decide whether this is appropriate for your organization, make sure to assess the connectivity between the Internet and your client devices, including those in remote sites. If you do manage updates from the Office CDN, updates are automatically deployed over a number of days to conserve your network bandwidth. 
 
## Step 4 - Assess application compatibility

Before deploying Office 365 ProPlus, you may want to test your business-critical VBA macros, third-party add-ins, and complex documents and spreadsheets to assess their compatibility with the new version of Office.  

> [!NOTE]
> The vast majority of add-ins, VBA macros, and complex documents and spreadsheets that work with Office 2010 or 2013 will work with Office 365 ProPlus as well. 

To complete that assessment, do the following:

1. Discover and get readiness information about your VBA macros and add-ins by using the [Readiness Toolkit](https://go.microsoft.com/fwlink/p/?linkid=859119). You can run the Readiness Toolkit on client devices across your entire organization. For more details, see [Use the Readiness Toolkit to assess application compatibility for Office 365 ProPlus](use-the-readiness-toolkit-to-assess-application-compatibility-for-office-365-pro.md). 
 
2. Use the reports to identify the readiness status of your add-ins and get recommendations about how to fix any VBA macro issues that were identified.

3. Working with your business groups, define a pilot group of representative users and client devices from across the organization. Those client devices should include the architectures in your organization (32-bit and 64-bit) and all the critical line-of-business applications, add-ins, and macros that you want to test with Office 365 ProPlus. 

As part of your Office deployment, you will deploy Office first to the targeted group from step 3, and then do an additional round of testing to ensure compatibility between Office 365 ProPlus and the add-ins and client devices in that group. After you have verified compatibility, you can deploy to the rest of your organization. That first group will then continue to be a pilot for testing future updates from Office ahead of the rest of your organization. For more details, see [Plan your enterprise deployment of Office 365 ProPlus](plan-office-365-proplus.md).  

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
|If using Configuration Manager, on Current Branch  |**Y/N**|
|Office 365 licensing and accounts                |**Y/N**|
|Network                                          |**Y/N**|
|Run Readiness Toolkit                        |**Y/N**|
|Fix critical add-ins                        |**Y/N**|
|Define pilot group                        |**Y/N**|


## Next step

[Plan your deployment of Office 365 ProPlus](plan-office-365-proplus.md). 
