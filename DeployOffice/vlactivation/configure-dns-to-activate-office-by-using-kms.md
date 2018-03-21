---
title: "Set up DNS for Office 2016 KMS-based volume activation"
ms.author: danbrown
author: DHB-MSFT
manager: laurawi
ms.date: 12/20/2016
ms.audience: ITPro
ms.topic: get-started-article
ms.prod: office-perpetual-itpro
localization_priority: Normal
ms.collection: Ent_O365
ms.custom: Ent_Office_VL
ms.assetid: fbbc76b4-98dc-42ac-ae5b-37d41efda134
description: "How to configure DNS to work with Office 2016 KMS-based volume activation."
---

# Set up DNS for Office 2016 KMS-based volume activation

 **Summary:** How to configure DNS to work with Office 2016 KMS-based volume activation. 
  
 **Audience:** IT Professionals 
  
## Configure DNS for Office
<a name="BKMK_ConfigureDNS"> </a>

To activate Office 2016 by using Key Management Service (KMS), the Office KMS host computer must be discoverable. The KMS host computer automatically publishes its existence by creating service (SRV) resource records (RRs) on the DNS server. However, only the first KMS host computer can create an SRV RR. If there is more than one computer running KMS, subsequent KMS host computers cannot change or update SRV RRs unless the permissions on the DNS server are configured to allow this.
  
Changing the permissions on the DNS server requires administrative rights in the domain. You will need to set up DNS as follows:
  
- Ensure that all computers running KMS are members of the same Active Directory Domain Services (AD DS) domain.
    
- Create a global security group in AD DS for the computers running KMS.
    
- Add each computer running KMS to the new security group.
    
- Set the permissions on the DNS server to enable updates by members of the newly created security group.
    
For instructions about how to complete these tasks, see [Configuring DNS](https://go.microsoft.com/fwlink/p/?LinkId=238674).
  
## Client discovery of KMS
<a name="BKMK_ConfigureDNS"> </a>

The first time that a KMS client queries DNS for KMS information, it randomly selects a KMS host computer from the list of SRV RRs that DNS returns. The address of a DNS server that contains the SRV RRs can be listed as a suffixed entry on KMS clients. This enables advertisement of SRV RRs for KMS in one DNS server and KMS clients that have other primary DNS servers to find it.
  
You can add **priority** and **weight** parameters to the **DnsDomainPublishList** registry value for KMS host computers. Doing so enables you to establish priority groupings and weighting within each group, which specifies the order in which to use KMS hosts and balances traffic among multiple KMS hosts. If you are using priority and weight parameters, we recommend that you disable KMS caching on the client. For instructions, see [Turn KMS host caching on or off for Office KMS clients](activate-office-by-using-kms.md#KMSClientCacheOnOff).
  
If the KMS host computer that a client selects does not respond, the KMS client removes that KMS host from its list of SRV RRs and randomly selects another KMS host computer from the list. If the priority and weight parameters are set, the KMS client will use them while finding another KMS host computer. Otherwise, KMS host computers are selected randomly. After a KMS host computer responds, the KMS client caches the name of the KMS host computer and, if caching is enabled, uses it for successive activation and renewal attempts. If the cached KMS host computer does not respond on a later renewal, the KMS client discovers a new KMS host computer by querying DNS for KMS SRV RRs.
  
## See also
<a name="BKMK_ConfigureDNS"> </a>

#### 

[Volume activation of Office 2016](volume-activation-of-office.md)
  
[Prepare and set up the Office 2016 KMS host computer](configure-a-kms-host-computer-for-office.md)

