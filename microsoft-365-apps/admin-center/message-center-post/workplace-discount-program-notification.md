---
title: "In-product notification for Microsoft Workplace Discount Program"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: conceptual
ms.service: o365-proplus-itpro
ms.localizationpriority: medium
ms.collection: Tier2
ROBOTS: NOINDEX, NOFOLLOW
hideEdit: true
ms.date: 03/01/2023
---

# In-product notification for Microsoft Workplace Discount Program

> [!IMPORTANT]
> - This article is for a program that isn’t available to everyone. 
> - The information in this article applies only to organizations that receive a Message center post (in the Microsoft 365 admin center) about this feature.
> - Microsoft may change or discontinue this feature at any time without notice.

Microsoft has released an in-product notification feature that informs qualifying end users about the Microsoft Workplace Discount Program (formerly named the Home Use Program). The notification is shown in Word, Excel, PowerPoint, and Outlook apps on devices running Windows. This feature is only for Microsoft 365 (or Office 365) subscription clients and is available with Version 2008 or later of Microsoft 365 Apps for enterprise.

The goal of this feature is to raise awareness about the Workplace Discount Program among your employee community. This notification will only appear for employees of organizations that meet the qualification criteria for the Workplace Discount Program.

The following information outlines what you can expect from this feature. For your organization, the feature will be made available on the start date indicated in the Message center post sent to you and will be rolled out by default to your users in the United States.

## What is the Workplace Discount Program?

The Workplace Discount Program is an employee purchase program for Microsoft’s valued customers. The Workplace Discount Program provides employees of qualifying organizations a significant discount on Microsoft 365 Personal and Family subscriptions for their home use. If you belong to a qualifying organization, this benefit is included in your license agreement with Microsoft. You don't need to take any other steps to activate the benefit for your users. If you're unsure of whether your organization is eligible for this program, see [Microsoft Workplace Discount Program FAQs](https://www.microsoft.com/workplace-discount-program/faq).

Ensure your custom domains are added in Microsoft Entra ID. Employees with email addresses that use the domain you add will be eligible for the Workplace Discount Program. For instructions on how to add custom domains, see [Add your custom domain name using the Microsoft Entra admin center](/azure/active-directory/fundamentals/add-custom-domain).

The Workplace Discount Program helps your employees become more proficient and productive with Microsoft 365 at home, increasing employee satisfaction while lowering the cost of IT help and training. Skill and experience grow from personal use and translate to higher productivity, satisfaction, and savings for your company.

## What is the user experience?

The notification will be shown in Word, Excel, PowerPoint, and Outlook apps on devices running Windows for Version 2008 or later of Microsoft 365 Apps for enterprise. For your organization, the notification will begin appearing on the start date indicated in the Message center post sent to you. Each user will see a maximum of one notification per month across all their apps and devices, even if they have multiple Windows devices or virtual machines.

This notification will be automatically enabled for users in your organization who are in the United States. You can choose to [turn off these notifications](#how-to-turn-off-notifications-about-the-workplace-discount-program) for some or all of your users by using a policy. You can use the same policy to enable these notifications for users in your organization who aren't in the United States.

If enabled, users will see one notification total per month across all their apps and devices. The notification will be similar to the following screenshot, localized to the language setting of the user’s device.

:::image type="content" source="media/workplace-discount-program-notification/workplace-discount-program-notification.PNG" alt-text="A screenshot showing a document in Word, with a message about the Workplace Discount Program showing underneath the ribbon.":::

When the user selects **Learn more and sign up**, they'll be taken to the [Workplace Discount Program webpage](https://www.microsoft.com/workplace-discount-program) where they can learn more about the program and sign up for it if they would like. Their subscription will be separate from any organizational subscription enabled by you.

End users will be able to opt out of all Workplace Discount Program messaging on their device by selecting the **Don’t tell me about this again** button on any notification. This opt-out is device-specific.

## How to turn off notifications about the Workplace Discount Program

The notifications can be controlled by a policy that can be configured by using Cloud Policy or Group Policy. The policy is named *Show in-product notifications for the Microsoft Workplace Discount Program*.

> [!NOTE]
> - The policy was previously named *Show in-product notifications for the Microsoft Home Use Program*. 
> - Only the name of the policy changed. How the policy works hasn't changed.

You can configure this policy for some or all of your users, and you can configure the policy before or after the notifications begin appearing.

If you want users in your organization who aren't in the United States to receive these notifications, you can set the policy to Enabled.

### Use Cloud Policy to turn off notifications about the Workplace Discount Program

For instructions on how to use Cloud Policy, see [Overview of Cloud Policy service for Microsoft 365](../../admincenter/overview-cloud-policy.md).

In Cloud Policy, search for the *Show in-product notifications for the Microsoft Workplace Discount Program* policy, and then set it to Disabled.

### Use Group Policy to turn off notifications about the Workplace Discount Program

To disable the *Show in-product notifications for the Microsoft Workplace Discount Program* policy by using Group Policy, [download the Administrative Template files (ADMX/ADML) for Office](https://www.microsoft.com/download/details.aspx?id=49030) from the Microsoft Download Center.

You can find this policy under User Configuration\Policies\Administrative Templates\Microsoft Office 2016\Miscellaneous.

## User privacy and notifications about the Workplace Discount Program

Microsoft may receive aggregated (non-identifiable) user data such as impression count or click count for these notifications.

User data in the Microsoft 365 enterprise applications described above continues to be governed by the Online Service Terms while receiving and interacting with Workplace Discount Program messages, but once a user selects the **Learn more** option in the Workplace Discount Program offering, a Microsoft consumer website will open in their browser and further interaction with the Workplace Discount Program will be governed by the [Microsoft Services Agreement](https://www.microsoft.com/servicesagreement) and the [Microsoft Privacy Statement](https://privacy.microsoft.com/privacystatement).

In order to ensure that only the right enterprise users see Workplace Discount Program notifications, our services will utilize the following data: Tenant ID associated with the user signed in to the device.

We will be looking at basic user engagement data to draw insights on the program design, such as how many users saw notifications, and how many clicked on them. This data is collected as diagnostic data as it is for all user in-product notifications; under the provisions of the Online Services Terms, and governed by the Tenant Admin setting for diagnostic data collection: optional/required/neither.
