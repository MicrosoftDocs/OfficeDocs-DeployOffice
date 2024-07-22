---
title: "Activate volume licensed versions of Office by using KMS"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: conceptual
ms.service: office-perpetual-itpro
ms.localizationpriority: medium
ms.collection: Tier2
description: "Provides Office admins with information about using Key Management Service (KMS) to activate volume licensed versions of Office, Project, and Visio."
ms.date: 04/19/2024
---

# Activate volume licensed versions of Office by using KMS

***Applies to:*** *Volume licensed versions of Office LTSC 2021, Office 2019, and Office 2016 (including Project and Visio)*  

All volume licensed versions of Office, including Project and Visio, have a Generic Volume License Key (GVLK) preinstalled. GVLKs support both Key Management Service (KMS) and Active Directory-based activation. On the KMS host computer configured to support volume activation of Office, you install and enable only one KMS host key to activate all volume licensed versions of Office.
  
If the KMS host computer is available and properly configured, activation of Office occurs transparently to the user. Office is activated the first time it runs, provided that there are at least four previous activation requests to the KMS host computer. This is because the KMS host computer requires at least five requests before it begins activating clients.
  
You don't have to do anything else to enable activation of Office by KMS. KMS clients can locate a KMS host computer automatically by querying DNS for service (SRV) resource records (RRs) that publish the KMS service. For more information, see [How DNS is used to find a KMS host computer](configure-dns-to-activate-office-by-using-kms.md#how-dns-is-used-to-find-a-kms-host-computer).

If the network environment doesn't use SRV RRs, you can manually assign a KMS client to use a specific KMS host computer by configuring the HKEY_LOCAL_MACHINE\\Software\\Microsoft\\OfficeSoftwareProtectionPlatform registry key on the KMS client. The KMS host computer name is specified by KeyManagementServiceName (REG_SZ), and the port is specified by KeyManagementServicePort (REG_SZ). The default port is 1688. These registry keys can also be set by using ospp.vbs script. For more information about the ospp.vbs script, see [Tools to manage volume activation of Office](tools-to-manage-volume-activation-of-office.md).
  
## Configure KMS host caching

You can configure whether or not the last used KMS host computer is saved to the cache on the KMS client. If the KMS host computer isn't cached, the KMS client queries DNS every time that activation is attempted. This means that the priority and weight parameters set for KMS host computers will be honored. If the KMS host computer is cached, the KMS client won't query DNS. Instead, it tries to contact the cached KMS host computer that last activated it successfully.

To configure KMS host caching, you can use the ospp.vbs script. For more information about the ospp.vbs script, see [Tools to manage volume activation of Office](tools-to-manage-volume-activation-of-office.md).
  
To configure KMS host caching, open an elevated command prompt on the KMS client computer and go to the Program Files\Microsoft Office\Office16 folder. If you installed the 32-bit version of Office on a 64-bit operating system, go to the Program Files (x86)\Microsoft Office\Office16 folder.  

To *disable* KMS host caching, type the following command, and then press ENTER:

```console
    cscript ospp.vbs /cachst:FALSE
```

To *enable* KMS host caching, type the following command, and then press ENTER:

```console
    cscript ospp.vbs /cachst:TRUE
```
  
## Check the license status of Office

The following table describes the license state of the Office with respect to activation.

|**License state**|**Description**|
|:-----|:-----|
|Licensed  |By default, the KMS client requests activation with the KMS host computer one time every seven days. (The number of days is configurable.) This design allows the maximum possible time for the client to be in the licensed state.  <br/> <br/>After the client is successfully activated, it remains in the licensed state for 180 days. When in the licensed state, users don't see any notification dialog boxes prompting them to activate the client. After 180 days, the activation attempt process resumes. If activation is continually successful, the whole activation experience is transparent to the user.  |
|Out-of-tolerance  |If activation doesn't occur during the 180-day period, Office goes into the out-of-tolerance state for 30 days. Users then see notifications that request activation.  |
|Unlicensed notification  |If activation doesn't occur during the out-of-tolerance state, Office goes into the unlicensed notification state. Users then see notifications that request activation and a red title bar.  |

You can use the ospp.vbs script with the /dstatusall option to check the license state for all Office clients. Or, use the /dstatus option to check the status of the local client. For more information about using the ospp.vbs script, see [Tools to manage volume activation of Office](tools-to-manage-volume-activation-of-office.md).
  
## Related articles

- [Overview of volume activation of Office](plan-volume-activation-of-office.md)
- [Configure a KMS host computer to activate volume licensed versions of Office](configure-a-kms-host-computer-for-office.md)
- [Configure DNS for activating volume licensed versions of Office by using KMS](configure-dns-to-activate-office-by-using-kms.md)
- [Tools to manage volume activation of Office](tools-to-manage-volume-activation-of-office.md)
- [GVLKs for KMS and Active Directory-based activation of Office, Project, and Visio](gvlks.md)
- [Volume Activation Management Tool (VAMT) Technical Reference](/windows/deployment/volume-activation/volume-activation-management-tool)