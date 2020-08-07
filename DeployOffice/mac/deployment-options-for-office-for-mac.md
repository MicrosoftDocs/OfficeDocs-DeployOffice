---
title: "Deployment options for admins for Office for Mac"
ms.author: danbrown
author: DHB-MSFT
manager: laurawi
audience: ITPro
ms.topic: get-started-article
ms.service: o365-proplus-itpro
localization_priority: Normal
ms.collection: Ent_O365
ms.custom: Ent_Office_Mac
description: "Provides information to admins on how to download and deploy Office for Mac to users in their organization"
---

# Deployment options for admins for Office for Mac

***Applies to:*** *Office for Mac, Office 2019 for Mac, Office 2016 for Mac*

There are two basic ways that you, as an admin, can deploy Office for Mac to users in your organization:
  
- Provide your users with the installer package file, and have them install Office for Mac for themselves
    
- Download the installer package file to your local network, and then use your software distribution tools to deploy Office for Mac to your users
    
If you have an Office 365 (or Microsoft 365) plan, you can provide your users with instructions on [how to download and install](https://support.microsoft.com/office/4414eaaf-0478-48be-9c42-23adc4716658?#InstallSteps=Install_on_a_Mac) Office for Mac for themselves. To install Office for Mac, a user has to be administrator on the Mac or know an administrator account name and password. 
  
But, if you deploy Office for Mac for your users, you have more control over the deployment, including which users get Office  for Mac and when. To plan your deployment, review the following information.
  
## Download Office for Mac to your local network

The easiest way to download Office for Mac, and ensure you're always getting the most current version and build, is to download directly from the Office Content Delivery Network (CDN) on the internet.  Here are the links to the installer packages for the Office suite, which contains all the applications:
- [Office for Mac](https://go.microsoft.com/fwlink/p/?linkid=525133) (for Office 365 or Microsoft 365 plans)
- [Office 2019 for Mac](https://go.microsoft.com/fwlink/p/?linkid=525133) (for retail or volume licensed versions)
- [Office 2016 for Mac](https://go.microsoft.com/fwlink/p/?linkid=871743) (for retail or volume licensed versions)

> [!IMPORTANT]
> Support for Office 2016 for Mac ends on October 13, 2020. For more information, see [End of support for Office 2016 for Mac](https://support.microsoft.com/office/e944a907-bbc8-4be5-918d-a514068d0056).

Here is some additional information about installer packages:

- Installer and update packages for individual applications are also available on the Office CDN. For links to those, see [Most current packages for Office for Mac](https://docs.microsoft.com/officeupdates/update-history-office-for-mac#most-current-packages-for-office-for-mac).
- The same installer package is used for Office for Mac and Office 2019 for Mac. How you activate the product determines whether you get the features for Office for Mac or the features for Office 2019 for Mac.
- Unlike Office 2016 for Mac, the installer package for Office 2019 for Mac isn't available on the Volume Licensing Service Center (VLSC).
  
## Deploy Office for Mac to users in your organization

Office for Mac uses the Apple Installer technology for installation. That means you can use the software distribution tools that you normally use to deploy software to Mac users. Some of the most common tools are [Jamf Pro](https://www.jamfsoftware.com/products/casper-suite/), [Munki](https://www.munki.org/), and [AutoPkg](https://github.com/autopkg/autopkg). You can also use [Apple Remote Desktop](https://www.apple.com/remotedesktop/) and [AppleScript](https://developer.apple.com/library/mac/documentation/AppleScript/Conceptual/AppleScriptX/AppleScriptX.html).
  
> [!IMPORTANT]
> There are changes in Office for Mac to improve security, including implementing Apple app sandboxing guidelines. These changes mean that you can't customize the app bundle before or after you deploy Office. Don't add, change, or remove files in an app bundle. For example, even if you don't need the French language resource files for Excel, don't delete them. This change prevents Excel from starting. Even though you can't customize app bundles, you can [configure preferences](deploy-preferences-for-office-for-mac.md) for each app. 
  
## Additional deployment information for Office for Mac

Whichever deployment method you decide to use, the following information can help you plan your Office for Mac deployment.
  
- **What's new:** Before you deploy, review the information about [what's new for admins](what-s-new-for-admins-in-office-for-mac.md) in Office for Mac. This topic includes information about system requirements, language support, and new features. 
    
- **Side-by-side installation:** You can't have Office 2016 for Mac and Office 2019 for Mac installed on the same computer. Also, you can't have Office for Mac (from an Office 365 or Microsoft 365 plan) along with either Office 2016 for Mac or Office 2019 for Mac (both of which are one-time purchase versions) installed on the same computer.
    
- **Deploying individual apps:**  Installer package files for individual applications are available on the Office Content Delivery Network (CDN). For links to those files, see [Most current packages for Office for Mac](https://docs.microsoft.com/officeupdates/update-history-office-for-mac#most-current-packages-for-office-for-mac).
    
- **Activation:** To use Office for Mac, it needs to be activated. Before you deploy, review the information about [how activation works](overview-of-activation-for-office-for-mac.md) in Office for Mac. 

- **Uninstalling:** If you need to uninstall Office for Mac, you can [follow these steps to completely remove](https://support.microsoft.com/office/ec3aa66e-6a76-451f-9d35-cba2e14e94c0) Office for Mac. Unfortunately, there is no program to uninstall Office for Mac automatically.

- **Upgrading to Office 2019 for Mac:** If you're a volume licensed customer, you can upgrade to Office 2019 for Mac without uninstalling Office 2016 for Mac. First, you need to download the 2019 version of the [Volume License (VL) Serializer](volume-license-serializer.md) from the [Volume Licensing Service Center (VLSC)](https://www.microsoft.com/licensing/servicecenter/default.aspx). Second, [download](https://go.microsoft.com/fwlink/p/?linkid=525133) the latest version of Office 2019 for Mac. Then, deploy both the Volume License (VL) Serializer and Office 2019 for Mac to each device running Office 2016 for Mac. There is no need to remove Office 2016 for Mac first. If you need to go back to Office 2016 for Mac after you've upgraded, [follow these steps](https://support.microsoft.com/office/d987c6c5-f077-45cc-8c13-08f0d2c69c65). 

- **Version numbers** Version numbers of 16.17 or higher for retail or volume licensed installs indicate you have Office 2019 for Mac. Office 2016 for Mac has version numbers of 16.16 or lower. Since the "major" version (16) hasn't changed between Office 2016 for Mac and Office 2019 for Mac, application settings, including policies, preferences, and preference domains are similar between the two versions. Also, add-ins and other extensibility solutions that are compatible with Office 2016 for Mac will most likely be compatible with Office 2019 for Mac or will require minimal testing.

- **Office for Mac 2011:** Support for Office for Mac 2011 ended on October 10, 2017. All of your Office for Mac 2011 apps will continue to function. But, you could expose yourself to serious and potentially harmful security risks. To completely remove Office for Mac 2011, [follow these steps](https://support.microsoft.com/office/ba8d8d13-0015-4eea-b60b-7719c2cedd17). 

## Related articles

- [Deploy updates for Office for Mac](deploy-updates-for-office-for-mac.md)
- [Deploy preferences for Office for Mac](deploy-preferences-for-office-for-mac.md)
