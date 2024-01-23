---
title: "Data sent to Microsoft for the inventory feature in the Microsoft 365 Apps admin center"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: reference
ms.service: o365-proplus-itpro
ms.localizationpriority: medium
ms.collection: Tier2
recommendations: false
description: "Lists the device and add-in information that is sent to Microsoft for the inventory feature in the Microsoft 365 Apps admin center."
ms.date: 01/23/2024
---

# Data sent to Microsoft for the inventory feature in the Microsoft 365 Apps admin center

The information in the following tables is sent to Microsoft to provide the insights shown in the [inventory feature](inventory.md) in the Microsoft 365 Apps admin center.

> [!NOTE]
> This information is sent to Microsoft regardless of how you have configured the [diagnostic data setting](../privacy/overview-privacy-controls.md#diagnostic-data-sent-from-microsoft-365-apps-for-enterprise-to-microsoft) for devices in your organization.


## Device information collected

The following information is collected for each device in the inventory.

|Name  |Description  |Example  |
|---------|---------|---------|
|AadDeviceID|The Microsoft Entra Device ID of the device|	4f25d6b7-1798-800y-b33a-4f23dd64dcac|
|Applications|	A list of the Office apps installed on the device| Word, Excel, PowerPoint|
|Architecture|	The architecture of the Office installation|	x64|
|BuildVersion|	The build string of the Office installation|	16.0.13231.20262 (X64)|
|DeviceName|	The name of the device|	MyDeviceName|
|FreeDiskSpaceInBytes|	The remaining storage on the drive on which Office is installed|	335 GB|
|Manufacturer|	The device manufacturer	|Microsoft Corporation|
|Model|	The device model|	Surface Laptop 3|
|ModelFamily|	The device model family|	Surface|
|OfficeApplicationMacroEnabledFilesYes|A value, per Office app, that indicates the number of Office files with a macro that were recently opened. Doesn't include the name or content of the macro.|	Word; 1. Excel; 3.|
|OSBuildVersion| The build number of the operating system that is running on the device|	10.0.19042.572 (X64)|
|OSFamily|	The operating system that is running on the device|	Windows|
|OSReleaseVersion|	The version of the operating system that is running on the device|	2009|
|ProcessorArchitecture|	The architecture of the processor of the device|	PROCESSOR_ARCHITECTURE_AMD64|
|ProofingLanguages|	The proofing languages for Office that are installed on the device|	en-US, en-GB|
|ServiceProfileID|	The ID of the cloud update profile the device is in|	*GUID*|
|SharedComputerLicensing| A value indicating whether Office is configured for shared computer activation|	1|
|SignedIn|	A value indicating whether a user is signed in.|	TRUE|
|TotalDiskSpaceInBytes|	The total storage on the drive on which Office is installed	|512 GB|
|TotalMemoryInBytes| The total RAM installed on the device	|16 GB|
|UILanguages|	The UI languages for Office that are installed on the device|	en-US, fr-FR|
|UpdateChannel|	The update channel that Office is receiving updates from|	Current Channel|
|UpdateLocation|The location  where Office is getting updates from, such as the Office Content Delivery Network (CDN) or a network location|	UpdateLocation:http://officecdn.microsoft.com/pr/492350f6-3a01-4f97-b9c0-c7c6ddf67d60|


## Add-in information collected

The following information is collected for each COM add-in that is installed on a device in the inventory.


|Name  |Description  |Example  |
|---------|---------|---------|
|Architecture | The architecture of the add-in| x64 |
|CLSID | The class ID of the add-in| f39d01f3-69c1-45e1-93b2-7bf0bc6eb63e |
|CompanyName |The company name, as specified by the developer |Contoso  |
|Description |The description, as specified by the developer (if present) |Power Map 3D Data Visualization Tool for Microsoft Excel|
|FileName | Primary file name of the DLL for the add-in|excelpluginshell.dll |
|FileTimeStamp | The timestamp of the DLL for the add-in |1602155152 |
|FileVersion | The version of the DLL for the add-in |16.0.13328.20130 |
|FriendlyName |The friendly name, as specified by the developer|Map for Excel |
|ID | The ID of the add-in |excelpluginshell.powermapconnect |
|OfficeApplication |The Office application that the add-in is for | Excel |
|ProductName|The product name, as specified by the developer|Contoso Map for Excel|
|ProductVersion | The product version of the DLL for the add-in | 16.0.13328.20130|
|Type | The type of add-in  | COM |
