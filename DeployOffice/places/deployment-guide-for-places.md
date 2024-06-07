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
> Microsoft Places is in Public Preview – not all features are immediately available.  Advanced Features require tenants to opt-in.  Please visit [Opt-in to the Microsoft Places Public Preview Program](/deployoffice/places/opt-in-places-preview) for more details.
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

Places currently uses [mail-enabled security groups](/exchange/recipients-in-exchange-online/manage-mail-enabled-security-groups) to provide access to features needed by different user groups.   The script that follows in step 1 will create following four security groups:

1. <u>Places Users</u>: Add users to this group to allow access the Places Web App.

   1. <u>Places Advanced Users</u>: This group is for users who will have access to Places Advanced features like Places Finder, Space Analytics, and Intelligent Booking. Users added to Places Advanced Users will be part of the Places Users group.
      
   1. <u>Places Mobile Users</u>: This is for users who can use the [Places iOS app](/deployoffice/places/configure-the-ios-app). Users added to Places Mobile Users group will be part of the Places Users group and the Places Advanced features group.
   
      1. <u>Places Analytics Users</u>: This is for users who need access to [Places Analytics](/deployoffice/places/places-analytics) reports and features. Those added to Places Analytics Users will be part of the Places Users group and the Places Advanced features group.
            
> [!NOTE]
> Advanced Features are Opt-In only.  Please visit Please visit [Opt-in to the Microsoft Places Public Preview Program](/deployoffice/places/opt-in-places-preview) for more details.
> 
> These security groups can be created without access to advanced features, but users will not be able to use these features until you have opted into advanced features and been notified by the Places team that advanced features are available for your tenant.

## Deploy Places

Once you've completed all prerequisite steps, you're now ready to deploy Places to users in your organization:

### Step 1 - Create Places Security Groups

1. Download [PreparePlacesGroups.ps1](https://microsoft-my.sharepoint-df.com/:u:/p/jayam/Ecsqrlqz8RFHqtyhkAlNVKEBYWnHZvW7F-fdtLpfuwyuQQ?e=FINCW2)

1. Run __Windows PowerShell__ as Administrator.

1. Run PreparePlacesGroups.ps1

1. Now that security groups have been created users can be added to these groups as appropriate:

   ·       Via PowerShell [documented here](/microsoft-365/enterprise/manage-security-groups-with-microsoft-365-powershell?view=o365-worldwide).
   
   ·       Via the Microsoft Admin center [documented here](/microsoft-365/admin/email/create-edit-or-delete-a-security-group?view=o365-worldwide).
   
   ·       Via Microsoft Graph APIs [documented here](/graph/api/resources/groups-overview?view=graph-rest-1.0&tabs=http).
   
> [!NOTE]
> - This will create all of the security groups outlined above. Depending on your needs, not all security groups must be used.
> - Changes made when managing users in existing mail-enabled security groups are immediate.
> - Users and security groups that are either new to the tenant or previously inactive can take up to 1 day for changes to reflect.

### Step 2 - Set up the PowerShell environment for Places

Running the following script installs the Places and Azure module in PowerShell that are needed to run Places cmdlets.  

1. Download [PreparePlacesPowershell7.ps1](https://microsoft-my.sharepoint-df.com/:u:/p/jayam/EXgGzVC0PUxBushlErnXNNYBBZu_8vI8dUtyMOxuQ32ilw?e=2hHDRr)

1. [Ensure you have the latest PowerShell](/powershell/scripting/install/installing-powershell-on-windows?view=powershell-7.4&preserve-view=true).

1. Open __PowerShell 7__ as Administrator

1. Run PreparePlacesPowershell7.ps1



### Step 3 - Enabling Places

Running the following script will enable the Places Web App and Advanced Features.

> [!NOTE]
> Advanced Features require tenants to opt-in.  Please visit [Opt-in to the Microsoft Places Public Preview Program](/deployoffice/places/opt-in-places-preview) for more details.
>These features can be enabled, but users will not have access to these features until you have opted into advanced features and been notified by the Places team that advanced features are available for your tenant.

1. Download [Prepare-PlacesEnablement.ps1](https://microsoft-my.sharepoint-df.com/:u:/p/jayam/Ec2Kbzmc9AdNieKZeDIvz0cBbrPWL-OtAw3I6Ps_aPp_Hg?e=Kcf7I9)

1. Using the **PowerShell 7** window from Step 2.

1. Run Prepare-PlacesEnablement.psi


|__Administrator: PowerShell 7__|
| .\Prepare-PlacesEnablement.ps1 -PlacesWebApp $true -PlacesAdvancedFeatures $true -PlacesAnalytics $true -PlacesMobileApp $true|

---
 

> [!NOTE]
> It can take up to 1 day for users to gain access to the features.
### Step 4 - Activate additional clients

See the table below to learn more about activating different clients for Places:

|Client|Result|
|----|----|
|Outlook|Places features are available in the latest version of [Outlook](/exchange/clients-and-mobile-in-exchange-online/outlook-on-the-web/enable-disable-employee-access-new-outlook#enable-or-disable-the-outlook-desktop-new-outlook-toggle).|
|Teams|Places is available as a [Teams app](/microsoftteams/apps-in-teams) within Teams and you can opt in to [Teams Public Preview](/microsoftteams/public-preview-doc-updates?tabs=new-teams-client) to enable Places location aware features in Teams.|
|Places iOS app| The Places mobile experience is available as an [iOS app](/DeployOffice/places/configure-the-ios-app).|

## Related topics

[Opt in to the Microsoft Places Public Preview](/deployoffice/places/opt-in-places-preview)

[Configure the Places iOS app](/deployoffice/places/configure-the-ios-app)

[Release notes for Microsoft Teams Rooms](/microsoftteams/rooms/rooms-release-note)

[Microsoft Teams Health and usage reports](/microsoftteams/rooms/health-and-usage-reports)

[Set up Remote Access in Microsoft Teams Rooms Pro Management portal](/microsoftteams/rooms/remotely-access-teams-rooms)
