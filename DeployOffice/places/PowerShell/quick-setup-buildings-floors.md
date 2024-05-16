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

Places depends on a fully setup hierarchy among your rooms/workspaces, floors, and buildings.  You will need to first create the buildings and floors, and then link them to rooms/workspaces using ParentId.

To make this initial setup easier, use Initialize-Places to import a CSV that handles all of the creation and linking for you.  The CSV only needs to have the following 3 columns:
* Building Name
* Floor Name
* SMTP of your existing conference room or workspace

This quick setup allows you to use experiences in Places that require just a building and/or floor, such as work plans or Places Finder.  Use Set-PlaceV3 to add more metadata onto buildings and floors, such as building address, for other experiences such as browsing nearby buildings.

## What do you need to know before you begin?
- Estimated time to complete: 5 to 30 minutes, depending on how long it takes to finalize your building names.

- You need to be assigned permissions before you can run this cmdlet. You must have both the Exchange MailRecipients role and the Places TenantPlacesManagement role.

## Create buildings, floors, and associate to rooms/workspaces
1. Export your list of rooms/workspaces.
   - Use Get-PlaceV3 to export all rooms, regardless of whether they are part of a roomlist.  
   - Use Initialize-Places Option 1 to export only rooms/workspaces that are part of a roomlist so that Places Finder shows the same rooms as Room Finder.
```powershell
Get-Placev3 -Type Room | Export-Csv -NoTypeInformation "C:\temp\rooms.csv"
or
Initialize-Places
Please choose the desired option before continuing:
 1. Export suggested mapping CSV of rooms to buildings/floors.
 2. Import mapping CSV to automatically create buildings/floors and room mappings.
 3. Export PowerShell script with commands to manually create buildings/floors and room mappings based on an imported CSV.
 X to cancel.
1
```
1. Prepare the file for import by deleting all columns except the below 3 columns.

   - Add or correct the building name and floor name in the first two columns (InferredBuildingName, InferredFloorName).  The other columns with room data are provided for reference but must be removed before import.
      
1. Run Initialize-Places cmdlet again.  Select Option 2 to import the CSV.
   - Be sure to save as a CSV file and close before importing.
   - You will see details in the PowerShell window as creation is occurring, and a file summarizing the results will also be exported.
      
> [!WARNING] 
> It may take up to 24 hours to see the rooms that you've just updated.  The buildings & floors will appear instantly.

## Example
This example shows a file that would result in two buildings created upon import.  Austin 550 will have 3 floors created, and NYC Times Square will have 1 floor created with a default name of "Unknown".  The conference rooms will be associated to their corresponding floor/building.

| InferredBuildingName | InferredFloorName | PrimarySmtpAddress |
| -------- | -------- | -------- |
|Austin 550|Mezzanine|baker@contoso.com|
|Austin 550|1|adams@contoso.com|
|Austin 550|2|rainier@contoso.com|
|NYC Times Square||olympus@contoso.com|

## Frequently Asked Questions
### Do I have to setup all of my buildings and floors at the same time?
No. You can run Initialize-Places as many times as you want. Remove any rows for room/workspaces that are in buildings/floor to be setup later.

Initialize-Places is only intended to *create* buildings and floors.  If you run the import again, and provide a slightly different name for a building, a new building will be created.  If you use a building name that already exists, the floor/room will be associated to the already created building and a new building will not be created.

### My security department wants to know what PowerShell commands are executed during import.
You can use Option 3 (Export a PowerShell script) to preview the commands that would be executed or to run the commands yourself rather than using Option 2 (Import).  In Option 3, provide the same 3-column import file.  Instead of creating/setting up the buildings, floors, and rooms, Initialize-Places will export a PowerShell script that would result in the creation of buildings, floors, and room/workspace associations.  The import file is needed only to generate the PowerShell script - nothing will be imported or created on your behalf.

### Can I run import with only Building names?
No - the purpose of this process is to help you associate rooms to floors & buildings.  It requires all 3 columns to exist although floor name can be empty, which will result in the default "Unknown" name for the floor.

### How do I update room data like capacity or display name?
You can do this using Set-Place cmdlet in Exchange, documented [here](/powershell/module/exchange/set-place?view=exchange-ps).

## Troubleshooting
### I receive an authentication error.
You need to have the Exchange RecipientAdmin permission as well as the Places TenantPlacesManagement permission.  You can check your assigned roles from an Exchange PowerShell window.  Make sure to do this from a separate window than the Microsoft Places PowerShell module.

```powershell
Get-ManagementRoleAssignment -Role TenantPlacesManagement -GetEffectiveUsers | Where {$_.EffectiveUserName -Eq "David Strome"}
```

### I don't see the same options when I run the Initialize-Places command.
Ensure that you have installed the latest version of Microsft Places PowerShell module.  PowerShell may have attempted to cache the installed module, so make sure you use the _Force_ parameter.

```powershell
Install-Module –Name MicrosoftPlaces –AllowPrerelease -Force
```

#### I receive an import error.
Make sure that you have closed the import file.  If it is still open in Excel or other programs, you might not be able to import.

### I do not see all rooms after importing.

It can take up to 24 hours for the room associations to appear.  We are working on eliminating this delay.

# Manual setup
If you prefer to manually setup your buildings, floors, and rooms, you can run individual PowerShell cmdlets to create the buildings and floors, and then link them to a room.  Please reference New-Place and Set-PlaceV3.  You need to create the buildings first, then the floors with ParentId set to a building, and finally set the room/workspace's ParentId to the floor.

```powershell
New-Place -Type Building -Name "Austin 550"
New-Place -Type Floor -Name "1" -ParentId {PlaceId of Austin550}
Set-PlaceV3 -Identity {smtpAddressOfRoom} -ParentId {PlaceId of Floor 1}
```

