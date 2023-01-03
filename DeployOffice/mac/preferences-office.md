---
title: "Set suite-wide preferences for Office for Mac"
ms.author: danbrown
author: DHB-MSFT
manager: dougeby
audience: ITPro
ms.topic: article
ms.service: o365-proplus-itpro
ms.subservice: office-mac
ms.localizationpriority: medium
ms.collection: Ent_O365
recommendations: false
description: "Shows preferences that IT Pros can set for Office for Mac apps"
---

# Set suite-wide preferences for Office for Mac

***Applies to:*** *Word for Mac, Excel for Mac, PowerPoint for Mac, Outlook for Mac, Office LTSC for Mac 2021, Office 2019 for Mac*

As an IT admin, you may want to provide Mac users in your organization with a standard set of preferences for Office in either of the following ways:

- Set a default preference, which users can change.
- Force a particular preference, which users can’t change.

The following preferences can be used to simplify account setup for Microsoft 365 (or Office 365) and support a streamlined user experience.

These keys are CFPreferences-compatible, which means that it can be set by using enterprise management software for Mac, such as Jamf Pro.

The following list shows the preferences that are covered in this article:

- [Automatically sign in and suppress welcome dialogs](#automatically-sign-in-and-suppress-welcome-dialogs)
- [Specify Microsoft 365 sign in name to be added on first launch](#specify-microsoft-365-sign-in-name-to-be-added-on-first-launch)

## Sign in settings

### Automatically sign in and suppress welcome dialogs

|Category|Details|
|:-----|:-----|
|Domain| com.microsoft.office |
|Key| OfficeAutoSignIn  |
|Data Type| Boolean |
|Possible values| false (default) <br/> true |
|Availability|16.17 |
|Comments| This key suppresses first run dialogs for Word, Excel, PowerPoint, Outlook, and OneNote.  |

### Specify Microsoft 365 sign in name to be added on first launch

Set the full email address of the Microsoft 365 user to be added on first launch.

|Category|Details|
|:-----|:-----|
|Domain| com.microsoft.office |
|Key| OfficeActivationEmailAddress|
|Data Type| String|
|Possible values| *Various (example: "bob@contoso.com")*  |
|Availability|16.18 |
|Comments| The sign in sheet for Word, Excel, PowerPoint, Outlook, and OneNote will be automatically populated with the specified value.  |

## Related articles

- [Configuration Profile Reference (Apple developer documentation)](https://developer.apple.com/business/documentation/Configuration-Profile-Reference.pdf)
- [Set preferences for Outlook for Mac](preferences-outlook.md)
