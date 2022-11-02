---
title: "Use a registry command to install Office Insider on Windows devices"
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
description: "Provides steps for Office admins to use the reg add command to install Office Insider on Windows devices."
---

# Use a registry command to install Office Insider on Windows devices

If you have an existing Office installation on a Windows device, the simplest way to install Office Insider is to run a command that updates the registry on the device. The command will update information in the registry to specify which Office Insider channel the Office installation should use.

We recommend using this method if you have just a handful of devices that need Office Insider on them.

## Change an existing Office installation to Office Insider by using a command to update the registry

On a Windows device, you can run a "reg add" command from an elevated command prompt.

For example, the following command updates the registry to have the Office installation on the device use Current Channel (Preview).

`reg add HKLM\Software\Policies\Microsoft\office\16.0\common\officeupdate /v updatebranch /t REG_SZ /d CurrentPreview`

To change to Beta Channel, use the following command.

`reg add HKLM\Software\Policies\Microsoft\office\16.0\common\officeupdate /v updatebranch /t REG_SZ /d BetaChannel`

> [!NOTE]
> - Keep in mind that Beta Channel isn't supported.

## Frequently asked questions

### The Office Insider channel that was chosen hasn't installed yet. What do I do?

The Office Insider channel should be installed the next time Office checks for updates. You can force Office to check for updates by going to **File** > **Account** > **Update Options** > **Update Now** in an Office app, such as Word.

### How do I change to a different channel at a later time?

To change to a different channel, you can rerun the "reg add" command again on the device to change to a different channel. For example, the following command updates the registry to Current Channel.

`reg add HKLM\Software\Policies\Microsoft\office\16.0\common\officeupdate /v updatebranch /t REG_SZ /d Current`

The following command can be used to update the registry to Monthly Enterprise Channel.

`reg add HKLM\Software\Policies\Microsoft\office\16.0\common\officeupdate /v updatebranch /t REG_SZ /d MonthlyEnterprise`

### Does this command do the same thing as setting the Update Channel policy to Enabled?

Yes, it does. But this command is a good alternative for organizations that don't use Group Policy. This command also works if you have Microsoft 365 Apps for business, which doesn't support Group Policy.

For more information about using the *Update Channel* policy, see [Use Group Policy to install Office Insider on Windows devices](group-policy.md).