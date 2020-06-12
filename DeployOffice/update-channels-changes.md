---
title: "Changes to update channels for Microsoft 365 Apps"
ms.author: danbrown
author: DHB-MSFT
manager: laurawi
audience: ITPro
ms.topic: article
ms.service: o365-proplus-itpro
localization_priority: Normal
ms.collection: Ent_O365
ms.custom: Ent_Office_ProPlus
description: "Provides Office admins information about changes to update channels for Microsoft 365 Apps, including introduction of Monthly Enterprise Channel and new names for existing update channels."
---

# Changes to update channels for Microsoft 365 Apps

There are three changes to update channels for Microsoft 365 Apps that we want you to be aware of:

- The introduction of a new update channel: Monthly Enterprise Channel
- New names for the existing update channels
- A change to the default update channel for Microsoft 365 Apps for enterprise

These changes only apply to installations of Microsoft 365 Apps on devices running Windows.

For the official announcement of these changes, [read this blog post](https://techcommunity.microsoft.com/t5/office-365-blog/a-new-wave-of-innovation-to-help-it-modernize-servicing-of/ba-p/1380733).

## Monthly Enterprise Channel

We recommend that you use choose an update channel that provides your users with the newest Office features as soon as they're ready. For the last several years, Monthly Channel has provided that capability, delivering new or updated Office features every month, but on no set release schedule.

Based on customer feedback, we're now introducing Monthly Enterprise Channel. This update channel provides new Office features to Microsoft 365 Apps once a month, on the second Tuesday of the month. While we still recommend Monthly Channel (to be renamed Current Channel), if you need a more predictable release schedule for monthly feature updates, Monthly Enterprise Channel can provide that for you. These once-a-month updates will also include, as needed, security updates and non-security updates.

This new update channel is available as of May 12, 2020. Version 2003 is the first version of Monthly Enterprise Channel.

You can deploy Monthly Enterprise Channel just like you would any other update channel. For example, by using the Office Deployment Tool, Group Policy, or Microsoft Endpoint Configuration Manager.

> [!NOTE]
> To deploy Monthly Enterprise Channel by using Group Policy and the *Update Channel* policy setting, download at least version 5017.1000 of the [Administrative Template files (ADMX/ADML)](https://www.microsoft.com/en-us/download/details.aspx?id=49030). Version 5017.1000 was released on May 14, 2020.

For more information about Monthly Enterprise Channel, see [Overview of update channels for Microsoft 365 Apps](overview-update-channels.md).


## New names for the existing update channels

In conjunction with the availability of Monthly Enterprise Channel, we're also updating the names of the existing update channels.

The following table shows the new name and previous name for each update channel.

|*New* name  |Previous name  |
|---------|---------|
|Beta Channel  | Insider <br></br>*(sometimes referred to as Insider Fast)* |
|Current Channel (Preview) | Monthly Channel (Targeted) <br></br>*(sometimes referred to as Insider Slow)* |
|Current Channel  |Monthly Channel |
|Monthly Enterprise Channel  | |
|Semi-Annual Enterprise Channel (Preview)| Semi-Annual Channel (Targeted)|
|Semi-Annual Enterprise Channel  |Semi-Annual Channel |

> [!NOTE]
> Only the names of the existing update channels are changing. These update channels still work the same way as they did before. For example, Semi-Annual Enterprise Channel still only gets new features twice a year, in January and July. For more information about these update channels, see [Overview of update channels for Microsoft 365 Apps](overview-update-channels.md).

References to the new names for the existing update channels will begin appearing on June 9, 2020. For example, in documentation and in the user interface (UI) of deployment tools, such as the Office Customization Tool. 

References to Monthly Enterprise Channel will begin appearing on May 12, 2020.

## What do admins need to do?

Because of this name change, you might need to adjust some of your existing workflows and update your internal documentation.

### Office Deployment Tool

When using the Office Deployment Tool, you can specify the Channel attribute in either the [Add element](office-deployment-tool-configuration-options.md#channel-attribute-part-of-add-element) or in the [Updates element](office-deployment-tool-configuration-options.md#channel-attribute-part-of-updates-element) of your configuration XML file.

As part of the new names for the update channels, we're also providing new values for the Channel attribute, as shown in the following table.

|Update channel  |*New* attribute value | Previous attribute value|
|---------|---------|---------|
|Beta Channel   | BetaChannel      | InsiderFast |
|Current Channel (Preview) |CurrentPreview  | Insiders |
|Current Channel  | Current  | Monthly |
|Monthly Enterprise Channel  |MonthlyEnterprise | |
|Semi-Annual Enterprise Channel (Preview)|SemiAnnualPreview  |Targeted |
|Semi-Annual Enterprise Channel  |SemiAnnual| Broad|

> [!IMPORTANT]
> - To use all the new attribute values, you need to be using at least version 16.0.12827.20268 of the Office Deployment Tool, which was released on Tuesday June 9, 2020. We always recommend that you [download the most current version of the Office Deployment Tool](https://www.microsoft.com/download/details.aspx?id=49117).
> - After June 9, 2020, previous attribute values for each update channel will still be valid. For example, if you use Broad in your configuration XML file, Semi-Annual Enterprise Channel will be installed. We're keeping the previous attribute values valid so that you don't have to update your existing configuration XML files.

### Update packages used by Configuration Manager

Update packages in the Microsoft Update Catalog will use the new channel names starting with releases on June 9, 2020. If you use an automatic deployment rule (ADR) to deploy updates by using Configuration Manager, and you rely on the "Title" property, you'll need to make changes to your ADRs on or after June 9.

For example, the title of an update package currently looks something like the following example:

&nbsp; &nbsp;Office 365 Client Update - Semi-annual Channel Version 1908 for x64 based Edition (Build 11929.20708)

For update packages released on and after June 9, 2020, the title of the update package will look something like the following example:

&nbsp; &nbsp;Microsoft 365 Apps Update - Semi-Annual Enterprise Channel Version 1908 for x64 based Edition (Build 11929.50000)

## Change to the default update channel for Microsoft 365 Apps for enterprise

Starting on June 9, 2020, Current Channel will become the default update channel for Microsoft 365 Apps for enterprise (previously named Office 365 ProPlus), instead of Semi-Annual Enterprise Channel. Current Channel is already the default update channel for Microsoft 365 Apps for business (previously named Office 365 Business) and for the subscription versions of the Project and Visio desktop apps.

You’ll encounter this new default update channel setting when using the following deployment tools on or after June 9, 2020.

### Office Deployment Tool  
If you install Microsoft 365 Apps for enterprise with the [Office Deployment Tool](overview-office-deployment-tool.md) and don't specify an update channel in your configuration XML file, then Current Channel will be installed.

This change takes effect with versions of the Office Deployment Tool that are released on or after June 9, 2020. We recommend that you always [download](https://www.microsoft.com/download/details.aspx?id=49117) and use the most current version of the Office Deployment Tool.

If you want to use a specific update channel, specify that update channel in your configuration XML file. Or, you can use Group Policy and enable the Update Channel policy setting and select the appropriate update channel for your organization.

### Office Customization Tool  
We recommend using the [Office Customization Tool](overview-of-the-office-customization-tool-for-click-to-run.md) to help you build your configuration XML files for use with the Office Deployment Tool. When you use the Office Customization Tool and select Microsoft 365 Apps for enterprise in the **Office Suites** drop-down list, the **Update channel** drop-down will choose Current Channel automatically. You can always choose a different update channel.

You will also see this default update channel selection if you use Microsoft Endpoint Configuration Manager (current branch) and the Office 365 Client Installation Wizard. That’s because the wizard makes use of the Office Customization Tool.

### Microsoft 365 admin center  
Current Channel will be the default selection when you sign into the Microsoft 365 admin center and go to **Show all** > **Settings** > **Org settings** > **Services** > **Office software download settings**.

This change to the default selection in the Microsoft 365 admin center only applies to ***new*** tenants that are created on or after June 9, 2020.

The default selection will not change for tenants that were created before June 9, 2020. For these existing tenants, the default selection will remain as Semi-Annual Enterprise Channel.

The exception is existing tenants with Office 365 Education or Microsoft 365 Education plans. Those plans already have Current Channel as the default update channel for Microsoft 365 Apps for enterprise.