---
title: Policy for Admin-Controlled Migration to new Outlook for Windows
description: Describes how to migrate users to the new Outlook for Windows using admin-controlled policies.
author: JanelleMcIntosh-MSFT
ms.author: janellem
manager: serdars
audience: ITPro
ms.topic: conceptual
ms.service: outlook
ms.collection:
- Tier3
- deploy-new-outlook
ms.localizationpriority: medium
ms.custom: intro-overview
recommendations: true
ms.date: 08/26/2024
---
# Policy for Admin-Controlled Migration to new Outlook for Windows

You can upgrade users in your organization to the new Outlook for Windows by setting policies through Group Policy, Cloud Policy service for Microsoft 365, or a registry value.

## Migrate users to the new Outlook for Windows

Organizations ready to migrate users to the new Outlook for Windows can use the Admin-Controlled Migration to New Outlook policy.

### User experience

[Enabling this policy](#enabling-or-disabling-the-migration-policy) (set to 1) switches users from classic Outlook to new Outlook in three steps. Each step runs on a new app session (app launch).

This approach allows users in-app communication about the new Outlook migration and gives them a chance to switch and try the new experience. When enabled, the *Admin-Controlled Migration to New Outlook* policy installs the new Outlook app in the background during the next launch of classic Outlook if the new app isn't already installed. On the subsequent launch of classic Outlook, users see the following migration steps.

**Step #1:** Users see a teaching callout encouraging them to try the new Outlook, in the first session after the migration policy is set and the new Outlook app is applied.

- If users select **Try it**, classic Outlook is closed and new Outlook is launched.
- If users choose **Not now**, the teaching callout is dismissed, and they can continue using classic Outlook. They’ll see the experience defined in step #2, in the next session.

:::image type="content" source="media/admin-controlled-migration-policy/outlook-prompt.png" alt-text="Notification prompt in Outlook asking users to try the new Outlook, with options to either try it now or defer." lightbox="media/admin-controlled-migration-policy/outlook-prompt-lb.png":::

This teaching callout might not appear in some cases, for example, if a higher priority teaching callout is queued or if users navigate away too quickly. Users will still see the next migration step.

**Step #2:** If users don’t switch to new Outlook in step 1, they’ll see this message in the next session: “Your organization recommends using the new Outlook for Windows. If you skip this now, you’ll be taken to the new experience the next time you start Outlook.”

- If users select **Switch now**, classic Outlook is closed and new Outlook is launched.
- If users close the business bar or don’t take any action, they’re able to continue using classic Outlook for Windows. They’ll see the experience defined in step #3, in the next session.

:::image type="content" source="media/admin-controlled-migration-policy/outlook-banner-notification.png" alt-text="Notification banner in Outlook recommending users to switch to the new Outlook with an option to switch now." lightbox="media/admin-controlled-migration-policy/outlook-banner-notification-lb.png":::

**Step #3:** Users see a prompt encouraging them to switch to new Outlook.

- If users select **Switch now**, classic Outlook is closed and new Outlook is launched.
- If users select **Switch next time** or close the dialog or the app, they'll automatically be taken to the new Outlook experience on the next launch of classic Outlook.

:::image type="content" source="media/admin-controlled-migration-policy/outlook-install-notice.png" alt-text="Installation notice in Outlook informing users that the new Outlook for Windows is installed, with options to switch now or next time." lightbox="media/admin-controlled-migration-policy/outlook-install-notice-lb.png":::

Users are able to toggle back to classic Outlook for Windows anytime.

### Prerequisite to enabling the policy

Make the new Outlook toggle available to users. If the toggle is hidden, users don’t see the migration experience. To enable the toggle if it was previously disabled, see [Enable or disable access to the new Outlook for Windows](/exchange/clients-and-mobile-in-exchange-online/outlook-on-the-web/enable-disable-employee-access-new-outlook#use-the-registry-to-enable-or-disable-the-new-outlook-toggle-in-outlook-desktop).

### Enabling or disabling the migration policy

This group policy and can be managed via Cloud Policy. It can also be deployed as a Registry Key.

You can use the policy functionality in Current Channel Version 2406 (Build 16.0.17830.20138). We expect it to become available in Monthly Enterprise Channel in September 2024.

#### Policy details:

Policy Name: Admin-Controlled Migration to New Outlook

Possible Values (Boolean):
  - **1:** This value enables the new Outlook migration and initiates the migration flow as previously described.
  - **0:** This value disables the new Outlook migration and users stop seeing the associated experiences.

The migration runs only once. You can set the [interval policy](#setting-the-interval-policy) to reinitiate migration in the scenario users toggle back to classic Outlook.

Deleting the registry key associated with this policy disables the policy and stops the migration. If you enable the policy again after disabling it or deleting the registry key, it will start migration again from step #1.

#### Setting as a Group Policy

You can download the latest group policy from the [Microsoft Download Center](https://www.microsoft.com/download/details.aspx?id=49030).

#### Setting as a Cloud Policy

You can also set this policy as a [Cloud Policy](../../admin-center/overview-cloud-policy.md) from the [Microsoft 365 Apps admin center](https://config.office.com/). For more information about Cloud Policy, see [Overview of Cloud Policy service for Microsoft 365](../../admin-center/overview-cloud-policy.md)

#### Setting as a registry value

1. Copy one of the following text blocks into Notepad:

    **Enable the new Outlook migration:** This value initiates the migration flow as previously described.

    ```console
    Windows Registry Editor Version 5.00
    
    [HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\Outlook\Options\General]
    “DoNewOutlookAutoMigration”: dword:00000001
    ```

    **Disable the new Outlook migration:** This value stops the migration flow as previously described.
    ```console
    Windows Registry Editor Version 5.00
    
    [HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\Outlook\Options\General]
    “DoNewOutlookAutoMigration”: dword:00000000
    ```
    > [!NOTE]
    > You can also create the *DoNewOutlookAutoMigration* DWORD under the user's policy key *HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft\Office\16.0\Outlook\Options\General* to prevent users from changing the registry value to a different value.

1. Save the file as *.reg* in a location that's easy to find. For example: *C:\Data\Migrate to New Outlook.reg* or *C:\Data\Migrate to New Outlook.reg*.

1. Run the *.reg* file and select **Yes** in the confirmation dialog that appears.

> [!TIP]
> Setting through Intune: This can be managed in Intune using administrative templates as well, since this is an ADMX policy. For more information, see [Use Windows 10/11 templates to configure group policy settings in Microsoft Intune](/mem/intune/configuration/administrative-templates-windows?tabs=template)  

## Policy to define the interval between migration attempts

Users can toggle back to classic Outlook even after they migrate to the new Outlook for Windows.

A new *Interval between new Outlook migration attempts* policy can be used to reinitiate the migration to new Outlook for Windows after users toggle back to classic Outlook, based on the defined interval. 

### Prerequisite

The Admin controlled migration policy must be enabled for this policy to be respected.

### Setting the interval policy

This group policy can be managed via Cloud Policy. It can also be deployed as a Registry value.

You can use the policy functionality in Current Channel Version 2406 (Build 16.0.17830.20138). We expect it to become available in Monthly Enterprise Channel in September 2024.

#### Policy details:

Policy Name: Interval between new Outlook migration attempts

Possible Values:
  - **0/Not set:** the new Outlook for Windows migration isn't reinitiated.

  - **1:** Migration is attempted each time and users see the blocking prompt (as in step #3) on every launch of classic Outlook for Windows. This value is the most aggressive.

  - **2-99000(N):** migration will be reinitiated from step #1 when users launch classic Outlook for Windows N days after toggling back to classic Outlook for Windows. This value defines N.

Deleting the registry key associated with this policy behaves like setting the policy value to 0, and the migration is stopped.

If you enable the policy again after disabling it, it will reinitiate the migration as per the defined value.

#### Setting as a Group Policy

You can download the latest group policy from the [Microsoft Download Center](https://www.microsoft.com/download/details.aspx?id=49030).

#### Setting as a Cloud Policy

You can also set this policy as a [Cloud Policy](../../admin-center/overview-cloud-policy.md) from the [Microsoft 365 Apps admin center](https://config.office.com/). For more information about Cloud Policy, see [Overview of Cloud Policy service for Microsoft 365](../../admin-center/overview-cloud-policy.md)

#### Setting as a registry key

1. Copy one of the following text blocks into Notepad:

    **Do not re-initiate new Outlook migration:** If the interval policy isn't set, or set to 0, the new Outlook migration isn't reinitiated.
    
    ```console
    Windows Registry Editor Version 5.00
    
    [HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\Outlook\Options\General]
    “NewOutlookAutoMigrationRetryIntervals”: dword:00000000
    ```
    
    **Attempt migration on each boot:** This value reinitiates the new Outlook migration on every app launch and users see the blocking prompt (step #3).
    
    ```console
    Windows Registry Editor Version 5.00
    
    [HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\Outlook\Options\General]
    “NewOutlookAutoMigrationRetryIntervals”: dword:00000001
    ```
    
    **Re-initiate migration 10 days after users toggle back to classic Outlook:** This value defines the number of days after which new Outlook migration isn't reinitiated if users toggle back to classic Outlook. In this example, the migration will be reinitiated 10 days after users toggled back.
    
    ```console
    Windows Registry Editor Version 5.00
    
    [HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\Outlook\Options\General]
    “NewOutlookAutoMigrationRetryIntervals”: dword:0000000a
    ```
    
    > [!NOTE]
    > You can also create the *NewOutlookAutoMigrationRetryIntervals* DWORD under the user's policy key *HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft\Office\16.0\Outlook\Options\General* to prevent users from changing the registry value to a different value.

1. Save the file as *.reg* in a location that's easy to find. For example: *C:\Data\New Outlook migration interval.reg*.

1. Run the *.reg* file and select  **Yes**  in the confirmation dialog that appears.

> [!TIP]
> Setting through Intune: This can be managed in Intune using administrative templates as well, since this is an ADMX policy. For more information, see [Use Windows 10/11 templates to configure group policy settings in Microsoft Intune](/mem/intune/configuration/administrative-templates-windows?tabs=template)  

> [!IMPORTANT]
> New Outlook isn't supported for on-premises environments. So, if you have a hybrid environment with both Microsoft 365 and on-premises users, you should only target Microsoft 365 users for this policy. You can do this by using the cloud policy. New Outlook is also not available in sovereign clouds so do not enable the policy for these environments.

### Hide the toggle in new Outlook for Windows

Some organizations might want users to stay in new Outlook and remove the option to toggle back to classic Outlook for Windows. The `HideClassicOutlookToggleOut` policy hides the toggle in new Outlook.

It's a mailbox policy that can be set through Exchange PowerShell –

- **Enabling the policy (set true):**

```powershell
Set-OwaMailboxPolicy -Identity OwaMailboxPolicy-Default -HideClassicOutlookToggleOut $true
```

- **Disabling the policy (set false):**

```powershell
Set-OwaMailboxPolicy -Identity OwaMailboxPolicy-Default -HideClassicOutlookToggleOut $false
```

## Tracking new Outlook usage

You can view the new Outlook app usage in your organization by using the Usage and Insights report in Microsoft Entra ID.

To access this report, your organization needs an Azure subscription. Sign in to [Microsoft Azure](https://portal.azure.com) and select the **Microsoft Outlook** app from the list of applications. Confirm the app by checking the appID: `5d661950-3475-41cd-a2c3-d671a3162bc1`.

To view this report, you must have the **Report reader** role. For more information, see [Sign-in logs in Microsoft Entra ID](/azure/active-directory/reports-monitoring/concept-sign-ins#prerequisites).

## View your organization’s feedback

To view your organization's feedback data, sign in to the [Microsoft 365 admin center](https://go.microsoft.com/fwlink/p/?linkid=2024339) and select the **Health** node. Then, choose **Product Feedback** and filter the products to **New Outlook for Windows**.

For more information, see [Learn about Microsoft feedback for your organization](/microsoft-365/admin/misc/feedback-user-control#how-can-i-see-my-users-feedback).

> [!NOTE]
> Feedback may be biased from those who switch back to classic Outlook for Windows, as they are prompted for feedback during this process.

:::image type="content" source="media/admin-controlled-migration-policy/product-feedback-page.png" alt-text="Microsoft 365 admin center Product feedback page showing options for selecting products such as the New Outlook for Windows." lightbox="media/admin-controlled-migration-policy/product-feedback-page-lb.png":::

## Sample scenarios

- You want to require all your users to try new Outlook once
    - Enable the `DoNewOutlookAutoMigration` policy by setting it to **1**.
    - Don’t set the `NewOutlookAutoMigrationRetryIntervals` policy.

- You want to prompt all your users to try new Outlook every 30 days.
    - Enable the `DoNewOutlookAutoMigration`  policy by setting it to **1**.
    - Set the `NewOutlookAutoMigrationRetryIntervals`  policy to **30**.

- You want to prompt all your users to try new Outlook at every launch of classic Outlook.
    - Enable the `DoNewOutlookAutoMigration`  policy by setting it to **1**.
    - Set the `NewOutlookAutoMigrationRetryIntervals`  policy to **1**.

- You want to force all your users to new Outlook and not give them an option to return to classic Outlook.
    - Enable the `DoNewOutlookAutoMigration`  policy by setting it to **1**.
    - Set the `NewOutlookAutoMigrationRetryIntervals`  policy to **1**.
    - Enable the `HideClassicOutlookToggleOutlook` mailbox policy by setting it to **true**.

- You want to stop migration for all your users 
    - Disable the `DoNewOutlookAutoMigration`  policy by setting it to **0**.

- You want to stop migrating users every 30 days and run migration only one time
    - Update the `NewOutlookAutoMigrationRetryIntervals`  policy from **30** to **0**.
