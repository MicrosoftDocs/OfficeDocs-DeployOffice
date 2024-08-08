---
title: Policy for Admin-Controlled Migration to New Outlook for Windows
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
ms.date: 08/08/2024
---
# Policy for Admin-Controlled Migration to New Outlook for Windows

You can upgrade users in your organization to the new Outlook for Windows by setting policies through Group Policy, Cloud Policy service for Microsoft 365, or a registry value.

## Migrate users to the new Outlook for Windows

Organizations ready to migrate users to the new Outlook for Windows can use the Admin-Controlled Migration to New Outlook policy.

### User Experience

Enabling this policy (set to 1) switches users from classic Outlook to new Outlook in three steps. Each step runs on a new app session (app launch).

This approach allows users in-app communication about the new Outlook migration and gives them a chance to switch and try the new experience. When enabled, the Admin-Controlled Migration to new Outlook policy installs the new Outlook app in the background during the next launch of classic Outlook if the new app isn't already installed. On the subsequent launch of classic Outlook, users see the following migration steps.

**Step #1:** Users see a teaching callout encouraging them to try the new Outlook, in the first session after the migration policy is set.

- If users select **Try it**, classic Outlook is closed and new Outlook is launched.
- If users choose **Not now**, the teaching callout is dismissed, and they can continue using classic Outlook. They’ll see the experience defined in step #2, in the next session.

![A screenshot of a computer](image_link_here)

This teaching callout might not appear in some cases, for example, if a higher priority teaching callout is queued or if users navigate away too quickly. Users will still see the next migration step.

**Step #2:** If users don’t switch to new Outlook in step 1, they’ll see this message in the next session: “Your organization recommends using the new Outlook for Windows. If you skip this step, you’ll be taken to the new experience the next time you start Outlook.”

- If users select **Switch now**, classic Outlook is closed and new Outlook is launched.
- If users close the business bar or don’t take any action, they’re able to continue using classic Outlook for Windows. They’ll see the experience defined in step #3, in the next session.

**Step #3:** Users see a blocking prompt encouraging them to switch to new Outlook.

- If users select **Switch now**, classic Outlook is closed and new Outlook is launched.
- If users select **Switch next time** or close the dialog or the app, they'll automatically be taken to the new Outlook experience on the next launch of classic Outlook.

Users are able to toggle back to classic Outlook for Windows anytime.

### Prerequisite to Enabling the Policy

Make the new Outlook toggle available to users. If the toggle is hidden, users don’t see the migration experience. To enable the toggle if it was previously disabled, see [Enable or disable access to the new Outlook for Windows | Microsoft Learn](/exchange/clients-and-mobile-in-exchange-online/outlook-on-the-web/enable-disable-employee-access-new-outlook#use-the-registry-to-enable-or-disable-the-new-outlook-toggle-in-outlook-desktop).

### Enabling or Disabling the Migration Policy

This group policy and can be managed via Cloud Policy. It can also be deployed as a Registry Key.

The policy functionality can be used in Current Channel Version 2406 (Build 16.0.17830.20138). We expect it to become available in the Monthly Enterprise Channel in September 2024.

#### Policy Details:

Policy Name: Admin-Controlled Migration to New Outlook

Possible Values (Boolean):
  - **1:** This value enables the new Outlook migration and initiates the migration flow as previously described.
  - **0:** This value disables the new Outlook migration and users stop seeing the associated experiences.

The migration runs only once till users switch to new Outlook. You can set the interval policy to reinitiate migration in the scenario users toggle back to classic Outlook.

Deleting the registry key associated with this policy disables the policy and stops the migration. If you enable the policy again after disabling it or deleting the registry key, it will start migration again from step #1.

### Setting as a Group Policy

You can download the latest group policy from the [Microsoft Download Center](https://www.microsoft.com/download/details.aspx?id=49030).

### Setting as a Cloud Policy

You can also set this policy as a [Cloud Policy](../../admin-center/overview-cloud-policy.md) from the [Microsoft 365 Apps admin center](https://config.office.com/).

### Setting as a Registry Value

Copy one of the following text blocks into Notepad:

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

Save the file as *.reg* in a location that's easy to find. For example: *C:\Data\Migrate to New Outlook.reg* or *C:\Data\Migrate to New Outlook.reg*.

Run the *.reg* file and select **Yes** in the confirmation dialog that appears.

## Policy to Define the Interval Between Migration Attempts

Users can toggle back to classic Outlook even after they migrate to the new Outlook for Windows.

A new *Interval between new Outlook migration attempts* policy can be used to reinitiate the migration to new Outlook for Windows after users toggle back to classic Outlook, based on the defined interval. 

### Prerequisite

The Admin controlled migration policy must be enabled for this policy to be respected.

### Setting the Interval Policy

This setting is a group policy and can be managed via Cloud Policy. It can also be deployed as a Registry value.

The policy functionality can be used in Current Channel Version 2304 (Build 16327.20214), Monthly Enterprise Channel Version 2303 (build 16227.20318), and Semi-Annual Enterprise Channel (Preview) Version 2308 (build 16731.20234). We expect it to become available in Semi-Annual Enterprise Channel in January 2024.

#### Policy Details:

Policy Name: Interval between new Outlook migration attempts

Possible Values:
  - **0/Not set:** the new Outlook for Windows migration isn't reinitiated.
  - **1:** Migration is attempted each time and users see the blocking prompt (as in step #3) on every launch of classic Outlook for Windows. This value is the most aggressive.
  - **2-99000:** migration will be reinitiated from step #1 when users launch classic Outlook for Windows N days after toggling back to classic Outlook for Windows. This value defines N.

Deleting the registry key associated with this policy behaves like setting the policy value to 0, and the migration is stopped.

If you enable the policy again after disabling it, it will reinitiate the migration as per the defined value.

### Setting as a Group Policy

You can download the latest group policy from the [Microsoft Download Center](https://www.microsoft.com/download/details.aspx?id=49030).

### Setting as a Cloud Policy

You can also set this policy as a [Cloud Policy](../../admin-center/overview-cloud-policy.md) from the [Microsoft 365 Apps admin center](https://config.office.com/).

### Setting as a Registry Key

Copy one of the following text blocks into Notepad:

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

Save the file as *.reg* in a location that's easy to find. For example: *C:\Data\New Outlook migration interval.reg*.

Run the *.reg* file and select **Yes** in the confirmation dialog that appears.

> [!IMPORTANT]
> New Outlook isn't supported for on-premises environments. So, if you have a hybrid environment with both Microsoft 365 and on-prem users, you should only target Microsoft 365 users for this policy. You can do this by using the cloud policy. New Outlook is also not available in sovereign clouds so do not enable the policy for these environments.

### Hide the Toggle in New Outlook for Windows

Some organizations might want users to stay in new Outlook and remove the option in new Outlook and don't toggle back to classic Outlook for Windows. This policy hides the toggle in new Outlook: `HideClassicOutlookToggleOut`.

It's a mailbox policy that can be set through Exchange PowerShell –

- **Enabling the policy (set true):**

```powershell
Set-OwaMailboxPolicy -Identity OwaMailboxPolicy-Default -HideClassicOutlookToggleOut $true
```

- **Disabling the policy (set false):**

```powershell
Set-OwaMailboxPolicy -Identity OwaMailboxPolicy-Default -HideClassicOutlookToggleOut $false
```

## Sample Scenarios

1. You want to require all your users to try new Outlook once
    a. Enable the `DoNewOutlookAutoMigration` GPO policy by setting it to **1**.
    b. Don’t set the `NewOutlookAutoMigrationRetryIntervals` GPO policy.

2. You want to prompt all your users to try new Outlook every 30 days.
    a. Enable the `DoNewOutlookAutoMigration` GPO policy by setting it to **1**.
    b. Set the `NewOutlookAutoMigrationRetryIntervals` GPO policy to **30**.

3. You want to prompt all your users to try new Outlook at every launch of classic Outlook.
    a. Enable the `DoNewOutlookAutoMigration` GPO policy by setting it to **1**.
    b. Set the `NewOutlookAutoMigrationRetryIntervals` GPO policy to **1**.

4. You want to force all your users to new Outlook and not give them an option to return to classic Outlook.
    a. Enable the `DoNewOutlookAutoMigration` GPO policy by setting it to **1**.
    b. Set the `NewOutlookAutoMigrationRetryIntervals` GPO policy to **1**.
    c. Enable the `HideClassicOutlookToggleOutlook` mailbox policy by setting it to **true**.

5. You want to stop migration for all your users 
    a. Disable the `DoNewOutlookAutoMigration` GPO policy by setting it to **0**.

6. You want to stop migrating users every 30 days and run migration only one time
    a. Update the `NewOutlookAutoMigrationRetryIntervals` GPO policy from **30** to **0**.
