---  
title: Configuring Preferences for Microsoft AutoUpdate (MAU) in Microsoft 365 Enterprise
ms.author:  geokri
author:  nicholasswhite
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
ms.date: 05/24/2024 
---  

# Configuring Preferences for Microsoft AutoUpdate (MAU) in Microsoft 365 Enterprise

As an admin for Microsoft 365 Enterprise, you can tailor Microsoft AutoUpdate (MAU) preferences to meet the diverse needs of your users. This article provides an overview of preferences for MAU and helps you understand the documented preferences available.

## What are Preferences for MAU?

Preferences for MAU are settings that allow you to customize the behavior of Microsoft AutoUpdate, which is responsible for keeping Microsoft 365 applications up-to-date. By setting these preferences, you manage update frequency and channels, ensuring users receive the latest features and security updates with minimal disruptions.

For more detailed information on preferences and their deployment, see [Deploy preferences for Office for Mac](../mac/deploy-preferences-for-office-for-mac.md).

## IgnoreUIOpenAfterInstall

Determines whether to launch MAU GUI after MAU install/update. This is useful if IT Admin does not want users to see MAU GUI after an update.

| Category        | Details |
| --------------- | ------- |
| Domain          | com.microsoft.autoupdate2 |
| Type            | Boolean |
| Default Value   | FALSE |
| Manageable      | Yes |
| Accepted Values | TRUE / FALSE / 1 / 0 |
| Comments        | Setting this to TRUE will prevent MAU GUI from launching after a MAU install or an update.<br><br>Note: This does not prevent MAU GUI from launching as a result of finding updates in AutomaticCheck mode. |

## AcknowledgedDataCollectionPolicy

Stores user's choice on data collection policy acknowledgment. This policy helps ensure that users are aware of the data collection policies in place.

| Category | Details |
| --- | --- |
| Domain | com.microsoft.autoupdate2 |
| Type | String |
| Default Value | |
| Manageable | Yes |
| Accepted Values | RequiredDataOnly |
| Comments | Not setting or incorrectly setting this preference leads to Microsoft AutoUpdate (MAU):<br><ul><li>Repeatedly showing Data Collection policy</li><li>Not offering updates.</li></ul> |

> [!NOTE] 
> RequiredAndOptionalData is now deprecated. MAU has never used RequiredAndOptionalData and has always only used RequiredDataOnly for preferences. This preference has now been completely removed.



## HowToCheck

Specifies how Microsoft AutoUpdate checks for updates.

| Category        | Details |
| --------------- | ------- |
| Domain          | com.microsoft.autoupdate2 |
| Type            | String |
| Default Value   | AutomaticDownload |
| Manageable      | Yes |
| Accepted Values | AutomaticDownload<br>AutomaticCheck |
| Comments        | Not having this entry, or having an invalid entry reverts MAU to the default 'AutomaticDownload' mode.<br><br>AutomaticDownload – MAU checks for updates on regular intervals and push updates automatically. Indication an app needs to close in order to complete the update is displayed either in app, or via notification.<br><br>AutomaticCheck – MAU regularly checks for updates and launches the GUI when it detects an available update. The user initiates the update sequence from the GUI.<br>Manual - MAU checks only for its own updates, not for other updates. This option has been removed from GUI. Setting to Manual results in MAU not offering updates automatically.The following value is deprecated: <ul><li>Automatic – replaced by AutomaticCheck</li></ul><br>Note: Even though Manual setting is deprecated, MAU continues to honor it for the time being. Setting to Manual results in MAU not offering updates automatically. |

## ChannelName

ChannelName specifies which update channel Microsoft AutoUpdate receives updates from.

| Category | Details |
| --- | --- |
| Domain | com.microsoft.autoupdate2 |
| Type | String |
| Default Value | Current |
| Manageable | Yes |
| Accepted Values | Beta<br>Current<br>CurrentThrottle<br>Custom<br>Preview |
| Comments | Not having this entry, or having an invalid entry in ChannelName, reverts MAU to the default 'Current' channel.<br>Following values are deprecated and should no longer be used:<br><ul><li>External (replaced by Preview)</li><li>InsiderFast (replaced by Beta)</li><li>Production (replaced by Current)</li></ul>Note: The "Custom" setting is designed to help organizations host updates internally, reducing external network traffic. In this scenario, the IT Administrator is responsible for:<br><ul><li>Manage server space within the organization</li><li>Downloading manifests to specified manifest server location</li><li>Downloading update packages to specified update cache location (if applicable)</li></ul><br><strong>Notes on Channels:</strong><ul><li>Current – This channel distributes all official releases and is the default setting.</li><li>CurrentThrottle – Created to allow people to skip "weekly" Outlook releases in Current channel. Other apps are updated through Current channel (default).</li><li>Custom – Channel to be used if internal servers are to be utilized.</li><li>Preview – This channel provides a preview of official releases. Microsoft 365 apps are typically available two weeks before the official release.</li><li>Beta – Absolute latest in development. Microsoft 365 apps are updated two times a week. Only to be used for testing and error reporting purposes. Product support might not be available in this channel.</li></ul> |

<strong>Note on Per-App channel</strong>:
You can specify a ChannelName for each app by adding a ChannelName key and value to the specific application that requires a different channel. For example, the following XML snippet shows how to set the channel for Excel to be Current, and everything else to be Beta:
```xml
<key>Applications</key>
<dict>  
        <key>/Applications/Microsoft Excel.app</key>
        <dict>  
                <key>Application ID</key>
                <string>XCEL2019</string>
                <key>ChannelName</key>
                <string>Current</string>
        </dict>
      ......
</dict>
<key>ChannelName</key>
<string>Beta</string>
```

## ManifestServer

The ManifestServer is the URL for the server hosting update manifests. MAU downloads update manifests from this location when ChannelName is set to Custom.

| Category | Details |
| --- | --- |
| Domain | com.microsoft.autoupdate2 |
| Type | String |
| Default Value | |
| Manageable | Yes |
| Comments | Must point to a valid URL hosting update manifest files. List of files to be hosted are:<br><ul><li>.xml</li><li>-chk.xml</li><li>.cat</li><li>-history.xml</li></ul>Note:<br><ul><li>ChannelName should be set to Custom in order to make meaningful use of this preference.</li><li>If ChannelName is set to Custom and this preference isn't configured, MAU defaults to Current channel. The latest published manifest files can be accessed at the following URL, which serves as the root URL for Current channel: ``https://officecdnmac.microsoft.com/pr/C1297A47-86C4-4C1F-97FA-950631F94777/MacAutoupdate/`` <br>Append the actual file name to the URL provided; the URL doesn't include a directory listing.</li></ul>When populating ManifestServer, ensure ALL collaterals are copied, including following files for each of the apps:<br><ul><li>.xml</li><li>-chk.xml</li><li>.cat</li><li>-history.xml</li></ul>Also, make sure to copy all versioned manifests. Versions are listed in –history.xml file, and the file names (.xml, .cat) need to be constructed with 4090&lt;AppID&gt;_&lt;Version&gt;.[xml &vert; cat], otherwise some of the functionalities provided by MAU might not be available. |

## UpdateCache

URL for the server hosting actual update packages. MAU downloads update packages from this location instead of the location specified in the .xml manifest file.

| Category | Details |
| --- | --- |
| Domain | com.microsoft.autoupdate2 |
| Type | String |
| Default Value | |
| Manageable | Yes |
| Comments | Set UpdateCache to direct client traffic to an internal update server, reducing high external download traffic.<br>If the correct update package isn't at this location, a 'Download Error' is reported.<br>To populate UpdateCache, copy all updater packages. You can find these packages by examining the contents of .xml files for each application, such as 0409MSWD2019.xml from Current channel. |

## EnableFallbackChannel

Allows Microsoft AutoUpdate to look for updates in Current channel if the specified channel (Beta, Preview, Custom) doesn't have manifests for the registered applications available.

| Category | Details |
| --- | --- |
| Domain | com.microsoft.autoupdate2 |
| Type | Boolean |
| Default Value | TRUE |
| Manageable | Yes |
| Accepted Values | TRUE / FALSE / 1 / 0 |
| Comments | EnableFallbackChannel is useful if you set up ManifestServer location but fail to copy manifests for all the registered applications. Set this preference to FALSE if you don't want to use Current channel as a backup. |


## DisableOptInNotification

When Set to TRUE, prevents Opt-In notification/pop-up window from showing even when HowToCheck is set to Automatic.

| Category | Details |
| --- | --- |
| Domain | com.microsoft.autoupdate2 |
| Type | Boolean |
| Default Value | FALSE |
| Manageable | Yes |
| Accepted Values | TRUE / FALSE / 1 / 0 |
| Comments | If this entry is missing or set to FALSE, and HowToCheck is set to Automatic, an Opt-In popup window appears. This notification is ignored if the HowToCheck setting isn't Automatic. |

Here are examples of the notification and pop-up window:

:::image type="content" source="../mac/media/mau-preferences/automatic-updates-prompt.large.png" alt-text="Notification pop-up asking 'Turn On Automatic Updates?' with a description 'Always install new features and updates for Microsoft apps' and icons of Microsoft apps." lightbox="../mac/media/mau-preferences/automatic-updates-prompt.large.png":::

:::image type="content" source="../mac/media/mau-preferences/update-settings-dialogue.large.png" alt-text="Screenshot of a dialogue box for Microsoft updates with the title 'Turn On Automatic Updates' and a brief description about Microsoft releasing new features, security updates, and improvements. The box includes a 'Turn On' button in blue and a 'Not Now' link below it." lightbox="../mac/media/mau-preferences/update-settings-dialogue.large.png":::

## LastUpdate

**DO NOT USE**. MAU uses this preference to track the last update check. It won't check for updates again until at least 12 hours pass from that time.

| Category | Details |
| --- | --- |
| Domain | com.microsoft.autoupdate2 |
| Type | Date |
| Default Value | |
| Manageable | No |
| Comments | **Important** Don't include this entry in a managed profile.<br>Setting this value via managed profile has the following consequences:<br><ul><li>If set to future, MAU won't check for updates until 12 hours pass from that time.</li><li>If set to past or in an incorrect format, MAU checks for updates every two hours.</li></ul> |

## DisableVoiceOverAccessibility

DEPRECATED. If set to TRUE, this causes VoiceOver accessibility features to be disabled in Microsoft AutoUpdate. This option is deprecated.

| Category | Details |
| --- | --- |
| Domain | com.microsoft.autoupdate2 |
| Type | Boolean |
| Default Value | FALSE |
| Manageable | Yes |
| Comments | Deprecated from MAU 4.70. |

## ReopenAfterGUIInstall

**DO NOT USE**.  If set to TRUE, the MAU GUI will open during the first MAU launch after an update. This preference is removed after the MAU GUI's initial launch following the update.

| Category | Details |
| --- | --- |
| Domain | com.microsoft.autoupdate2 |
| Type | Boolean |
| Default Value | FALSE |
| Manageable | No |
| Comments | **Important** This preference is only to be used by MAU itself and shouldn't be included in a managed profile.<br>Setting this preference to TRUE in a managed profile causes the MAU GUI to open with every FBA process launch. |

## ManifestServerExpiryDate

**DO NOT USE**. Sets the date when ManifestServer setting expires. Currently in use by Teams21 ONLY.

| Category | Details |
| --- | --- |
| Domain | com.microsoft.autoupdate2 |
| Type | Date |
| Default Value | |
| Manageable | No |
| Comments | Currently in use by Teams21 ONLY.<br>After the indicated date, ManifestServer entry will be removed, effectively reverting the updates to use Current (default) channel instead. |

## Applications

Lists application registrations. This dictionary can include keys for specific applications and details about how they should be updated. Useful for managing updates on a per-application basis.

> [!NOTE]
> For a list of supported AppIDs, see [Application identifiers](../mac/update-office-for-mac-using-msupdate.md#application-identifiers).

| Category | Details |
| --- | --- |
| Domain | com.microsoft.autoupdate2 |
| Type | Dictionary |
| Default Value | |
| Manageable | Yes |
| Comments | If an app isn't listed and the user never launched the app, the app never updates.<br>Note: LCID entry is now deprecated. Historically, LCID was a part of the Application record in Applications dictionary entry. Identified Language Code to be used to locate language-specific update manifests. No longer applicable.<br>Other key/value pairs that can be added to this dictionary are documented in the [App Domain](#app-domain) section. |

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

## App Domain

Used by MAU to search extra information for update paths. For more information, see [Set Office License Info for updates for Microsoft AutoUpdate](../mac/mau-set-license-info.md).

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

## ApplicationsSystem

**DO NOT USE**. Internal dictionary used by MAU to keep applications dictionary in sync between users on a multi-user device.

| Category | Details |
| --- | --- |
| Domain | com.microsoft.autoupdate2 |
| Type | Dictionary |
| Default Value | |
| Manageable | No |
| Comments | Setting this preference might conflict with the Applications dictionary. It's advisable not to set it.<br>Note:<ul><li>This preference helps MAU internally reconcile various applications installed or registered by different users. IT Admins can use this preference to ensure that all users on a device receive the same application updates. **Important:** This preference must include all Microsoft applications supported by MAU installed on the device. Don't set this in a managed profile. |


## HideOnGUI

Part of application record in Applications dictionary.

When set to TRUE in the application record, application won't be displayed on MAU GUI.

| Category | Details |
| --- | --- |
| Domain | com.microsoft.autoupdate2 |
| Type | Boolean |
| Default Value | FALSE |
| Manageable | Yes |
| Accepted Values | TRUE / FALSE / 1 / 0 |
| Comments | This should be set for any app that shouldn't be displayed on the GUI.<br>Examples include:<br>OLIC02 – Licensing helper<br>Setting this disables the app from being updated via GUI when HowToCheck is set to AutomaticCheck. |


## UpdateReadyReminderIntervalInHours

Used by Microsoft 365 apps in determining how frequently update ready message bar should be displayed. Unit is hours.

| Category | Details |
| --- | --- |
| Domain | com.microsoft.autoupdate2 |
| Type | Integer |
| Default Value | |
| Manageable | Yes |
| Accepted Values | 12 - 168 |
| Comments | Update ready reminder can be ignored for a maximum of seven days. |

Here's an example of the Update Ready message bar in Excel:

:::image type="content" source="../mac/media/mau-preferences/excel-update-notification.large.png" alt-text="Interface of Microsoft Excel displaying an 'Update Available' notification indicating that some fixes and improvements are made, with a prompt to restart the app. The Excel workbook shown is named 'Book1' and the sheet 'Sheet1' is visible, currently blank with no data entered." lightbox="../mac/media/mau-preferences/excel-update-notification.large.b.png":::

## AppCustomPref

Microsoft 365 applications (>= 16.79) write license related information.

MAU uses this information to offer correct product updates.

For more information, see: [Set Office License Info for updates for Microsoft AutoUpdate - Deploy Office | Microsoft Learn](../mac/mau-set-license-info.md)

| Category | Details |
| --- | --- |
| Domain | com.microsoft.autoupdate2 |
| Type | Dictionary |
| Default Value | |
| Manageable | Yes |
| Comments | Setting this incorrectly disables updates for the Microsoft 365 apps. |


## OptionalUpdatesDeferralsDays

This defines the number of days to wait to offer/install updates after an update is released.

For more information, see: [Microsoft AutoUpdate and Deferred Updates](../mac/mau-deferred-updates.md)

| Category | Details |
| --- | --- |
| Domain | com.microsoft.autoupdate2 |
| Type | Integer |
| Default Value | |
| Manageable | Yes |
| Accepted Values | 1 - 28 |
| Comments | This value has a tolerance of three days. IT Admins should add three days to the desired deferral days when setting this value. |


## OptionalUpdatesDeferrals

Dictionary containing individual app deferral days / version.

For more information, see: [Microsoft AutoUpdate and Deferred Updates](../mac/mau-deferred-updates.md)

| Category | Details |
| --- | --- |
| Domain | com.microsoft.autoupdate2 |
| Type | Dictionary |
| Default Value | |
| Manageable | Yes |
| Comments | |

## DisableEndOfSupportNotifications

When set to TRUE, disables notifications regarding the end of support for the Office suite.

| Category | Details |
| --- | --- |
| Domain | com.microsoft.autoupdate2 |
| Type | Boolean |
| Default Value | FALSE |
| Manageable | Yes |
| Accepted Values | TRUE / FALSE / 1 / 0 |
| Comments | |

## DisableInsiderCheckbox

When set to TRUE, this is used to disable the pulldown menu to select Beta/Preview channels.

> [!NOTE]
> Name is historical, from the time when the tickbox controlled enrolling into the Insiders program.

| Category | Details |
| --- | --- |
| Domain | com.microsoft.autoupdate2 |
| Type | Boolean |
| Default Value | FALSE |
| Manageable | Yes |
| Comments | Should be used to disable channel selection by end users. |

:::image type="content" source="../mac/media/mau-preferences/microsoft-apps-auto-update-preferences.large.png" alt-text="Screenshot of the Preferences pane showing options for Microsoft software updates. It includes an 'Update Channel' dropdown set to 'Current Channel' with text explaining that it provides fully supported updates, and an 'Automatic Updates' section with a checked box stating 'Automatically download and install,' indicating that updates for Microsoft apps are set to install automatically." lightbox="../mac/media/mau-preferences/microsoft-apps-auto-update-preferences.large.png":::

## EnableCheckForUpdatesButton

When set to FALSE, this disables the option to initiate a check for updates from the MAU GUI.

| Category | Details |
| --- | --- |
| Domain | com.microsoft.autoupdate2 |
| Type | Boolean |
| Default Value | TRUE |
| Manageable | Yes |
| Accepted Values | TRUE / FALSE / 1 / 0 |
| Comments | IT Admin should set this to FALSE if individual users shouldn't be allowed to initiate checking for updates, or initiate updates themselves. Note: The 'Check for Updates' button is replaced with the 'Update All' button when MAU completes checking for updates. This preference key, when set to FALSE, will also disable the 'Update All' button. |

:::image type="content" source="../mac/media/mau-preferences/apps-up-to-date-notification.large.png" alt-text="Microsoft AutoUpdate window stating 'All apps are up-to-date.' with an option below to 'Automatically keep Microsoft apps up to date' alongside a clickable 'Check for Updates' button and an 'Advanced' options link." lightbox="../mac/media/mau-preferences/apps-up-to-date-notification.large.png":::

:::image type="content" source="../mac/media/mau-preferences/microsoft-autoupdate-status.large.png" alt-text="Microsoft AutoUpdate interface on a Mac, displaying a message that 'All apps are up-to-date.' It has a checkbox for 'Automatically keep Microsoft apps up to date' that is unchecked, with buttons for 'Check for Updates' and 'Advanced...' settings visible." lightbox="../mac/media/mau-preferences/microsoft-autoupdate-status.large.png":::


## ExtendedLogging

If set to TRUE, causes verbose logging to be output to MAU log file.

| Category | Details |
| --- | --- |
| Domain | com.microsoft.autoupdate2 |
| Type | Boolean |
| Default Value | FALSE |
| Manageable | Yes |
| Accepted Values | TRUE / FALSE / 1 / 0 |
| Comments | MAU Log will only maintain the last 1MB. Setting this might cause the local log file to lose details. |

## UpdateCheckInterval

Specifies the number of minutes between checking for updates. Default is set to check every 13 hours.

| Category | Details |
| --- | --- |
| Domain | com.microsoft.autoupdate2 |
| Type | Integer |
| Default Value | 780 |
| Manageable | Yes |
| Comments | Defaulted to 13 hours interval.<br>We recommend this number be a multiple of 60 (one hour).<br>Suggest not exceeding 4320 (three days). |

## UpdateCheckFrequency

Deprecated. Incorrectly named. Changed to UpdateCheckInterval to describe its function more accurately. 

| Category | Details |
| --- | --- |
| Domain | com.microsoft.autoupdate2 |
| Type | Integer |
| Default Value | |
| Manageable | | 
| Comments | Deprecated |


## UpdateDeadline.ApplicationsForcedUpdateSchedule

Dictionary with a list of dictionary entries specifying forced update schedules for applications. This setting is used to enforce updates by a certain date, ensuring that all devices run the latest software version.

See [Set a deadline for updates from Microsoft AutoUpdate](../mac/mau-deadline.md) for more details.

| Category | Details |
| --- | --- |
| Domain | com.microsoft.autoupdate2 |
| Type | Dictionary |
| Default Value | |
| Manageable | Yes |
| Comments | Should be set to enforce updates by a certain date. |

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


## UpdateDeadline.DaysBeforeForcedQuit

To configure a deadline that is a certain number of days after the update is detected, use the following preference setting.

For more information, see: [Set a deadline for updates from Microsoft AutoUpdate](../mac/mau-deadline.md)

| Category | Details |
| --- | --- |
| Domain | com.microsoft.autoupdate2 |
| Type | Integer |
| Default Value | |
| Manageable | Yes |
| Comments | MAU is calculating deadline dates based on the day updates are found on that device. Not from when Microsoft released the patches. Starting from StartAutomaticUpdates  number of days before deadline is reached, there will be a prompt displayed to user every 12 hours |

Here's an example of the prompt that's displayed.
:::image type="content" source="../mac/media/mau-preferences/update-deadline-reminder.large.png" alt-text="A Microsoft AutoUpdate reminder pop-up with a date 'July 27, 2019'. It informs the user that the admin has set up a deadline for updates and instructs to save data and quit the following apps before the deadline, with the Microsoft Word icon displayed. There are options to 'Snooze' or 'Update' at the bottom of the pop-up." lightbox="../mac/media/mau-preferences/update-deadline-reminder.large.png":::

## UpdateDeadline.FinalCountDown

Number of minutes before the deadline date Forced Update Dialog will be displayed.

For more information, see: [Set a deadline for updates from Microsoft AutoUpdate](../mac/mau-deadline.md)

| Category | Details |
| --- | --- |
| Domain | com.microsoft.autoupdate2 |
| Type | Integer |
| Default Value | 60 |
| Manageable | Yes |
| Comments |The range for this value is 10 to 720. Starting from the FinalCountDown, the number of minutes before the deadline, MAU displays a prompt to the user each time it runs. Applications  automatically close once the countdown is reached. |

Here's an example of the prompt that displays.
:::image type="content" source="../mac/media/mau-preferences/update-countdown-notice.large.png" alt-text="Close-up of a Microsoft AutoUpdate notification with a countdown timer set to 59 minutes and 53 seconds. The message states, 'Your admin has setup a deadline for the updates' and advises the user to save their data and close the following apps before the deadline, with the Microsoft Word icon shown. The button at the bottom reads 'Quit Apps and Update.'" lightbox="../mac/media/mau-preferences/update-countdown-notice.large.png":::

## UpdateDeadline.StartAutomaticUpdates

Number of days before forced update date that MAU treats every update as AutomaticDownload.

Using this preference setting enables Automatic Download and Install mode for MAU regardless of the current MAU HowToCheck setting on the device. After the deadline is reached, MAU will revert to the previous setting on the device.

For more information, see: [Set a deadline for updates from Microsoft AutoUpdate](../mac/mau-deadline.md)

| Category | Details |
| --- | --- |
| Domain | com.microsoft.autoupdate2 |
| Type | Integer |
| Default Value | 3 |
| Manageable | Yes |
| Comments | Value less than three is treated as three. Value can't be bigger than DaysBeforeForcedQuit. |

## UpdateDeadline.DialogTitle

Custom title to be used for showing Forced Update dialogs.

For more information, see: [Set a deadline for updates from Microsoft AutoUpdate](../mac/mau-deadline.md)

| Category | Details |
| --- | --- |
| Domain | com.microsoft.autoupdate2 |
| Type | String |
| Default Value | Your admin has setup a deadline for the updates.|
| Manageable | Yes |
| Comments | :::image type="content" source="../mac/media/mau-preferences/admin-update-deadline-alert.large.png" alt-text="A Microsoft AutoUpdate alert with a red box highlighting an important notice that reads 'Your admin has setup a deadline for the updates,' dated 'July 27, 2019'. Below is the instruction to save data and close apps before the deadline with a Microsoft Word icon, accompanied by 'Snooze' and 'Update' buttons. There are other snooze options to try again in an hour, 12 hours, tomorrow, or in two days." lightbox="../mac/media/mau-preferences/admin-update-deadline-alert.large.png"::: |

## UpdaterOptimization

Determines whether to optimize for smaller download size (default) or faster background install times for Office App Updates.

 One of: Size, Network, CPU, or None.

| Category | Details |
| --- | --- |
| Domain | com.microsoft.autoupdate2 |
| Type | String |
| Default Value | Size |
| Manageable | Yes |
| Accepted Values | Size<br>Network<br>CPU<br>None |
| Comments | Setting this value to None causes Full updaters to be downloaded, impacting network usage.<br>Unless there's a reason to use Full updater, this value should be left empty, or set to Size. |

## GuardAgainstAppModification

Setting this preference to TRUE keeps a clone of an application in cache location always.

Needed as some security apps were modifying installed apps under /Applications folder, causing updates to fail.

| Category | Details |
| --- | --- |
| Domain | com.microsoft.autoupdate2 |
| Type | Boolean |
| Default Value | FALSE |
| Manageable | Yes |
| Accepted Values | TRUE / FALSE / 1 / 0 |
| Comments | Use this preference if your organization uses a security app that modifies installed apps. An indication to suspect a security app modifying the installed app would be frequent update failures resulting in full updater downloads for all Microsoft 365 apps. Office app updates come through as "binary delta" updates, where only changed bits are updated. Having a security app that modifies the actual installed application will cause verification failure after each binary delta update, forcing a full updater package download. One can tell if the app was modified by running the following verification from the terminal app. This fails if the integrity of the application is compromised:<br> `codesign –vv --deep <<path to the app>>` |
