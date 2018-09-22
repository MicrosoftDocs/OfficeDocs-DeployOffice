---
title: "Plan volume activation of Office 2016"
ms.author: danbrown
author: DHB-MSFT
manager: laurawi
ms.date: 9/24/2018
ms.audience: ITPro
ms.topic: get-started-article
ms.prod: office-perpetual-itpro
localization_priority: Normal
ms.collection: Ent_O365
ms.custom: Ent_Office_VL
description: "Explains each method that you can use to activate volume license editions of Office 2016."
---

# Plan volume activation of Office 2016

***Applies to:*** *Volume licensed versions of Office 2019 and Office 2016, including Project and Visio*

  
You plan the deployment of Office for volume activation of Office 2016 in several steps. Before you read this article, we recommend that you read [Windows Volume Activation Planning Guide](https://go.microsoft.com/fwlink/p/?LinkId=183040).
  
|||
|:-----|:-----|
|![Are you a user?](../images/e9b1eeb1-6712-4af3-9bd4-4b8e3cbc85d4.jpg)           <br/> |If you are a user activating a personal copy of Office 2016, follow the [Activate Office 365, Office 2016, or Office 2013](https://support.office.com/article/5bd38f38-db92-448b-a982-ad170b1e187e) directions instead.  <br/> |
|![Are you an admin?](../images/450333cb-3c0b-433f-9b74-65bbb5a4f274.jpg)           <br/> |If you are an admin planning to activate and license Office 365 ProPlus, review the [Overview of licensing and activation in Office 365 ProPlus](../overview-of-licensing-and-activation-in-office-365-proplus.md) instead.  <br/> <br/>  If you are an admin planning to activate and license volume license edition of Office 2016, you're at the right place, keep reading.  <br/> |

Microsoft policy requires the activation of all editions of Office 2016 client software, including volume license editions. For Office 2016, volume activation occurs through Office Activation Technologies, which are based on the Software Protection Platform (SPP) that is used in Windows 7, Windows Server 2008 R2, Windows 8, Windows 8.1, Windows Server 2012 and Windows Server 2012 R2. Office Activation Technologies provides three activation methods for Office 2016: 
  
 - [Key Management Service (KMS)](plan-volume-activation-of-office.md#kms)
    
 - [Multiple Activation Key (MAK)](plan-volume-activation-of-office.md#mak)
    
 - [Active Directory-Based Activation (ADBA)](plan-volume-activation-of-office.md#ADDSActivation)

The model that you choose depends on the size, network infrastructure, connectivity, and security requirements in your environment.  

    
<a name="BK_Planadeploymnet"> </a>
## Plan a volume license deployment

Planning an Office 2016 deploying requires the same considerations as planning a Windows deployment of Windows 7, Windows Server 2008 R2, Windows 8, or Windows Server 2012. To help determine which activation method to use for Windows, see the [Windows Volume Activation Planning Guide](https://go.microsoft.com/fwlink/p/?LinkId=183040). Most likely, Office 2016 will use the same method.
  
A volume activation deployment includes the following steps:
  
1. Learn about product activation.
    
2. Review available activation models.
    
3. Evaluate client connectivity.
    
4. Map the physical computer or virtual computer to an activation method.
    
5. Determine product key needs.
    
6. Determine monitoring and reporting needs.
    
Most of the information about these steps is covered in the [Windows Volume Activation Planning Guide](https://go.microsoft.com/fwlink/p/?LinkId=183040). This article describes an overview of the technology.
  
When you plan for Office Activation Technologies, think about the following:
  
- The Key Management Service (KMS) activation threshold for Office 2016 is five computers. This means that Office 2016 client computers will be activated only after five or more client computers have requested activation.
    
- You do not have to enter a product key for Office 2016 KMS client computers. You only have to enter an activation key on the KMS host computer.
    
    The same is true for client computers in an Active Directory Domain Services (AD DS)-based deployment.
    
- If you decide to use Multiple Activation Key (MAK), you enter the product key either through the [Office Customization Tool (OCT)](https://technet.microsoft.com/library/8faae8a0-a12c-4f7b-839c-24a66a531bb5.aspx#Licensing_and_user_interface) or the [Config.xml file](https://technet.microsoft.com/library/e16af71c-fed4-40da-a886-95e596c3999e.aspx#ElementPIDKey). ((Although these articles are for an earlier version of Office, the information also applies to Office 2016.) After Office 2016 installation, you can change the product key by using the Volume Activation Management Tool (VAMT) or the Office Software Protection Platform script ( **ospp.vbs** ). For more information about **ospp.vbs**, see [The ospp.vbs script](tools-to-manage-volume-activation-of-office.md#ospp).
    
    For information about VAMT 3.0, see [Volume Activation Management Tool (VAMT)](tools-to-manage-volume-activation-of-office.md#vamt).
    
<a name="review"> </a>

## Review and compare activation methods


Office Activation Technologies provides three activation methods for Office 2016: KMS, MAK, and AD DS-based activation.
  
- **Key Management Service (KMS)** A client-server model in which you must install and activate a KMS host activation key on a KMS host computer. This establishes a local activation service in your environment. Office 2016 client computers connect to the local Office 2016 KMS host for activation. 
    
- **Multiple Activation Key (MAK)** If you use MAK, Office 2016 client computers are activated online by using the Microsoft-hosted activation servers or by telephone. 
    
- **AD DS-based activation** Available only for Office 2016 on Windows 8 and Windows Server 2012. AD DS-based activation can activate all Office 2016 volume license clients throughout a domain. You set up AD DS-based activation from either a Windows 8 volume license edition computer or a Windows Server 2012 computer. 
    
The kind of key that you install determines the activation method. All Office 2016 volume license editions have the KMS client key pre-installed. You do not have to enter a product key if you are deploying KMS clients. If you want to use MAK activation, you have to enter the correct MAK.
  
You can also use a combination of KMS and MAK within your deployment. For example, Office 2016 running on desktops that are connected to the corporate network has the KMS client key installed, whereas Office 2016 running on portable computers has the MAK installed.
  
The model that you choose depends on the size, network infrastructure, connectivity, and security requirements in your environment. You can choose to use only one or a combination of these activation methods. Typically on a client computer, you would use the same activation method for a particular instance of Windows that you use for Office. For more information about how to decide which activation method to use, see the [Windows Volume Activation Planning Guide](https://go.microsoft.com/fwlink/p/?LinkId=183040).
  
To find out more about how to buy volume license editions of Office 2016, see [Microsoft Office Volume Licensing Buyer's Guide](https://www.microsoft.com/en-us/licensing/product-licensing/office.aspx).
 
<a name="kms"> </a> 

## Key Management Service (KMS)

KMS is a client-server model in which each client requests activation from a computer serving as the KMS host computer. By default, clients connect to the KMS host computer on port 1688. The KMS host computer uses DNS to publish the KMS service. You can either use the default settings, which require little or no administrative action, or manually configure the KMS host computer and clients based on the network configuration and security requirements in your environment. To be licensed, each client must be activated.
  
You must prepare a KMS host computer by first installing the licensing files (see [Prepare and set up the Office 2016 KMS host computer](configure-a-kms-host-computer-for-office.md)), and then activating the KMS host key before it can accept activation requests from client computers. 
  
### Publication of Key Management Service

 KMS uses service (SRV) resource records (RRs) in DNS to store and communicate the locations of KMS host computers. KMS host computers use dynamic updates, if available, to publish the SRV RRs. For more information, see [Dynamic update](https://go.microsoft.com/fwlink/p/?LinkId=317385). If dynamic updates are not available, or if the KMS host computer does not have permissions to publish the RRs, you must publish the DNS records manually or configure client computers to connect to specific KMS host computers. This might require changing permissions on DNS to let more than one KMS host computer publish SRV records.
  
> [!NOTE]
> DNS changes might take time to propagate to all DNS hosts, depending on the complexity and topology of your network. For more information, see [Set up DNS for Office 2016 KMS-based volume activation](configure-dns-to-activate-office-by-using-kms.md). 
  
<a name="mak"> </a>

## Multiple Activation Key (MAK)

MAK is used for one-time activation with the Microsoft hosted activation services. Each MAK has a predetermined number of allowed activations. This number is based on volume licensing agreements and may not match the organization's exact license count. Each activation that uses MAK with the Microsoft hosted activation service counts toward the activation limit. After Office 2016 is activated, no re-activation is required unless the hardware changes significantly.
  
There are two ways to activate computers by using MAK:
  
- **MAK independent activation** MAK independent activation requires that each computer independently connect and be activated with Microsoft, either over the Internet or by telephone. MAK independent activation is best for computers that do not maintain a connection to the corporate network. 
    
- **MAK proxy activation by using VAMT** This enables a centralized activation request on behalf of multiple computers that have one connection to Microsoft. MAK proxy activation is configured by using the [Volume Activation Management Tool (VAMT)](tools-to-manage-volume-activation-of-office.md#vamt). MAK proxy activation is appropriate for environments in which security concerns might restrict direct access to the Internet or the corporate network. It is also suited for development and test labs that do not have this connectivity.
    
#### MAK architecture

MAK activation requires that a MAK is installed on a client computer and instructs that computer to activate itself against Microsoft hosted activation servers over the Internet. In MAK proxy activation, a MAK must be installed on the client computer by any of the methods previously described. VAMT obtains the installation ID (IID) from the target computer, sends the IID to Microsoft on behalf of the client, and obtains a confirmation ID (CID). The tool then activates the client by installing the CID. The CID is saved and can be used later, for example, to activate test computers that were re-imaged after 90 days.
  
For more information, see [Activate Office 2016 MAK clients](activate-office-by-using-mak.md).
  
<a name="ADDSActivation"> </a>

## Active Directory Domain Services-based activation

As with KMS, AD DS-based activation can activate all Office 2016 volume license clients within the domain. To use AD DS-based activation, you configure AD DS from one computer to support the activation of all Office 2016 volume license clients within the domain.
  
AD DS-based activation uses the same GVLK/KMS host key pair that KMS activation uses. When you use AD DS-based activation, the Software Protection Platform Services periodically attempts to activate the GVLK against either an activation object in AD DS or a discoverable KMS if the AD DS-based activation attempt fails. A successful AD DS-based activation grants a license to the Office 2016 client for 180 days.
  
For more information about AD DS-based activation, see [Active Directory Domain Services-based activation of Office 2016](activate-office-by-using-active-directory.md).
  
