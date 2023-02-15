---
title: "Activate volume licensed versions of Office by using Active Directory"
ms.author: danbrown
author: DHB-MSFT
manager: dougeby
audience: ITPro
ms.topic: article
ms.service: office-perpetual-itpro
ms.localizationpriority: medium
ms.collection: tier2
description: "Provides Office admins with information about using Active Directory to activate volume licensed versions of Office, Project, and Visio."
ms.date: 03/20/2018
---

# Activate volume licensed versions of Office by using Active Directory

***Applies to:*** *Volume licensed versions of Office LTSC 2021, Office 2019, and Office 2016 (including Project and Visio)*
  
Active Directory-based activation enables an organization to activate volume licensed versions of Office, including Project and Visio, on computers that are joined to an Active Directory domain. Active Directory-based activation is implemented as a role service on Windows Server and relies on Active Directory Domain Services to store an activation object. For more information, see [Activate using Active Directory-based activation](/windows/deployment/volume-activation/activate-using-active-directory-based-activation-client).

## Requirements for using Active Directory-based activation

To use Active Directory-based activation, the volume licensed version of Office, Project, or Visio must have a Generic Volume License Key (GVLK) and must be installed on one of the following operating systems:

- Windows 11
- Windows 10
- Windows Server 2022
- Windows Server 2019
- Windows Server 2016
- Windows Server 2012 R2
- Windows Server 2012  

Review the [System requirements for Office](https://www.microsoft.com/microsoft-365/microsoft-365-and-office-resources) to determine which operating systems are supported by the volume licensed version of Office, Project, or Visio that you're deploying to users in your organization.

## Configure Active Directory-based activation

To configure Active Directory-based activation, you must have Domain Administrator and Enterprise Administrator credentials.

1. Sign in to a domain controller in Active Directory and use Server Manager to install the Volume Activation Services role.
2. Sign in to the [Volume Licensing Service Center](https://www.microsoft.com/licensing/servicecenter/default.aspx) and get your KMS key for your version of Office.
3. Download the appropriate Office Volume License Pack from the Microsoft Download Center:
    - [Office LTSC 2021 Volume License Pack](https://www.microsoft.com/download/details.aspx?id=103446)
    - [Office 2019 Volume License Pack](https://www.microsoft.com/download/details.aspx?id=57342)
    - [Office 2016 Volume License Pack](https://www.microsoft.com/download/details.aspx?id=49164)
1. Run the Office Volume License Pack executable file. This will install the Office Volume License Pack and opens the **Volume Activation Tools** wizard.
1. Choose **Next**, and then on the **Select Volume Activation Method** page, choose **Active Directory-Based Activation**.
1. On the **Manage Activation Objects** page, enter the KMS host key, which you got from the VLSC, and, optionally, give it a name. Then choose **Next**.
1. On the **Activate Product** page, either activate the KMS host key online or by phone, and then follow the rest of the wizard instructions.
1. When you're done, an **Activation Succeeded** page displays.

## Additional information about Active Directory-based activation

- Active Directory-based activation uses the same keys that are used by Key Management Service (KMS). However, Active Directory-based activation doesn't require a dedicated KMS host computer. The activation object is replicated across all the domain controllers in the Active Directory forest.
- A successful Active Directory-based activation of Office lasts for up to 180 days. The Software Protection service running on the computer periodically attempts to re-activate Office by querying Active Directory for the activation object. If Active Directory can't be contacted, Office will try to activate by using a discoverable KMS host computer.

## Related articles

- [Overview of volume activation of Office](plan-volume-activation-of-office.md)
- [GVLKs for KMS and Active Directory-based activation of Office, Project, and Visio](gvlks.md)
