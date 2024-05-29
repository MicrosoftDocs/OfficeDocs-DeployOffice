---
title: "Set-PlaceV3 cmdlet"
ms.author: mactra
author: MachelleTranMSFT
manager: jtremper
ms.reviewer: julia.foran
ms.date: 05/21/2024
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
>
> The Set-UserPhoto was [deprecated](https://techcommunity.microsoft.com/t5/exchange-team-blog/deprecation-of-exchange-online-powershell-userphoto-cmdlets/ba-p/3955744) in April 2024.  We are working on adding a parameter to this cmdlet to set a photo on rooms and workspaces when using Set-PlaceV3.  In the meantime, please follow [these instructions](/microsoft-365/admin/add-users/change-user-profile-photos) set the photo on a room or workspace.
>
## Syntax

### Building

```powershell
Set-PlaceV3
 [-Identity]
 [-City]
 [-CountryOrRegion]
 [-Description]
 [-GeoCoordinates]
 [-IsWheelChairAccessible]
 [-Name]
 [-Phone]
 [-PostalCode]
 [-PostOfficeBox]
 [-ResourceLinks]
 [-State]
 [-Street]
 [-Tags]
```

### Floor

```powershell
Set-PlaceV3
 [-Identity]
 [-Description]
 [-Name]
 [-ParentId]
 [-ParentType]
 [-SortOrder]
 [-Tags]
```

### Room or Workspace

Set-PlaceV3 supports legacy location parameters already exposed in Exchange Set-Place cmdlet. However, once a room is linked to a floor/building using the -ParentId parameter, location information (StreetAddress, City, etc.) should be managed on the Building rather than on the room or workspace.

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
 [-ParentType]
 [-Phone]
 [-PostalCode]
 [-State]
 [-Street]
 [-Tags]
 [-VideoDeviceName]
```

## Description

Places depends on a fully set up hierarchy among your rooms/workspaces, floors, and buildings. Once buildings and floors are created, you can link them using parentId. A room/workspace's parent is a floor. A floor's parent is a building.

You need to be assigned permissions before you can run this cmdlet. You must have either the Exchange MailRecipients role or the Places TenantPlacesManagement role.

> [!CAUTION]
> You might find additional parameters in the PowerShell cmdlet, but those are not currently supported. It is not recommended to use any parameter that is not documented on this page.

## Examples

### Example 1

This example sets up the directory hierarchy for a room, floor, and building.  

In this example, the floor's PlaceId is f12172b6-195d-4e6e-8f4f-eb72e41de99a, and the building's PlaceId is daa2f89b-75c4-4eb7-adcc-ff249233338d.

```powershell
Set-PlaceV3 -Identity 'room@contoso.com' -ParentId f12172b6-195d-4e6e-8f4f-eb72e41de99a -ParentType Floor
Set-PlaceV3 -Identity f12172b6-195d-4e6e-8f4f-eb72e41de99a -ParentId daa2f89b-75c4-4eb7-adcc-ff249233338d -ParentType Building
```

### Example 2

This example updates a building's address.

> [!IMPORTANT]
> Currently, you must set all of the below address parameters when updating or adding an address. A fix will be released soon so that you can set any of the parameters without requiring all of the parameters.  Additionally, PostOfficeBox will soon be deprecated, so that parameter should be set to an empty value.
```powershell
Set-PlaceV3 -Identity f12172b6-195d-4e6e-8f4f-eb72e41de99a -CountryOrRegion US -State WA -City Redmond -Street 'Street 3' -PostalCode 98052 -PostOfficeBox ''
```

### Example 3

This example updates a building's geocoordinates.

```powershell
Set-PlaceV3 -Identity f12172b6-195d-4e6e-8f4f-eb72e41de99a -GeoCoordinates "47.644125;-122.122411"
```

### Example 4

This example updates the resource links for a building with resource links. The entire set is replaced on update. To add or remove a value, be sure to include previous values that should be persisted.

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

For example, for places that aren't based on a mailbox (buildings and floors):

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

Once the ParentId is set for a room or workspace, the Building parameter is read-only for that room/workspace. To change the building name, you should update the Building directly using Set-PlaceV3.

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

We recommend managing the location data on the Building rather than the Room/Workspace. There's a hierarchy between rooms -> floors -> buildings, and rooms inherit the location attributes of their Building.

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

We recommend managing the location data on the Building rather than the Room/Workspace. There's a hierarchy between rooms -> floors -> buildings, and rooms inherit the location attributes of their Building.

|Attribute|Description|
| -------- | -------- |
|Type:|CountryInfo|
|Position:|Named|
|Default value:|None|
|Required:|False|
|Accept pipeline input:|False|
|Accept wildcard characters:|False|

### -Description

The Description parameter specifies a descriptive label for the place. If the value contains spaces, enclose the value in quotation marks ("). The maximum length is 200 characters.

For rooms and workspaces, the command updates the value named -Label in Exchange Set-Place.

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

Once the ParentId is set to a room or workspace, the FloorLabel parameter is read-only for that room/workspace. To change the floor's label, update the Floor directly using Set-PlaceV3.

|Attribute|Description|
| -------- | -------- |
|Type:|String|
|Position:|Named|
|Default value:|None|
|Required:|False|
|Accept pipeline input:|False|
|Accept wildcard characters:|False|

### -GeoCoordinates

The GeoCoordinates parameter specifies the building's location in latitude, longitude, and (optionally) altitude coordinates. A valid value for this parameter uses one of the following formats:

* Latitude and longitude: For example, "47.644125;-122.122411"
* Latitude, longitude, and altitude: For example, "47.644125;-122.122411;161.432"

If period separators don't work for you, use commas instead.  

We recommend managing the location data on the Building rather than the Room/Workspace. There's a hierarchy between rooms -> floors -> buildings, and room's will inherit the location attributes of their Building.

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
* $false: The place isn't wheelchair accessible. This is the default value.

|Attribute|Description|
| -------- | -------- |
|Type:|Boolean|
|Position:|Named|
|Default value:|None|
|Required:|False|
|Accept pipeline input:|False|
|Accept wildcard characters:|False|

### -MTREnabled

> [!NOTE]
> Currently, this parameter is informational only and results in no additional functionality.

The MTREnabled parameter identifies the room as configured with a Microsoft Teams room system. You can add Teams room systems as audio sources in Teams meetings that involve the room. Valid values are:

* $true: The room has a Teams room system. You can add the Teams room system to Microsoft Teams meetings when selecting to join a meeting with room audio.
* $false: The room doesn't have a Teams room system. Users can join Teams meetings using their PC or mobile device audio instead of using room audio. This is the default value.

For more information about Microsoft Teams Rooms, see [Microsoft Teams Rooms](/microsoftteams/rooms/).

|Attribute|Description|
| -------- | -------- |
|Type:|Boolean|
|Position:|Named|
|Default value:|None|
|Required:|False|
|Accept pipeline input:|False|
|Accept wildcard characters:|False|

### -Name

The Name parameter specifies the display name of the place. The maximum length is 200 characters. Set-PlaceV3 can only update the name of places that don't have an associated SMTP address, such as buildings and floors. To update the display name of a place that has an associated SMTP address such as conference rooms and workspaces, use the [Exchange Set-Mailbox cmdlet](/powershell/module/exchange/set-mailbox).

|Attribute|Description|
| -------- | -------- |
|Type:|String|
|Default value:|None|
|Required:|True|
|Accept pipeline input:|False|
|Accept wildcard characters:|False|

### -ParentId

The ParentId parameter specifies the ID of a Place in the parent location hierarchy in Microsoft Places. A room or workspace should have a parent floor. A floor should have a parent building.

Once the ParentID is set to a room or workspace, some parameters that are actually about the floor (for example, FloorLabel) or about the building (for example, address and location information) will be read-only for that room/workspace using Set-Place V3. The same properties can be updated by updating the Floor or Building directly using Set-PlaceV3.

> [!IMPORTANT]
> It is only recommended to use Set-PlaceV3 to *add* a ParentId.  Once a ParentId has been set, do not change the ParentId. The Set-PlaceV3 cmdlet currently allows changing of ParentId, but this will result in directory hierarchy issues.

|Attribute|Description|
| -------- | -------- |
|Type:|String|
|Position:|Named|
|Default value:|None|
|Required:|False|
|Accept pipeline input:|False|
|Accept wildcard characters:|False|

### -ParentType

The ParentType parameter specifies the type of the place that is being set as the parent. Valid values are:

* Building
* Floor

> [!NOTE]
> This property is currently required if you're setting ParentId, but we plan to deprecate it soon because ParentId is sufficient to validate parent type.
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

### -PostOfficeBox

The PostOfficeBox is currently being deprecated. However, it must be provided when adding an address to a Building. Until this parameter is fully deprecated, set this to an empty string.

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

The value must be provided as an array of type Link. For each link you need to pass the properties: Name, Value, and Type. For type the possible values are: Unspecified, BlobId, Url:
`-ResourceLinks @{name="TestLink"; Value="https://contoso.com/"; type="Url"}`. The maximum length is 200 characters.

> [!NOTE]
> The entire set will be replaced on update. To add or remove a value, be sure to include previous values that should be persisted.

|Attribute|Description|
| -------- | -------- |
|Type:|Link[]|
|Position:|Named|
|Default value:|None|
|Required:|False|
|Accept pipeline input:|False|
|Accept wildcard characters:|False|

### -SortOrder

The SortOrder parameter specifies the sort order of the floor. For example, a floor might be named "Lobby" with a sort order of 0 to show this floor first in ordered lists.

For rooms and workspaces, this updates the value named -Floor in Exchange Set-Place.

Once the ParentId is set to a room or workspace, the SortOrder (-Floor) parameter is read-only for that room/workspace using Set-Place V3. The floor's sort order can be updated by updating the Floor directly using Set-PlaceV3.

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

We recommend managing the location data on the Building rather than the Room/Workspace. There's a hierarchy between rooms -> floors -> buildings, and room inherits the location attributes of their Building.

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

> [!NOTE]
> We recommend managing the location data on the Building rather than the Room/Workspace. There's a hierarchy between rooms -> floors -> buildings, and rooms inherit the location attributes of their Building.

|Attribute|Description|
| -------- | -------- |
|Type:|String|
|Position:|Named|
|Default value:|None|
|Required:|False|
|Accept pipeline input:|False|
|Accept wildcard characters:|False|

### -Tags

The Tags parameter specifies additional features of the room (for example, details like the type of view or furniture type). There's no maximum length currently.

You can specify multiple labels separated by commas. If the labels contains spaces, enclose the values in quotation marks: `"Label 1","Label 2",..."Label N"`.

> [!NOTE]
> The entire set will be replaced on update. To add or remove a value, be sure to include previous values that should be persisted.

|Attribute|Description|
| -------- | -------- |
|Type:|String|
|Position:|Named|
|Default value:|None|
|Required:|False|
|Accept pipeline input:|False|
|Accept wildcard characters:|False|
