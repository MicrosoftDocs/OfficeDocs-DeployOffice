---
title: "Set Office License Info for updates for Microsoft AutoUpdate"
ms.author: ppark
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: conceptual
ms.service: o365-proplus-itpro
ms.subservice: office-mac
ms.localizationpriority: medium
ms.collection: Tier2
recommendations: false
description: "Provides admins with information about how to ensure Microsoft Office Apps (Version 16.79 and later) receive updates by activating licenses and adjusting Microsoft AutoUpdate preferences for both subscription and volume licenses."
ms.date: 03/13/2024
---

# Set Office License Info for updates for Microsoft AutoUpdate

Starting with Microsoft Office Apps Version 16.79 for Word, Excel, PowerPoint, and Outlook, you need to activate your license to receive updates for Version 16.79 and later. This is required for both subscription and volume licenses.

Microsoft Office applications automatically update Microsoft AutoUpdate preferences to ensure they follow the correct update paths. However, if IT admins manage Microsoft AutoUpdate preferences, they might need to manually adjust the plist files to allow updates for Microsoft Office Version 16.79 and later.

The following examples show how to update Microsoft AutoUpdate preference settings, enabling updates for Microsoft Office Version 16.79 and later.

> [!IMPORTANT]
> If you update Microsoft Office Apps with an incorrect license after Version 16.79, the functionality becomes severely limited, restricting applications to read-only mode.

## Preference AppCustomPref

You can manually tell Microsoft AutoUpdate what kind of license the Microsoft Office Apps have. Use the following preference settings:

| Category        | Details                          |
|-----------------|----------------------------------|
| Domain          | com.microsoft.autoupdate2        |
| Key             | AppCustomPref                    |
| Data Type       | Dictionary                       |
| Possible values | Key: Path to each of the apps <br/> Content: Dictionary <br/> &nbsp;&nbsp; Key: Various <br/> &nbsp;&nbsp; Value: Various |
| Comments        | There's no default value         |

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
    	<string>2021-Consumer</string>
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
This example allows Excel, PowerPoint, and Word to be updated beyond Version 16.78 and Version 16.79.
</li></ul>

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
    <string>XCEL2019</string>
    <key>LCID</key>
    <string>1033</string>
    </dict>
… 
</dict>
```