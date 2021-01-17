---
title: "Overview of the unattended robotic process automation with Microsoft 365 Apps for enterprise"
ms.author: jwhit
author: jwhit-MSFT
manager: laurawi
audience: ITPro
ms.topic: article
ms.service: o365-proplus-itpro
localization_priority: Normal
ms.collection: 
ms.custom: Ent_Office_ProPlus
description: "Overview of the unattended robotic process automation with Microsoft 365 Apps for enterprise"
---

# Overview of the unattended robotic process automation with Microsoft 365 Apps for enterprise

Robotic process automation (RPA) is the process of automating business procedures through mimicking and automatically executing rule-based tasks. Through RPA, a machine copies and records the set of actions that a user takes to complete a task.

There are two main forms of RPA:
- *Attended RPA*: The collaboration between the user and the bot. It's also known as the virtual assistant.
- *Unattended RPA*: The execution of tasks and interactions, independent of the user. With unattended RPA, the bot can run automation on its own.

This article discusses unattended RPA sessions.

## Requirements for using Microsoft 365 Apps for enterprise with unattended RPA

These are the requirements for using Microsoft 365 Apps for enterprise with unattended RPA:

- The account that's running an RPA unattended task must have a license for Microsoft 365 Apps for enterprise (unattended). The account can be a regular user account, a system/service account, or a robot account.
- It's available for only the Office apps for Windows.
- It requires Microsoft 365 Apps for enterprise version 2009 or later.

Like with an attended user license, admins can manage the Microsoft 365 Apps for enterprise (unattended) licenses in the Microsoft 365 Admin center.

If the account doesn't have a license for Microsoft 365 Apps for enterprise (unattended), the Office app that's being used for unattended RPA runs in reduced functionality mode. The unattended process can open and print existing documents in Office applications, but it can't create new documents or edit and save existing documents. In this case, the following message appears under the ribbon in the document:
> **LICENSE REQUIRED** The account \<*account sign-in name*\> requires an Office license for unattended use.

## Steps to use Microsoft 365 Apps for enterprise with unattended RPA

You can use one of the following options.

## Use the command prompt window
This process applies mostly to UI automation scenarios.

After you start the application:

1. Open the command prompt window (using your automation mechanism).
1. At the command prompt, call your Office app.
   - After the app is called, a switch appears as the next command line.
1. At the command-line switch, pass an argument to indicate that you'll use RPA unattended:

   *“\[appname\].exe - unattended”*

   > [!NOTE]
   > *appname* is dependent on the name of the Office app that you're opening.

The preceding scenario happens every time that you want to run an unattended RPA scenario in Office. You can also save the syntax offline and paste it back into the prompt later.

## Using the registry key

This process is mostly applicable if you're running unattended RPA on a dedicated device. To indicate unattended usage, you can adjust your key with the following syntax:

*Software\\\\Microsoft\\\\Office\\\\Common\\\\Licensing", <span class="underline">key</span> = "Unattended", and <span class="underline">type</span> = DWORD.*

Users can then open their application using any method (it doesn't have to be through the command prompt), as long as the per-user settings have been adjusted.

## See also

  - [Microsoft 365 Unattended License Overview](https://download.microsoft.com/download/3/D/4/3D42BDC2-6725-4B29-B75A-A5B04179958B/M365_Unattended_Brief.pdf)

  - [New licensing options for Microsoft 365 for unattended scenarios](https://developer.microsoft.com/en-us/office/blogs/new-licensing-options-for-microsoft-365-for-unattended-scenarios/)

  - [Considerations for unattended automation of Office in the Microsoft 365 for unattended RPA environment](https://docs.microsoft.com/office/client-developer/integration/considerations-unattended-automation-office-microsoft-365-for-unattended-rpa)

  - [Command line switch code](https://nam06.safelinks.protection.outlook.com/?url=https%3A%2F%2Fsupport.office.com%2Fen-us%2Farticle%2Fcommand-line-switches-for-microsoft-office-products-079164cd-4ef5-4178-b235-441737deb3a6&data=02%7C01%7CEbo.Quansah%40microsoft.com%7C286c55703b9445abc83108d8120ed42e%7C72f988bf86f141af91ab2d7cd011db47%7C0%7C0%7C637279202233188356&sdata=ZNlu5SadmbLCz3fK3zo8cYEX5s7SMo00ocODFpM2NZk%3D&reserved=0)

