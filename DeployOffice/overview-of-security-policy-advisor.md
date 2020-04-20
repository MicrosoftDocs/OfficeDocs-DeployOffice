---
title: "Overview of Security Policy Advisor for Microsoft 365 Apps for enterprise"
ms.author: jwhit
author: jwhit-MSFT
manager: laurawi
audience: ITPro
ms.topic: article
ms.service: o365-proplus-itpro
localization_priority: Priority
ms.collection:
- Ent_O365
- M365-modern-desktop
ms.custom: Ent_Office_ProPlus
ms.assetid: 
description: "You can use Security Policy Advisor to receive and implement security policy recommendations."
---

# Overview of Security Policy Advisor for Microsoft 365 Apps for enterprise

> [!IMPORTANT]
> Office 365 ProPlus is being renamed to **Microsoft 365 Apps for enterprise**. To learn more about this name change, [read this blog post](https://go.microsoft.com/fwlink/p/?linkid=2120533). 
>
> For details of when this change takes effect, and what actions admins might need to take, [read this article](name-change.md).

You can use Security Policy Advisor to receive and implement security policy recommendations. These recommendations are based on Microsoft best practices and information about your existing environment. The advisor is part of a [portal](https://config.office.com) for managing Microsoft 365 Apps for enterprise (previously named Office 365 ProPlus).

Security Policy Advisor can only be used in combination with the Office cloud policy service, a service that enables you to enforce policy settings for Microsoft 365 Apps for enterprise on a user's device. The policy settings roam to whichever device the user signs into and uses Microsoft 365 Apps for enterprise. Security Policy Advisor provides recommendations and the implementation of security policies for devices managed by the Office cloud policy service.
 
For more information about the Office cloud policy service, including details on how the policies are applied and how priority is used, see [Overview of the Office cloud policy service for Microsoft 365 Apps for enterprise](overview-office-cloud-policy-service.md).

## Requirements for using Security Policy Advisor

The following are the requirements for using Security Policy Advisor:

- Must be using the Office cloud policy service and meet all the [requirements for that service](overview-office-cloud-policy-service.md#requirements-for-using-the-office-cloud-policy-service). 
- At least version **1908** of Microsoft 365 Apps for enterprise. 
- To create the recommendations and insights, Security Policy Advisor relies on required service data from Microsoft 365 Apps for enterprise. For more information, see [Required service data for Office](privacy/required-service-data.md).
- The [required URLs and IP address ranges](https://docs.microsoft.com/office365/enterprise/urls-and-ip-address-ranges#microsoft-365-common-and-office-online) properly configured on your network.

## Turn on Security Policy Advisor

To enable security policy recommendations, sign in to the [portal](https://config.office.com) for managing Microsoft 365 Apps for enterprise, click **Security**, and then choose **On** for the **Security Policy Advisor**.  

## Implement security policy recommendations

To review and implement security policy recommendations, do the following:

1. Sign in to the [portal](https://config.office.com) for managing Microsoft 365 Apps for enterprise.
2. If you haven't already, [create a policy configuration for a group in the Office policy configuration service](overview-office-cloud-policy-service.md#steps-for-creating-a-policy-configuration). 
3. Click **Security**, and then click a group name.
4. In the policy configuration page, you can review the recommendations for that group and that policy configuration. To see more details about a recommendation, click the policy name. To see the applied policies, click **Applied policies**. 
5. To enable a recommendation, select the policy, and then click **Apply**. As part of applying a policy, you can allow users to override the policy. For more details, see [Allow users to override a policy](#allow-users-to-override-a-policy).

These recommendations are based on best practices from Microsoft and on an analysis of how users are using Office files in your existing environment. If you don't want to implement a recommendation and want to remove it from the page, choose **Ignore**.

## Manage applied security policies

You can see which policies have been applied to the group by going to the **Applied policies** tab. You can click on the policy to see when the policy was applied and whether users have been impacted by the policy. 

If more than 5% of the users in the group have been impacted by the security policy, either by reporting an impact or by overriding the policy, then the impact of the policy shows as high.

If you want to stop applying a policy, choose **Rollback**. 

## Allow users to override a policy

When users attempt an action blocked by a security policy, such as opening an Office document that contains macros, a Message Bar appears at the top of the application letting users know that their admin has configured a security policy that prevents that action. (Note that the Message Bar needs to be enabled in Office clients for users to see notifications and take action.)

When you choose to apply a security policy recommendation, you can choose whether users can override the policy:

- If you don't allow users to override the policy, the Message Bar that appears allows them to report that the policy prevents them from doing their work. 
- If you do allow users to override the policy, the Message Bar that appears allows them to override the policy and continue working in their document without the policy being applied.

In both cases, the user's response can be viewed on the **Policy details** page when you choose a policy on the **Applied policies** tab. This information usually appears within 6 to 8 hours.

## Turn off Security Policy Advisor

To turn off Security Policy Advisor, sign in to the [portal](https://config.office.com) for managing Microsoft 365 Apps for enterprise, click **Security**, and then choose **Off** for the **Security Policy Advisor**. 

When you turn off Security Policy Advisor, usage and threat data from your organization are no longer analyzed and no recommendations or insights will be generated.  

Admins can control the data collected from their clients using the new privacy controls supported by Office apps. For more details, see [Overview of privacy controls for Office 365 ProPlus](https://go.microsoft.com/fwlink/p/?linkid=2083502).

## How Security Policy Advisor creates recommendations 

When a security group has been assigned a policy configuration, Security Policy Advisor analyzes how users in that group work with Microsoft 365 Apps for enterprise. Based on this analysis and on Microsoft best practices, recommendations are created for specific security policies and insights about the impact of those policies on productivity and security. 

Recommendations are usually generated within a few minutes of a policy configuration being applied to a group. On rare occasions, it may take longer. In such instances, please revisit Security Policy Advisor to check if new recommendations are available.

Recommendations are based on analyzing data from the previous 14 to 84 days. This time frame is not configurable. To ensure the recommendations have a high confidence, Security Policy Advisor checks that the usage data is received from at least 75% of the users in the group for a minimum of 14 days. If these conditions are not met, Security Policy Advisor notifies the admin that there is not enough data. If you encounter this status for a group, make sure that the users of this group are meeting the requirements for Security Policy Advisor. Recommendations are only provided if no more than 5% of the users in the group will be affected by the recommended security policy.

Recommendations are currently available for the following security policies: 

- VBA Macro Notification Settings 
- Block macros in Office files from the internet 
- Disable All ActiveX 
- Check ActiveX objects 

In addition, if your organization has Office 365 Advanced Threat Protection Plan 2, then Security Policy Advisor can use data from this service to provide insights on recommended policies. These insights will be based on threats that have been detected and stopped by Advanced Threat Protection. For more details on Office 365 Advanced Threat Protection, see [Office 365 threat investigation and response](https://docs.microsoft.com/office365/securitycompliance/office-365-ti). 

To create the recommendations and insights, Security Policy Advisor requires required service data from Microsoft 365 Apps for enterprise. For more information, see [Required service data for Office](privacy/required-service-data.md).

## Known Issues
The following are known issues we are tracking from input we have received during preview.
1. **[FIXED-1908] Issues with ActiveX recommendations applied to Access**
   - Policy deployed to "Disable All ActiveX" does not allow the users to override or report impact when using Data Import Wizards in Access. 


