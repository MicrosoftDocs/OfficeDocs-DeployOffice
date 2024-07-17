---
title: "Trusted publishers for Office files"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: conceptual
ms.service: o365-proplus-itpro
ms.collection: Tier2
ms.localizationpriority: medium
description: "Provides guidance to Office admins about configuring trusted publishers for Office files."
ms.date: 03/01/2023
---

# Trusted publishers for Office files

***Applies to:*** *Microsoft 365 Apps, Office LTSC 2021, Office 2019, and Office 2016*

A publisher is a person or a company who has published software, such as a macro, an ActiveX control, or an add-in. Before you decide that a publisher is reliable and can be trusted, you should know the identity of the publisher, and whether the publisher's credentials are valid.

If Office warns you about potentially unsafe code in a file, you can view more information about the code and the publisher before deciding whether to trust the code or the publisher. If you receive a warning that there's no signature present, or that the signature is invalid, you shouldn't enable the content or trust the publisher unless you're sure the code comes from a reliable source. Usually, a message that the signature is invalid means that the code was tampered with after the author signed it.

If a macro used in an Office file is signed and you’ve validated the certificate and trust the source, you can make that source a trusted publisher. We recommend, if possible, that you manage trusted publishers for your users.

> [!NOTE]
> If your organization develops and distributes macros in Office files, either to internal users or external customers, your macro developers should, as a best practice, sign their VBA code. The code is typically signed with a digital certificate from a commercial certificate authority (CA) before the macros are distributed.

To be a trusted publisher, the public code-signing certificate used to sign the macro needs to be added to the Trusted Publishers certificate store on the device.

> [!WARNING]
> - All macros validly signed with the same certificate are recognized as coming from a trusted publisher and are run.
> - Adding a trusted publisher could affect scenarios beyond those related to Office, because a trusted publisher is a Windows-wide setting, not just an Office-specific setting.

## Use Group Policy to manage trusted publishers

You can use Group Policy to distribute to devices in your organization the public code-signing certificate used to sign the macro. To distribute the certificate, you can do the following steps in the Group Policy Management tool:

1. Go Computer Configuration\Policies\Windows Settings\Security Settings\Public Key Policies, right-click **Trusted Publishers**, and then choose **Import**.
2. Run the **Certificate Import Wizard** and import the appropriate certificate file to the Trusted Publishers certificate store.

For users who should only run VBA macros signed by a trusted publisher, you should set the [VBA Macro Notification Settings](internet-macros-blocked.md#vba-macro-notification-settings) policy to **Enabled** and do the following steps under **Options**:

- Select **Disable all except digitally signed macros** from the drop-down list.
- Select the **Require macros to be signed by a trusted publisher** checkbox.

> [!NOTE]
> If you choose these settings for Excel, Excel 4.0 macros will be blocked.

If you want to provide more restrictions, under **Options** you can select the **Block certificates from trusted publishers that are only installed in the current user certificate store** checkbox. That setting prevents users from manually adding a trusted publisher on their device, unless they have admin permissions on their device.

## Use a command-line program to distribute a certificate for a trusted publisher

If you can’t use, or don’t use, Group Policy in your organization, you can also distribute the public code-signing certificate by using the [certutil](/windows-server/administration/windows-commands/certutil) command in a script or manually on a device. You can use the [-addstore parameter](/windows-server/administration/windows-commands/certutil#-addstore) to add the code-signing certificate to the TrustedPublisher store on the device.

## Have a user add a trusted publisher manually

If you have just a few users that need to set up a trusted publisher, you can do it manually on each device. Users only need to do this one time for each publisher.

Users can [follow these instructions](https://support.microsoft.com/office/87b3d5a3-b68c-4023-87c4-7cc78a44d7ed) to add the source a trusted publisher. If the file has Mark of the Web, users first must remove Mark of the Web from the file before they can add the source as a trusted publisher. For more information, [review the information in this article](https://support.microsoft.com/topic/0952faa0-37e7-4316-b61d-5b5ed6024216).