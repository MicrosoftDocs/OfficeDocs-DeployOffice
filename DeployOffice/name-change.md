---
title: "Name change for Office 365 ProPlus"
ms.author: danbrown
author: DHB-MSFT
manager: laurawi
audience: ITPro
ms.topic: article
ms.service: o365-proplus-itpro
localization_priority: Normal
ms.collection: Ent_O365
ms.custom: Ent_Office_ProPlus
description: "Provides Office admins information about Office 365 ProPlus being renamed to Microsoft 365 Apps for enterprise."
---

# Name change for Office 365 ProPlus

Office 365 ProPlus is being renamed to **Microsoft 365 Apps for enterprise**. To learn more about this name change, [read this blog post](https://go.microsoft.com/fwlink/p/?linkid=2120533). In our documentation, we'll usually just refer to it as Microsoft 365 Apps.

Office 365 ProPlus is the version of Office that comes with several enterprise, government, and education subscription plans. For example, Office 365 E5 and Office 365 A3. Even though those plans aren't being renamed, Office 365 ProPlus that comes with those plans will be renamed.

## When does the new name take effect?

The new name will appear in Version 2004 onwards, starting on April 21, 2020. For example, the following screenshot is an example of what you'll see under the **Product Information** section when you go to **File** > **Account** in an Office app, such as Word.

![Product information section in an Office application showing "Microsoft 365 for enterprise"](images/product-information-microsoft-365-enterprise.png)

Starting with Version 2005, when you go to **Control Panel** > **Programs** > **Programs and Features**, you will see an entry similar to the following:

&nbsp; &nbsp; Microsoft 365 for enterprise – en-us

Older versions of Office 365 ProPlus won't be updated with the new name. For example, if you're using Version 1908 of Semi-Annual Enterprise Channel, you'll still see Office 365 ProPlus under the **Product Information** section and in Control Panel.

References to Microsoft 365 Apps for enterprise will begin to appear on April 21 in other places as well. For example, references on product websites, in documentation, and in the user interface (UI) of deployment tools, such as the Office Customization Tool. Some references to the new name might not occur until after April 21.

## What do admins need to do?

Because of this name change, you might need to adjust some of your existing workflows and update your internal documentation.

### Office Deployment Tool

If you use the Office Deployment Tool to deploy Office 365 ProPlus, the [product ID](office-deployment-tool-configuration-options.md#product-element) will remain as O365ProPlusRetail. Therefore, you don't have to make any changes to your existing configuration.xml files.

### Update packages used by Configuration Manager

If you use an automatic deployment rule (ADR) to deploy updates by using Configuration Manager, you'll need to make changes to your ADRs if they rely on the "Title" property. That's because the name of update packages in the Microsoft Update Catalog is changing.

Currently, the title of an update package for Office 365 ProPlus begins with "Office 365 Client Update" as seen in the following example:

&nbsp; &nbsp; Office 365 Client Update - Semi-annual Channel Version 1908 for x64 based Edition (Build 11929.20648)

For update packages released on and after June 9, the title will begin with "Microsoft 365 Apps Update" as seen in the following example:

&nbsp; &nbsp; Microsoft 365 Apps Update - Semi-Annual Enterprise Channel Version 1908 for x64 based Edition (Build 11929.50000)

### Registry key values

Some registry key values might change to reflect the new naming. If you rely on these values in your workflows or scripts, you'll want to test your workflows or scripts when the name change begins rolling out on April 21. In general, because registry key values can possibly change in future builds of Office, we don't usually recommend relying on them in your workflows or scripts.

### PowerShell scripts

There shouldn't be any changes needed to PowerShell scripts for licensing. The string ID and GUID that were used for Office 365 ProPlus in PowerShell cmdlets are the same string ID and GUID that are now used for Microsoft 365 Apps for enterprise. But it's always a good idea to test your scripts before applying them broadly in your organization.

 For more information about licensing identifiers used with PowerShell cmdlets, see [Product names and service plan identifiers for licensing](https://docs.microsoft.com/azure/active-directory/users-groups-roles/licensing-service-plan-reference).