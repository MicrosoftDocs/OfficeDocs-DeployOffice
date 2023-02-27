---
title: "Set preferences for macro security in Office for Mac"
ms.author: pbowden
author: pbowden-msft
manager: dougeby
audience: ITPro
ms.topic: article
ms.service: o365-proplus-itpro
ms.subservice: office-mac
ms.localizationpriority: medium
ms.collection: Tier3
recommendations: false
description: "Shows IT Pros how to set macro security for Office for Mac by using preferences"
ms.date: 03/01/2023
---

# Set preferences for macro security in Office for Mac

***Applies to:*** *Office for Mac, Office LTSC for Mac 2021, Office 2019 for Mac*

As an IT admin, you may want to provide Mac users in your organization with a standard set of preferences for Office in either of the following ways:

- Set a default setting, which users can change.
- Force a particular setting, which users can't change.

The following preferences can be used to improve security posture and help protect company data.

These keys are CFPreferences-compatible, which means that they can be set by using enterprise management software for Mac, such as Jamf Pro.

## Visual Basic macro notifications
Controls whether macros are allowed to run, and what the user experience is when opening a file that contains a macro. 
  
![Shows the macro security options for Security &amp; Privacy.](../images/48dc9e7f-d4d0-4603-9a50-7112f40805c9.png)
  
|Category|Details|
|:-----|:-----|
|**Domain** <br/> | com.microsoft.office  <br/> |
|**Key** <br/> |VisualBasicMacroExecutionState  <br/> |
|**Data Type** <br/> |String  <br/> |
|**Possible values** <br/> |DisabledWithWarnings  *(default)*  <br/> DisabledWithoutWarnings  <br/> EnabledWithoutWarnings  *(not recommended)*  <br/> |
|**Apps** <br/> |Word, Excel, PowerPoint <br/> |
|**Availability** <br/> |15.33  <br/> |
|**Comments** <br/> |The user interface will be disabled if this preference is set via a Configuration Profile.  <br/> |

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
Set the ability for Visual Basic macros to utilize third-party dynamic libraries.

|Category|Details|
|:-----|:-----|
|**Domain** <br/> | com.microsoft.office  <br/> |
|**Key** <br/> |DisableVisualBasicExternalDylibs  <br/> |
|**Data Type** <br/> |Boolean  <br/> |
|**Possible values** <br/> |false  *(default)*  <br/> true  <br/>|
|**Apps** <br/> |Word, Excel, PowerPoint <br/> |
|**Availability** <br/> |15.31  <br/> |
|**Comments** <br/> |Unless third-party extensions are being used, set this value to true via a Configuration Profile to improve security.  <br/> |

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
|**Comments** <br/> |Unless third-party extensions are being used, set this value to true via a Configuration Profile to improve security.  <br/> |

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
|**Comments** <br/> |Unless third-party extensions are being used, set this value to true via a Configuration Profile to improve security.  <br/> |

## Related articles

- [Configuration Profile Reference (Apple developer documentation)](https://developer.apple.com/business/documentation/Configuration-Profile-Reference.pdf)
- [Deploy preferences for Office for Mac](deploy-preferences-for-office-for-mac.md)
