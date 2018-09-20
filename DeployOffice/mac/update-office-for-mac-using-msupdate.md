---
title: "Update Office for Mac by using msupdate"
ms.author: danbrown
author: pbowden-msft
manager: laurawi
ms.date: 9/24/2018
ms.audience: ITPro
ms.topic: article
ms.service: o365-proplus-itpro
localization_priority: Normal
ms.collection: Ent_O365
ms.custom: Ent_Office_Mac
description: "Provides admins with information about how to update Office for Mac from the command line by using msupdate"
---

# Update Office for Mac by using msupdate

***Applies to:*** *Office for Mac, Office 2019 for Mac, Office 2016 for Mac*

Microsoft AutoUpdate (MAU) version 3.18 and later includes the msupdate command-line tool. This can be used to start the Office for Mac update process, in addition to reporting the current AutoUpdate configuration. The tool is primarily designed for IT administrators so that they have more precise control over when updates are applied. Use the following steps to start using the tool:
1. Open the Terminal application
2. Enter `cd /Library/Application\ Support/Microsoft/MAU2.0/Microsoft\ AutoUpdate.app/Contents/MacOS`
3. Run `./msupdate --help`

The following options are displayed:
```
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
```

## Examples of how to use msupdate
- Display the current configuration parameters for AutoUpdate:
```./msupdate --config```
- Display the current configuration parameters in machine-readable format:
```./msupdate --config --format plist```
- List all available updates:
```./msupdate --list```
- Download and install all available updates:
```./msupdate --install```
- Download and install the latest updates for Word, Excel, and PowerPoint:
```./msupdate --install --apps mswd2019 xcel2019 ppt32019```
- Download and install a version-specific update for Outlook:
```./msupdate --install --apps opim2019 --version 16.17.180090901```

## Application identifiers
The following table lists the applications for Mac supported by AutoUpdate. The identifier is used when specifying the `--apps` parameter. When specifying multiple applications on the command-line, separate identifiers with a space.

| Application          |2019 version<sup>1</sup> | 2016 version<sup>2</sup> |
|:----------------------|:-----------|:-----------|
|Word           |mswd2019|mswd15      |
|Excel          |xcel2019|xcel15      |
|PowerPoint     |ppt32019|ppt315      |
|Outlook        |opim2019|opim15      |
|OneNote        |onmc2019|onmc15      |
|Skype for Business |msfb16| msfb16     |
|Remote Desktop         |msrd10| msrd10     |
|Intune Company Portal  |imcp01| imcp01     |


<sup>1</sup> These identifiers are used for Office 2019 for Mac, either a retail or a volume licensed version, and for Office for Mac (from an Office 365 plan) running on macOS version 10.12 (Sierra) or higher.

<sup>2</sup> These identifiers are used for Office 2016 for Mac, either a retail or a volume licensed version, and for Office for Mac (from an Office 365 plan) running on macOS version 10.11 (El Capitan) or earlier.

> [!NOTE]
> If you're using MAU version 4.1 or later, you can use either set of identifiers and MAU will automatically change them to the appropriate identifiers based on the criteria described in the footnotes above.


## Related topics

- [Deploy updates for Office for Mac](deploy-updates-for-office-for-mac.md)
- [Update history](https://docs.microsoft.com/officeupdates/update-history-office-for-mac) and [release notes](https://docs.microsoft.com/officeupdates/release-notes-office-for-mac) for Office for Mac
