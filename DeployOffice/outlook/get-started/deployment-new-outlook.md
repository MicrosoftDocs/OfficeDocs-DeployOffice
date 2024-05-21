---
title: "Deployment overview for the new Outlook for Windows"
ms.author: janellem
author: JanelleMcIntosh-MSFT
manager: triciag
audience: ITPro
ms.topic: overview
ms.service: outlook
ms.collection: Tier1
ms.localizationpriority: medium
ms.custom: intro-overview
recommendations: true
description: "Provides an overview of deployment for new Outlook for Windows"
ms.date: 11/09/2023
---

# Deployment overview for the new Outlook for Windows

The new Outlook for Windows client installer is now available either from the Microsoft Store or the Office Content Delivery Network (CDN).

The new Outlook is currently offered as a preview upgrade to classic Outlook for Windows through a toggle. Users can opt in to download the installer and switch to the new experience and can choose to migrate settings from classic Outlook. After users toggle in, they’ll see their supported accounts migrated from classic Outlook for Windows to the new Outlook.

> [!NOTE]
> Users need to sign back in to accounts that can’t automatically authenticate via [Windows Single Sign-On](/DeployOffice/outlook/get-started/supported-account-types).

The toggle experience is the recommended way for users to get the new Outlook for Windows. It’s currently an end-user opt-in mechanism, although admins can control the availability of the toggle in classic Outlook for Windows. In the future, we’re making it easier for organizations to smoothly transition end-users to the new Outlook for Windows. Once switched, users can return to the classic Outlook for Windows.

The new Outlook for Windows is also available as the upgrade from the Windows Mail and Calendar apps through a toggle. Users who toggle in from Mail and Calendar also see their accounts listed for easy sign-in in the new app.

## Prerequisites for target computers

For the new Outlook client to be successfully installed, computers must meet the minimum requirements listed here.

### System and app requirements

> [!NOTE]
> New Outlook for Windows is not supported on Windows Server 2016 and Windows Server 2019. 

Requirement | Version
------------|-------
Windows | Windows 10 Version 1809 (Build 17763) or higher. The new Outlook for Windows will be pre-installed on new Windows devices and devices running Windows 11 version 23H2.
Classic Outlook app | Version 2303 Build 16227.20318 or higher to see the Try the new Outlook toggle. **Important:** Classic Outlook is only a requirement if you want users to be able to switch between classic Outlook and new Outlook. This prerequisite is optional if you only want your users to see the new Outlook client.

## Other deployment options

### Download and install new Outlook for a single computer
For organizations that disable access to the Windows Store, the installer can be directly accessed from the Office CDN.

To install new Outlook on a single computer with many users, follow these steps:
1. Download the [Setup.exe](https://go.microsoft.com/fwlink/?linkid=2207851).
2. Launch PowerShell 7 as an administrator: Right-click the PowerShell icon and choose Run as Administrator.
3. Navigate to where the Setup.exe file is located.
4. Run the following command: 

   ```powershell
   .\Setup.exe --provision true --quiet --start-*
   ```

### Deploy new Outlook across your organization
To deploy this installer to a group of computers, or your entire organization:
1. Download the [.exe installer](https://go.microsoft.com/fwlink/?linkid=2207851).
2. Use [Intune](/mem/intune/fundamentals/what-is-intune), [Microsoft Endpoint Configuration Manager](/mem/configmgr/core/understand/introduction), [Group Policy](/troubleshoot/windows-server/group-policy/use-group-policy-to-install-software), or third-party distribution software, to distribute the installer to your target computers.
3. Run the installer on each computer.

## Non-Administrative Installation Methods

For users without administrative privileges, provided here are several alternatives to install the new Outlook for Windows: Windows Package Manager, Microsoft Intune, or Setup.exe Boostrapper.

### Windows Package Manager (winget)

The Windows Package Manager (winget) allows for a nonadministrative, per-user installation of the new Outlook for Windows. To use winget, follow these steps:

1. Open PowerShell by pressing Windows + X and select Terminal (PowerShell for Windows 10 users).
2. Enter the following command to install the Microsoft Store version of new Outlook:

   ```powershell
   winget install -i -e --id=9NRX63209R7B --source=msstore --accept-package-agreements
   ```

### Microsoft Intune

Microsoft Intune allows administrators to deploy the Microsoft Store version of Outlook to enrolled devices. This approach doesn't require administrative rights on each device. For more information, see [Deploy apps your organization uses](/mem/intune/fundamentals/manage-apps#deploy-apps-your-organization-uses)

### Setup.exe Bootstrapper for per-user install

A Setup.exe bootstrapper can be used for a straightforward per-user installation:

1. Download the [.exe installer](https://go.microsoft.com/fwlink/?linkid=2207851).
2. Open PowerShell and run the following command:

   ```powershell
   .\Setup.exe --quiet --start-
   ```

## Future integration of new Outlook in new Microsoft 365 deployments

In a future release after the commercial preview stage, new Outlook will be an option in place of the classic Outlook experience for new Microsoft 365 deployments.

## Control release of the new Outlook

Some organizations might opt to use a policy to hide the **Try the new Outlook** toggle from appearing in the classic Outlook for Windows until they’re ready to migrate. Refer to [Use the registry to enable or disable the New Outlook toggle in Outlook Desktop](/exchange/clients-and-mobile-in-exchange-online/outlook-on-the-web/enable-disable-employee-access-new-outlook#use-the-registry-to-enable-or-disable-the-new-outlook-toggle-in-outlook-desktop).

This policy hides the toggle from classic Outlook, but it doesn’t block the mailbox from being added to the new Outlook for Windows. A separate Exchange mailbox policy can be used to block organization mailboxes from being added to the new Outlook.

For more information on disabling new Outlook in Exchange, see [Enable or disable the new Outlook for Windows for an individual mailbox](/exchange/clients-and-mobile-in-exchange-online/outlook-on-the-web/enable-disable-employee-access-new-outlook#enable-or-disable-the-new-outlook-for-windows-for-an-individual-mailbox).

Windows builds after 23H2 have the new Outlook app preinstalled for all users, as it will replace the preinstalled Mail and Calendar apps by the end of 2024. If you prefer to not have the new Outlook for Windows show up in your organization’s devices, you could remove it after it's installed as part of the update. You can do this by following the instructions in [Remove-AppxProvisionedPackage](/powershell/module/dism/remove-appxprovisionedpackage) to remove the app package by using PowerShell and the parameter Microsoft.OutlookForWindows.

The PowerShell cmdlet to use is:

```powershell
Remove-AppxProvisionedPackage -AllUsers -Online -PackageName (Get-AppxPackage Microsoft.OutlookForWindows).PackageFullName
```

Additionally, remove this Windows orchestrator registry value -
*HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsUpdate\Orchestrator\UScheduler_Oobe\OutlookUpdate*

For any device that's installed the March 2024 Non-Security Preview release (or later cumulative update) for Windows 11 Version 23H2, Windows Orchestrator respects the deprovisioning cmdlet and it's not necessary to remove this registry value.

> [!IMPORTANT]
> Support for Windows Mail and Calendar will be discontinued at the end of 2024. Organizations should ensure that users transition to new Outlook before this deadline to avoid disruption. Please note that blocking the download of the new Outlook for Windows on managed devices will not stop the migration prompts within Mail and Calendar.

In cases of user installs, for example, if users have used the toggle to install the new Outlook for Windows, use Remove-AppxPackage. AppxPackage cmdlets are used for managing applications for current users, while AppxProvisionedPackage cmdlets are used for managing default applications for both current and future users of the system. The following example cmdlet removes the new Outlook for Windows for all users on the machine but does not prevent future users from getting it automatically, once the Mail and Calendar apps are replaced by the new Outlook for Windows. For further reference, see [Remove-AppxPackage](/powershell/module/appx/remove-appxpackage).

```powershell
Remove-AppxPackage -AllUsers -Package (Get-AppxPackage Microsoft.OutlookForWindows).PackageFullName
```

Users can toggle to the new Outlook from the Mail and Calendar applications that ship with Windows. To block users from acquiring new Outlook from these applications, organizations can block users from downloading and/or installing the new Outlook using Intune or other management solutions.

For more information, see [Outlook for Windows: The Future of Mail, Calendar and People on Windows 11](https://support.microsoft.com/office/outlook-for-windows-the-future-of-mail-calendar-and-people-on-windows-11-715fc27c-e0f4-4652-9174-47faa751b199).

Organizations can prevent end users from using the Mail and Calendar apps with their organization accounts via setting the “UniversalOutlookEnabled” parameter to $false in the CASMailbox cmdlet. For more information, see [Set-CASMailbox](/powershell/module/exchange/set-casmailbox#-universaloutlookenabled).

Besides the mailbox access controls and visibility toggles in classic Outlook, you can also use several Exchange PowerShell cmdlets and Cloud Policy settings to configure and manage the new Outlook. For more information, see [Policy management](/DeployOffice/outlook/manage/policy-management).
