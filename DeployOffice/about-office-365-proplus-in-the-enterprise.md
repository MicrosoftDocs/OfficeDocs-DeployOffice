---
title: "About Office 365 ProPlus in the enterprise"
ms.author: jwhit
author: jwhit-MSFT
manager: laurawi
ms.audience: ITPro
ms.topic: concetpual
ms.service: o365-proplus-itpro
localization_priority: Normal
ms.collection: 
- Ent_O365
- Strat_O365_ProPlus
ms.custom: Ent_Office_ProPlus
description: "Provides Office admins with an overivew of Office 365 ProPlus, including information about deploying and licensing."
---

# About Office 365 ProPlus in the enterprise

Office 365 ProPlus is a version of Office that's available through Office 365, and includes familiar applications such as Access, Excel, OneNote, Outlook, PowerPoint, Publisher, Skype for Business, and Word. These applications can be connected with Office 365 services such as SharePoint Online, Exchange Online, and Skype for Business Online. 
  
> [!NOTE]
> - Office 365 ProPlus is available as a standalone offering, or as part of other Office 365 plans, such as Office 365 Enterprise E3.
> - Project and Visio aren't included with Office 365 ProPlus, but are available from other Office 365 plans.
> - For more information about Office 365 plans, see [https://products.office.com](https://products.office.com) and the [Office 365 Service Descriptions](https://docs.microsoft.com/office365/servicedescriptions/office-365-service-descriptions-technet-library). 
  
## Office 365 ProPlus is similar to other versions of Office
<a name="BKMK_Similar"> </a>

Office 365 ProPlus is similar to other versions of Office. Here are some important similarities:
  
- Office 365 ProPlus is a full version of Office.  
    
- Its system requirements (for example, memory, hard disk space, and operating system) are similar to other versions of Office. For more information, see [System requirements for Office](https://products.office.com/office-system-requirements).
    
- Similar to other versions, Office 365 ProPlus is available in 32-bit and 64-bit versions. To determine the appropriate version, carefully review [Choose the 64-bit or 32-bit version of Office](https://support.office.com/en-us/article/Choose-between-the-64-bit-or-32-bit-version-of-Office-2dee7807-8f95-4d0c-b5fe-6c6f49b8d261) before deployment.
    
- Office 365 ProPlus is not a web based application, but instead will be installed on the user's local computer when deployed. It runs locally on the user's computer. Users don't need to be connected to the Internet all the time to use it.
    
- Many of the tools can used to deploy and configure Office can also be used on Office 365 ProPlus. For example, System Center Configuration Manager to deploy Office 365 ProPlus. For more information, see [Choose how to deploy Office 365 ProPlus](choose-how-to-deploy-office-365-proplus.md).
    
- In addition, many of the same Group Policy settings that are used with other versions of Office can also configure and enforce Office 365 ProPlus program settings. 
    
## What's different about Office 365 ProPlus?
<a name="BKMK_Different"> </a>

There are a lot of similiarities with Office, but there are also differences, including for [Deployment differences](about-office-365-proplus-in-the-enterprise.md#BKMK_Deployment) and [Licensing differences](about-office-365-proplus-in-the-enterprise.md#BKMK_Licensing). 
  
Most significant difference is that Office 365 ProPlus is updated regularly, as often as monthly, with new features, unlike non-subscription versions of Office. For a list of new features, see [What's new in Office 365](https://support.office.com/en-us/article/What-s-new-in-Office-365-95c8d81d-08ba-42c1-914f-bca4603e1426).
  
### Deployment differences
<a name="BKMK_Deployment"> </a>

- By default, Office 365 ProPlus installs as one package, so all Office programs are installed on the user's computer. The deployment can still be configured to [Exclude or remove Office 365 ProPlus products from client computers](overview-of-the-office-2016-deployment-tool.md#BKMK_excludeorremove), such as Access.
    
- Office 365 ProPlus uses a different installation technology, called Click-to-Run, so there's a different way to apply software updates, such as security updates. By default, Office 365 ProPlus is configured to automatically install updates from the Office Content Delivery Network (CDN) on the Internet. Office 365 ProPlus can be configured to install updates from a location within the user's network or they can [Manage updates to Office 365 ProPlus with System Center Configuration Manager](manage-updates-to-office-365-proplus-with-system-center-configuration-manager.md).
    
- Office 365 ProPlus also provides the ability to control how often users receive feature updates. For example, users can get new features to Office 365 ProPlus as soon as they are available. If they are line-of-business applications, add-ins, or macros to test with new features, users can be provided with new features less frequently. For more information, see [Overview of update channels for Office 365 ProPlus](overview-of-update-channels-for-office-365-proplus.md).
    
- Office 365 provides a web-based portal where users can install Office 365 ProPlus themselves. Users must be a local administrator to install Office 365 ProPlus. If the user is not, then a local administrator must install Office 365 ProPlus for them. Users can also be prevented from installing Office 365 ProPlus from the local portal. For more information, see [Choose how to deploy Office 365 ProPlus](choose-how-to-deploy-office-365-proplus.md).
    
### Licensing differences
<a name="BKMK_Licensing"> </a>

- Users can install Office 365 ProPlus on up to five different computers with a single Office 365 license. For example, a user can have Office 365 ProPlus installed on a computer in the office, on a laptop to use when traveling, and on a home computer. Users can also install on up to 5 tablets and 5 phones.
    
- Office 365 ProPlus is offered as a subscription. If the subscription is canceled, Office 365 ProPlus goes into reduced functionality mode. In reduced functionality mode, users can open and view existing Office files, but users can't use most of the other features of Office 365 ProPlus. For more information, see [Overview of licensing and activation in Office 365 ProPlus](overview-of-licensing-and-activation-in-office-365-proplus.md).
    
- To use Office 365 ProPlus, a user must have an Office 365 account and have been assigned a license. If the user's license or account is removed, the user's installations of Office 365 ProPlus go into reduced functionality mode.
    
- Even though users don't need to be connected to the Internet all the time to use Office 365 ProPlus, users must connect to the Internet at least once every 30 days. This is so that the status of their Office 365 subscriptions can be checked. If users don't connect within 30 days, Office 365 ProPlus goes into reduced functionality mode. After users connect to the Internet and their subscription status is verified, all the features of Office 365 ProPlus are available again.
    
## More information about Office 365 ProPlus
<a name="BKMK_MoreInfo"> </a>

- Office 365 ProPlus can be used a supported versions of Exchange Server or SharePoint Server that are installed on-premises in the user's organization. If they're part of the user's Office 365 plan, Office 365 ProPlus can be used with Exchange Online and SharePoint Online.
    
- Users can store the files they create with Office 365 ProPlus on their local computers or elsewhere on the user's network, such as a SharePoint site. Office 365 also provides cloud-based file storage options,
    
- Office 365 ProPlus isn't the same as [Office Online](https://docs.microsoft.com/office365/servicedescriptions/office-online-service-description/office-online-service-description). Office Online lets users open Word, Excel, PowerPoint, or OneNote documents in a web browser. Office Online is included with all Office 365 plans.
    
- Read the [Office 365 Service Descriptions](https://docs.microsoft.com/en-us/office365/servicedescriptions/office-365-service-descriptions-technet-library) to learn more about what's included in Office 365.
    
## Related topics

- [Deployment guide for Office 365 ProPlus](deployment-guide-for-office-365-proplus.md)
- [Compare enterprise plans for Office 365](https://products.office.com/en-us/business/compare-more-office-365-for-business-plans)
- [Purchase Office 365 ProPlus](https://go.microsoft.com/fwlink/p/?LinkID=329114)

