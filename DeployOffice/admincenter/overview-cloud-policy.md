---
title: "Overview of Cloud Policy service for Microsoft 365"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
ms.reviewer: chhopkin
audience: ITPro
ms.topic: article
ms.service: o365-proplus-itpro
ms.localizationpriority: medium
ms.collection: Tier1
recommendations: true
description: "Cloud Policy lets you enforce policy settings for Microsoft 365 Apps for enterprise on a user's device, even if the device isn't domain joined or otherwise managed."
ms.date: 03/01/2023
---

# Overview of Cloud Policy service for Microsoft 365

> [!NOTE]
> "Office cloud policy service" has been renamed to "Cloud Policy service for Microsoft 365." In most cases, we'll just refer to it as Cloud Policy.

[Cloud Policy service for Microsoft 365](https://config.office.com/officeSettings/officePolicies) lets you enforce policy settings for Microsoft 365 Apps for enterprise on a user's device, even if the device isn't domain joined or otherwise managed. When a user signs into Microsoft 365 Apps for enterprise on a device, the policy settings roam to that device. Policy settings are available for devices running Windows, macOS, iOS, and Android, although not all policy settings are available for all operating systems. You can also enforce some policy settings for Office for the web, both for users who are signed in and for users who access documents anonymously.

Cloud Policy is part of the [Microsoft 365 Apps admin center](https://config.office.com/). The service includes many of the same user-based policy settings that are available in Group Policy. You can also use Cloud Policy directly in the [Microsoft Intune admin center](https://go.microsoft.com/fwlink/p/?linkid=2109431), under **Apps** > **Policy** > **Policies for Office apps**.  

When you create policy configurations, you can review and apply policies that are recommended by Microsoft as security baseline policies. These recommendations are marked as "Security Baseline" when selecting policies.

## Requirements for using Cloud Policy

The following are the requirements for using Cloud Policy with Microsoft 365 Apps for enterprise:

- A [supported version](/officeupdates/update-history-microsoft365-apps-by-date#supported-versions) of Microsoft 365 Apps for enterprise.
- User accounts created in or synchronized to Azure Active Directory (Azure AD). The user must be signed into Microsoft 365 Apps for enterprise with an Azure AD-based account.
- Cloud Policy supports Microsoft 365 Groups and Azure AD Security Groups created in or synchronized to Azure AD. The membership type can be either Dynamic or Assigned.
- To create a policy configuration, you must be assigned one of the following roles in Azure AD: Global Administrator, Security Administrator, or Office Apps Admin.
- The [required URLs and IP address ranges](/microsoft-365/enterprise/urls-and-ip-address-ranges#microsoft-365-common-and-office-online) must be properly configured on your network.
- Authenticated proxies aren’t supported by Cloud Policy service.

> [!IMPORTANT]
> - Cloud Policy isn't available to customers who have the following plans: Office 365 operated by 21Vianet, Office 365 GCC, or Office 365 GCC High and DoD.
> - A policy configuration can't be applied to volume licensed versions of Office that use Click-to-Run, such as Office LTSC Professional Plus 2021 or Office Standard 2019.
> - You can create a policy configuration for Microsoft 365 Apps for business, but only policy settings related to privacy controls are supported. For more information, see [Use policy settings to manage privacy controls for Microsoft 365 Apps for enterprise](../privacy/manage-privacy-controls.md).

## Steps for creating a policy configuration

The following are the basic steps for creating a policy configuration.

1. Sign in to the [Microsoft 365 Apps admin center](https://config.office.com/). If you're using the admin center for the first time, review the terms. Then, select **Accept**.
2. Under **Customization**, select **Policy Management**.
3. On the **Policy configurations** page, select **Create**.
4. On the **Start with the basics** page, enter a name (required) and a description (optional), then select **Next**.
5.	On the **Choose the scope** page, choose whether the policy configuration applies to a specific group or to users who anonymously access documents using Office for the web.
6. If the policy configuration applies to a specific group, select the group. Each policy configuration can only be assigned to one group, and each group can only be assigned one policy configuration. But the group that you select can contain other (nested) groups.
7. After you’ve made your selection, select **Next**.
8.	On the **Configure Settings** page, select the policies that you want to include in the policy configuration. You can search for the policy by name, or you can create a custom filter. You can filter on platform, by application, on whether the policy has been configured, and on whether the policy is a recommended security baseline.
9. After you've made your selections, select **Next** to review your selections. Then select **Create** to create the policy configuration.

## Managing policy configurations

To change a policy configuration, select the policy configuration on the **Policy configurations** page.  This will open the policy configuration. Make the appropriate changes and then navigate to the **Review and publish** page and select **Update**.

If you want to create a new policy configuration that is similar to an existing policy configuration, select the existing policy configuration on the **Policy configurations** page, and then select **Copy**. Make the appropriate changes and then select **Create**.

To see which policies are configured when you're editing a policy configuration, navigate to the **Policies** section and filter by the **Status** column or select the **Configured** slicer at the top of the policy table. You can also filter by application and platform.

To change the priority order for the policy configurations, select **Reorder priority** on the **Policy configurations** page.

If you want to export a policy configuration, select the existing policy configuration on the **Policy configurations** page, and then select **Export**.  This will generate a CSV file for download.

## How the policy configuration is applied

The Click-to-Run service used by Microsoft 365 Apps for enterprise checks with Cloud Policy regularly to see if there are any policy configurations that pertain to the user. If there are, then the appropriate policy settings are applied and take effect the next time the user opens the Office app, such as Word or Excel.

Here's a summary of what happens:
- When a user signs into Office on a device for the first time, a check is immediately made to see if there's a policy configuration that pertains to the user.

- If the user isn't a member of an Azure AD group that is assigned a policy configuration, then another check is made again in 24 hours.

- If the user is a member of an Azure AD group that is assigned a policy configuration, then the appropriate policy settings are applied. A check is made again in 90 minutes.

- If there are any changes to the policy configuration since the last check, then the appropriate policy settings are applied and another check is made again in 90 minutes.

- If there aren't any changes to the policy configuration since the last check, another check is made again in 24 hours.

- If there's an error, a check is made when the user opens an Office app, such as Word or Excel.

- If no Office apps are running when the next check is scheduled, then the check will be made the next time the user opens an Office app.

> [!NOTE]
> - Policies from Cloud Policy are applied only when the Office app is restarted. The behavior is the same as with Group Policy. For Windows devices, policies are enforced based on the primary user that is signed into Microsoft 365 Apps for enterprise. If there are multiple accounts signed in, only policies for the primary account are applied. If the primary account is switched, most of the policies assigned to that account will not apply until the Office apps are restarted. Some policies related to [privacy controls](../privacy/overview-privacy-controls.md) will apply without restarting any Office apps.
>
> - If users are located in nested groups and the parent group is targeted for policies, the users in the nested groups will receive the policies. The nested groups and the users in those nested groups must be created in or synchronized to Azure AD.

If the user is a member of multiple Azure AD groups with conflicting policy settings, priority is used to determine which policy setting is applied. The highest priority is applied, with "0" being the highest priority that you can assign. You can set the priority by choosing **Reorder priority** on the **Policy configurations** page.

Also, policy settings implemented by using Cloud Policy take precedence over policy settings implemented by using Group Policy on Windows Server, and taking precedence over preference settings or locally applied policy settings.

## Additional information about Cloud Policy

- Only user-based policy settings are available. Computer-based policy settings aren't available.
- As new user-based policy settings are made available for Office, Cloud Policy will automatically add them. There's no need to download updated Administrative Templates files (ADMX/ADML).
- You can also create policy configurations to apply policy settings for supported versions of the desktop apps that come with subscription plans of Project and Visio.
- The health status feature was retired in the second half of March 2022. In the future (no known date at this time), we plan to provide advanced health reporting and compliance monitoring features for Cloud Policy.

## Troubleshooting tips

If the expected policies haven't been correctly applied to a user's device, try the following actions:
- Make sure the user is signed into Microsoft 365 Apps for enterprise, has activated it, and has a valid license.

- Make sure the user is part of the appropriate security group.

- Verify you are not using an authenticated proxy.

- Check the priority of the policy configurations. If the user is in multiple security groups that have policy configurations assigned to them, then the priority of the policy configurations determines which policies take effect.

- In some cases, policies might not be applied correctly if two users with different policies sign into Office on the same device during the same Windows session.  

- Policy settings retrieved from Cloud Policy are stored in the Windows registry under HKEY_CURRENT_USER\Software\Policies\Microsoft\Cloud\Office\16.0. This key is overwritten each time a new set of policies is retrieved from the policy service during the check-in process.

- Policy service check-in activity is stored in the Windows registry under HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\Common\CloudPolicy. Deleting this key and restarting the Office apps will trigger the policy service to check in the next time an Office app is launched.

- If you want to see the next time a device running Windows is scheduled to check with Cloud Policy, look at the FetchInterval under HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\Common\CloudPolicy. The value is expressed in minutes. For example, 1440, which equates to 24 hours.  

- You may encounter a FetchInterval value of 0.  If this value exists, the client will wait 24 hours from the last check in before attempting to check with Cloud Policy again.
