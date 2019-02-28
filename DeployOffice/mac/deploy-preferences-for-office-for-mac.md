---
title: "Deploy preferences for Office for Mac"
ms.author: danbrown
author: DHB-MSFT
manager: laurawi
ms.audience: ITPro
ms.topic: get-started-article
ms.service: o365-proplus-itpro
localization_priority: Normal
ms.collection: Ent_O365
ms.custom: Ent_Office_Mac
description: "Provides information for admins on how to deploy standard preference settings for Office for Mac, by configuring .plist files"
---

# Deploy preferences for Office for Mac

***Applies to:*** *Office for Mac, Office 2019 for Mac, Office 2016 for Mac*

 
After Office for Mac is installed, users can configure settings for the apps. These settings are called preferences. As an admin, you might want to provide Office for Mac users in your organization with a standard set of preferences. For example, you can configure how often to check for software updates for Office for Mac - daily, weekly, or monthly.
  
Preferences for Office for Mac are stored in preference files. These files are often referred to as .plist files. 
  
> [!IMPORTANT]
> There are changes in Office for Mac to improve security, including implementing Apple app sandboxing guidelines. These changes mean that you can't customize the app bundle before or after you deploy Office. But, preference files aren't part of the app bundle for an app, so you can make changes to these files. 
  
Preference files are stored in the app container, which isn't the same thing as the app bundle. The app container is created the first time an app is run. The app container is located in the user's Library\Containers folder. For example, the app container for Excel is named com.microsoft.Excel. Within the app container, the .plist file is located in the Data\Library\Preferences folder. For example, the .plist file for Excel is named com.microsoft.Excel.plist.
  
The best way to add or edit preferences is by using the defaults command. For example, if you want to configure updates to be checked manually, you can open Terminal and enter the following command: 
  
```
defaults write com.microsoft.autoupdate2 HowToCheck Manual
```

You can take an existing .plist file and modify it with your organization's preferences. In some cases, you can actually copy that .plist file to other computers in your organization that have Office for Mac installed. But that doesn't work in the case of all .plist files. Therefore, the preferred method is to create a script that incorporates all the defaults commands that you want to use to set preferences. Then deploy that script to your users. The script needs to be run in the user's context, because preferences are user specific. That also means that if several users share the same computer and each has a different login account, then the script needs to be run for each user of that computer.
  
Depending on which preferences you're configuring and how you deploy those preferences, the user might need to quit all Office apps and restart the computer for the preferences to take effect. Also, remember that the preferences you deploy might overwrite existing preference settings configured by the user.
  
> [!NOTE]
> Office for Mac 2011, which is no longer supported, also used preference files. There are some preferences in common between Office for Mac and Office for Mac 2011. Therefore, if you install Office for Mac on a computer that has Office for Mac 2011 installed, Office for Mac will automatically inherit some preference settings from the Office for Mac 2011 installation. 
  
## Related topics

- [Deployment options for admins for Office for Mac](deployment-options-for-office-for-mac.md)

