---
title: "Licensing helper tool"
ms.author: geokri
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: conceptual
ms.service: office-perpetual-itpro
ms.localizationpriority: medium
ms.collection: Tier3
recommendations: false
description: "Provides admins with information about the licensing helper tool and how to update it with msupdate or manually."
ms.date: 09/18/2024
---

# Licensing helper tool

Office for Mac uses a helper tool to provide device-wide activation for perpetual licenses, such as Office Home & Business 2021. The helper tool is included in the installer package and resides on disk under /Library/PrivilegedHelperTools/com.microsoft.office.licensingV2.helper

> [!NOTE]
> The helper tool isn't installed or used if you've downloaded the Office apps from the Mac App Store.

Starting with Microsoft AutoUpdate 4.41, the helper tool will be updated automatically if an older version is found on your device. If you don't use Microsoft AutoUpdate to keep Office up to date, you can manually download and deploy the helper tool from https://go.microsoft.com/fwlink/p/?linkid=2181269.

You can also use [msupdate](update-office-for-mac-using-msupdate.md) to update the licensing helper tool. Its app identifier is OLIC02.
