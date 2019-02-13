---
title: "Overview of the Office client policy service (Preview) for Office 365 ProPlus"
ms.author: danbrown
author: DHB-MSFT
manager: laurawi
ms.audience: ITPro
ms.topic: get-started-article
ms.service: o365-proplus-itpro
localization_priority: Normal
ms.collection: Ent_O365
ms.custom: Ent_Office_ProPlus
description: "The Office client policy service is a cloud-based service that enables you to enforce policy settings for Office 365 ProPlus on a user’s device, even if the device isn’t domain joined or otherwise managed."
---

# Overview of the Office client policy service (Preview) for Office 365 ProPlus

> [!IMPORTANT]
> This is pre-release documentation for a preview program that isn’t available to everyone and is subject to change.

The Office client policy service is a cloud-based service that enables you to enforce policy settings for Office 365 ProPlus on a user’s device, even if the device isn’t domain joined or otherwise managed. The policy settings roam to whichever device the user signs into and uses Office 365 ProPlus.

The Office client policy service is part of a portal for managing Office 365 ProPlus and includes many of the same user-based policy settings that are available when using Group Policy on Windows Server.

## Requirements for using the Office client policy service

The following are the requirements for using the Office client policy service with Office 365 ProPlus:

- At least Version 1808 of Office 365 ProPlus.
- User accounts created in or synchronized to Azure Active Directory (AAD). The user must be signed into Office 365 ProPlus with an AAD-based account.
- Security groups created in or synchronized to Azure Active Directory (AAD), with the appropriate users added to those groups.
- To create a policy configuration, you must be assigned one of the following roles in Azure Active Directory (AAD): Global Administrator, Security Administrator, or Desktop Analytics Administrator.

> [!NOTE]
> The Office client policy service (Preview) isn't available to the following:
> - Customers with Office 365 operated by 21Vianet, Office 365 Germany, Office 365 GCC, or Office 365 GCC High and DoD plans.
> - Tenants located in Australia, Brazil, Germany, India, or South Korea.

## Steps for creating a policy configuration

The following are the basic steps for creating a policy configuration.

1. Sign into the [portal](https://aka.ms/o365clientmgmt), review the preview terms, and then choose **Accept**.
2. On the **Office Customization (Preview)** page, choose **Go to Office policy management**.
3. On the **Policy configurations (Preview)** page, choose **Create**.
4. On the **Create policy configuration** page, do the following:
   - Enter a name.
   - Provide a description (optional).
   - Select the AAD-based security group that is assigned to the policy configuration. You can only assign one group to a policy configuration, and a group can only have one policy configuration assigned to it.
   - Configure the policy settings to be included in the policy configuration. You can search on the policy setting name to find the policy setting that you want to configure.
5. After you've made your selections, choose **Create**.

To change a policy configuration, select the policy configuration on the **Policy configurations (Preview)** page, and then choose **Edit**. Make the appropriate changes and then choose **Save**.

If you want to create a new policy configuration that is similar to an existing policy configuration, select the existing policy configuration on the **Policy configurations (Preview)** page, and then choose **Copy from**. Make the appropriate changes and then choose **Save**.


## How the policy configuration is applied

The Click-to-Run service used by Office 365 ProPlus checks with the Office client policy service on a regular basis to see if there are any policy configurations that pertain to the user. If there are, then the appropriate policy settings are applied and take effect the next time the user opens the Office app, such as Word or Excel.

For example, when a user signs into Office on a device for the first time, a check is immediately made to see if there is a policy configuration that pertains to the user. If the user isn't a member of an AAD group that is assigned a policy configuration, then another check is made again in 24 hours. If the user is a member of an AAD group that is assigned a policy configuration, then the appropriate policy settings are applied and a check is made again in 90 minutes. In the event of an error, a check is made when the user opens an Office app, such as Word or Excel. If no Office apps are running when the next check is scheduled, then the check will be made the next time the user opens an Office app.

If the user is a member of multiple AAD groups with conflicting policy settings, priority is used to determine which policy setting is applied. The highest priority is applied, with “0” being the highest priority that you can assign. You can set the priority by choosing **Reorder priority** on the **Policy configurations (Preview)** page.

Also, policy settings implemented by using Office client policy service take precedence over policy settings implemented by using Group Policy on Windows Server, as well as taking precedence over preference settings or locally applied policy settings.

## Additional information about the Office client policy service
- Only user-based policy settings are available. Computer-based policy settings aren’t available.
- Not all user-based policy settings are available. Only user-based policy settings that configure a single value are available currently. Work is being done to make more user-based policy settings available.
- As new user-based policy settings are made available for Office, the Office client policy service will automatically add them. There is no need to download updated Administrative Templates files (ADMX/ADML).
- Policy settings from the Office client policy service are stored in the registry under HKEY_CURRENT_USER\Software\Policies\Microsoft\Cloud\Office\16.0.
- You can also create policy configurations to apply policy settings for Version 1808 or higher of Project Online Desktop Client or Visio Online Plan 2 (previously named Visio Pro for Office 365).
- Version 1808 of Office 365 ProPlus, Project Online Desktop Client, and Visio Online Plan 2 is available in Monthly Channel, Semi-Annual Channel (Targeted), and Semi-Annual Channel. For Office 365 ProPlus release information, see [Update history for Office 365 ProPlus](https://docs.microsoft.com/officeupdates/update-history-office365-proplus-by-date).
- A policy configuration can’t be applied to other commercial versions of Office that use Click-to-Run, such as Office 365 Business, Office Professional Plus 2019, or Office Standard 2016.