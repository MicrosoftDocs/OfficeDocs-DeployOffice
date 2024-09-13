---
title: "Set preferences for macro security in Office for Mac"
ms.author: geokri
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: reference
ms.service: o365-proplus-itpro
ms.subservice: office-mac
ms.localizationpriority: medium
ms.collection: Tier3
recommendations: false
description: "Shows IT Pros how to set macro security for Office for Mac by using preferences"
ms.date: 05/22/2024
---

# Set preferences for macro security in Office for Mac

***Applies to:*** *Microsoft 365 for Mac, Office Long Term Service Channel (LTSC) for Mac 2024, LTSC for Mac 2021*

As an IT admin, you can provide Mac users with a standard set of Office preferences in these ways:

- Set a default setting, which users can change.
- Force a particular setting, which users can't change.

The following preferences can be used to improve security posture and help protect company data.

These keys are CFPreferences-compatible, which means that they can be set by using enterprise management software for Mac, such as Jamf Pro.

## Visual Basic macro notifications
Controls whether macros are allowed to run, and what the user experience is when opening a file that contains a macro. 
  
:::image type="content" source="../mac/media/set-preference-macro-security-office-for-mac/security-and-privacy-settings.png" alt-text="Screenshot of the Security & Privacy settings window for Office for Mac, showing Macro Security and Privacy options.":::
  
|Category|Details|
|:-----|:-----|
|**Domain** <br/> | com.microsoft.office  <br/> |
|**Key** <br/> |VisualBasicMacroExecutionState  <br/> |
|**Data Type** <br/> |String  <br/> |
|**Possible values** <br/> |DisabledWithWarnings  *(default)*  <br/> DisabledWithoutWarnings  <br/> EnabledWithoutWarnings  *(not recommended)*  <br/> |
|**Apps** <br/> |Word, Excel, PowerPoint <br/> |
|**Availability** <br/> |15.33  <br/> |
|**Comments** <br/> |The user interface is disabled if this preference is set via a Configuration Profile.  <br/> |

## VBA object model
Set the ability for macros to modify Visual Basic projects.

|Category|Details|
|:-----|:-----|
|**Domain** <br/> | com.microsoft.office  <br/> |
|**Key** <br/> |VBAObjectModelIsTrusted  <br/> |
|**Data Type** <br/> |Boolean  <br/> |
|**Possible values** <br/> |false  *(default)*  <br/> true  <br/>|
|**Apps** <br/> |Word, Excel, PowerPoint <br/> |
|**Availability** <br/> |16.21  <br/> |
|**Comments** <br/> |To improve security, forcibly set this value to false via a Configuration Profile.  <br/> |

## Visual Basic system bindings
Set the ability for Visual Basic macros to use DECLARE via the system() API.

|Category|Details|
|:-----|:-----|
|**Domain** <br/> | com.microsoft.office  <br/> |
|**Key** <br/> |AllowVisualBasicToBindToSystem  <br/> |
|**Data Type** <br/> |Boolean  <br/> |
|**Possible values** <br/> |false  *(default)*  <br/> true  <br/>|
|**Apps** <br/> |Word, Excel, PowerPoint <br/> |
|**Availability** <br/> |15.31  <br/> |
|**Comments** <br/> |To improve security, forcibly set this value to false via a Configuration Profile.  <br/> |

## Visual Basic external library bindings
Set the ability for Visual Basic macros to utilize non-Microsoft dynamic libraries.

|Category|Details|
|:-----|:-----|
|**Domain** <br/> | com.microsoft.office  <br/> |
|**Key** <br/> |DisableVisualBasicExternalDylibs  <br/> |
|**Data Type** <br/> |Boolean  <br/> |
|**Possible values** <br/> |false  *(default)*  <br/> true  <br/>|
|**Apps** <br/> |Word, Excel, PowerPoint <br/> |
|**Availability** <br/> |15.31  <br/> |
|**Comments** <br/> |Unless non-Microsoft extensions are being used, set this value to true via a Configuration Profile to improve security.  <br/> |

## Visual Basic pipe bindings
Set the ability for Visual Basic macros to communicate with other processes through pipes.

|Category|Details|
|:-----|:-----|
|**Domain** <br/> | com.microsoft.office  <br/> |
|**Key** <br/> |DisableVisualBasicToBindToPopen <br/> |
|**Data Type** <br/> |Boolean  <br/> |
|**Possible values** <br/> |false  *(default)*  <br/> true  <br/>|
|**Apps** <br/> |Word, Excel, PowerPoint <br/> |
|**Availability** <br/> |16.16  <br/> |
|**Comments** <br/> |Unless non-Microsoft extensions are being used, set this value to true via a Configuration Profile to improve security.  <br/> |

## Visual Basic and AppleScript
Set the ability for Visual Basic macros to invoke AppleScript.

|Category|Details|
|:-----|:-----|
|**Domain** <br/> | com.microsoft.office  <br/> |
|**Key** <br/> |DisableVisualBasicMacScript <br/> |
|**Data Type** <br/> |Boolean  <br/> |
|**Possible values** <br/> |false  *(default)*  <br/> true  <br/>|
|**Apps** <br/> |Word, Excel, PowerPoint <br/> |
|**Availability** <br/> |16.16  <br/> |
|**Comments** <br/> |To improve security, set this value to false via a Configuration Profile.  <br/> |

## Disable Visual Basic
Prevent all Visual Basic code from running - even from trusted locations like the default template.

|Category|Details|
|:-----|:-----|
|**Domain** <br/> | com.microsoft.office  <br/> |
|**Key** <br/> |VisualBasicEntirelyDisabled <br/> |
|**Data Type** <br/> |Boolean  <br/> |
|**Possible values** <br/> |false  *(default)*  <br/> true  <br/>|
|**Apps** <br/> |Word, Excel, PowerPoint <br/> |
|**Availability** <br/> |16.32  <br/> |
|**Comments** <br/> |Unless non-Microsoft extensions are being used, set this value to true via a Configuration Profile to improve security.  <br/> |

## Related articles

- [Configuration Profile Reference (Apple developer documentation)](https://developer.apple.com/business/documentation/Configuration-Profile-Reference.pdf)
- [Deploy preferences for Office for Mac](deploy-preferences-for-office-for-mac.md)
