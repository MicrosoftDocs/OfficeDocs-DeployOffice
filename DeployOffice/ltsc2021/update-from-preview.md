---
title: "Update Office LTSC 2021 Preview to Office LTSC 2021"
ms.author: danbrown
author: DHB-MSFT
manager: dougeby
audience: ITPro
ms.topic: article
ms.prod: office-perpetual-itpro
ms.localizationpriority: medium
ms.collection: Ent_O365
ms.custom: 
- Ent_Office_VL
- OfficeLTSC2021
ROBOTS: NOINDEX, NOFOLLOW
recommendations: false
description: "Provides Office LTSC 2021 Preview customers with steps to update the preview version to Office LTSC 2021, on both Windows and on a Mac"
---

# Update Office LTSC 2021 Preview to Office LTSC 2021

> [!IMPORTANT]
> This information is only for customers who deployed Office LTSC 2021 Preview.

If you're a volume licensed customer that's licensed for Office LTSC 2021 and you want to update your Office LTSC 2021 Preview installation, you don't need to uninstall Office LTSC 2021 Preview. You just need to activate the preview installation in one of the following ways to get Office LTSC 2021:

- [Key Management Service (KMS)](#kms-activation-steps-for-office-on-windows) for Office on Windows
- [Multiple Activation Key (MAK)](#mak-activation-steps-for-office-on-windows) for Office on Windows
- [Volume License (VL) Serializer](#vl-serializer-steps-for-office-on-a-mac) for Office on a Mac

If you’re not a volume licensed customer, [follow these instructions](#instructions-for-customers-who-dont-have-a-volume-license).

> [!WARNING]
> - The client activation keys used in the Office LTSC 2021 Preview program expired on January 17, 2022. 
> - Office LTSC 2021 Preview is now in reduced functionality mode and your users will only be able to read and print documents using Office LTSC 2021 Preview. They won’t be able to create new documents or edit existing documents.
> - Each time your users open an Office app, such as Word or Excel, they will see a message reminding them that Office LTSC 2021 Preview has expired.

## KMS activation steps for Office on Windows

If you activate Office by using KMS, including Active Directory-based activation, do the following steps to update Office LTSC 2021 Preview to Office LTSC 2021.

1. If you haven't already done so, set up a KMS host computer. If you currently have a Windows KMS host computer on an operating system that supports Office KMS, we recommend that you use the same computer for your Office KMS host computer.
2. Download the [Office LTSC 2021 Volume License Pack](https://www.microsoft.com/download/details.aspx?id=103446) from the Microsoft Download Center.
3. Sign in to the [Volume Licensing Service Center (VLSC)](https://www.microsoft.com/licensing/servicecenter/default.aspx) and get your KMS client activation keys for Office LTSC 2021.
4. [Configure the KMS host computer to activate Office LTSC 2021](../vlactivation/configure-a-kms-host-computer-for-office.md). You'll need both the Office LTSC 2021 Volume License Pack and your KMS client activation keys.
5. Make sure that you’re using at least Version 2108 of Office LTSC 2021 Preview. To check your version, open Word, and go to **File** > **Account**. Under the **About Word** section, you’ll see the version and build number.
6. Run the [ospp.vbs script](../vlactivation/tools-to-manage-volume-activation-of-office.md#the-osppvbs-script) on each computer to install and activate your KMS client activation key using the commands below.

```console
cscript ospp.vbs /inpkey:yourkey
cscript ospp.vbs /act
```
Replace *yourkey* with your KMS client activation key. You will need to restart any Office apps to see these changes take effect.

If you set up the Office LTSC 2021 KMS Host on a different computer than your Office LTSC 2021 Preview KMS host and you aren't using Active Directory-based activation, then the previous commands might not work, so also try running these commands:

```console
cscript ospp.vbs /remhst
cscript ospp.vbs /sethst:KMSHostFQDN
cscript ospp.vbs /act
```
Replace *KMSHostFQDN* with the fully qualified domain name of the Office LTSC 2021 KMS Host computer. You will need to restart any Office apps for these changes take effect.

## MAK activation steps for Office on Windows

If you activate Office by using MAK, do the following steps to update Office LTSC 2021 Preview to Office LTSC 2021.

1. Sign in to the [Volume Licensing Service Center (VLSC)](https://www.microsoft.com/licensing/servicecenter/default.aspx) and get your MAK client activation keys for Office LTSC 2021.
2. Make sure that you’re using at least Version 2108 of Office LTSC 2021 Preview. To check your version, open Word, and go to **File** > **Account**. Under the About Word section, you’ll see the version and build number.
3. Run the [ospp.vbs script](../vlactivation/tools-to-manage-volume-activation-of-office.md#the-osppvbs-script) on each computer to install and activate your MAK client activation key using the commands below.

```console
 cscript ospp.vbs /inpkey:yourkey
 cscript ospp.vbs /act
```
Replace *yourkey* with your MAK client activation key. You will need to restart any Office apps for these changes take effect.

## Additional information for Office on Windows

- The ospp.vbs commands can be included in a script that you can deploy and run across the computers in your organization. For example, by using Microsoft Configuration Manager.
- You can also use the Volume Activation Management Tool (VAMT) 3.1 to centrally manage volume activation. You need to use VAMT 3.1 with Office LTSC 2021. VAMT 3.0 won't work with Office LTSC 2021. For more information about VAMT, see [Volume Activation Management Tool (VAMT) Technical Reference](/windows/deployment/volume-activation/volume-activation-management-tool).
- This information also applies to updating Project Professional 2021 Preview to Project Professional 2021. Or, if you're updating Visio Professional 2021 Preview to Visio LTSC Professional 2021.
- If you have the 32-bit version of Office LTSC 2021 Preview installed and want to install the 64-bit version of Office LTSC 2021, you need to uninstall Office LTSC 2021 Preview first. You also must uninstall Office LTSC 2021 Preview if you’re switching from the 64-bit version to the 32-bit version.
- If you're a volume licensed customer and you want to install Office LTSC Standard 2021, you need to uninstall Office LTSC Professional Plus 2021 Preview first.
- For more information, see [Overview of volume activation of Office](../vlactivation/plan-volume-activation-of-office.md) and [Tools to manage volume activation of Office](../vlactivation/tools-to-manage-volume-activation-of-office.md).

## VL Serializer steps for Office on a Mac

To update Office 2021 for Mac (Preview) to Office LTSC Standard for Mac 2021, do the following steps:

1. Update Office 2021 for Mac (Preview) to Version 16.53 or later.
2. Download the Volume License (VL) Serializer for Office LTSC for Mac 2021 from the [Volume Licensing Service Center (VLSC)](https://www.microsoft.com/licensing/servicecenter/default.aspx).
3. Deploy and run the VL Serializer on each device running Office 2021 for Mac (Preview).

> [!TIP]
> To confirm the update, go to the **About** dialog in an Office app, such as Word. On the **License** line, you should see **Office LTSC Standard for Mac 2021** instead of **Preview 2021**.

For more information, see [Overview of the Volume License (VL) Serializer](../mac/volume-license-serializer.md).

## Instructions for customers who don't have a volume license

If you’re not a volume licensed customer, such as a home user, you need to do the following steps to move from Office LTSC 2021 Preview to the released version of Office 2021:

- For Office on Windows, purchase a retail version of Office 2021. After that, you need to uninstall Office LTSC 2021 Preview before installing Office 2021. The same is true if you want to update from a preview version of Project or Visio to the retail version.

- For Office on a Mac, you don’t need to uninstall Office 2021 for Mac (Preview). But first you need to purchase a retail version of Office 2021 for Mac. After that, update your existing preview installation to at least Version 16.53, run the [license removal tool](https://support.microsoft.com/office/b032c0f6-a431-4dad-83a9-6b727c03b193), and then [activate](https://support.microsoft.com/office/7f6646b1-bb14-422a-9ad4-a53410fcefb2) Office.