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

You can use existing sensor data to enhance Places Analytics reports by combining the actual usage with the intended usage of a customer’s conference rooms and buildings. Microsoft Places supports binary occupancy (motion), people count, badge, and Wi-Fi data types.

## Prerequisites
- Opt in to the Places Public Preview. Connected Workplace is an advanced feature.
- Follow the steps in our Deployment guide for Places to enable Places and Places Analytics.

## Add sensor data

This section provides details on how to bring data from existing IoT sensors into Microsoft Places to enable analytical experiences. Adding sensor data is done in the following way:

- Generate building occupancy using badge data.
- Connect your Wi-Fi systems.
- Third-party systems.

### Connect badge-access systems

Upload data from your badge-entry system to generate occupancy information for a building.

#### Badge-data format

Use the following schema when uploading badge information.

|Column  |Type  |Description |
|---------|---------|---------|
|BadgeNumber  |String   |Optional. The user’s badge identifier. |
|UserEmail    |String   |The badged username (an email address). |
|DeviceId     |String   |Optional. The device ID indicates which device generated the signal. |
|TimestampUtc |Timestamp|The timestamp of the badge signal, which indicates when the event occurred. |
|LocationId   |String   |Optional. If LocationName is provided. The location ID where the badge is recorded. |
|LocationName  |String   |Optional if LocationId is provided. The location name where the badge signal is recorded. |
|LocationType |Enum     |Optional. The location type of the badge signal. BUILDING is currently supported. |
|Event        |Enum     |The action of the badge, which depends on the sensor type. The value can be EntryGranted, EntryDenied, or ExitGranted, etc. |

#### Upload the badge dataset

1. Open **PowerShell 7** (not as an administrator).
2. Install Microsoft Places by running the following **Windows PowerShell** cmdlet. See the [Microsoft Places PowerShell Gallery](https://www.powershellgallery.com/packages/MicrosoftPlaces/0.32.0-alpha) for more information on Places installation.

```powershell
Install-Module –Name MicrosoftPlaces –AllowPrerelease -Force
```

3. Import the Places module by running the following **Windows PowerShell** cmdlet.

```powershell
Import-Module -Name MicrosoftPlaces
```

4. Connect to the Places module by running the following **Places PowerShell** cmdlet.

```powershell
Connect-MicrosoftPlaces
```

5. Upload the badge dataset from the location on your device (using the folder and path) by running the following **Places PowerShell** cmdlet.

```powershell
Push-Dataset -Type BadgeSwipe -Path <folder path>
```

### Connect the Wi-Fi systems

You upload data from your Wi-Fi system to generate occupancy information for a building.

#### Wi-Fi data format

Use the following schema when uploading Wi-Fi information.

|Column  |Type  |Description |
|---------|---------|---------|
|**MacAddress**  |String   |The user’s Mac address (not used). |
|**UserEmail**    |String   |The user ID (an email address, or Mac address if an email address isn't available) connected to Wi-Fi. |
|**APMacAddress**     |String   |The access point indicates which device collected the signal. |
|**SessionStartTimeUtc**  |Timestamp|The timestamp when a device is connected to Wi-Fi.  |
|**SessionEndTimeUtc**   |Timestamp   |The timestamp when a device is disconnected to Wi-Fi. |
|**SSID**  |String   |The service set ID that identifies the network name. |
|**APLocation**  |String     |The location name of the access point. It can be an external ID of a place or a string with a predefined pattern. For example, Studio B/Foor 2 (pattern: BuildingName/Floor). |

#### Upload the Wi-Fi dataset

1. Open **PowerShell 7** (not as an administrator).
2. Install Microsoft Places by running the following **Windows PowerShell** cmdlet. See the [Microsoft Places PowerShell Gallery](https://www.powershellgallery.com/packages/MicrosoftPlaces/0.32.0-alpha) for more information on Places cmdlets.

```powershell
Install-Module –Name MicrosoftPlaces –AllowPrerelease -Force
```

3. Import the Places module by running the following **Windows PowerShell** cmdlet.

```powershell
Import-Module -Name MicrosoftPlaces
```

4. Connect to the Places module by running the following **Places PowerShell** cmdlet.

```powershell
Connect-MicrosoftPlaces
```

5. Upload the Wi-Fi dataset from the location (using the folder and path) where it's stored on your device by running the following **Places PowerShell** cmdlet.

```powershell
Push-Dataset -Type WifiSignal -Path <folder path>
```
## Connect other occupancy sensors or people-count sensors

Connecting occupancy and people-count sensors is done in four steps.

- Device onboarding.
- Backfilling with historical data.
- Real-time telemetry ingestion.
- Verify that data is available in Places.

## Device onboarding

The first step involves uploading a CSV file with the device metadata and how devices are mapped to a PlaceId in Microsoft Places. This step helps to contextualize the telemetry when it reaches Places.

The following diagram shows how you can onboard devices and sensors onto Places.

:::image type="content" source="./media/connected-buildings/connected-buildings-graphic-device-metadata2.png" alt-text="Diagram showing how you can onboard devices and sensors into Places.":::

There are three ways you can upload device information to Places.

- Option 1 (preferred): create scripts on top of **Places PowerShell** cmdlets. The scripts help to manage (onboard, remove, update) devices in bulk using a CSV file as an input and iterating using **Places PowerShell** cmdlets.
- Option 2: if you want to individually manage devices, you can use the **Places PowerShell** cmdlets directly.
- Option 3: using APIs. If you want to modify the process or automate and integrate with existing systems, you can use the APIs in Microsoft Graph.

### Prerequisites: prepare device metadata  

1. Download place information from Microsoft Places. First, install **PowerShell 7** by running the following PowerShell cmdlet. See [Installing PowerShell on Windows](/powershell/scripting/install/installing-powershell-on-windows) to learn more about PowerShell on Windows.

   
```powershell
Install-Module -Name ExchangeOnlineManagement 
Import-Module -Name ExchangeOnlineManagement 
Connect-ExchangeOnline
```

2. Open PowerShell as an administrator and run the following **ExchangeOnline PowerShell** command to check if your account has the required TenantPlacesManagement role, and to make sure your username is listed.

```powershell
Get-ManagementRoleAssignment -Role TenantPlacesManagement -GetEffectiveUsers 
```

3. You should see the following name and assigned role if you have the right permissions.

   - Name: PlacesAdmin
   - Assigned Role: TenantPlacesManagement

4. To get the PlaceId of buildings, open a new PowerShell window and run the following **Windows PowerShell** cmdlet:

```powershell
Install-Module –Name MicrosoftPlaces –AllowPrerelease -Force 
Connect-MicrosoftPlaces 
```

5. Execute the following commands to download the list of floors and rooms.

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

6. The output file in your CSV file path should contain the following:

|PlaceId  |DisplayName  |Type |
|---------|---------|---------|
|**5d275bba-5d7d-487f-855e-75cd2943204f** |Floor 1 |Floor |
|**0fa1b1eb-6066-45ea-8f7c-09b4e8cc4e74** |Conf Room 1202/3455 (9) |Room |

7. Download the device metadata from a partner solution or from your system, including all the devices.

8. Use a script or manually map your devices to PlaceId.

9. Create a CSV file with your device metadata. You can use the following format for your CSV file.

|Column  |Description  |Notes |Example |
|---------|---------|---------|---------|
|DeviceId (required) |The unique identifier of the device (recommended: Manufacturer_DeviceUniqueId). |Must match the ID of the telemetry sent. |Manuf1_3455 |
|**DisplayName** |The display name of the device. | You can use a friendly name if applicable. |Manuf1_3455 |
|**Description** |The description of the device. | | |
|**MacAddress** |The Mac address of the device.  |Supplier provided (if available). | |
|**Manufacturer** (required) |The manufacturer of the device. |Provided by the IT admin. |Manuf1 |
|**IPV4Address** |The IPV4Address of the device. | Supplier provided (if available). | |
|**IPV6Address**  |The IPV6Address of the device. |Supplier provided if available. | |
|**PlaceId** |The PlaceId to which your device is mapped in Places. |The IT admin maps DeviceID to the DisplayName field from a list of rooms. |76fe540f-01a9-425e-acd5-5d7d1da44fbf |
|**Tags** |A list of custom tags associated with the device to help with search. | |[ "IsVirtual_False", "Building_121"] |
|**Sensor.SensorId** (required) |The unique identifier of a sensor within the device. | Must come in the standard telemetry payload. |PeopleCount Occupancy |
|**Sensor.DisplayName** |The display Name of the sensor. |You can use a friendly name (if applicable). |Paperclip |
|**Sensor.SensorType** (required) |The type of sensor. |A validated list (see examples). |Occupancy<br>PeopleCount<br>InferredOccupancy<br>Heartbeat |
|**Sensor.PlaceId** |The unique identifier of the place served by the sensor (you only need to provide this if the sensor is in a different place than the device's location). | |76fe540f-01a9-425e-acd5-5d7d1da44fbf |

### General guidelines about devices and sensors

- It’s recommended that you provide the DeviceId as Manufacturer_DeviceUniqueId. However, in cases where your partners aren't able to send telemetry at a device level (for example, they combine telemetry from multiple devices), a virtual DeviceId can be created as Manufacturer_Building_VirtualDeviceId. In this case, VirtualDeviceId can be some natural key of a space. If your customer is providing the VirtualDeviceId, you should include information about the physical devices from which the telemetry is being calculated. Physical-device information can be in tags.

- If Sensor.SensorType is unique for a device, you just need to provide SensorType. In cases where there are multiple data streams for a particular sensor type for a device, a unique SensorId is needed. SensorType and SenorId, in most cases, are PeopleCount, Occupancy, etc., unless SensorType isn't unique for a device. In this case, SensorId is SensorType_SomeUnique identifier.

- PlaceId for a device is used to associate all sensors to a space unless PlaceId is specified.

### Option 1: using scripts

First, install the PowerShell cmdlets. See the [Microsoft Places cmdlets module for PowerShell](https://www.powershellgallery.com/packages/MicrosoftPlaces/0.32.0-alpha) to learn more about Places cmdlets.

Create a PowerShell script that iterates using the PowerShell cmdlets using the CSV file as an input to upload, edit, and delete devices.

> [!NOTE]
> To run scripts, you must have the TenantPlacesManagement role assigned.

If you want to manage devices individually using the PowerShell cmdlets, you can reference Option 2.

|Script name  |Description  |
|---------|---------|
|**OnboardPlaceDevice.ps1 -FilePath $FilePath** |Onboards devices in the CSV file into Places. |
|**DeletePlaceDevice.ps1 -FilePath $FilePath**  |Deletes devices in the CSV file from Places. |
|**UpdatePlaceDevice.ps1 -FilePath $FilePath** |Updates devices in the CSV file from Places. |

> [!NOTE]
> **$FilePath** should be full path name.

### Option 2: using PowerShell cmdlets

There are PowerShell cmdlets you can use to manage devices in Places. See the [Microsoft Places cmdlets module for PowerShell](https://www.powershellgallery.com/packages/MicrosoftPlaces/0.32.0-alpha) to learn more about Places cmdlets.

> [!NOTE]
> To run cmdlets, you must have the TenantPlacesManagement role assigned.

|Cmdlet name  |Description  |Parameters |
|---------|---------|---------|
|**New-PlaceDevice**  |Creates a new device |DeviceId (required)<br>DisplayName<br>Description<br>MACAddress<br>Manufacturer (required)<br>IPV4Address<br>IPV6Address<br>PlaceId<br>Tags<br>Sensors (required)   |
|**Remove-PlaceDevice** |Deletes a device   |ID (required)  |
|**Set-PlaceDevice**  |Updates a device     |ID (required)<br>DeviceId (required)<br>DisplayName<br>Description<br>MACAddress<br>Manufacturer (required)<br>IPV4Address<br>IPV6Address<br>PlaceId<br>Tags<br>Sensors (required)   |
|**Get-PlaceDevice**  |Gets a device        |Id<br>Filter<br>Top  |

### Option 3: using APIs

To build an application to automate registering and onboarding devices, APIs are available through Microsoft Graph. To use APIs, follow these steps.

1. Create an app registration in Microsoft Entra.

   See the [Microsoft Graph Permissions Reference](/graph/permissions-reference) to learn more about the PlaceDeviceRead.All and PlaceDevice.ReadWrite.All permissions.

2. Build and deploy an application to sync device information across Places and your partners.

See the following Microsoft Graph APIs to learn more about sensor devices:

- [List sensorDevices](/graph/api/workplace-list-sensordevices)
- [Create workplaceSensorDevice](/graph/api/workplace-post-sensordevices)
- [Get workplaceSensorDevice](/graph/api/workplacesensordevice-get)
- [Update workplaceSensorDevice](/graph/api/workplacesensordevice-update)
- [Delete workplaceSensorDevice](/graph/api/workplacesensordevice-delete)

## Telemetry historical data (ingestion) and workflow

Once you have your devices onboarded into Places, you can perform a one-time backfill of historical data to populate Places with historical telemetry. Then you can configure Places to receive continuous telemetry from your devices to stay up to date. The following diagram outlines the backfill file upload flow (top half) and the continuous device telemetry flow (bottom half).

:::image type="content" source="./media/connected-buildings/connected-buildings-graphic-device-telemetry2.png" alt-text="A diagram that outlines the backfill file upload and device telemetry flow.":::

### Backfill historical data

Microsoft Places accepts historical data in a specific CSV file format and schema. You must export this data from an existing system and then use the following PowerShell cmdlet to upload the data.

|Cmdlet name  |Description  |Parameters |Example |
|---------|---------|---------|---------|
|**Push-Dataset** |Uploads dataset into ADLS |Type<br>Path  |Push-Dataset -Type RoomOccupancy -Path C:\sensordata\ |

> [!NOTE]
> Type can be RoomOccupancy, PeopleCount, or InferredOccupancy. Role should be assigned to TenantPlacesManagement. See the [Microsoft Places PowerShell Gallery](https://www.powershellgallery.com/packages/MicrosoftPlaces/0.32.0-alpha) to learn more about PowerShell cmdlets.

The following is the CSV file format for PeopleCount.

|Column name  |Column order  |Comment |Example |
|---------|---------|---------|---------|
|**DeviceId** |1  |Device ID.  |Manuf1_1202_3455 |
|**SensorId**  |2  |Sensor ID.  |PeopleCount |
|**Value**  |3 |An unsigned integer. |**InferredOccupancy**: True/False<br>**PeopleCount**: Any unsigned integer (for example, 5) |
|**IngestionTime**  |4 |Timestamp from the telemetry, in UTC standard format. |2023-06-27T18:24:20.808Z |

### Real-time telemetry ingestion

The connectors described in Scope need the following permission to request the real-time telemetry ingestion service.

- PlaceDeviceTelemetry.ReadWrite.All

You must complete the admin consent or create a Microsoft Entra application with the permission based on the selected architecture. See the [Microsoft Graph Permissions Reference](/graph/permissions-reference) to learn more about PlaceDeviceTelemetry.ReadWrite.All permission.

The following diagram outlines the architecture for telemetry ingestion.

:::image type="content" source="./media/connected-buildings/connected-buildings-architectures2.png" alt-text="A diagram that outlines the architecture references for telemetry ingestion.":::

#### Admin Consent: type A architecture, hardware partner-owned connector (SaaS)  

For customers choosing these integration types, you must complete the tenant-wide admin consent to grant the permissions to the partner services to ingest telemetries on their behalf.

1. This is applicable when hardware providers have created multitenant SaaS connectors (single versus multitenant apps). See [Tenancy in Microsoft Entra ID](/entra/identity-platform/single-and-multi-tenant-apps) to learn more about multitenant connectors.
2. Get the app ID (GUID) from the partner that ingests telemetries on behalf of your service.
3. Create a Service principal with the app ID. There are several options to choose from to [Create an enterprise application from a multitenant application in Microsoft Entra ID](/entra/identity/enterprise-apps/create-service-principal-cross-tenant).

   If you're using the **Microsoft Graph PowerShell**, Graph, or Azure CLI, replace the ID or app ID (of the commands mentioned) in the pages to create a Service principal, then grant admin consent in the Service principal on Azure.

   :::image type="content" source="./media/connected-buildings/connected-buildings-places-integration-permissions3.png" alt-text="Screenshot of the Microsoft Places Integration permissions page.":::

   If you're using an admin consent URL, replace the app ID in the page with the partner app ID, then open it in a browser. It creates a Service principal and asks for granting the admin consent at once. To grant admin consent, click the **Accept** button.

    :::image type="content" source="./media/connected-buildings/connected-buildings-permissions-requested2.png" alt-text="Screenshot of the Permissions requested dialog box.":::

#### Admin Consent: type B and C architecture, connector running in a customer on-site environment

Microsoft Places makes available an API that accepts telemetry in standard format and exposed over Microsoft Graph. The API accepts a batch of telemetry messages.

- For type B architecture, customers rely on an integration provided by their hardware partners hosted on-site in the customer’s environment.
- For type C architecture, customers can create a long-running process or an event-based process, using Azure functions, to call Places APIs to send telemetry.
- Both type B and C integration architectures require customers to create an app registration in Microsoft Entra, as shown in the following illustration, and provide admin consent with PlaceDeviceTelemetry.ReadWrite.All. See the [Microsoft Graph Permissions Reference](/graph/permissions-reference) to learn more about permissions exposed by Microsoft Graph.

   :::image type="content" source="./media/connected-buildings/connected-buildings-register-an-application.png" alt-text="Screenshot of the Register an application dialog box with supported account types.":::

## Verify data is available in Places

Once devices are onboarded and the API is ingesting live sensor data, the Places Analytics reports start to populate. To unlock insights that help optimize your workspace, verify data is flowing into your analytics dashboard within 72 hours.
