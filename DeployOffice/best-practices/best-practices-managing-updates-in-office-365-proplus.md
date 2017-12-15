---
title: "Best practices Managing updates in Office 365 ProPlus"
ms.author: jwhit
author: jwhit-MSFT
manager: laurawi
ms.date: 9/14/2017
ms.audience: ITPro
ms.topic: concetpual
ms.service: o365-administration
localization_priority: Normal
ms.collection: Ent_O365
ms.custom:
- Strat_O365_ProPlus
- Ent_Office_ProPlus
ms.assetid: 7c80254b-cc14-441c-8500-333d32c71949
description: "The Best Practices Guide includes deployment recommendations and real-world examples from the Office 365 Product Group and delivery experts from Microsoft Services. For a list of all the articles, see Best practices."
---

# Best practices: Managing updates in Office 365 ProPlus

 *The Best Practices Guide includes deployment recommendations and real-world examples from the Office 365 Product Group and delivery experts from Microsoft Services. For a list of all the articles, see [Best practices](best-practices.md).* 
  
Because Office 365 ProPlus is an evergreen product, it is important to consider ongoing management after Office 365 ProPlus is deployed. This article provides a high level overview of the components that are involved with Office 365 ProPlus management.
  
## IT managed and unmanaged deployment scenarios

In general, the Office 365 ProPlus deployment solution includes functionality to deploy, maintain, and update clients from both an on premise infrastructure and off premise Office Content Delivery Network (CDN) infrastructure. The on premise and off premise deployment infrastructures give IT administrators flexibility to manage the initial deployment and maintenance of the Office client for different connectivity and end user segments of the environment.
  
For more information on deployment scenarios and channel management, see [Best practices: Managing channels](best-practices-managing-channels.md).
  
## Patching and update channels with Office 365 ProPlus

With the 2016 release of Office 365 ProPlus, Microsoft introduces the concept of update channels. Update channels give IT admins control over when new features will be rolled out to end users. It allows IT admins more time to validate critical business applications with new features, and lets IT admins manage communications and training needs of their end users . A majority of enterprise customers will use the Semi-Annual Channel for their general end user population; however, IT admins should also use other channels for their pilot and pre-production user groups to create validation, communications, and training processes to ease feature roll outs to their end users.
  
Each device in the customer's environment can be a member of a specified channel, which controls feature adoption and code stability. To balance the speed of adoption, running a stable environment, and preparing for updates and product changes, it is recommended to leverage all channels and segment the customer end user base by purpose and function. By segmenting the work force and having multiple groups, customer's IT admins have more flexibility and control. For detailed information on the Office 365 update channels, see [Best practices: Update channels](best-practices-update-channels.md).
  
The following image shows approximately how new features and non-security updates are propagated from Monthly Channel to Semi-Annual Channel (Targeted) to Semi-Annual Channel.
  
![The three primary Office 365 update channels, showing the relationship between the update channels and the release cadence](../images/16fae804-8d79-43db-8902-2adbbc6e0c9e.png)
  
See also [Best practices: Managing channels](best-practices-managing-channels.md)
  
## Ongoing Office 365 ProPlus management and maintenance

In addition to checking for new Office 365 ProPlus build releases, you should periodically check for newer builds of the 2016 Office Deployment Tool and Office 2016 Administrative Template files. New releases of these items can include new features or capabilities to help IT admins manage Office 365 ProPlus deployments. It is recommended that you have a process in place to make sure that the Office Deployment Tool and Office 2016 Administrative Template files that are being used are the latest available versions from Microsoft.
  

