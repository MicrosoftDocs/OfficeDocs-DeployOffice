---
title: "Microsoft Places Analytics"
ms.author: mactra
author: MachelleTranMSFT
manager: jtremper
ms.date: 05/20/2024
audience: ITPro
ms.topic: conceptual
ms.service: o365-proplus-itpro
ms.collection: Tier3
ms.localizationpriority: medium
recommendations: true
description: "Using Microsoft Places Analytics to improve workplace management by comparing estimated versus actual site data."
---
# Microsoft Places Analytics

Microsoft Places Analytics is designed for real-estate and property managers and admins who need data-driven insights for effective space management. By using Places Analytics, you get a unified view of all your managed spaces, from buildings and rooms to shared workspaces.

You can improve workplace efficiency by comparing planned versus actual attendance by using organization-level data. Discover which desks and rooms are most frequently used and receive suggestions on how to adjust your spaces to better meet your needs. Additionally, Places Analitics helps you identify supply and demand imbalances so that you can allocate resources more effectively.  

Places Analytics also helps you track trends of key buildings, bookable rooms, and shared work spaces. Get metrics at both the floor level and specific room/desk pool level to identify opportunities for optimization. Compare intended usage with actual usage across different space types to understand user behavior patterns. You can use this data to refine your hybrid work and change management policies effectively.

> [!NOTE]
> Places Analytics is an Opt-in feature. For more information, see [Opt in to the Microsoft Places Public Preview](opt-in-places-preview.md).

## Prerequisites

- You must first convert your floor plans for indoor mapping in Microsoft Places using the Azure Maps Creator tool. For more information, see [Azure Maps Creator Guide for Microsoft Places](azure-maps-creator-guide.md).

## Setting up Places Analytics

Access to Places Analytics is based on membership in a mail-enabled security group.

> [!NOTE]
> Adding or removing users should be done through previously created email-enabled security groups. In most cases, adding or removing users should be immediate. Howwver, for some users and security groups new to the tenant (or those that haven't been active), this might take up to one day.

To provide this user experience we recommend using the following mail-enabled security group:

- PlacesAnalyticSG

  This enables additional features and analytics views that help IT admins and RE&F professionals baseline the usage of their space and identify opportunities to optimize.

## Create security groups

You can create security groups in two ways:

- By using the [Exchange admin center](/exchange/exchange-admin-center) and the [Exchange admin center in Exchange Server](/exchange/architecture/client-access/exchange-admin-center?view=exchserver-2019).
- You can also enable Place Analytics by running the New-DistributionGroup PowerShell cmdlet.

### Enable Place Analytics to an email-enabled Security Group  

```powershell
Set-PlacesSettings -Collection Places -SpaceAnalyticsEnabled 'Default:false,OID:<Security Group OID>@<Tenant ID>:true' 
```
> [!NOTE]
> These settings might take up to one day for the group to be fully setup and replicated to the Microsoft Places environment.
