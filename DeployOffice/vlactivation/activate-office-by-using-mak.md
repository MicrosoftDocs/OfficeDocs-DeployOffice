---
title: "Activate volume licensed versions of Office by using MAK"
ms.author: danbrown
author: DHB-MSFT
manager: dougeby
audience: ITPro
ms.topic: article
ms.service: office-perpetual-itpro
ms.localizationpriority: medium
ms.collection: tier2
description: "Provides Office admins with information about using Multiple Activation Key (MAK) to activate volume licensed versions of Office, Project, and Visio."
ms.date: 03/20/2018
---

# Activate volume licensed versions of Office by using MAK

***Applies to:*** *Volume licensed versions of Office LTSC 2021, Office 2019, and Office 2016 (including Project and Visio)*
  
Multiple Activation Key (MAK) activation is used for one-time activation through Microsoft-hosted activation services, either via the internet or by telephone. MAK activation requires that a MAK is installed on a client computer and instructs that computer to activate itself against those services.

Each MAK has a predetermined number of allowed activations and is based on your volume licensing agreement. Each Office activation that uses MAK counts toward the activation limit. After Office is activated, no re-activation is required unless the hardware changes significantly.

There are two ways to activate computers by using MAK:
  
- *MAK independent activation* requires that each computer independently connect and be activated with Microsoft, either over the internet or by telephone. MAK independent activation is best for computers that have direct access to the internet.

- *MAK proxy activation by using VAMT* enables one computer with internet access to process activation requests on behalf of multiple computers. MAK proxy activation is configured by using the [Volume Activation Management Tool (VAMT)](/windows/deployment/volume-activation/volume-activation-management-tool). MAK proxy activation is appropriate for environments in which security concerns might restrict direct access to the internet or to development and test labs. For more information, see [Perform Proxy Activation](/windows/deployment/volume-activation/proxy-activation-vamt).

## Activate Office LTSC 2021 by using MAK

If you're using MAK to activate Office LTSC 2021, you specify the key in the configuration.xml file used by the Office Deployment Tool when you deploy Office LTSC 2021 to the users in your organization. For more information, see [Deploy Office LTSC 2021](../ltsc2021/deploy.md).

## Activate Office 2019 by using MAK

If you're using MAK to activate volume licensed versions of Office 2019, you specify the key in the configuration.xml file used by the Office Deployment Tool when you deploy Office 2019 to the users in your organization. For more information, see [Deploy Office 2019 (for IT Pros)](../office2019/deploy.md).

## Activate Office 2016 by using MAK

If you're using MAK to activate volume licensed versions of Office 2016, you can enter the key by using one of the following supported methods:
  
- Before you install Office 2016, you can use the [Office Customization Tool (OCT)](#configure-mak-activation-in-the-office-customization-tool-oct) or the [Config.xml file](#configure-mak-activation-in-the-configxml-file).

- After you install Office 2016, you can use the [product UI](#change-the-key-by-using-the-product-ui), the [Volume Activation Management Tool (VAMT)](/windows/deployment/volume-activation/volume-activation-management-tool), the [ospp.vbs script](tools-to-manage-volume-activation-of-office.md#the-osppvbs-script), or [enable a non-admin user to activate Office using MAK](#enable-a-non-admin-user-to-activate-office-by-using-mak).

### Configure MAK activation in the Office Customization Tool (OCT)

To enter a MAK key by using the Office Customization Tool (OCT), follow these steps:
  
1. In the OCT, go to the **Licensing and user interface** page.

2. Select **Enter another product key**, and then in the **Product key** field, enter the multiple activation key (five sets of five numbers or characters).

3. After making any other necessary changes in the OCT, save the .msp file in the Updates folder.

> [!NOTE]
> - For more information, see [Office Customization Tool (OCT) 2016 Help: Overview](../oct/oct-2016-help-overview.md) and [Office Customization Tool (OCT) 2016 Help: Licensing and user interface](../oct/oct-2016-help-licensing-and-user-interface.md).
> - You can activate Office 2016 automatically when you install by setting the AUTO_ACTIVATE property value to 1 in the Config.xml file. For more information, see [Setting element](/previous-versions/office/office-2013-resource-kit/cc179195(v=office.15)#setting-element). *(Even though this article is for an earlier version of Office, the information also applies to Office 2016.)*

### Configure MAK activation in the Config.xml file

To enter a multiple activation key by using the Config.xml file, follow these steps:
  
1. Add the following line to the Config.xml file:

```xml
    <PIDKEY Value="AAAAABBBBBCCCCCDDDDDEEEEE" />
```

   Replace *AAAAABBBBBCCCCCDDDDDEEEEE* with your 25-character product key.

2. To apply the settings in Config.xml, at a command prompt, type the following command, and then press ENTER:
  
```console  
    Setup.exe /config <path of Config.xml file>
```

> [!NOTE]
> - For more information about the Config.xml file, see [Config.xml file reference](/previous-versions/office/office-2013-resource-kit/cc179195(v=office.15)). *(Even though this article is for an earlier version of Office, the information also applies to Office 2016.)*
> - You can activate Office 2016 automatically when you install by setting the AUTO_ACTIVATE property value to 1 in the Config.xml file. For more information, see [Setting element](/previous-versions/office/office-2013-resource-kit/cc179195(v=office.15)#setting-element). *(Even though this article is for an earlier version of Office, the information also applies to Office 2016.)*
  
### Change the key by using the product UI
  
To change the Office 2016 product key on only one computer:
  
1. Open an Office 2016 application, such as Word.
2. Go to **File** > **Account**.
3. Choose **Change Product Key** and enter the product key.
 
If you need to change the Office 2016 product key on multiple computers after Office is installed, we recommend that you use Volume Activation Management Tool (VAMT) 3.1. For more information, see [Volume Activation Management Tool (VAMT) Technical Reference](/windows/deployment/volume-activation/volume-activation-management-tool).

### Enable a non-admin user to activate Office by using MAK

An administrator can create a registry key that allows a standard user (that is, a user who isn't an administrator) to activate Office 2016 by using MAK. By default, volume licensed versions of Office 2016 disable this behavior.

This can be used if you want a user to manually activate Office by using MAK, replace an existing key with a new key, or switch from KMS to MAK activation.

To enable this behavior, add the following line to the Config.xml file:

```xml
 <Setting Id="USEROPERATIONS" Value="1" />
```

Or, you can set the HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\OfficeSoftwareProtectionPlatform registry key to enable or disable standard user activation
  
 - To enable, set "UserOperations"=dword:00000001
 - To disable, set "UserOperations"=dword:00000000
  
> [!NOTE]
> For more information about the Config.xml file, see [Config.xml file reference](/previous-versions/office/office-2013-resource-kit/cc179195(v=office.15)). *(Even though this article is for an earlier version of Office, the information also applies to Office 2016.)*

## Deploying multiple MAK keys

In some organizations, different groups have different MAK keys for their volume licensed versions of Office, Project, or Visio. Unfortunately, you can't include multiple MAK keys in the same configuration.xml file (for Office LTSC 2021 or Office 2019) or in the Office Customization Tool or config.xml file (for Office 2016).

If you don't want to create separate XML files for each group, you could use one of these other methods:

- [Volume Activation Management Tool (VAMT)](/windows/deployment/volume-activation/volume-activation-management-tool)
- [ospp.vbs script](tools-to-manage-volume-activation-of-office.md#the-osppvbs-script)
- [Enable a non-admin user to activate Office by using MAK](#enable-a-non-admin-user-to-activate-office-by-using-mak)

## Related articles

- [Overview of volume activation of Office](plan-volume-activation-of-office.md)
- [Tools to manage volume activation of Office](tools-to-manage-volume-activation-of-office.md)