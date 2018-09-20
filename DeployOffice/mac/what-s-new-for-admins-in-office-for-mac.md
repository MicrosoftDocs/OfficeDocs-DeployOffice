---
title: "What's new for admins in Office for Mac"
ms.author: danbrown
author: DHB-MSFT
manager: laurawi
ms.date: 9/24/2018
ms.audience: ITPro
ms.topic: overview
ms.service: o365-proplus-itpro
localization_priority: Normal
ms.collection: Ent_O365
ms.custom: Ent_Office_Mac
description: "Describes changes in Office for Mac that are of interest to admins that plan to deploy it to users in their organization"
---

# What's new for admins in Office for Mac

 **Summary**: Describes changes in Office 2016 for Mac that are of interest to admins that plan to deploy it to users in their organization
  
Before you deploy Office 2016 for Mac to users in your organization, you should be aware of some changes introduced in Office 2016 for Mac. These changes might affect how you deploy and manage Office 2016 for Mac in your organization.
  
> [!TIP]
> If you're looking for information to help your users get started with Office 2016 for Mac, they can go to the [What's New page](https://support.office.com/article/95c8d81d-08ba-42c1-914f-bca4603e1426?#platform=mac) or [download quick start guides](https://support.office.com/article/5bccb480-0e5b-4b51-b072-66d3793ccad8) for all the apps. Also, there are training for materials for [Excel](https://support.office.com/article/7d77385f-9b97-41c6-b43e-6b11a4d4520f), [OneNote](https://support.office.com/article/a8dd68eb-3267-48ae-bbb0-4ad037306398), [Outlook](https://support.office.com/article/bdb79e7d-7a7f-4265-b7a5-75bf416e382e), [PowerPoint](https://support.office.com/article/9fe951b1-df67-4fb5-bf87-f1814a73bb99), and [Word](https://support.office.com/article/5913b68c-640a-4db1-8665-82ad0e6895fa). 
  
 **System requirements** There are some new system requirements to install Office 2016 for Mac: 
  
- **Operating system** At least Mac OS X 10.10 
    
- **Memory** 4 GB RAM 
    
- **Hard disk** 6 GB of available disk space 
    
 **App bundles** The app bundle for each app, such as Word, now includes all the resources needed to run the app. There are no longer any shared resources among the apps, like there is in Office for Mac 2011. For example, the app bundles for Excel 2016 for Mac and Word 2016 for Mac both contain the font resources needed by the app. Because of this change, the size of the app bundles is larger. 
  
 **Customizations** There are changes in Office 2016 for Mac to improve security, including implementing Apple app sandboxing guidelines. These changes mean that you can't customize the app bundle before or after you deploy Office. Don't add, change, or remove files in an app bundle. For example, even if you don't need the French language resource files for Excel, don't delete them. This change prevents Excel from starting. But, you can still [configure preferences](deploy-preferences-for-office-for-mac.md) for each app. 
  
 **Languages** All the [supported languages](https://support.office.com/article/26d30382-9fba-45dd-bf55-02ab03e2a7ec?#ID0EAABAAA=Mac) in Office 2016 for Mac are now included as part of the installer package (.pkg) file. There are no longer separate installer package files for each language. This means that admins can't choose which language to deploy to users. Instead, the language is chosen during the installation based on the System Preferences settings. If none of the language settings are supported by Office, Office installs in English. All the languages get installed, which means users can easily [switch to a different language](https://support.office.com/article/f5c54ff9-a6fa-4348-a43c-760e7ef148f8?#ID0EACAAA=Mac) without having to reinstall Office. 
  
 **Updates** The default setting is to check for updates every day. In Office for Mac 2011, the default is weekly. 
  
 **App icons in the dock** When you deploy Office 2016 for Mac, the app icons aren't automatically added to the dock, but are available from Launchpad. You can provide your users with instructions on [how to add app icons to the dock](https://support.office.com/article/95db1c14-45e7-450e-86ad-1134f7e80851). If you deploy to a computer that has Office for Mac 2011 installed, the app icons for Office for Mac 2011 are removed from the dock during the installation of Office 2016 for Mac.
  
 **Feature comparisons** If you want to compare key features of Office 2016 for Mac with those of Office for Mac 2011, review the comparison tables for [Excel](https://support.office.com/article/602a6c30-e6a6-47c5-9e0d-b16af397427a), [Outlook](https://support.office.com/article/f40accc7-de7e-48bd-a536-ba5af0e499b6), [PowerPoint](https://support.office.com/article/6213ffc8-c8bd-4073-acf8-1869180c6ae0), and [Word](https://support.office.com/article/ac41aed9-3d23-48de-8474-31515e29c48c).
  

## Related topics

- [Deployment options for admins for Office for Mac](deployment-options-for-office-for-mac.md)
- [Deploy updates for Office for Mac](deploy-updates-for-office-for-mac.md)

