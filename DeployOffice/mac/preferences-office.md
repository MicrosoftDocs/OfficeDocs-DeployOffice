---
title: "Set suite-wide preferences for Office for Mac"
ms.author: geokri
author: pbowden-msft
manager: dougeby
audience: ITPro
ms.topic: reference
ms.service: o365-proplus-itpro
ms.subservice: office-mac
ms.localizationpriority: medium
ms.collection: Tier3
recommendations: false
description: "Shows preferences that IT Pros can set for Office for Mac apps"
ms.date: 08/16/2023
---

# Set suite-wide preferences for Office for Mac

***Applies to:*** *Word for Mac, Excel for Mac, PowerPoint for Mac, Outlook for Mac, Office LTSC for Mac 2021, Office 2019 for Mac*

The following preferences can be used to simplify account setup for Microsoft 365 (or Office 365) and support a streamlined user experience.

As an IT admin, you may want to provide Mac users in your organization with a standard set of preferences for Office in either of the following ways:

- Set a default preference, which users can change.
- Force a particular preference, which users can’t change.

These keys are CFPreferences-compatible, which means that it can be set by using enterprise management software for Mac, such as Microsoft Intune and Jamf Pro.

The following list shows the preferences that are covered in this article:

- [Automatically sign in and suppress welcome dialogs](#automatically-sign-in-and-suppress-welcome-dialogs)
- [Specify Microsoft 365 sign in name to be added on first launch](#specify-microsoft-365-sign-in-name-to-be-added-on-first-launch)
- [App launch](#app-launch)
- [Security](#security)
- [User functionality](#user-functionality)
- [App installation](#app-installation)

## Sign in settings

### Automatically sign in and suppress welcome dialogs

|Category|Details|
|:-----|:-----|
|Domain| com.microsoft.office |
|Key| OfficeAutoSignIn |
|Data Type| Boolean |
|Possible values| false (default) <br/> true |
|Apps| Word, Excel, PowerPoint, Outlook, OneNote |
|Availability| 16.17 |
|Comments| This key suppresses first run dialogs for Word, Excel, PowerPoint, Outlook, and OneNote. |

### Specify Microsoft 365 sign in name to be added on first launch

Set the full email address of the Microsoft 365 user to be added on first launch.

|Category|Details|
|:-----|:-----|
|Domain| com.microsoft.office |
|Key| OfficeActivationEmailAddress|
|Data Type| String |
|Possible values| *Various (example: "bob@contoso.com")* |
|Apps| Word, Excel, PowerPoint, Outlook, OneNote |
|Availability| 16.18 |
|Comments| The sign in sheet for Word, Excel, PowerPoint, Outlook, and OneNote will be automatically populated with the specified value. |

## Security

### Cipher algorithm

Instruct Office applications to use a specific Cipher algorithm for IRM protection, such as Cipher Block Chaining (CBC) or Electronic Codebook (ECB).

|Category|Details|
|:-----|:-----|
|Domain| com.microsoft.office |
|Key| CompatibleEncryption |
|Data Type| Integer |
|Possible values| 1 = CBC (default)<br/> 2 = ECB |
|Apps| Word, Excel, PowerPoint |
|Availability| 16.72 |
|Comments| This preference applies to organizations that utilize the RMS service. For more information, see [https://aka.ms/Purview/CBCDetails](https://aka.ms/Purview/CBCDetails) |

## App launch

### What's New

Set preferences for the visibility of What's New information after app updates.

|Category|Details|
|:-----|:-----|
|Domain| com.microsoft.office |
|Key| ShowWhatsNewOnLaunch |
|Data Type| Boolean |
|Possible values| true (default) <br/> false |
|Apps| Word, Excel, PowerPoint, Outlook, OneNote |
|Availability| 16.16 |
|Comments| When set to false, users will not be shown information about new features and functionality. |

### Template gallery

Set preferences for automatically showing the template gallery.

|Category|Details|
|:-----|:-----|
|Domain| com.microsoft.office |
|Key| ShowDocStageOnLaunch |
|Data Type| Boolean |
|Possible values| true (default) <br/> false |
|Apps| Word, Excel, PowerPoint |
|Availability| 16.16 |
|Comments| When set to false, users will always start with the blank template when launching an app. |

## User functionality

### Default file location

Set preferences between cloud-based and local file storage.

|Category|Details|
|:-----|:-----|
|Domain| com.microsoft.office |
|Key| DefaultsToLocalOpenSave |
|Data Type| Boolean |
|Possible values| false (default) <br/> true |
|Apps| Word, Excel, PowerPoint |
|Availability| 16.16 |
|Comments| When set to true, users will first see the local file system when accessing the Open and Save dialogs. |

### Fonts

Set the ability for users to download and install cloud-based fonts.

|Category|Details|
|:-----|:-----|
|Domain| com.microsoft.office |
|Key| DisableCloudFonts |
|Data Type| Boolean |
|Possible values| false (default) <br/> true |
|Apps| Word, Excel, PowerPoint, Outlook, OneNote |
|Availability| 16.30 |
|Comments| When set to true, cloud-based fonts will not be visible to users when editing documents. |

## App installation

### Excluding apps

The following preferences can be used to prevent specific apps from being installed when using the *Suite* installer package.
This can be useful in scenarios where you want to take advantage of the size optimizations offered by the Suite installer, but need to prevent one or more apps from being installed. For example, you can prevent the OneDrive app from being installed as part of the Suite because you use a different cloud storage solution.

> [!IMPORTANT]
> The app exclusion preferences will only work with the Suite installer package. Other installation packages such as the individual app installers, and apps from the Mac AppStore will not read these preferences.

Exclude Word

|Category|Details|
|:-----|:-----|
|Domain| com.microsoft.office |
|Key| InstallWord |
|Data Type| Boolean |
|Possible values| true (default) <br/> false |
|Availability| 16.30 |
|Comments| This preference must be implemented through a Configuration Profile/MDM to be effective. It will not work when using the *defaults* command. |

Exclude Excel

|Category|Details|
|:-----|:-----|
|Domain| com.microsoft.office |
|Key| InstallExcel |
|Data Type| Boolean |
|Possible values| true (default) <br/> false |
|Availability| 16.30 |
|Comments| This preference must be implemented through a Configuration Profile/MDM to be effective. It will not work when using the *defaults* command. |

Exclude PowerPoint

|Category|Details|
|:-----|:-----|
|Domain| com.microsoft.office |
|Key| InstallPowerPoint |
|Data Type| Boolean |
|Possible values| true (default) <br/> false |
|Availability| 16.30 |
|Comments| This preference must be implemented through a Configuration Profile/MDM to be effective. It will not work when using the *defaults* command. |

Exclude Outlook

|Category|Details|
|:-----|:-----|
|Domain| com.microsoft.office |
|Key| InstallOutlook |
|Data Type| Boolean |
|Possible values| true (default) <br/> false |
|Availability| 16.30 |
|Comments| This preference must be implemented through a Configuration Profile/MDM to be effective. It will not work when using the *defaults* command. |

Exclude OneNote

|Category|Details|
|:-----|:-----|
|Domain| com.microsoft.office |
|Key| InstallOneNote |
|Data Type| Boolean |
|Possible values| true (default) <br/> false |
|Availability| 16.30 |
|Comments| This preference must be implemented through a Configuration Profile/MDM to be effective. It will not work when using the *defaults* command. |

Exclude OneDrive

|Category|Details|
|:-----|:-----|
|Domain| com.microsoft.office |
|Key| InstallOneDrive |
|Data Type| Boolean |
|Possible values| true (default) <br/> false |
|Availability| 16.30 |
|Comments| This preference must be implemented through a Configuration Profile/MDM to be effective. It will not work when using the *defaults* command. |

Exclude Teams

|Category|Details|
|:-----|:-----|
|Domain| com.microsoft.office |
|Key| InstallTeams |
|Data Type| Boolean |
|Possible values| true (default) <br/> false |
|Availability| 16.30 |
|Comments| This preference must be implemented through a Configuration Profile/MDM to be effective. It will not work when using the *defaults* command. |

Exclude Defender

|Category|Details|
|:-----|:-----|
|Domain| com.microsoft.office |
|Key| InstallDefender |
|Data Type| Boolean |
|Possible values| true (default) <br/> false |
|Availability| 16.75 |
|Comments| This preference must be implemented through a Configuration Profile/MDM to be effective. It will not work when using the *defaults* command. |

Exclude AutoUpdate

|Category|Details|
|:-----|:-----|
|Domain| com.microsoft.office |
|Key| InstallAutoUpdate |
|Data Type| Boolean |
|Possible values| true (default) <br/> false |
|Availability| 16.30 |
|Comments| This preference must be implemented through a Configuration Profile/MDM to be effective. It will not work when using the *defaults* command. |
## Related articles

- [Configuration Profile Reference (Apple developer documentation)](https://developer.apple.com/business/documentation/Configuration-Profile-Reference.pdf)
- [Set preferences for Outlook for Mac](preferences-outlook.md)
