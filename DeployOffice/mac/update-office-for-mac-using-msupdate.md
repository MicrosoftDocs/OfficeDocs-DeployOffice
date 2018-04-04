---
title: "Update Office 2016 for Mac by using msupdate"
ms.author: danbrown
author: DHB-MSFT
manager: laurawi
ms.date: 4/10/2018
ms.audience: ITPro
ms.topic: article
ms.service: o365-proplus-itpro
localization_priority: Normal
ms.collection: Ent_O365
ms.custom: Ent_Office_Mac
description: "Provides admins with information about how to update Office 2016 for Mac from the command line by using msupdate"
---

# Update Office 2016 for Mac by using msupdate

Microsoft AutoUpdate versions 3.18 and later include the `msupdate` command-line tool. This can be used to start the Office update process, in addition to reporting the current AutoUpdate configuration. The tool is primarily designed for IT administrators so that they have more precise control over when Office updates are applied. Use the following steps to start using the tool:
1. Open the `Terminal` application
2. Enter `cd /Library/Application\ Support/Microsoft/MAU2.0/Microsoft\ AutoUpdate.app/Contents/MacOS`
3. Run `./msupdate --help`

The following options will be displayed:
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

## Examples
1. Display the current configuration parameters for AutoUpdate
```./msupdate --config```
2. Display the current configuration parameters in machine-readable format
```./msupdate --config --format plist```
3. List all available updates
```./msupdate --list```
4. Download and install all available updates
```./msupdate --install```
5. Download and install the latest updates for Word, Excel, and PowerPoint
```./msupdate --install --apps mswd15,xcel15,ppt315```
6. Download and install a version-specific update for Outlook
```./msupdate --install --apps opim15 --version 15.41.17120500```

## Application identifiers
The following table lists the applications supported by AutoUpdate. The identifier is used when specifying the `--apps` parameter:

| Application           | Identifier |
|:----------------------|:-----------|
|Word for Mac           |mswd15      |
|Excel for Mac          |xcel15      |
|PowerPoint for Mac     |ppt315      |
|Outlook for Mac        |opim15      |
|OneNote for Mac        |onmc15      |
|Skype Business for Mac | msfb16     |
|Remote Desktop         | msrd10     |
|Intune Company Portal  | imcp01     |
