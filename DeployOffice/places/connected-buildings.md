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

The section provides details on how to bring data from existing IoT sensors into Microsoft Places to enable both real-time and analytical experiences. Adding sensor data is done in the following way:

- Generate building occupancy using badge data
- Connect your Wi-Fi systems
- 3P System

### Connect badge-access systems

Upload data from your badge-entry system to generate occupancy information for a building.

#### Badge-data format

Use the following schema when uploading badge information:

|Column  |Type  |Description |
|---------|---------|---------|
|BadgeNumber  |String   |Optional. The user’s badge identifier. |
|UserEmail    |String   |The badged username (an email address or a user’s full name if an email address isn't available). |
|DeviceId     |String   |Optional (TBD). The device ID indicates which device generated the signal. |
|TimestampUtc |Timestamp|The timestamp of the badge signal, which indicates when the event occurred.  |
|LocationId   |String   |Optional. If LocationName is provided. The location ID where the badge is recorded. |
|LocationNam  |String   |Optional if LocationId is provided. The location name where the badge signal is recorded.  |
|LocationType |Enum     |Optional. The location type of the badge signal. BUILDING is currently supported. |
|Event        |Enum     |The action of the badge, which depends on the sensor type. The value can be EntryGranted, EntryDenied, or ExitGranted, etc. |

#### Upload the badge dataset

1. Open PowerShell 7 (not as an administrator).
2. Install Microsoft Places by running the following Windows PowerShell cmdlet. For more information on Places installation, see the [Microsoft Places PowerShell Gallery](https://www.powershellgallery.com/packages/MicrosoftPlaces/0.32.0-alpha).

```powershell
Install-Module –Name MicrosoftPlaces –AllowPrerelease -Force
```

3. Import the Places module by running the following Windows PowerShell cmdlet.

```powershell
Import-Module -Name MicrosoftPlaces
```

4. Connect to the Places module by running the following Places PowerShell cmdlet.

```powershell
Connect-MicrosoftPlaces
```

5. Upload the badge dataset from the location on your device (using the folder and path) by running the following Places PowerShell cmdlet.

```powershell
Push-Dataset -Type BadgeSwipe -Path <folder path>
```

### Connect the Wi-Fi systems

You upload data from your Wi-Fi system to generate occupancy information for a building.

#### Wi-Fi data format

Use the following schema when uploading Wi-Fi information:

|Column  |Type  |Description |
|---------|---------|---------|
|**MacAddress**  |String   |The user’s Mac address. |
|**UserEmail**    |String   |The user ID (an email address, or Mac address if an email address isn't available) connected to Wi-Fi. |
|**APMacAddress**     |String   |The access point indicates which device collected the signal. |
|**SessionStartTimeUtc**  |Timestamp|The timestamp when a device is connected to Wi-Fi.  |
|**SessionEndTimeUtc**   |Timestamp   |The timestamp when a device is disconnected to Wi-Fi. |
|**SSID**  |String   |The service set ID that identify the network name.  |
|**APLocation**  |String     |The location name of the access point. It can be an external ID of a place or a string with a predefined pattern. For example, Studio B/Foor 2 (pattern: BuildingName/Floor). |

#### Upload the Wi-Fi dataset

1. Open PowerShell 7 (not as an administrator).
2. Install Microsoft Places by running the following Windows PowerShell cmdlet. For more information on Places installation, see the [Microsoft Places PowerShell Gallery](https://www.powershellgallery.com/packages/MicrosoftPlaces/0.32.0-alpha).

```powershell
Install-Module –Name MicrosoftPlaces –AllowPrerelease -Force
```

3. Import the Places module by running the following Windows PowerShell cmdlet.

```powershell
Import-Module -Name MicrosoftPlaces
```

4. Connect to the Places module by running the following Places PowerShell cmdlet.

```powershell
Connect-MicrosoftPlaces
```

5. Upload the Wi-Fi dataset from the location (using the folder and path) where it's stored on your device by running the following Places PowerShell cmdlet.

```powershell
Push-Dataset -Type WifiSignal -Path <folder path>
```
## Connect other occupancy sensors or people-denisty sensors

Connecting occupancy and people-density sensrors is done in four steps.

- Device onboarding
- Backfilling with historical data
- Real-time telemetry ingestion
- Verifying available data in Places

## Device onboarding

The first step involves uploading a csv with the device metadata and how devices are mapped to a placeid in Microsoft Places. This helps to contextualize the telemetry when it reaches Places.

The following illustration shows a high-level diagram of how you can onboard devices and sensors onto Places.

[GRAPHIC 1]

There are three ways you can upload device information to Places.

- Option 1, using scripts that are provided by Microsoft (the preferred method). Scripts help you manage (onboard, remove, or update) devices in bulk using a CSV file as an input and iterating using PowerShell cmdlets.
- Option 2, using PowerShell cmdlets. If you want to automate or customize the script, you can use PowerShell cmdlets published on a public repo. PowerShell cmdlets can be used to manage individual devices.
- Option 3, using APIs. If you want to modify the process or automate and integrate with existing systems, you can use the APIs exposed over Microsoft Graph.

### Prerequisites: prepare device metadata  

1. Download place information from Microsoft Places. First, install PowerShell 7 by running the following Powershell cmdlet. For more information, see [Installing PowerShell on Windows](/powershell/scripting/install/installing-powershell-on-windows).

   
```powershell
Install-Module -Name ExchangeOnlineManagement 
Import-Module -Name ExchangeOnlineManagement 
Connect-ExchangeOnline
```

2. Open PowerShell as an administrator and run the following ExchangeOnline PowerShell command to check if your account has the required TenantPlacesManagement role, and to make sure your username is listed.

```powershell
Get-ManagementRoleAssignment -Role TenantPlacesManagement -GetEffectiveUsers 
```

3. You should see the following name and assigned role if you have the right permissions.

   - Name: PlacesAdmin
   - Assigned Role: TenantPlacesManagement

4. To get the PlaceId of buildings, run the following ExchangeOnline PowerShell cmdlet:

```powershell
Install-Module –Name MicrosoftPlaces –AllowPrerelease -Force 
Connect-MicrosoftPlaces 
```

5. Use the MS_Places_Get_PlaceId.ps1 script, or execute the following commands, to download the list of floors and rooms.

> [!NOTE]
> Update buildingName only if you need to get rooms for particular buildings.

```powershell
$buildingName = “”  

$allPlaces = Get-PlaceV3 | Select-Object PlaceId, DisplayName, Type, ParentId  

$building = $allPlaces | Where-Object { $_.DisplayName -eq $buildingName -and $_.Type -eq "Building" }  

$floors = $allPlaces | Where-Object { $_.ParentId -eq $building.PlaceId }  

$spacesAndRooms = $floors | ForEach-Object {   

    $floor = $_;   

    $allPlaces | Where-Object { $_.ParentId -eq $floor.PlaceId }  
}  

$places = @() 

$floors | ForEach-Object { $places += $_ }  

$spacesAndRooms | ForEach-Object { $places += $_ }  

$outputPath = 'C:\places.csv'  

$places | Select-Object PlaceId, DisplayName, Type | Export-Csv -Path $outputPath -NoTypeInformation  
```

5. The output file in your CSV path should contain the following:

|PlaceId  |DisplayName  |Type |
|---------|---------|---------|
|**5d275bba-5d7d-487f-855e-75cd2943204f** |Floor 1 |Floor |
|**0fa1b1eb-6066-45ea-8f7c-09b4e8cc4e74** |Conf Room 1202/3455 (9) |Room |

6. Download the device metadata from a partner solution or from your system, including all the devices.

7. Use a script or manually map your devices to PlaceId.

8. Create a CSV file with your device metadata. You can use the following format for your CSV file.

|Column  |Description  |Notes |Example |
|---------|---------|---------|---------|
|DeviceId (required) |The unique identifier of the device (recommended: Manufacturer_DeviceUniqueId) |Must match the ID of the telemetry sent |Manuf1_3455 |
|**DisplayName** |The display name of the device | You can use a friendly name if applicable |Manuf1_3455 |
|**Description** |The description of the device | | |
|**MacAddress** |The Mac address of the device  |Supplier provided (if available) | |
|**Manufacturer** (required) |The manufacturer of the device |Provided by the IT admin |Manuf1 |
|**IPV4Address** |The IPV4Address of the device | Supplier provided (if available) | |
|**IPV6Address**  |The IPV6Address of the device |Supplier provided if available | |
|**PlaceId** |The PlaceId to which your device is mapped in Places |The IT admin maps DeviceID to the DisplayName field from a list of rooms |76fe540f-01a9-425e-acd5-5d7d1da44fbf |
|**Tags** |A list of custom tags associated with the device to help with search | |[ "IsVirtual_False", "Building_121"] |
|**Sensor.SensorId** (required) |The unique identifier of a sensor within the device | Must come in the standard telemetry payload |PeopleCount Occupancy |
|**Sensor.DisplayName** |The display Name of the sensor |You can use a friendly name if applicable |Paperclip |
|**Sensor.SensorType** (required) |The type of sensor |A validated list (see examples) |Occupancy<br>PeopleCount<br>InferredOccupancy<br>Heartbeat |
|**Sensor.PlaceId** |The unique identifier of the place served by the sensor (you only need to provide this if the sensor is in a different place than the device's location) | |76fe540f-01a9-425e-acd5-5d7d1da44fbf |

### General guidelines about devices and sensors

- It’s recommended that you provide the DeviceId as Manufacturer_DeviceUniqueId. However, in cases where your partners aren't able to send telemetry at a device level (for example, they combine telemetry from multiple devices), a virtual deviceId can be created as Manufacturer_Building_VirtualDeviceId. In this case, VirtualDeviceId can be some natural key of a space. If your customer is providing the VirtualDeviceId, you should include information about the physical devices from which the telemetry is being calculated. Physical-device information can be in tags.

- If Sensor.SensorType is unique for a device, you just need to provide SensorType. In cases where there are multiple data streams for a particular sensor type for a device, a unique SensorId is needed. SensorType and SenorId, in most cases, is PeopleCount, Occupancy, etc., unless SensorType isn't unique for a device. In this case, SensorId is SensorType_SomeUnique identifier.

- PlaceId for a device is used to associate all sensors to a space unless PlaceId is specified.

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

### Option 2: using PowerShell cmdlets

There are Powershell cmdlets you can use to manage devices in Places. For more information, see the [Microsoft Places cmdlets module for PowerShell](https://www.powershellgallery.com/packages/MicrosoftPlaces/0.32.0-alpha).

> [!NOTE]
> To run scripts, you must have the TenantPlacesManagement role assigned.

|Cmdlet name  |Description  |Parameters |
|---------|---------|---------|
|**New-PlaceDevice**  |Creates a new device |DeviceId (required)<br>DisplayName<br>Description<br>MACAddress<br>Manufacturer (required)<br>IPV4Address<br>IPV6Address<br>PlaceId<br>Tags<br>Sensors (required)   |
|**Remove-PlaceDevice** |Deletes a device   |ID (required)  |
|**Set-PlaceDevice**  |Updates a device     |ID (required)<br>DeviceId (required)<br>DisplayName<br>Description<br>MACAddress<br>Manufacturer (required)<br>IPV4Address<br>IPV6Address<br>PlaceId<br>Tags<br>Sensors (required)   |
|**Get-PlaceDevice**  |Gets a device        |Id<br>Filter<br>Top  |

### Option 3: using APIs

To build an application to automate registering and onboarding devices, APIs are available through Microsoft Graph. To do this, follow these steps.

1. Register an Azure Active Directory (AAD) [Should we be using Microsoft Entra ID?] application to get the following permissions.

|Header 1  |Header 2  |
|-------|-------|
|**ScopeName**   |[PlaceDevice.Read.All](/graph/permissions-reference) |
|**DisplayName** |Read organization Places devices |
|**Description** |Allows app to read all place devices in the organization |
|**Type**        |Application-only |
|**Admin consent**<br>(yes or no) |Yes |

|Header 1  |Header 2  |
|-------|-------|
|**ScopeName**   |[PlaceDevice.ReadWrite.All](/graph/permissions-reference) |
|**DisplayName** |Read and write organization Places devices |
|**Description** |Read and write organization Places devices |
|**Type** |Application-only |
|**Admin consent**<br>(yes or no) |Yes |

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

## Telemetry historical data (ingestion) and workflow

Once you have your devices onboarded into Places, you can perform a one-time backfill of historical data to populate Places with historical telemetry. Then you can configure Places to receive continuous telemetry from your devices to stay up to date. The following diagram outlines the backfill file upload flow (top half) as well as the continuous device telemetry flow (bottom half).

[GRAPHIC 2]

### Backfill historical data

Microsoft Places accepts historical data in a specific CSV format and schema. You must export this data from an existing system and then use the following PowerShell cmdlet to upload the data.

|Cmdlet name  |Description  |Parameters |Example |
|---------|---------|---------|---------|
|**Push-Dataset** |Uploads dataset into ADLS |Type<br>Path  |Push-Dataset -Type RoomOccupancy -Path C:\sensordata\ |

> [!NOTE]
> Type can be RoomOccupancy, PeopleCount, or InferredOccupancy. Role should be assigned to TenantPlacesManagement. For more information on PowerShell cmdlets, see [Microsoft Places PowerShell Gallery](https://www.powershellgallery.com/packages/MicrosoftPlaces/0.32.0-alpha).

The following is the CSV file format for People Count.

|Column name  |Column order  |Comment |Example |
|---------|---------|---------|---------|
|**DeviceId** |1  |Device ID  |Manuf1_1202_3455 |
|**SensorId**  |2  |Sensor ID  |PeopleCount |
|**Value**  |3 |An unsigned integer |**InferredOccupancy**: True/False<br>**PeopleCount**: Any unsigned integer (for example, 5) |
|**IngestionTime**  |4 |Timestamp from the telemetry, in UTC standard format |2023-06-27T18:24:20.808Z |

### Real-time telemetry ingestion

The connectors described in Scope need the following permission to request the real-time telemetry ingestion service. You must complete the admin consent or create an AAD application with the permission based on the selected architecture.

|Header  |Header  |
|---------|---------|
|**ScopeName**      |For more information, see the [Microsoft Graph permissions reference](/graph/permissions-reference) |
|**DisplayName**    |Read and write organization place device telemetry |
|**Description**    |Allows the app to read and write telemetry data for all devices in an organization |
|**Type** |Application-only |
|**Admin Consent?**  |Yes |

#### Admin Consent: type A architecture, hardware partner-owned connector (SaaS)  

For customers choosing these integration types, must complete the tenant-wide admin consent to grant the permissions to the partner services to ingest telemetries on their behalf.

1. This is applicable when hardware providers have created multitenant SaaS connectors. See more on Single vs multitenant apps. For more information, see [Tenancy in Microsoft Entra ID](/entra/identity-platform/single-and-multi-tenant-apps).
2. Get the app ID (GUID) from the partner that ingests telemetries on behalf of your service.
3. Create a Service principal with the app ID. There are several options to choose from [Create an enterprise application from a multitenant application in Microsoft Entra ID](/entra/identity/enterprise-apps/create-service-principal-cross-tenant).

   If you're using the Microsoft Graph PowerShell, Graph, or Azure CLI, replace the ID or appId (of the commands mentioned) in the pages to create a Service principal, then grant admin consent in the Service principal on Azure.

   :::image type="content" source="./media/connected-buildings/connected-buildings-saml-toolkit.png" alt-text="Screenshot of the Microsoft Entra SAML Toolkit permissions page.":::

   If you're using an admin consent URL, replace the app ID in the page with the partner app ID, then open it in a browser. It creates a Service principal and asks for granting the admin consent at once. To grant admin consent, click the **Accept** button.

     [SCREENSHOT 2]

#### Admin Consent: type B and C architecture, connector running in a customer on-site environment

Microsoft Places makes available an API that accepts telemetry in standard format and exposed over MS Graph. The API accepts a batch of telemetry messages.

1. For type B architecture, customers rely on an integration provided by their hardware partners hosted on-site in the customer’s environment.
2. For type C architecture, customers can create an loongoing process or an event-based process, using Azure functions, to call Places APIs to send telemetry.

   For a sample application, see [A Github link?] this project to send data to Places.

3. Both type B and C integration architectures require customers to register an Azure AD application and provide admin consent with PlaceDeviceTelemetry.ReadWrite.All. For more information, see the [Microsoft Graph permissions reference](/graph/permissions-reference).

   [SCREENSHOT 3]
