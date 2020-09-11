---
title: "What's new for admins in Office for Mac"
ms.author: danbrown
author: DHB-MSFT
manager: laurawi
audience: ITPro
ms.topic: overview
ms.service: o365-proplus-itpro
localization_priority: Normal
ms.collection: Ent_O365
ms.custom: Ent_Office_Mac
description: "Describes changes in Office for Mac that are of interest to admins that plan to deploy it to users in their organization"
---

# What's new for admins in Office for Mac

***Applies to:*** *Office for Mac, Office 2019 for Mac, Office 2016 for Mac*

Before you deploy Office for Mac to users in your organization, you should be aware of some changes introduced in Office for Mac. These changes might affect how you deploy and manage Office for Mac in your organization.
  
 - **System requirements:** There are some new system requirements to install Office for Mac. See [System requirement for Office](https://products.office.com/office-resources) for details.
 
 - **App bundles:** The app bundle for each app, such as Word, now includes all the resources needed to run the app. There are no longer any shared resources among the apps, like there were in Office for Mac 2011. For example, the app bundles for Excel for Mac and Word for Mac both contain the font resources needed by the app. Because of this change, the size of the app bundles is larger. 
  
 - **Customizations:** There are changes in Office for Mac to improve security, including implementing Apple app sandboxing guidelines. These changes mean that you can't customize the app bundle before or after you deploy Office. Don't add, change, or remove files in an app bundle. For example, even if you don't need the French language resource files for Excel, don't delete them. This change prevents Excel from starting. But, you can still [configure preferences](deploy-preferences-for-office-for-mac.md) for each app. 
  
 - **Languages:** All the [supported languages](https://support.microsoft.com/office/26d30382-9fba-45dd-bf55-02ab03e2a7ec#ID0EAABAAA=Mac&ID0EAACAAA=Mac) in Office for Mac are now included as part of the installer package (.pkg) file. There are no longer separate installer package files for each language. This change means that admins can't choose which language to deploy to users. Instead, the language is chosen during the installation based on the System Preferences settings. If none of the language settings are supported by Office, Office installs in English. All the languages get installed, which means users can easily [switch to a different language](https://support.microsoft.com/office/f5c54ff9-a6fa-4348-a43c-760e7ef148f8#ID0EACAAA=MacOS&ID0EAACAAA=MacOS) without having to reinstall Office. 
  
 - **Updates:** The default setting is to check for updates every day. In Office for Mac 2011, the default was weekly.

 - **64 bit:** All releases of Office for Mac after August 22, 2016 are 64-bit only. For more information, see [Office for Mac upgrade to 64-bit](office-2016-for-mac-upgrade-to-64-bit.md).
  
 - **App icons in the dock:** When you deploy Office for Mac, the app icons aren't automatically added to the dock, but are available from Launchpad. You can provide your users with instructions on [how to add app icons to the dock](https://support.microsoft.com/office/95db1c14-45e7-450e-86ad-1134f7e80851). If you deploy to a computer that has Office for Mac 2011 installed, the app icons for Office for Mac 2011 are removed from the dock during the installation of Office for Mac.

  > [!NOTE]
  > Support for Office for Mac 2011 ended on October 10, 2017. All of your Office for Mac 2011 apps will continue to function. But, you could expose yourself to serious and potentially harmful security risks. 
  
 - **Feature information:** For information about features in the various versions of Office for Mac, review the following resources:

  - **Office for Mac:** To see the latest features in each monthly release, see [What's new in Microsoft 365](https://support.microsoft.com/office/95c8d81d-08ba-42c1-914f-bca4603e1426?#platform=mac). 

  - **Office 2019 for Mac:** For information about the new features in Office 2019 for Mac, see the “what’s new” articles for [Excel](https://support.microsoft.com/office/5ce129d3-9e5c-417f-9545-fb6f7b72674d), [Outlook](https://support.microsoft.com/office/05736033-f99e-4cb2-88aa-01e979b0736b), [PowerPoint](https://support.microsoft.com/office/5038ba79-48c5-40f0-adff-11489e5d6fed), and [Word](https://support.microsoft.com/office/247e0cd4-a758-4b42-a157-42eb8853aef5).

  - **Office 2016 for Mac:** If you want to compare key features of Office 2016 for Mac with the features of Office for Mac 2011, review the comparison tables for [Outlook](https://support.microsoft.com/office/f40accc7-de7e-48bd-a536-ba5af0e499b6), [PowerPoint](https://support.microsoft.com/office/6213ffc8-c8bd-4073-acf8-1869180c6ae0), and [Word](https://support.microsoft.com/office/ac41aed9-3d23-48de-8474-31515e29c48c).
  
> [!IMPORTANT]
> Support for Office 2016 for Mac ends on October 13, 2020. For more information, see [End of support for Office 2016 for Mac](https://support.microsoft.com/office/e944a907-bbc8-4be5-918d-a514068d0056).
  
If you're looking for information to help your users get started with Office for Mac, review the resources on the [Microsoft 365 Training](https://support.microsoft.com/training).

## Related articles

- [Deployment options for admins for Office for Mac](deployment-options-for-office-for-mac.md)
- [Deploy updates for Office for Mac](deploy-updates-for-office-for-mac.md)

