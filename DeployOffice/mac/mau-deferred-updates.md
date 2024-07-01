---
title: "Microsoft AutoUpdate and Deferred Updates"
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
description: "Provides admins with information about Microsoft AutoUpdate's deferred updates feature, including how to set deferral days and versions for individual applications."
ms.date: 03/06/2024
---

# Microsoft AutoUpdate and Deferred Updates

> [!IMPORTANT]
> It's strongly recommend that you stay current on all updates.

Starting from Version 4.68.1, Microsoft AutoUpdate supports the following cases where more time is required:
- Deferring an update by many days (maximum of 28 days). Referred to as "Deferral Days" in the document.
- Setting "do not update beyond" version (to the maximum of 90 days). Referred to as "Deferral Version" in this document.

If both are defined, Deferral Version takes precedence over Deferral Days setting for the app.

> [!IMPORTANT]
> Deferral Days and Deferral Versions don’t apply to critical updates. They will be offered or installed (when "Automatically keep Microsoft apps up to date" tickbox is selected") regardless.

## Deferral Days

This feature allows the deferral of available updates for many days.

### Global Deferral Days setting

Deferral Days can be set globally with the following preferences setting:

| Category | Details |
| -------- | ------- |
| Domain   | com.microsoft.autoupdate2 |
| Key      | OptionalUpdatesDeferralsDays |
| Data Type| Integer |
| Possible values | 1 – 28. Any value less than one is ignored. Any value over 28 days sets the Deferral days to 28. |
| Comments | There's no default value. |

**Example of Configuring Deferral Days**

This example demonstrates how to set Deferral Days to 14. In this configuration Microsoft AutoUpdate will postpone offering or applying updates for 14 days after the release:

```xml
<key>OptionalUpdatesDeferralsDays</key>
<integer>14</integer>
```

### App specific Deferral Days setting

Deferral Days can also be set for individual applications. If set, app-specific deferral days take precedence over the global setting.

App-specific deferral days can be set with the following preferences setting:

| Category        | Details                    |
|-----------------|----------------------------|
| Domain          | com.microsoft.autoupdate2  |
| Key             | OptionalUpdatesDeferrals   |
| Data Type       | Dictionary                 |
| Key             | DeferralDays               |
| Data Type       | Dictionary                 |
| Key             | Application ID             |
| Data Type       | Integer                    |
| Possible values | 1 – 28. Any value less than one is ignored. Any value over 28 days sets the Deferral days to 28.                       |
| Comments        | There's no default value.  |

**Example of setting different Deferral Days for Word and Excel**

This example shows how to set Deferral Days to seven for Microsoft Word 2019 and to 12 for Microsoft Excel 2019. With this setup, Microsoft AutoUpdate will delay offering or applying updates for seven days after Microsoft Word updates are released, and for 12 days after Microsoft Excel updates are released:

```xml
<key>OptionalUpdatesDeferrals</key>
<dict>
    <key>DeferralDays</key>
    <dict>
        <key>MSWD2019</key>
        <integer>7</integer>
        <key>XCEL2019</key>
        <integer>12</integer>
    </dict>
</dict>
```

## Deferral Version

This feature allows users to set an upper limit to the update version. That is, discovered updates are offered/applied to and including the specified version.

To allow for updates to be discovered and applied, only the Major.Minor version number scheme is recognized. For example, 16.82 needs to be specified to receive any 16.82.xxxxxxxx releases.

Due to differences in version numbers among Microsoft applications, this option needs to be set individually for each app with the following preference settings:

| Category                | Details                   |
| ------------------------|---------------------------|
| Domain                  | com.microsoft.autoupdate2 |
| Key                     | OptionalUpdatesDeferrals  |
| Data Type               | Dictionary                |
| - Key: DeferralVersions | Data type: Dictionary   |
| - Key: Application ID   | Data Type: String       |

Possible values for the version are specified as Major.Minor version numbers. There's no default value for this setting.

**Example of Setting Deferral versions for Word and Excel**

This example shows how to set the Deferral Version to 16.82 for Microsoft Word 2019 and to 16.81 for Microsoft Excel 2019:

```xml
<key>OptionalUpdatesDeferrals</key>
<dict>
    <key>DeferralVersions</key>
    <dict>
        <key>MSWD2019</key>
        <string>16.82</string>
        <key>XCEL2019</key>
        <string>16.81</string>
    </dict>
</dict>
```

> [!NOTE]
> There is a 90-day limit (subject to change later) on how long one can stay on the specified version without updating. Once this window has passed, Microsoft AutoUpdate will offer/apply the next oldest update that is within the 90-day window.

For example, the following table shows available updates for Microsoft Word 2019 (MSWD2019) and which one is offered/applied once the 90-day window is past.

| Available Update Versions | # days since release | Notes                        |
|---------------------------|----------------------|------------------------------|
| 16.85.X                   | 5                    |                              |
| 16.84.X                   | 25                   |                              |
| 16.83.X                   | 55                   |                              |
| 16.82.24021813            | 85                   | Next Update version          |
| 16.82.24021116            | 92                   |                              |
| 16.81.24012814            | 106                  | Current Installed Version    |
