---
title: "Deployment guide for Visio 2016"
ms.author: danbrown
author: DHB-MSFT
manager: laurawi
ms.date: 3/23/2018
ms.audience: ITPro
ms.topic: get-started-article
ms.service: o365-proplus-itpro
localization_priority: Priority
ms.collection:
- Ent_O365
- Strat_O365_ProPlus
ms.custom: Ent_Office_ProPlus
ms.assetid: ffe43dfe-22f0-4079-9ab0-dbc42aaa4934
description: "Provides an overview for admins on how to deploy Visio 2016, including Visio Pro for Office 365, to users in their organization"
---

# Deployment guide for Visio 2016

 **Summary:** Provides an overview for admins on how to deploy Visio 2016, including Visio Pro for Office 365, to users in their organization 
  
How you deploy Visio 2016 to the users in your organization depends on which version of Visio you've purchased. The most common options for organizations to install Visio on users' computers are the following:
  
- Visio Pro for Office 365, available as a subscription through Office 365.
    
- Visio Professional 2016 or Visio Standard 2016, as part of a volume licensing agreement.
    
Before you deploy, be sure to [review the system requirements](https://products.office.com/office-system-requirements) for the version of Visio that you plan to deploy to the users in your organization. 
  
> [!IMPORTANT]
> There are some combinations of Office, Visio, and Project that can't be installed together on the same computer. For more information, see [Supported scenarios for installing different versions of Office, Visio, and Project on the same computer](install-different-office-visio-and-project-versions-on-the-same-computer.md). 
  
## Deploy Visio Pro for Office 365

Here are the general steps to deploy Visio Pro for Office 365 to users in your organization:
  
1. Purchase Visio Pro for Office 365, with enough licenses for each of your Visio users.
    
2. Sign in to Office 365 and [assign licenses](https://support.office.com/article/997596b5-4173-4627-b915-36abac6786dc) for Visio Pro for Office 365 to those users. 
    
3. Have your users sign in to Office 365 and install Visio from the **Software** section of the Office 365 portal. Users have to be local administrators on their computers to install Visio. 
    
If you want to have more control over how Visio Pro for Office 365 is deployed to your users, you can do the following instead:
  
1. [Download](https://go.microsoft.com/fwlink/p/?LinkID=626065) the Office Deployment Tool from the Microsoft Download Center. 
    
2. Create a [configuration.xml file](configuration-options-for-the-office-2016-deployment-tool.md) to use with the Office Deployment Tool to download and install Visio Pro for Office 365. 
    
3. Use the [Office Deployment Tool](overview-of-the-office-2016-deployment-tool.md) to deploy Visio Pro for Office 365 on your users' computers. 
    
If you already use other tools to deploy software to your users, such as System Center Configuration Manager, you can use the Office Deployment Tool along with those tools to deploy Visio Pro for Office 365. 
  
## Deploy Visio Professional 2016 or Visio Standard 2016

Here are the general steps to deploy Visio Professional 2016 or Visio Standard 2016 to users in your organization:
  
1. Purchase Visio 2016 as part of a volume licensing agreement.
    
2. Download your version of Visio 2016 from the [Volume Licensing Service Center](https://www.microsoft.com/Licensing/servicecenter/default.aspx).
    
3. If you want to configure user settings for when Visio is installed, you can use the Office Customization Tool (OCT).
    
4. Deploy Visio 2016 to your users. For example, you can send your users a script to run that installs Visio from a network share on your local network.
    
If you already use other tools to deploy software to your users, such as System Center Configuration Manager, you can use the Office Customization Tool (OCT) along with those tools to deploy Visio. 
  
> [!NOTE]
> The Office Customization Tool (OCT) is only available for versions of Visio 2016 that are purchased as part of a volume licensing agreement. The OCT can't be used for retail versions of Visio 2016, such as versions bought at a retail store or online. 
  
## Specify and maintain user settings for your Visio 2016 installations

If you want to specify and maintain certain user settings for your Visio installations, you can [download the Office 2016 Group Policy Administrative Template (ADMX/ADML) files](https://www.microsoft.com/download/details.aspx?id=49030) and use them to configure Group Policy settings. Group Policy can be used only with computers joined to a domain. 
  
The same Group Policy settings work for Visio Pro for Office 365, Visio Professional 2016, and Visio Standard 2016.
  
## End user resources for Visio 2016

To help your users get started with Visio, here are some resources to share with them:
  
- [What's new in Visio 2016](https://support.office.com/article/798f4f39-2833-486b-9ae9-55162672102e)
- [Tutorial for Visio 2016](https://support.office.com/article/c8fd9b8b-6e8c-4252-937d-a0eea0cddd94)
- [Visio video training](https://support.office.com/article/e058bcfa-1d90-4653-afc6-e84d54cf94a6) 
    
## Related topics
[Plans and pricing information](https://products.office.com/visio/microsoft-visio-plans-and-pricing-compare-visio-options?tab=tabs-1)

[Licensing Visio](https://products.office.com/Visio/microsoft-visio-volume-licensing-visio-for-multiple-users)

