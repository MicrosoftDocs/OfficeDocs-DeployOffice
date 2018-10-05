---
title: "Update Office 2019 Preview to Office 2019"
ms.author: danbrown
author: DHB-MSFT
manager: laurawi
ms.audience: ITPro
ms.topic: overview
ms.prod: office-perpetual-itpro
localization_priority: Normal
ms.collection: Ent_O365
ms.custom: Ent_Office_VL
ROBOTS: NOINDEX, NOFOLLOW
description: "Provides Office 2019 Preview customers with steps to update the preview version to Office 2019, on both Windows and on a Mac"
---

# Update Office 2019 Preview to Office 2019
 
> [!IMPORTANT]
> This information is for customers who deployed Office 2019 Preview as part of the Office 2019 Preview program on Microsoft Collaborate.

If you're a volume licensed customer that's licensed for Office 2019 and you want to update your Office 2019 Preview installation, you don't need to uninstall Office 2019 Preview. You just need to activate the preview installation in one of the following ways to get Office 2019:

- [Key Management Service (KMS)](#kms-activation-steps-for-office-on-windows) for Office on Windows
- [Multiple Activation Key (MAK)](#mak-activation-steps-for-office-on-windows) for Office on Windows
- [Volume License (VL) Serializer](#vl-serializer-steps-for-office-on-a-mac) for Office on a Mac

If you’re not a volume licensed customer, you need to do the following:

- For Office on Windows, purchase Office 2019. After you purchase Office 2019, you need to uninstall Office 2019 Preview before installing Office 2019.
- For Office on a Mac, you don’t need to uninstall Office 2019 Preview for Mac. But, you need to purchase Office 2019 for Mac. Then, run the [license removal tool](https://support.office.com/article/b032c0f6-a431-4dad-83a9-6b727c03b193) and [activate](https://support.office.com/article/7f6646b1-bb14-422a-9ad4-a53410fcefb2) your existing installation.

> [!WARNING]
> The client activation keys used in the Office 2019 Preview program expire on December 31, 2018. If you don't follow the steps in this article, Office 2019 Preview will go into reduced functionality mode and your users will only be able to read and print documents using Office 2019 Preview. Users will get periodic warnings about this in their Office apps, such as Word, starting in early December.

## KMS activation steps for Office on Windows

If you activate Office by using KMS, including Active Directory-based activation, do the following to update Office 2019 Preview to Office 2019.

- If you haven't already done so, set up a KMS host computer. If you currently have a Windows KMS host computer on an operating system that supports Office KMS, we recommend that you use the same computer for your Office KMS host computer. 
- Download the [Office 2019 Volume License Pack](https://www.microsoft.com/downloads/details.aspx?FamilyID=878fef7e-3f4d-4d22-a423-f447c0f5bfdd) from the Microsoft Download Center.
- Sign in to the [Volume Licensing Service Center (VLSC)](https://www.microsoft.com/licensing/servicecenter/default.aspx) and get your KMS client activation keys for Office 2019.
- [Configure the KMS host computer to activate Office 2019](../vlactivation/configure-a-kms-host-computer-for-office.md). You'll need both the Office 2019 Volume License Pack and your KMS client activation keys.
- Make sure that you’re using at least Version 1808 of Office 2019 Preview. To check your version, open Word, and go to **File** > **Account**. Under the **About Word** section you’ll see the version and build number. 
- Run the [ospp.vbs script](../vlactivation/tools-to-manage-volume-activation-of-office.md#the-osppvbs-script) on each computer to install and activate your KMS client activation key using the commands below.

```
cscript ospp.vbs /inpkey:yourkey
cscript ospp.vbs /act
```
Replace *yourkey* with your KMS client activation key. You will need to restart any Office apps to see these changes take effect.

If you set up the Office 2019 KMS Host on a different computer than your Office 2019 Preview KMS host and you aren't using Active Directory-based activation, then the previous commands might not work, so try running these additional commands:

```
cscript ospp.vbs /remhst
cscript ospp.vbs /sethst:KMSHostFQDN
cscript ospp.vbs /act
```
Replace *KMSHostFQDN* with the fully qualified domain name of the Office 2019 KMS Host computer. You will need to restart any Office apps for these changes take effect.


## MAK activation steps for Office on Windows

If you activate Office by using MAK, do the following to update Office 2019 Preview to Office 2019.

- Sign in to the [Volume Licensing Service Center (VLSC)](https://www.microsoft.com/licensing/servicecenter/default.aspx) and get your MAK client activation keys for Office 2019.
- Make sure that you’re using at least Version 1808 of Office 2019 Preview. To check your version, open Word, and go to **File** > **Account**. Under the **About Word** section you’ll see the version and build number.
- Run the [ospp.vbs script](../vlactivation/tools-to-manage-volume-activation-of-office.md#the-osppvbs-script) on each computer to install and activate your MAK client activation key using the commands below.

```
 cscript ospp.vbs /inpkey:yourkey
 cscript ospp.vbs /act
```
Replace *yourkey* with your MAK client activation key. You will need to restart any Office apps for these changes take effect.


## Additional information for Office on Windows

- The ospp.vbs commands can be included in a script that you can deploy and run across the computers in your organization. For example, by using System Center Configuration Manager.
- You can also use the Volume Activation Management Tool (VAMT) 3.1 to centrally manage volume activation. You need to use VAMT 3.1 with Office 2019. VAMT 3.0 won't work with Office 2019. For more information about VAMT, see [Volume Activation Management Tool (VAMT) Technical Reference](https://docs.microsoft.com/windows/deployment/volume-activation/volume-activation-management-tool).
- This information also applies to updating Project Professional 2019 Preview to Project Professional 2019 and updating Visio Professional 2019 Preview to Visio Professional 2019.
- If you have the 32-bit version of Office 2019 Preview installed and want to install the 64-bit version of Office 2019, you need to uninstall Office 2019 Preview first. You also must uninstall Office 2019 Preview if you’re switching from the 64-bit version to the 32-bit version.
- If you're a volume licensed customer and you want to install Office Standard 2019, you need to uninstall Office Professional Plus 2019 Preview first.
- For more information, see [Plan volume activation of Office](../vlactivation/plan-volume-activation-of-office.md) and [Tools to manage volume activation of Office](../vlactivation/tools-to-manage-volume-activation-of-office.md).


## VL Serializer steps for Office on a Mac

If you’re a volume licensed customer that’s licensed for Office 2019 for Mac and you want to update Office 2019 Preview for Mac to Office 2019 for Mac, you don’t need to uninstall Office 2019 Preview for Mac. You just need to download the [Volume License (VL) Serializer](../mac/volume-license-serializer.md) for Office 2019 for Mac from the [Volume Licensing Service Center (VLSC)](https://www.microsoft.com/licensing/servicecenter/default.aspx) and deploy to each computer running Office 2019 Preview for Mac.

