---  
title: "Control installation and use of new Outlook"   
ms.author: janellem  
author: JanelleMcIntosh-MSFT
manager: triciag
audience: ITPro
ms.topic: overview
ms.service: outlook  
ms.collection: Tier3
ms.localizationpriority: medium 
ms.custom: QuickDraft  
ms.reviewer: janellem  
search.appverid: MET150 
recommendations: true
description: "Describes how to control the installation and use of new Outlook in an organization"
ai-usage:  ai-assisted  
ms.date: 07/02/2024 
---  

# Control the installation and use of new Outlook

This article provides guidance for admins on how to control the installation and use of the new Outlook in an organization.

## Prevent users from switching to new Outlook

Some organizations might opt to use a policy to hide the **Try the new Outlook** toggle from appearing in the classic Outlook for Windows until they're ready to migrate.

Hiding new Outlook is available as a cloud policy in the Microsoft 365 Apps admin center. To set up the policy:

1. Sign in to the [Microsoft 365 Apps admin center](https://config.office.com).
2. Under **Customization**, select **Policy Management**.
3. Select **Create** to create a new cloud policy.
4. Search for the **Hide the "Try the new Outlook" toggle in Outlook** policy and enable it.

Alternatively, you can use the following Windows registry key to hide the **Try the new Outlook** toggle:

```console
Windows Registry Editor Version 5.00
[HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\Outlook\Options\General]
"HideNewOutlookToggle"=dword:00000000
```

To later enable the policy, set the registry key to 1:

```console
Windows Registry Editor Version 5.00
[HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\Outlook\Options\General]
"HideNewOutlookToggle"=dword:00000001
```

More details are available in [Enable or disable access to the new Outlook for Windows](/exchange/clients-and-mobile-in-exchange-online/outlook-on-the-web/enable-disable-employee-access-new-outlook#use-the-registry-to-enable-or-disable-the-new-outlook-toggle-in-outlook-desktop).

## Block new Outlook preinstall on Windows

Windows builds after 23H2 have the new Outlook app preinstalled for all users, as it will replace the preinstalled Mail and Calendar apps by the end of 2024.

Currently, there isn't a way to block the new Outlook from being installed before it's first installed as a replacement for the Mail & Calendar app. If you prefer not to have new Outlook show up on your organization's devices, you can remove it after it's installed as part of the update.

To remove it, follow the instructions in [Remove-AppxProvisionedPackage](/powershell/module/dism/remove-appxprovisionedpackage) to remove the app package using PowerShell with the parameter *Microsoft.OutlookForWindows*. Once uninstalled, new Outlook won't be readded as part of a Windows update.

Use the following PowerShell cmdlet:

```powershell
Remove-AppxProvisionedPackage -AllUsers -Online -PackageName (Get-AppxPackage Microsoft.OutlookForWindows).PackageFullName
```

Additionally, remove this Windows orchestrator registry value:

```console
HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsUpdate\Orchestrator\UScheduler_Oobe\OutlookUpdate
```

For any device that installed the March 2024 Non-Security Preview release (or later cumulative update) for Windows 11 Version 23H2, Windows Orchestrator respects the deprovisioning cmdlet and it's not necessary to remove this registry value.

In cases of user installs, for example, if users used the toggle to install the new Outlook for Windows, use **Remove-AppxPackage**. The AppxPackage cmdlets are used for managing applications for current users, while AppxProvisionedPackage cmdlets are used for managing default applications for both current and future users of the system.

Use this PowerShell cmdlet to remove the new Outlook for Windows for all users:

```powershell
Remove-AppxPackage -AllUsers -Package (Get-AppxPackage Microsoft.OutlookForWindows).PackageFullName
```

[!Tip:]
To confirm if the app is installed, check if the logs folder is present under: *%localappdata%\Microsoft\Olk\logs*. In some cases, users might not have the app installed but might see the pinned/placeholder icon in the Start menu. The new Outlook app is installed when users select it. You can manage Windows Start pins by following the instructions in [Customize the Start layout - Configure Windows](/windows/configuration/start/layout?tabs=intune-10%2Cintune-11&pivots=windows-11). Users might also see the new Outlook app in the Start 'recommended (Win11)/ suggested (Win10)' sections on consumer devices.

## Block new Outlook installation as part of Mail and Calendar deprecation

Users can toggle to new Outlook from the Mail and Calendar applications that ship with Windows. Support for Windows Mail and Calendar will be out of support at the end of 2024, so we're also automatically switching active users to the new Outlook app.

If you would like to block your users from acquiring the new Outlook from Windows Mail and Calendar applications, you can uninstall these apps from the user's devices.

To uninstall the apps, follow the instructions in [Remove-AppxProvisionedPackage](/powershell/module/dism/remove-appxprovisionedpackage) to remove the app package using PowerShell with the parameter *microsoft.windowscommunicationsapps*.

Use the following PowerShell cmdlet:

```powershell
Get-AppxProvisionedPackage -Online | Where {$_.DisplayName -match "microsoft.windowscommunicationsapps"} | Remove-AppxProvisionedPackage -Online -PackageName {$_.PackageName}
```

To remove the Mail and Calendar apps for the current users, you can use the **Remove-AppxPackage** cmdlet:

```powershell
Remove-AppxPackage -AllUsers -Package (Get-AppxPackage microsoft.windowscommunicationsapps).PackageFullName
```

Alternatively, you can do remove the apps through Intune or by following the instructions in [Uninstall applications](/mem/configmgr/apps/deploy-use/uninstall-applications).

## Prevent users from acquiring new Outlook from Microsoft Store

The new Outlook for Windows app is also available in the Microsoft Store. To prevent users from downloading the app from the store, you can block store access by following the instructions in [Configure access to the Microsoft Store app](/windows/configuration/store).

## Conditional access to the new Outlook App

Many organizations have common access concerns that Conditional Access policies can help with, such as:

- Requiring multifactor authentication for users
- Blocking or granting access from specific locations
- Blocking risky sign-in behaviors
- Requiring organization-managed devices to be used

A more granular control can be offered using OWA Mailbox Policies with the parameter *ConditionalAccessPolicy*. For example, when users are on noncompliant devices, OWA mailbox policies limit their capabilities, such as restricting attachments.

To learn more about Conditional Access and how to configure it, follow the instructions on [Require compliant, hybrid joined devices, or MFA to grant or block access](/entra/identity/conditional-access/howto-conditional-access-policy-compliant-device). To configure OWA Mailbox Policies, check [OWA Mailbox Policy - Conditional Access Policy](/powershell/module/exchange/set-owamailboxpolicy).

## Block Mailbox Access on new Outlook

Users might acquire the new Outlook app through different flows, as outlined in the previous sections. To prevent mailbox access from new Outlook regardless of how users acquired it, an Exchange mailbox policy can be used to block organization (work or school) mailboxes from being added to the new Outlook. This is the final block as users can't use their work or school account even if they have the app on their device.

Mailbox policies are applied to the work or school email account and not at the device or app level. Therefore, to prevent users from using the app with other accounts that aren't their work or school email account, we recommend blocking access to the app (as described in previous sections).

Follow the instructions in [Enable or disable access to the new Outlook for Windows](/exchange/clients-and-mobile-in-exchange-online/outlook-on-the-web/enable-disable-employee-access-new-outlook#enable-or-disable-the-new-outlook-for-windows-for-an-individual-mailbox) for managing mailbox access.