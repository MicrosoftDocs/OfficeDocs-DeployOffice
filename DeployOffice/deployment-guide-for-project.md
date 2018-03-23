---
title: "Deployment guide for Project 2016"
ms.author: danbrown
author: DHB-MSFT
manager: laurawi
ms.date: 3/23/2018
ms.audience: ITPro
ms.topic: get-started-article
ms.service: o365-proplus-itpro
localization_priority: Normal
ms.collection:
- Ent_O365
- Strat_O365_ProPlus
ms.custom:
- Strat_O365_ProPlus
- Ent_Office_ProPlus
ms.assetid: 7eeeb822-bc9c-4189-bf20-3f9839879131
description: "Provides an overview for admins on how to deploy Project 2016, including Project Online Desktop Client, to users in their organization"
---

# Deployment guide for Project 2016

 **Summary:** Provides an overview for admins on how to deploy Project 2016, including Project Online Desktop Client, to users in their organization 
  
How you deploy Project 2016 to the users in your organization depends on which version of Project you've purchased. The most common options for organizations to install Project on users' computers are the following:
  
- Project Online Desktop Client, available as a subscription through Project Online.
    
- Project Professional 2016 or Project Standard 2016, as part of a volume licensing agreement.
    
Before you deploy, be sure to [review the system requirements](https://products.office.com/office-system-requirements) for the version of Project that you plan to deploy to the users in your organization. 
  
> [!IMPORTANT]
> There are some combinations of Office, Visio, and Project that can't be installed together on the same computer. For more information, see [Supported scenarios for installing different versions of Office, Visio, and Project on the same computer](install-different-office-visio-and-project-versions-on-the-same-computer.md). 
  
## Deploy Project Online Desktop Client

Here are the general steps to deploy Project Online Desktop Client to users in your organization:
  
1. Purchase a Project Online subscription, such as Project Online Professional, that includes Project Online Desktop Client, with enough licenses for each of your Project users.
    
2. Sign in to Office 365 and [assign licenses](https://support.office.com/article/997596b5-4173-4627-b915-36abac6786dc) for Project Online Desktop Client to those users. 
    
3. Have your users sign in to Office 365 and install Project from the **Software** section of the Office 365 portal. Users have to be local administrators on their computers to install Project. 
    
If you want to have more control over how Project is deployed to your users, you can do the following instead:
  
- [Download the Office Deployment Tool](https://go.microsoft.com/fwlink/p/?LinkID=626065) from the Microsoft Download Center. 
    
- [Create a configuration.xml file](configuration-options-for-the-office-2016-deployment-tool.md)] to use with the Office Deployment Tool to download and install Project Online Desktop Client. 
    
- Use the Office Deployment Tool to [deploy Project Online Desktop Client](overview-of-the-office-2016-deployment-tool) on your users' computers. 
    
If you already use other tools to deploy software to your users, such as System Center Configuration Manager, you can use the Office Deployment Tool along with those tools to deploy Project. 
  
## Deploy Project Professional 2016 or Project Standard 2016

Here are the general steps to deploy Project Professional 2016 or Project Standard 2016 to users in your organization:
  
1. Purchase Project 2016 as part of a volume licensing agreement.
    
2. Download your version of Project 2016 from the [Volume Licensing Service Center](https://www.microsoft.com/Licensing/servicecenter/default.aspx).
    
3. If you want to configure user settings for when Project is installed, you can use the Office Customization Tool (OCT).
    
4. Deploy Project 2016 to your users. For example, you can send your users a script to run that installs Project from a network share on your local network.
    
If you already use other tools to deploy software to your users, such as System Center Configuration Manager, you can use the Office Customization Tool (OCT) along with those tools to deploy Project. 
  
> [!NOTE]
> The Office Customization Tool (OCT) is only available for versions of Project 2016 that are purchased as part of a volume licensing agreement. The OCT can't be used for retail versions of Project 2016, such as versions bought at a retail store or online. 
  
## Specify and maintain user settings for your Project 2016 installations

If you want to specify and maintain certain user settings for your Project installations, you can [download the Office 2016 Group Policy Administrative Template (ADMX/ADML) files](https://www.microsoft.com/download/details.aspx?id=49030) and use them to configure Group Policy settings. Group Policy can be used only with computers joined to a domain. 
  
The same Group Policy settings work for Project Online Desktop Client, Project Professional 2016, and Project Standard 2016.
  
## End user resources for Project 2016

To help your users get started with Project, here are some resources to share with them:
  
- [What's new in Project 2016](https://support.office.com/article/111bcaf9-bc27-4c15-80e6-85e726307520)
    
- [Basic tasks in Project](https://support.office.com/article/8fdbf020-a9e1-45e4-bf15-23a8d2b6797d)
    
## Related topics
[Documentation](https://docs.microsoft.com/project) to help you plan, deploy, and manage Project Server and Project Online

Feature and purchasing information for [Project Server](https://products.office.com/Project/enterprise-project-server), [Project Online](https://products.office.com/Project/project-online-portfolio-management), and [Project Essentials](https://products.office.com/Project/project-online-essentials)

