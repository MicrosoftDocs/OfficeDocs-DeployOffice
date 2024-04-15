---  
title: Configuring Preferences for Microsoft AutoUpdate (MAU) in Microsoft 365 Enterprise
ms.author:  geokri
author:  pbowden-msft
manager: dougeby
audience: ITPro
ms.topic: conceptual
ms.service: o365-proplus-itpro
ms.subservice: office-mac
ms.localizationpriority: medium
ms.collection: Tier2
recommendations: false 
ai-usage: ai-assisted
description: Learn how to use preferences for Microsoft AutoUpdate (MAU) in Microsoft 365 Enterprise to meet the needs of various users.
ms.date: 04/9/2024 
---  

# Configuring Preferences for Microsoft AutoUpdate (MAU) in Microsoft 365 Enterprise

As an admin for Microsoft 365 Enterprise, you can tailor Microsoft AutoUpdate (MAU) preferences to meet the diverse needs of your users. This article provides an overview of preferences for MAU and helps you understand the documented preferences available.

## What are Preferences for MAU?

Preferences for MAU are settings that allow you to customize the behavior of Microsoft AutoUpdate, which is responsible for keeping Office applications up-to-date. By setting these preferences, you manage update frequency and channels, ensuring users receive the latest features and security updates with minimal disruptions.

For more detailed information on preferences and their deployment, visit [Deploy preferences for Office for Mac](../mac/update-office-for-mac-using-msupdate.md).

### UpdateCheckInterval

IT Admins shouldn't set the preferences marked as `Manageable == No`.

There are several locations where preferences for MAU are kept. Here are some:

- **User Preference**: `~/Library/Preferences/`
- **Managed Profile**: `/Library/Managed\ Preferences/`
- **System Preference**: `/Library/Preferences/`

### AcknowledgedDataCollectionPolicy

Stores user's choice on data collection policy acknowledgment. This policy helps ensure that users are aware of the data collection policies in place.

| Category | Details |
| --- | --- |
| Domain | com.microsoft.autoupdate2 |
| Type | String |
| Default Value | |
| Manageable | Yes |
| Accepted Values | RequiredDataOnly |
| Comments | Not setting, or setting this policy incorrectly leads to Microsoft AutoUpdate (MAU):<br>• Repeatedly showing Data Collection policy <br>• Not offering updates. |

### HowToCheck

Specifies how Microsoft AutoUpdate checks for updates.

| Category | Details |
| --- | --- |
| Domain | com.microsoft.autoupdate2 |
| Type | String |
| Default Value | AutomaticDownload |
| Manageable | Yes |
| Accepted Values | AutomaticDownload, AutomaticCheck |
| Comments | Not having this entry, or having an invalid entry reverts MAU to the default "AutomaticDownload" mode.<br>The following values are deprecated:<br>• Manual<br>• Automatic<br>Note: Setting to Manual results in MAU not offering updates automatically. |

### ChannelName

ChannelName specifies which update channel Microsoft AutoUpdate receives updates from.

| Category | Details |
| --- | --- |
| Domain | com.microsoft.autoupdate2 |
| Type | String |
| Default Value | Current |
| Manageable | Yes |
| Accepted Values | Beta, Current, CurrentThrottle, Custom, Preview |
| Comments | Not having this entry, or having an invalid entry in ChannelName reverts MAU to the default 'Current' channel.<br>Following values are deprecated and should no longer be used:<br>• External (replaced by Preview)<br>• InsiderFast (replaced by Beta)<br>• Production (replaced by Current)<br><br>Note: "Custom" is provided to help facilitate hosting updates within an organization, to reduce external network traffic. In such a case, IT Admin is responsible for:<br>• Manage server space within the organization<br>• Downloading manifests to specified manifest server location<br>• Downloading update packages to specified update cache location (if applicable) |

#### Notes on Channels:

- **Current** – Any official releases are released to this channel. Current channel is the default value.
- **CurrentThrottle** – Created to allow people to skip "weekly" Outlook releases in Current channel.
- **Custom** – Channel to be used if internal servers are to be utilized.
- **Preview** – Preview of official releases. Office apps are available usually two weeks before the official release.
- **Beta** – Absolute latest in development. Office apps updated two times a week. Only to be used for testing and error reporting purposes. Product support not be available in this channel.

### ManifestServer

URL for the server hosting update manifests. MAU downloads update manifests from this location when ChannelName is set to Custom.

| Category | Details |
| --- | --- |
| Domain | com.microsoft.autoupdate2 |
| Type | String |
| Default Value | |
| Manageable | Yes |
| Comments | Must point to a valid URL hosting update manifest files. List of files to be hosted are:<br>• *-chk.xml<br>• *.xml<br>• *.cat<br><br>ChannelName should be set to Custom in order to make meaningful use of this preference.<br>Also, if ChannelName is set to Custom and this preference isn't set, MAU treats this as Current channel. |

The latest published manifest files can be found under Available in the current channel, [https://officecdnmac.microsoft.com/pr/C1297A47-86C4-4C1F-97FA-950631F94777/MacAutoupdate/](https://officecdnmac.microsoft.com/pr/C1297A47-86C4-4C1F-97FA-950631F94777/MacAutoupdate/).

### UpdateCache

The URL for the server hosting the update packages. MAU downloads update packages from this server location instead of the location specified in the .xml manifest file.

| Category | Details |
| --- | --- |
| Domain | com.microsoft.autoupdate2 |
| Type | String |
| Default Value | |
| Manageable | Yes |
| Comments | Set this value to avoid high external download traffic by pointing clients to an internal update server.<br>Not having correct update package at this location results in "Download Error" being reported. |

### EnableFallbackChannel

Allows Microsoft AutoUpdate to look for updates in the Current channel if the specified channel doesn't have updates available.

| Category | Details |
| --- | --- |
| Domain | com.microsoft.autoupdate2 |
| Type | Boolean |
| Default Value | TRUE |
| Manageable | Yes |
| Accepted Values | TRUE / FALSE / 1 / 0 |
| Comments | |

### DisableOptInNotification

When set to TRUE, prevents Opt-In notification/pop-up window from showing even when HowToCheck is set to Automatic.

| Category | Details |
| --- | --- |
| Domain | com.microsoft.autoupdate2 |
| Type | Boolean |
| Default Value | FALSE |
| Manageable | Yes |
| Accepted Values | TRUE / FALSE / 1 / 0 |
| Comments | Not having this entry, or setting the entry to FALSE results in Opt-In popup window showing if HowToCheck is set to Automatic.<br>Should be ignored if HowToCheck setting is NOT Automatic. |

### LastUpdate

DO NOT USE. MAU uses this preference to keep track of when it last checked for updates. MAU doesn't check for updates for another 12 hours (minimum) from this time.

| Category | Details |
| --- | --- |
| Domain | com.microsoft.autoupdate2 |
| Type | Date |
| Default Value | |
| Manageable | No |
| Comments | Important: Managed profile should NOT contain this entry.<br>Setting this value via managed profile has the following consequences:<br>• If this value is set to future - MAU doesn't check for updates until 12 hours from this time is passed.<br>• If this value is set to past / Incorrect format - MAU checks for updates every two hours. |

### DisableVoiceOverAccessibility

DEPRECATED. If set to TRUE, this causes VoiceOver accessibility features to be disabled in Microsoft AutoUpdate. This option is deprecated.

| Category | Details |
| --- | --- |
| Domain | com.microsoft.autoupdate2 |
| Type | Boolean |
| Default Value | FALSE |
| Manageable | Yes |
| Comments | Deprecated from MAU 4.70. |

### ReopenAfterGUIInstall

DO NOT USE. If set to TRUE, MAU GUI opens on first launch. This preference will be removed after the first GUI launch following MAU update.

| Category | Details |
| --- | --- |
| Domain | com.microsoft.autoupdate2 |
| Type | Boolean |
| Default Value | FALSE |
| Manageable | No |
| Comments | Important: Managed profile shouldn't contain this entry.<br>Setting this value to TRUE via managed profile causes MAU GUI to open with every FBA process launch. |

### ManifestServerExpiryDate

DO NOT USE. Sets the date when ManifestServer setting expires. Currently in use by Teams21 ONLY.

| Category | Details |
| --- | --- |
| Domain | com.microsoft.autoupdate2 |
| Type | Date |
| Default Value | |
| Manageable | No |
| Comments | After the indicated date, ManifestServer entry will be removed, effectively reverting the updates to use Current (default) channel instead. |

### Applications

Lists application registrations. This dictionary can include keys for specific applications and details about how they should be updated. Useful for managing updates on a per-application basis.

Note: For a list of supported AppIDs, see: [Application identifiers](../mac/update-office-for-mac-using-msupdate.md#application-identifiers)

| Category | Details |
| --- | --- |
| Domain | com.microsoft.autoupdate2 |
| Type | Dictionary |
| Default Value | |
| Manageable | Yes |
| Comments | If an app isn't listed and the user never launches the app, the app never updates.<br>Note: LCID entry is now deprecated.<br>Historically LCID was a part of Application record in Applications dictionary entry. Identified Language Code to be used to locate language specific update manifests. No longer applicable. |

Example:
```xml
<key>Applications</key>
<dict>  
        <key>/Applications/Microsoft Excel.app</key>
        <dict>  
                <key>Application ID</key>
                <string>XCEL2019</string>
        </dict> 
        <key>/Applications/Microsoft Outlook.app</key>
        <dict>  
                <key>Application ID</key>
                <string>OPIM2019</string>
        </dict> 
        <key>/Applications/Microsoft PowerPoint.app</key>
        <dict>  
                <key>Application ID</key>
                <string>PPT32019</string>
        </dict> 
</dict>
```

### Install Priority

Part of application record in Applications dictionary.

Suggests order of application updates when multiple updates are selected/in-progress.

Don't set if there's no reason to force install order.

| Category | Details |
| --- | --- |
| Domain | com.microsoft.autoupdate2 |
| Type | String / Integer |
| Default Value | Medium |
| Accepted Values | High / Medium / Low / 900 – 200 (higher value means higher priority) |
| Manageable | Yes |
| Comments | Integer values outside the 200 - 900 range are ignored. This value is used to control the order in which updates are applied. Doesn't affect MAU updates.<br>Suggest not setting this value unless there's a pressing need to install an app before another. |

Example: 
```xml
<key>Applications</key>
<dict>  
        <key>/Applications/Microsoft Excel.app</key>
        <dict>  
                <key>Application ID</key>
                <string>XCEL2019</string>
                <key>Install Priority</key>
                <string>High</string>
        </dict> 
        <key>/Applications/Microsoft Outlook.app</key>
        <dict>  
                <key>Application ID</key>
                <string>OPIM2019</string>
        </dict> 
        <key>/Applications/Microsoft PowerPoint.app</key>
        <dict>  
                <key>Application ID</key>
                <string>PPT32019</string>
                <key>Install Priority</key>
                <string>Medium</string>
        </dict> 
</dict>
```

### App Domain

Used by MAU to search extra information for update paths.

For more information, see: [https://learn.microsoft.com/en-us/DeployOffice/mac/mau-set-license-info](../mac/mau-set-license-info.md)

| Category | Details |
| --- | --- |
| Domain | com.microsoft.autoupdate2 |
| Type | String |
| Default Value | |
| Manageable | Yes |
| Comments | |

Example: 
```xml
<key>Applications</key>
<dict>  
        <key>/Applications/Microsoft Excel.app</key>
        <dict>  
                <key>Application ID</key>
                <string>XCEL2019</string>
                <key>Install Priority</key>
                <string>High</string>
                <key>App Domain</key>
                <string>com.microsoft.office</string>
        </dict> 
</dict>
```

### ApplicationsSystem

DO NOT USE. Internal dictionary used by MAU.

| Category | Details |
| --- | --- |
| Domain | com.microsoft.autoupdate2 |
| Type | Dictionary |
| Default Value | |
| Manageable | No |
| Comments | Setting this value could cause issues with Applications dictionary.<br>It's best to not set it.<br>Note: This setting is used by MAU internally to reconcile different applications installed/registered by different users. |

### HideOnGUI

Part of application record in Applications dictionary.

When set to TRUE in the application record, the application isn't displayed on MAU GUI.

| Category | Details |
| --- | --- |
| Domain | com.microsoft.autoupdate2 |
| Type | Boolean |
| Default Value | FALSE |
| Manageable | Yes |
| Accepted Values | TRUE / FALSE / 1 / 0 |
| Comments | This value should be set for any app that shouldn't be displayed on the GUI.<br>Examples include:<br>OLIC02 – Licensing helper<br>UCCP14 – Silverlight(Deprecated)<br>Setting this value disables the app from being updated when HowToCheck is set to AutomaticCheck. |

### UpdateReadyReminderIntervalInHours

Used by Office Applications in determining how frequently the update ready message bar should be displayed. Unit is hours.

| Category | Details |
| --- | --- |
| Domain | com.microsoft.autoupdate2 |
| Type | Integer |
| Default Value | |
| Manageable | Yes |
| Accepted Values | 12 - 168 |
| Comments | Update ready reminder can be ignored for maximum of seven days. |

### AppCustomPref

Office Applications (>= 16.79) write license-related information.

MAU uses this information to offer correct product updates.

For more information, see: [Set Office License Info for updates for Microsoft AutoUpdate - Deploy Office | Microsoft Learn](../mac/mau-set-license-info.md)

| Category | Details |
| --- | --- |
| Domain | com.microsoft.autoupdate2 |
| Type | Dictionary |
| Default Value | |
| Manageable | Yes |
| Comments | Setting this value incorrectly disables updates for the office apps. |

### OptionalUpdatesDeferralsDays

OptionalUpdatesDeferralsDays defines the number of days to wait to offer/install updates after an update is released.

For more information, see: [Microsoft AutoUpdate and Deferred Updates](../mac/mau-deferred-updates.md)

| Category | Details |
| --- | --- |
| Domain | com.microsoft.autoupdate2 |
| Type | Integer |
| Default Value | |
| Manageable | Yes |
| Accepted Values | 1 - 28 |
| Comments | This value has a tolerance of three days. IT Admins should add three days to the desired deferral days when setting this value. |

### OptionalUpdatesDeferrals

Dictionary containing individual app deferral days/version.

For more information, see: [Microsoft AutoUpdate and Deferred Updates](../mac/mau-deferred-updates.md)

| Category | Details |
| --- | --- |
| Domain | com.microsoft.autoupdate2 |
| Type | Dictionary |
| Default Value | |
| Manageable | Yes |
| Comments | |

### DisableEndOfSupportNotifications

When set TRUE, disables notifications regarding the end of support for the Office suite.

| Category | Details |
| --- | --- |
| Domain | com.microsoft.autoupdate2 |
| Type | Boolean |
| Default Value | FALSE |
| Manageable | Yes |
| Accepted Values | TRUE / FALSE / 1 / 0 |
| Comments | |

### DisableInsiderCheckbox

When set TRUE, this value is used to disable the pulldown menu to select Beta/Preview channels.

Note: Name is historical, from the time when tickbox controlled enrolling into Insiders program.

| Category | Details |
| --- | --- |
| Domain | com.microsoft.autoupdate2 |
| Type | Boolean |
| Default Value | FALSE |
| Manageable | Yes |
| Comments | Should be used to disable channel selection by end users. |

### EnableCheckForUpdatesButton

When set FALSE, this value disables the option to initiate check for updates from the MAU GUI.

| Category | Details |
| --- | --- |
| Domain | com.microsoft.autoupdate2 |
| Type | Boolean |
| Default Value | TRUE |
| Manageable | Yes |
| Accepted Values | TRUE / FALSE / 1 / 0 |
| Comments | IT Admin should set this value to FALSE if individual users shouldn't be allowed to initiate checking for updates themselves. |

### ExtendedLogging

If set to TRUE, causes verbose logging to be output to MAU log file.

| Category | Details |
| --- | --- |
| Domain | com.microsoft.autoupdate2 |
| Type | Boolean |
| Default Value | FALSE |
| Manageable | Yes |
| Accepted Values | TRUE / FALSE / 1 / 0 |
| Comments | MAU Log only maintains the last 1 MB. Setting this value could cause local log file to lose details. |

### UpdateCheckInterval

Specifies the number of minutes between Checking for updates. Default is set to check every 13 hours.

| Category | Details |
| --- | --- |
| Domain | com.microsoft.autoupdate2 |
| Type | Integer |
| Default Value | 780 |
| Manageable | Yes |
| Comments | Defaulted to 13 hours interval.<br>We recommend this number be a multiple of 60(1hour)<br>Suggest not exceeding 4320 (three days) |

### UpdateCheckFrequency

Deprecated. Incorrectly named. Changed to UpdateCheckInterval to more accurately describe its function.

| Category | Details |
| --- | --- |
| Domain | com.microsoft.autoupdate2 |
| Type | Integer |
| Default Value | |
| Manageable | No |
| Comments | Deprecated |

### UpdateDeadline.ApplicationsForcedUpdateSchedule

Dictionary with a list of dictionary entries specifying forced update schedules for applications. This setting is used to enforce updates by a certain date, ensuring that all devices run the latest software version.

For more information, see: [Set a deadline for updates from Microsoft AutoUpdate](../mac/mau-deadline.md)

| Category | Details |
| --- | --- |
| Domain | com.microsoft.autoupdate2 |
| Type | Dictionary |
| Default Value | |
| Manageable | Yes |
| Comments | Should be set to enforce updates by a certain date.<br>|

Example:
```xml
<dict>
    <key>path to the application</key>
    <dict>
        <key>"Application ID"</key>
        <String>OPIM2019</String>
        <key>"ForcedUpdateDate"</key>
        <Date>2024-04-01</Date>
        <key>"ForcedUpdateVersion"</key>
        <String>16.84.24032800</String>    
    </dict>
</dict>
```


### UpdateDeadline.DaysBeforeForcedQuit

To configure a deadline that is set for days after the update is detected, use the following preference setting.

For more information, see: [Set a deadline for updates from Microsoft AutoUpdate](../mac/mau-deadline.md)

| Category | Details |
| --- | --- |
| Domain | com.microsoft.autoupdate2 |
| Type | Integer |
| Default Value | |
| Manageable | Yes |
| Comments | MAU is calculating deadline dates based on the day updates are found on that device. Not from when Microsoft released the patches |

### UpdateDeadline.FinalCountDown

Number of minutes before the deadline date Forced Update Dialog is displayed.

For more information, see: [Set a deadline for updates from Microsoft AutoUpdate](../mac/mau-deadline.md)

| Category | Details |
| --- | --- |
| Domain | com.microsoft.autoupdate2 |
| Type | Integer |
| Default Value | 60 |
| Manageable | Yes |
| Comments | |

### UpdateDeadline.StartAutomaticUpdates

Number of days before forced update date that MAU treats every update as AutomaticDownload.

Using this preference setting enables Automatic Download and Install mode for MAU regardless of the current MAU setting on the device. After the deadline is reached, MAU will revert to the previous setting on the device.

For more information, see: [Set a deadline for updates from Microsoft AutoUpdate](../mac/mau-deadline.md)

| Category | Details |
| --- | --- |
| Domain | com.microsoft.autoupdate2 |
| Type | Integer |
| Default Value | 3 |
| Manageable | Yes |
| Comments | Value less than three is treated as three. |

### UpdateDeadline.DialogTitle

Custom title to be used for showing Forced Update dialogs.

For more information, see: [Set a deadline for updates from Microsoft AutoUpdate](../mac/mau-deadline.md)

| Category | Details |
| --- | --- |
| Domain | com.microsoft.autoupdate2 |
| Type | String |
| Default Value | |
| Manageable | Yes |
| Comments | |

### UpdaterOptimization

Determines whether to optimize for smaller download size (default) or faster background install times for Office App Updates.

One of: Size, Network, CPU, or None.

| Category | Details |
| --- | --- |
| Domain | com.microsoft.autoupdate2 |
| Type | String |
| Default Value | Size |
| Manageable | Yes |
| Accepted Values | Size / Network / CPU / None |
| Comments | Setting this value to None causes Full updaters to be downloaded, impacting network usage.<br>Unless there's a reason to use Full updater, this value should be left empty, or set to Size. |

### GuardAgainstAppModification

Setting uardAgainstAppModification to TRUE keeps a clone of an application in cache location always.

Needed as some security apps were modifying installed apps under /Applications folder, causing updates to fail.

| Category | Details |
| --- | --- |
| Domain | com.microsoft.autoupdate2 |
| Type | Boolean |
| Default Value | FALSE |
| Manageable | Yes |
| Accepted Values | TRUE / FALSE / 1 / 0 |
| Comments | Use this value if your organization uses a security app that modifies installed apps. |
