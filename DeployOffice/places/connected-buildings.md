---
title: "Connected buildings"
ms.author: mactra
author: MachelleTranMSFT
manager: jtremper
ms.date: 05/28/2024
audience: ITPro
ms.topic: conceptual
ms.service: o365-proplus-itpro
ms.collection: Tier3
ms.localizationpriority: medium
recommendations: true
description: "Learn how to use existing sensor data to enhance Microsoft Places Analytics reports."
---

# Connected buildings

You can use existing sensor data to enhance Places Analytics reports by combining the actual usage with the intended usage of a customer’s conference rooms and buildings. Microsoft Places supports binary occupancy (motion), people density, badge, and Wi-Fi data types.

## Prerequisites

> [!NOTE]
> Connected Workplace is an opt-in feature. For more information, see [Opt in to the Microsoft Places Public Preview](opt-in-places-preview.md).

You must do the following before using the Connected Workplace:

- Create buildings and floors
- Enable Places Analytics

## Add sensor data

The section provides details on how to bring data from existing IoT sensors into Microsoft Places to enable both real-time and analytical experiences. Adding sensore data is done in the following way:

- Generate building occupancy using badge data
- Connect your Wi-Fi systems
- 3P System

### Connect badge-access systems

Upload data from your badge entry system to generate occupancy information for a building. Utilize the following steps to upload this data.

#### Badge-data format

Use the following schema when uploading badge information:

|Column  |Type  |Description |
|---------|---------|---------|
|BadgeNumber  |String   |Optional. The user’s badge identifier. |
|UserEmail    |String   |The username that's badged. It's expected to be an email address (or a user’s full name if email isn't available). |
|DeviceId     |String   |Optional (TBD). The device ID indicates which device generated the signal. |
|TimestampUtc |Timestamp|The timestamp of the badge signal, which indicates when the event occurred.  |
|LocationId   |String   |Optional. If LocationName has been provided. The location ID where the badge is recorded. |
|LocationNam  |String   |Optional if LocationId has been provided. The location name where the badge signal is recorded.  |
|LocationType |Enum     |Optional. The location type of the badge signal. BUILDING is currently supported. |
|Event        |Enum     |The action of the badge, which depends on the sensor type. The value can be EntryGranted, EntryDenied, or ExitGranted, etc. |

#### Upload the badge dataset

1. Open PowerShell 7 (not as an administrator).
2. Install Microsoft Places. For more information on the XX, see XX.

```powershell
Install-Module –Name MicrosoftPlaces –AllowPrerelease -Force
```

3. Import the Places module.

```powershell
Import-Module -Name MicrosoftPlaces
```

4. Connect to the Places module.

```powershell
Connect-MicrosoftPlaces
```

5. Upload the badge dataset from the location (using the folder and path) where it's stored on your device.

```powershell
Push-Dataset -Type BadgeSwipe -Path <folder path>
```

### Connect the Wi-Fi systems

You upload data from your Wi-Fi system to generate occupancy information for a building.

#### Wi-Fi data format

Use the following schema when uploading Wi-Fi information:

|Column  |Type  |Description |
|---------|---------|---------|
|MacAddress  |String   |The user’s Mac address. |
|UserEmail    |String   |The user ID that is connected to Wi-Fi. It's expected to be an email address (or Mac address if an email isn't available). |
|APMacAddress     |String   |The access point indicates which device collected the signal. |
|SessionStartTimeUtc  |Timestamp|The timestamp when a device is connected to Wi-Fi.  |
|SessionEndTimeUtc   |Timestamp   |The timestamp when a device is disconnected to Wi-Fi. |
|SSID  |String   |The service set ID that identify the network name.  |
|APLocation  |String     |The location name of the access point. It could be an external Id of a place or a string with a predefined pattern. For example, Studio B/Foor 2 (pattern :BuildingName/Floor). |

#### Upload the Wi-Fi dataset

1. Open PowerShell 7 (not as an administrator).
2. Install Microsoft Places. For more information on the XX, see XX.

```powershell
Install-Module –Name MicrosoftPlaces –AllowPrerelease -Force
```

3. Import the Places module.

```powershell
Import-Module -Name MicrosoftPlaces
```

4. Connect to the Places module.

```powershell
Connect-MicrosoftPlaces
```

5. Upload the Wi-Fi dataset from the location (using the folder and path) where it's stored on your device.

```powershell
Push-Dataset -Type WifiSignal -Path <folder path>
```
## Device onboarding 

The first step entails uploading a csv with the device metadata and how devices are mapped to a placeid in Microsoft Places. This helps to contextualize the telemetry when it reaches Places.

The following illustration shows a high-level diagram of how you can onboard devices and sensors onto Places.

[GRAPHIC]

There are three ways you can upload device information to Places.

- Option 1, using scripts that are provided by Microsoft (the preferred method). Scripts help you manage (onboard, remove, or update) devices in bulk using a CSV file as an input and iterating using PowerShell cmdlets.
- Option 2, using PowerShell cmdlets. If you want to automate or customize the script, you can use PowerShell cmdlets published on a public repo. PowerShell cmdlets can be used to manage individual devices.
- Option 3, using APIs. If you want to modify the process or automate and integrate with existing systems, you can use the APIs exposed over Microsoft Graph.

