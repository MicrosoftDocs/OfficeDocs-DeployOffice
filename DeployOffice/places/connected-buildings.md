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

### Prerequisites: prepare device metadata  

1. Download place information from Places.<br>
   Install PowerShell 7. For more information, see [Installing PowerShell on Windows](/powershell/scripting/install/installing-powershell-on-windows).<br>Open PowerShell as an administrator and run the following two PowerShell commands to check if your account has TenantPlacesManagement role, and to make sure your username is listed.

```powershell
Install-Module -Name ExchangeOnlineManagement 
Import-Module -Name ExchangeOnlineManagement 
Connect-ExchangeOnline
```

```powershell
Push-Dataset -Type WifiSignal -Path <folder path>
```

### General guidelines about devices and sensors

- It’s recommended that you provide the DeviceId as Manufacturer_DeviceUniqueId. However, in cases your partners aren't able to send telemetry at a device level (for example, they combine telemetry from multiple devices), a virtual deviceId can be created as Manufacturer_Building_VirtualDeviceId. In this case, VirtualDeviceId can be some natural key of a space. If your customer is providing the VirtualDeviceId, it's recommended that you include information about the physical devices from which the telemetry is being calculated. Physical-device information can be in tags.

- If Sensor.SensorType is unique for a device, you just need to provide SensorType. In cases where there are multiple data streams for a particular sensor type for a device, a unique SensorId is needed. SensorType and SenorId, in most cases, will be PeopleCount, Occupancy, etc., unless SensorType is not unique for a device. In this case, SensorId will be SensorType_SomeUnique identifier.

- PlaceId for a device will be used to associate all sensors to a space unless PlaceId is specified.

### Option 1: using scripts

First, install the PowerShell cmdlets. For more information, see the [Microsoft Places cmdlets module for PowerShell](https://www.powershellgallery.com/packages/MicrosoftPlaces/0.32.0-alpha).

Powershell scripts help you upload and manage devices in bulk. Microsoft provides scripts to upload, edit, and delete devices. The scripts internally use the PowerShell cmdlets. Scripts use CSV files as an input. [LINK NOT PUBLIC?]

> [!NOTE]
> To run scripts, you must have the TenantPlacesManagement role assigned.

Next, run the onboarding script with your prepared CSV to onboard devices. If you want to customize scripts and use the Powershell cmdlets [NOT SURE WHAST TGHIS MEANS] themselves, they may reference the next section.

|Script name  |Description  |
|---------|---------|
|**OnboardPlaceDevice.ps1 -FilePath $FilePath** |Onboards devices in the CSV file into Places. |
|**DeletePlaceDevice.ps1 -FilePath $FilePath**  |Deletes devices in the CSV file from Places. |
|**UpdatePlaceDevice.ps1 -FilePath $FilePath** |Updates devices in the CSV file from Places |

> [!NOTE]
> **$FilePath** should be full path name.

### Option 2: Using PowerShell cmdlets

There are Powershell cmdlets you can use to manage devices in Places. For more information, see the [Microsoft Places cmdlets module for PowerShell](https://www.powershellgallery.com/packages/MicrosoftPlaces/0.32.0-alpha).

> [!NOTE]
> To run scripts, you must have the TenantPlacesManagement role assigned.

|Cmdlet name  |Description  |Parameters |
|---------|---------|---------|
|**New-PlaceDevice**  |Creates a new device |DeviceId (mandatory)<br>DisplayName<br>Description<br>MACAddress<br>Manufacturer (mandatory)<br>IPV4Address<br>IPV6Address<br>PlaceId<br>Tags<br>Sensors (mandatory)   |
|**Remove-PlaceDevice** |Deletes a device   |Id (mandatory)  |
|**Set-PlaceDevice**  |Updates a device     |Id (mandatory)<br>DeviceId (mandatory)<br>DisplayName<br>Description<br>MACAddress<br>Manufacturer (Mandatory)<br>IPV4Address<br>IPV6Address<br>PlaceId<br>Tags<br>Sensors (mandatory)   |
|**Get-PlaceDevice**  |Gets a device        |Id<br>Filter<br>Top  |

### Option 3: Using APIs

If you want to build an application to automate registering and onboarding devices, APIs are available through Microsoft Graph. To do this, follow these steps.

1. Register an Azure Active Directory (AAD) [Should we be using Microsoft Entra ID?] application to get the following permissions.

|Header 1  |Header 2  |
|---------|---------|
|**ScopeName**    |[PlaceDevice.Read.All](/graph/permissions-reference) |
|**DisplayName**  |Read organization Places devices |
|**Description**  |Allows app to read all place devices in the organization |
|**Type**         |Application-only |
|**Admin consent** (yes or no)      |Yes |

|Header 1  |Header 2  |
|---------|---------|
|**ScopeName**    |[PlaceDevice.ReadWrite.All](/graph/permissions-reference) |
|**DisplayName**  |Read and write organization Places devices |
|**Description**  |Read and write organization Places devices |

|Header 1  |Header 2  |
|---------|---------|
|**Type**    |Application-only |
|**Admin consent** (yes or no)  |Yes |

2. Build and deploy an application to sync device information across Places and your partners.

3. Service Details.

```powershell
{
    "error": {
        "code": "InvalidAuthenticationToken",
        "message": "Access token is empty.",
        "innerError": {
            "date": "2024-05-28T23:17:51",
            "request-id": "1c212140-3bf2-4f7c-93e9-5c742d2c3c87",
            "client-request-id": "1c212140-3bf2-4f7c-93e9-5c742d2c3c87"
        }
    }
}
```
See the following Microsoft Graph APIs for more information:

- [List sensorDevices](/graph/api/workplace-list-sensordevices)
- [Create workplaceSensorDevice](/graph/api/workplace-post-sensordevices)
- [Get workplaceSensorDevice](/graph/api/workplacesensordevice-get)
- [Update workplaceSensorDevice](/graph/api/workplacesensordevice-update)
- [Delete workplaceSensorDevice](/graph/api/workplacesensordevice-delete)

## Telemetry ingestion workflow

Once your have your devices onboarded into Places, you can perform a one-time backfill of historical data to populate Places with historical telemetry. Then you can configure Places to receive continuous telemetry from your devices to stay up to date. The following diagram outlines the backfill file upload flow (top half) as well as the continuous device telemetry flow (bottom half).

