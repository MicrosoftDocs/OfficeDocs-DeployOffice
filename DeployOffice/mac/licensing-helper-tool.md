---
title: "Licensing helper tool"
ms.author: danbrown
author: pbowden-msft
manager: dougeby
audience: ITPro
ms.topic: article
ms.service: o365-proplus-itpro
ms.localizationpriority: medium
ms.collection: Ent_O365
ms.custom: Ent_Office_Mac
recommendations: false
description: "Provides admins with information about the licensing helper tool and how to update it with msupdate or manually."
---

# Licensing helper tool

Office for Mac uses a helper tool to provide device-wide activation for perpetual licenses such as Office 2021 Home & Business. The helper tool is included in the installer package and resides on disk under /Library/PrivilegedHelperTools/com.microsoft.office.licensingV2.helper

Starting with Microsoft AutoUpdate 4.41 the helper tool will be automatically updated if an older version is found on your computer. If you don't use Microsoft AutoUpdate to keep Office up-to-date, you can manually download and deploy the helper tool from https://go.microsoft.com/fwlink/p/?linkid=2181269

NOTE: The helper tool is not used or installed if Office apps are downloaded from the Mac AppStore.

You can also use [msupdate](update-office-for-mac-using-msupdate.md) to update the licensing helper tool. It's app identifier is OLIC02.
