---
title: "Activate volume licensed versions of Office by using MAK"
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
description: "Provide admins with inforrmation on how to activate volume licensed versions of Office by using Multiple Activation Key (MAK)."
---

# Activate volume licensed versions of Office by using MAK

 ***Applies to:*** *Volume licensed versions of Office 2019 and Office 2016, including Project and Visio*

  
Multiple Activation Key (MAK) activation is used for one-time activation through Microsoft-hosted activation services, either via the internet or by telephone. 


## Activate Office 2019 by using MAK

If you're using MAK to activate volume licensed versions of Office 2019, you specify the key in the configuration.xml file used by the Office Deployment Tool when you deploy Office 2019 to the users in your organization. For more information, see [Deploy Office 2019 (for IT Pros)](../office2019/deploy.md).


 
## Activate Office 2016 by using MAK

If you're using MAK to activate volume licensed versions of Office 2016, you can enter the key by using one of the following supported methods:
  
- Before you install Office 2016, you can use the [Office Customization Tool (OCT)](activate-office-by-using-mak.md#OCT) or the [Config.xml file](activate-office-by-using-mak.md#ConfigXML).
    
- After you install Office 2016, you can use the [product UI](activate-office-by-using-mak.md#OCT), the [Volume Activation Management Tool (VAMT) 3.1](https://docs.microsoft.com/windows/deployment/volume-activation/use-the-volume-activation-management-tool-client), the [ospp.vbs script](tools-to-manage-volume-activation-of-office.md#ospp), or [enable a non-admin user to activate using MAK](activate-office-by-using-mak.md#registry).
        
    
<a name="OCT"> </a>

### Configure MAK activation in the Office Customization Tool (OCT)

To enter a MAK key by using the Office Customization Tool (OCT), follow these steps:
  
1. In the OCT, go to the **Licensing and user interface** page. 
    
2. Select **Enter another product key**, and then in the **Product key** field, enter the multiple activation key (five sets of five numbers or characters). 
    
3. After making any other necessary changes in the OCT, save the .msp file in the Updates folder.
    
> [!NOTE]
> - For more information, see [Office Customization Tool (OCT) 2016 Help: Overview](../oct/oct-2016-help-overview.md) and [Office Customization Tool (OCT) 2016 Help: Licensing and user interface](../oct/oct-2016-help-licensing-and-user-interface.md).
> - You can activate Office 2016 automatically when you install by setting the AUTO_ACTIVATE property value to 1 in the Config.xml file. For more information, see [Setting element](https://docs.microsoft.com/previous-versions/office/office-2013-resource-kit/cc179195(v=office.15)#setting-element). *(Even though this article is for an earlier version of Office, the information also applies to Office 2016.)*
  
<a name="ConfigXML"> </a>

### Configure MAK activation in the Config.xml file

To enter a multiple activation key by using the Config.xml file, follow these steps:
  
1. Add the following line to the Config.xml file:
    
```
    \<PIDKEY Value="AAAAABBBBBCCCCCDDDDDEEEEE" /\>**
```
    
   Replace *AAAAABBBBBCCCCCDDDDDEEEEE* with your 25-character product key. 
    
2. To apply the settings in Config.xml, at a command prompt, type the following command, and then press ENTER:
  
```  
    Setup.exe /config \<path of Config.xml file\>
```
    
> [!NOTE]
> - For more information about the Config.xml file, see [Config.xml file reference](https://docs.microsoft.com/en-us/previous-versions/office/office-2013-resource-kit/cc179195%28v%3doffice.15%29). *(Even though this article is for an earlier version of Office, the information also applies to Office 2016.)*
> - You can activate Office 2016 automatically when you install by setting the AUTO_ACTIVATE property value to 1 in the Config.xml file. For more information, see [Setting element](https://docs.microsoft.com/previous-versions/office/office-2013-resource-kit/cc179195(v=office.15)#setting-element). *(Even though this article is for an earlier version of Office, the information also applies to Office 2016.)* 
  
<a name="UI"> </a>

### Change the key by using the product UI

  
To change the Office 2016 product key on only one computer:
  
1. Open an Office 2016 application, such as Word.
2. Go to **File** > **Account**.
3. Choose **Change Product Key** and enter the product key. 
 
If you need to change the Office 2016 product key on multiple computers after Office is installed, we recommend that you use Volume Activation Management Tool (VAMT) 3.1. For more information, see [Use the Volume Activation Management Tool](https://docs.microsoft.com/windows/deployment/volume-activation/use-the-volume-activation-management-tool-client).
    
 
<a name="registry"> </a>

### Enable a non-admin user to activate an Office by using MAK

An administrator can create a registry key that allows a standard user (that is, a user who isn't an administrator) to activate Office 2016 by using MAK. By default, volume licensed versions of Office 2016 disable this behavior. 

This can be used if you want a user to manually activate Office by using MAK, replace an existing key with a new key, or switch from KMS to MAK activation.

To enable this behavior, add the following line to the Config.xml file:

```  
 **\<Setting Id="USEROPERATIONS" Value="1" /\>**
```

Or, you can set the HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\OfficeSoftwareProtectionPlatform registry key to enable or disable standard user activation
  
 - To enable: "UserOperations"=dword:00000001
 - To disable: "UserOperations"=dword:00000000
  
> [!NOTE]
> For more information about the Config.xml file, see [Config.xml file reference](https://docs.microsoft.com/en-us/previous-versions/office/office-2013-resource-kit/cc179195%28v%3doffice.15%29). *(Even though this article is for an earlier version of Office, the information also applies to Office 2016.)*
  
## Related topics

- [Plan volume activation of Office](plan-volume-activation-of-office.md)
- [Tools to manage Office volume activation](tools-to-manage-volume-activation-of-office.md)

