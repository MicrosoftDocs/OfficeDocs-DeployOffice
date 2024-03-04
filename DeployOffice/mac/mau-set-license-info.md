---
title: "Set Office License Info for updates for Microsoft AutoUpdate"
ms.author: pbowden
author: pbowden-msft
manager: dougeby
audience: ITPro
ms.topic: conceptual
ms.service: o365-proplus-itpro
ms.subservice: office-mac
ms.localizationpriority: medium
ms.collection: Tier2
recommendations: false
description: "Provides admins with information about how to ensure Microsoft Office Apps (Version 16.79 and later) receive updates by activating licenses and adjusting Microsoft AutoUpdate preferences for both subscription and volume licenses."
ms.date: 03/04/2024
---

# Set Office License Info for updates for Microsoft AutoUpdate

Beginning with Microsoft Office Apps Version 16.79 (including Word, Excel, PowerPoint, and Outlook), you must activate your license to get updates for Version 16.78 and later. This requirement applies to both subscription and volume licenses.

To help with this transition, Microsoft Office applications write to Microsoft AutoUpdate preferences to ensure the correct update paths are followed.

In normal operations, this update happens automatically. However, if IT admins manage Microsoft AutoUpdate preferences, manual adjustments to the plist files might be necessary.

The following examples show updates to Microsoft AutoUpdate Preference settings to allow updates for Microsoft Office beyond Version 16.78 and Version 16.79.

Alternatively, you can install Microsoft Office Apps Version 16.82 and later and bypass the following section.

> [!ATTNETION]
> Functionality is severely limited (applications are in read-only mode) if Microsoft Office Apps are updated beyond Version 16.79 with an incorrect license.

## Preference AppCustomPref

You can manually tell Microsoft AutoUpdate what kind of license the Microsoft Office Apps have. Use the following preference settings:

| Category   | Details                                                                                   |
|------------|-------------------------------------------------------------------------------------------|
| Domain     | com.microsoft.autoupdate2                                                                |
| Key        | AppCustomPref                                                                             |
| Data Type  | Dictionary                                                                                |
| Possible values | Key: Path to each of the apps <br/> Content: Dictionary <br/> Key: Various <br/> Value: Various|
| Comments   | There's no default value.                                                                |

> [!NOTE]
> Keys and values are 'contracts' between the application and Microsoft AutoUpdate and therefore may change for each application. 

The following examples show what is currently active:
<ul>
<li>You have a perpetual 2021 consumer license for Excel and Word, but only have a perpetual 2019 consumer license for PowerPoint. The following preference setting in Microsoft AutoUpdate is required: 

```xml
<key>AppCustomPref</key> 
<dict>
    <key>/Applications/Microsoft Excel.app</key> 
    <dict> 
    	<key>OfficeActivationLicense</key> 
    	<string>2021-Consumer </string> 
    </dict> 
    
    <key>/Applications/Microsoft Word.app</key> 
    <dict> 
    	<key>OfficeActivationLicense</key> 
    	<string>2021-Consumer</string> 
    </dict> 
    
    <key>/Applications/Microsoft PowerPoint.app</key> 
    <dict> 
    	<key>OfficeActivationLicense</key> 
    	<string>2019-Consumer</string> 
    </dict> 
</dict> 
```

This configuration allows Microsoft AutoUpdate to offer updates for Excel and Word beyond Version 16.78 and Version 16.79. However, it only updates PowerPoint up to Version 16.78, then stops.</li>

<li>You have Subscription licenses for Excel, PowerPoint, and Word. Following preference setting in Microsoft AutoUpdate is required: 

```xml
<key>AppCustomPref</key> 
<dict>
    <key>/Applications/Microsoft Excel.app</key> 
    <dict> 
    	<key>OfficeActivationLicense</key> 
    	<string>Subscription</string> 
    </dict> 
    
    <key>/Applications/Microsoft Word.app</key> 
    <dict> 
    	<key>OfficeActivationLicense</key> 
    	<string>Subscription</string> 
    </dict> 
    
    <key>/Applications/Microsoft PowerPoint.app</key> 
    <dict> 
    	<key>OfficeActivationLicense</key> 
    	<string>Subscription</string> 
    </dict>
</dict>
```
This example allows Excel, PowerPoint, and Word to be updated beyond Version 16.78 and Version 16.79.</li>

## App Domain

Microsoft Office Apps Version 16.78 writes out applicable license info to respective application preferences. Microsoft AutoUpdate uses "App Domain" entry on each of the registered application to locate needed information. 

For this process to work, the following entry is required in the application registry within the Microsoft AutoUpdate preferences. Here's an example of the necessary entry:

```xml
<key>Applications</key> 
<dict>  
…. 
    <key>/Applications/Microsoft Excel.app</key> 
    <dict> 
    
    <key>App Domain</key> 
    <string>com.microsoft.office</string> 
    <key>Application ID</key> 
    <string>Excel2019</string> 
    <key>LCID</key> 
    <string>1033</string> 
</dict> 
… 
</dict> 
```