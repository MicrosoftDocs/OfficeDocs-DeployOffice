---
author: nwhite
ms.author: nwhite
manager: dougeby
ms.service: office-perpetual-itpro
ms.localizationpriority: high
ms.topic: include
description: Explains where Office updates from.
ms.date: 09/18/2024
---
<!--This file is shared by ltsc/2024/update.md, ltsc/2024/update.md. Headings are driven by article context.-->
If network connectivity and your organizational requirements allow, update Office automatically from the Office Content Delivery Network (CDN). Updating from the Office CDN is the default, so there’s nothing extra to do, making it an easy way to keep Office up to date.

If you prefer that devices with Office installed don't connect to the Office CDN for updates, configure Office to get updates from a shared folder within your internal network. You can specify this location either in the configuration.xml file used to deploy Office with the Office Deployment Tool or by using [Group Policy](#use-group-policy-to-specify-update-settings). At least one device must have access to the Office CDN to download the latest version of Office to the shared folder on your internal network.

Installing and updating Office from a shared folder on your local network requires more administrative effort and disk space. For example, you need to track when new builds of Office are available and then download the updated version to your network. Downloading to a shared folder on your local network downloads a full copy of the updated version of Office.

You can also use enterprise software deployment tools, such as Microsoft Configuration Manager, to help update Office.