---
title: "Overview of the Office cloud policy service for Microsoft 365 Apps for enterprise"
ms.author: danbrown
author: DHB-MSFT
manager: dougeby
audience: ITPro
ms.topic: article
ms.service: o365-proplus-itpro
ms.localizationpriority: medium
ms.collection: 
- Ent_O365
- M365-modern-desktop
- m365initiative-coredeploy
ms.custom: Ent_Office_ProPlus
recommendations: true
description: "The Office cloud policy service lets you enforce policy settings for Microsoft 365 Apps for enterprise on a user's device, even if the device isn't domain joined or otherwise managed."
---

# Overview of the Office cloud policy service for Microsoft 365 Apps for enterprise

The [Office cloud policy service](https://config.office.com/) lets you enforce policy settings for Microsoft 365 Apps for enterprise (previously named Office 365 ProPlus) on a user's device, even if the device isn't domain joined or otherwise managed. When a user signs into Microsoft 365 Apps for enterprise on a device, the policy settings roam to that device. You can also enforce some policy settings for Office for the web, both for users who are signed in and for users who access documents anonymously.

The Office cloud policy service is part of a [portal](https://config.office.com/) for managing Microsoft 365 Apps for enterprise. The service includes many of the same user-based policy settings that are available in Group Policy. You can also use the Office cloud policy service directly in the [Microsoft Endpoint Manager admin center](https://endpoint.microsoft.com), under **Apps** > **Policy** > **Policies for Office apps**.  

When you create policy configurations, you can review and apply policies that are recommended by Microsoft as security baseline policies. These recommendations are marked as "Security Baseline" when selecting policies.


## Requirements for using the Office cloud policy service

The following are the requirements for using the Office cloud policy service with Microsoft 365 Apps for enterprise:

- At least Version 1808 of Microsoft 365 Apps for enterprise.
- User accounts created in or synchronized to Azure Active Directory (Azure AD). The user must be signed into Microsoft 365 Apps for enterprise with an Azure AD-based account.
- Office cloud policy service supports security groups and mail-enabled security groups created in or synchronized to Azure AD. The membership type can be either Dynamic or Assigned.
- To create a policy configuration, you must be assigned one of the following roles in Azure AD: Global Administrator, Security Administrator, or Office Apps Admin. The role must be assigned to your user account. Currently, Azure AD roles assigned to groups aren't supported by the Office cloud policy service.
- The [required URLs and IP address ranges](/microsoft-365/enterprise/urls-and-ip-address-ranges#microsoft-365-common-and-office-online) must be properly configured on your network.

> [!IMPORTANT]
> - The Office cloud policy service isn't available to customers who have the following plans: Office 365 operated by 21Vianet, Office 365 GCC, or Office 365 GCC High and DoD.
> - A policy configuration can't be applied to volume licensed versions of Office that use Click-to-Run, such as Office LTSC Professional Plus 2021 or Office Standard 2019.
> - You can create a policy configuration for Microsoft 365 Apps for business, but only policy settings related to privacy controls are supported. For more information, see [Use policy settings to manage privacy controls for Microsoft 365 Apps for enterprise](../privacy/manage-privacy-controls.md).

## Steps for creating a policy configuration

The following are the basic steps for creating a policy configuration.

1. Sign into the [portal](https://config.office.com/), review the terms, and then choose **Accept**.
2. Under **Customization**, choose **Policy Management**.
3. On the **Policy configurations** page, choose **Create**.
4. On the **Create policy configuration** page, do the following:
   - Enter a name.
   - Provide a description (optional).
   - In assignments, choose whether this policy applies to all users of Microsoft 365 Apps for enterprise, or just to users who anonymously access documents using Office for the web.
   - Select the Azure AD-based security group that is assigned to the policy configuration. Each policy configuration can only be assigned to one group, and each group can only be assigned one policy configuration.
   - Configure the policy settings to be included in the policy configuration. You can search on the policy setting name to find the policy setting that you want to configure. You can also filter on the application, on whether the policy is a recommended security baseline, and on whether the policy has been configured. The platform column indicates whether the policy is applied to Microsoft 365 Apps for enterprise for Windows devices, Office for the web, or all.
5. After you've made your selections, choose **Create**.

To change a policy configuration, select the policy configuration on the **Policy configurations** page, and then choose **Edit**. Make the appropriate changes and then choose **Save**. You can find the configured policies by filtering on status.

If you want to create a new policy configuration that is similar to an existing policy configuration, select the existing policy configuration on the **Policy configurations** page, and then choose **Copy from**. Make the appropriate changes and then choose **Save**.

## Managing policy configurations

The health of each policy configuration, including whether the policy has been applied to the client devices in the group, is shown on the **Policy configurations** page. To see more details about any errors, you can select the health status for a policy configuration.

> [!NOTE]
> The health status feature will be retired in the second half of March 2022. In the future (no known date at this time), we plan to provide advanced health reporting and compliance monitoring features for the Office cloud policy service.

To see which policies are configured when you're editing a policy configuration, choose **Status**, and then choose **Configured**. You can also filter by application.

To change the priority order for the policy configurations, select **Reorder priority** on the **Policy configurations** page.

## How the policy configuration is applied

The Click-to-Run service used by Microsoft 365 Apps for enterprise checks with the Office cloud policy service on a regular basis to see if there are any policy configurations that pertain to the user. If there are, then the appropriate policy settings are applied and take effect the next time the user opens the Office app, such as Word or Excel. 

For example, when a user signs into Office on a device for the first time, a check is immediately made to see if there's a policy configuration that pertains to the user. If the user isn't a member of an Azure AD group that is assigned a policy configuration, then another check is made again in 24 hours. If the user is a member of an Azure AD group that is assigned a policy configuration, then the appropriate policy settings are applied and a check is made again in 90 minutes. In the event of an error, a check is made when the user opens an Office app, such as Word or Excel. If no Office apps are running when the next check is scheduled, then the check will be made the next time the user opens an Office app.

> [!NOTE]
> Policies from the Office cloud policy service are applied only when the Office app is restarted. The behavior is the same as with Group Policy. For Windows devices, policies are enforced based on the primary user that is signed into Microsoft 365 Apps for enterprise.  If there are multiple accounts signed in, only policies for the primary account are applied.  If the primary account is switched, most of the policies assigned to that account will not apply until the Office apps are restarted. Some policies related to [privacy controls](../privacy/overview-privacy-controls.md) will apply without restarting any Office apps. 

If the user is a member of multiple Azure AD groups with conflicting policy settings, priority is used to determine which policy setting is applied. The highest priority is applied, with "0" being the highest priority that you can assign. You can set the priority by choosing **Reorder priority** on the **Policy configurations** page.

Also, policy settings implemented by using Office cloud policy service take precedence over policy settings implemented by using Group Policy on Windows Server, as well as taking precedence over preference settings or locally applied policy settings.

## Additional information about the Office cloud policy service

- Only user-based policy settings are available. Computer-based policy settings aren't available.
- As new user-based policy settings are made available for Office, the Office cloud policy service will automatically add them. There's no need to download updated Administrative Templates files (ADMX/ADML).
- You can also create policy configurations to apply policy settings for Version 1808 or later of the subscription versions of the Project and Visio desktop apps.
- Version 1808 of Microsoft 365 Apps for enterprise (and for the subscription versions of the Project and Visio desktop apps) is available in Current Channel, Monthly Enterprise Channel, Semi-Annual Enterprise Channel (Preview), and Semi-Annual Enterprise Channel. For Microsoft 365 Apps for enterprise release information, see [Update history for Microsoft 365 Apps](/officeupdates/update-history-microsoft365-apps-by-date).
- If users are located in nested groups and the parent group is targeted for policies, the users in the nested groups will receive the policies.
- The Office Cloud policies can be applied for Windows, MAC, iOS and Android platforms. For MAC, iOS and Android if the policy is available only then it can be applied.

## Troubleshooting tips

If the expected policies haven't been correctly applied to a user's device, try the following:
- Make sure the user is signed into Microsoft 365 Apps for enterprise, has activated it, and has a valid license.
- Make sure the user is part of the appropriate security group.
- Check the priority of the policy configurations. If the user is in multiple security groups that have policy configurations assigned to them, then the priority of the policy configurations determines which policies take effect. 
- In some cases, policies might not be applied correctly if two users with different policies sign into Office 365 on the same device and during the same Windows session.  
- Policy settings retrieved from the Office cloud policy service are stored in the registry under HKEY_CURRENT_USER\Software\Policies\Microsoft\Cloud\Office\16.0. This key is overwritten each time a new set of policies is retrieved from the policy service during the check-in process.
- Policy service check-in activity is stored in the registry under HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\Common\CloudPolicy. Deleting this key and restarting the Office apps will trigger the policy service to check in the next time an Office app is launched.
