---
title: "Deployment guide for Places"
ms.author: mactra
author: MachelleTranMSFT
manager: jtremper
ms.date: 05/13/2024
audience: ITPro
ms.topic: conceptual
ms.service: o365-proplus-itpro
ms.collection: Tier3
ms.localizationpriority: medium
recommendations: true
description: "Provides Office admins with an overview of how to deploy Microsoft Places to users in their organization."
---

# Deployment guide for Microsoft Places

## Getting started with Microsoft Places

Microsoft Places lets you introduce more flexible work within your organization as an IT administrator. Integrated with Microsoft 365, Microsoft Places helps your users make informed decisions about their work dynamics, which can lead to increased productivity and enhanced collaboration.

This deployment guide shows you how to onboard your tenant to Places by ensuring the following steps are performed:

- [Prerequisite step 1 – Confirm Exchange permissions](#prerequisite-step-1---confirm-exchange-permissions)
- [Prerequisite step 2 – Update PowerShell](#prerequisite-step-2---update-powershell)
- [Prerequisite step 3 – Install the Microsoft Places module](#prerequisite-step-3---install-the-microsoft-places-module)
- [Step 1 - Enable core tenant experience for Microsoft Places](#step-1---initiate-microsoft-places)
- [Step 2 – Assign users to security groups](#step-2---assign-users-to-security-groups)
- [Step 3 – Activate clients](#step-3---activate-clients)

### Understanding the core solutions

Microsoft Places offers three key solution pillars to optimize your work environment:

**Coordinate your work locations** - Enable your employees to efficiently coordinate their work locations and schedules. They can book workspaces and meeting rooms, prioritize engagements with collaborators, and foster connections with ease.

**Modernize your workplace** - Keep your workforce updated about on-site events, colleague presence, and building activities through real-time location awareness. Utilize interactive maps to navigate the workplace seamlessly and explore available amenities and services.

**Optimize your physical environment** - Use data-driven insights to streamline operations and reduce costs. Analyze usage trends to maximize space effectiveness and promote sustainability throughout your workplace.

### Request for access to opt-in functionality

Places has features that are available through an opt-in. See (link) for more information.

## Prerequisites

Microsoft Places requires one of the following subscriptions:

- Microsoft 365 Business Standard
- Microsoft 365 Business Premium
- Microsoft 365 E3
- Microsoft 365 E5
- Microsoft 365 A3
- Microsoft 365 A5
- Microsoft 365 E3, E5, A3, or A5 Extra Features, when combined with a corresponding Office 365 or Microsoft 365 plan.

Before onboarding Microsoft Places, ensure the completion of the following prerequisites for a streamlined deployment:

### Prerequisite step 1 - Confirm Exchange permissions

Microsoft Places relies on Exchange mailboxes as the foundational infrastructure for coordinating schedules and booking resources such as rooms or workspaces. IT Admins must be assigned the Exchange administrator role to manage Exchange-related configurations for Microsoft Places.

Places cmdlets that manage your tenant settings or other places like Building and Floor require the **TenantPlacesManagement** role.

Use the following cmdlet to evaluate what roles are currently assigned:

```powershell
Get-ManagementRoleAssignment -Role TenantPlacesManagement -GetEffectiveUsers | Where {$_.EffectiveUserName -Eq "Adele Vance"}
```

### Prerequisite step 2 - Update PowerShell

To configure capabilities and enable users with Microsoft Places, ensure the latest version of PowerShell is installed to PowerShell 7. Follow these steps to update your PowerShell:

1. Run the following command in PowerShell: `winget search Microsoft.PowerShell`.

2. Run the following command to install PowerShell or PowerShell Preview using the ID parameter:

    `winget install --id Microsoft.Powershell --source winget`

    `winget install --id Microsoft.Powershell.Preview --source winget`

### Prerequisite step 3 - Install the Microsoft Places module

1. Run PowerShell (v7).
2. Install the latest Places PowerShell client using the following cmdlet:

    `Install-Module –Name MicrosoftPlaces –AllowPrerelease -Force`

> [!IMPORTANT]
> It is critical to include the -Force parameter to ensure it does not attempt to read from any cached content.

## Deploy

Once you've completed all prerequisite steps, you're now ready to deploy Places to users in your organization:

### Step 1 - Initiate Microsoft Places and coordinate work locations

These steps will provide Places to your users and enable Workplans. This will help facilitate hybrid work coordination, employees can communicate their work location (e.g. 'in-office' or 'remote') for specific days of the week via Workplans.

These cmdlets are available to tenants to enable or onboard to Places Public Preview. By default, the Calendar features will be available to users. The following cmdlets are used by the tenant admins to enable buildings, apps, and location sharing controls.

> [!NOTE]
> When a setting is added or changed, please wait for 1 day for the settings to replicate.

> [!NOTE]
> Microsoft Places cmdlets must be run in a separate window than the Exchange PowerShell cmdlets. If you use proxies, see [PowerShell documentation](/powershell/module/microsoft.powershell.utility/invoke-webrequest) for more information.

As the Exchange administrator, you can enable Places to all members of your tenant or to a select subset via mail-enabled security group.

#### Enable Places for all users in your tenant

```powershell
Connect-MicrosoftPlaces    
```

#### Enable Places Web app and Places Mobile app for all users

```powershell
Set-PlacesSettings -Collection Places -EnablePlacesMobileApp 'Default:true'
Set-PlacesSettings -Collection Places -EnablePlacesWebApp 'Default:true'
```

#### Enable Places to a subset of users in your tenant

Places can be enabled to a specific set of users by utilizing mail-enabled security groups. The **PlaceUserSG** can be utilized to enable Places functionality for specific employees within your company.

> [!NOTE]
> You must add or remove users through the mail-enabled security groups created - in most cases this should be immediate, but for users and SGs new to the tenant (or have not been active) this could take up to 1 day.

#### Connect to the Microsoft Places service in PowerShell

```powershell
Connect-MicrosoftPlaces 
Connect-ExchangeOnline
```

#### Enable Places to a mail-enabled security group

Run the following command to enable Places for a mail-enabled security group which includes all users requiring access to Places and users in the analytics group:

```powershell
Set-PlacesSettings -Collection Places -PlacesEnabled 'Default:false,OID:<Security Group OID>@<Tenant ID>:true'
```

> [!NOTE]
> It may take up to 13 hours for users to gain access.

### Step 2 - Activate clients

#### Enable the Places Web App

 The Places Web app is turned off by default. To ensure the WebApp is enabled for all users run the following cmdlet:

```powershell
Set-PlacesSettings -Collection Places -EnablePlacesWeb ‘Default:false,OID<PlacesUserSG OID>@<TID>:true’
```

#### Deploy new Outlook

Features from Places are available in the latest version of Outlook. For more information on how to enable these features, see [Enable users for the Outlook for Windows](/Exchange/ExchangeOnline/clients-and-mobile-in-exchange-online/outlook-on-the-web)

#### Enable Location-Aware features

Location-Aware features are available through Teams. By opting into the Teams Public Preview ring, your users gain location-aware services allowing them to:

- View nearby colleagues based on their current location.
- Chat with nearby colleagues using the @nearby mention.
- Manage their location sharing controls.

To opt in to the Teams Public Preview Ring, see [Microsoft Teams Public preview for more information](/microsoftteams/public-preview-doc-updates?tabs=new-teams-client#enable-public-preview).

#### Publish the Places Teams app

Places is available as a Teams app within Team and Outlook. Steps to enable MetaOS Apps in Teams and Outlook can be found in [Manage your apps in the Microsoft Teams admin center](/microsoftteams/manage-apps).

#### Configure the iOS app for compliant distribution

The iOS app is an opt-in feature. For more information, see [Microsoft Places](https://www.microsoft.com/microsoft-places).

## Related articles
