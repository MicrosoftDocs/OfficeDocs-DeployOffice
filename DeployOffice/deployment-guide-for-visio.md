---
title: "Deployment guide for Visio"
ms.author: danbrown
author: DHB-MSFT
manager: laurawi
audience: ITPro
ms.topic: get-started-article
ms.service: o365-proplus-itpro
localization_priority: Normal
ms.collection: Ent_O365
ms.custom: Ent_Office_ProPlus
description: "Provides Office admins with an overview of how to deploy subscription and volume licensed versions of Visio to users in their organization."
---

# Deployment guide for Visio

  
How you deploy Visio to the users in your organization depends on which version of Visio you purchase. A common purchase option for organizations is one of the following versions of Visio:
  
- Visio desktop app that comes with a Visio Plan 2 subscription.
- Visio Professional 2019 or Visio Standard 2019, available as a one-time purchase through a volume licensing agreement.
- Visio Professional 2016 or Visio Standard 2016, available as a one-time purchase through a volume licensing agreement.
     
Before you deploy, be sure to [review the system requirements](https://products.office.com/office-resources) for the version of Visio that you plan to deploy to the users in your organization. 
  
> [!IMPORTANT]
> There are some combinations of Office, Visio, and Project that can't be installed together on the same computer. For more information, see [Supported scenarios for installing different versions of Office, Visio, and Project on the same computer](install-different-office-visio-and-project-versions-on-the-same-computer.md). 
  
## Deploy a subscription version of Visio

Here are the general steps to deploy a subscription version of Visio to users in your organization:
  
1. Purchase Visio Plan 2, with enough licenses for each of your Visio users.
    
2. Sign in to Office 365 and [assign licenses](https://support.office.com/article/997596b5-4173-4627-b915-36abac6786dc) for Visio to those users. 
    
3. Have your users sign in to Office 365 and install Visio from the **Software** section of the Office 365 portal. Users have to be local administrators on their computers to install Visio. 
    
If you want to have more control over how the subscription version of Visio is deployed to your users, you can do the following instead:
  
1. [Download](https://www.microsoft.com/download/details.aspx?id=49117) the Office Deployment Tool from the Microsoft Download Center. 
    
2. Create a [configuration.xml file](configuration-options-for-the-office-2016-deployment-tool.md) to use with the Office Deployment Tool to download and install the subscription version of Visio. 
    
3. Use the [Office Deployment Tool](overview-office-deployment-tool.md) to deploy the subscription version Visio to the users in your organization. 
    
If you already use other tools to deploy software to your users, such as Microsoft Endpoint Configuration Manager, you can use the Office Deployment Tool along with those tools to deploy the subscription version of Office. 


## Deploy a volume licensed version of Visio 2019

Here are the general steps to deploy a volume licensed version of Visio Professional 2019 or Visio Standard 2019 to users in your organization:
  
1. Purchase Visio 2019 as part of a volume licensing agreement.
    
2. Use the Office Deployment Tool and a configuration.xml file to download and install Visio from 2019 from the Office Content Delivery Network (CDN) on the internet. For more information, see [Deploy Office 2019 (for IT Pros)](office2019/deploy.md).

If you already use other tools to deploy software to your users, such as Microsoft Endpoint Configuration Manager, you can use the Office Deployment Tool along with those tools to deploy volume licensed versions of Visio. 
  
> [!NOTE]
> - Volume licensed versions of Visio 2019 are available directly from the Office CDN instead of from the Volume Licensing Service Center. 
> - Volume licensed versions of Visio 2019 are installed by using Click-to-Run instead of by using Windows Installer (MSI).
> - The Office Customization Tool (OCT) that's used for Windows Installer (MSI) versions of Visio isn't used with volume licensed versions of Visio 2019.

  
## Deploy a volume licensed version of Visio 2016

Here are the general steps to deploy a volume licensed version of Visio Professional 2016 or Visio Standard 2016 to users in your organization:
  
1. Purchase Visio 2016 as part of a volume licensing agreement.
    
2. Download your version of Visio 2016 from the [Volume Licensing Service Center](https://www.microsoft.com/Licensing/servicecenter/default.aspx).
    
3. If you want to configure user settings for when Visio is installed, you can use the [Office Customization Tool (OCT)](oct/oct-2016-help-overview.md).
    
4. Deploy Visio 2016 to your users. For example, you can send your users a script to run that installs Visio from a network share on your local network.
    
If you already use other tools to deploy software to your users, such as Microsoft Endpoint Configuration Manager, you can use the Office Customization Tool (OCT) along with those tools to deploy Visio. 
  
> [!NOTE]
> The Office Customization Tool (OCT) is only available for versions of Visio 2016 that are purchased as part of a volume licensing agreement. The OCT can't be used for retail versions of Visio 2016, such as versions bought at a retail store or online. 
  
## Configure user settings for Visio by using Group Policy

If you want to specify and maintain certain user settings for your Visio installations, you can [download the Group Policy Administrative Template files (ADMX/ADML) for Office](https://www.microsoft.com/download/details.aspx?id=49030) and use them to configure Group Policy settings. Group Policy can be used only with computers joined to a domain. 
  
The same Group Policy settings work for the subscription version of the Visio desktop app, as well as volume licensed versions of Visio, such as Visio Professional 2019 or Visio Standard 2016.
  
## End user resources for Visio

To help your users get started with Visio, here are some resources to share with them:
  
- [What's new in Visio 2019](https://support.office.com/article/19b8e98d-9cf9-40ad-9277-eb65e3713a79)
- [Visio help center](https://support.office.com/visio)
    
## Related topics

- [Plans and pricing information](https://products.office.com/visio/microsoft-visio-plans-and-pricing-compare-visio-options?tab=tabs-1)
- [Visio licensing](https://products.office.com/Visio/microsoft-visio-volume-licensing-visio-for-multiple-users)

