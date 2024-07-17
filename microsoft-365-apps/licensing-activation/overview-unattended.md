---
title: "Overview of the unattended robotic process automation with Microsoft 365 Apps for enterprise"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: conceptual
ms.service: o365-proplus-itpro
ms.collection: Tier2
ms.localizationpriority: medium
recommendations: false
description: "Overview of the unattended robotic process automation with Microsoft 365 Apps for enterprise"
ms.date: 03/01/2023
---

# Overview of the unattended robotic process automation with Microsoft 365 Apps for enterprise

Robotic process automation (RPA) is the process of automating business procedures through mimicking and automatically executing rule-based tasks. Through RPA, a machine copies and records the set of actions that a user takes to complete a task.

There are two main forms of RPA:
- *Attended RPA*: The collaboration between the user and the bot. It's also known as the virtual assistant.
- *Unattended RPA*: The execution of tasks and interactions, independent of the user. With unattended RPA, the bot can run automation on its own.

This article discusses unattended RPA sessions.

## Requirements for using Microsoft 365 Apps for enterprise with unattended RPA

Here are the requirements for using Microsoft 365 Apps for enterprise with unattended RPA:

- The account that's running an RPA unattended task must have a license for Microsoft 365 Apps for enterprise (unattended). The account can be a regular user account, a system/service account, or a robot account.
- It's available for only the Office apps for Windows.
- It requires Version 2009 or later of Microsoft 365 Apps for enterprise.

> [!NOTE]
> - Each unattended license allows the use of the Microsoft 365 suite in only a single unique physical or virtual OSE for robotic process automation. For more information, see the [Microsoft 365 Unattended License Overview (June 2022)](https://download.microsoft.com/download/3/d/4/3D42BDC2-6725-4B29-B75A-A5B04179958B/Licensing_brief_PLT_Microsoft365_Unattended_License_overview.pdf) and the [Microsoft 365 Product Terms](https://www.microsoft.com/licensing/terms/productoffering/Microsoft365/EAEAS#ServiceSpecificTerms).
> - RPA doesn't support [shared computer activation](overview-shared-computer-activation.md).

Like with an attended user license, admins can manage the Microsoft 365 Apps for enterprise (unattended) licenses in the Microsoft 365 admin center.

If the account doesn't have a license for Microsoft 365 Apps for enterprise (unattended), the Office app that's being used for unattended RPA runs in reduced functionality mode. The unattended process can open and print existing documents in Office apps, but it can't create new documents or edit and save existing documents. In this case, the following message appears under the ribbon in the document: "LICENSE REQUIRED The account \<*account sign-in name*\> requires an Office license for unattended use."

## Steps to use Microsoft 365 Apps for enterprise with unattended RPA

You can use one of the following options.

## Use the command prompt window
This process applies mostly to UI automation scenarios.

After you start the app:

1. Open the command prompt window (using your automation mechanism).
1. At the command prompt, call your Office app.
   - After the app is called, a switch appears as the next command line.
1. At the command-line switch, pass an argument to indicate that you're using RPA unattended:

   *“\[appname\].exe -unattended”*

   > [!NOTE]
   > *appname* is dependent on the name of the Office app that you're opening.

This scenario happens every time that you want to run an unattended RPA scenario in Office. You can also save the syntax offline and paste it back into the prompt later.

## Using the registry key

This process is mostly applicable if you're running unattended RPA on a dedicated device. To indicate unattended usage, you can set the below registry value:

&nbsp;&nbsp;&nbsp;HKEY_CURRENT_USER\Software\Microsoft\Office\Common\Licensing, key = Unattended, type = DWORD, and value = 1

Once that value is set, users can open the application using any method and it uses the unattended license. They don't have to use the command prompt to open it.

## Related articles

- [Microsoft 365 Unattended License Overview (June 2022)](https://download.microsoft.com/download/3/D/4/3D42BDC2-6725-4B29-B75A-A5B04179958B/Licensing_brief_PLT_Microsoft365_Unattended_License_overview.pdf) (PDF)
- [New licensing options for Microsoft 365 for unattended scenarios](https://devblogs.microsoft.com/microsoft365dev/new-licensing-options-for-microsoft-365-for-unattended-scenarios/)
- [Considerations for unattended automation of Office in the Microsoft 365 for unattended RPA environment](/office/client-developer/integration/considerations-unattended-automation-office-microsoft-365-for-unattended-rpa)
- [Command-line switches for Microsoft Office products](https://support.microsoft.com/office/079164cd-4ef5-4178-b235-441737deb3a6)
