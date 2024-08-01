---
title: "Troubleshoot deployment issues in new Outlook"
ms.author: janellem
author: JanelleMcIntosh-MSFT
manager: triciag
audience: ITPro
ms.topic: overview
ms.service: outlook
ms.collection: Tier3
ms.localizationpriority: medium
ms.custom: intro-overview
recommendations: true
description: "Provides detailed solutions for troubleshooting deployment and installation issues encountered when transitioning to the new Outlook for Windows"
ms.date: 08/01/2024
---

# Troubleshoot deployment issues in new Outlook

As organizations transition to new Outlook, which offers a more agile and consistent experience in Windows, admins and users could encounter issues, from toggle visibility in the classic Outlook to installation hurdles. This article provides step-by-step solutions to addressing these challenges, ensuring a smooth integration of new Outlook into your work environment, whether it's through direct installation, using various deployment options, or managing policy settings.

## Toggle in classic Outlook doesn’t work
When the toggle in classic Outlook is visible but unresponsive, it's typically due to installation issues related to security settings. For resolving this issue, refer to [Troubleshooting installation issues in the new Outlook client](#troubleshoot-installation-issues-in-the-new-outlook-client) for detailed steps to address security-related installation problems.

## Toggle doesn't show in classic Outlook
One or more of the following reasons might cause the missing toggle in classic Outlook:

- Unsupported Windows version
  - Must be Windows 10 Build 1809 (17763) or higher.
- Unsupported channel
  - Current Channel, Monthly Enterprise Channel, and Semi-Annual Enterprise Channel (preview) are supported.
- Unsupported version
  - Nonsubscription versions of Outlook such as Outlook 2021, Outlook 2019, etc. aren't supported.
- Unsupported accounts in classic Outlook profile
  - POP or on-premises Exchange account: These account types could be in the classic Outlook profile.
  - Check account compatibility: If new Outlook launches successfully on a system for another user, have the user who can't access the toggle sign-in on that system to see if the toggle appears.
  - Contact support: When reaching out to Microsoft Support, include the ETL files from %Temp%\Outlook Logging (accessible via Start > Run > %Temp%\Outlook Logging). These files help us determine why the toggle doesn’t show.

### Sovereign network consideration
For Windows computers that are or were part of a sovereign network, the option of switching to new Outlook isn't available. This restriction is due to the specific network configurations and security protocols inherent to sovereign networks.

### Toggle settings in registry
The 'HideNewOutlookToggle' registry key controls the visibility of the new Outlook toggle in classic Outlook. This key is located under [HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\Outlook\Options\General]. If "HideNewOutlookToggle" is set to ‘1’, the toggle remains hidden in classic Outlook. Changing this value to ‘0’ and restarting classic Outlook makes the toggle visible.

### Cloud policy
In case a policy is set to disable the toggle in new Outlook:
- Check the Global setting in the [Microsoft 365 Apps admin center](https://config.office.com/).
- Search for the “Hide the 'Try the new Outlook' toggle in Outlook” policy.
  - If this policy is enabled, disable it to allow the toggle to appear.

## Troubleshoot installation issues in the new Outlook client

### Installation issues due to policy restrictions
Admins who encountered user difficulties in installing new Outlook might have policies in place that prevent app download and installation.

Common scenarios include users attempting to switch from Desktop Outlook but finding the toggle reverts and new Outlook doesn't launch.

Registry keys set by Group Policy or third-party tools could block the MSIX package installation. For a complete list of registry keys: [How Group Policy works with packaged apps - MSIX](/windows/msix/group-policy-msix)

The notable registry keys impacting the installation of new Outlook's MSIX package include:
- BlockNonAdminUserInstall
- AllowAllTrustedApps
- AllowDevelopmentWithoutDevLicense

> [!Important]
> If **AllowAllTrustedApps** is disabled, the new Outlook app(MSIX) installation fails. This issue has been fixed in the Windows October cumulative update KB5031455 for [Windows 11](https://support.microsoft.com/topic/october-31-2023-kb5031455-os-builds-22621-2506-and-22631-2506-preview-6513c5ec-c5a2-4aaf-97f5-44c13d29e0d4) and [Windows 10](https://support.microsoft.com/topic/october-26-2023-kb5031445-os-build-19045-3636-preview-03f350cb-57f9-45e6-bfd7-438895d3c7fa). If this optional October update isn't available for your OS build, the November security update will include the fix.

The registry keys can be found at one of these locations:
- Computer\HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModelUnlock
- Computer\HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Appx

There are a few policies that could alter these registry keys and block app installation in your organization due to restricted policy set by the admins. Some of the known group policies that could prevent installation include:
- Prevent nonadmins users from installing packaged Windows apps
- Allow all trusted apps to install (disabled)

To check this setting for your computer:
1. In Windows, search for *Edit Group Policy* or right-click the Windows Key and select *Run > gpedit.msc*.
2. This command opens the *Local Group Policy Editor* screen.
3. Go to *Computer Configuration > Administrative Templates > Windows Components > App package Deployment* to check settings for these policies:
   - Prevent nonadmins users from installing packaged Windows apps
   - Allow all trusted apps to install
4. Make sure that value for these settings is set as follows:

   | Setting                                                   | Value          |
   |-----------------------------------------------------------|----------------|
   | Prevent nonadmins users from installing packaged Windows apps | Not configured |
   | Allow all trusted apps to install                             | Not configured |

### Firewalls
To download, install and get continuous updates for new Outlook, make sure proxy and firewall isn't blocking access to the Microsoft Store
- ``https://res.cdn.office.net``
- ``https://res.cdn.office.net/nativehost/5mttl/installer/``

### Blocking executables
Ensure there are no security policies or software blocking executables from running in the user’s temp directory.
- Examples of security programs include: AppLocker, Anti-Virus, Group Policy, third party security software.
- Win32 downloads the installer to %TEMP%, which is almost always inside of the C:\Users\ directory unless explicitly configured otherwise. If they're blocking exes in that directory, Desktop Outlook fails to start the installer.
- “NewOutlookInstaller.exe” is the filename that needs to execute.

### Delivery optimization
Download mode dictates which download sources clients are allowed to use when downloading Windows updates in addition to Windows Update servers. [Reset delivery optimization key](/windows/deployment/do/waas-delivery-optimization-reference#download-mode):

# [Windows 10](#tab/windows10)
- HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization
- Modify the regkey value: DODownloadMode to 0

# [Windows 11](#tab/windows11)
- HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization
- Setting the value for DODownloadMode to 100 (bypass) may cause installation to fail, as the bypass (100) setting is deprecated. Set this value to 0 instead.


## Other deployment options
#### Microsoft store is blocked
For organizations that disable access to the Windows Store, the installer can be directly accessed from the Office CDN.
To install new Outlook on a single computer with many users, follow these steps:
1. Download the [.exe installer](https://go.microsoft.com/fwlink/?linkid=2207851).
2. Launch PowerShell 7 as an administrator: Right-click the PowerShell icon and choose Run as Administrator.
3. Navigate to where the Setup.exe file is located.
4. Run the following command:
 ```powershell
 .\Setup.exe --provision true --quiet --start-*
 ```

#### Microsoft Store isn't blocked
Install new Outlook via Windows Package Manager (winget), when Microsoft Store isn't blocked:
1. Open PowerShell by pressing Windows + X and select Terminal (Windows 10 users select PowerShell).
2. Enter the following command to install the Microsoft Store version of new Outlook:
```powershell
winget install -i -e --id=9NRX63209R7B --source=msstore --accept-package-agreements
```
