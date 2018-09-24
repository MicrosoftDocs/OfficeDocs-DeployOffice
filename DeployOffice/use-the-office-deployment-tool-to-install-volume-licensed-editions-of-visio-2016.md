---
title: "Use the Office Deployment Tool to install volume licensed editions of Visio 2016 and Project 2016"
ms.author: danbrown
author: DHB-MSFT
manager: laurawi
ms.date: 1/17/2018
ms.audience: ITPro
ms.topic: get-started-article
ms.service: o365-proplus-itpro
localization_priority: Priority
ms.collection:
- Ent_O365
- Strat_O365_ProPlus
ms.custom: Ent_Office_ProPlus
ms.assetid: 82691bd7-a3d5-47ca-8d8a-0ee43ec2c01f
description: "You can use the Office Deployment Tool to install volume licensed editions of Visio 2016 and Project 2016 on the same computer with a Click-to-Run version of Office 2016. For example, you can install a volume licensed edition of Visio Standard 2016 on the same computer with Office 365 ProPlus."
---

# Use the Office Deployment Tool to install volume licensed editions of Visio 2016 and Project 2016

You can use the Office Deployment Tool to install volume licensed editions of Visio 2016 and Project 2016 on the same computer with a Click-to-Run version of Office 2016. For example, you can install a volume licensed edition of Visio Standard 2016 on the same computer with Office 365 ProPlus. 

The Office Deployment Tool uses Click-to-Run to do the installation, instead of using Windows Installer (MSI). But, Visio and Project are still activated by [volume activation methods](https://technet.microsoft.com/library/ee624358%28v=office.16%29.aspx), such as [Key Management Service (KMS)](https://technet.microsoft.com/library/dn385356%28v=office.16%29.aspx) or [Multiple Activation Key (MAK)](https://technet.microsoft.com/en-us/library/dn385359%28v=office.16%29.aspx). 

> [!IMPORTANT]
> MAK keys that you use for Windows Installer (MSI) installations of Visio and Project won't work with the Office Deployment Tool. You need a different MAK key to deploy volume licensed editions of Visio and Project with the Office Deployment Tool. To get that MAK key, log into the Volume Licensing Service Center (VLSC) and use the key listed under "C2R-P for use with the Office Deployment Tool." 

To begin, [download the most current version](https://go.microsoft.com/fwlink/p/?LinkID=626065) of the Office Deployment Tool from the Microsoft Download Center. Then, edit the Product element in the configuration.xml file, using the appropriate ID from the following table. To use a Generic Volume License Key (GVLK) for volume activation, use the appropriate value in the table for the PIDKEY attribute.

|**Edition**|**ID**|**PIDKEY**|
|:-----|:-----|:-----|
|Visio Standard 2016  <br/> |VisioStdXVolume  <br/> |NY48V-PPYYH-3F4PX-XJRKJ-W4423  <br/> |
|Visio Professional 2016  <br/> |VisioProXVolume  <br/> |69WXN-MBYV6-22PQG-3WGHK-RM6XC  <br/> |
|Project Standard 2016  <br/> |ProjectStdXVolume  <br/> |D8NRQ-JTYM3-7J2DX-646CT-6836M  <br/> |
|Project Professional 2016  <br/> |ProjectProXVolume  <br/> |WGT24-HCNMF-FQ7XH-6M8K7-DRTW9  <br/> |

You can also edit the Updates element in the configuration.xml file to determine how the installation of Visio or Project is updated. For example, you can configure it so that updates are automatically installed from the Office Content Delivery Network (CDN) on the Internet, which is the default, or from a file share on your local network.

If you're not familiar with the Office Deployment Tool, it's usually used to customize deployments of Click-to-Run versions of Office products, such as Office 365 ProPlus. For more information, see [Overview of the Office Deployment Tool](overview-of-the-office-2016-deployment-tool.md). 

Here's an example of a configuration.xml file that can be used to install a 64-bit version of Visio Professional 2016 in English from the Office CDN using a GVLK. 

```
<Configuration>
  <Add OfficeClientEdition="64" >
    <Product ID="VisioProXVolume" PIDKEY="69WXN-MBYV6-22PQG-3WGHK-RM6XC">
        <Language ID="en-us" />
     </Product>
   </Add>  
</Configuration>
```

For information about other settings, see [Configuration options for the Office Deployment Tool](configuration-options-for-the-office-2016-deployment-tool.md).

Then, use the Office Deployment Tool to download and install Visio or Project.

If you're using [shared computer activation](overview-of-shared-computer-activation-for-office-365-proplus.md) with Office 365 ProPlus, you need to be using at least Version 1701 of Office 365 ProPlus in order to install a volume licensed edition of Visio 2016 or Project 2016 on the same computer.


## Related topics
[Supported scenarios for installing different versions of Office, Visio, and Project on the same computer](https://technet.microsoft.com/library/mt712177%28v=office.16%29.aspx)

