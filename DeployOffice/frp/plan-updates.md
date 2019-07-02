---
title: "Plan for ongoing updates to Office 365 ProPlus"
ms.author: danbrown
author: DHB-MSFT
manager: laurawi
audience: ITPro
ms.topic: article
ms.service: o365-proplus-itpro
localization_priority: None
ms.custom: Ent_Office_FRP
ROBOTS: NOINDEX, NOFOLLOW
---

# Plan for ongoing updates to Office 365 ProPlus

> [!NOTE]
> This is pre-release documentation for a preview program that isn’t available to everyone and is subject to change.

To help your customers organization prepare for a Semi-Annual Channel release, Microsoft provides the Semi-Annual Channel (Targeted). The primary purpose of this update channel is to give pilot users and application compatibility testers in the organization a chance to work with the upcoming Semi-Annual Channel release. During this time, which is about four months, you might identify possible issues that need to be fixed with line-of-business applications, add-ins, or macros or that you want Microsoft to fix. It's a fully supported version of Office 365 ProPlus.

## Configure devices to use Semi-Annual Channel (Targeted)
To configure the update channel for an Office 365 ProPlus installation, you can use the latest version of the Office Deployment Tool or use the Group Policy Administrative Template files (ADMX/ADML) for Office. We recommend you use a representative sample of devices from across your customers environment.

If you use the Office Deployment Tool, you can use the Channel attribute in the configuration.xml file. The Channel attribute can be specified in the Add element or the Update element. The relevant values are "Monthly" for Monthly Channel, "Broad" for Semi-Annual Channel, and "Targeted" for Semi-Annual Channel (Targeted).

[Learn more about the different channels Office uses to deliver updates to customers](https://docs.microsoft.com/deployoffice/overview-of-update-channels-for-office-365-proplus)
