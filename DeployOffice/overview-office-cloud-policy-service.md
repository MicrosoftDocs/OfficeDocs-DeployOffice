---
title: "Overview of the Office cloud policy service for Office 365 ProPlus"
ms.author: jwhit
author: jwhit-MSFT
manager: laurawi
audience: ITPro
ms.topic: article
ms.service: o365-proplus-itpro
localization_priority: Normal
ms.collection: 
- Ent_O365
- M365-modern-desktop
ms.custom: Ent_Office_ProPlus
description: "The Office cloud policy service is a cloud-based service that enables you to enforce policy settings for Office 365 ProPlus on a user’s device, even if the device isn’t domain joined or otherwise managed."
---

# Overview of the Office cloud policy service for Office 365 ProPlus

The Office cloud policy service is a cloud-based service that enables you to enforce policy settings for Office 365 ProPlus on a user’s device, even if the device isn’t domain joined or otherwise managed. The policy settings roam to whichever device the user signs into and uses Office 365 ProPlus or Office for the web. You can also enforce some policy settings for Office for the web, both for users who are signed in and users who access documents anonymously.

The Office cloud policy service is part of a portal for managing Office 365 ProPlus and includes many of the same user-based policy settings that are available when using Group Policy on Windows Server.

Security Policy Advisor, which can be used with Office cloud policy service, is now generally available. You can use Security Policy Advisor to receive and implement security policy recommendations that are based on Microsoft best practices and information about your existing environment. For more information, see [Overview of Security Policy Advisor](overview-of-security-policy-advisor.md).


## Requirements for using the Office cloud policy service

The following are the requirements for using the Office cloud policy service with Office 365 ProPlus:

- At least Version 1808 of Office 365 ProPlus.
- User accounts created in or synchronized to Azure Active Directory (AAD). The user must be signed into Office 365 ProPlus with an AAD-based account.
- Security groups created in or synchronized to Azure Active Directory (AAD), with the appropriate users added to those groups.
- To create a policy configuration, you must be assigned one of the following roles in Azure Active Directory (AAD): Global Administrator, Security Administrator, or Desktop Analytics Administrator.

> [!IMPORTANT]
> The Office cloud policy service isn't available to customers who have the following plans: Office 365 operated by 21Vianet, Office 365 Germany, Office 365 GCC, or Office 365 GCC High and DoD.

## Steps for creating a policy configuration

The following are the basic steps for creating a policy configuration.

1. Sign into the [portal](https://aka.ms/o365clientmgmt), review the terms, and then choose **Accept**.
2. On the **Office Customization** page, choose **Go to Office policy management**.
3. On the **Policy configurations** page, choose **Create**.
4. On the **Create policy configuration** page, do the following:
   - Enter a name.
   - Provide a description (optional).
   - In assignments, choose whether this policy applies to all users of Office 365 ProPlus, or just to users who anonymously access documents using Office for the web.
   - Select the AAD-based security group that is assigned to the policy configuration. Each policy configuration can only be assigned to one group, and each group can only be assigned one policy configuration.
   - Configure the policy settings to be included in the policy configuration. You can search on the policy setting name to find the policy setting that you want to configure. You can also filter on the application and whether the policy has been configured. The platform column indicates whether the policy is applied to Office 365 ProPlus for Windows devices, Office for the web, or all.
5. After you've made your selections, choose **Create**.

To change a policy configuration, select the policy configuration on the **Policy configurations** page, and then choose **Edit**. Make the appropriate changes and then choose **Save**. You can find the configured policies by filtering on status.

If you want to create a new policy configuration that is similar to an existing policy configuration, select the existing policy configuration on the **Policy configurations** page, and then choose **Copy from**. Make the appropriate changes and then choose **Save**.

## Managing policy configurations

The health of each policy configuration, including whether the policy has been applied to the client devices in the group, is shown on the **Policy configurations** page. To see more details about any errors, you can click the health status for a policy configuration.

To see which policies are configured when you are editing a policy configuration, choose **Status**, and then choose **Configured**. You can also filter by application.

To change the priority order for the policy configurations, click **Reorder priority** on the **Policy configurations** page.

## How the policy configuration is applied

The Click-to-Run service used by Office 365 ProPlus checks with the Office cloud policy service on a regular basis to see if there are any policy configurations that pertain to the user. If there are, then the appropriate policy settings are applied and take effect the next time the user opens the Office app, such as Word or Excel.

For example, when a user signs into Office on a device for the first time, a check is immediately made to see if there is a policy configuration that pertains to the user. If the user isn't a member of an AAD group that is assigned a policy configuration, then another check is made again in 24 hours. If the user is a member of an AAD group that is assigned a policy configuration, then the appropriate policy settings are applied and a check is made again in 90 minutes. In the event of an error, a check is made when the user opens an Office app, such as Word or Excel. If no Office apps are running when the next check is scheduled, then the check will be made the next time the user opens an Office app.

If the user is a member of multiple AAD groups with conflicting policy settings, priority is used to determine which policy setting is applied. The highest priority is applied, with “0” being the highest priority that you can assign. You can set the priority by choosing **Reorder priority** on the **Policy configurations** page.

Also, policy settings implemented by using Office cloud policy service take precedence over policy settings implemented by using Group Policy on Windows Server, as well as taking precedence over preference settings or locally applied policy settings.

## Additional information about the Office cloud policy service

- Only user-based policy settings are available. Computer-based policy settings aren’t available.
- Not all user-based policy settings are available. Only user-based policy settings that configure a single value are available currently. Work is being done to make more user-based policy settings available.
- As new user-based policy settings are made available for Office, the Office cloud policy service will automatically add them. There is no need to download updated Administrative Templates files (ADMX/ADML).
- Policy settings from the Office cloud policy service are stored in the registry under HKEY_CURRENT_USER\Software\Policies\Microsoft\Cloud\Office\16.0.
- You can also create policy configurations to apply policy settings for Version 1808 or higher of Project Online Desktop Client or Visio Online Plan 2 (previously named Visio Pro for Office 365).
- Version 1808 of Office 365 ProPlus, Project Online Desktop Client, and Visio Online Plan 2 is available in Monthly Channel, Semi-Annual Channel (Targeted), and Semi-Annual Channel. For Office 365 ProPlus release information, see [Update history for Office 365 ProPlus](https://docs.microsoft.com/officeupdates/update-history-office365-proplus-by-date).
- A policy configuration can’t be applied to other commercial versions of Office that use Click-to-Run, such as Office 365 Business, Office Professional Plus 2019, or Office Standard 2016.

## Troubleshooting tips

If the expected policies haven't been correctly applied to a user's device, try the following:
- Make sure the user is signed into Office 365 ProPlus, has activated it, and has a valid license.
- Make sure the user is part of the appropriate security group. 
- Check the priority of the policy configurations in OCPS.  If the user is in multiple security groups that have policy configurations assigned to them, then the priority of the policy configurations determines which policies take effect. 
- In some cases, policies might not be applied correctly if two users with different policies sign into Office 365 on the same device and during the same Windows session.  

