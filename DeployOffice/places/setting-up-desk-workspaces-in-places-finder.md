---
title: "Setting up desk pools and workspaces in Microsoft Places Finder"
ms.author: mactra
author: MachelleTranMSFT
manager: jtremper
ms.date: 05/23/2024
audience: ITPro
ms.topic: conceptual
ms.service: o365-proplus-itpro
ms.collection: Tier3
ms.localizationpriority: medium
recommendations: true
description: "Use Microsoft Places Finder to create desk pools and workspaces to enable booking for your organization."
---

# Setting up desk pools and workspaces in Places Finder

You can use Microsoft Places to configure clusters of desks for your organization. Desk clusters are managed together and known as desk pools (they're also referred to as workspaces). By using desk pools users in your organization can reserve a place to work, when they visit the office.

This article helps you create desk pools to enable desk booking for your organization. Once you know how your desk pools look, and how many desks are in each pool, you can create them for your users to book in-office work days. Changes to desk pools will be reflected in approximately 24 to 48 hours.

## Prerequisites

> [!NOTE]
> Places Finder is an opt-in feature. For more information, see [Opt in to the Microsoft Places Public Preview](opt-in-places-preview.md).

You must also do the following steps before you set up your workspaces in Places Finder:

- Create a building
- Install Microsoft Places Finder

## Set up desk pools and enable workspaces in Places Finder

First you create resource accounts for desk pools and update the directory information for each desk pool (the mailbox type is workspace). Use the following PowerShell template to create a new resource account and room mailbox that represent the desk pool.

```powershell
Connect-ExchangeOnline 
New-Mailbox -Room -Alias <alias> -Name <workspace name> | Set-Mailbox -Type Workspace 
Set-MailboxCalendarConfiguration -Identity <alias> -WorkingHoursTimeZone "<TimeZone>" -WorkingHoursStartTime 09:00:00 
Set-CalendarProcessing -Identity <alias> -EnforceCapacity $True -AllowConflicts $True  
```

Use the following PowerShell template to define (and locate) the new desk pool in the building so it appears in Places Finder.

```powershell
Connect-MicrosoftPlaces 
$building = find-places -Type 'Building' -Name <building name> 
$floor = find-places -ParentId $building.Identity -Name <floor label> 
Set-Placev3 -Identity <smtpAddress> -Capacity <capacity> -Label <label> -ParentId <floor identity> -ParentType 'Floor'
```

You can also use the optional PowerShell template to restrict the access of who can book a desk pool.

```powershell
Set-Calendarprocessing <alias> -BookInPolicy <BookableGroupDL>  
```
You can also use the optional PowerShell template to define more attributes for a desk pool.

```powershell
Connect-MicrosoftPlaces 
Set-Placev3 -Identity <smtpAddress> -IsWheelChairAccessible $True -Tags "Monitor", "Docking Station" 
```