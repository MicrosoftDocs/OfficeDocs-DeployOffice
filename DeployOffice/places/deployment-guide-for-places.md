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

- Prerequisite step 1 – Confirm Exchange permissions
- Prerequisite step 2 – Update PowerShell
- Prerequisite step 3 – Gather onboarding information
- Prerequisite step 4 – Install the Microsoft Places module
- Step 1 - Enable core tenant experience for Microsoft Places
- Step 2 – Assign users to security groups
- Step 3 – Activate clients

### Understanding the core solutions

Microsoft Places offers three key solution pillars to optimize your work environment:

1. Coordinate your work locations: Enable your employees to efficiently coordinate their work locations and schedules. They can book workspaces and meeting rooms, prioritize engagements with collaborators, and foster connections with ease.
2. Modernize your workplace: Keep your workforce updated about on-site events, colleague presence, and building activities through real-time location awareness. Utilize interactive maps to navigate the workplace seamlessly and explore available amenities and services.
3. Optimize your physical environment: Use data-driven insights to streamline operations and reduce costs. Analyze usage trends to maximize space effectiveness and promote sustainability throughout your workplace.

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

### Prerequisite step 2 - Update PowerShell

To configure capabilities and enable users with Microsoft Places efficiently, ensure the latest version of PowerShell is installed to PowerShell 7. Follow these steps to update your PowerShell:

1. Run the following command in PowerShell: `winget search Microsoft.PowerShell`.

2. Run the following command to install PowerShell or PowerShell Preview using the ID parameter:

    `winget install --id Microsoft.Powershell --source winget`

    `winget install --id Microsoft.Powershell.Preview --source winget`

### Prerequisite step 3 - Install the Microsoft Places module

1. Run PowerShell (v7)
2. Install the latest Places PowerShell client using the following cmdlet:

    `Install-Module –Name MicrosoftPlaces –AllowPrerelease -Force`

> [!IMPORTANT]
> It is critical to include the -Force parameter to ensure it does not attempt to read from any cached content.

## Deploy

Once you've completed all prerequisite steps, you're now ready to deploy Places to users in your organization:

### Step 1 - Initiate Microsoft Places

These cmdlets are available to tenants to enable or onboard to Places Public Preview. By default, the Calendar features are available to users. The following cmdlets are used by the tenant admins to enable buildings, apps, and location sharing controls.

> [!NOTE]
> When a setting is added or changed, please wait for 1 day for the settings to replicate.

> [!NOTE]
> Microsoft Places cmdlets must be run in a separate window than the Exchange PowerShell cmdlets. If you use proxies, see [PowerShell documentation](https://learn.microsoft.com/powershell/module/microsoft.powershell.utility/invoke-webrequest?view=powershell-7.4) for more information.

Run the following commands to:

- Connect to Places in PowerShell:
`Connect-MicrosoftPlaces`

- Collect existing places (signals the Places Directory to create OS tables and set up the routing tables so that buildings can be provisioned): `Set-PlacesSettings -Collection Places -EnableBuildings ‘Default:true’
Global default = false`

- Enable features in the Places Web App: `Set-PlacesSettings -Collection Places -EnablePlacesWeb ‘Default:false,OID<SG OID>@<TID>:true
Global default = false`.

### Step 2 - Assign users to security groups

Adding or removing users should be through the security group (SG) created - in most cases this should be immediate, but for users and security groups new to the tenant (or haven't been active) this could take up to 12 hours.

#### Create security groups

You should create security groups with the users you plan to pilot to Places. You can add or remove users with security groups and have control over which user gets to access Places.

You can create security groups in two ways – Through Exchange Admin Center (EAC User Interface) or via PowerShell:

1. Create a security group through Exchange Admin Center:
<https://admin.exchange.microsoft.com/#/groups>

> [!NOTE]
> If using UI, "Exchange Admin Center" must be used to create security groups, instead of the "Microsoft Admin Center" or (Entra AC allows also creating some groups), the default "Admin" app linked in the Left Top nav.

2. Run the following commands to create security groups using PowerShell:

```powershell
Install-Module -Name ExchangeOnlineManagement 
Connect-ExchangeOnline
```

```powershell
New-DistributionGroup PlacesEnabledGroup -Alias PlacesEnabledGroup -DisplayName " Places Enabled Group“ -CopyOwnerToMember -Description " Group of users that is allowed to use Places app" -ManagedBy admin -Members admin,Liz,Sam,Tom -Type Security 
Get-DistributionGroup PlacesEnabledGroup | ft Name, external*
Connect-ExchangeOnline
```

```powershell
New-DistributionGroup PlacesEnabledGroup -Alias PlacesEnabledGroup -DisplayName " Places Enabled Group“ -CopyOwnerToMember -Description " Group of users that is allowed to use Places app" -ManagedBy admin -Members admin,Liz,Sam,Tom -Type Security 
Get-DistributionGroup PlacesEnabledGroup | ft Name, external*
```

Getting the OID:

```powershell
Get-DistributionGroup <SG Alias> | fl Name,PrimarySmtpAddress,ExternalDirectoryObjectId
```

The following table shows the format you'd use to create the security group for Places:

| Security group | OID |
|---------|---------|
|PlaceUserSG|5b290d16-e231-4091-8177-9f3c9bd93712|

#### Enable users

As the Exchange administrator, you can enable Places for all members of your tenant or for a select subset via mail-enabled security group.

#### Enable Places for all users in your tenant

Places can be rolled out to all users in your tenant by running the following cmdlet:

```powershell
Set-PlacesSettings -Collection Places -EnablePlacesMobileApp 'Default:true'
Set-PlacesSettings -Collection Places -EnablePlacesWebApp 'Default:true'
```

#### Enable Places to a subset of users in your tenant

> [!NOTE]
> It can take up to 24 hours for settings to take effect. Adding or removing users should be through the security groups created - in most cases this should be immediate, but for users and security groups new to the tenant (or have not been active) this could take up to 24 hours.

1. Connect to the Microsoft Places service in PowerShell:

    ```powershell
    Connect-MicrosoftPlaces 
    Connect-ExchangeOnline
    ```

2. Enable Place Web to a security group (this should include all users that need access to Places, including those in analytics group):

    ```powershell
    Set-PlacesSettings -Collection Places -PlacesEnabled 'Default:false,OID:<Security Group OID>@<Tenant ID>:true' 
    ```

3. Check Current Settings to validate that the security group is Places.PlacesEnabled and Places.SpacesAnalyticsEnabled

    ```powershell
    Get-PlacesSettings -Collection Places -ReadFromPrimary | FL
    ```

### Step 3 - Activate clients

#### Enable the Places Web App

 The Places Web app is turned off by default. It should have already been turned on in "Enable Users" step. To ensure the WebApp is enabled for all users, run the following cmdlet:

```powershell
Set-PlacesSettings -Collection Places -EnablePlacesWeb ‘Default:false,OID<PlacesUserSG OID>@<TID>:true’
```

#### Deploy new Outlook

Features from Places are available in the latest version of Outlook. To enable these, utilize these details how to enable users for the Outlook for Windows.

#### Enable Location-Aware features

Location-Aware features are available through Teams. By opting into the Teams Public Preview ring, your users gain location-aware services allowing them to:

- View nearby colleagues based on their current location.
- Chat with nearby colleagues using the @nearby mention.
- Manage their location sharing controls.

To opt in to the Teams Public Preview Ring, see [Microsoft Teams Public preview for more information](https://learn.microsoft.com/microsoftteams/public-preview-doc-updates?tabs=new-teams-client#enable-public-preview).

#### Publish the Places Teams app

Places is available as a Teams app within Team and Outlook. Steps to enable MetaOS Apps in Teams and Outlook can be found in [Manage your apps in the Microsoft Teams admin center](https://learn.microsoft.com/microsoftteams/manage-apps).

#### Configure the iOS app for compliant distribution

The iOS app is an opt-in feature. For more information, see [Microsoft Places](https://www.microsoft.com/microsoft-places).

## Related articles
