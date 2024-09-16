---
title: "Update Office LTSC 2024 Preview to Office LTSC 2024"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: conceptual
ms.service: office-perpetual-itpro
ms.localizationpriority: medium
ms.collection: Tier1
ROBOTS: NOINDEX, NOFOLLOW
recommendations: false
hideEdit: true
ms.date: 09/18/2024
---

# Update Office LTSC 2024 Preview to Office LTSC 2024

> [!IMPORTANT]
> The information in this article is only for customers who deployed Office LTSC 2024 Preview.

> [!WARNING]
> The client activation keys used in the Office LTSC 2024 Preview program expire on January 13<sup>th</sup>, 2025. After that time, Office LTSC 2024 Preview will be in reduced functionality mode. 
>
> For more information, see [What is reduced functionality mode?](/microsoft-365-apps/licensing-activation/overview-licensing-activation-microsoft-365-apps#what-is-reduced-functionality-mode)

If you're a volume licensed customer that's licensed for Office LTSC 2024 and you want to update your Office LTSC 2024 Preview installation, you don't need to uninstall Office LTSC 2024 Preview. You just need to activate the preview installation in one of the following ways to get Office LTSC 2024:

- [Key Management Service (KMS)](#kms-activation-steps-for-office-on-windows) for Office on Windows
- [Multiple Activation Key (MAK)](#mak-activation-steps-for-office-on-windows) for Office on Windows
- [Volume License (VL) Serializer](#volume-license-vl-serializer-steps-for-office-on-a-mac) for Office on a Mac

If you’re not a volume licensed customer, [follow these instructions](#instructions-for-customers-who-dont-have-a-volume-license).

> [!NOTE]
> [!INCLUDE[vlsc-retirement](../../includes/vlsc-retired.md)]

## KMS activation steps for Office on Windows

If you activate Office by using KMS, including Active Directory-based activation, do the following steps to update Office LTSC 2024 Preview to Office LTSC 2024.

1. If you haven't already done so, set up a KMS host computer. If you currently have a Windows KMS host computer on an operating system that supports Office KMS, we recommend that you use the same computer for your Office KMS host computer.
2. Download the [Office LTSC 2024 Volume License Pack](https://www.microsoft.com/download/details.aspx?id=106246) from the Microsoft Download Center.
3. Sign in to the [Microsoft 365 admin center](https://admin.microsoft.com/) and go to > **Billing** > **Your products** > **Volume licensing** > **Downloads & Keys** to get your KMS client activation keys for Office LTSC 2024.
4. [Configure the KMS host computer to activate Office LTSC 2024](../../volume-license-activation/configure-a-kms-host-computer-for-office.md). You'll need both the Office LTSC 2024 Volume License Pack and your KMS client activation keys.
5. Make sure that you’re using at least Version 2408 of Office LTSC 2024 Preview. To check your version, open Word, and go to **File** > **Account**. Under the **About Word** section, you’ll see the version and build number.
6. Run the [ospp.vbs script](../../volume-license-activation/tools-to-manage-volume-activation-of-office.md#the-osppvbs-script) on each computer to install and activate your KMS client activation key using the commands below.

```console
cscript ospp.vbs /inpkey:yourkey
cscript ospp.vbs /act
```
Replace *yourkey* with your KMS client activation key. You will need to restart any Office apps to see these changes take effect.

If you set up the Office LTSC 2024 KMS Host on a different computer than your Office LTSC 2024 Preview KMS host and you aren't using Active Directory-based activation, then the previous commands might not work, so also try running these commands:

```console
cscript ospp.vbs /remhst
cscript ospp.vbs /sethst:KMSHostFQDN
cscript ospp.vbs /act
```
Replace *KMSHostFQDN* with the fully qualified domain name of the Office LTSC 2024 KMS Host computer. You will need to restart any Office apps for these changes to take effect.

## MAK activation steps for Office on Windows

If you activate Office by using MAK, do the following steps to update Office LTSC 2024 Preview to Office LTSC 2024.

1. Sign in to the [Microsoft 365 admin center](https://admin.microsoft.com/) and go to > **Billing** > **Your products** > **Volume licensing** > **Downloads & Keys** to get your MAK client activation keys for Office LTSC 2024.
2. Make sure that you’re using at least Version 2408 of Office LTSC 2024 Preview. To check your version, open Word, and go to **File** > **Account**. Under the **About Word** section, you’ll see the version and build number.
3. Run the [ospp.vbs script](../../volume-license-activation/tools-to-manage-volume-activation-of-office.md#the-osppvbs-script) on each computer to install and activate your MAK client activation key using the commands below.

```console
 cscript ospp.vbs /inpkey:yourkey
 cscript ospp.vbs /act
```
Replace *yourkey* with your MAK client activation key. You will need to restart any Office apps for these changes to take effect.

## Additional information for Office on Windows

- The ospp.vbs commands can be included in a script that you can deploy and run across the computers in your organization, such as with Microsoft Configuration Manager.
- You can also use the Volume Activation Management Tool (VAMT) 3.1 to centrally manage volume activation. You need to use VAMT 3.1 with Office LTSC 2024. VAMT 3.0 won't work with Office LTSC 2024. For more information, see [Volume Activation Management Tool (VAMT) Technical Reference](/windows/deployment/volume-activation/volume-activation-management-tool).
- This also applies to updating Project Professional 2024 Preview to Project Professional 2024, or Visio Professional 2024 Preview to Visio LTSC Professional 2024.
- If you have the 32-bit version of Office LTSC 2024 Preview installed and want to install the 64-bit version of Office LTSC 2024, you must uninstall the preview first. This also applies if you're switching from 64-bit to 32-bit.
- If you're a volume licensed customer and want to install Office LTSC Standard 2024, you must first uninstall Office LTSC Professional Plus 2024 Preview.

For more information, see [Overview of volume activation of Office](../../volume-license-activation/plan-volume-activation-of-office.md) and [Tools to manage volume activation of Office](../../volume-license-activation/tools-to-manage-volume-activation-of-office.md).

## Volume License (VL) Serializer steps for Office on a Mac

To update Office 2024 for Mac (Preview) to Office LTSC Standard for Mac 2024, do the following steps:

1. Update Office 2024 for Mac (Preview) to Version 16.89 or later.
2. Sign in to the [Microsoft 365 admin center](https://admin.microsoft.com/) and go to > **Billing** > **Your products** > **Volume licensing** > **Downloads & Keys**  to download the Volume License (VL) Serializer for Office LTSC for Mac 2024.
3. Deploy and run the VL Serializer on each device running Office 2024 for Mac (Preview).

> [!TIP]
> To confirm the update, go to the **About** dialog in an Office app, such as Word. On the **License** line, you should see **Office LTSC Standard for Mac 2024** instead of **Preview 2024**.

For more information, see [Overview of the Volume License (VL) Serializer](/microsoft-365-apps/mac/volume-license-serializer).

## Instructions for customers who don't have a volume license

If you’re not a volume licensed customer, such as a home user, you need to do the following steps to move from Office LTSC 2024 Preview to the released version of Office 2024:

- For Office on Windows, purchase a retail version of Office 2024. After that, you need to uninstall Office LTSC 2024 Preview before installing Office 2024. The same applies if you're updating from a preview version of Project or Visio to the retail version.

- For Office on a Mac, you don’t need to uninstall Office 2024 for Mac (Preview). First, purchase a retail version of Office 2024 for Mac. Then, update your preview installation to at least Version 16.89, run the [license removal tool](https://support.microsoft.com/office/b032c0f6-a431-4dad-83a9-6b727c03b193), and then [activate](https://support.microsoft.com/office/7f6646b1-bb14-422a-9ad4-a53410fcefb2) Office.