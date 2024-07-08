---
title: "Microsoft Places Analytics"
ms.author: mactra
author: MachelleTranMSFT
manager: jtremper
ms.date: 06/07/2024
audience: ITPro
ms.topic: conceptual
ms.service: o365-proplus-itpro
ms.collection: Tier3
ms.localizationpriority: medium
recommendations: true
description: "Using Microsoft Places Analytics to improve workplace management by comparing estimated versus actual site data."
---
# Microsoft Places Analytics

Microsoft Places Analytics is designed for real estate and facilities managers and admins who need data-driven insights for effective space management. By using Places Analytics, you get a unified view of all your managed spaces, from buildings and rooms to shared workspaces.

You can improve workplace efficiency by comparing planned versus actual attendance using organization-level data. Discover which desks and rooms are most frequently used and receive suggestions on how to adjust your work spaces to better meet your staffing needs. Additionally, Places Analytics helps you identify supply and demand imbalances so that you can allocate resources more effectively.

Places Analytics also helps you track trends for key buildings, bookable rooms, and shared work spaces. To identify opportunities for optimization, you can get metrics at both the floor level and specific room and shared desk-space level. To understand user-behavior patterns, you can compare projected use with actual use across different space types. You can use this data to refine your hybrid work scheduling and change-management policies.

### Prerequisites

> [!NOTE]
> Places Analytics is an opt-in feature. For more information, see [Opt in to the Microsoft Places Public Preview](opt-in-places-preview.md).

## Setting up Places Analytics

### Add users to the Analytics Security Group

Access to Places Analytics is based on membership in mail-enabled security groups.  To provide this user experience, we recommend adding users to the following mail-enabled security group, which was created in Step 1 of the [Places Deployment Guide](/deployoffice/places/deployment-guide-for-places):

- PlacesAnalyticSG

This group enables more features and analytics views. These views help IT admins and real estate and facilities professionals determine the usage baseline for their spaces and identify opportunities for optimization.



You can add users to Places security groups using any of the following methods:

- Via PowerShell [documented here](/microsoft-365/enterprise/manage-security-groups-with-microsoft-365-powershell).

- Via the Microsoft Admin center [documented here](/microsoft-365/admin/email/create-edit-or-delete-a-security-group).

- Via Microsoft Graph APIs [documented here](/graph/api/resources/groups-overview).

> [!NOTE]
> Adding or removing users should be done through previously created mail-enabled security groups. In most cases, adding or removing users should take effect immediately. However, for some users and security groups new to the tenant (or those who haven't been active), this might take up to one day.

## Enable buildings for Places Analytics

Once the buildings are onboarded to Places, they need to be enabled for Analytics. This lets you view building analytics and the associated rooms and Deskpool analytics in Space Analytics.
By default, none of the onboarded buildings are enabled for Analytics. Follow the steps to enable buildings in analytics.

### Prerequisites

> [!NOTE]
> - Setup steps for settings cmdlet: [Deployment guide for Places](deployment-guide-for-places.md)
> - Setup steps for Get-PlaceV3 cmdlet: [Get-PlaceV3](./powershell/get-placev3.md)

### PowerShell scripts/Steps

Admins can obtain BuildingIds for all onboarded buildings by running Get-PlaceV3 cmdlet
**Get-PlaceV3 -Type Building**

Once you obtain the BuildingIds (PlaceID), run the Set-PlacesSettings cmdlet with the -SpaceAnalyticsBuildingsList parameter. The scope is "Default," so the relevant values you passed in the scope are used by default.

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
- All buildings: All onboarded buildings to Places are enabled for analytics
```powershell
Set-PlacesSettings -Collection Places -SpaceAnalyticsBuildingsList "Default:All"
```

To view the settings, Get-PlacesSettings can be used. 

**Get-PlacesSettings -Collection Places -SpaceAnalyticsBuildingsList**

> [!NOTE]
> - It can take ~12 hrs for the setting to get reflected in UI.
> - Suggested limit for number of buildings in settings is 200.


