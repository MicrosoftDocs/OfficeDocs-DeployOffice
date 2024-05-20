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

Microsoft Places depends on a fully setup hierarchy among your rooms/workspaces, floors, and buildings.  You will need to first create the buildings and floors, and then link them to rooms/workspaces using ParentId.

To make this initial setup easier, you can use `Initialize-Places` to import a CSV so that Microsoft takes care of setting up the hierarchy on your behalf.  The CSV only needs to have the following 3 columns:

* Building Name
* Floor Name
* SMTP of your existing conference room or workspace

Use [Set-PlaceV3](set-placev3.md) to add more metadata on buildings and floors other than name.

## What do you need to know before you begin?
- Estimated time to complete: 5 to 30 minutes, depending on how long it takes to finalize your building and floor names.

- You need to be assigned permissions before you can run this cmdlet. You must have both the Exchange MailRecipients role and the Places TenantPlacesManagement role.

> [!NOTE]
> 1. You cannot setup only buildings or only floors using the quick setup with CSV import.  The purpose of this tutorial is to setup the basic hierarchy of your places, which requires creating buildings and floors as well as linking rooms to the buildings/floors.  If you only want to create buildings, use [New-Place](new-place.md).
2. Setting up your directory hierarchy of places will not impact or change the experience in Room Finder.  Once a hierarchy is setup, the only visible change to your organization will be in the Microsoft Places work plans experiences in Outlook and Teams.  Users will now see an option to select a specific a building when setting their work location.  However, users will continue to be able to select Office as their work location and will not be required to select a specific building location.
## Create buildings, floors, and associate them to rooms/workspaces

1. Export your list of rooms/workspaces.
   - Use Get-PlaceV3 to export all rooms, regardless of whether they are part of a roomlist.  
   - Use Initialize-Places, Option 1 to export only rooms/workspaces that are part of a roomlist.  This will ensure that Places Finder shows the same rooms as Room Finder.
      
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

   - Add or correct the building name and floor name in the first two columns (InferredBuildingName, InferredFloorName).  The other columns with room metadata are provided only for reference as you finalize your building and floor names.
      
   - Remove all columns except InferredBuildingName, InferredFloorName, and PrimarySmtpAddress.
      
1. Run Initialize-Places cmdlet again.  Select Option 2 to import the CSV.
   - Be sure that your CSV file is saved and closed before trying to import.
      
   - You will see details in the PowerShell window as creation is occurring, and a file summarizing the results will be exported to the same folder as your import file.
      
> [!WARNING]
> It may take up to 24 hours to see the updated rooms/workspaces in Microsoft Places.  We are working on eliminating this delay.  The newly created buildings and floors will appear immediately.
## Example
This example shows an import file that would result in two buildings created.  Austin 550 will have 3 floors created, and NYC Times Square will have 1 floor created with a default name of "Unknown".  The conference rooms will be associated to their corresponding floor/building.

| InferredBuildingName | InferredFloorName | PrimarySmtpAddress |
| -------- | -------- | -------- |
|Austin 550|Mezzanine|baker@contoso.com|
|Austin 550|1|adams@contoso.com|
|Austin 550|2|rainier@contoso.com|
|NYC Times Square||olympus@contoso.com|

## Frequently Asked Questions
### Do I have to setup all of my buildings and floors at the same time?
No. You can run Initialize-Places as many times as you want. Remove any rows for room/workspaces that are in buildings/floors that you wish to setup later.

Initialize-Places is only intended to create buildings and floors.  If you run the import again, and provide a slightly different name for a building, a new building will be created.  However, if you use a building name that already exists, the floor/room will be associated to the already created building and a new building will not be created.

### My security department wants to know what PowerShell commands are executed during import.
You can use Option 3 (Export a PowerShell script) to preview the commands that would be executed.  In this option, you will provide the same 3-column import file.  Instead of setting up the buildings, floors, and rooms, Initialize-Places will export a PowerShell script of the commands that would be executed during import.  The PowerShell script will be exported to the same folder as your import file.  *Note: The import file is needed only to generate the PowerShell script. Nothing will be imported or created on your behalf.*

You can use the exported PowerShell script to run the commands yourself rather than using Option 2 in Initialize-Places.

### Can I run import with only Building names?
No. The purpose of this process is to help you associate rooms to floors & buildings.  It requires all 3 columns to exist, although floor name can be empty which will result in the default "Unknown" name for the floor.

### How do I update room data like capacity or display name?
You can do this using [Set-PlaceV3](set-placev3.md).

## Troubleshooting
### I receive an authentication error.
You need to have the Exchange MailRecipients permission as well as the Places TenantPlacesManagement permission.  You can check your assigned roles from an Exchange PowerShell window.  Make sure to do this from a separate window than the Microsoft Places PowerShell module.

### I don't see the same options when I run the Initialize-Places command.
Ensure that you have installed the latest version of Microsoft Places PowerShell module.  PowerShell may have attempted to cache the installed module, so make sure you use the *-*_Force_ parameter.

```powershell
Install-Module –Name MicrosoftPlaces –AllowPrerelease -Force
```

#### I receive an import error.
Make sure that you have closed the import file.  If it is still open in Excel or other programs, you might not be able to import.

### I do not see all rooms after importing.

It can take up to 24 hours for the room associations to appear.  We are working on eliminating this delay.

# Manual setup
If you prefer to manually setup your buildings, floors, and rooms, you can run individual PowerShell cmdlets to create the buildings and floors, and then link them to a room.  Please reference [New-Place](new-place.md) and [Set-PlaceV3](set-placev3.md).  You need to create the buildings first, then the floors with ParentId set to a building, and finally set the room/workspace's ParentId to the floor.

```powershell
New-Place -Type Building -Name "Austin 550"
New-Place -Type Floor -Name "1" -ParentId {PlaceId of Austin550}
Set-PlaceV3 -Identity {smtpAddressOfRoom} -ParentId {PlaceId of Floor1}
```

