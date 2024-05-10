---
title: "Deployment guide for Places"
ms.author: mactra
author: MachelleTranMSFT
manager: jtremper
audience: ITPro
ms.topic: conceptual
ms.service: o365-proplus-itpro
ms.collection: Tier3
ms.localizationpriority: medium
recommendations: true
description: "Provides Office admins with an overview of how to deploy Microsoft Places to users in their organization."
ms.date: 05/10/2024
---
# Get started with Microsoft Places
Once your IT admin has onboarded buildings to your tenant Places Explore page will light up. If you want to add services and amenities that are available in each building then follow these instructions: LINK TO NEW LMC DOC

## Adding service links
Service links are useful for directing employees to a service available in a building. For example, ordering food or submitting a facility help request.  Follow these seps to add service links:

> [!NOTE]
> Verify you’ve created buildings before getting started.

1. Create the following template with the Services tab in this Link

|BuildingName  |ServiceType  |ServiceName |ServiceValue |Append 
|---------|---------|---------|---------|---------|
|31   |URL    |Dining   |[Replace with your URL or String ID]      |FALSE|
|31   |URL    |Dining   |[Replace with your URL or String ID]      |TRUE|
|31   |URL    |TechLink   |[Replace with your URL or String ID]    |TRUE|
|31   |MetaosApp |AppSpace   |[Replace with your URL or String ID] |TRUE|
|32   |URL       |Dining   |[Replace with your URL or String ID]   |FALSE|
|32   |URL    |Connector   |[Replace with your URL or String ID]   |TRUE|
|32   |URL    |TechLink   |[Replace with your URL or String ID]    |TRUE|
|32   |MetaosApp  |Shuttle   |[Replace with your URL or String ID] |TRUE|

2. Run this Create-Buildings-Services.ps1 to create floors. You will be asked to confirm the creation of floors and places of interest that have not yet been created.


**INSERT CODE BLOCK HERE**


### Example of how to run a script

```Powershell
.\Create-Buildings-Services.ps1 -BuildingsServicesCsv .\Building-Services-EvAndPl.csv -Debug
```

## Adding amenities
Amenities will appear in the building card. There are currently 4 amenities you can add per building- kitchenette, wifi, copy room, accessibility. Follow these steps to add amenities:

> [!NOTE]
> Verify you’ve created buildings before getting started.

1. Create the following template with the amenities-feature tab in this Link.

2. Run this Create-Buildings-Amenities-Features.ps1 to create floors and point of interest. You will be asked to confirm the creation of floors and places of interest that have not yet been created.

### Example of how to run script

```Powershell
.\Create-Buildings-Amenities-Features.ps1 -BuildingsAmenitiesFeaturesCsv Building-Amenities-Features-EvAndPl.csv -Debug
```

## Adding apps as services
3rd party apps are also available as a Teams app. Follow these steps to add apps:

1. Create the following template with the Services tab in this Link.<br>[Note text] Verify you’ve created buildings before getting started. The Apps must either: (1) be Published to Store catalog of Teams Apps or (2) Metafile must be sideloaded by tenant admin to be used as Building services, example in lines 6, 11 of Services template file.

2. Run this Create-Buildings-Services.ps1 to create floors. You will be asked to confirm the creation of floors and places of interest that have not yet been created.

### Example of how to run script

```Powershell
.\Create-Buildings-Services.ps1 -BuildingsServicesCsv .\Building-Services-EvAndPl.csv -Debug
```