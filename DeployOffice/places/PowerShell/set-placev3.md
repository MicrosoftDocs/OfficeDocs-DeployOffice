---
title: "Set-PlaceV3 cmdlet"
ms.author: mactra
author: MachelleTranMSFT
manager: jtremper
ms.reviewer: julia.foran
ms.date: 05/15/2024
audience: ITPro
ms.topic: conceptual
ms.service: o365-proplus-itpro
ms.collection: Tier3
ms.localizationpriority: medium
recommendations: true
description: "Places PowerShell cmdlet for Places to set places."
---

# Set-PlaceV3
Use the Set-PlaceV3 cmdlet to update metadata about your rooms, workspaces, floors, or buildings within your Places directory.
> [!NOTE] 
> Updates to conference rooms & workspaces can take up to 24 hours to reflect.  We are working on eliminating this delay.

## Syntax
#### Building
```powershell
Set-PlaceV3
	[-Identity]
	[-City]
	[-CountryOrRegion]
	[-Description]
	[-GeoCoordinates]
	[-IsWheelChairAccessible]
	[-Name]
	[-ParentId]
	[-Phone]
	[-PostalCode]
	[-ResourceLinks]
	[-State]
	[-Street]
	[-Tags]
```
#### Floor
```powershell
Set-PlaceV3
	[-Identity]
	[-Description]
	[-Name]
	[-ParentId]
	[-SortOrder]
	[-Tags]
```
#### Room or Workspace
Set-PlaceV3 supports legacy location parameters already exposed in Exchange Set-Place cmdlet.  However, once a room has been linked to a floor/building using the -ParentId parameter, location information (StreetAddress, City, etc.) should be managed on the Building rather than on the room or workspace.

```powershell
Set-PlaceV3
	[-Identity]
	[-AudioDeviceName]
	[-Building]
	[-Capacity]
	[-City]
	[-CountryOrRegion]
	[-Description]
	[-DisplayDeviceName]
	[-Floor]
	[-FloorLabel]
	[-GeoCoordinates]
	[-IsWheelChairAccessible]
	[-MTREnabled]
	[-Name]
	[-ParentId]
	[-Phone]
	[-PostalCode]
	[-State]
	[-Street]
	[-Tags]
	[-VideoDeviceName]
```
## Description
Places depends on a fully setup hierarchy among your rooms/workspaces, floors, and buildings.  Once buildings and floors are created, you can link them using parentId.  A room/workspace's parent will be a floor.  A floor's parent will be a building.

You need to be assigned permissions before you can run this cmdlet. You must have either the Exchange MailRecipients role or the Places TenantPlacesManagement role.
> [!CAUTION] 
> You might find additional parameters in the PowerShell cmdlet, but those are not currently supported. It is not recommended to use any parameter that is not documented on this page.

## Examples
### Example 1
This example sets up the directory hierarchy for a room, floor, and building.  

_In this example, the floor's PlaceId is f12172b6-195d-4e6e-8f4f-eb72e41de99a, and the building's PlaceId is daa2f89b-75c4-4eb7-adcc-ff249233338d._
```powershell
Set-PlaceV3 -Identity 'room@contoso.com' -ParentId f12172b6-195d-4e6e-8f4f-eb72e41de99a
Set-PlaceV3 -Identity f12172b6-195d-4e6e-8f4f-eb72e41de99a -ParentId daa2f89b-75c4-4eb7-adcc-ff249233338d
```

### Example 2
This example updates a building's address and geocoordinates.
```powershell
Set-PlaceV3 -Identity f12172b6-195d-4e6e-8f4f-eb72e41de99a -CountryOrRegion US -State WA -City Redmond -Street 'Street 3' -GeoCoordinates "47.644125;-122.122411"
```

### Example 3
This example updates the resource links for a building with resource links.  
The entire set is replaced on update. To add or remove a value, be sure to include previous values that should be persisted.
```powershell
Set-PlaceV3 -Identity f12172b6-195d-4e6e-8f4f-eb72e41de99a -ResourceLinks @{name="TestLink"; Value="https://contoso.com/"; type="Url"}
```


## Parameters
### -Identity
The identity parameter specifies the place that you want to update. You can use any value that uniquely identifies a place.

For example, for places based on a mailbox (conference rooms and workspaces):

* Name
* Alias
* Distinguished name (DN)
* Canonical DN
* Email address
* GUID

For example, for places that are not based on a mailbox (buildings and floors):

* Name
* GUID

|Attribute|Description| 
| -------- | -------- |
|Type:|RecipientIdParameter|
|Position:|0|
|Default value:|None|
|Required:|False|
|Accept pipeline input:|True|
|Accept wildcard characters:|False|


### -AudioDeviceName
The AudioDeviceName parameter specifies the name of the audio device in the room. If the value contains spaces, enclose the value in quotation marks (").

The default value is blank ($null). To indicate that this room has no audio device, use the value $null for this parameter.

|Attribute|Description| 
| -------- | -------- |
|Type:|String|
|Position:|Named|
|Default value:|None|
|Required:|False|
|Accept pipeline input:|False|
|Accept wildcard characters:|False|

### -Building
The Building parameter specifies the building name or building number that the room is in. If the value contains spaces, enclose the value in quotation marks ("). 

Once the ParentId has been set on a room or workspace, the Building parameter will be read-only for that room/workspace.  To change the building name, you should update the Building directly using Set-PlaceV3.

|Attribute|Description| 
| -------- | -------- |
|Type:|String|
|Position:|Named|
|Default value:|None|
|Required:|False|
|Accept pipeline input:|False|
|Accept wildcard characters:|False|

### -Capacity
The Capacity parameter specifies the capacity of the room. A valid value is an integer.

|Attribute|Description| 
| -------- | -------- |
|Type:|System.Int32|
|Position:|Named|
|Default value:|None|
|Required:|False|
|Accept pipeline input:|False|
|Accept wildcard characters:|False|

### -City
The City parameter specifies the building's city. If the value contains spaces, enclose the value in quotation marks ("). The maximum length is 200 characters.

It is recommended that location data now be managed on the Building rather than the Room/Workspace.  There is a hierarchy between rooms -> floors -> buildings, and room's will inherit the location attributes of their Building.

|Attribute|Description| 
| -------- | -------- |
|Type:|String|
|Position:|Named|
|Default value:|None|
|Required:|False|
|Accept pipeline input:|False|
|Accept wildcard characters:|False|

### -CountryOrRegion
The CountryOrRegion parameter specifies the building's country or region. A valid value is a valid ISO 3166-1 two-letter country code (for example, AU for Australia) or the corresponding friendly name for the country (which might be different from the official ISO 3166 Maintenance Agency short name).

A reference for two-letter country codes is available at [Country Codes List](https://www.nationsonline.org/oneworld/country_code_list.htm).

It is recommended that location data now be managed on the Building rather than the Room/Workspace.  There is a hierarchy between rooms -> floors -> buildings, and room's will inherit the location attributes of their Building.

|Attribute|Description| 
| -------- | -------- |
|Type:|CountryInfo|
|Position:|Named|
|Default value:|None|
|Required:|False|
|Accept pipeline input:|False|
|Accept wildcard characters:|False|

### -Description
The Description parameter specifies a descriptive label for the place.  If the value contains spaces, enclose the value in quotation marks (").  The maximum length is 200 characters.

For rooms and workspaces, this will update the value named -Label in Exchange Set-Place.

|Attribute|Description| 
| -------- | -------- |
|Type:|String|
|Position:|Named|
|Default value:|None|
|Required:|False|
|Accept pipeline input:|True|
|Accept wildcard characters:|False|

### -DisplayDeviceName
The DisplayDeviceName parameter specifies the name of the display device in the room. If the value contains spaces, enclose the value in quotation marks (").

The default value is blank ($null). To indicate that this room has no display device, use the value $null for this parameter.

|Attribute|Description| 
| -------- | -------- |
|Type:|String|
|Position:|Named|
|Default value:|None|
|Required:|False|
|Accept pipeline input:|False|
|Accept wildcard characters:|False|

### -FloorLabel
The FloorLabel parameter specifies a descriptive label for the floor. If the value contains spaces, enclose the value in quotation marks (").

Once the ParentId has been set on a room or workspace, the FloorLabel parameter will be read-only for that room/workspace.  To change the floor's label, update the Floor directly using Set-PlaceV3.

|Attribute|Description| 
| -------- | -------- |
|Type:|String|
|Position:|Named|
|Default value:|None|
|Required:|False|
|Accept pipeline input:|False|
|Accept wildcard characters:|False|

### -GeoCoordinates
The GeoCoordinates parameter specifies the building's location in latitude, longitude and (optionally) altitude coordinates. A valid value for this parameter uses one of the following formats:
* Latitude and longitude: For example, "47.644125;-122.122411"
* Latitude, longitude, and altitude: For example, "47.644125;-122.122411;161.432"

If period separators don't work for you, use commas instead.  

It is recommended that location data now be managed on the Building rather than the Room/Workspace.  There is a hierarchy between rooms -> floors -> buildings, and room's will inherit the location attributes of their Building.

|Attribute|Description| 
| -------- | -------- |
|Type:|GeoCoordinates|
|Position:|Named|
|Default value:|None|
|Required:|False|
|Accept pipeline input:|False|
|Accept wildcard characters:|False|

### -IsWheelChairAccessible
The IsWheelChairAccessible parameter specifies whether the place is wheelchair accessible. Valid values are:

* $true: The place is wheelchair accessible.
* $false: The place is not wheelchair accessible. This is the default value.

|Attribute|Description| 
| -------- | -------- |
|Type:|Boolean|
|Position:|Named|
|Default value:|None|
|Required:|False|
|Accept pipeline input:|False|
|Accept wildcard characters:|False|

### -MTREnabled
Note: Currently, this parameter is informational only and results in no additional functionality.

The MTREnabled parameter identifies the room as configured with a Microsoft Teams room system. You can add Teams room systems as audio sources in Teams meetings that involve the room. Valid values are:
* $true: The room is has a Teams room system. You can add the Teams room system to Microsoft Teams meetings when selecting to join a meeting with room audio.
* $false: The room is does not have a Teams room system. Users will join Teams meetings using their PC or mobile device audio instead of using room audio. This is the default value.

For more information about Microsoft Teams Rooms, see [Microsoft Teams Rooms](https://learn.microsoft.com/en-us/microsoftteams/rooms/).

|Attribute|Description| 
| -------- | -------- |
|Type:|Boolean|
|Position:|Named|
|Default value:|None|
|Required:|False|
|Accept pipeline input:|False|
|Accept wildcard characters:|False|

### -Name
The Name parameter specifies the display name of the place.  The maximum length is 200 characters.  Set-PlaceV3 can only update the name of places that do not have an associated SMTP address, such as buildings and floors.  To update the display name of a place that has an associated SMTP address such as conference rooms and workspaces, please use the [Exchange Set-Mailbox cmdlet](https://learn.microsoft.com/en-us/powershell/module/exchange/set-mailbox?view=exchange-ps).

|Attribute|Description| 
| -------- | -------- |
|Type:|String|
|Default value:|None|
|Required:|True|
|Accept pipeline input:|False|
|Accept wildcard characters:|False|

### -ParentId
The ParentId parameter specifies the ID of a Place in the parent location hierarchy in Microsoft Places.  A room or workspace should have a parent floor. A floor should have a parent building.

Once the ParentId has been set on a room or workspace, some parameters that are actually about the floor (e.g., FloorLabel) or about the building (e.g., address and location information) will be read-only for that room/workspace using Set-Place V3.  The same properties can be updated by updating the Floor or Building directly using Set-PlaceV3.
> [!IMPORTANT] 
> It is only recommended to use Set-PlaceV3 to _add_ a ParentId.  Once a ParentId has been set, do not change the ParentId.  The Set-PlaceV3 cmdlet currently allows changing of ParentId, but this will result in directory hierachy issues.

|Attribute|Description| 
| -------- | -------- |
|Type:|String|
|Position:|Named|
|Default value:|None|
|Required:|False|
|Accept pipeline input:|False|
|Accept wildcard characters:|False|

### -PostalCode
The PostalCode parameter specifies the room's postal code.

|Attribute|Description| 
| -------- | -------- |
|Type:|String|
|Position:|Named|
|Default value:|None|
|Required:|False|
|Accept pipeline input:|False|
|Accept wildcard characters:|False|

### -ResourceLinks
The ResourceLinks parameter specifies external links that should be associated to this building, such as a dining menu, a link to services or a building website.

The value must be provided as an array of type Link. For each link you need to pass the properties: Name, Value and Type. For type the possible values are: Unspecified, BlobId, Url:
`-ResourceLinks @{name="TestLink"; Value="https://contoso.com/"; type="Url"}`.   The maximum length is 200 characters.

_Note: The entire set will be replaced on update. To add or remove a value, be sure to include previous values that should be persisted._

|Attribute|Description| 
| -------- | -------- |
|Type:|Link[]|
|Position:|Named|
|Default value:|None|
|Required:|False|
|Accept pipeline input:|False|
|Accept wildcard characters:|False|

### -SortOrder
The SortOrder parameter specifies the sort order of the floor.  For example, a floor might be named "Lobby" with a sort order of 0 to show this floor first in ordered lists.

For rooms and workspaces, this will update the value named -Floor in Exchange Set-Place.

Once the ParentId has been set on a room or workspace, the SortOrder (-Floor) parameter will be read-only for that room/workspace using Set-Place V3.  The floor's sort order can be updated by updating the Floor directly using Set-PlaceV3.

|Attribute|Description| 
| -------- | -------- |
|Type:|System.Int32|
|Position:|Named|
|Default value:|None|
|Required:|False|
|Accept pipeline input:|False|
|Accept wildcard characters:|False|


### -State
The State parameter specifies the room's state or province. The maximum length is 200 characters.

It is recommended that location data now be managed on the Building rather than the Room/Workspace.  There is a hierarchy between rooms -> floors -> buildings, and room's will inherit the location attributes of their Building.

|Attribute|Description| 
| -------- | -------- |
|Type:|String|
|Position:|Named|
|Default value:|None|
|Required:|False|
|Accept pipeline input:|False|
|Accept wildcard characters:|False|


### -Street
The Street parameter specifies the room's physical address. The maximum length is 200 characters.

Note: It is recommended that location data now be managed on the Building rather than the Room/Workspace.  There is a hierarchy between rooms -> floors -> buildings, and room's will inherit the location attributes of their Building.

|Attribute|Description| 
| -------- | -------- |
|Type:|String|
|Position:|Named|
|Default value:|None|
|Required:|False|
|Accept pipeline input:|False|
|Accept wildcard characters:|False|

### -Tags
The Tags parameter specifies additional features of the room (for example, details like the type of view or furniture type).  There is no maximum length currently.

You can specify multiple labels separated by commas. If the labels contains spaces, enclose the values in quotation marks: `"Label 1","Label 2",..."Label N"`.

_Note: The entire set will be replaced on update. To add or remove a value, be sure to include previous values that should be persisted._

|Attribute|Description| 
| -------- | -------- |
|Type:|String|
|Position:|Named|
|Default value:|None|
|Required:|False|
|Accept pipeline input:|False|
|Accept wildcard characters:|False|
