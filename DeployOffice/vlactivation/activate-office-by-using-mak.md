---
title: "Activate Office 2016 MAK clients"
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
ms.assetid: 9ce2cb47-dc27-4e5e-acb7-195b004798e2
description: "How to prepare and configure the Office 2016 client for Multiple Activation Key (MAK) volume activation."
---

# Activate Office 2016 MAK clients

 **Summary:** How to prepare and configure the Office 2016 client for Multiple Activation Key (MAK) volume activation. 
  
 **Audience:** IT Professionals 
  
Multiple Activation Key (MAK) activation is used for one-time activation through Microsoft hosted activation services, either via the Internet or by telephone.
  
## Activate MAK clients

If you use MAK, you must enter the key by using one of the following supported methods:
  
- Before you install Office 2016
    
  - [Use the Office Customization Tool (OCT) to activate a MAK client](activate-office-by-using-mak.md#BKMK_OCT)
    
  - [Enter a multiple activation key by using the Config.xml file](activate-office-by-using-mak.md#BKMK_ConfigXML)
    
- After you install Office 2016
    
  - [Changing the MAK product key](activate-office-by-using-mak.md#BKMK_VAMT)
    
  - [The ospp.vbs script](activate-office-by-using-mak.md#BKMK_osppvbs)
    
  - [Registry entry that allows a non-admin user to activate an Office MAK key](activate-office-by-using-mak.md#BKMK_Backstage)
    
> [!IMPORTANT]
> Because different products require different multiple activation keys, you should first verify that the key for the product is correct. 
  
<a name="BKMK_OCT"> </a>

### Use the Office Customization Tool (OCT) to activate a MAK client

Remember that you do not have to enter a product key in the OCT if you are using KMS activation. For more information about the OCT, see [Office Customization Tool (OCT) in Office 2013](https://technet.microsoft.com/library/8faae8a0-a12c-4f7b-839c-24a66a531bb5.aspx). (Although this article is for an earlier version of Office, the information also applies to Office 2016.) 
  
To enter a MAK key by using the OCT, follow these steps:
  
1. In the OCT, go to the **Licensing and user interface** page. 
    
2. Select **Enter another product key**, and then in the **Product key** field, enter the multiple activation key (five sets of five numbers or characters). 
    
3. After making any other necessary changes in the OCT, save the .msp file in the Updates folder.
    
> [!NOTE]
> You can activate Office 2016 automatically when you install by setting the AUTO_ACTIVATE property value to 1. For more information, see [Setting element](https://technet.microsoft.com/library/e16af71c-fed4-40da-a886-95e596c3999e.aspx#ElementSetting). (Although this article is for an earlier version of Office, the information also applies to Office 2016.) 
  
<a name="BKMK_ConfigXML"> </a>

### Enter a multiple activation key by using the Config.xml file

To enter a multiple activation key by using the ([Config.xml file](https://technet.microsoft.com/library/e16af71c-fed4-40da-a886-95e596c3999e.aspx)), follow these steps:
  
1. Add the following line to the Config.xml file:
    
    **\<PIDKEY Value="AAAAABBBBBCCCCCDDDDDEEEEE" /\>**
    
    Where  _AAAAABBBBBCCCCCDDDDDEEEEE_ is the 25-character product key. 
    
2. To apply the settings in Config.xml, at a command prompt, type the following command, and then press ENTER:
    
    **Setup.exe /config \<path of Config.xml file\>**
    
> [!NOTE]
> You can activate Office 2016 automatically when you install by setting the AUTO_ACTIVATE property value to 1. For more information, see [Setting element](https://technet.microsoft.com/library/e16af71c-fed4-40da-a886-95e596c3999e.aspx#ElementSetting). (Although this article is for an earlier version of Office, the information also applies to Office 2016.)  
  
<a name="BKMK_VAMT"> </a>

### Changing the MAK product key

If you have to change the product key on multiple Office 2016 clients after installation, we recommend that you use Volume Activation Management Tool (VAMT) 3.0. For more information about VAMT 3.0, see [Volume Activation Management Tool Technical Reference](https://go.microsoft.com/fwlink/p/?LinkId=251932).
  
To change the product key on one computer only:
  
1. Open an Office 2016 application.
    
2. Choose the **File** tab. 
    
3. Choose **Account**.
    
4. Choose **Change Product Key** and enter the product key. 
    
<a name="BKMK_osppvbs"> </a>

### The ospp.vbs script

For information about how to enter a product key by using the **ospp.vbs** script, see [The ospp.vbs script](tools-to-manage-volume-activation-of-office.md#ospp).
  
<a name="BKMK_Backstage"> </a>

### Registry entry that allows a non-admin user to activate an Office MAK key

An administrator can create a registry key that allows a standard user (a user who is not an administrator) to apply a MAK key and activate an Office 2016 application. This means that a standard user can switch a KMS client to MAK activation, manually activate a computer, and, if it is necessary, replace an existing MAK with a new MAK key. By default, all volume license editions of Office 2016 disable this behavior. To enable this behavior, add the following line to the Config.xml file:
  
 **\<Setting Id="USEROPERATIONS" Value="1" /\>**
  
Or, you can set the following registry key to enable or disable standard user (a user who is not an administrator) activation:
  
 **HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\OfficeSoftwareProtectionPlatform**
  
Enable Standard User Activation: "UserOperations"=dword:00000001
  
Disable Standard User Activation: "UserOperations"=dword:00000000
  
Disable Standard User Activation is the default volume license products setting for Office 2016.
  
## Related topics
[Plan volume activation of Office 2016](plan-volume-activation-of-office.md)

