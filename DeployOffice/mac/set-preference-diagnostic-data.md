---
title: "Set a preference for diagnostic data in Office for Mac"
ms.author: danbrown
author: pbowden-msft
manager: laurawi
ms.audience: ITPro
ms.topic: article
ms.date: 9/24/2018
ms.service: o365-proplus-itpro
localization_priority: Normal
ms.collection: Ent_O365
ms.custom: Ent_Office_Mac
description: "Shows IT Pros how to set a preference for diagnostic data, either full or basic, for Office for Mac"
---

# Set a preference for diagnostic data in Office for Mac

***Applies to:*** *Office for Mac, Office 2019 for Mac, Office 2016 for Mac*


Office for Mac collects diagnostic information which helps us find and fix problems, improve our products and services, and provide you with customized experiences.

The scope of diagnostic data sent to Microsoft depends on whether you choose **Full** or **Basic** as your diagnostic data setting. For additional details about Full and Basic, see [Diagnostic data in Office](https://support.office.com/article/f409137d-15d3-4803-a8ae-d26fcbfc91dd).

If you're an IT admin, you may want to define the level of diagnostics data collection for your organization.  The preference is per-application, and can be set via macOS Configuration Profiles, or manually from Terminal. Use the following information to configure a policy:

|||
|:-----|:-----|
|**Domain** <br/> | com.microsoft.Word  <br/> com.microsoft.Excel  <br/> com.microsoft.Powerpoint  <br/> com.microsoft.Outlook  <br/> com.microsoft.onenote.mac |
|**Key** <br/> |DiagnosticDataTypePreference  <br/> |
|**Data Type** <br/> |String  <br/> |
|**Possible values** <br/> |FullDiagnosticData  <br/> BasicDiagnosticData  <br/> |


The following example sets the diagnostic data to Full for Word, Excel, PowerPoint, Outlook, and OneNote by using Terminal.

    defaults write com.microsoft.Word DiagnosticDataTypePreference -string FullDiagnosticData
    defaults write com.microsoft.Excel DiagnosticDataTypePreference -string FullDiagnosticData
    defaults write com.microsoft.Powerpoint DiagnosticDataTypePreference -string FullDiagnosticData
    defaults write com.microsoft.Outlook DiagnosticDataTypePreference -string FullDiagnosticData
    defaults write com.microsoft.onenote.mac DiagnosticDataTypePreference -string FullDiagnosticData
    

This key is CFPreferences-compatible, which means that it can be set by using enterprise management software for Mac, such as Jamf Pro.
    
## See also

[Configuration Profile Reference (Apple developer documentation)](https://go.microsoft.com/fwlink/p/?linkid=852998)

[Deploy preferences for Office for Mac](deploy-preferences-for-office-for-mac.md)

