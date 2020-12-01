---
title: "In-product notification for Home Use Program (HUP) employee benefit"
ms.author: danbrown
author: DHB-MSFT
manager: laurawi
audience: ITPro
ms.topic: article
ms.service: o365-proplus-itpro
localization_priority: Normal
ROBOTS: NOINDEX, NOFOLLOW
hideEdit: true
---

# In-product notification for Home Use Program (HUP) employee benefit

> [!IMPORTANT]
> - This article is for a program that isn’t available to everyone. 
> - The information in this article applies only to organizations that receive a Message center post (in the Microsoft 365 admin center) about this feature.
> - Microsoft may change or discontinue this feature at any time without notice.

Microsoft is releasing a new in-product notification feature that informs qualifying end users about the Home Use Program (HUP) employee benefit. The notification will be shown in Word, Excel, PowerPoint, and Outlook apps on devices running Windows. This feature is only for Office 365 (or Microsoft 365) subscription clients and is available with Version 2008 or later of Microsoft 365 Apps for enterprise.

The following information outlines what you can expect from the rollout of this feature. For your tenant, the feature will be made available on the start date indicated in the Message center post sent to you and will be rolled out by default to your users in the United States.

## Goal of the HUP in-product notification feature

The goal of this feature is to raise awareness about the Home Use Program among your employee community. This notification will only appear for employees of organizations that meet the qualification criteria for the Home Use Program.

Microsoft may receive aggregated (non-identifiable) user data such as impression count or click count for these notifications.

## What is the Home Use Program (HUP)?

The Home Use Program (HUP) is an employee purchase program for Microsoft’s valued customers. HUP provides employees of qualifying organizations a significant discount on Microsoft 365 Personal and Family subscriptions for their home use. If you belong to a qualifying organization, this benefit is included in your license agreement with Microsoft and you do not need to take any additional steps to activate the benefit for your users. If you are unsure of whether your organization is eligible for this program, visit https://www.microsoft.com/home-use-program/resources.

The Home Use Program helps your employees become more proficient and productive with Microsoft 365 at home, increasing employee satisfaction while lowering the cost of IT help and training. Skill and experience grow from personal use and translate to higher productivity, satisfaction, and savings for your company.

## What is the user experience?

The notification will be shown in Word, Excel, PowerPoint, and Outlook apps on devices running Windows for Version 2008 or later of Microsoft 365 Apps for enterprise. For your tenant, the notification will begin appearing on the start date indicated in the Message center post sent to you.

This notification will be automatically enabled for users in your organization who are in the United States. You can choose to [turn off these notifications](#how-to-turn-off-notifications-about-hup) for some or all of your users by using a policy setting.

> [!TIP]
> You can use the same policy setting to enable HUP notifications to users in your organization who are not in the United States. In that case, you'll set the policy setting to Enabled.

If enabled, users will see one notification total per month across all their apps. The notification will be similar to the following screenshot, localized to the language setting of the user’s device.

![Screenshot showing a document in Word, with a message about the Home Use Program showing underneath the ribbon.](../images/other/home-use-program-notification.png)

When the user selects **Learn more and sign up**, they will be taken to the HUP webpage (https://aka.ms/huplearnmore) where they can learn more about the program and sign up for it if they would like. Their subscription will be separate from any organizational subscription enabled by you.

End users will be able to opt out of all HUP-related messaging on their device by clicking on the **Don’t tell me about this again** button on any notification. This opt-out is device-specific.

## How to turn off notifications about HUP

The notifications can be controlled by a policy setting that can be configured by using the Office cloud policy service or Group Policy. The policy setting is named *Show in-product notifications for the Microsoft Home Use Program*.

You can configure this policy setting for some or all of your users, and you can configure the policy setting before or after the notifications begin appearing.

### Use the Office cloud policy service to turn off notifications about HUP

For instructions on how to use the Office cloud policy service, see [Overview of the Office cloud policy service for Microsoft 365 Apps for enterprise](../overview-office-cloud-policy-service.md).

In the Office cloud policy service, search for the *Show in-product notifications for the Microsoft Home Use Program* policy setting, and then set it to Disabled.

### Use Group Policy to turn off notifications about HUP

To disable the *Show in-product notifications for the Microsoft Home Use Program* policy setting by using Group Policy, [download the Administrative Template files (ADMX/ADML) for Office](https://www.microsoft.com/download/details.aspx?id=49030) from the Microsoft Download Center. You must be using at least version 5086.1000 of the Administrative Template files, which were released on October 22, 2020.

You can find this policy setting under User Configuration\Policies\Administrative Templates\Microsoft Office 2016\Miscellaneous.

## User privacy and the Home Use Program

User data in the Microsoft 365 enterprise applications described above continues to be governed by the Online Service Terms while receiving and interacting with HUP messages, but once a user selects the **Learn more** option in the HUP offering, a Microsoft consumer website will open in their browser and further interaction with HUP will be governed by the [Microsoft Services Agreement](https://www.microsoft.com/servicesagreement) and the [Microsoft Privacy Statement](https://privacy.microsoft.com/privacystatement).

In order to ensure that only the right enterprise users see HUP notifications, our services will utilize the following data: Tenant ID associated with the device.

We will be looking at basic user engagement data to draw insights on the program design, such as how many users saw notifications, and how many clicked on them. This data is collected as diagnostic data as it is for all user in-product notifications; under the provisions of the Online Services Terms, and governed by the Tenant Admin setting for diagnostic data collection: optional/required/neither.

