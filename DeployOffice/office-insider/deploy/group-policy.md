---
title: "Use Group Policy to install Office Insider on Windows devices"
ms.author: danbrown
author: DHB-MSFT
manager: dougeby
audience: ITPro
ms.topic: how-to
ms.service: o365-proplus-itpro
ms.localizationpriority: medium
ms.collection: Ent_O365
ms.custom: Office_Insider
recommendations: false
description: "Provides steps for Office admins to use Group Policy to install Office Insider on Windows devices."
---

# Use Group Policy to install Office Insider on Windows devices

If you’re already using Group Policy to manage Office in your organization, you can use it to configure Windows devices to get Office Insider.

> [!TIP]
> - You can also use Group Policy to let your users choose which Office Insider channel they want to use. For more information, see [Let users choose which Office Insider channel to install on Windows devices](user-choice.md).
> - If you can't use Group Policy, see [Use a registry command to install Office Insider on Windows devices](registry.md).

## Change an existing Office installation to Office Insider by enabling the Update Channel policy

For existing Office installations on Windows devices, you can change to Office Insider by setting the *Update Channel* policy to Enabled. In the Group Policy Management Console, you can find the *Update Channel* policy in the following location:

&nbsp;&nbsp;&nbsp; Computer Configuration\Policies\Administrative Templates\Microsoft Office 2016 (Machine)\Updates

When you set the policy to Enabled, you’ll see the option to choose **Current Channel (Preview)** or **Beta Channel** from the drop-down list under **Options**. The policy applies to devices, not to users. So if multiple users are using Office on that device, each user will get that Office Insider channel.

> [!NOTE]
> - Keep in mind that Beta Channel isn't supported.
> - You can download the most current [Administrative Template files (ADMX/ADML) for Group Policy](https://www.microsoft.com/download/details.aspx?id=49030) from the Microsoft Download Center.

## Frequently asked questions

### The Office Insider channel that was chosen hasn't installed yet. What do I do?

After you configure the policy, it might take at least 90 minutes before the policy is applied to the device. Then, the Office Insider channel should be installed the next time Office checks for updates. You can force Office to check for updates by going to **File** > **Account** > **Update Options** > **Update Now** in an Office app, such as Word.

### How do I change to a different channel at a later time?

To change to a different channel, you can go back to the Group Policy Management Console and select a different channel. Keep in mind that making this change will change the channel for all devices to which the policy applies.
