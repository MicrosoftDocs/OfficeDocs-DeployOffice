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

In Microsoft Places apps ([Introducing Microsoft Places: Turn your spaces into places](https://www.microsoft.com/en-us/microsoft-365/blog/2022/10/12/introducing-microsoft-places-turn-your-spaces-into-places/)), admins can add services that appear in the Explore tab within Places. These services can be added per building [[Quick setup of buildings and floors](get-started/quick-setup-buildings-floors.md)] to provide employees with all the services that each building offers.

For example, a building might have a cafeteria where employees can order food online. Admins have the ability of showing employees a link to another website that may simply show the cafeteria menu or an app that employees should use to order food online. The following is an example of how services (both links and apps) might appear.

:::image type="content" source="./media/services-in-places/services-in-places-with-links.png" alt-text="screenshot showing available services, including parking, tech support, dining, and facility request.":::

## Prerequisites

- Services in Places is an opt-in feature. For more information, see [Opt in to the Microsoft Places Public Preview](opt-in-places-preview.md).
- Create a building.

## Adding services to a building

First, you need to find the ID [link to how to get ID] for the building you want to add a service to. Next, you associate the service with this building using the ResourceLinks parameter. For more information, see -resourceLinks. [LINK to place directory doc -resourcelink section].

This example associates a services app with a building.

```powershell
set-Places -Identity <id> -ResourceLinks @{name="Dining App"; Value="0c7c95a9-b1e2-4725-9a25-793e4205739d"; type="MetaosApp”}
```

This example adds a link.

```powershell
set-Places -Identity <id> -ResourceLinks @{name="Dining App"; Value="www.contoso.sharepoint.com/diningMenu"; type="urlLink”} 
```

Once this is complete, open the Places Explore page" (using the link to the explore page) and you’ll see the service you added under its associated building.
