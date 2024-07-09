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
- Ensure you have the latest [PowerShell 7](/powershell/scripting/install/installing-powershell-on-windows?view=powershell-7.4&preserve-view=true).

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

Places currently uses [mail-enabled security groups](/exchange/recipients-in-exchange-online/manage-mail-enabled-security-groups) to provide access to features needed by different user groups. In Step 1, you will create the following four security groups:

1. _Places Users_: This group is for users who will have access to the Places Web App. 

1. _Places Advanced Users_: This group is for users who will have access to Places Advanced features like Places Finder, Space Analytics, and Intelligent Booking. Users added to Places Advanced Users group will be part of the Places Users group.

1. _Places Mobile Users_: This is for users who can use the [Places iOS app](/deployoffice/places/configure-the-ios-app). Users added to Places Mobile Users group will be part of the Places Users group and the Places Advanced features group.

1. _Places Analytics Users_: This is for users who need access to [Places Analytics](/deployoffice/places/places-analytics) reports and features. Those added to Places Analytics Users will be part of the Places Users group and the Places Advanced features group.

1. *Places Finder Users*: This is for users who need access to Places Finder features. Those added to Places Finder Users will be part of Places Users group and the Places Advanced features group.

> [!NOTE]
> Advanced Features are Opt-In only. Please visit Please visit __[Opt-in to the Microsoft Places Public Preview Program](/deployoffice/places/opt-in-places-preview)__ for more details.
>
>These security groups can be created without access to advanced features, but users will not be able to use these features until you have opted into advanced features and been notified by the Places team that advanced features are available for your tenant.

## Deploy Places

Once you've completed all prerequisite steps, you're now ready to deploy Places to users in your organization:

### Step 1 - Create Places Security Groups

1. Install the latest [PreparePlacesGroups](https://www.powershellgallery.com/packages/prepareplacesgroups/) script.

2. Open **PowerShell 7** as Administrator.

1. Run the PreparePlacesGroups script.

   You should have the following groups created at the end of this step:

   |Experience / Feature |Group Name|Group smtp address|
   | -------- | -------- | -------- |
   |Basic experience|Places Users [8C8BF34B-6BB8-4441-A911-3A990C9D838B]|placesUsers@contoso.com |
   |Advanced experience|Places Advanced Users [8C8BF34B-6BB8-4441-A911-3A990C9D838B]| placesAdvanced@contoso.com |
   |Places iOS mobile app|Places Mobile Users [8C8BF34B-6BB8-4441-A911-3A990C9D838B]|placesMobile@contoso.com |
   |Space Analytics|Places Analytics Users [8C8BF34B-6BB8-4441-A911-3A990C9D838B]|placesAnalytics@contoso.com |
   |Places Finder |Places Finder Users [8C8BF34B-6BB8-4441-A911-3A990C9D838B] |placesFinder@contoso.com |
   
   
> [!NOTE]
> - This will create all of the security groups outlined above. Depending on your needs, not all security groups will be used.
> - These new security groups may take up to 1 day to be reflected in your Exchange directory and consumed in Places experiences.

### Step 2 - Set up the PowerShell environment for Places

Running the following script installs the Places and Azure module in PowerShell that are needed to run Places cmdlets.

1. Install the latest [PreparePlacesPowershell7](https://www.powershellgallery.com/packages/PreparePlacesPowershell7/) script.

2. Open a new **PowerShell 7** window (separate from Step 1). Currently, Exchange cmdlets and Places cmdlets cannot be executed from the same window.  Therefore, the PowerShell scripts used in Steps 2 and 3 must be executed in a separate window from the script in Step 1.

3.  Run the PreparePlacesPowershell7 script.

### Step 3 - Enable Places

Running the following script will enable the Places Web App and Advanced Features.

1. Install the latest [Prepare-PlacesEnablement](https://www.powershellgallery.com/packages/Prepare-PlacesEnablement/) script.

1. Using the **PowerShell 7** window from Step 2, run the Prepare-PlacesEnablement script.

   - To enable Core only features run:

     ```powershell
     Prepare-PlacesEnablement.ps1 -PlacesWebApp $true 
     ```
 
   - To enable Advanced features run:
   
     ```powershell
     Prepare-PlacesEnablement.ps1 -PlacesWebApp $true -PlacesAdvancedFeatures $true -PlacesAnalytics $true -PlacesMobileApp $true -PlacesFinder $true
     ```
     
### Step 4 - Set up Buildings and Floors

Microsoft Places depends on a fully set up hierarchy among your rooms/workspaces, floors, and buildings. Utilize the steps found in at the [Quick setup guide for buildings/floors](/deployoffice/places/get-started/quick-setup-buildings-floors) to finish setting up your Places Directory. 

## Next Steps

### Add or manage users with Security Groups

Ensure that you have added users to the groups created above. You can add users to Places security groups using any of the following methods:

- Via PowerShell [documented here](/microsoft-365/enterprise/manage-security-groups-with-microsoft-365-powershell).
- Via the Microsoft Admin center [documented here](/microsoft-365/admin/email/create-edit-or-delete-a-security-group).
- Via Microsoft Graph APIs [documented here](/graph/api/resources/groups-overview).

> [!NOTE]
> It may take up to 1 day for membership changes to be reflected in the Places experiences.

### Activate Places clients

You can access Places from your Microsoft 365 apps, wherever you work. See the table below to learn more about activating different clients for Places:

|Client|Details|
|----|----|
|Places on the web|Users in the Places Users, Places Advanced Users, or Places Analytics Users groups can access features on the web [here](https://outlook.office.com/places).|
|Places in Outlook|Users in the Places Users, Places Advanced Users, or Places Analytics Users groups can access features as an app in [Outlook on the web](https://outlook.office.com) or in [the new Outlook for Windows](/exchange/clients-and-mobile-in-exchange-online/outlook-on-the-web/enable-disable-employee-access-new-outlook#enable-or-disable-the-outlook-desktop-new-outlook-toggle).|
|Teams|Users in the Places Users, Places Advanced Users, or Places Analytics Users groups can access features in the [Teams app](/microsoftteams/apps-in-teams) within Teams.  Teams users can also opt in to [Teams Public Preview](/microsoftteams/public-preview-doc-updates?tabs=new-teams-client) to enable additional Places location features in Teams.|
|Places iOS app|Users in the Places Mobile User group can access features in the [iOS app](/DeployOffice/places/configure-the-ios-app).|

## Related topics

[Opt in to the Microsoft Places Public Preview](/deployoffice/places/opt-in-places-preview)

[Configure the Places iOS app](/deployoffice/places/configure-the-ios-app)

[Release notes for Microsoft Teams Rooms](/microsoftteams/rooms/rooms-release-note)

[Microsoft Teams Health and usage reports](/microsoftteams/rooms/health-and-usage-reports)

[Set up Remote Access in Microsoft Teams Rooms Pro Management portal](/microsoftteams/rooms/remotely-access-teams-rooms)
