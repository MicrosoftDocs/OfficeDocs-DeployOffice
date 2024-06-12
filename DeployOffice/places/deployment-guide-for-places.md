---
title: "Deployment guide for Places"
ms.author: mactra
author: MachelleTranMSFT
manager: jtremper
ms.date: 06/05/2024
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

> [!NOTE]
> Microsoft Places is in Public Preview – not all features are immediately available. Advanced Features require tenants to opt-in.  Please visit [Opt-in to the Microsoft Places Public Preview Program](/deployoffice/places/opt-in-places-preview) for more details.
> 
> Users will not be able to use advanced features until you have opted into advanced features and been notified by the Places team that advanced features are available for your tenant.
## Prerequisites

Before onboarding Places, complete the following prerequisites:

- Be assigned the [Exchange administrator role](/microsoft-365/admin/add-users/about-exchange-online-admin-role) to manage Exchange-related configurations for Places.
- Ensure you have the latest [PowerShell](/powershell/scripting/install/installing-powershell-on-windows?view=powershell-7.4&preserve-view=true).
- Verify you have one of the following subscriptions:

  - Microsoft 365 Business Basic
  - Microsoft 365 Business Standard
  - Microsoft 365 Business Premium
  - Microsoft 365 or Office 365 (E1, E3, E5)
  - Microsoft 365 or Office 365 (A1, A3, A5)
  - Microsoft 365 Frontline Worker (F1, F3)
    
> [!NOTE]
> More information on feature availability by license type will be shared as we get closer to general availability.

## Overview of Places Security Groups

Places currently uses [mail-enabled security groups](/exchange/recipients-in-exchange-online/manage-mail-enabled-security-groups) to provide access to features needed by different user groups. The script that follows in step 1 will create following four security groups:

1. _Places Users_: Add users to this group to allow access the Places Web App. 

1. _Places Advanced Users_: This group is for users who will have access to Places Advanced features like Places Finder, Space Analytics, and Intelligent Booking. Users added to Places Advanced Users will be part of the Places Users group.

1. _Places Mobile Users_: This is for users who can use the [Places iOS app](/deployoffice/places/configure-the-ios-app). Users added to Places Mobile Users group will be part of the Places Users group and the Places Advanced features group.

1. _Places Analytics Users_: This is for users who need access to [Places Analytics](/deployoffice/places/places-analytics) reports and features. Those added to Places Analytics Users will be part of the Places Users group and the Places Advanced features group.

> [!NOTE]
> Advanced Features are Opt-In only. Please visit Please visit __[Opt-in to the Microsoft Places Public Preview Program](/deployoffice/places/opt-in-places-preview)__ for more details.
>
>These security groups can be created without access to advanced features, but users will not be able to use these features until you have opted into advanced features and been notified by the Places team that advanced features are available for your tenant.

## Deploy Places

Once you've completed all prerequisite steps, you're now ready to deploy Places to users in your organization:

### Step 1 - Install Places Scripts

1. Ensure you have the latest [PowerShell](/powershell/scripting/install/installing-powershell-on-windows?view=powershell-7.4&preserve-view=true).
1. Open **PowerShell 7** as Administrator.

1. Install [PowerShell Gallery | PreparePlacesGroups 1.0](https://www.powershellgallery.com/packages/PreparePlacesGroups/1.0"https://www.powershellgallery.com/packages/prepareplacesgroups/1.0") to your local machine.

1. Install [PowerShell Gallery | PreparePlacesPowershell7 1.0](https://www.powershellgallery.com/packages/PreparePlacesPowershell7/1.0"https://www.powershellgallery.com/packages/prepareplacespowershell7/1.0")to your local machine.

1. Install [PowerShell Gallery | Prepare-PlacesEnablement 1.0](https://www.powershellgallery.com/packages/Prepare-PlacesEnablement/1.0"https://www.powershellgallery.com/packages/prepare-placesenablement/1.0") to your local machine

### Step 2 - Create Places Security Groups

1. Open **Windows PowerShell** as Administrator.

1. Run the PreparePlacesGroups script.

You should have the following groups created at the end of this step:


| Experience / Feature |Group Name|Group smtp address|
| -------- | -------- | -------- |
| Basic experience   | Places Users [8C8BF34B-6BB8-4441-A911-3A990C9D838B] | placesUsers@contoso.com |
| Advanced experience | Places Advanced Users [8C8BF34B-6BB8-4441-A911-3A990C9D838B] | placesAdvanced@contoso.com |
| Places iOS mobile app | Places Mobile Users [8C8BF34B-6BB8-4441-A911-3A990C9D838B] | placesMobile@contoso.com | 
| Space Analytics   | Places Analytics Users [8C8BF34B-6BB8-4441-A911-3A990C9D838B]   | placesAnalytics@contoso.com |


> [!NOTE]
> - This will create all of the security groups outlined above. Depending on your needs, not all security groups will be used.
> - Changes made when managing users in existing mail-enabled security groups are immediate.
> - Users and security groups that are either new to the tenant or previously inactive can take up to 1 day for changes to reflect.

### Step 3 - Setup the PowerShell environment for Places

Running the following script installs the Places and Azure module in PowerShell that are needed to run Places cmdlets.

1. Open **PowerShell 7** as Administrator

1. Run PreparePlacesPowershell7

### Step 4 - Enable Places

Running the following script will enable the Places Web App and Advanced Features.

1. Using the **PowerShell 7** window from Step 3.

1. Install the Places module by running the following command in PowerShell:

```powershell
./Prepare-PlacesEnablement.ps1 -PlacesWebApp $true -PlacesAdvancedFeatures $true -PlacesAnalytics $true -PlacesMobileApp $true
```

> [!NOTE]
> It can take up to 1 day for users to gain access to the features.

## Add or manage users with Security Groups

If you are using security groups for access to Places, ensure that you have added users to those groups. You can add users to Places security groups using any of the following methods:

- Via PowerShell [documented here](/microsoft-365/enterprise/manage-security-groups-with-microsoft-365-powershell?view=o365-worldwide).
- Via the Microsoft Admin center [documented here](/microsoft-365/admin/email/create-edit-or-delete-a-security-group?view=o365-worldwide).
- Via Microsoft Graph APIs [documented here](/graph/api/resources/groups-overview?view=graph-rest-1.0&tabs=http).

## Activate additional clients

You can access the Places MetaOS app from Outlook web, the new Outlook for Windows, and Teams.

See the table below to learn more about activating different clients for Places:

|Client|Result|
|----|----|
|Outlook|Places features are available in the latest version of [Outlook](/exchange/clients-and-mobile-in-exchange-online/outlook-on-the-web/enable-disable-employee-access-new-outlook#enable-or-disable-the-outlook-desktop-new-outlook-toggle).|
|Teams|Places is available as a [Teams app](/microsoftteams/apps-in-teams) within Teams and you can opt in to [Teams Public Preview](/microsoftteams/public-preview-doc-updates?tabs=new-teams-client) to enable Places location aware features in Teams.|
|Places iOS app|The Places mobile experience is available as an [iOS app](/DeployOffice/places/configure-the-ios-app).|

## Related topics

[Opt in to the Microsoft Places Public Preview](/deployoffice/places/opt-in-places-preview)

[Configure the Places iOS app](/deployoffice/places/configure-the-ios-app)

[Release notes for Microsoft Teams Rooms](/microsoftteams/rooms/rooms-release-note)

[Microsoft Teams Health and usage reports](/microsoftteams/rooms/health-and-usage-reports)

[Set up Remote Access in Microsoft Teams Rooms Pro Management portal](/microsoftteams/rooms/remotely-access-teams-rooms)
