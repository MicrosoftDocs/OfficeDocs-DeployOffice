---
title: "Manage software download settings in Office 365"
ms.author: danbrown
author: DHB-MSFT
manager: laurawi
ms.date: 9/29/2017
ms.audience: ITPro
ms.topic: article
ms.service: o365-proplus-itpro
localization_priority: Normal
ms.collection: Ent_O365
ms.custom: 
- Ent_Office_ProPlus
- LIL_Placement
ms.assetid: c13051e6-f75c-4737-bc0d-7685dcedf360
description: "Provides Office 365 admins with information to help them configure software download settings in the Office 365 admin center."
---


# Manage software download setting in Office 365

As an Office 365 admin, you can control which Office software your users can download and install from Office 365. The choices you make on the **Software download settings** page determine which software users can install from the **Software** page in Office 365. Whichever choices you make, they apply to all users in your organization. 
  
If you choose to make some software unavailable to users, they see a message on their **Software** page instead of an **Install** button. For example, if you choose to make Office unavailable, users see this message: 
  
   Your admin has turned off Office installs. Contact your admin for more information about how to get Office in your organization. 
  
## Choose how often to get feature updates for Office 2016 apps

For Office 2016, you must choose how often you want users to get feature updates. Which frequency you choose depends on several factors, including how many line-of-business applications, add-ins, or macros that you need to test any time that there are feature updates to Office, Project, or Visio. For example, if you use specialized Excel workbooks in your business, you may want to get feature updates only every six months. This gives you time to test that your Excel workbooks work with the new features that Microsoft releases.
  
If you want some users to get feature updates every month, but have other users get feature updates only every six months, you can manually download and install the Office apps for your users by using the Office Deployment Tool. This gives you the control to select different feature update settings for different groups of users.
  
For more information, [Overview of update channels for Office 365 ProPlus](overview-of-update-channels-for-office-365-proplus.md).
  
## Manually download and install the Office apps by using the Office Deployment Tool

If you don't want your users to install software themselves from Office 365, you can download the software to your local network. Then, you can deploy the software to your users by using your existing software deployment tools and processes.
  
To manually deploy Office, as well as Project or Visio, you need to use the Office Deployment Tool. You can download the Office Deployment Tool for free from the [Microsoft Download Center](https://go.microsoft.com/fwlink/p/?LinkID=626065).
  
You use the Office Deployment Tool to both download and deploy Office, such as Office 365 ProPlus, to your users. If you already use other tools, such as System Center Configuration Manager, to deploy software to your users, you can use the Office Deployment Tool along with those tools to deploy Office.
  
For more information, see [Overview of the Office Deployment Tool](overview-of-the-office-2016-deployment-tool.md).
  
## Manually download InfoPath 2013 and SharePoint Designer 2013

In addition to Office, you can download InfoPath 2013 and SharePoint Designer 2013 in order to deploy them to your users. You can download them from the Microsoft Download Center by using the following links:
  
- [InfoPath 2013](https://go.microsoft.com/fwlink/p/?LinkID=626623) (32-bit and 64-bit versions) 
    
- [SharePoint Designer 2013](https://go.microsoft.com/fwlink/p/?LinkID=626622) (32-bit and 64-bit versions) 
    
After you download the software, you can use your existing software deployment tools and processes to deploy InfoPath or SharePoint Designer to your users.
  
## Additional considerations about managing software download settings in Office 365

- The list of Office software that appears on the **Software download settings** page depends on the type of Office 365 plan that your organization has. 
    
- Users have to be local administrators on their computers to install Office software. If users aren't local administrators, you'll have to install Office for them.
    
- For users to be able to install Office, you need to [assign them an Office 365 license](https://support.office.com/article/997596b5-4173-4627-b915-36abac6786dc).
    
- By default, Office installs all the apps that are included in your version of Office on the user's computer. If you want some users to get fewer apps, such as only Word and PowerPoint, you need to use the Office Deployment Tool to deploy Office to your users without those apps.
    
[!INCLUDE [LinkedIn Learning Info](common/office/linkedin-learning-info.md)]
   

