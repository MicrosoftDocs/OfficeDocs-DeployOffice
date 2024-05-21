---
title: "Initialize-Places"
ms.author: mactra
author: MachelleTranMSFT
manager: jtremper
ms.reviewer: julia.foran
ms.date: 05/16/2024
audience: ITPro
ms.topic: conceptual
ms.service: o365-proplus-itpro
ms.collection: Tier3
ms.localizationpriority: medium
recommendations: true
description: "Places PowerShell cmdlet to initialize places."
---

# Initialize-Places

Use the Initialize-Places cmdlet to easily create your buildings and floors, and associate rooms to those floors/buildings. The Initialize-Places cmdlet is a simplified, quick-create experience that can be used instead of creating a script using the New-Place and Set-PlaceV3 cmdlets.

Setting up buildings, floors, and room associations are required to use many Places experiences, such as Places Finder.

When running Initialize-Places, you can choose from 3 options:

1. Export a CSV file of your conference rooms and workspaces, with additional columns for an inferred building name and floor name.

1. Import a CSV file that results in automatic creation of buildings, floors, and room associations to floors/buildings.  
1. Import a CSV file that generates a PowerShell script that you can review and then execute to achieve the same resulting directory hierarchy as Option 2. This option is provided for tenants who would like more control or auditing of the cmdlets executed during Option 2.

> [!TIP]
> Please reference [Quick setup of buildings and floors](/places/get-started/quick-setup-buildings-floors) for a tutorial guide of how to use Initialize-Places.

## Syntax

```powershell
Initialize-Places
```

## Description

You need to be assigned permissions before you can run this cmdlet. You must have both the Exchange MailRecipients role and the Places TenantPlacesManagement role. The Places role is required for the creation of buildings/floors and the MailRecipients role is required for updating the room/workspace metadata to link to the given floor/building.

> [!CAUTION]
> You might find additional parameters in the PowerShell cmdlet, but those are not currently supported. It is not recommended to use any parameter that is not documented on this page.
>
## Options

### Option 1

Export your list of conference rooms and workspaces. The exported filename is _ResourceAccountsMapped.csv_.
Initialize-Places, Option 1 only exports rooms, or workspaces associated with a room list. See the [Quick setup for building and floors](/places/get-started/quick-setup-buildings-floors) for an alternative of how to export all rooms and workspaces.

_This isn't a required step if you have alternative ways that might be useful to quickly create a list of rooms/workspaces._

```powershell
Initialize-Places
Please choose the desired option before continuing:
 1. Export suggested mapping CSV of rooms to buildings/floors.
 2. Import mapping CSV to automatically create buildings/floors and room mappings.
 3. Export PowerShell script with commands to manually create buildings/floors and room mappings based on an imported CSV.
 X to cancel.
1
```

### Option 2

Import your list of buildings and floors you want to create, and the rooms that belong to those floors/buildings. After import completes, a file will be saved into the same folder as your import file, such as _fileToImport-ImportResults.csv_, which will document whether any issues were encountered during import.
The import file must be only the following 3 columns: InferredBuildingName, InferredFloorName, and PrimarySmtpAddress (of the room or workspace).

```powershell
Initialize-Places
Please choose the desired option before continuing:
 1. Export suggested mapping CSV of rooms to buildings/floors.
 2. Import mapping CSV to automatically create buildings/floors and room mappings.
 3. Export PowerShell script with commands to manually create buildings/floors and room mappings based on an imported CSV.
 X to cancel.
2
```

### Option 3

Generate a PowerShell script that can be used to create your list of buildings & floors, and setting the correct metadata on rooms and workspaces to associate them with the given floor and building. A new file is saved into the same folder as your import file, such as _fileToImport-ImportResults.csv_ that describes any errors encountering when generating the PowerShell script. The PowerShell script will also be saved into the same folder, with the filename _PlacesOnboardingScript.ps1_.

_Note: Despite the usage of "import" in the cmdlet wording, nothing is created into your Places Directory when using this option._

```powershell
Initialize-Places
Please choose the desired option before continuing:
 1. Export suggested mapping CSV of rooms to buildings/floors.
 2. Import mapping CSV to automatically create buildings/floors and room mappings.
 3. Export PowerShell script with commands to manually create buildings/floors and room mappings based on an imported CSV.
 X to cancel.
3
```

## Example

The following table is an example file to be used for import.  

|InferredBuildingName|InferredFloorName|PrimarySmtpAddress|
| -------- | -------- | -------- |
|Austin 550|Mezzanine|<baker@contoso.com>|  
|Austin 550|1| <adams@contoso.com>|
|Austin 550|2| <rainier@contoso.com>|
|NYC Times Square |  |<olympus@contoso.com>|

If Option 2 is selected, two buildings are created. Austin 550 will have 3 floors created, and NYC Times Square will have 1 floor created with a default name of "Unknown." The conference rooms are associated to their corresponding floor/building, by setting the ParentId property on the room's metadata.

If Option 3 is selected, a PowerShell script would be generated containing cmdlets to create buildings, cmdlets to create floors with a ParentId set to the corresponding building ID, and cmdlets to set the ParentId on each of the rooms to the corresponding floor ID.

## File formats

### File format of the exported file (Option 1)

|Column name|Description|
| -------- | -------- |
|InferredBuildingName|Microsoft Places attempts to infer (suggest) what it believes is the building name for this room/workspace, based on the room/workspaces's _building_ property and the associated room list. This column should be reviewed & updated with the correct value before importing (Option 2 or 3).|
|InferredFloorName|Microsoft Places attempts to infer (suggest) what it believes is the floor name for this room/workspace, based on the room/workspaces's _floorLabel_ property and the associated room list. This column should be reviewed & updated with the correct value before importing (Option 2 or 3).|
|CurrentBuildingLabel|The current string value of _building_ set on the room or workspace's metadata|
|CurrentFloorNumber|The current integer value of _floor_ set on the room or workspace's metadata|
|CurrentFloorLabel|The current string value of _floorLabel_ set on the room or workspace's metadata|
|PrimarySmtpAddress|The smtp address of the room or workspace|
|Name|The display name of the room/workspace|
|RoomList|The associated room list of the rooms/workspaces|
|ResourceType|Defines if the resource is a Room or a Space (workspace)|
|StreetAddress|The street address of the room/workspace|
|City|The city of the room/workspace|
|StateOrProvince|The state/province of the room/workspace|
|CountryOrRegion|The country/region of the room/workspace|
|Confidence|The confidence level in the inferred building name and inferred floor name|

### File format required for import (Option 2 and 3)

The imported file must have only the following 3 columns:

|Column name|Description|
| -------- | -------- |
|InferredBuildingName|_(required)_ This name is used when creating the building|
|InferredFloorName|_(optional)_ This name is used when creating the floor. If left empty, the floor name defaults to "Unknown"|
|PrimarySmtpAddress|_(required)_ The smtp address of the room or workspace|
