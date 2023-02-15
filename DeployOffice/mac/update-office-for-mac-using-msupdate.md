---
title: "Update Microsoft applications for Mac by using msupdate"
ms.author: pbowden
author: pbowden-msft
manager: dougeby
audience: ITPro
ms.topic: article
ms.service: o365-proplus-itpro
ms.subservice: office-mac
ms.localizationpriority: medium
ms.collection: tier3
recommendations: false
description: "Provides admins with information about how to update Office and other Microsoft applications for Mac from the command line by using msupdate"
ms.date: 04/03/2018
---

# Update Microsoft applications for Mac by using msupdate

Microsoft AutoUpdate (MAU) version 3.18 and later includes the msupdate command-line tool. The msupdate tool can be used to start the update process for Microsoft applications produced for Mac, such as Office. The tool is primarily designed to give IT administrators more precise control over when updates are applied. You can download the latest version of MAU from [this link](https://go.microsoft.com/fwlink/p/?linkid=830196).

msupdate works by using native XPC to communicate with the MAU daemon. On macOS 10.14 Mojave and later, you may see a privacy prompt when running msupdate for the first time. If you're using an enterprise management tool such as Jamf Pro, you should deploy a Privacy Preferences Policy Control (PPPC) payload to pre-approve access. Samples of such a payload can be downloaded from [GitHub](https://github.com/pbowden-msft/MobileConfigs/tree/master/Jamf-MSUpdate).

Use the following steps to start using the tool:
1. Open the Terminal application
2. Enter `cd /Library/Application\ Support/Microsoft/MAU2.0/Microsoft\ AutoUpdate.app/Contents/MacOS`
3. Run `./msupdate --help`

The following options are displayed:
```console
 usage: msupdate <command> [<args> ...] <modifier> 

 Commands: 
    -h | --help           Show usage information 
    -c | --config         Display current AutoUpdate configuration 
    -l | --list           List available updates for installed Microsoft applications 
    -i | --install        Download and install available updates 

 Modifiers: 
    -a | --apps <app>     Install specific application updates 
    -v | --version <app>  Only update to a specific version 
    -w | --wait <secs>    Number of seconds to wait for action to complete before returning the current state of the install command 
    -f | --format         Format output results in the specified format 
        p | plist         Property list format
    -t | --terminate <secs>  Number of seconds to wait before closing opened applications in order for updates to complete
       -m | --message <msg>  Optional message to display on macOS banner notification to notify user
```

## Examples of how to use msupdate
- Display the current configuration parameters for MAU:
`./msupdate --config`
- Display the current configuration parameters in machine-readable format:
`./msupdate --config --format plist`
- List all available updates:
`./msupdate --list`
- Download and install all available updates:
`./msupdate --install`
- Download and install the latest updates for Word, Excel, and PowerPoint:
`./msupdate --install --apps MSWD2019 XCEL2019 PPT32019`
- Download and install a version-specific update for Outlook:
`./msupdate --install --apps OPIM2019 --version 16.17.180090901`
- Download and install latest available updates for Excel, wait for 180 seconds (3 minutes) before closing Excel, and display "Excel will close in 3 minutes to install updates." on macOS banner notification to notify user:
`./msupdate --install --apps XCEL2019 -t 180 -m "Excel will close in 3 minutes to install updates."`

> [!NOTE]
> To use the -t and -m modifiers, you must be using Microsoft AutoUpdate 4.24 or later.

## Application identifiers
The following table lists the Microsoft applications for Mac supported by MAU. The identifier is used when specifying the `--apps` parameter. When specifying multiple applications on the command-line, separate identifiers with a space.

| Application          |Identifier |
|:----------------------|:-----------|
|Word           |MSWD2019|
|Excel          |XCEL2019|
|PowerPoint     |PPT32019|
|Outlook        |OPIM2019|
|OneNote        |ONMC2019|
|MAU              |MSau04|
|OneDrive  |ONDR18|
|Teams  |TEAMS10|
|Skype for Business |MSFB16|
|Remote Desktop         |MSRD10|
|Intune Company Portal  |IMCP01|
|Microsoft Defender for Endpoint  |WDAV00|
|Microsoft Edge Canary |EDCN01|
|Microsoft Edge Dev  |EDDV01|
|Microsoft Edge Beta |EDBT01|
|Microsoft Edge Stable |EDGE01 |
|Licensing helper tool|OLIC02|

> [!NOTE]
> - The identifiers for the Office apps, such as Word and Outlook, can be used for the following versions:
>   - Office for Mac (Microsoft 365 or Office 365 subscription plan)
>   - Office LTSC for Mac 2021 (volume license)
>   - Office 2019 for Mac (retail or volume license)
> - If an update is pending for MAU itself, that update must be applied before any applications can be updated.
> - Identifiers are not case-sensitive when run interactively from the command-line, but use the character casing in the table when running from a management tool such as Jamf Pro.
> - Microsoft Teams might use MAU to provide updates in some scenarios, such as if the Teams updater fails. But, you can't use msupdate to have MAU manage updates for Teams, because Teams doesn't provide admins the ability to deploy and manage updates. Instead, Teams is updated automatically approximately every two weeks with new features and quality updates. For more information, see [Teams update process](/microsoftteams/teams-client-update).

## Related articles

- [Deploy updates for Office for Mac](deploy-updates-for-office-for-mac.md)
- [Update history for Office for Mac](/officeupdates/update-history-office-for-mac)
- [Release notes for Office for Mac](/officeupdates/release-notes-office-for-mac)
