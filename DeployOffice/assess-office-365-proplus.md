---
title: "Assess your deployment of Office 365 ProPlus"
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
ms.assetid:
description: "This article gives step-by-step instructions for how to assess your enivorment and requirements before deploying Office 365 ProPlus. The article is intended for administrators in enterprise environments working with hundreds or thousands of computers."
---

# Assess your environment and requirements for deploying Office 365 ProPlus

Follow the steps in this article to assess your environment and requirements before deploying Office 365 ProPlus in your organization. This assessment will help you make key decisions as part of planning your deployment.

In addition to this guidance, we recommend that you use [Microsoft Fastrack](https://fasttrack.microsoft.com/office) to help with your deployment. FastTrack onboarding services are available with the purchase of 50 or more seats of Office 365 Enterprise and Office 365 Business plans, along with paid Government, Kiosk, and Nonprofit plans.

## Step 1 - Review infrastructure and requirements

Review the number and details of your client devices, including platform (Windows or Mac), operating systems, architectures (32-bit or 64-bit), existing versions of Office that are installed, and required languages. 

As part of this review, make sure that your client devices meet or exceed the [minimum system requirements for installing Office 365 ProPlus](https://products.office.com/en-us/office-system-requirements#Office2016-suites-section).

In addition, you should review the system requirements for your Office server workloads. For example, Exchange 2007 does not support Outlook 2016. For more details, see [Exchange Server Supportability Matrix](https://technet.microsoft.com/library/ff728623(v=exchg.150).aspx) and [System Requirements for Office server products](https://products.office.com/en-US/office-system-requirements).

Finally, you should review the deployment tools you already use in your organization, such as System Center Configuration Manager. Most organizations use the deployment tools they already have in place to deploy Office. 

## Step 2 - Assess your Office 365 licensing and accounts

Make sure that all your users have Office 365 accounts and licenses, and that those licenses include Office 365 ProPlus. For details on how to manage accounts and  licenses, see [Overview of licensing and activation in Office 365 ProPlus](overview-of-licensing-and-activation-in-office-365-proplus.md), [Manage user accounts and licenses with Office 365 PowerShell](https://docs.microsoft.com/en-us/office365/enterprise/powershell/manage-user-accounts-and-licenses-with-office-365-powershell), and [Subscriptions, licenses, accounts, and tenants for Microsoft's cloud offerings](https://docs.microsoft.com/en-us/office365/enterprise/subscriptions-licenses-accounts-and-tenants-for-microsoft-cloud-offerings).

If you plan to install Visio or Project, make sure that you have the appropriate licenses for those applications as well. For more details, see [Use the Office Deployment Tool to install volume licensed editions of Visio 2016 and Project 2016](use-the-office-deployment-tool-to-install-volume-licensed-editions-of-visio-2016.md).

## Step 3 - Assess your network capability

Review your network capability, including bandwidth and distribution of client devices, based on the following considerations:

- Installation files for Office 365 ProPlus are at least 1.6 GB for the core files, plus at least 250 MB for each language deployed. 
- Office 365 updates vary in size, but you can review recent download sizes [here](https://support.office.com/en-us/article/Download-sizes-approximate-for-channel-updates-to-Office-365-ProPlus-190f41e4-064d-486b-9c95-db08f973687c). For details on the frequency and type of updates based on channel, see [Overview of the update process for Office 365 ProPlus](overview-of-the-update-process-for-office-365-proplus.md).  
- Client devices require internet access to activate their Office 365 ProPlus subscription, and then must connect at least once every thirty days to verify their subscription. 
- The following ports and protocols must be open: [Office 365 URLs and IP address ranges](https://support.office.com/en-us/article/Office-365-URLs-and-IP-address-ranges-8548a211-3fe7-47cb-abb1-355ea5aa88a2?ui=en-US&rs=en-US&ad=US).

When evaluating your network, make sure to assess the bandwidth between remote sites and the Office Content Delivery Network (CDN). If you have the capacity between those sites and the internet, we recommend that you get updates directly from the Office CDN.

If you do manage updates from the Office CDN, updates are automatically deployed over a number of days to prevent your devices from trying to update at the same time. These features are not available when managing updates from a local source.

## Step 4 - Assess application compatibility

Before deploying Office 365 ProPlus, we recommend testing your Office add-ins--including VBA macros, third-party add-ins, and complex documents and spreadsheets--to assess their compatibility with the new version of Office. To complete that assessment in three phases:

1. Discover and test add-ins for compatability issues with the [Readiness Toolkit](https://go.microsoft.com/fwlink/p/?linkid=859119). You can run the Readiness Toolkit on client devices across your entire orgniazation. For more details, see [Getting readiness information for multiple users in an enterprise](use-the-readiness-toolkit-to-assess-application-compatibility-for-office-365-pro.md#getting-readiness-information-for-multiple-users-in-an-enterprise). 
 
2. Work with your business groups to review the reports from the Readiness Toolkit to  prioritize the critical add-ins.

3. Follow the recommendations in the Readiness Toolkit to fix the critical add-ins that have compatibility issues.

4. Identify a targeted group of representative users from business groups across the organization. Their client devices should include the architectures in your organization (32-bit and 64-bit) and all the critical line-of-business applications, add-ins, and macros. 

As part of your Office deployment, you will deploy Office first to the targeted group from step 4, and then do an additional round of testing to ensure compatibility between Office 365 ProPlus and the add-ins and client devices in that group. After you have verified compatiblity, you can deploy to the rest of your organization. That first group continues to be a pilot for testing future updates from Office ahead of the rest of your organization. For more details, see [Plan your deployment of Office 365 ProPlus](plan-deploy-office-365-proplus-with-Configuration-Manager.md).  

## Review exit criteria 

Before planning your deployment, make sure you've completed all the steps for assessing your environment and requirements.
[[EDIT LIST TO REFLECT ABOVE STEPS]]
|Assessment         |Reviewed?            |
|-------------------|------------------|
|Number of clients                                |**Y/N**|
|Client platform (Windows or Mac)                 |**Y/N**|
|Operating systems                                |**Y/N**|
|Architectures (32-bit and 64-bit)                |**Y/N**|
|Required languages                               |**Y/N**|
|Existing versions of Office                      |**Y/N**|
|System requirements                              |**Y/N**|
|Existing deployment tools                      |**Y/N**|
|Office 365 licensing and accounts                |**Y/N**|
|Network                                          |**Y/N**|
|Application compatibility                        |**Y/N**|

## Next step

[Plan your deployment of Office 365 ProPlus](plan-office-365-proplus.md).


