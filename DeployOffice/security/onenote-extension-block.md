---
title: "OneNote blocks embedded files that have dangerous extensions"
ms.author: danbrown
author: DHB-MSFT
manager: dougeby
audience: ITPro
ms.topic: conceptual
ms.service: o365-proplus-itpro
ms.collection: Tier2
ms.localizationpriority: medium
description: "Provides guidance for admins about how OneNote blocks embedded files that have dangerous extensions."
ms.date: 03/29/2023
---

# OneNote blocks embedded files that have dangerous extensions

OneNote is making an important change to how it treats embedded files that have dangerous extensions. Previously, OneNote showed users a dialog warning them that opening attachments could harm their computer and data. But users could still open the embedded file with the dangerous extension by choosing **OK** in the dialog.

With this important change, OneNote blocks users from directly opening an embedded file with a dangerous extension and instead shows them the following dialog.

![Dialog telling users their admin has blocked opening the file type in OneNote](../images/security/onenote-dialog-block.png)

This change is planned to begin rolling out with Version 2304 in April 2023. For more information, see [Versions of OneNote affected by this change](#versions-of-onenote-affected-by-this-change).

For more information about which extensions are considered dangerous and are blocked, see [Extensions that are considered dangerous](#extensions-that-are-considered-dangerous).

## How to open the embedded file (if necessary)

If you trust the person who sent you the embedded file, and you need to open the embedded file, then save the file to your local device, and open the file from there.

If you have other security measures in place, such as antivirus software or [Smart App Control](https://support.microsoft.com/topic/285ea03d-fa88-4d56-882e-6698afdb7003), it's possible that the file will be blocked by those tools when you try to save or open it from your local device.

## Versions of OneNote affected by this change

This change only affects OneNote for Microsoft 365 on devices running Windows. The change doesn’t affect OneNote on a Mac, OneNote on Android or iOS devices, OneNote on the web, or OneNote for Windows 10.

The following table shows the version, for each update channel, in which the blocking change is implemented. Information in italics is subject to change.

| Update channel                           | Version        | Release date                |
|------------------------------------------|----------------|-----------------------------|
| Current Channel (Preview)                | *Version 2304* | *First half of April 2023*  |
| Current Channel                          | *Version 2304* | *Second half of April 2023* |
| Monthly Enterprise Channel               | *Version 2304* | *June 13, 2023*             |
| Semi-Annual Enterprise Channel (Preview) | *Version 2308* | *September 12, 2023*        |
| Semi-Annual Enterprise Channel           | *Version 2308* | *January 9, 2024*           |

> [!NOTE]
> - This change will also affect OneNote in retail versions of Office 2021, Office 2019, and Office 2016. They're on the same schedule as Current Channel.
> - This change won't affect OneNote in volume licensed versions of Office, such as Office LTSC Professional Plus 2021 or Office Standard 2019.

## Extensions that are considered dangerous

By default, OneNote blocks the same extensions that Outlook, Word, Excel, and PowerPoint do. For a list of those extensions, see [Blocked attachments in Outlook](https://support.microsoft.com/office/434752e1-02d3-4e90-9124-8b81e49a8519).

### Block additional file extensions

If you want to block more extensions, you can enable the “Block additional file extensions for OLE embedding” policy and specify which other extensions you want to block. You can find the policy under User Configuration\Policies\Administrative Templates\Microsoft Office 2016\Security Settings in the Group Policy Management Console. You can also use the [Cloud Policy service for Microsoft 365](../admincenter/overview-cloud-policy.md) to configure the policy.

Changes you make to this policy also affect other applications, such as Word, Excel, and PowerPoint.

> [!NOTE]
> - You can only use this policy if you’re using Microsoft 365 Apps for enterprise. Policies aren’t available for Microsoft Apps for Business.
> - Do not use the OneNote-specific policy called “Embedded Files Blocked Extensions” policy to block additional extensions. This policy is found under User Configuration\Policies\Administrative Templates\Microsoft OneNote 2016\OneNote Options\Other.

### Allow file extensions that are blocked by default

If you need to allow certain extensions that are blocked by default, you can enable “Allow file extensions for OLE embedding” policy and specify which extensions to allow. You can find the policy under User Configuration\Policies\Administrative Templates\Microsoft Office 2016\Security Settings in the Group Policy Management Console. You can also use the [Cloud Policy service for Microsoft 365](../admincenter/overview-cloud-policy.md) to configure the policy.

> [!NOTE]
> You can only use this policy if you’re using Microsoft 365 Apps for enterprise. Policies aren’t available for Microsoft Apps for Business.

Changes you make to this policy also affect other applications, such as Word, Excel, and PowerPoint.

> [!WARNING]
> Malicious scripts and executables can cause harm if clicked by the user. If extensions are added to this allow list, they can make OneNote and other applications, such as Word and Excel, less secure.