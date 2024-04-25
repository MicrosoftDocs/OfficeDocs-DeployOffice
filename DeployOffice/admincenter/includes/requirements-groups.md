---
author: manoth-msft
ms.author: nwhite
manager: dougeby
ms.service: o365-proplus-itpro
ms.localizationpriority: medium
ms.topic: include
description: Network Requirements for Microsoft 365 Apps admin center 
ms.date: 04/25/2024
---
<!--This file is shared by update-validation.md, cloud-update.md, inventory.md, overview.md. Headings are driven by article context.-->
Using [Microsoft Entra groups](/entra/fundamentals/concept-learn-about-groups) is supported under the following conditions:

- Both **device objects** and **user objects** can be used and also added to the same group.
- **Device objects** must be Microsoft Entra joined or hybrid joined.
- **User objects** must be present in Microsoft Entra ID and have a [supported license](#licensing-requirements) assigned.
- Multiple groups can be used, but a single group should contain no more than 20,000 objects.
- Nested groups support up to three levels deep.
