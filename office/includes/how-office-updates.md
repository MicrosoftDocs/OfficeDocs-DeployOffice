---
author: nwhite
ms.author: nwhite
manager: dougeby
ms.service: office-perpetual-itpro
ms.localizationpriority: high
ms.topic: include
description: Notification that Teams is no longer included with LTSC.
ms.date: 09/18/2024
---
<!--This file is shared by ltsc/2024/deploy.md, ltsc/2024/overview.md. Headings are driven by article context.-->
Click-to-Run manages updates differently compared to Windows Installer (MSI). Here’s how updates work for Office:

- When updates are available for Office, Microsoft releases a new build on the Office Content Delivery Network (CDN) on the internet. This new build includes the latest security and quality updates.
- By default, Office is set to receive updates automatically and directly from the Office CDN, although this setting can be adjusted. For more details, see [Configure where Office LTSC 2024 gets updates from](#update-location).
- A scheduled task named "Office Automatic Updates 2.0" on the device where Office is installed checks for updates regularly.
- If updates are available, Office starts downloading them automatically, requiring no user intervention. As part of this process, Office identifies the differences between the latest version of Office on the Office CDN and the version installed on the device, downloading only what’s necessary to bring Office up to date.
- While the updates are being downloaded, users can continue working in Office apps, such as Word. After the updates have been downloaded, they are installed. If any Office apps are open, users will be prompted to save their work and close the apps so that the updates can be installed.
- Once the updates are installed, users can resume working in their Office apps.
