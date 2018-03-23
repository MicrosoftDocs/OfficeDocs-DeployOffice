---
title: "Deployment options for admins for Office 2016 for Mac"
ms.author: danbrown
author: DHB-MSFT
manager: laurawi
ms.date: 12/20/2016
ms.audience: ITPro
ms.topic: get-started-article
ms.service: o365-proplus-itpro
localization_priority: Normal
ms.collection: 
- Ent_O365
- Strat_O365_ProPlus
ms.custom:
- Strat_O365_ProPlus
- Ent_Office_Mac
ms.assetid: 18270b63-728d-4419-9032-b3846902d061
description: "Provides information to admins on how to download and deploy Office 2016 for Mac to users in their organization"
---

# Deployment options for admins for Office 2016 for Mac

 **Summary**: Provides information to admins on how to download and deploy Office 2016 for Mac to users in their organization
  
There are two basic ways that you, as an admin, can deploy Office 2016 for Mac to users in your organization:
  
- Provide your users with the installer package file, and have them install Office 2016 for Mac for themselves
    
- Download the installer package file to your local network, and then use your software distribution tools to deploy Office 2016 for Mac to your users
    
If you have an Office 365 plan, you can provide your users with instructions on [how to download and install](https://support.office.com/article/4414eaaf-0478-48be-9c42-23adc4716658?#InstallSteps=Install_on_a_Mac) Office 2016 for Mac for themselves. To install Office 2016 for Mac, a user has to be administrator on the Mac or know an administrator account name and password. 
  
However, if you deploy Office 2016 for Mac for your users, you have more control over the deployment, including which users get Office 2016 for Mac and when. To plan your deployment, review the following information.
  
## Download Office 2016 for Mac to your local network

Where you download Office 2016 for Mac from depends on whether your organization has an Office 365 plan or has a volume license agreement.
  
If you're an Office 365 customer whose plan includes Office, do the following:
  
1. Sign in to the Office 365 portal as an Office 365 administrator.
    
2. Go to the [Office 365 admin center](https://support.office.com/Article/58537702-d421-4d02-8141-e128e3703547), and then choose **Service Settings** > **User software**.
    
3. Under **Software for Mac**, expand **Office for Mac**, and then choose **Download** to begin downloading the installer package file. The installer package file is named Microsoft_Office_2016_Installer.pkg. 
    
If your organization has a volume license agreement instead of an Office 365 plan, you can sign in and download Office 2016 for Mac from the [Volume Licensing Service Center (VLSC)](https://www.microsoft.com/Licensing/servicecenter/default.aspx). The download is an .iso file. Once you extract the .iso file, or burn it to a DVD, you can copy the installer package file to your local network.
  
## Deploy Office 2016 for Mac to users in your organization

Office 2016 for Mac uses the Apple Installer technology for installation. That means you can use the software distribution tools that you normally use to deploy software to Mac users. Some of the most common tools are [Jamf Pro](https://www.jamfsoftware.com/products/casper-suite/), [Munki](https://www.munki.org/), and [AutoPkg](https://autopkg.github.io/autopkg/). You can also use [Apple Remote Desktop](https://www.apple.com/remotedesktop/) and [AppleScript](https://developer.apple.com/library/mac/documentation/AppleScript/Conceptual/AppleScriptX/AppleScriptX.html).
  
> [!IMPORTANT]
> There are changes in Office 2016 for Mac to improve security, including implementing Apple app sandboxing guidelines. These changes mean that you can't customize the app bundle before or after you deploy Office. Don't add, change, or remove files in an app bundle. For example, even if you don't need the French language resource files for Excel, don't delete them. This change prevents Excel from starting. > > Even though you can't customize app bundles, you can [configure preferences](deploy-preferences-for-office-for-mac.md) for each app. 
  
## Additional deployment information for Office 2016 for Mac

Whichever deployment method you decide to use, the following information can help you plan your Office 2016 for Mac deployment.
  
- **What's new** Before you deploy, review the information about [what's new for admins](what-s-new-for-admins-in-office-for-mac.md) in Office 2016 for Mac. This includes such information as new system requirements, language support, and app icons in the dock. 
    
- **Side-by-side installation** You don't have to uninstall Office for Mac 2011 before you install Office 2016 for Mac. After you install Office 2016 for Mac, both versions are available to use. If you want only Office 2016 for Mac installed or need to free up disk space before installing, [follow these steps to uninstall](https://support.office.com/article/ba8d8d13-0015-4eea-b60b-7719c2cedd17) Office 2016 for Mac. 
    
- **Deploying individual apps** If you use the installer package file from Office 365 to deploy Office 2016 for Mac, all the apps are installed - Excel, OneNote, Outlook, PowerPoint, and Word. You can't choose which apps to install. Individual installer package files are available only from the [Volume Licensing Service Center (VLSC)](https://www.microsoft.com/Licensing/servicecenter/default.aspx) with a volume license agreement. 
    
- **Activation** To use Office 2016 for Mac, it needs to be activated. Before you deploy, review the information about [how activation works](overview-of-activation-for-office-for-mac.md) in Office 2016 for Mac. 
    
- **Uninstalling** If you need to uninstall Office 2016 for Mac, you can [follow these steps to completely remove](https://support.office.com/article/ec3aa66e-6a76-451f-9d35-cba2e14e94c0) Office 2016 for Mac. Unfortunately, there is no program to uninstall Office 2016 for Mac automatically. 
    
## See also
[Deployment guide for Office 2016 for Mac](deployment-guide-for-office-for-mac.md)
  
[Deployment options for admins for Office 2016 for Mac](deployment-options-for-office-for-mac.md)
  
[Deploy updates for Office 2016 for Mac](deploy-updates-for-office-for-mac.md)

