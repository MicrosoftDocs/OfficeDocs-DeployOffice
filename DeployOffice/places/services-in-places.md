---
title: "Services in Places"
ms.author: mactra
author: MachelleTranMSFT
manager: jtremper
ms.date: 06/06/2024
audience: ITPro
ms.topic: conceptual
ms.service: o365-proplus-itpro
ms.collection: Tier3
ms.localizationpriority: medium
recommendations: true
description: "Learn about services admins can add that appear in the Explore tab within Microsoft Places."
---

# Services in Places

In Microsoft Places apps admins can add services that appear in the Explore tab within the Places apps (for more information about the supported Places apps, see the [Deployment guide for Microsoft Places (preview)](/deployoffice/places/deployment-guide-for-places?branch=pr-en-us-3476)). These services can be added per building to provide employees with all the services that each building offers (for more information, see [Quick setup of buildings and floors](get-started/quick-setup-buildings-floors.md)).

For example, a building might have a cafeteria where employees can order food online. Admins have the ability of showing employees a link to another website that may show the cafeteria menu or an app that employees should use to order food online. The following page is an example of how services (both links and apps) might appear.

:::image type="content" source="./media/services-in-places/services-in-places-with-links.png" alt-text="screenshot showing a page of available services, including parking, tech support, dining, and facility request.":::

## Prerequisites

- Services in Places is an opt-in feature. For more information, see [Opt in to the Microsoft Places Public Preview](opt-in-places-preview.md).
- Create a building.

## Adding services to a building

First, you need to find the ID for the building you want to add a service to (for more information on getting the ID, see [Get-PlaceV3](/deployoffice/places/powershell/get-placev3?branch=pr-en-us-3476)). Next, you associate the service with your building using the ResourceLinks parameter (for more information about the ResourceLinks parameter, see
[Set-PlaceV3](powershell/set-placev3.md)). 

This example associates a services app with a building (coming soon).

```powershell
Set-PlaceV3 -Identity <id> -ResourceLinks @{name="Dining App"; Value="0c7c95a9-b1e2-4725-9a25-793e4205739d"; type="MetaosApp”}
```

This example adds a link.

```powershell
Set-PlaceV3 -Identity <id> -ResourceLinks @{name="Tech Support"; Value="www.contoso.sharepoint.com/TechSupport"; type="URL”} 
```

Once these steps are complete, open the Places Explore page within your preferred Places app. The service you added appears with its associated building.
