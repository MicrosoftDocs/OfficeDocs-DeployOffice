---
title: "Activate volume licensed versions of Office by using KMS"
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
description: "Describes the activation process for KMS volume license editions of Office 2016 on client computers."
---

# Activate volume licensed versions of Office by using KMS

***Applies to:*** *Volume licensed versions of Office 2019 and Office 2016, including Project and Visio*

  
> [!IMPORTANT]
> This information applies to volume license editions of Office 2016. It does not apply to Office 365 ProPlus. Office 365 ProPlus is licensed through a subscription. If you are an admin and you want to activate Office 365 ProPlus for your company, review the [Overview of licensing and activation in Office 365 ProPlus](../overview-of-licensing-and-activation-in-office-365-proplus.md) instead. 
  
To find out more about how to buy volume license editions of Office 2016, see [Microsoft Office Volume Licensing Buyer's Guide](https://www.microsoft.com/en-us/licensing/product-licensing/office.aspx).
  
On the client computer, the appropriate product key for your specific activation method is installed automatically with the volume license edition of Office 2016.
  
If you deploy an image or create a virtual computer, you must rearm the installation of Office 2016 before you capture the image or create the virtual computer. For information about how to capture an image, see [Configure Office 2010 for capturing an image](https://technet.microsoft.com/library/cc178964.aspx). (Although this article is for an earlier version of Office, the information also applies to Office 2016.) For information about how to rearm an Office 2016 installation, see [Rearm a volume licensed version of Office](rearm-an-office-installation-on-an-image-when-using-kms-to-activate.md).
  
## Activate KMS clients for Office 2016

All volume license editions of Office 2016 have a [Generic Volume License Key (GVLK)](gvlks.md) preinstalled. GVLKs support both KMS and Active Directory-based activation. 
  
On the Office 2016 KMS host computer, you install and enable only one KMS host key to activate all volume license editions of Office 2016 KMS clients. If the Office 2016 KMS host computer is installed and configured, KMS activation occurs transparently to the user when an Office 2016 client is first installed.
  
The client activates at the first launch of Office 2016, provided that there have been at least four previous activation requests to the KMS host computer. This is because the KMS host computer requires at least five requests before it begins activating clients.
  
You do not have to do anything else to set up the clients. KMS clients can locate a KMS host computer automatically by querying DNS for service (SRV) resource records (RRs) that publish the KMS service. If the network environment does not use SRV RRs, you can manually assign a KMS client to use a specific KMS host computer by configuring the following registry key on the KMS client:
  
 **HKLM\Software\Microsoft\OfficeSoftwareProtectionPlatform**
  
The KMS host name is specified by **KeyManagementServiceName** (REG_SZ), and the port is specified by **KeyManagementServicePort** (REG_SZ). The default port is **1688**. These registry keys can also be set through the **ospp.vbs** script. For more information about **ospp.vbs**, see [The ospp.vbs script](tools-to-manage-volume-activation-of-office.md#ospp).
  
For additional configuration options, such as how to specify the KMS host name on the KMS client, or to change the KMS key to a MAK key, see [Tools to manage volume activation of Office](tools-to-manage-volume-activation-of-office.md).
  
<a name="KMSClientCacheOnOff"> </a>

## Configure KMS host caching

Use the ospp.vbs script to configure whether or not the last used KMS host computer is saved to the cache on the KMS client. If the KMS host computer is not saved cached, the client will query DNS every time that activation is tried. This means that the priority and weight parameters set for KMS host computers will be honored. If the KMS host computer is cached, the KMS client will attempt to directly contact the cached KMS host computer that last resulted in successful activation. For more information about the ospp.vbs script, see [Tools to manage volume activation of Office](tools-to-manage-volume-activation-of-office.md).
  
### To turn off KMS host caching on the KMS client

1. On the KMS client computer, run an elevated command prompt.
    
2. Change to the folder that contains the ospp.vbs script. For example:
    
     cd c:\Program Files (x86)\Microsoft Office\Office16
    
    or:
    
     cd c:\Program Files\Microsoft Office\Office16
    
3. Type the following command, and then press ENTER:
    
    **cscript ospp.vbs /cachst:FALSE**
    
### To turn on KMS host caching for Office KMS clients

1. On the KMS client computer, run an elevated command prompt.
    
2. Change to the folder that contains the ospp.vbs script. For example:
    
     cd c:\Program Files (x86)\Microsoft Office\Office16
    
    or:
    
     cd c:\Program Files\Microsoft Office\Office16
    
3. Type the following command, and then press ENTER:
    
    **cscript ospp.vbs /cachst:TRUE**
    
## Check the license status of Office 2016 KMS clients

The following table describes the license state of the Office 2016 client with respect to activation.
  
**License state of the Office 2016 KMS client**

|**License state**|**Description**|
|:-----|:-----|
|Licensed  <br/> |By default, the KMS client requests activation with the KMS host one time every seven days. (The number of days is configurable.) This design allows the maximum possible time for the client to be in the licensed state.  <br/> <br/>After the client is successfully activated, it remains in the licensed state for 180 days. When in the licensed state, users do not see any notification dialog boxes prompting them to activate the client. After 180 days, the activation attempt process resumes. If activation is continually successful, the whole activation experience is transparent to the end-user.  <br/> |
|Out-of-tolerance  <br/> |If activation does not occur during the 180-day period, Office 2016 goes into the out-of-tolerance state for 30 days. Users then see notifications that request activation.  <br/> |
|Unlicensed notification  <br/> |If activation does not occur during the out-of-tolerance state, Office 2016 goes into the unlicensed notification state. Users then see notifications that request activation and a red title bar.  <br/> |
   
You use the ospp.vbs script with the **/dstatusall** option to check the license state for all Office clients. Use the **/dstatus** option to check the status of the local client. For more information about using the ospp.vbs script, see [Tools to manage volume activation of Office](tools-to-manage-volume-activation-of-office.md).
  
### To check the license state for installed Office licenses

1. On the KMS client computer, run an elevated command prompt.
    
2. Change to the folder that contains the ospp.vbs script. For example:
    
     cd c:\Program Files (x86)\Microsoft Office\Office16
    
    or:
    
     cd c:\Program Files\Microsoft Office\Office16
    
3. To check the status for all installed licenses, type the following command, and then press ENTER:
    
    **cscript ospp.vbs /dstatusall**
    
4. To check the status only for the local client's installed license, type the following command, and then press ENTER:
    
    **cscript ospp.vbs /dstatus**
    
## Related topics

- [Plan volume activation of Office](plan-volume-activation-of-office.md)
- [Configure DNS for activating volume licensed versions of Office by using KMS](configure-dns-to-activate-office-by-using-kms.md)
- [Volume Activation Management Tool (VAMT) Technical Reference](https://docs.microsoft.com/windows/deployment/volume-activation/volume-activation-management-tool)

