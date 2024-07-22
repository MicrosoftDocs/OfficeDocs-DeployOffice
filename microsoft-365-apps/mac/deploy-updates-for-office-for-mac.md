---
title: "Deploy updates for Office for Mac"
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
description: "Provides admins with information about how to install updates for Office for Mac by using Microsoft AutoUpdate"
ms.date: 03/01/2023
---

# Deploy updates for Office for Mac

***Applies to:*** *Office for Mac, Office LTSC for Mac 2021, Office 2019 for Mac*

Microsoft regularly publishes software updates to improve performance or security, and for Microsoft 365 (and Office 365) users, to update features.
  
As an admin, you can choose how to download and install updates for Office on Mac devices in your organization. You can do either of the following steps:
  
- Configure Office for Mac to download updates automatically to users' devices, and then have the users install the updates themselves.

- Manually download updates to your local network, and then use your software distribution tools to deploy the updates.

To update Office on a Mac, a program named Microsoft AutoUpdate (MAU) is used. By default, Microsoft AutoUpdate automatically checks for updates every 12 hours. If you want more control over MAU, you can use [preferences](deploy-preferences-for-office-for-mac.md). For example, you can [set a deadline](mau-deadline.md) for when updates are required to be installed.

If you decide to deploy updates by using your software distribution tools, you should configure Microsoft AutoUpdate to manually check for software updates. For example, you can open Terminal and enter the following command:
  
```console
defaults write com.microsoft.autoupdate2 HowToCheck -string 'Manual'
```
  
Individual security updates or other updates can't be downloaded and installed. Instead, Microsoft provides a new app bundle of an app, such as Word, that includes all the updates. You can choose which apps you want to update. For example, you might decide to deploy the updates for Word and PowerPoint now, but wait to update Excel until you've had the chance to test that the updated version of Excel works with your line-of-business applications.
  
Updates work the same for Office on a Mac whether you have a Microsoft 365 (or Office 365) plan or you have a retail or volume licensed version.
  
## Related articles

- [Update Office for Mac by using msupdate](update-office-for-mac-using-msupdate.md)
- [Update history](/officeupdates/update-history-office-for-mac) and [release notes](/officeupdates/release-notes-office-for-mac) for Office for Mac
- [Deployment options for admins for Office for Mac](deployment-options-for-office-for-mac.md)