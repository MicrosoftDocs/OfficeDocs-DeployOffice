---
title: "Deployment guide for Project"
ms.author: danbrown
author: DHB-MSFT
manager: dougeby
audience: ITPro
ms.topic: article
ms.service: o365-proplus-itpro
ms.localizationpriority: medium
ms.collection: Ent_O365
ms.custom: Ent_Office_ProPlus
recommendations: true
description: "Provides Office admins with an overview of how to deploy Project, including Project Online Desktop Client and Project 2019, to users in their organization."
---

# Deployment guide for Project

How you deploy Project to the users in your organization depends on which version of Project you purchase. A common purchase option for organizations is one of the following versions of Project:
  
- Project Online Desktop Client, available as a subscription with Project Plan 3 or Project Plan 5.
- Project Professional 2021 or Project Standard 2021, available as a one-time purchase through a volume licensing agreement.
- Project Professional 2019 or Project Standard 2019, available as a one-time purchase through a volume licensing agreement.
- Project Professional 2016 or Project Standard 2016, available as a one-time purchase through a volume licensing agreement.

Before you deploy, be sure to [review the system requirements](https://www.microsoft.com/microsoft-365/microsoft-365-and-office-resources) for the version of Project that you plan to deploy to the users in your organization.
  
> [!IMPORTANT]
> There are some combinations of Office, Visio, and Project that can't be installed together on the same device. For more information, see [Supported scenarios for installing different versions of Office, Visio, and Project on the same computer](install-different-office-visio-and-project-versions-on-the-same-computer.md).
  
## Deploy Project Online Desktop Client

Here are the general steps to deploy Project Online Desktop Client to users in your organization:
  
1. Purchase either Project Plan 3 or Project Plan 5, which includes Project Online Desktop Client, with enough licenses for all of your Project users.

2. Sign in to the [Microsoft 365 admin center](/microsoft-365/admin/admin-overview/about-the-admin-center) and [assign licenses](/microsoft-365/admin/manage/assign-licenses-to-users) for Project Online Desktop Client to those users.

3. Have your users sign in to [Office.com](https://www.office.com) and install Project from the **Apps & devices** section of [My account](https://portal.office.com/account). Users have to be local administrators on their devices to install Project.

If you want to have more control over how Project is deployed to your users, you can do the following instead:
  
1. [Download](https://www.microsoft.com/download/details.aspx?id=49117) the Office Deployment Tool from the Microsoft Download Center.

2. Create a [configuration.xml file](office-deployment-tool-configuration-options.md) to use with the Office Deployment Tool to download and install Project Online Desktop Client.

3. Use the [Office Deployment Tool](overview-office-deployment-tool.md) to deploy Project Online Desktop Client on your users' devices.

If you already use other tools to deploy software to your users, such as Microsoft Configuration Manager, you can use the Office Deployment Tool along with those tools to deploy Project.

## Deploy a volume licensed version of Project 2021

Here are the general steps to deploy a volume licensed version of Project Professional 2021 or Project Standard 2021 to users in your organization:
  
1. Purchase Project 2021 as part of a volume licensing agreement.

2. Use the Office Deployment Tool and a configuration.xml file to download and install Project 2021 from the Office Content Delivery Network (CDN) on the internet. For more information, see [Deploy Office LTSC 2021](ltsc2021/deploy.md).

If you already use other tools to deploy software to your users, such as Microsoft Configuration Manager, you can use the Office Deployment Tool along with those tools to deploy volume licensed versions of Project.
  
> [!NOTE]
> - Volume licensed versions of Project 2021 are available directly from the Office CDN instead of from the Volume Licensing Service Center. 
> - Volume licensed versions of Project 2021 are installed by using Click-to-Run instead of by using Windows Installer (MSI).
> - The Office Customization Tool (OCT) that's used for Windows Installer (MSI) versions of Project isn't used with volume licensed versions of Project 2021.

## Deploy a volume licensed version of Project 2019

Here are the general steps to deploy a volume licensed version of Project Professional 2019 or Project Standard 2019 to users in your organization:
  
1. Purchase Project 2019 as part of a volume licensing agreement.

2. Use the Office Deployment Tool and a configuration.xml file to download and install Project 2019 from the Office Content Delivery Network (CDN) on the internet. For more information, see [Deploy Office 2019 (for IT Pros)](office2019/deploy.md).

If you already use other tools to deploy software to your users, such as Microsoft Configuration Manager, you can use the Office Deployment Tool along with those tools to deploy volume licensed versions of Project.
  
> [!NOTE]
> - Volume licensed versions of Project 2019 are available directly from the Office CDN instead of from the Volume Licensing Service Center. 
> - Volume licensed versions of Project 2019 are installed by using Click-to-Run instead of by using Windows Installer (MSI).
> - The Office Customization Tool (OCT) that's used for Windows Installer (MSI) versions of Project isn't used with volume licensed versions of Project 2019.
  
## Deploy a volume licensed version of Project 2016

Here are the general steps to deploy a volume licensed version Project Professional 2016 or Project Standard 2016 to users in your organization:
  
1. Purchase Project 2016 as part of a volume licensing agreement.

2. Download your version of Project 2016 from the [Volume Licensing Service Center](https://www.microsoft.com/Licensing/servicecenter/default.aspx).

3. If you want to configure user settings for when Project is installed, you can use the [Office Customization Tool (OCT)](oct/oct-2016-help-overview.md).

4. Deploy Project 2016 to your users. For example, you can send your users a script to run that installs Project from a network share on your local network.

If you already use other tools to deploy software to your users, such as Microsoft Configuration Manager, you can use the Office Customization Tool (OCT) along with those tools to deploy Project.
  
> [!NOTE]
> The Office Customization Tool (OCT) is only available for versions of Project 2016 that are purchased as part of a volume licensing agreement. The OCT can't be used for retail versions of Project 2016, such as versions bought at a retail store or online.
  
## Configure user settings for Project by using Group Policy

If you want to specify and maintain certain user settings for your Project installations, you can [download the Group Policy Administrative Template files (ADMX/ADML) for Office](https://www.microsoft.com/download/details.aspx?id=49030) and use them to configure Group Policy settings. Group Policy can be used only with devices joined to a domain.
  
The same Group Policy settings work for Project Online Desktop Client, and volume licensed versions of Project, such as Project Professional 2021 or Project Standard 2019.
  
## End user resources for Project

To help your users get started with Project, here are some resources to share with them:

- [What's new in Project 2019](https://support.microsoft.com/topic/6be41c8a-c4b2-409a-9ef7-d250377ad3b7)
- [Project help & learning](https://support.microsoft.com/project)
- [Get started with Project](https://support.microsoft.com/topic/ed95837e-5675-4f6b-ad2e-7f1fd8524eac#ID0EAABAAA=Project_Desktop&ID0EBBD=Project_Desktop)  

## Related articles

- [Documentation](/project) to help you plan, deploy, and manage Project Server and Project Online
- [Plans and pricing information](https://www.microsoft.com/microsoft-365/project/compare-microsoft-project-management-software)