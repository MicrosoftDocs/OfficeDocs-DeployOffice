---
title: "Word, Excel, and PowerPoint for macOS – Planned update to compatibility Office add-ins and Open Database Connectivity drivers"
ms.author: nwhite
author: nicholasswhite
manager: dougby
audience: ITPro
ms.topic: conceptual
ms.service: o365-proplus-itpro
ms.collection: Tier1
ms.localizationpriority: medium
ROBOTS: NOINDEX, NOFOLLOW
recommendations: false
hideEdit: true
description: "Details the planned update to non-Microsoft product compatibility for Word, Excel, and PowerPoint for macOS version 16.91."
ms.date: 10/15/2024
---

# Word, Excel, and PowerPoint for macOS – Planned update to compatibility Office add-ins and Open Database Connectivity drivers

> [!IMPORTANT]
> In this article, when *non-Microsoft products* is mentioned, it specifically refers to products and applications that  enhance or extend Office functionality (like add-ins or integrations). This doesn't include all non-Microsoft software installed on your device.

Microsoft Word, Excel, and PowerPoint in Office for macOS Version 16.91 only load dynamic libraries that are codesigned with a valid Apple Developer ID. As a result, Office add-ins or Open Database Connectivity (ODBC) drivers that rely on unsigned or ad-hoc-signed dynamic libraries don't work as intended. 

> [!NOTE]
> Most dynamic libraries used with Office applications are already codesigned, so this change is unlikely to affect most users.
## Change date

This change is expected to be live in production in mid-November 2024.

## Reason for the change

Microsoft requires executable code from non-Microsoft products be codesigned with a valid [Apple Developer ID](https://developer.apple.com/developer-id/). This requirement ensures that only verified and properly signed code runs within Office applications, promoting code integrity and compliance with macOS development standards.

## Workflow changes for users

If your workflow uses unsigned dynamic libraries within Word, Excel, or PowerPoint for macOS, it no longer works as intended. You need to get an updated version of the product from the original software developer.

## Actions required for developers

If your product uses dynamic libraries, make sure they're codesigned with an Apple Developer ID. Unsigned or ad-hoc-signed libraries are no longer allowed to load into Office app processes. For more information on the Apple Developer program and tools, see the [Apple Developer Program](https://developer.apple.com). Office applications support libraries codesigned for distribution through any Apple-supported distribution mechanism, including direct download by your customers.

## Steps for admins

- Verify Deployed non-Microsoft Products: Check if you have any non-Microsoft products deployed to your users. These products often:

  - Extend Office functionality by adding menu or ribbon controls.
  - Communicate with other applications to share content with Office.
  - Support external data connections such as ODBC.

- Confirm codesigning compliance: Make sure that any non-Microsoft products follow best practices and codesigned any dynamic libraries included in their products. If any libraries aren't codesigned, contact the product developer for updates.

- Monitor system logs: Inspect the system console logs for *Library Load Constraint Rejection* messages. These messages from macOS identify any dynamic library that the OS rejects from loading into an Office app process.

- Consider proactively blocking all non-Microsoft libraries: To block these libraries, set the Office preference `DisableVisualBasicExternalDylibs` to `true` using Mobile Device Management (MDM) software. For more information, see the [Apple Platform Deployment guide](https://support.apple.com/guide/deployment/welcome/web).

  > [!WARNING]
  > Blocking all non-Microsoft libraries from running within Visual Basic macros is a significant action and should only be considered if absolutely necessary for your organization's requirements on macOS computers.