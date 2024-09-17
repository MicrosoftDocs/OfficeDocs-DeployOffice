---
title: "Overview of Cloud Policy service for Microsoft 365"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
ms.reviewer: chhopkin
audience: ITPro
ms.topic: conceptual
ms.service: o365-proplus-itpro
ms.localizationpriority: medium
ms.collection: Tier1
recommendations: true
description: "Cloud Policy lets you enforce policy settings for Microsoft 365 Apps for enterprise on a user's device, even if the device isn't domain joined or otherwise managed."
ms.date: 09/17/2024
---

# Overview of Cloud Policy service for Microsoft 365

> [!NOTE]
> "Office cloud policy service" has been renamed to "Cloud Policy service for Microsoft 365." In most cases, we'll just refer to it as Cloud Policy.

[Cloud Policy service for Microsoft 365](https://config.office.com/officeSettings/officePolicies) lets you enforce policy settings for Microsoft 365 Apps for enterprise on a user's device, even if the device isn't domain joined or otherwise managed. When a user signs into Microsoft 365 Apps for enterprise on a device, the policy settings roam to that device. Policy settings are available for devices running Windows, macOS, iOS, and Android, although not all policy settings are available for all operating systems. You can also enforce some policy settings for Office for the web and Loop, both for guest users who are signed in and for users who access documents anonymously.

Cloud Policy is part of the [Microsoft 365 Apps admin center](https://config.office.com/). The service includes many of the same user-based policy settings that are available in Group Policy. You can also use Cloud Policy directly in the [Microsoft Intune admin center](https://go.microsoft.com/fwlink/p/?linkid=2109431), under **Apps** > **Policy** > **Policies for Office apps**.  

## Requirements

### Supported built-in admin roles
<!--Using include for adding requirements-->
[!INCLUDE [Roles requirements](./includes/requirements-roles.md)]

### Licensing requirements

Your user must be assigned to one of the following subscription plans:

| Type       | Subscription Plan |
| ---------- | ----------------- |
| Education  | <li>Microsoft 365 A3</li><li>Microsoft 365 A5</li> |
| Business   | <li>Microsoft 365 Business Standard</li><li>Microsoft 365 Business Premium</li> |
| Enterprise | <li>Office 365 E3</li><li>Office 365 E5</li><li>Microsoft 365 E3</li><li>Microsoft 365 E5</li> |
| Government | <li>Microsoft 365 G3</li><li>Microsoft 365 G5</li> |

> [!IMPORTANT]
> The following plans are not supported:
> - Microsoft 365 operated by 21Vianet
> - Microsoft 365 GCC High and DoD

> [!NOTE]
> - Any subscription plan that includes Exchange, SharePoint, or Microsoft Office will allow access to the Cloud Policy service.
> - A policy configuration can't be applied to volume licensed versions of Office that use Click-to-Run, such as Office LTSC Professional Plus 2021 or Office Standard 2019.
> - You can create a policy configuration for Microsoft 365 Apps for business, but only policy settings related to privacy controls are supported. For more information, see [Use policy settings to manage privacy controls for Microsoft 365 Apps for enterprise](../privacy/manage-privacy-controls.md).

### Product version requirements
<!--Using include for adding requirements-->
[!INCLUDE [Version requirements](./includes/requirements-versions.md)]

### Network requirements
<!--Using include for adding requirements-->
[!INCLUDE [Network requirements](./includes/requirements-network.md)]

### Microsoft Entra groups requirements
Cloud Policy Service supports the use of [Microsoft Entra groups](/entra/fundamentals/concept-learn-about-groups) with the following requirements:

- Policies only apply to **user objects**. 
- **User objects** must be present in Microsoft Entra ID and have a [supported license](#licensing-requirements) assigned.
- Nested groups support up to three levels deep.
- A group might contain both **device objects** and **user objects**, but the **device objects** will be ignored.

## Steps for creating a policy configuration

The following are the basic steps for creating a policy configuration.

1. Sign in to the [Microsoft 365 Apps admin center](https://config.office.com/). If you're using the admin center for the first time, review the terms. Then, select **Accept**.
2. Under **Customization**, select **Policy Management**.
3. On the **Policy configurations** page, select **Create**.
4. On the **Start with the basics** page, enter a name (required) and a description (optional), then select **Next**.
5. On the **Choose the scope** page, determine whether the policy configuration applies to all users, specific groups, or to users who anonymously access documents using Office for the web.
6. If the policy configuration applies to specific groups, you can now add multiple groups to a single policy configuration for more flexible targeting. To add groups, select **Add Groups** and choose the relevant groups. Adding multiple groups to a single policy configuration allows for the same group to be included in multiple policy configurations, facilitating a more streamlined and efficient policy management process.
7. After making your selection, choose **Next**.
8. On the **Configure Settings** page, select the policies that you want to include in the policy configuration. You can search for the policy by name, or you can create a custom filter. You can filter on platform, by application, on whether the policy is configured, and on whether the policy is a recommended security baseline.
9. After making your selections, select **Next** to review your selections. Then select **Create** to create the policy configuration.


## Managing policy configurations

To change a policy configuration:

1. Go to the **Policy configurations** page.
2. Open the configuration details of the policy you want to change by selecting it.
3. Make the appropriate changes to the policy configuration.
4. Navigate to the **Review and publish** page.
5. Select **Update** to save and apply your changes.

If you want to create a new policy configuration that is similar to an existing policy configuration, select the existing policy configuration on the **Policy configurations** page, and then select **Copy**. Make the appropriate changes and then select **Create**.

To see which policies are configured when you're editing a policy configuration, navigate to the **Policies** section and filter by the **Status** column or select the **Configured** slicer at the top of the policy table. You can also filter by application and platform.

To change the priority order for the policy configurations, select **Reorder priority** on the **Policy configurations** page.

If you want to export a policy configuration, select the existing policy configuration on the **Policy configurations** page, and then select **Export**.  This action generates a CSV file for download.

## How the policy configuration is applied

The Click-to-Run service used by Microsoft 365 Apps for enterprise checks in with the Cloud Policy service regularly to see if there are any policies that pertain to the signed in user. If there are, then the appropriate policies are applied and take effect the next time the user opens an Office app, such as Word or Excel.

- When an Office app is launched or the signed in user changes, the Click-to-Run service determines if it is time to retrieve policies for the signed in user.
    - If this is the user’s first sign in, the check-in call is made to retrieve policies for the signed in user.
    - If the user has previously signed in, the check-in call is made only if the check-in interval has lapsed.
- When the service receives the check-in call, Microsoft Entra group membership is determined for the user.
    - If the user isn't a member of a Microsoft Entra group that is assigned a policy configuration, the service informs Click-to-Run to check back in 24 hours for this user.
    - If the user is a member of a Microsoft Entra group that is assigned a policy configuration, the service returns the appropriate policy settings for the user and informs Click-to-Run to check back in 90 minutes.
    - If there's an error occurs, another check-in call is made the next time the user opens an Office app, such as Word or Excel.
    - If no Office apps are running when the next check-in call is scheduled, then the check will be made the next time the user opens an Office app, such as Word or Excel.
> [!NOTE]
> - Policies from Cloud Policy are applied only when the Office app is restarted. The behavior is the same as with Group Policy. For Windows devices, policies are enforced based on the primary user that is signed into Microsoft 365 Apps for enterprise. If there are multiple accounts signed in, only policies for the primary account are applied. If the primary account is switched, most of the policies assigned to that account will not apply until the Office apps are restarted. Some policies related to [privacy controls](../privacy/overview-privacy-controls.md) will apply without restarting any Office apps.
>
> - If users are located in nested groups and the parent group is targeted for policies, the users in the nested groups will receive the policies. The nested groups and the users in those nested groups must be created in or synchronized to Microsoft Entra ID.
> - The check-in interval is controlled by the Cloud Policy service and communicated to Click-to-Run during each check-in call.

If the user is a member of multiple Microsoft Entra groups with conflicting policy settings, priority is used to determine which policy setting is applied. The highest priority is applied, with "0" being the highest priority that you can assign. You can set the priority by choosing **Reorder priority** on the **Policy configurations** page.

Also, policy settings implemented by using Cloud Policy take precedence over policy settings implemented by using Group Policy on Windows Server, and taking precedence over preference settings or locally applied policy settings.

## Baselines

At Microsoft, we strive to innovate and reduce the IT admins burden with the creation of modern management tools. With that said, the baselines in Cloud Policy are another way you can save time while deploying policy for your organization. The security and accessibility baselines offer a unique filter on the Group Policy needed to protect your organization and empower your end users to create accessible content.

### Security baseline
To easily identify security baseline policies, a new column called Recommendation was added to the policy table. Policies recommended for security baseline are triggered in this column. You can also use the column filter to limit the view to only policies that are tagged as security baseline.

For more information, see [Security baseline for Microsoft 365 Apps for enterprise](../security/security-baseline.md).

### Accessibility baseline
Most of our customers are making strides to become more accessible as an organization. The accessibility baseline enables IT Pros to configure accessibility policies to empower their end users to create accessible content and limit the ability to remove accessibility checker settings from being disabled.

## Additional information about Cloud Policy

- Only user-based policy settings are available. Computer-based policy settings aren't available.
- As new user-based policy settings are made available for Office, Cloud Policy automatically adds them. There's no need to download updated Administrative Templates files (ADMX/ADML).
- You can also create policy configurations to apply policy settings for supported versions of the desktop apps that come with subscription plans of Project and Visio.
- The health status feature was retired in the second half of March 2022. In the future (no known date at this time), we plan to provide advanced health reporting and compliance monitoring features for Cloud Policy.

## Troubleshooting tips

If the expected policies aren't correctly applied to a user's device, try the following actions:
- Make sure the user is signed into Microsoft 365 Apps for enterprise, activated it, and has a valid license.

- Make sure the user is part of the appropriate security group.

- Verify you aren't using an authenticated proxy.

- Check the priority of the policy configurations. If the user is in multiple security groups that have policy configurations assigned to them, then the priority of the policy configurations determines which policies take effect.

- In some cases, policies might not be applied correctly if two users with different policies sign into Office on the same device during the same Windows session.  

- Policy settings retrieved from Cloud Policy are stored in the Windows registry under HKEY_CURRENT_USER\Software\Policies\Microsoft\Cloud\Office\16.0. This key is overwritten each time a new set of policies is retrieved from the policy service during the check-in process.

- Policy service check-in activity is stored in the Windows registry under HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\Common\CloudPolicy. Deleting this key and restarting the Office apps will trigger the policy service to check in the next time an Office app is launched.

- If you want to see the next time a device running Windows is scheduled to check with Cloud Policy, look at the FetchInterval under HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\Common\CloudPolicy. The value is expressed in minutes. For example, 1440, which equates to 24 hours.  

- You might encounter a FetchInterval value of 0.  If this value exists, the client waits 24 hours from the last check-in before attempting to check with Cloud Policy again.
