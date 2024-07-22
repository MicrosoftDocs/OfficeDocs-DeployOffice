---
title: "Overview of volume activation of Office"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: conceptual
ms.service: office-perpetual-itpro
ms.localizationpriority: medium
ms.collection: Tier2
description: "Provides Office admins with an overview of the different types of activation, such as KMS and MAK, available for volume licensed versions of Office, Project, and Visio."
ms.date: 06/21/2024
---

# Overview of volume activation of Office

***Applies to:*** *Volume licensed versions of Office LTSC 2021, Office 2019, and Office 2016 (including Project and Visio)*

Activation is the process of validating software with the manufacturer after it's installed on a specific computer. Activation confirms that the product is genuine—not a fraudulent copy—and that the product key or serial number is valid and hasn't been compromised or revoked. Activation also establishes a link or relationship between the product key and the particular installation.

> [!NOTE]
> If you're a user trying to activate a personal copy of Office at home, see [Activate Office](https://support.microsoft.com/office/5bd38f38-db92-448b-a982-ad170b1e187e) instead of reading this article.
  
Volume activation is the process that Microsoft volume licensing customers use to automate and manage the activation of Windows operating systems, Microsoft Office, and other Microsoft products across large organizations.

There are three different methods that you can activate volume licensed versions of Office, including Project and Visio:
  
- [Key Management Service (KMS):](#key-management-service-kms-activation-of-office) Office is activated by contacting a KMS host computer on your network.

- [Multiple Activation Key (MAK):](#multiple-activation-key-mak-activation-of-office) Office is activated online by Microsoft-hosted activation servers or by telephone.

- [Active Directory-based:](#active-directory-based-activation-of-office) Office on a domain-joined computer is activated through Active Directory.

Which activation method you choose depends on the size, network infrastructure, connectivity, and security requirements of your environment. You can choose to use different activation methods for different versions of Office and for different computers, for example desktops and laptops. Because these three activation methods are also used to activate volume licensed versions of Windows, you might be able to use the same method to activate both Windows and Office. For more information, see [Volume Activation for Windows 10](/windows/deployment/volume-activation/volume-activation-windows-10) and [Volume Activation Overview](/previous-versions/windows/it-pro/windows-server-2012-R2-and-2012/hh831612(v=ws.11)).

All volume licensed versions of Office, including Project and Visio, have a preinstalled product key, called a Generic Volume License Key (GVLK), that can be used for KMS and Active Directory-based activation. You don't have to enter a product key for each Office installation if you're activating Office by using KMS or Active Directory. If you're activating Office by using MAK, you must enter a product key for each Office installation, but there are ways to automate that.
  
## Key Management Service (KMS) activation of Office

KMS activation is a client-server model in which each client requests activation from a KMS host computer. The keys needed to activate Office are installed on the KMS host computer. The client uses DNS to locate a KMS host computer to request activation.

For more information, see the following articles:

- [Configure a KMS host computer to activate volume licensed versions of Office](configure-a-kms-host-computer-for-office.md)
- [Configure DNS for activating volume licensed versions of Office by using KMS](configure-dns-to-activate-office-by-using-kms.md)
- [Activate volume licensed versions of Office by using KMS](activate-office-by-using-kms.md)
  
## Multiple Activation Key (MAK) activation of Office

MAK activation is used for one-time activation through Microsoft-hosted activation services, either via the internet or by telephone. MAK activation requires that a MAK is installed on a client computer and instructs that computer to activate itself against those services.

Each MAK has a predetermined number of allowed activations and is based on your volume licensing agreement. Each Office activation that uses MAK counts toward the activation limit. After Office is activated, no reactivation is required unless the hardware changes significantly.

For more information, see [Activate volume licensed versions of Office by using MAK](activate-office-by-using-mak.md).
  
## Active Directory-based activation of Office

Active Directory-based activation can activate Office installed on domain-joined computers. The product key information, which is the same that is used by KMS, is stored in Active Directory and replicated throughout the forest. If Office can't contact Active Directory for activation, Office tries to activate by using KMS.
  
For more information, see [Activate volume licensed versions of Office by using Active Directory](activate-office-by-using-active-directory.md).