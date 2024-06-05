---
title: "OneNote blocks embedded files that have dangerous extensions"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: conceptual
ms.service: o365-proplus-itpro
ms.collection: Tier2
ms.localizationpriority: medium
description: "Provides guidance for admins about how OneNote blocks embedded files that have dangerous extensions."
ms.date: 06/05/2024
---

# OneNote blocks embedded files that have dangerous extensions

OneNote is making an important change to how it treats embedded files that have dangerous extensions. Previously, OneNote showed users a dialog warning them that opening attachments could harm their computer and data. But users could still open the embedded file with the dangerous extension by choosing **OK** in the dialog.

With this important change, OneNote blocks users from directly opening an embedded file with a dangerous extension and instead shows them the following dialog.

:::image type="content" source="./media/onenote-extension-block/onenote-dialog-block.png" alt-text="A screenshot of a dialog box telling users their admin blocked opening the file type in OneNote.":::

This change is planned to begin rolling out with Version 2304 in April 2023. For more information, see [Versions of OneNote affected by this change](#versions-of-onenote-affected-by-this-change).

For more information about which extensions are considered dangerous and are blocked, see [Extensions that are considered dangerous](#extensions-that-are-considered-dangerous).

## How to open the embedded file (if necessary)

If you trust the sender and need to open the embedded file, save it to your device and open it from there.

If you have security measures like antivirus software or [Smart App Control](https://support.microsoft.com/topic/285ea03d-fa88-4d56-882e-6698afdb7003), these tools might block the file when you try to save or open it from your device.

## Versions of OneNote affected by this change

This change affects OneNote for Microsoft 365 and some retail versions on Windows devices. It doesn't affect OneNote on Mac, Android, iOS devices, OneNote on the web, or OneNote for Windows 10.

The following table shows the version, for each update channel, in which the blocking change is implemented. Information in italics is subject to change.

| Channel                                    | Version | Rollout Date       |
|--------------------------------------------|---------|--------------------|
| Current Channel (Preview)                  | 2304    | May 1, 2023        |
| Current Channel                            | 2304    | May 1, 2023        |
| Monthly Enterprise Channel                 | 2304    | June 13, 2023      |
| Semi-Annual Enterprise Channel (Preview)   | 2308    | September 12, 2023 |
| Semi-Annual Enterprise Channel             | 2308    | January 9, 2024    |
| Semi-Annual Enterprise Channel (Extended)  | 2302    | July 11, 2023      |

> [!NOTE]
> - This change affects OneNote in retail versions of Office 2021, Office 2019, and Office 2016. They're on the same schedule as Current Channel.
> - This change affects OneNote in volume licensed versions of Office, such as Office LTSC 2021 and Office LTSC 2019. They're on the same schedule as Current Channel. 

## Extensions that are considered dangerous

By default, OneNote blocks the same extensions that Outlook, Word, Excel, and PowerPoint do. For a list of those extensions, see [Blocked attachments in Outlook](https://support.microsoft.com/office/434752e1-02d3-4e90-9124-8b81e49a8519).

### Block more file extensions

If you want to block more extensions, you can enable the "Block additional file extensions for OLE embedding" policy and specify which other extensions you want to block. You can find the policy under User Configuration\Policies\Administrative Templates\Microsoft Office 2016\Security Settings in the Group Policy Management Console. You can also use the [Cloud Policy service for Microsoft 365](../admincenter/overview-cloud-policy.md) to configure the policy.

Changes you make to this policy also affect other applications, such as Word, Excel, and PowerPoint.

> [!NOTE]
> - You can only use this policy if you’re using Microsoft 365 Apps for enterprise. Policies aren’t available for Microsoft Apps for Business.
> - Do not use the OneNote-specific policy called “Embedded Files Blocked Extensions” policy to block additional extensions. This policy is found under User Configuration\Policies\Administrative Templates\Microsoft OneNote 2016\OneNote Options\Other.

### Allow file extensions that are blocked by default

To allow certain blocked extensions, enable the "Allow file extensions for OLE embedding" policy and specify the extensions. You can find the policy under User Configuration\Policies\Administrative Templates\Microsoft Office 2016\Security Settings in the Group Policy Management Console. You can also use the [Cloud Policy service for Microsoft 365](../admincenter/overview-cloud-policy.md) to configure the policy.

> [!NOTE]
> You can only use this policy if you’re using Microsoft 365 Apps for enterprise. Policies aren’t available for Microsoft Apps for Business.

Changes you make to this policy also affect other applications, such as Word, Excel, and PowerPoint.

> [!WARNING]
> Malicious scripts and executables can cause harm if clicked by the user. If extensions are added to this allow list, they can make OneNote and other applications, such as Word and Excel, less secure.