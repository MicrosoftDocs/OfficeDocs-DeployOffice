---
title: "Rearm a volume licensed version of Office that's included in an operating system image"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: conceptual
ms.service: office-perpetual-itpro
ms.localizationpriority: medium
ms.collection: Tier2
description: "Provides Office admins with information on how to rearm a volume licensed version of Office when deploying Office as part of an operating system image."
ms.date: 06/21/2024
---

# Rearm a volume licensed version of Office that's included in an operating system image

 ***Applies to:*** *Volume licensed versions of Office LTSC 2021, Office 2019, and Office 2016 (including Project and Visio)*

There's a 25-day grace period from the time of installation of Key Management Service (KMS) clients before notifications to activate are displayed to the user. The 25-day grace period gives ample time for a KMS host computer to be found and activation to succeed. If activation is successful, users don't see notifications to activate.

If you want to deploy a volume licensed version of Office, Project, or Visio, as part of an operating system image, you must rearm your Office installation before you capture the image. If you don't rearm, users might see notification dialog boxes at the time that the image is deployed, instead of 25 days after deployment.
  
Rearming does the following important tasks:
  
- Resets the grace timer to 30 days.
- Freezes the grace timer until either an Office application is run, or the ospp.vbs script is run.
- Resets the client computer ID (CMID). The KMS host computer uses the CMID to determine the number of unique clients. You can use the ospp.vbs script to check the CMID.

For more information about the ospp.vbs script, see [Tools to manage volume activation of Office](tools-to-manage-volume-activation-of-office.md#the-osppvbs-script).

You can rearm five times, unless you activate Office by using a KMS host computer. If you run out of rearms, activating by using a KMS host computer lets you rearm once.

> [!NOTE]
> Rearming is also recommended if you're activating a volume licensed version of Office, including Project and Visio, by using Multiple Activation Key (MAK). If you're activating by using MAK and you don't remotely activate for end-users by using the Volume Activation Management Tool (VAMT) or ospp.vbs, users see an activation dialog box the first time that an Office application starts. The activation dialog box is slightly different 25 days after installation. Also, users might immediately see a red title bar warning them of activation issues if Office wasn't rearmed before the image was captured.

## Use the ospprearm command to rearm an Office installation

1. Verify that the user account that is performing this procedure is a member of the Administrators group on the KMS host computer.
2. Close all Office applications.
3. Open an elevated command prompt and go to the Program Files\Microsoft Office\Office16 folder. If you installed the 32-bit version of Office on a 64-bit operating system, go to the Program Files (x86)\Microsoft Office\Office16 folder.
5. Type ospprearm.exe and then press Enter. If the rearm succeeds, the following message displays: **"Microsoft Office rearm successful."**
6. Capture the image.

    > [!IMPORTANT]
    > Do not open an Office application or run ospp.vbs, or do anything else related to Office while the image is being captured. Otherwise, the grace timer starts.

## Related articles

- [Overview of volume activation of Office](plan-volume-activation-of-office.md)
- [Tools to manage volume activation of Office](tools-to-manage-volume-activation-of-office.md)
- [Volume Activation Management Tool (VAMT) Technical Reference](/windows/deployment/volume-activation/volume-activation-management-tool)