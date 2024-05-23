---
title: "Deployment guide for Places"
ms.author: mactra
author: MachelleTranMSFT
manager: jtremper
ms.date: 05/15/2024
audience: ITPro
ms.topic: conceptual
ms.service: o365-proplus-itpro
ms.collection: Tier3
ms.localizationpriority: medium
recommendations: true
description: "Provides Office admins with an overview of how to deploy Microsoft Places to users in their organization."
---

# Deployment guide for Microsoft Places (preview)

Microsoft Places Public Preview lets you introduce more flexible work within your organization as an IT administrator. Integrated with Microsoft 365, Places helps users make informed decisions about their work dynamics, which can lead to increased productivity and enhanced collaboration. For more information, see [Microsoft Places](https://www.microsoft.com/microsoft-places).

## Prerequisites

Before onboarding Places, complete the following prerequisites:

- Be assigned the [Exchange administrator role](/microsoft-365/admin/add-users/about-exchange-online-admin-role) to manage Exchange-related configurations for Places.
- Ensure you have the latest [PowerShell](/powershell/scripting/install/installing-powershell-on-windows?view=powershell-7.4&preserve-view=true).
- Verify you have one of the following subscriptions:

  - Microsoft 365 Business Standard
  - Microsoft 365 Business Premium
  - Microsoft 365 or Office 365 (E1, E3, E5)
  - Microsoft 365 or Office 365 (A1, A3, A5)

> [!NOTE]
> More information on feature availability by license type will be shared as we get closer to general availability.

## Deploy Places

Once you've completed all prerequisite steps, you're now ready to deploy Places to users in your organization:

### Step 1 - Install the Places module

You can install the Places module by running the following command in PowerShell:

```powershell
Install-Module -Name MicrosoftPlaces -AllowPrerelease -Force
```

> [!IMPORTANT]
> You must include the -Force parameter to prevent cached content from being read.

### Step 2 - Enable Places

Enabling Places and Workplans lets you facilitate hybrid work coordination in your tenant. With Workplans, employees can specify their work location such as in-office or remote.

Use the following commands to enable buildings, apps, and location sharing controls when onboarding your tenant to Places Public Preview.

Places can be enabled to a specific set of users by utilizing [mail-enabled security groups](/exchange/recipients-in-exchange-online/manage-mail-enabled-security-groups).

> [!NOTE]
>
> - Changes made when managing users in existing mail-enabled security groups are immediate.
> - Users and security groups that are either new to the tenant or previously inactive can take up to 1 day for changes to reflect.

Connect to the Microsoft Places service in a new PowerShell and enable Places for a mail-enabled security group by running the following command:

```powershell
Connect-MicrosoftPlaces 
Set-PlacesSettings -Collection Places -EnablePlacesWebApp  ‘Default:false,OID:<OID of Mail-enabled Security Group>@<Tenant ID>:true’
```

> [!NOTE]
> It can take up to 1 day for users to gain access to the features.

### Step 3 - Activate additional clients

See the table below to learn more about activating different clients for Places:

|Client|Result|
|----|----|
|Outlook|Places features are available in the latest version of [Outlook](/exchange/clients-and-mobile-in-exchange-online/outlook-on-the-web/enable-disable-employee-access-new-outlook#enable-or-disable-the-outlook-desktop-new-outlook-toggle).|
|Teams|Places is available as a [Teams app](/microsoftteams/apps-in-teams) within Teams and you can opt in to [Teams Public Preview](/microsoftteams/public-preview-doc-updates?tabs=new-teams-client) to enable Places location aware features in Teams.|

## Related topics

[Opt in to the Microsoft Places Public Preview](/deployoffice/places/opt-in-places-preview)

[Configure the Places iOS app](/deployoffice/places/configure-the-ios-app)

[Release notes for Microsoft Teams Rooms](/microsoftteams/rooms/rooms-release-note)

[Microsoft Teams Health and usage reports](/microsoftteams/rooms/health-and-usage-reports)

[Set up Remote Access in Microsoft Teams Rooms Pro Management portal](/microsoftteams/rooms/remotely-access-teams-rooms)
