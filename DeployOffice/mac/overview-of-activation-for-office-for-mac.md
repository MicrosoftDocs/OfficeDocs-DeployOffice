---
title: "Overview of activation for Office for Mac"
ms.author: geokri
author: pbowden-msft
manager: dougeby
audience: ITPro
ms.topic: conceptual
ms.service: o365-proplus-itpro
ms.subservice: office-mac
ms.localizationpriority: medium
ms.collection: Tier3
recommendations: true
description: "Describes for admins how activation works for Office for Mac, for both Office 365 plans and volume license agreements"
ms.date: 03/01/2023
---

# Overview of activation for Office for Mac

***Applies to:*** *Office for Mac, Office LTSC for Mac 2021, Office 2019 for Mac*
  
To use Office for Mac in your organization, it needs to be activated. How you activate Office for Mac depends on whether your organization has a Microsoft 365 (or Office 365) plan or has a volume license agreement. But in both cases your users won't have to enter any product keys.

> [!NOTE]
> If you're an Office user trying to activate a personal copy of Office for Mac, [follow these instructions](https://support.microsoft.com/office/7f6646b1-bb14-422a-9ad4-a53410fcefb2) instead of reading this article.

## Activate Microsoft 365 versions of Office for Mac

If your organization has a Microsoft 365 (or Office 365) plan, make sure you [assign each user a license](/microsoft-365/admin/manage/assign-licenses-to-users) for Office before you deploy Office to your Mac users. If you don't assign a user a license, you can still deploy Office to that user, but the user won't be able to activate and use Office on their Mac.
  
For Microsoft 365 (and Office 365) customers, Office for Mac activates by contacting the Office Licensing Service on the internet. The Office Licensing Service keeps track of which users are licensed and how many devices they've installed Office on.
  
After you deploy Office, your users are prompted to activate Office the first time they use it. Make sure users are connected to the internet when they activate Office. On the **Sign in to Activate Office** screen, users should select **Sign In**, and then enter their email address and password.
  
While you can deploy Office for your Mac users, your users need to sign in and activate Office for themselves. That's to ensure that the Office Licensing Service properly associates Office with the correct licensed user.
  
The device must be connected to the internet to contact the Office Licensing Service. If the device can't contact the Office Licensing Service after nine days, the user sees a warning message when working in an app.
  
If the device can't contact the Office Licensing Service after 30 days, Office goes into reduced functionality mode. This means that the user can open, view, and print existing documents in an Office app, but can't create or edit documents. The user also sees a message in the app that most features aren't available. After the user connects to the internet and the subscription status is verified, all the features of Office are available again.
  
For each user that you've assigned a license to, you can deploy and activate Office on up to ten Mac devices for the user. If you need to provide Office on an eleventh Mac for a user, you need to deactivate an existing installation first. Deactivating an installation doesn't remove Office from the device. Instead, the installation goes into reduced functionality mode.
  
Your users can manage their existing Office installations by signing into [https://www.office.com](https://www.office.com) with their work or school account. From there, they can choose **View account** > **Office apps** > **Apps & devices**. Or, if you're a Microsoft 365 administrator, you can deactivate an Office installation for a user. To do that, sign into the [Microsoft 365 admin center](/microsoft-365/admin/admin-overview/about-the-admin-center), and then go to **Users** > **Active users**. Select the user, then select **Account** on the flyout pane, and under **Office activations**, choose **View Office activations**.
  
## Activate volume licensed versions of Office for Mac

To activate a volume licensed version of Office for Mac, such as Office LTSC for Mac 2021 or Office 2019 for Mac, use the Volume License (VL) Serializer. You can download the VL Serializer by signing into the [Volume Licensing Service Center (VLSC)](https://www.microsoft.com/licensing/servicecenter/default.aspx). You run the VL Serializer on each device. By doing this, your Mac users won't see any activation prompts when they first open their copy of Office.

For more information, see [Overview of the Volume License (VL) Serializer](volume-license-serializer.md).
  
## Related articles
  
- [Deployment options for admins for Office for Mac](deployment-options-for-office-for-mac.md)