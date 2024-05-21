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

Microsoft Places Analytics is designed for real estate and facilities (RE&F) managers and admins who need data-driven insights for effective space management. By using Places Analytics, you get a unified view of all your managed spaces, from buildings and rooms to shared workspaces.

You can improve workplace efficiency by comparing planned versus actual attendance using organization-level data. Discover which desks and rooms are most frequently used and receive suggestions on how to adjust your work spaces to better meet your staffing needs. Additionally, Places Analytics helps you identify supply and demand imbalances so that you can allocate resources more effectively.

Places Analytics also helps you track trends for key buildings, bookable rooms, and shared work spaces. To identify opportunities for optimization, you can get metrics at both the floor level and specific room and shared desk-space level. To understand user-behavior patterns, you can compare projected use with actual use across different space types. You can use this data to refine your hybrid work scheduling and change-management policies.

> [!NOTE]
> Places Analytics is an opt-in feature. For more information, see [Opt in to the Microsoft Places Public Preview](opt-in-places-preview.md).

## Prerequisites

- You must first convert your floor plans for indoor mapping in Microsoft Places using the Azure Maps Creator tool. For more information, see [Azure Maps Creator Guide for Microsoft Places](azure-maps-creator-guide.md).

## Setting up Places Analytics

Access to Places Analytics is based on membership in mail-enabled security groups.

> [!NOTE]
> Adding or removing users should be done through previously created mail-enabled security groups. In most cases, adding or removing users should take effect immediately. However, for some users and security groups new to the tenant (or those who haven't been active), this might take up to one day.

To provide this user experience, we recommend using the following mail-enabled security group:

- PlacesAnalyticSG

  This enables more features and analytics views that help IT admins and real estate and facilities (RE&F) professionals determine the usage baseline for their spaces and identify opportunities for optimization.

## Create security groups

You can create security groups in two ways:

- Using the [Exchange admin center](/exchange/exchange-admin-center) and the [Exchange admin center in Exchange Server](/exchange/architecture/client-access/exchange-admin-center).
- Enabling Place Analytics by running the New-DistributionGroup PowerShell cmdlet. For more information, see [New-DistributionGroup](/powershell/module/exchange/new-distributiongroup).

### Enable Place Analytics to a mail-enabled Security Group

You can enable Places Analytics for a mail-enabled security group by running the following PowerShell cmdlet:

```powershell
Set-PlacesSettings -Collection Places -SpaceAnalyticsEnabled 'Default:false,OID:<Security Group OID>@<Tenant ID>:true' 
```

> [!NOTE]
> These settings might take up to one day for a security group to be fully setup and replicated to the Microsoft Places environment.
