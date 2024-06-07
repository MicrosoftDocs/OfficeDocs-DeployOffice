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

### Prerequisites

> [!NOTE]
> Places Analytics is an opt-in feature. For more information, see [Opt in to the Microsoft Places Public Preview](opt-in-places-preview.md).

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


## Enable buildings for Places Analytics

Once the buildings are onboarded to Places, they need to be enabled for Analytics. This lets you view building analytics and the associated rooms and Deskpool analytics in Space Analytics.
By default, none of the onboarded buildings are enabled for Analytics. Follow the steps below to enable buildings in analytics.

### Prerequisites
> [!NOTE]
> - Setup steps for settings cmdlet: [Deployment guide for Places](deployment-guide-for-places.md)
> - Setup steps for Get-PlaceV3 cmdlet: [Get-PlaceV3](./powershell/get-placev3.md)

## Powershell scripts/Steps
Admins can obtain BuildingIds for all onboarded buildings by running Get-PlaceV3 cmdlet
**Get-PlaceV3 -Type Building**

Once the BuildingIds (PlaceID) are obtained, need to run the Set-PlacesSettings cmdlet with -SpaceAnalyticsBuildingsList parameter like below. The Scope always will be “Default” which means by default, the relevant values will be used which were passed in the scope.

```powershell
Set-PlacesSettings -Collection Places -SpaceAnalyticsBuildingsList "Default:<building guid1>;<building guid2>…"
```
The valid values for settings are

- Empty string: No buildings enabled for analytics (default setting)
```powershell
Set-PlacesSettings -Collection Places -SpaceAnalyticsBuildingsList "Default:"
```
- BuildingIDs: Selected buildings enabled for analytics
```powershell
Set-PlacesSettings -Collection Places -SpaceAnalyticsBuildingsList "Default:fcdc5abe-d9e6-402d-a56c-d8154d353062;da320b58-bb43-4c71-8409-87f45276a3b8"
```
- All buildings: All onboarded buildings to Places are enabled for analyics
```powershell
Set-PlacesSettings -Collection Places -SpaceAnalyticsBuildingsList "Default:All"
```

For viewing the settings, Get-PlacesSettings can be used. The time to reflect is up to ~12 hours for all settings in setting service.
**Get-PlacesSettings -Collection Places -SpaceAnalyticsBuildingsList**

> [!NOTE]
> - It can take ~12 hrs for the setting to get reflected in UI.
> - Suggested limit for number of buildings in settings is 200.

