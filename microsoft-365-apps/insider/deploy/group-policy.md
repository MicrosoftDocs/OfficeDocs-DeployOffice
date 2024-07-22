---
title: "Use Group Policy to install Microsoft 365 Insider on Windows devices"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: how-to
ms.service: o365-proplus-itpro
ms.localizationpriority: medium
ms.collection: Tier1
recommendations: false
description: "Provides steps for admins to use Group Policy to install Microsoft 365 Insider on Windows devices."
ms.date: 02/05/2024
---

# Use Group Policy to install Microsoft 365 Insider on Windows devices

If you’re using Group Policy to manage Microsoft 365 Apps in your organization, you can use it to configure Windows devices to get Microsoft 365 Insider.

> [!TIP]
> - You can also use Group Policy to let your users choose which Microsoft 365 Insider channel they want to use. For more information, see [Let users choose which Microsoft 365 Insider channel to install on Windows devices](user-choice.md).
> - If you can't use Group Policy, see [Use a registry command to install Microsoft 365 Insider on Windows devices](registry.md).

## Change an existing Microsoft 365 Apps installation to Microsoft 365 Insider by enabling the Update Channel policy

For existing Microsoft 365 Apps installations on Windows devices, you can change to Microsoft 365 Insider by setting the *Update Channel* policy to Enabled. In the Group Policy Management Console, you can find the *Update Channel* policy in the following location:

&nbsp;&nbsp;&nbsp; Computer Configuration\Policies\Administrative Templates\Microsoft Office 2016 (Machine)\Updates

When you set the policy to Enabled, select either **Current Channel (Preview)** or **Beta Channel** from the **Options** drop-down list. The policy applies to devices, not to users. So if multiple users are using Microsoft 365 Apps on that device, each user gets that Microsoft 365 Insider channel.

> [!NOTE]
> - Keep in mind that Beta Channel isn't supported.
> - You can download the most current [Administrative Template files (ADMX/ADML) for Group Policy](https://www.microsoft.com/download/details.aspx?id=49030) from the Microsoft Download Center.

## Frequently asked questions

### The Microsoft 365 Insider channel that was chosen hasn't installed yet. What do I do?

After you configure the policy, it might take at least 90 minutes before the policy is applied to the device. Then, the Microsoft 365 Insider channel should be installed the next time Microsoft 365 Apps checks for updates. You can force Microsoft 365 Apps to check for updates by going to **File** > **Account** > **Update Options** > **Update Now** in an app, such as Word.

### How do I change to a different channel at a later time?

To change to a different channel, you can go back to the Group Policy Management Console and select a different channel. Remember, changing this setting updates the channel for every device affected by the policy.
