---
title: "Overview of activation for Office for Mac"
ms.author: danbrown
author: DHB-MSFT
manager: laurawi
ms.audience: ITPro
ms.topic: get-started-article
ms.service: o365-proplus-itpro
localization_priority: Normal
ms.collection: Ent_O365
ms.custom: Ent_Office_Mac
description: "Describes for admins how activation works for Office for Mac, for both Office 365 plans and volume license agreements"
---

# Overview of activation for Office for Mac

***Applies to:*** *Office for Mac, Office 2019 for Mac, Office 2016 for Mac*
  
To use Office for Mac in your organization, it needs to be activated. How you activate Office  for Mac depends on whether your organization has an Office 365 plan or has a volume license agreement. But in both cases your users won't have to enter any product keys.

> [!NOTE]
> If you're an Office user trying to activate a personal copy of Office for Mac, [follow these instructions](https://support.office.com/article/7f6646b1-bb14-422a-9ad4-a53410fcefb2) instead of reading this article.   

   
## Activate Office 365 versions of Office for Mac

If your organization has an Office 365 plan, make sure you [assign each user a license](https://support.office.com/article/997596b5-4173-4627-b915-36abac6786dc) for Office before you deploy Office  for Mac to your users. If you don't assign a user a license, you can still deploy Office for Mac to that user, but the user won't be able to activate and use Office. 
  
For Office 365 customers, Office for Mac activates by contacting the Office Licensing Service on the internet. The Office Licensing Service keeps track of which users are licensed and how many computers they've installed Office on.
  
After you deploy Office for Mac, your users are prompted to activate Office the first time they use it. Make sure users are connected to the internet when they activate Office.
  
On the **Sign in to Activate Office** screen, users should select **Sign In**, and then enter their email address and password. After they sign in, users may see an alert asking for permission to access the Microsoft identity stored in their keychain. They should select **Allow** or **Always Allow** to continue. 
  
While you can deploy Office for Mac for your users, your users need to sign in and activate Office for Mac for themselves. That's to ensure that the Office Licensing Service properly associates Office for Mac with the correct licensed user.
  
A program on the Mac, the Office365ServiceV2 daemon, runs once a day to check the user's subscription status. The computer must be connected to the internet to contact the Office Licensing Service. If the computer can't contact the Office Licensing Service after nine days, the user sees a warning message when working in an app.
  
If the computer can't contact the Office Licensing Service after 30 days, Office goes into reduced functionality mode. This means that the user can open, view, and print existing documents in an Office app, but can't create or edit documents. The user also sees a message in the app that most features aren't available. After the user connects to the internet and the subscription status is verified, all the features of Office are available again.
  
For each user that you've assigned a license to in Office 365, you can deploy and activate Office for Mac on up to five Macs for the user. If you need to provide Office for Mac on a sixth computer for a user, you need to deactivate an existing installation first. Deactivating an installation doesn't remove Office  for Mac from the computer. Instead, the installation goes into reduced functionality mode.
  
Users can sign into the Office 365 portal to deactivate an existing installation by going to **My account** > **Install status** > **Manage installs**. Or, you can deactivate an installation as an Office 365 administrator. Sign into the Office 365 portal, go to the [Office 365 admin center](https://support.office.com/Article/58537702-d421-4d02-8141-e128e3703547), and then go to **Users** > **Active Users**. Select the user, and then choose **Edit** for the **Office installs** property of the user. 
  
## Activate volume licensed versions of Office for Mac

To activate a volume licensed version of Office 2019 for Mac or Office 2016 for Mac, use the Volume License (VL) Serializer. You can download the VL Serializer by signing into the [Volume Licensing Service Center (VLSC)](https://www.microsoft.com/licensing/servicecenter/default.aspx). You run the VL Serializer on each computer. By doing this, your users won't see any activation prompts when they first open Office 2019 for Mac or Office 2016 for Mac.

For more information, see [Overview of the Volume License (VL) Serializer](volume-license-serializer.md).
  
## Related topics
  
- [Deployment options for admins for Office for Mac](deployment-options-for-office-for-mac.md)

