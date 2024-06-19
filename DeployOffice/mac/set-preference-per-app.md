---
title: "Per-App Settings for Office on Mac"
ms.author: geokri
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: reference
ms.service: o365-proplus-itpro
ms.subservice: office-mac
ms.localizationpriority: medium
ms.collection: Tier3
recommendations: false
description: "Shows settings that apply to all Office apps on Mac but are configured per app."
ms.date: 06/19/2024
---

# Per-App Settings for Office on Mac

This article provides information about settings that apply to all Office apps on Mac but are configured per app.

## Logging for Customer Support Settings

Enable verbose logging for Customer Support escalations.

### CustomerLoggingEnabled

| **Category** | **Details** |
|--------------|-------------|
| **Domain**   | `com.microsoft.word`, `com.microsoft.excel`, `com.microsoft.powerpoint`, `com.microsoft.onenote.mac`, `com.microsoft.outlook` |
| **Key**      | `CustomerLoggingEnabled` |
| **Data Type**| Boolean |
| **Possible Values** | `false` (default), `true` |
| **Apps**     | Word, Excel, PowerPoint, Outlook, OneNote |
| **Availability** | 16.17 (Office for Mac) |
| **Comments** | This key enables verbose mode logging for Customer Support escalations. It also places the Diagnostic logs in the device’s Documents folder for easier access. |
