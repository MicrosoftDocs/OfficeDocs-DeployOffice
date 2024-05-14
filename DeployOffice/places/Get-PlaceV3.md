---
title: "Get-PlaceV3
ms.author: mactra
author: MachelleTranMSFT
manager: jtremper
ms.date: 05/14/2024
audience: ITPro
ms.topic: conceptual
ms.service: o365-proplus-itpro
ms.collection: Tier3
ms.localizationpriority: medium
recommendations: true
description: "PowerShell cmdlet for Places to get places."
---
Use the Get-Place cmdlet to view the metadata configured on your buildings or floors within your Places directory, as well as your conference rooms and workspaces.  The additional metadata provides a better search and room suggestion experience, as well as other suggestions and experiences when using Microsoft Places.

_Note: Work is in progress to bring this cmdlet's functionality into the existing Exchange Get-Place cmdlet._

# Syntax

```powershell

Get-PlaceV3

   [-Identity]

   [-AncestorId]

   [-Type]

```

# Description

You need to be assigned permissions before you can run this cmdlet. You must have either the Exchange MailRecipients role or the Places TenantPlacesManagement role.

You might see additional parameters in the PowerShell cmdlet, but those are not currently supported.  It is not recommended to use any parameter that is not documented on this page.

# Examples

## Example 1

Retrieve a room or workspace using its smtp address identifier.

```powershell

Get-PlaceV3 -Identity smtp@domain.com

```

## Example 2

Retrieve a place based on its type.  This example returns all buildings.

```powershell

Get-PlaceV3 -Type Building

```

## Example 3

Retrieve a place and its two-level children using AncestorId parameter. If AncestorId provided is a building, it will retrieve the building itself, all the floors that belongs to that building and the rooms and workspaces located at those floors in that building.

```powershell

Get-PlaceV3 -AncestorId 86897e93-bcef-4c05-af9d-45116dda791f 

```

# Parameters

## -Identity

The identity parameter specifies the place that you want to view. You can use any value that uniquely identifies a place.

For example, for places based on a mailbox (conference rooms and workspaces):

* Name

* Alias

* Distinguished name (DN)

* Canonical DN

* Email address

* GUID

For example, for places that are not based on a mailbox (buildings and floors):

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

## -AncestorId

The AncestorId parameter specifies the guid of place that will be listed. If found it also retrieves 2 levels of children. For example, for a AncestorId of type Building it will retrieve the building, its floors and its associated rooms and spaces.

|Attribute|Description| 

|:-----------|:-----------| 

|Type:|String|

|Position:|Named|

|Default value:|None|

|Required:|False|

|Accept pipeline input:|False|

|Accept wildcard characters:|False|

## -Type

The Type parameter specifies the type of the place that you want to view.  Valid values are:

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
