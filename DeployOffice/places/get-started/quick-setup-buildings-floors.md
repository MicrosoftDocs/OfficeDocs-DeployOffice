---
title: "Quick setup of buildings and floors"
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
description: "How to set up buildings and floors in Microsoft Places."
---

# Quick setup of buildings and floors

Microsoft Places depends on a fully set up hierarchy among your rooms/workspaces, floors, and buildings. You need to first create the buildings and floors, and then link them to rooms/workspaces using ParentId.

To make this initial setup easier, you can use `Initialize-Places` to import a CSV so that Microsoft takes care of setting up the hierarchy on your behalf. The CSV only needs to have the following three columns:

* Building Name
* Floor Name
* SMTP of your existing conference room or workspace

Use [Set-PlaceV3](/places/PowerShell/set-placev3) to add more metadata on buildings and floors other than name.

## What do you need to know before you begin?

* Estimated time to complete: 5 to 30 minutes, depending on how long it takes to finalize your building and floor names.

* You need to be assigned permissions before you can run this cmdlet. You must have both the Exchange MailRecipients role and the Places TenantPlacesManagement role.

> [!NOTE]
>
> 1. You cannot setup only buildings or only floors using the quick setup with CSV import. The purpose of this tutorial is to setup the basic hierarchy of your places, which requires creating buildings and floors as well as linking rooms to the buildings/floors.  If you only want to create buildings, use [New-Place](/places/PowerShell/new-place).
>
2. Setting up your directory hierarchy of places doesn't change or affect the experience in Room Finder. Once a hierarchy is set up, the only visible change to your organization is in the Microsoft Places work plans experiences in Outlook and Teams. Users will now see an option to select a specific building when setting their work location. However, users are still able to select Office as their work location and aren't required to select a specific building location.

## Create buildings, floors, and associate them to rooms/workspaces

1. Export your list of rooms/workspaces.
   * Use Get-PlaceV3 to export all rooms, regardless of whether they're part of a roomlist.  
   * Use Initialize-Places, Option 1 to export only rooms/workspaces that are part of a roomlist. This ensures that Places Finder shows the same rooms as Room Finder.

```powershell
Get-Placev3 -Type Room | Export-Csv -NoTypeInformation "C:\temp\rooms.csv"
```

```powershell
Initialize-Places
Please choose the desired option before continuing:
 1. Export suggested mapping CSV of rooms to buildings/floors.
 2. Import mapping CSV to automatically create buildings/floors and room mappings.
 3. Export PowerShell script with commands to manually create buildings/floors and room mappings based on an imported CSV.
 X to cancel.
1
```

1. Prepare the file for import.

   * Add or correct the building name and floor name in the first two columns (InferredBuildingName, InferredFloorName). The other columns with room metadata are provided only for reference as you finalize your building and floor names.

   * Remove all columns except InferredBuildingName, InferredFloorName, and PrimarySmtpAddress.

1. Run Initialize-Places cmdlet again. Select Option 2 to import the CSV.
   * Be sure that your CSV file is saved and closed before trying to import.

   * You'll see details in the PowerShell window as creation is occurring, and a file summarizing the results are exported to the same folder as your import file.

> [!WARNING]
> It may take up to 24 hours to see the updated rooms/workspaces in Microsoft Places. We are working on eliminating this delay. The newly created buildings and floors will appear immediately.
>
## Example

This example shows an import file that would result in two buildings created. Austin 550 will have three floors created, and NYC Times Square will have one floor created with a default name of "Unknown." The conference rooms are associated to their corresponding floor/building.

| InferredBuildingName | InferredFloorName | PrimarySmtpAddress |
| -------- | -------- | -------- |
|Austin 550|Mezzanine|<baker@contoso.com>|
|Austin 550|1|<adams@contoso.com>|
|Austin 550|2|<rainier@contoso.com>|
|NYC Times Square||<olympus@contoso.com>|

## Frequently Asked Questions

### Do I have to set up all of my buildings and floors at the same time?

No. You can run Initialize-Places as many times as you want. Remove any rows for room/workspaces that are in buildings/floors that you wish to set up later.

Initialize-Places is only intended to create buildings and floors. If you run the import again, and provide a slightly different name for a building, a new building is created. However, if you use a building name that already exists, the floor/room is associated to the already created building and a new building isn't created.

### My security department wants to know what PowerShell commands are executed during import

You can use Option 3 (Export a PowerShell script) to preview the commands that would be executed. In this option, you provide the same three-column import file. Instead of setting up the buildings, floors, and rooms, Initialize-Places exports a PowerShell script of the commands that would be executed during import. The PowerShell script is exported to the same folder as your import file. *Note: The import file is needed only to generate the PowerShell script. Nothing is imported on your behalf.*

You can use the exported PowerShell script to run the commands yourself rather than using Option 2 in Initialize-Places.

### Can I run import with only Building names?

No. The purpose of this process is to help you associate rooms to floors & buildings. It requires all three columns to exist, although floor name can be empty, which results in the default "Unknown" name for the floor.

### How do I update room data like capacity or display name?

You can do this using [Set-PlaceV3](/places/PowerShell/set-placev3).

## Troubleshooting

### I receive an authentication error

You need to have the Exchange MailRecipients permission and the Places TenantPlacesManagement permission. You can check your assigned roles from an Exchange PowerShell window. Make sure to do this from a separate window than the Microsoft Places PowerShell module.

### I don't see the same options when I run the Initialize-Places command

Ensure that you install the latest version of Microsoft Places PowerShell module. PowerShell might attempt to cache the installed module, so make sure you use the *-**Force* parameter.

```powershell
Install-Module –Name MicrosoftPlaces –AllowPrerelease -Force
```

#### I receive an import error

Make sure that you close the import file. If it's still open in Excel or other programs, you might not be able to import.

### I don't see all rooms after importing

It can take up to 24 hours for the room associations to appear. We're working on eliminating this delay.

## Manual setup

If you prefer to manually set up your buildings, floors, and rooms, you can run individual PowerShell cmdlets to create the buildings and floors, and then link them to a room. Reference [New-Place](/places/PowerShell/new-place) and [Set-PlaceV3](/places/PowerShell/set-placev3). You need to create the buildings first, then the floors with ParentId set to a building, and finally set the room/workspace's ParentId to the floor.

```powershell
New-Place -Type Building -Name "Austin 550"
New-Place -Type Floor -Name "1" -ParentId {PlaceId of Austin550}
Set-PlaceV3 -Identity {smtpAddressOfRoom} -ParentId {PlaceId of Floor1}
```
