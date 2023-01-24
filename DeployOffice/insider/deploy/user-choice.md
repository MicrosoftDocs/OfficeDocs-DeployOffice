---
title: "Let users choose which Microsoft 365 Insider channel to install on Windows devices"
ms.author: danbrown
author: DHB-MSFT
manager: dougeby
audience: ITPro
ms.topic: article
ms.service: o365-proplus-itpro
ms.localizationpriority: medium
ms.collection: Ent_O365
ms.custom: Microsoft_365_Insider
recommendations: false
description: "Provides steps for admins to use Group Policy to let users choose their Microsoft 365 Insider channel on Windows devices"
---

# Let users choose which Microsoft 365 Insider channel to install on Windows devices

Instead of installing Microsoft 365 Insider for your users, you can give them the option to select which Microsoft 365 Insider channel they want to use on their Windows device.

With this method, the user can choose their Microsoft 365 Insider channel by going to **File** > **Account** in an app, such as Excel. There they'll see a choice for **Update Channel**.

![Update Channel option that appears under File > Account in an app](../../images/insider/update-channel-option.png)

Users need to select the **I will manage my Office update channel** checkbox to see the list of channels to choose from. After they make their selection, their existing Microsoft 365 Apps installation will switch to that channel. Along with Microsoft 365 Insider channels, you can also include other channels for them to select, such as Current Channel or Monthly Enterprise Channel.

> [!IMPORTANT]
> Users must have local administrator permissions on their Windows device to choose their channel.

## Use Group Policy to show the Update Channel option to users

If you’re already using Group Policy to manage Microsoft 365 Apps in your organization, you can set the *Show the Update Channel option to allow users to select an update channel* policy to Enabled. Then, under **Options**, select the checkboxes for the channels you want users to be able to select from.

There are two versions of this policy; one for devices, another for users. In the Group Policy Management Console, the policies are found in the following locations:

- Computer Configuration\Policies\Administrative Templates\Microsoft Office 2016 (Machine)\Miscellaneous
- User Configuration\Policies\Administrative Templates\Microsoft Office 2016\Miscellaneous

You can set either policy to Enabled, or both policies to Enabled, depending on whether you want to target devices or users, or both. If you set both policies to Enabled, then the user will see all the channels you've selected across both policies (if the policy is also applied to the device).

After enabling this policy, you should notify the users so that they know this option is available to them. You'll want to include the steps for getting to the option (along with a screenshot) and guidance about which Microsoft 365 Insider channel they should choose, based on their role in the organization.

> [!NOTE]
> - You can also use Cloud Policy to set the User Configuration version of the policy to Enabled. For more information, see [Overview of Cloud Policy service for Microsoft 365](../../admincenter/overview-cloud-policy.md).
> - If you're using this policy, don't enable and configure the *Update Channel* policy. That policy will take precedence. The **Update Channel** option will still appear under **File** > **Account**, but it'll be disabled and the user won’t be able to select an update channel.

## Use a command to update the registry to show the Microsoft 365 Insider choice to users

If you don't use Group Policy or Cloud Policy in your organization, there's an alternative that does the same thing as the *Show the Update Channel option to allow users to select an update channel*. This alternative also works if you have Microsoft 365 Apps for business, which doesn't support Group Policy or Cloud Policy.

You can run the following commands from an elevated command prompt on the Windows device, hitting ENTER after each line. Running these commands will show users the following channels to select from: Beta Channel, Current Channel (Preview), Current Channel, and Monthly Enterprise Channel.

To make the channel selections available to all users on the device, use these commands:

```console
reg add HKLM\Software\Policies\Microsoft\office\16.0\common\officechannelexposure /v insiderfast /t REG_DWORD /d 1
reg add HKLM\Software\Policies\Microsoft\office\16.0\common\officechannelexposure /v firstreleasecurrent /t REG_DWORD /d 1
reg add HKLM\Software\Policies\Microsoft\office\16.0\common\officechannelexposure /v current /t REG_DWORD /d 1
reg add HKLM\Software\Policies\Microsoft\office\16.0\common\officechannelexposure /v monthlyenterprise /t REG_DWORD /d 1
```

To make the channel selections available only for the current user on the device, use these commands:

```console
reg add HKCU\Software\Policies\Microsoft\office\16.0\common\officechannelexposure /v insiderfast /t REG_DWORD /d 1
reg add HKCU\Software\Policies\Microsoft\office\16.0\common\officechannelexposure /v firstreleasecurrent /t REG_DWORD /d 1
reg add HKCU\Software\Policies\Microsoft\office\16.0\common\officechannelexposure /v current /t REG_DWORD /d 1
reg add HKCU\Software\Policies\Microsoft\office\16.0\common\officechannelexposure /v monthlyenterprise /t REG_DWORD /d 1
```

> [!NOTE]
> insiderfast refers to Beta Channel and firstreleasecurrent refers to Current Channel (Preview).


## Frequently asked questions

### How do I change to a different channel?

A local administrator on the device can go to **File** > **Account** > **Update Channel** to change to a different channel.

### I see there's a policy named "Show the option for Office Insider". How is that policy different?

Yes, there's another policy, named *Show the option for Office Insider*, that's found under User Configuration\Policies\Administrative Templates\Microsoft Office 2016\Miscellaneous. If you set that policy to Enabled, users will see an **Office Insider** option under **File** > **Account**.

There are the two basic differences with that policy:

- You can't show the user other channels, such as Current Channel or Monthly Enterprise Channel, to select from.
- The policy can only be applied to users, not to devices.

> [!NOTE]
> - This policy will be renamed to *Show the option for Microsoft 365 Insider* in an upcoming release of Group Policy.
> - The option under **File** > **Account** will be updated to "Microsoft 365 Insider" in a future update to Microsoft 365 Apps.


## Related articles

- [Compare Microsoft 365 Insider channels](../compare-channels.md)
- [Overview of update channels for Microsoft 365 Apps](../../overview-update-channels.md)