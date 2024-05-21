---
title: "Get-PlaceV3"
ms.author: mactra
author: MachelleTranMSFT
manager: jtremper
ms.reviewer: julia.foran
ms.date: 05/15/2024
audience: ITPro
ms.topic: conceptual
ms.service: o365-proplus-itpro
ms.collection: Tier3
ms.localizationpriority: medium
recommendations: true
description: "Places PowerShell cmdlet to get places."
---

# Get-PlaceV3

Use the Get-PlaceV3 cmdlet to view metadata configured on conference rooms, workspaces, buildings, or floors within the Places directory.

> [!NOTE]
> Work is in progress to bring this cmdlet's functionality into the existing Exchange [Get-Place](/powershell/module/exchange/get-place) cmdlet.
>
## Syntax

```powershell
Get-PlaceV3
   [-Identity]
   [-AncestorId]
   [-Type]
```

## Description

You need to be assigned permissions before you can run this cmdlet. You must have either the Exchange MailRecipients role or the Places TenantPlacesManagement role.

> [!CAUTION]
> You might find additional parameters in the PowerShell cmdlet, but those are not currently supported.  It is not recommended to use any parameter that is not documented on this page.

## Examples

### Example 1

This example returns a room or workspace using its smtp address identifier.

```powershell
Get-PlaceV3 -Identity smtp@domain.com
```

### Example 2

This example returns all places of a certain type.

```powershell
Get-PlaceV3 -Type Building
```

### Example 3

This example returns the PlaceId based on a place's name and type.

```powershell
Get-PlaceV3 -Type Building | Where-Object -Property DisplayName -eq 'Pine Valley' | fl PlaceId
```

### Example 4

This example returns all places whose ancestor is a specific place.

```powershell
Get-PlaceV3 -AncestorId 86897e93-bcef-4c05-af9d-45116dda791f 
```

## Parameters

### -Identity

The identity parameter specifies the place that you want to view. You can use any value that uniquely identifies a place.

For example, for places based on a mailbox (conference rooms and workspaces):

* Name
* Alias
* Distinguished name (DN)
* Canonical DN
* Email address
* GUID

For example, for places that aren't based on a mailbox (buildings and floors):

* Name_PlaceId
* PlaceId

You can't use this parameter with the Type parameter.

|Attribute|Description|
|:-----------|:-----------|
|Type:|RecipientIdParameter|
|Position:|0|
|Default value:|None|
|Required:|False|
|Accept pipeline input:|True|
|Accept wildcard characters:|False|

### -AncestorId

The AncestorId parameter specifies the guid of place. If the specified place found, it returns all places below this place in the directory hierarchy. For example, if a building's PlaceId is provided as the AncestorId, the command would return all floors, rooms, and workspaces that are under that building in the directory hierarchy.

|Attribute|Description|
|:-----------|:-----------|
|Type:|String|
|Position:|Named|
|Default value:|None|
|Required:|False|
|Accept pipeline input:|False|
|Accept wildcard characters:|False|

### -Type

The Type parameter specifies the type of the place that you want to view. Valid values are:

* Room
* RoomList
* Space
* Building
* Floor

You can't use this parameter with the Identity parameter.

|Attribute|Description|
|:-----------|:-----------|
|Type:|String|
|Position:|Named|
|Default value:|None|
|Required:|False|
|Accept pipeline input:|False|
|Accept wildcard characters:|False|
