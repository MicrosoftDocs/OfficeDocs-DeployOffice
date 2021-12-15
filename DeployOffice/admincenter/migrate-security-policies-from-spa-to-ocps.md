---
title: "Migrate security policies from Security Policy Advisor to the Office cloud policy service"
ms.author: chrisda
author: chrisda
manager: dansimp
audience: ITPro
ms.topic: article
ms.service: o365-proplus-itpro
ms.localizationpriority: medium
ms.collection: Ent_O365
ms.custom: Ent_Office_ProPlus
recommendations: false
description: "Learn about how Security Policy Advisor is being replaced by the Office cloud policy service"
---

# Manually migrate security policies from Security Policy Advisor to the Office cloud policy service

[Security Policy Advisor](overview-security-policy-advisor.md) is being retired and replaced by the [Office cloud policy service](overview-office-cloud-policy-service.md). If you never turned on Security Policy Advisor or configured security policies in Security Policy Advisor, this article doesn't apply to you. For future Office cloud policy management, we recommend that you use the Office cloud policy service, which is where we will continue to invest our development resources.

Beginning November 8, 2021, we'll start the process of retiring Security Policy Advisor (if you've never used it before, you won't be able to turn it on and use it). In January 2022, for those customers who have existing configurations in Security Policy Advisor, we'll automatically migrate policy configurations to the Office cloud policy service.

But, you don't need to wait for this automatic migration. You have the following options:

- **Manually create new profile configurations in the Office cloud policy service using new security groups**: New security groups are required because a policy configuration can have only one security group assigned to it, regardless of where it was created. And, you can't change the security group that's assigned in an existing policy configuration.

- **Use Microsoft Endpoint Manager to manage Office security policies with ADMX**: Unlike the Office cloud policy service, Microsoft Endpoint Manager uses templates to deploy policies in the same way as Group Policy settings. For more information, see [Use Windows 10 templates to configure group policy settings in Microsoft Intune](/mem/intune/configuration/administrative-templates-windows).

- **Turn off Security Policy Advisor without migrating policies**: If you're already using an alternative security policy management service (for example, Microsoft Intune, Configuration Manager, Group Policy, etc.), you can delete all policies in Security Policy Advisor by [turning off Security Policy Advisor](#step-4-turn-off-security-policy-advisor). This action will roll back all existing policies that you've deployed and will delete all recommendations.

   > [!IMPORTANT]
   > If you turn off Security Policy Advisor, you won't be able to turn it back on.

The rest of this article describes how to manually create new profile configurations in the Office cloud policy service using new security groups, and answers some frequently asked questions.

## Step 1: Identify the existing policies in Security Policy Advisor that you want to migrate

You're only interested in migrating policies that were created in Security Policy Advisor. To identify and record the settings of these policies, use the following steps:

1. Open the Microsoft 365 Apps admin center at <https://config.office.com/officeSettings>, and then go to **Security**.

   Or, to go directly to the **Security Policy Advisor** page, use <https://config.office.com/officeSettings/securityadvisorv2>

2. On the **Security Policy Advisor** page, note the existing policy configurations and their values:
   - **Name**
   - **Applied Policies**: You can ignore policy configurations where the **Applied Policies** value is zero.

3. Select a policy configuration where the **Applied Policies** value is greater than zero by clicking on the **Name** value.

4. On the details page that opens, select the **Applied policies** tab.

   On the **Applied policies** tab, note the policies that are listed.

   For each policy, select the policy by clicking on the policy name. In the details flyout that appears, note the **Policy setting** values.

   Repeat steps 2 to 4 as necessary to record a complete list of policies and their values.

   :::image type="content" source="../images/spa-applied-policies.png" alt-text="The Applied Policies tab in a policy configuration in Security Policy Advisor":::

## Step 2: Create replacement policy configurations in the Office cloud policy service

> [!NOTE]
> As previously described, multiple policy configurations can't have the same security group assigned to them (regardless of where they were created). To migrate policies, you need to create a new security group with the same membership and then recreate the policies in a new policy configuration in the Office cloud policy service.

1. Open the Microsoft 365 Apps admin center at <https://config.office.com/officeSettings>, and then go to **Customization** \> **Policy Management**.

   Or, to go directly to the **Policy Configurations** page, use <https://config.office.com/officeSettings/officePolicies>.

2. On the **Policy Configurations** page, click **Create**.
3. On the **Create policy configuration page** that opens, configure the following settings:
   - **Name**: Add a unique and descriptive name. The name can't be identical to the corresponding policy configuration from Security Policy Advisor that you're replacing, so use a different name.
   - **Description**: Add an optional description.
   - **Select type**: Select one of the following values:
     - **This policy configuration applies to users**: If you select this value, the **Select group** setting is available.
     - **This policy configuration applies to users that access documents anonymously using Office web apps**: If you select this value, the **Assigned group** setting appears with the unmodifiable value **Anonymous**. The **Select group** setting is not available.
   - **Select group**: If you selected **This policy configuration applies to users**, select the security group to use.
   - **Configure policies**: The **Select policies** section contains the list of available policies. Find and select the policy that you want to include. You can click on the column names to sort and filter the list, and you can use the **Search** box to find policies.

     When you select a policy by clicking on the **Name**, a details flyout opens where you configure the specific settings for the policy.

     Some policies offer to set the value according to the Microsoft recommended security baseline. We recommend these values, or even stricter values that you can select by choosing **Manually configured**, enabling the policy, and then configuring the setting in the dropdown.

     When you're finished configuring the policy settings, click **OK**

     Back in the **Select policies** section on the **Create policy configuration** page, the **Status** value changes from **Not configured** to **Configured**.

     Repeat this step as many times as necessary to add multiple policies to the policy configuration.

4. When you're finished, click **Create**

## Step 3: Roll back the assigned policies in Security Policy Advisor

> [!IMPORTANT]
> Clients check in to the Office cloud policy service every 90 minutes. Deleting policies in Security Policy Advisor before clients have a chance to get their policies from the Office cloud policy service might result in unprotected users for a period of time. For more information, see [How the policy configuration is applied](overview-office-cloud-policy-service.md#how-the-policy-configuration-is-applied).

After you've recreated the policy configuration in the Office cloud policy service and waited at least 90 minutes, you can roll back the policy in Security Policy Advisor.

1. Open the Microsoft 365 Apps admin center at <https://config.office.com/officeSettings>, and then go to **Security**.

   Or, to go directly to the **Security Policy Advisor** page, use <https://config.office.com/officeSettings/securityadvisorv2>.

2. On the **Security Policy Advisor** page, select the old policy configuration by clicking on the **Name**. In the details page that opens, select the **Applied policies** tab.

3. On the **Applied policies** tab, select a policy from the list (don't click the policy name), and then click **Rollback**. You can only select one policy at a time, and **Rollback** is available only after you select the policy.

   Repeat this step for the remaining policies in the policy configuration.

4. Repeat steps 2 and 3 for all of the policy configurations that you've recreated.

:::image type="content" source="../images/spa-roll-back-applied-policies.png" alt-text="Select a policy on the Applied Policies tab and then select Rollback in Security Policy Advisor":::

## Step 4: Turn off Security Policy Advisor

> [!IMPORTANT]
> If you turn off Security Policy Advisor, you won't be able to turn it back on.

After you're satisfied that all users are now using the replacement policy configurations from the Office cloud policy service, you can turn off Security Policy Advisor. This action will rollback all policies that were applied in Security Policy Advisor.

1. Open the Microsoft 365 Apps admin center at <https://config.office.com/officeSettings>, and then go to **Security**.

   Or, to go directly to the **Security Policy Advisor** page, use <https://config.office.com/officeSettings/securityadvisorv2>.

2. On the **Security Policy Advisor** page, slide the toggle from **On** to **Off**.

## Frequently asked questions

### Q: Are the policies the same in Security Policy Advisor and the Office cloud policy service?

A: Yes. The Office cloud policy service offers all of the same policies and more. It includes all setting options for each security policy and recommends the security baseline setting.

### Q: If I migrate policies from Security Policy Advisor to the Office cloud policy service, do I need to wait to make sure the policy is applied?

A: Yes. Clients check in to the Office cloud policy service every 90 minutes. As long as you wait at least 90 minutes after you migrate a policy configuration and before you roll back the policy in the policy configuration or turn off Security Policy Advisor, there is no downtime for these policies being applied to users. For more information, see [How the policy configuration is applied](overview-office-cloud-policy-service.md#how-the-policy-configuration-is-applied).

### Q: What happens to the ability to let users override a security policy?

A: We are disabling this functionality and are no longer providing overrides. As part of security hardening, we encourage admins to use the settings that are available in the policies themselves. Some security policies have settings that give users the option to enable content, and admins can apply these less restrictive settings to those users who need it.

For recommendations to restrict active content, and Office security policies that have user prompts and overrides available, see [Admin options for restricting active content](/microsoft-365/security/active-content-in-trusted-docs#admin-options-for-restricting-active-content).

### Q: How do I turn off Security Policy Advisor?

A: See [Step 4: Turn off Security Policy Advisor](#step-4-turn-off-security-policy-advisor). Remember, if you turn it off, you can't turn it back on.

### Q: What happens if I don't migrate security policies myself?

A: Policies and settings will be automatically migrated to the Office cloud policy service starting after January 17 2022. There may be downtime where you won't be able to manage your policies until they're migrated to the Office cloud policy service. To avoid any disruption in policy administration, we encourage you to manually migrate your policies as described in this article.
