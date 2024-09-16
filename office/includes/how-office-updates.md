---
author: nwhite
ms.author: nwhite
manager: dougeby
ms.service: office-perpetual-itpro
ms.localizationpriority: high
ms.topic: include
description: Explains how updates are installed.
ms.date: 09/18/2024
---
<!--This file is shared by ltsc/2024/update.md, ltsc/2024/update.md. Headings are driven by article context.-->
Here’s how Office updates work:

- When Microsoft releases updates for Office, a new build is made available on the Office Content Delivery Network (CDN). This build includes the latest security and quality updates.
- By default, Office is configured to automatically receive updates from the Office CDN. You can change this setting. For more information, see [Configure where Office LTSC gets updates from](#update-location).
- The "Office Automatic Updates 2.0" scheduled task on the device checks for updates regularly.
- If updates are available, Office automatically downloads them without user intervention. During this process, Office downloads only the necessary updates to match the latest version on the CDN.
- Users can continue working in Office apps like Word while updates are downloading. After the updates download, they're installed. If any Office apps are open, users are prompted to save their work and close the apps to install the updates.
- After installation, users can resume working in their Office apps.