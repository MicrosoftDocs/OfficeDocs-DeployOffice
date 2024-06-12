---
title: "Configuring Microsoft AutoUpdate (MAU) for Organization Specific Updates"
ms.author: ppark
author: nwhite
manager: dougeby
audience: ITPro
ms.topic: conceptual
ms.service: o365-proplus-itpro
ms.subservice: office-mac
ms.localizationpriority: medium
ms.collection: Tier2
recommendations: false
description: "This article outlines how organizations can configure Microsoft AutoUpdate (MAU) to control application updates using custom channels and local servers."
ms.date: 06/10/2023
---

# Configuring Microsoft AutoUpdate (MAU) for Organization Specific Updates

## Using Custom channel and ManifestServer to control updates

Microsoft recognizes there are certain scenarios where an organization needs strict control over which version of Microsoft applications can be installed.

An organization can take total control of Microsoft Application updates by utilizing the Custom channel facility provided by MAU. Selecting Custom ChannelName preferences disables MAU from looking at standard public release locations and directs MAU to look for updates from an organization-specific location, specified by the ManifestServer preference setting.

The following steps describe how to manage an organization-specific ManifestServer:

- Create a local HTTPS network server to host Microsoft application update manifests.
- Download Microsoft application update manifests from the preferred public Microsoft Content Delivery Network (CDN) endpoints to the local server. For more information, see [ManifestServer preferences setting](./mau-preferences.md#manifestserver).
  - Root URLs for public Microsoft CDN endpoints (referred to as ChannelURL):

    | Channel          | URL                                                                                        |
    | ---------------- | ------------------------------------------------------------------------------------------ |
    | Current          | ``https://officecdnmac.microsoft.com/pr/C1297A47-86C4-4C1F-97FA-950631F94777/MacAutoupdate/``   |
    | Preview          | ``https://officecdnmac.microsoft.com/pr/1ac37578-5a24-40fb-892e-b89d85b6dfaa/MacAutoupdate/``   |
    | Beta             | ``https://officecdnmac.microsoft.com/pr/4B2D7701-0A4F-49C8-B4CB-0C2D4043F51F/MacAutoupdate/``   |
    | CurrentThrottle  | Only contains Outlook manifests: ``https://officecdnmac.microsoft.com/pr/A1E15C18-4D18-40B0-8577-616A9470BB10/MacAutoUpdate/`` |

  - Construct URLs for each file to download by using: ``<<ChannelURL>>/0409<<AppID>><<extension>>``, where the extension is:
    - .xml
    - -chk.xml
    - .cat
    - -history.xml

    For a list of supported AppIDs, see [Application identifiers](./update-office-for-mac-using-msupdate.md#application-identifiers)

  - Download "Versioned Manifest" files:
    - Examine download -history.xml file to retrieve published versions for the application.
    - Determine the versioned manifest file name using: ``0409<<AppID>>_<<version>><<extension>>``, where the extension is:
      - .xml
      - .cat

After creating and populating the ManifestServer location, set the [ChannelName preference](./mau-preferences.md#channelname) to **Custom** and the [ManifestServer preference](./mau-preferences.md#manifestserver) to the ManifestServer URL location on each managed device. This can be done by adding ChannelName and ManifestServer preferences settings in the deployed managed profile.

You can also use the following terminal commands to achieve the same goal on a single device:

```powershell
defaults write com.microsoft.autoupdate2 ChannelName -string Custom
```
```powershell
defaults write com.microsoft.autoupdate2 ManifestServer -string <<URL to local network server>>
```

> [!NOTE]
> 1. ChannelName and ManifestServer preference settings can be used in conjunction with per-app settings.
> 2. Setting ChannelName to Custom without setting ManifestServer has the same effect as setting ChannelName to Current.
> 3. Also, the ManifestServer setting, when ChannelName is not set to Custom, will be ignored.

> [!CAUTION] 
> By providing the ManifestServer preference setting, the organization is taking full responsibility for maintaining the ManifestServer location with the most up-to-date version of the applications the organization needs to be updated. Failure to maintain the contents of the ManifestServer location will result in MAU not discovering needed updates, resulting in no updates.

## Using UpdateCache to reduce Network Traffic

An enterprise IT admin can use a local network to retrieve update packages instead of the Microsoft CDN on the internet. This approach is beneficial for enterprises with limited internet bandwidth, whether due to throughput limitations or cost concerns.

To populate the local UpdateCache:

- Create a local HTTPS network server to host Microsoft application update packages.
- Download each installed Microsoft application's XML manifest file (*.xml). For more information, see [ManifestServer](./mau-preferences.md#manifestserver).
- Find each "https*.pkg" entry in the downloaded XML manifest files (* is a wildcard). Download these package files to the local network server for the previously created UpdateCache.
- Set the UpdateCache preference to the local network server:
  ```powershell
  defaults write com.microsoft.autoupdate2 UpdateCache <<URL to local network server>>
    ```

MAU starts downloading updates from this location instead of URL locations specified in the xml manifest files. If the update packages aren't found in the UpdateCache location, then the update attempt fails and MAU reports "download failure."

> [!NOTE]
> This can be used in conjunction with per-app settings.

## Configuring individual Application updates (Per-App setting)

MAU supports configuring updates for individual applications. When set, this configuration takes precedence over the global configuration.

- `ChannelName` When set to a different value than the global value, MAU looks for updates to the application on this per-app channel instead.
- `ManifestServer` Should be set if ChannelName for the application is set to Custom. MAU looks for updates for the application using manifests downloaded from this location.
- `UpdateCache` This is used to host updater packages to reduce network costs. While you should specify UpdateCache globally, you can also set it for individual apps.

**Example:**
```xml
<dict>
    <key>AcknowledgedDataCollectionPolicy</key>
    <string>RequiredDataOnly</string>
    <key>ChannelName</key>
    <string>Preview</string>
    <key>HowToCheck</key>
    <string>AutomaticDownload</string>
    <key>Applications</key>
    <dict>
        …… 
        <key>/Applications/Microsoft Teams.app</key>
        <dict>
            <key>Application ID</key>
            <string>TEAMS21</string>
            <key>ChannelName</key>
            <string>Custom</string>
            <key>ManifestServer</key>
            <string><<URL Location for manifest server>></string>
            <key>UpdateCache</key>
            <string><<URL Location for update cache server>></string>
        </dict>
        ……
    </dict>
</dict>
```
