---
title: "Deploy preferences for Office for Mac"
ms.author: geokri
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: conceptual
ms.service: o365-proplus-itpro
ms.subservice: office-mac
ms.localizationpriority: medium
ms.collection: Tier3
recommendations: true
description: "Provides information for admins on how to deploy standard preference settings for Office for Mac, by configuring .plist files"
ms.date: 03/01/2023
---

# Deploy preferences for Office for Mac

***Applies to:*** *Microsoft 365 for Mac, Office Long Term Service Channel (LTSC) for Mac 2024, LTSC for Mac 2021*

After Office is installed on a Mac, users can configure settings for the apps. These settings are called preferences. As an admin, you might want to provide your users with a standard set of preferences for Office. For example, you can configure whether updates for apps are downloaded and installed automatically.
  
Preferences for Office are stored in preference files. These files are often referred to as .plist files.
  
> [!IMPORTANT]
> To help improve security, Office for Mac has implemented Apple app sandboxing guidelines. This means that you can't customize the app bundle before or after you deploy Office. But, preference files aren't part of the app bundle for an app, so you can make changes to these files.
  
Preference files are stored in the app container, which isn't the same thing as the app bundle. The app container is created the first time an app is run. The app container is located in the user's ~/Library/Containers folder. For example, the app container for Outlook is named com.microsoft.Outlook. Within the app container, the .plist file is located in the Data/Library/Preferences folder. For example, the .plist file for Outlook is named com.microsoft.Outlook.plist.
  
The best way to add or edit preferences is by using the defaults command. For example, if you want to set the first day of the week in Calendar view in Outlook to be Monday, you can open Terminal and enter the following command:
  
```console
defaults write com.microsoft.Outlook CalendarFirstDayOfWeek -int 2
```

For more examples of Outlook preferences, see [Set preferences for Outlook for Mac](preferences-outlook.md).

You can take an existing .plist file and modify it with your organization's preferences. In some cases, you can actually copy that .plist file to other Mac devices in your organization that have Office installed. But that doesn't work for all .plist files. Therefore, the preferred method is to create a script that incorporates all the defaults commands that you want to use to set preferences. Then deploy that script to your users. Because preferences are user-specific, you need to run the script in the user's context. If several users share the same device and each user has a different account, then the script needs to be run for each user of that device.

Most app preferences can be deployed through Configuration Profiles or a Mobile Device Management (MDM) server.
  
Depending on which preferences you're configuring and how you deploy those preferences, the user might need to quit all Office apps and restart the device for the preferences to take effect. Also, remember that the preferences you deploy might overwrite existing preference settings configured by the user.

## Related articles

- [Configuration Profile Reference (Apple developer documentation)](https://developer.apple.com/business/documentation/Configuration-Profile-Reference.pdf)
- [Deployment options for admins for Office for Mac](deployment-options-for-office-for-mac.md)
