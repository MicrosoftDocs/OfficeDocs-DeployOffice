---
title: "Use a registry command to install Microsoft 365 Insider on Windows devices"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: how-to
ms.service: o365-proplus-itpro
ms.localizationpriority: medium
ms.collection: Tier1
recommendations: false
description: "Provides steps for admins to use the reg add command to install Microsoft 365 Insider on Windows devices."
ms.date: 02/05/2024
---

# Use a registry command to install Microsoft 365 Insider on Windows devices

If you have an existing Microsoft 365 Apps installation on a Windows device, the simplest way to install Microsoft 365 Insider is to run a command that updates the registry on the device. The command updates information in the registry to specify which Microsoft 365 Insider channel the Microsoft 365 Apps installation should use.

We recommend using this method if you have just a handful of devices that need Microsoft 365 Insider on them.

## Change an existing Microsoft 365 Apps installation to Microsoft 365 Insider by using a command to update the registry

On a Windows device, you can run a "reg add" command from an elevated command prompt.

For example, the following command updates the registry to have the Microsoft 365 Apps installation on the device use Current Channel (Preview).

`reg add HKLM\Software\Policies\Microsoft\office\16.0\common\officeupdate /v updatebranch /t REG_SZ /d CurrentPreview`

To change to Beta Channel, use the following command.

`reg add HKLM\Software\Policies\Microsoft\office\16.0\common\officeupdate /v updatebranch /t REG_SZ /d BetaChannel`

> [!NOTE]
> - Keep in mind that Beta Channel isn't supported.

## Frequently asked questions

### The Microsoft 365 Insider channel that was chosen hasn't installed yet. What do I do?

The Microsoft 365 Insider channel should be installed the next time Microsoft 365 Apps checks for updates. You can force Microsoft 365 Apps to check for updates by going to **File** > **Account** > **Update Options** > **Update Now** in an app, such as Word.

### How do I change to a different channel at a later time?

To change to a different channel, you can rerun the "reg add" command again on the device to change to a different channel. For example, the following command updates the registry to Current Channel.

`reg add HKLM\Software\Policies\Microsoft\office\16.0\common\officeupdate /v updatebranch /t REG_SZ /d Current`

The following command can be used to update the registry to Monthly Enterprise Channel.

`reg add HKLM\Software\Policies\Microsoft\office\16.0\common\officeupdate /v updatebranch /t REG_SZ /d MonthlyEnterprise`

### Does this command do the same thing as setting the Update Channel policy to Enabled?

Yes, it does. But this command is a good alternative for organizations that don't use Group Policy. This command also works if you have Microsoft 365 Apps for business, which doesn't support Group Policy.

For more information about using the *Update Channel* policy, see [Use Group Policy to install Microsoft 365 Insider on Windows devices](group-policy.md).