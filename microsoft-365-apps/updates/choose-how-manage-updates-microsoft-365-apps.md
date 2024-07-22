---
title: "Choose how to manage updates to Microsoft 365 Apps"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
udience: ITPro
ms.topic: conceptual
ms.service: o365-proplus-itpro
ms.collection: Tier1
ms.localizationpriority: medium
audience: ITPro
recommendations: false
description: "Compares different ways to update Microsoft 365 Apps, including automatically from the internet or from an on-premises location."
ms.date: 03/01/2023
---

# Choose how to manage updates to Microsoft 365 Apps
  
There are four ways that admins typically apply updates for Microsoft 365 Apps:

- Automatically from the internet

- Using Microsoft Configuration Manager

- Automatically from an on-premises location

- By installing an updated version of Microsoft 365 Apps
    
Which way is right for your organization depends on how much administrative effort you want to expend and how much control that you want to have over the update process.

In most cases, you use the Office Deployment Tool or Group Policy to [configure the appropriate update settings](configure-update-settings-microsoft-365-apps.md).
  
> [!IMPORTANT]
> Because individual updates aren't available for Microsoft 365 Apps, you can't use Windows Update or Windows Server Update Services (WSUS) to download and apply individual updates to Microsoft 365 Apps. 

## Apply updates automatically from the internet to Microsoft 365 Apps
<a name="Internet"> </a>

This is the default setting for Microsoft 365 Apps. For example, if your users install Microsoft 365 Apps themselves from the Office 365 portal, Microsoft 365 Apps is configured to get updates automatically from the internet. No additional user or administrative configuration is needed.
  
Even if you use the Office Deployment Tool to deploy Microsoft 365 Apps to your users, you can configure updates to be applied automatically from the internet.
  
This option might be a good choice for your organization if you have users who travel or work remotely and don't connect to the corporate network regularly. It's also the choice that requires the least amount of administrative effort. But, this option gives you the least amount of control over the update process.

## Using Microsoft Configuration Manager
<a name="MECM"> </a>

Microsoft Configuration Manager has the ability to manage updates to Microsoft 365 Apps by using the Software Update management workflow. You can use Configuration Manager to update Microsoft 365 Apps for enterprise, Microsoft 365 Apps for business, and the subscription versions of the Project and Visio desktop apps. This gives you full control over the update deployment process, e.g. when which devices will receive a specific update. Refer to [Manage updates to Microsoft 365 Apps with Microsoft Configuration Manager](manage-microsoft-365-apps-updates-configuration-manager.md) for an in-depth description.

## Apply updates automatically from an on-premises location to Microsoft 365 Apps
<a name="OnPremises"> </a>

You can configure Microsoft 365 Apps to get updates automatically from a location on your network, such as a network share. You can configure the update location by using the Office Deployment Tool or Group Policy.
  
This is a good option if you want more control over the version of Microsoft 365 Apps that users have installed. For example, even if the June version of Microsoft 365 Apps is available, you might want your users to continue using the May version. You might want to do this because you want to test to make sure that your line-of-business applications work with the June version.
  
You'll have to use the Office Deployment Tool to [download updated versions of Microsoft 365 Apps from the internet](../deploy/overview-office-deployment-tool.md) to your local network. After it's downloaded, you can place the updated version on a network share that is close to the users.
  
## Apply updates by installing an updated version of Microsoft 365 Apps
<a name="Install"> </a>

Instead of using automatic updates, you can deploy an updated version of Microsoft 365 Apps to your users by using the Office Deployment Tool. This option reinstalls Microsoft 365 Apps. You can use the Office Deployment Tool together with software distribution tools, such as Microsoft Configuration Manager or Microsoft Intune.
  
This option is useful if you want to control which version of Microsoft 365 Apps users have, and you want to control which users get updated and when they get updated. This option provides the most control, but also requires the most administrative effort and has a high impact on user downtime and network load. 
  
If you decide to use this option, you'll disable automatic updates. You can [control that setting](configure-update-settings-microsoft-365-apps.md) by using either the Office Deployment Tool or Group Policy.
  
## Related articles
  
[Overview of the Office Deployment Tool](../deploy/overview-office-deployment-tool.md)
  
[Overview of the update process for Microsoft 365 Apps](overview-update-process-microsoft-365-apps.md)

[Manage updates to Microsoft 365 Apps with Microsoft Configuration Manager](manage-microsoft-365-apps-updates-configuration-manager.md)
  
[Configure update settings for Microsoft 365 Apps](configure-update-settings-microsoft-365-apps.md)
  
[End-user update notifications for Microsoft 365 Apps](end-user-update-notifications-microsoft-365-apps.md)
