---
title: "About Microsoft 365 Apps in the enterprise"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: overview
ms.service: o365-proplus-itpro
ms.collection: 
 - tier1
 - essentials-overview
ms.localizationpriority: medium
ms.custom: intro-overview
recommendations: true
description: "Provides Office admins with an overview of Microsoft 365 Apps, including information about deploying and licensing."
ms.date: 09/30/2024
---

# About Microsoft 365 Apps in the enterprise

Microsoft 365 Apps is a version of Office that's available through Office 365 plans. It includes familiar apps like Access, Excel, OneDrive, OneNote, Outlook, PowerPoint, Publisher, Skype for Business, Teams, and Word. You can use these applications to connect with Office 365 (or Microsoft 365) services such as SharePoint Online, Exchange Online, and Skype for Business Online. 
  
> [!NOTE]
> - Project and Visio aren't included with Microsoft 365 Apps, but are available from other subscription plans.
> - For more information about Office 365 (and Microsoft 365) plans, see [https://microsoft.com/microsoft-365](https://microsoft.com/microsoft-365) and the [Microsoft 365 and Office 365 service descriptions](/office365/servicedescriptions/office-365-service-descriptions-technet-library). 
  
## Microsoft 365 Apps is similar to other versions of Office
<a name="BKMK_Similar"> </a>

Microsoft 365 Apps is similar to other versions of Office that you can deploy to your users. Here are some important similarities:
  
- Microsoft 365 Apps is a full version of Office.  
    
- Its system requirements (for example, memory, hard disk space, and operating system) are similar to other current versions of Office. For more information, see [System requirements for Office](https://support.microsoft.com/topic/13eda659-3dfc-448e-b2cd-70ebb989be47).
    
- Like other versions of Office, Microsoft 365 Apps is available in a 32-bit and a 64-bit version. To decide which version is right for your environment, carefully review [Choose between the 64-bit or 32-bit version of Office](https://support.microsoft.com/office/2dee7807-8f95-4d0c-b5fe-6c6f49b8d261) before you deploy.

- When you deploy Microsoft 365 Apps, it's installed on the user's local computer. Microsoft 365 Apps isn't a web-based version of Office. It runs locally on the user's computer. Users don't need to be connected to the internet all the time to use it.
    
- You can use many of the same tools to deploy and configure Microsoft 365 Apps that you're already using to deploy Office. For example, you can use Microsoft Configuration Manager to deploy Microsoft 365 Apps. For more information, see [Choose how to deploy](plan-microsoft-365-apps.md#step-1---choose-how-to-deploy).
    
- In addition, you can use many of the same Group Policy settings that you use with other versions of Office to configure and enforce Microsoft 365 Apps program settings. 

<!--Using include for Microsoft 365 Apps on arm-->
> [!NOTE]
> [!INCLUDE[m365-apps-arm.md](../includes/m365-apps-arm.md)]
    
## What's different about Microsoft 365 Apps?
<a name="BKMK_Different"> </a>

Even though Microsoft 365 Apps is a lot like other versions of Office, there are differences, including for [Deployment differences](about-microsoft-365-apps.md#BKMK_Deployment) and [Licensing differences](about-microsoft-365-apps.md#BKMK_Licensing). 
  
The most significant difference is that Microsoft 365 Apps is updated regularly, as often as monthly, with new features, unlike non-subscription versions of Office. For a list of new features, see [What's new in Microsoft 365](https://support.microsoft.com/office/95c8d81d-08ba-42c1-914f-bca4603e1426).
  
### Deployment differences
<a name="BKMK_Deployment"> </a>

- By default, Microsoft 365 Apps installs as a single package, meaning all Office apps are installed on the user's computer. But, you can configure the deployment to [exclude or remove](overview-office-deployment-tool.md#BKMK_excludeorremove) certain Office applications, such as Access, from client computers.
    
- Because Microsoft 365 Apps uses a different installation technology, called Click-to-Run, there's a different way to apply software updates, such as security updates. By default, Microsoft 365 Apps is configured to automatically install updates from the Office Content Delivery Network (CDN) on the internet. But, you can configure Microsoft 365 Apps to install updates from a location within your own network or you can [manage updates to Microsoft 365 Apps with Microsoft Configuration Manager](../updates/manage-microsoft-365-apps-updates-configuration-manager.md).
    
- Microsoft 365 Apps lets you control how often users receive feature updates. For example, users can get new features to Microsoft 365 Apps as soon as they're ready, or once a month (on the second Tuesday of the month), or twice a year (in January and July, on the second Tuesday). For more information, see [Overview of update channels for Microsoft 365 Apps](../updates/overview-update-channels.md).
    
- Office 365 (and Microsoft 365) provides a web-based portal where users can install Microsoft 365 Apps themselves. Keep in mind that users have to be local administrators on their computers to install Microsoft 365 Apps. If users aren't local administrators, you need to install Microsoft 365 Apps for them. Also, if you don't want your users to install from the portal, you can prevent that. For more information, see [Choose how to deploy](plan-microsoft-365-apps.md#step-1---choose-how-to-deploy).
    
### Licensing differences
<a name="BKMK_Licensing"> </a>

- Users can install Microsoft 365 Apps on up to five different computers with a single Office 365 license. For example, a user can have Microsoft 365 Apps installed on a computer in the office, on a laptop to use when traveling, and on a home computer. Users can also install on up to five tablets and five phones.
    
- Microsoft 365 Apps is offered as a subscription. If you cancel your subscription, Microsoft 365 Apps goes into reduced functionality mode. In reduced functionality mode, users can open and view existing Office files, but users can't use most of the other features of Microsoft 365 Apps. For more information, see [Overview of licensing and activation in Microsoft 365 Apps](../licensing-activation/overview-licensing-activation-microsoft-365-apps.md).
    
- To use Microsoft 365 Apps, a user must have a Microsoft 365 account and assigned a license. If the user's license or account is removed, the user's installations of Microsoft 365 Apps go into reduced functionality mode.
    
- Users don’t need to stay connected to the internet to use Microsoft 365 Apps, but they must connect at least once every 30 days to verify the status of their Microsoft 365 subscriptions. If users don't connect within 30 days, Microsoft 365 Apps goes into reduced functionality mode. After users connect to the internet and their subscription status is verified, all the features of Microsoft 365 Apps are available again.
    
## More information about Microsoft 365 Apps
<a name="BKMK_MoreInfo"> </a>

- You can use Microsoft 365 Apps with supported versions of Exchange Server or SharePoint Server that are installed on-premises in your organization. Or, if they're part of your Office 365 (or Microsoft 365) plan, you can use Microsoft 365 Apps with Exchange Online and SharePoint Online.
    
- Users can store the files they create with Microsoft 365 Apps on their local computers or elsewhere on your network, such as a SharePoint site. Office 365 (and Microsoft 365) also provides cloud-based file storage options.
    
- Microsoft 365 Apps isn't the same as the [web versions of the Office applications](/office365/servicedescriptions/office-online-service-description/office-online-service-description). The web versions let users open and work with Word, Excel, PowerPoint, or OneNote documents in a web browser. The web versions of these Office applications are included with all Office 365 (and Microsoft 365) plans.
    
- For more information about the services included in Microsoft 365, see [Microsoft 365 and Office 365 service descriptions](/office365/servicedescriptions/office-365-service-descriptions-technet-library).
    
## Related articles

- [Deployment guide for Microsoft 365 Apps](deployment-guide-microsoft-365-apps.md)
- [Compare enterprise plans for Office 365](https://www.microsoft.com/microsoft-365/enterprise/compare-office-365-plans)
