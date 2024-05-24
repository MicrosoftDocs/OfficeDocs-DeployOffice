---
title: "Install web add-in counterparts of existing COM add-ins in new Outlook for Windows"
ms.author: samramon
author: samantharamon
manager: aljerabe
audience: ITPro
ms.topic: overview
ms.service: outlook
ms.collection: Tier1
ms.localizationpriority: medium
ms.custom: intro-overview
recommendations: true
description: "Learn how Office web add-in counterparts are installed when a user switches to new Outlook for Windows for the first time."
ms.date: 05/23/2024
---

# Install web add-in counterparts of existing COM add-ins in new Outlook for Windows

When a user switches to new Outlook for Windows for the first time, they're given the option to import their settings and install existing add-ins from classic Outlook for Windows. This option provides them with a familiar experience and minimizes any disruptions in their work. Because COM add-ins aren't supported in new Outlook for Windows, their Office web add-in counterparts are installed instead.

## Identify the Office web add-ins to be installed

The installation of Office web add-in counterparts during the switch to new Outlook for Windows is only supported for some COM add-ins. For a list of supported add-ins, see the "List of add-ins installed from classic Outlook for Windows" section of [Import settings and install add-ins on new Outlook for Windows](https://prod.support.services.microsoft.com/office/b85ce5ff-bef3-45ae-9e95-9d63c514abdc).

>[!NOTE]
> Existing Office web add-ins installed by the user in classic Outlook for Windows remain installed when they switch to the new client.

If a user switches back to classic Outlook for Windows, web add-ins that were installed are removed and only their COM add-in counterparts are visible to the user.

## Prevent add-ins from being installed during setup

There might be scenarios where your organization wouldn't want to install web add-in counterparts of a user's existing COM add-ins during the switch. In this case, you must configure the **Disable web add-in installation on migration to new Outlook for Windows** Group Policy setting on every applicable machine in your organization.

:::image type="content" source="../images/install-web-add-ins/com-to-web-add-in-gpo-setting.png" alt-text="The 'Disable web add-in installation on migration to new Outlook for Windows' Group Policy setting set to Not Configured.":::

By default, the setting is set to **Not Configured**. To prevent installing web add-in counterparts of existing COM add-ins during the switch, perform the following:

1. Download the latest [Administrative Templates for Microsoft 365 Apps](https://www.microsoft.com/download/details.aspx?id=49030) tool.
1. Open the **Local Group Policy Editor (gpedit.msc)**.
1. Navigate to **User Configuration\Administrative Templates\Microsoft Outlook 2016\Miscellaneous**.
1. Open the **Disable web add-in installation on migration to new Outlook for Windows** setting.
1. In the dialog that appears, select **Enabled**.
1. Select **OK** or **Apply** to save your change.
