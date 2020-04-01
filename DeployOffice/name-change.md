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

Office 365 ProPlus is being renamed to **Microsoft 365 Apps for enterprise**. To learn more about this name change, [read this blog post](https://go.microsoft.com/fwlink/p/?linkid=2120533).

## When does the new name take effect?

The new name will appear in Version 2004 onwards, starting on April 21, 2020. For example, you'll see the new name under the **Product Information** section when you go to **File** > **Account** in an Office app, such as Word. 

Older versions of Office 365 ProPlus won't be updated with the new name. For example, if you're using Version 1908 of Semi-Annual Channel, you'll still see Office 365 ProPlus under the **Product Information** section.

References to Microsoft 365 Apps for enterprise will begin to appear on April 21 in other places as well. For example, references on product websites, in documentation, and in the user interface (UI) of deployment tools, such as the Office Customization Tool. Some references to the new name might not occur until after April 21.

## What do admins need to do?

Because of this name change, you might need to adjust some of your existing workflows and update your internal documentation.

### Office Deployment Tool

If you use the Office Deployment Tool to deploy Office 365 ProPlus, the [product ID](configuration-options-for-the-office-2016-deployment-tool.md#product-element) will remain as O365ProPlusRetail. Therefore, you don't have to make any changes to your existing configuration.xml files.

### Update packages used by Configuration Manager

If you use an automatic deployment rule (ADR) to deploy updates by using Configuration Manager, you'll need to make changes to your ADRs if they rely on the "Title" property. That's because the name of update packages in the Microsoft Update Catalog is changing.

Currently, the title of an update package for Office 365 ProPlus begins with "Office 365 Client Update" as seen in the following example:

&nbsp; &nbsp; Office 365 Client Update - Semi-annual Channel Version 1908 for x64 based Edition (Build 11929.20648)

For update packages released on and after June 9, the title will begin with "Microsoft 365 Apps Update" as seen in the following example:

&nbsp; &nbsp; Microsoft 365 Apps Update - Semi-annual Channel Version 1908 for x64 based Edition (Build 11929.50000)

### Registry key values

Some registry key values might change to reflect the new naming. If you rely on these values in your workflows or scripts, you'll want to test your workflows or scripts when the name change begins rolling out on April 21. In general, because registry key values can possibly change in future builds of Office, we don't usually recommend relying on them in your workflows or scripts.