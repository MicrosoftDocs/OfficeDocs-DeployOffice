---
title: "Services in Places"
ms.author: mactra
author: MachelleTranMSFT
manager: jtremper
ms.date: 06/12/2024
audience: ITPro
ms.topic: conceptual
ms.service: o365-proplus-itpro
ms.collection: Tier3
ms.localizationpriority: medium
recommendations: true
description: "Learn about services admins can add that appear in the Explore tab within Microsoft Places."
---

# Services in Places

In Microsoft Places apps admins can add services that appear in the **Explore** tab within the Places apps. For more information about the supported Places apps, see the [Deployment guide for Microsoft Places (preview)](/deployment-guide-for-places.md). These services can be added per building to provide employees with all the services that each building offers. For more information, see [Quick setup of buildings and floors](get-started/quick-setup-buildings-floors.md).

For example, a building might have a cafeteria where employees can order food online. Admins have the ability to show employees a link to another website of the cafeteria menu or an app that employees should use to order food online. The following page is an example of how services (both links and apps) might appear.

:::image type="content" source="./media/services-in-places/services-in-places-with-links.png" alt-text="screenshot showing a page of available services, including parking, tech support, dining, and facility request.":::

## Prerequisites

- Opt in to the [Places Public Preview](opt-in-places-preview.md). Services in Places is an opt-in feature.
- Create a building.

## Adding services to a building

1. Find the ID for the building you want to add a service to. See [Get-PlaceV3](powershell/get-placev3.md) to learn more on the process of getting the ID.

2. Associate the service with your building using the ResourceLinks parameter. See [Set-PlaceV3](powershell/set-placev3.md) for more information on the ResourceLinks parameter.

This example associates a services app with a building (coming soon).

```powershell
Set-PlaceV3 -Identity <id> -ResourceLinks @{name="Dining App"; Value="0c7c95a9-b1e2-4725-9a25-793e4205739d"; type="MetaosApp”}
```

This example adds a link.

```powershell
Set-PlaceV3 -Identity <id> -ResourceLinks @{name="Tech Support"; Value="www.contoso.sharepoint.com/TechSupport"; type="URL”} 
```

Once these steps are complete, open the Places **Explore** page within your preferred Places app. The service you added appears with its associated building.
