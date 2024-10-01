---
title: "Updater Types Used by Microsoft AutoUpdate"
ms.author: geokri
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: conceptual
ms.service: o365-proplus-itpro
ms.subservice: office-mac
ms.localizationpriority: medium
ms.collection: Tier3
recommendations: false
description: "Learn about the different updater types used by Microsoft AutoUpdate, including Full, File Delta, and Binary Delta, and how they're applied."
ms.date: 10/01/2024
---

# Updater types used by Microsoft AutoUpdate

Microsoft AutoUpdate (MAU) uses specific rules to determine whether a device receives a smaller updater package instead of a full-sized one

The rules include:

- Whether the app update supports smaller updates  
  - Currently, only core Office apps (Word, Excel, PowerPoint, Outlook, and OneNote) support this feature.

- The optimization preference setting  
  For more information, see: [UpdaterOptimization preferences setting](mau-preferences.md#updateroptimization).

- The availability of smaller updater packages for the installed version

- Available disk space

When MAU can't apply a smaller updater package, it downloads and installs a full updater package.

## Different updater types

Here's a summary of the three different types of updater packages Microsoft generates:

| Updater type  | Description |
|---------------|-------------|
| Full      | Contains all files needed to replace the currently installed app. The size of the updater is similar to the initial installer (though slightly less as the updater doesn't include other apps needed during the initial install, such as MAU, Defender, etc.). <br> Could take a long time to update as it needs to replace all files that make up the app. |
| File Delta | Includes only the files that changed between the specified version and the latest version. <br> Only applicable to devices with the version the updater package is generated for. <br> The size is smaller than the full updater but larger than a binary delta updater. <br> Typically takes the shortest time to update. |
| Binary Delta | Contains only the byte differences between the specified version and the latest version. <br> Only applicable to devices with the version the updater package is generated for. <br> The size is the smallest of the updater types. <br> Could take the longest to update, depending on the number of changes to be applied. <br> Also CPU-intensive, as all impacted files need to be opened, byte changes applied, and saved. |

> [!NOTE]
> File Delta and Binary Delta updates might cause issues if a security app on the end user’s device modifies installed apps. This could prevent the app from launching after the update, as delta updaters rely on the installed apps remaining unchanged. </br> For more information, see the [GuardAgainstAppModification](mau-preferences.md#guardagainstappmodification) preference setting.

Some security apps significantly increase CPU usage during Binary Delta updates. In these cases, set the UpdaterOptimization setting to CPU or None, which forces the use of File Delta instead.
For more information, see [UpdaterOptimization Preferences](mau-preferences.md#updateroptimization).

## Limitations

When generating an updater for a version, Microsoft identifies the changes from previous releases and creates packages with only the differences.

This process requires a specific set of previously released app versions. Older versions aren't used because they can lead to diminishing returns, where package sizes become too large, or update times become too long.

Internal studies on historical data revealed that supporting delta updates from three previous releases is the most optimal use of this feature. Therefore, Microsoft generates delta updaters from the three previous releases for each channel, excluding the Custom channel.

This means that if the installed app version is older than three previous releases, delta/binary delta updates can't be offered.

> [!NOTE]
> This applies to hotfix releases as well, meaning delta/binary delta updaters for hotfix version 16.90.1 will be generated from three prior released versions, including 16.90.0, for example.
