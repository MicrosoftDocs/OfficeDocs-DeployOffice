---
title: "Connect-MicrosoftPlaces"
ms.author: mactra
author: MachelleTranMSFT
manager: jtremper
ms.reviewer: julia.foran
ms.date: 05/20/2024
audience: ITPro
ms.topic: conceptual
ms.service: o365-proplus-itpro
ms.collection: Tier3
ms.localizationpriority: medium
recommendations: true
description: "Learn how to utilize the Connect-MicrosoftPlaces cmdlet for Microsoft Places"
---

# Connect-MicrosoftPlaces

Use the Connect-MicrosoftPlaces cmdlet in the MicrosoftPlaces PowerShell module to connect to Places PowerShell using modern authentication. This cmdlet works for accounts with or without multi-factor authentication (MFA).

## Syntax
```powershell
Connect-MicrosoftPlaces
```

## Description
This command creates a PowerShell connection to enable the use of other MicrosoftPlaces PowerShell commands.

## Parameters
No parameters are exposed for this command.  A browser window will open where you will enter the identity and authentication credentials.

## Troubleshooting
### Are there any prerequisites to using this command?
* Ensure that you are running the latest version of [Microsoft PowerShell 7](https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-windows).
* Ensure that you are running the latest version of the Places PowerShell client.  You can force the install of the latest version using:
```powershell
Install-Module -Name MicrosoftPlaces -AllowPrerelease -Force
```

### I receive an error when attempting to run Connect-MicrosoftPlaces.
* PowerShell 7 does not currently use the proxy settings defined in user settings.
* You cannot currently connect to both Exchange Online and MicrosoftPlaces from within the same PowerShell window.  Please open in separate windows and try again.