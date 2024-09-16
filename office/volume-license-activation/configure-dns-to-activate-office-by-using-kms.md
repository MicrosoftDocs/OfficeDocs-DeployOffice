---
title: "Configure DNS for activating volume licensed versions of Office by using KMS"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: conceptual
ms.service: office-perpetual-itpro
ms.localizationpriority: medium
ms.collection: Tier2
description: "Provides Office admins with information on how to configure DNS and Key Management Service (KMS) to activate volume licensed versions of Office, Project, and Visio."
ms.date: 09/18/2024
---

# Configure DNS for activating volume licensed versions of Office by using KMS

***Applies to:*** *Volume licensed versions of Office Long Term Service Channel (LTSC) 2024, Office LTSC 2021, Office 2019, and Office 2016 (including Project and Visio)*
  
To activate volume licensed versions of Office, including Project and Visio, by using Key Management Service (KMS), the KMS host computer for Office must be discoverable. The KMS host computer automatically publishes its existence by creating service (SRV) resource records (RRs) on the DNS server. But, only the first KMS host computer can create an SRV RR. When multiple computers run KMS, other KMS host computers can't modify or update SRV RRs unless the DNS server permissions are configured to allow these changes.

Changing the permissions on the DNS server requires administrative rights in the domain. You need to set up DNS as follows:
  
- Ensure that all computers running KMS are members of the same Active Directory Domain Services (AD DS) domain.
- Create a global security group in AD DS for the computers running KMS.
- Add each computer running KMS to the new security group.
- Set the permissions on the DNS server to enable updates by members of the newly created security group.

For more information, see [Configuring DNS](/previous-versions/tn-archive/ff793405(v=technet.10)).
  
## How DNS is used to find a KMS host computer

The first time that a KMS client queries DNS for KMS information, it randomly selects a KMS host computer from the list of SRV RRs that DNS returns. The address of a DNS server that contains the SRV RRs can be listed as a suffixed entry on KMS clients. This enables advertisement of SRV RRs for KMS in one DNS server and KMS clients that have other primary DNS servers to find it.
  
You can add priority and weight parameters to the DnsDomainPublishList registry value for KMS host computers. Doing so enables you to establish priority groupings and weighting within each group, which specifies the order in which to use KMS host computers and balances traffic among multiple KMS host computers. If you're using priority and weight parameters, we recommend that you disable KMS caching on the client. For more information, see [Configure KMS host caching](activate-office-by-using-kms.md#configure-kms-host-caching).
  
If the KMS host computer that a client selects doesn't respond, the KMS client removes that KMS host computer from its list of SRV RRs, and randomly selects another KMS host computer from the list. If the priority and weight parameters are set, the KMS client uses them while finding another KMS host computer. Otherwise, KMS host computers are selected randomly. After a KMS host computer responds, the KMS client caches the name of the KMS host computer and, if caching is enabled, uses it for successive activation and renewal attempts. If the cached KMS host computer doesn't respond on a later renewal, the KMS client discovers a new KMS host computer by querying DNS for KMS SRV RRs.
  
## Related articles

- [Configure a KMS host computer to activate volume licensed versions of Office](configure-a-kms-host-computer-for-office.md)
- [Activate volume licensed versions of Office by using KMS](activate-office-by-using-kms.md)