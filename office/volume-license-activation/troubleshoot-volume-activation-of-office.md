---
title: "Troubleshoot volume activation of Office"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: troubleshooting
ms.service: office-perpetual-itpro
ms.localizationpriority: medium
ms.collection: Tier2
description: "Provides Office admins with information on how to troubleshoot common errors for KMS or MAK-based activation of Office."
ms.date: 04/28/2023
---

# Troubleshoot volume activation of Office

***Applies to:*** *Volume licensed versions of Office LTSC 2021, Office 2019, and Office 2016 (including Project and Visio)*


Setting up volume activation of Office, including Project and Visio, by using Key Management Service (KMS) or Multiple Activation Key (MAK) can be challenging. Use these steps to troubleshoot the most common issues.

> [!NOTE]
> If you're an Office user troubleshooting a personal copy of Office at home, see [Unlicensed Product and activation errors in Office](https://support.microsoft.com/office/0d23d3c0-c19c-4b2f-9845-5344fedc4380) instead of reading this article.
  
Many of the solutions include running the ospp.vbs, which you need to run from an elevated command prompt on the computer on which Office is installed. The ospp.vbs script is located in the Program Files\Microsoft Office\Office16 folder. If you installed the 32-bit version of Office on a 64-bit operating system, go to the Program Files (x86)\Microsoft Office\Office16 folder. You can also use the slmgr.vbs script to configure and manage volume activation. For detailed information about these scripts, see [Tools to manage volume activation of Office](tools-to-manage-volume-activation-of-office.md).

> [!NOTE]
> The ospp.vbs script doesn't work for Microsoft 365 Apps or subscription versions of Project and Visio. Instead, you can use a PowerShell script named vnextdiag.ps1. For more information, see [Check the license and activation status for Microsoft 365 Apps](/microsoft-365-apps/licensing-activation/vnextdiag).
  
## Tips for configuring KMS clients and host computers

Generally, you don't have to configure Office Key Management Service (KMS) clients if the KMS host computer used to activate Office was correctly set up and configured. The KMS client automatically searches for the KMS host computer by using DNS and then attempts activation. The KMS service uses service (SRV) resource records (RRs) in DNS to store and communicate the locations of KMS host computers.
  
By default, KMS host computers automatically publish the information that KMS clients use to find and connect to them by using DNS dynamic update protocol. By default, KMS clients query the DNS server for KMS service information.
  
You can manually configure KMS host computers and clients, depending on the network configuration and your security requirements. For example, if the network environment doesn't use SRV records, you can manually configure a KMS client to use a specific KMS host computer.

- For more information about using DNS with volume activation, see [Configure DNS for activating volume licensed versions of Office by using KMS](configure-dns-to-activate-office-by-using-kms.md).
- For more information about how to configure the KMS client, see [ospp.vbs script](tools-to-manage-volume-activation-of-office.md#the-osppvbs-script) and [Activate volume licensed versions of Office by using KMS](activate-office-by-using-kms.md).
- For more information about how to configure the KMS host computer, see [Configure a KMS host computer to activate volume licensed versions of Office](configure-a-kms-host-computer-for-office.md).

## MAK activation issue when internet connection uses an authenticated proxy

You have to be connected to the internet to use MAK activation. But, if your internet connection requires authentication, MAK activation won't work and you have to activate over the telephone. For more information about this issue, see [Windows activation or validation fails with error code 0x8004FE33](https://support.microsoft.com/topic/a9afe65e-230b-c1ed-3414-39acd7fddf52).
  
## How to get the text for activation error codes

Error codes help you troubleshoot activation issues. If you see a dialog box that contains an activation notification, an error code is usually displayed at the lower corner. You can then run ospp.vbs /ddescr together with the error code to see the text of the error message. The text helps you better understand the issue and what to do to fix it.

Another way to obtain an error code is to run ospp.vbs /act on the client computer to manually activate Office. If activation fails, an error code is shown.
  
## Licensing information isn't updated on the client

To display licensing information for Office applications, open an Office application, such as Word, and go to **File** > **Account**.
  
If you see a notification that product activation is required even though you know that Office is in the licensed state, restart the application.
  
The client applications can be in this state because Office was activated by using ospp.vbs /act or the [Volume Activation Management Tool (VAMT)](/windows/deployment/volume-activation/volume-activation-management-tool). In these cases, you must restart any Office applications to complete the activation.
  
## Generic Volume License Keys (GVLKs) for Office

All volume licensed versions of Office, including Project and Visio, have a Generic Volume License Key (GVLK) preinstalled that's used to activate Office by using a KMS host computer. If you entered a MAK key for a product and you want to change the activation method back to KMS, use the appropriate KMS client GVLK. For more information, see [GVLKs for KMS and Active Directory-based activation of Office, Project, and Visio](gvlks.md). The recommended way to enter the key is by using [Volume Activation Management Tool (VAMT)](/windows/deployment/volume-activation/volume-activation-management-tool). You can also use ospp.vbs /inpkey to enter the key.
  
For Office suites, only one key is required for all the products in the suite. For example, if you use Office Professional Plus, you must enter only the Office Professional Plus key for the complete suite. For a complete listing of the keys, see [GVLKs for KMS and Active Directory-based activation of Office, Project, and Visio](gvlks.md).
