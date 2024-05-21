---
title: "Connect-MicrosoftPlaces"
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
description: "Learn how to utilize the Connect-MicrosoftPlaces cmdlet for Microsoft Places."
---

# Connect-MicrosoftPlaces

You can connect to Places PowerShell using modern authentication by running the Connect-MicrosoftPlaces cmdlet. This cmdlet works for accounts with or without multifactor authentication (MFA).

## Syntax

```powershell
Connect-MicrosoftPlaces
```

## Description

This command creates a PowerShell connection to enable the use of other MicrosoftPlaces PowerShell commands.

## Parameters

No parameters are exposed for this command. A browser window opens where you enter the identity and authentication credentials.

## Troubleshooting

### Are there any prerequisites to using this command?

* Ensure that you're running the latest version of [Microsoft PowerShell 7](/powershell/scripting/install/installing-powershell-on-windows).
* Ensure that you're running the latest version of the Places PowerShell client. You can force the install of the latest version using:

```powershell
Install-Module -Name MicrosoftPlaces -AllowPrerelease -Force
```

### I receive an error when attempting to run Connect-MicrosoftPlaces.

* PowerShell 7 doesn't currently use the proxy settings defined in user settings.
* You can't currently connect to both Exchange Online and MicrosoftPlaces from within the same PowerShell window. Open in separate windows and try again.
### Do I need certain permissions to run Connect-MicrosoftPlaces?

No.  Permissions are enforced when running other commands after authentication completes.

