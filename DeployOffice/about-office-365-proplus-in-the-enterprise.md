---
title: "About Office 365 ProPlus in the enterprise"
ms.author: jwhit
author: jwhit-MSFT
manager: laurawi
audience: ITPro
ms.topic: conceptual
ms.service: o365-proplus-itpro
localization_priority: Normal
ms.collection: 
- Ent_O365
- M365-modern-desktop
ms.custom: Ent_Office_ProPlus
description: "Provides Office admins with an overivew of Office 365 ProPlus, including information about deploying and licensing."
---

# About Office 365 ProPlus in the enterprise

Office 365 ProPlus is a version of Office that's available through Office 365. It includes the applications that you're familiar with, including Access, Excel, OneNote, Outlook, PowerPoint, Publisher, Skype for Business, and Word. You can use these applications to connect with Office 365 services such as SharePoint Online, Exchange Online, and Skype for Business Online. 
  
> [!NOTE]
> - Office 365 ProPlus is available as a standalone offering, or as part of other Office 365 plans, such as Office 365 Enterprise E3.
> - Project and Visio aren't included with Office 365 ProPlus, but are available from other Office 365 plans.
> - For more information about Office 365 plans, see [https://products.office.com](https://products.office.com) and the [Office 365 Service Descriptions](https://docs.microsoft.com/office365/servicedescriptions/office-365-service-descriptions-technet-library). 
  
## Office 365 ProPlus is similar to other versions of Office
<a name="BKMK_Similar"> </a>

Office 365 ProPlus is similar to other versions of Office that you can deploy to your users. Here are some important similarities:
  
- Office 365 ProPlus is a full version of Office.  
    
- Its system requirements (for example, memory, hard disk space, and operating system) are similar to other current versions of Office. For more information, see [System requirements for Office](https://products.office.com/office-system-requirements).
    
- Like other versions of Office, Office 365 ProPlus is available in a 32-bit and a 64-bit version. To decide which version is right for your environment, carefully review [Choose the 64-bit or 32-bit version of Office](https://support.office.com/article/Choose-between-the-64-bit-or-32-bit-version-of-Office-2dee7807-8f95-4d0c-b5fe-6c6f49b8d261) before you deploy.
    
- When you deploy Office 365 ProPlus, it's installed on the user's local computer. Office 365 ProPlus is not a web-based version of Office. It runs locally on the user's computer. Users don't need to be connected to the Internet all the time to use it.
    
- You can use many of the same tools to deploy and configure Office 365 ProPlus that you're already using to deploy Office. For example, you can use Microsoft Endpoint Configuration Manager to deploy Office 365 ProPlus. For more information, see [Choose how to deploy Office 365 ProPlus](choose-how-to-deploy-office-365-proplus.md).
    
- In addition, you can use many of the same Group Policy settings that you use with other versions of Office to configure and enforce Office 365 ProPlus program settings. 
    
## What's different about Office 365 ProPlus?
<a name="BKMK_Different"> </a>

Even though Office 365 ProPlus is a lot like other versions of Office, there are differences, including for [Deployment differences](about-office-365-proplus-in-the-enterprise.md#BKMK_Deployment) and [Licensing differences](about-office-365-proplus-in-the-enterprise.md#BKMK_Licensing). 
  
The most significant difference is that Office 365 ProPlus is updated regularly, as often as monthly, with new features, unlike non-subscription versions of Office. For a list of new features, see [What's new in Office 365](https://support.office.com/article/What-s-new-in-Office-365-95c8d81d-08ba-42c1-914f-bca4603e1426).
  
### Deployment differences
<a name="BKMK_Deployment"> </a>

- By default, Office 365 ProPlus installs as one package. This means that all Office programs are installed on the user's computer. But, you can configure the deployment to [Exclude or remove Office 365 ProPlus products from client computers](overview-of-the-office-2016-deployment-tool.md#BKMK_excludeorremove), such as Access. 
    
- Because Office 365 ProPlus uses a different installation technology, called Click-to-Run, there's a different way to apply software updates, such as security updates. By default, Office 365 ProPlus is configured to automatically install updates from the Office Content Delivery Network (CDN) on the Internet. But, you can configure Office 365 ProPlus to install updates from a location within your own network or you can [Manage updates to Office 365 ProPlus with Microsoft Endpoint Configuration Manager](manage-updates-to-office-365-proplus-with-system-center-configuration-manager.md).
    
- Office 365 ProPlus also provides the ability to control how often users receive feature updates. For example, users can get new features to Office 365 ProPlus as soon as they are available. Or, if you have line-of-business applications, add-ins, or macros that you want to test with the new features, you can provide users with new features less frequently. For more information, see [Overview of update channels for Office 365 ProPlus](overview-of-update-channels-for-office-365-proplus.md).
    
- Office 365 provides a web-based portal where users can install Office 365 ProPlus themselves. Keep in mind that users have to be local administrators on their computers to install Office 365 ProPlus. If users aren't local administrators, you'll have to install Office 365 ProPlus for them. Also, if you don't want your users to install from the portal, you can prevent that. For more information, see [Choose how to deploy Office 365 ProPlus](choose-how-to-deploy-office-365-proplus.md).
    
### Licensing differences
<a name="BKMK_Licensing"> </a>

- Users can install Office 365 ProPlus on up to five different computers with a single Office 365 license. For example, a user can have Office 365 ProPlus installed on a computer in the office, on a laptop to use when traveling, and on a home computer. Users can also install on up to 5 tablets and 5 phones.
    
- Office 365 ProPlus is offered as a subscription. If you cancel your subscription, Office 365 ProPlus goes into reduced functionality mode. In reduced functionality mode, users can open and view existing Office files, but users can't use most of the other features of Office 365 ProPlus. For more information, see [Overview of licensing and activation in Office 365 ProPlus](overview-of-licensing-and-activation-in-office-365-proplus.md).
    
- To use Office 365 ProPlus, a user must have an Office 365 account and have been assigned a license. If the user's license or account is removed, the user's installations of Office 365 ProPlus go into reduced functionality mode.
    
- Even though users don't need to be connected to the Internet all the time to use Office 365 ProPlus, users must connect to the Internet at least once every 30 days. This is so that the status of their Office 365 subscriptions can be checked. If users don't connect within 30 days, Office 365 ProPlus goes into reduced functionality mode. After users connect to the Internet and their subscription status is verified, all the features of Office 365 ProPlus are available again.
    
## More information about Office 365 ProPlus
<a name="BKMK_MoreInfo"> </a>

- You can use Office 365 ProPlus with supported versions of Exchange Server (Exchange Server 2013 or later) or SharePoint Server that are installed on-premises in your organization. Or, if they're part of your Office 365 plan, you can use Office 365 ProPlus with Exchange Online and SharePoint Online.
    
- Users can store the files they create with Office 365 ProPlus on their local computers or elsewhere on your network, such as a SharePoint site. Office 365 also provides cloud-based file storage options,
    
- Office 365 ProPlus isn't the same as the [web versions of the Office applications](https://docs.microsoft.com/office365/servicedescriptions/office-online-service-description/office-online-service-description). The web versions let users open and work with Word, Excel, PowerPoint, or OneNote documents in a web browser. The web versions of these Office application are included with all Office 365 and Microsoft 365 plans.
    
- Read the [Office 365 Service Descriptions](https://docs.microsoft.com/office365/servicedescriptions/office-365-service-descriptions-technet-library) to learn more about what's included in Office 365.
    
## Related topics

- [Deployment guide for Office 365 ProPlus](deployment-guide-for-office-365-proplus.md)
- [Compare enterprise plans for Office 365](https://products.office.com/business/compare-more-office-365-for-business-plans)
- [Purchase Office 365 ProPlus](https://go.microsoft.com/fwlink/p/?LinkID=329114)

