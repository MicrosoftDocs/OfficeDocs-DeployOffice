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

[[JASON: Add value statement about never doing a full install again--all updates after this. Work with Steve Conn and Dinash and John]]

Follow the steps in this article to assess your environment and requirements before deploying Office 365 ProPlus in your organization. This assessment will help you make key decisions as part of planning your deployment.

In addition to this guidance, we recommend customers use [Microsoft Fastrack](https://fasttrack.microsoft.com/office) to help with their deployment. FastTrack onboarding services are available with the purchase of 50 or more seats of Office 365 Enterprise and Office 365 Business SKUs, along with paid Government, Kiosk, and Nonprofit SKUs.

## Step 1 - Assess your infrastructure and system requirements

Review the number and details of your client devices, including platform (Windows or Mac), operating systems, architectures (32-bit or 64-bit), existing versions of Office that are installed, and required languages. 

As part of this review, make sure that your client devices meet or exceed the [minimum system requirements for installing Office 365 ProPlus](https://products.office.com/en-us/office-system-requirements#Office2016-suites-section).

In addition, you should review the system requirements for your Office server workloads. For example, Exchange 2007 does not support Outlook 2016. For more details, see [Exchange Server Supportability Matrix](https://technet.microsoft.com/library/ff728623(v=exchg.150).aspx) and [System Requirements for Office server products](https://products.office.com/en-US/office-system-requirements).

Finally, you should assess the deployment tools you already use in your organization, such as System Center Configuration Manager.


## Step 2 - Assess your Office 365 licensing and accounts

[[JASON: Add link to admin licenses content]]

Make sure that all your users have Office 365 accounts and licenses, and that those licenses include Office 365 ProPlus. For more details, see [Manage user accounts and licenses with Office 365 PowerShell](https://docs.microsoft.com/en-us/office365/enterprise/powershell/manage-user-accounts-and-licenses-with-office-365-powershell) and [Subscriptions, licenses, accounts, and tenants for Microsoft's cloud offerings](https://docs.microsoft.com/en-us/office365/enterprise/subscriptions-licenses-accounts-and-tenants-for-microsoft-cloud-offerings). 

## Step 3 - Assess your network capability

Review your network capability, including bandwidth and distribution of client devices, based on the following considerations:


[[JASON to update size of install files and updates]]

- Installation files for Office 365 ProPlus are approximately 850 mb for the core files, plus approximately 200 mb for each language deployed. [[DAN to review and provide right estimates--larger than this now.]]
- Office 365 updates vary in size, but you can review recent download sizes [here](https://support.office.com/en-us/article/Download-sizes-approximate-for-channel-updates-to-Office-365-ProPlus-190f41e4-064d-486b-9c95-db08f973687c). For details on the frequency and type of updates based on channel, see [Overview of the update process for Office 365 ProPlus](overview-of-the-update-process-for-office-365-proplus.md).  
- Client devices require internet access to activate their Office 365 ProPlus subscription, and then must connect at least once every thirty days to verify their subscription. 
- The following ports and protocols must be open: [Office 365 URLs and IP address ranges](https://support.office.com/en-us/article/Office-365-URLs-and-IP-address-ranges-8548a211-3fe7-47cb-abb1-355ea5aa88a2?ui=en-US&rs=en-US&ad=US).

[[DAN confirmed that binary delta compression does work with local source. Cut mention in planning content as well.]]

If you manage updates from the Office Content Delivery Network (CDN), your network usage is more efficient: The Office CDN automatically deploys an update over a number of days to prevent your devices from trying to update at the same time. These features are not available when managing updates from a local source.

[[FROM BILL: if no bottlenecks from remote sites to CDN, should just get updates from CDN. Often, customers  In general: add a paragraph to check for bottlenecks and base your update strategy based on that. BILL TO PROVIDE PARAGRAPH ON THIS]]

## Step 4 - Assess application compatibility

[[JASON to review this with Dan and Terry]]

Identify your Office add-ins--including VBA macros, third-party add-ins, and complex documents and spreadsheets--and assess their compatibility with Office 365 ProPlus. In particular, you should:

- Discover and test add-ins for compatability issues with the [Readiness Toolkit](https://go.microsoft.com/fwlink/p/?linkid=859119). For more details, see [Use the Readiness Toolkit](use-the-readiness-toolkit-to-assess-application-compatibility-for-office-365-pro.md).

- Work with your business groups to prioritize the critical add-ins.
 
As part of the [planning article](plan-deploy-office-365-proplus-with-Configuration-Manager.md), you will define an update process that tests your add-ins with future Office updates.  

## Review exit criteria 

Before planning your deployment, make sure you've completed all the steps for assessing your environment and requirements.
[[JASON: Shorten list and have it map more directly to steps above.]]
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


## Next steps

[Plan your deployment of Office 365 ProPlus](plan-office-365-proplus.md).


