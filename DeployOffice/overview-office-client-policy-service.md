---
title: "Overview of the Office client policy service (Preview)"
ms.author: danbrown
author: DHB-MSFT
manager: laurawi
ms.audience: ITPro
ms.topic: get-started-article
ms.service: o365-proplus-itpro
localization_priority: Normal
ms.collection: Ent_O365
ms.custom: Ent_Office_ProPlus
description: "The Office client policy service (Preview) is a cloud-based service that enables you to enforce policy settings for Office 365 ProPlus on a user’s device, even if the device isn’t domain joined or otherwise managed."
---

# Overview of the Office client policy service (Preview)

> [!IMPORTANT]
> This is pre-release documentation for a preview program that isn’t available to everyone and is subject to change.

The Office client policy service (Preview) is a cloud-based service that enables you to enforce policy settings for Office 365 ProPlus on a user’s device, even if the device isn’t domain joined or otherwise managed. The policy settings roam to whichever device the user signs into and uses Office 365 ProPlus.

The Office client policy service (Preview) is part of a portal for managing Office 365 ProPlus and includes many of the same user-based policy settings that are available when using Group Policy on Windows Server.

## Requirements for using the Office client policy service (Preview)

The following are the requirements for using the Office client policy service (Preview):

- Access to the portal, with membership in the Client Administrator, Security Administrator, or Global Administrator role.
- At least Version 1808 of Office 365 ProPlus, Project Online Desktop Client, or Visio Online Plan 2 (previously named Visio Pro for Office 365).
- User accounts created in Azure Active Directory (AAD). The user must be signed into Office 365 ProPlus with an AAD-based account.
- Security groups created in Azure Active Directory (AAD), with the appropriate users added to those security groups.


## Basic steps for creating a policy configuration

The following are the basic steps for creating a policy configuration.

1. Sign into the [portal](http://aka.ms/o365clientmgmt), and then go to **Policy configuration**.
2. On the **Policy configurations** page, choose **Create**.
3. On the **Create policy configuration** page, do the following:
   - Enter a name.
   - Provide a description (optional).
   - Select the security group that is assigned to the policy configuration. You can only assign one security group to a policy configuration, and a security group can only have one policy configuration assigned to it.
   - Configure the policy settings to be included in the policy configuration. You can search on the policy setting name to find the policy setting that you want to configure.
4. After you've made selections, choose **Create**.

To change a policy configuration, select the policy configuration on the **Policy configurations** page, and then choose **Edit**. Make the appropriate changes and then choose **Save**.

If you want to create a new policy configuration that is similar existing policy configuration, select the existing policy configuration on the **Policy configurations** page, and then choose **Copy from**. Make the appropriate changes and then choose **Save**.


## How the policy configuration is applied

The Click-to-Run service used by Office 365 ProPlus checks with the Office client policy service (Preview) on a regular basis to see if there are any policy configurations that need to be applied for the user, and then applies them. For example, a check is made when the user opens an Office app, such as Word or Excel. If an applicable policy configuration is found for the user, the policy settings are applied and a check is made again in 30 minutes to see if there are any changes. If an applicable policy configuration isn't found for the user, another check is made again in 24 hours.

If the user is a member of multiple security groups with conflicting policy settings, priority is used to determine which policy setting is applied. The highest priority is applied, with “0” being the highest priority that you can assign. You can set the priority by choosing **Reorder priority** on the **Policy configurations** page.

Also, policy settings implemented by using Office client policy service (Preview) take precedence over policy settings implemented by using Group Policy on Windows Server, as well as taking precedence over preference settings or locally applied policy settings.

## Additional information about the Office client policy service (Preview)

- Only user-based policy settings are available. Computer-based policy settings aren’t available.
- Not all user-based policy settings are available. Only user-based policy settings that configure a single value are available currently. Work is being done to make more policy settings available.
- As new user-based policy settings are made available for Office, the Office client policy service (Preview) will automatically add them. There is no need to download updated Administrative Templates files (ADMX/ADML).
- Policy settings from the Office client policy service (Preview) are stored in the registry under HKEY_CURRENT_USER\Software\Policies\Microsoft\Cloud\Office\16.0.
- Version 1808 of Office 365 ProPlus, Project Online Desktop Client, and Visio Online Plan 2 is currently available in Monthly Channel and Semi-Annual Channel (Targeted) and is scheduled to be available in Semi-Annual Channel in January 2019.
- A policy configuration can’t be applied to other commercial versions of Office that use Click-to-Run, such as Office 365 Business, Office Professional Plus 2019, or Office Standard 2016.
- The Office client policy service (Preview) isn’t available in the following Office 365 environments: Office 365 operated by 21Vianet, Office 365 Germany, Office 365 GCC, or Office 365 GCC High and DoD.
