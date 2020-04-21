---
title: "Deploy updates for Office for Mac"
ms.author: danbrown
author: DHB-MSFT
manager: laurawi
audience: ITPro
ms.topic: get-started-article
ms.service: o365-proplus-itpro
localization_priority: Normal
ms.collection: Ent_O365
ms.custom: Ent_Office_Mac
description: "Provides admins with information about how to install updates for Office for Mac by using Microsoft AutoUpdate"
---

# Deploy updates for Office for Mac

***Applies to:*** *Office for Mac, Office 2019 for Mac, Office 2016 for Mac*

Microsoft regularly publishes software updates to improve performance or security, and for Office 365 (and Microsoft 365) users, to update features.
  
As an admin, you can choose how to download and install updates for Office for Mac for your organization. You can do either of the following:
  
- Configure Office for Mac to download updates automatically to users' computers, and then have the users install the updates themselves.
    
- Manually download updates to your local network, and then use your software distribution tools to deploy updates to the Macs in your organization.
    
To update Office for Mac, a program named Microsoft AutoUpdate (MAU) is used. By default, Microsoft AutoUpdate automatically checks for updates daily, but you can change that to weekly, monthly, or manually. 
  
If you decide to deploy updates by using your software distribution tools, you should configure Microsoft AutoUpdate to manually check for software updates. You can [deploy preferences](deploy-preferences-for-office-for-mac.md) to configure how and when Microsoft AutoUpdate checks for updates for the Macs in your organization. 
  
Individual security updates or other updates can't be downloaded and installed. Instead, Microsoft provides a new app bundle of an app, such as Word, that includes all the updates. As an admin, this means that you can't pick and choose which updates to install for a particular app, such as Excel. But, if you're doing manual deployments of updates, you can choose which apps you want to update. For example, you might decide to deploy the updates for Word and PowerPoint now, but wait to update Excel until you've had the chance to test that the updated version of Excel works with your line-of-business applications. 
  
Updates work the same for Office for Mac whether you have an Office 365 (or Microsoft 365) plan or you have a retail or volume licensed version.
  
## Related topics

- [Update Office for Mac by using msupdate](update-office-for-mac-using-msupdate.md)
- [Update history](https://docs.microsoft.com/officeupdates/update-history-office-for-mac) and [release notes](https://docs.microsoft.com/officeupdates/release-notes-office-for-mac) for Office for Mac
- [Deployment options for admins for Office for Mac](deployment-options-for-office-for-mac.md)

