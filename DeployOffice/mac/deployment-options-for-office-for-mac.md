---
title: "Deployment options for admins for Office for Mac"
ms.author: danbrown
author: DHB-MSFT
manager: laurawi
ms.date: 9/24/2018
ms.audience: ITPro
ms.topic: get-started-article
ms.service: o365-proplus-itpro
localization_priority: Normal
ms.collection: 
- Ent_O365
- Strat_O365_ProPlus
ms.custom: Ent_Office_Mac
description: "Provides information to admins on how to download and deploy Office for Mac to users in their organization"
---

# Deployment options for admins for Office for Mac

***Applies to:*** *Office for Mac, Office 2019 for Mac, Office 2016 for Mac*

There are two basic ways that you, as an admin, can deploy Office for Mac to users in your organization:
  
- Provide your users with the installer package file, and have them install Office for Mac for themselves
    
- Download the installer package file to your local network, and then use your software distribution tools to deploy Office for Mac to your users
    
If you have an Office 365 plan, you can provide your users with instructions on [how to download and install](https://support.office.com/article/4414eaaf-0478-48be-9c42-23adc4716658?#InstallSteps=Install_on_a_Mac) Office for Mac for themselves. To install Office for Mac, a user has to be administrator on the Mac or know an administrator account name and password. 
  
But, if you deploy Office for Mac for your users, you have more control over the deployment, including which users get Office  for Mac and when. To plan your deployment, review the following information.
  
## Download Office for Mac to your local network

Where you download Office 2016 for Mac from depends on whether your organization has an Office 365 plan or has a volume license agreement.
  
If you're an Office 365 customer whose plan includes Office, do the following:
  
1. Sign in to the Office 365 portal as an Office 365 administrator.
    
2. Go to the [Office 365 admin center](https://support.office.com/Article/58537702-d421-4d02-8141-e128e3703547), and then choose **Service Settings** > **User software**.
    
3. Under **Software for Mac**, expand **Office for Mac**, and then choose **Download** to begin downloading the installer package file. The installer package file is named Microsoft_Office_2016_Installer.pkg. 
    
If your organization has a volume license agreement instead of an Office 365 plan, you can sign in and download Office 2016 for Mac from the [Volume Licensing Service Center (VLSC)](https://www.microsoft.com/Licensing/servicecenter/default.aspx). The download is an .iso file. Once you extract the .iso file, or burn it to a DVD, you can copy the installer package file to your local network.
  
## Deploy Office for Mac to users in your organization

Office for Mac uses the Apple Installer technology for installation. That means you can use the software distribution tools that you normally use to deploy software to Mac users. Some of the most common tools are [Jamf Pro](https://www.jamfsoftware.com/products/casper-suite/), [Munki](https://www.munki.org/), and [AutoPkg](https://autopkg.github.io/autopkg/). You can also use [Apple Remote Desktop](https://www.apple.com/remotedesktop/) and [AppleScript](https://developer.apple.com/library/mac/documentation/AppleScript/Conceptual/AppleScriptX/AppleScriptX.html).
  
> [!IMPORTANT]
> There are changes in Office for Mac to improve security, including implementing Apple app sandboxing guidelines. These changes mean that you can't customize the app bundle before or after you deploy Office. Don't add, change, or remove files in an app bundle. For example, even if you don't need the French language resource files for Excel, don't delete them. This change prevents Excel from starting. Even though you can't customize app bundles, you can [configure preferences](deploy-preferences-for-office-for-mac.md) for each app. 
  
## Additional deployment information for Office for Mac

Whichever deployment method you decide to use, the following information can help you plan your Office for Mac deployment.
  
- **What's new** Before you deploy, review the information about [what's new for admins](what-s-new-for-admins-in-office-for-mac.md) in Office for Mac. This includes information about system requirements, language support, and new features. 
    
- **Side-by-side installation** You can't have Office 2016 for Mac and Office 2019 for Mac installed on the same computer. Also, you can't have Office for Mac (from an Office 365 plan) along with either Office 2016 for Mac or Office 2019 for Mac (both of which are one-time purchase versions) installed on the same computer.
    
- **Deploying individual apps**  Installer package files for individual applications are available on the Office Content Delivery Network (CDN). For links to these, see [Most current packages for Office for Mac](https://docs.microsoft.com/officeupdates/update-history-office-for-mac#most-current-packages-for-office-for-mac).
    
- **Activation** To use Office for Mac, it needs to be activated. Before you deploy, review the information about [how activation works](overview-of-activation-for-office-for-mac.md) in Office for Mac. 
    
- **Uninstalling** If you need to uninstall Office for Mac, you can [follow these steps to completely remove](https://support.office.com/article/ec3aa66e-6a76-451f-9d35-cba2e14e94c0) Office for Mac. Unfortunately, there is no program to uninstall Office for Mac automatically. 

- **Office for Mac 2011** Support for Office for Mac 2011 ended on October 10, 2017. All of your Office for Mac 2011 apps will continue to function. But, you could expose yourself to serious and potentially harmful security risks. To completely remove Office for Mac 2011, [follow these steps](https://support.office.com/article/ba8d8d13-0015-4eea-b60b-7719c2cedd17). 

- **Upgrading to Office 2019 for Mac** If you're a volume licensed customer, you can upgrade to Office 2019 for Mac without uninstalling Office 2016 for Mac. You just need to download the Volume License (VL) Serializer from the [Volume Licensing Service Center (VLSC)](https://www.microsoft.com/licensing/servicecenter/default.aspx) and deploy it to each computer running Office 2016 for Mac. If you need to go back to Office 2016 for Mac after you've upgraded, [follow these steps](https://support.offic.com/article/d987c6c5-f077-45cc-8c13-08f0d2c69c65).
    
## Related topics

- [Deployment options for admins for Office for Mac](deployment-options-for-office-for-mac.md)
- [Deploy updates for Office for Mac](deploy-updates-for-office-for-mac.md)

