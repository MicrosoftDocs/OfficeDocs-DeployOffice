---
title: "Remove-Place"
ms.author: mactra
author: MachelleTranMSFT
manager: jtremper
ms.reviewer: julia.foran
ms.date: 05/21/2024
audience: ITPro
ms.topic: conceptual
ms.service: o365-proplus-itpro
ms.collection: Tier3
ms.localizationpriority: medium
recommendations: true
description: "Places PowerShell cmdlet to remove places."
---

# Remove-Place

Use the Remove-Place cmdlet to delete buildings or floors from your Places directory.

> [!NOTE]
> Rooms and workspaces continue to be removable using Exchange [Remove-Mailbox](/powershell/module/exchange/remove-mailbox).

## Syntax

```powershell
Remove-Place
   [-Id]
```

## Description

You need to be assigned permissions before you can run this cmdlet. You must have either the Exchange MailRecipients role or the Places TenantPlacesManagement role.

You can't remove a place that is a parent of other places. Before removing a place, clear the parentId value of its existing child places before attempting to remove. As an example, clear the ParentId value on all rooms associated with a given floor before deleting that floor.

> [!CAUTION]
> You might find additional parameters in the PowerShell cmdlet, but those are not currently supported. It is not recommended to use any parameter that is not documented on this page.

## Examples

### Example 1

Delete a floor based on its PlaceId.

```powershell
Remove-Place -Id 86897e93-bcef-4c05-af9d-45116dda791f 
```

## Parameters

### -Id

The identity parameter specifies the place that you want to view. You can use any value that uniquely identifies a place.

> [!NOTE]
> This will soon be renamed to -Identity to be consistent with the other cmdlets.

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

|Attribute|Description|
| -------- | -------- |
|Type:|RecipientIdParameter|
|Position:|0|
|Default value:|None|
|Required:|False|
|Accept pipeline input:|True|
|Accept wildcard characters:|False|
