---
title: "Overview of the upgrade of Office 365 ProPlus to the Office 2016 version"
ms.author: danbrown
author: DHB-MSFT
manager: laurawi
ms.date: 3/22/2017
ms.audience: ITPro
ms.topic: get-started-article
ms.service: o365-proplus-itpro
localization_priority: Normal
ms.collection: Ent_O365
ms.custom: Ent_Office_ProPlus
ms.assetid: 7655b5cb-89ae-4a08-9621-e5af1b77cfe1
description: "Provides information about the upgrade of Office 365 ProPlus to the Office 2016 version, including criteria for the upgrade and the steps taken during upgrade."
---

# Overview of the upgrade of Office 365 ProPlus to the Office 2016 version

 **Summary:** Provides information about the upgrade of Office 365 ProPlus to the Office 2016 version, including criteria for the upgrade and the steps taken during upgrade.
  
If you deployed the Office 2013 version of Office 365 ProPlus to the users in your organization, then you need to be aware of an upgrade coming from Microsoft. This will upgrade the Office apps, such as Word and Excel, from the Office 2013 version to the Office 2016 version. For information on the schedule for this upgrade, [review these key dates](upgrade-from-office-365-proplus-2013-to-2016.md#BKMK_Key).
  
> [!IMPORTANT]
> Support for the Office 2013 version of Office 365 ProPlus ended on February 28, 2017. For more information, see Microsoft Knowledge Base (KB) article [3199744.](https://support.microsoft.com/kb/3199744)
  
Before the upgrade begins, users see an upgrade notification when they open an Office app, such as Word. The notification appears just under the ribbon. Office is upgraded only if the user chooses **Update Office**.
  
![Update Office notification](images/00a4d1a9-4c89-4534-93ed-affb3f47dde7.png)
  
Not every user will see an upgrade notification. For example, only users that are local administrators on their computer see the upgrade notification. Also, only Office 2013 installations that meet [certain criteria](overview-of-the-upgrade-of-office-365-proplus-to-the-office-2016-version.md#BKMK_Criteria) receive an upgrade notification.
  
The first check is to see how Office is configured to get updates. As shown in the following table, only Office installations that are configured to get updates automatically from the Office Content Delivery Network (CDN) on the Internet are considered for this upgrade.
  
|**Update configuration**|**Considered for upgrade**|
|:-----|:-----|
|Automatically from the Office Content Delivery Network (CDN) on the Internet  <br/> |Yes  <br/> |
|Automatically from a location other than the CDN, such as an internal network share  <br/> |No  <br/> |
|Automatic updates disabled  <br/> |No  <br/> |
   
You can look in the registry of the computer to [determine if Office is configured to get updates from the CDN](configure-updates-of-office-365-proplus-to-prepare-for-the-upgrade-to-the-office.md#BKMK_DetermineCDN).
  
> [!NOTE]
> This information also applies to Visio Pro for Office 365 and Project Online Desktop Client. It also applies to Office 365 Business, which is the version of Office that comes with some Office 365 plans, such as Business Premium. 
  
<a name="BKMK_Criteria"> </a>

## Criteria used to determine if Office can be upgraded successfully

Before upgrading to the Office 2016 version, Microsoft checks to see if Office can be upgraded successfully. It determines this by looking at the following criteria:
  
- Office is configured to get updates automatically from the CDN.
    
- Office has installed the most recent update.
    
- There is at least 3 GB of disk space available.
    
- Office isn't configured to use shared computer activation.
    
- If Project or Visio is installed on the computer, they are the subscription versions.
    
- If Project or Visio is installed on the computer, they are using the same language configuration as Office.
    
- Outlook can't be connected to Exchange Server 2007.
    
- Exchange Server that Outlook uses is configured to support Autodiscover.
    
- Business Contact Manager isn't installed on the computer.
    
If any of these criteria aren't met, then Microsoft won't attempt to upgrade Office.
  
Also, there is a check to see if the user is a local administrator on the computer. If the user isn't a local administrator, then the user won't see the upgrade notification when an Office app is opened. That's because a user must be a local administrator on the computer to install or upgrade Office.
  

<a name="BKMK_Steps"> </a>

## Steps performed during the upgrade to Office 2016

If it's determined that the Office installation is a suitable candidate to be upgraded, the following steps occur:
  
1. The files needed to upgrade to Office 2016 are downloaded in the background to the computer. The user can continue to use Office while the download occurs. Be aware that there are [network bandwidth implications](plan-your-upgrade-from-office-365-proplus-2013-to-2016.md#BKMK_Bandwidth) of each user downloading the files needed to upgrade Office.
    
2. The next time a user who is a local administrator on the computer opens an Office app, such as Word, the user sees a message below the ribbon letting them know that an upgrade is available. 
    
     ![Update Office notification](images/00a4d1a9-4c89-4534-93ed-affb3f47dde7.png)
  
3. If the user chooses to upgrade, the necessary steps are performed to remove Office 2013 and install Office 2016. No additional downloading is needed for this step.
    
    If there is a subscription version of Project or Visio installed on the computer, those also get upgraded to the 2016 version.
    
If the user chooses to ignore or close the **Get the new Office** message, the message reappears again the next time the user opens an Office app.
  
<a name="BKMK_Timing"> </a>

## Timing of the upgrade notifications


Not all Office installations that meet the criteria to be upgraded get the upgrade notification at the same time. Microsoft initially sends the notification to a small percentage of Office installations. Then, over time, Microsoft increases the number of notifications that it sends out. This means that it's likely that users in your organization will get upgrade notifications at different times, even possibly a week or more apart.
  
Once Microsoft starts sending out upgrade notifications, users can upgrade Office before receiving a notification. They can start the upgrade by going to **File** > **Account** > **Update Options** in any Office app, and then choosing **Update Now**. If the Office installation meets all the [criteria](overview-of-the-upgrade-of-office-365-proplus-to-the-office-2016-version.md#BKMK_Criteria), the upgrade starts. Remember that users have to be local administrators on their computers to install or upgrade Office.
  
## Related topics
[Plan your upgrade from Office 365 ProPlus 2013 to 2016](plan-your-upgrade-from-office-365-proplus-2013-to-2016.md)
  
[Upgrade from Office 365 ProPlus 2013 to 2016](upgrade-from-office-365-proplus-2013-to-2016.md)

