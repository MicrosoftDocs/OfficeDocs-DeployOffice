---
title: OneDrive for Business and VDI environments
author: DHB-MSFT
ms.author: danbrown
manager: laurawi
ms.audience: ITPro
ms.topic: article
ms.service: o365-proplus-itpro
localization_priority: Normal
ms.collection: Ent_O365
ms.custom: Ent_Office_ProPlus
description: Learn about OneDrive for Business in VDI environments
---
# OneDrive for Business and VDI environments 

*Applies To: Windows Server (Semi-Annual Channel), Windows Server 2016*

For information about using OneDrive in virtualized environments, including Remote Desktop Services, check out the "Windows specific restrictions and limitations" information in [Restrictions and limitations when you sync files and folders](https://support.microsoft.com/help/3125202/restrictions-and-limitations-when-you-sync-files-and-folders).

The OneDrive Desktop App isn’t supported for client sessions that are hosted on Windows 2008 Terminal Services or Windows 2012 Remote Desktop Services (RDS) in non-persistent environments. Persistent Virtual Desktop Infrastructure (VDI) environments are supported.

For the OneDrive Desktop App to work as designed, the following requirements must be met: 

- The application must be installed on the local computer.
- The user must be able to write to the user profile.
- Data that's written to the user profile must be saved to the local hard disk and be available without a network connection.

Currently we recommend that OneDrive customers in these environments leverage our OneDrive Office 365 web portal or download our OneDrive [UWP app](https://www.microsoft.com/en-us/store/p/onedrive/9wzdncrfj1p3) (Universal Windows Platform) found in the Microsoft Store.
