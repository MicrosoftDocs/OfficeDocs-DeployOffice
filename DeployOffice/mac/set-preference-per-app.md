---
title: "Per-App preference for Office on Mac"
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

# Set Per-App preference for Office on Mac

***Applies to:*** *Word for Mac, Excel for Mac, PowerPoint for Mac, Outlook for Mac, Office LTSC for Mac 2021, Office 2019 for Mac*

Office for Mac allows administrators to configure various settings to enhance the user experience and streamline support processes. While some settings apply suite-wide, others are specific to individual apps but serve a common purpose across the suite. This article provides detailed information about per-app settings, enabling IT administrators to configure preferences that apply to multiple Office apps on Mac.

### CustomerLoggingEnabled

Enable verbose logging for Customer Support escalations.

| **Category** | **Details** |
|--------------|-------------|
| **Domain**   | `com.microsoft.word`, `com.microsoft.excel`, `com.microsoft.powerpoint`, `com.microsoft.onenote.mac`, `com.microsoft.outlook` |
| **Key**      | `CustomerLoggingEnabled` |
| **Data Type**| Boolean |
| **Possible Values** | `false` (default), `true` |
| **Apps**     | Word, Excel, PowerPoint, Outlook, OneNote |
| **Availability** | 16.17 (Office for Mac) |
| **Comments** | This key enables verbose mode logging for Customer Support escalations. It also places the Diagnostic logs in the device’s Documents folder for easier access. |
