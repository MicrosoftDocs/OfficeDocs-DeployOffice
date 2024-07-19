---
title: "Office LTSC 2021 deployment instructions for SPLA customers"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: conceptual
ms.service: office-perpetual-itpro
ms.localizationpriority: medium
ms.collection: Tier2
ROBOTS: NOINDEX, NOFOLLOW
recommendations: false
description: "Provides Microsoft Services Provider License Agreement (SPLA) customers with instructions for deploying Office LTSC 2021"
ms.date: 03/29/2024
---

# Office LTSC 2021 deployment instructions for SPLA customers

> [!IMPORTANT]
> This information only applies to service providers and independent software vendors (ISVs) with a Microsoft Services Provider License Agreement (SPLA). For more information, see [Licensing options for service providers](https://www.microsoft.com/licensing/licensing-programs/spla-program).

There are a few slight differences in how you, as a SPLA customer, deploy Office LTSC 2021 to devices running Windows or macOS.

## Office LTSC 2021 (for Windows)

To download or install Office LTSC 2021 on devices running Windows, you can use the [Office Deployment Tool](../overview-office-deployment-tool.md) with an XML file that specifies configuration information. The following table shows you which value to use for the [ID attribute](../office-deployment-tool-configuration-options.md#id-attribute-part-of-product-element) in that XML file.

|Office product |Product ID value  |
|---------|---------|
|Office LTSC Professional Plus 2021 (SPLA) | ProPlusSPLA2021Volume|
|Office LTSC Standard 2021 (SPLA) |StandardSPLA2021Volume |

These Office products don't include Microsoft Teams.

> [!TIP]
> You can use the Office Customization Tool, a web-based interface, to create your XML file. For more information, see [Overview of the Office Customization Tool](/microsoft-365-apps/admin-center/overview-office-customization-tool).

To activate either of these versions of Office, you must use Multiple Activation Key (MAK) activation. For more information, see [Activate volume licensed versions of Office by using MAK](../volume-license-activation/activate-office-by-using-mak.md).

Other than that, how you deploy and manage Office LTSC 2021 is no different than other customers. For more information, see [Overview of Office LTSC 2021](overview.md).

## Office LTSC for Mac 2021

To deploy Office LTSC for Mac 2021, do the following steps:

1. [Download](https://go.microsoft.com/fwlink/?linkid=525133) and install the Office LTSC Standard for Mac 2021 (SPLA) installation package. This package doesn’t include Microsoft Teams.

2. Sign in to the [Volume License Service Center (VLSC)](https://www.microsoft.com/licensing/servicecenter/default.aspx) and download the .iso file for the Volume License (VL) Serializer for Office LTSC Standard for Mac 2021.

3. Extract the Microsoft_Office_LTSC_2021_VL_Serializer.pkg package from the .iso file.

4. Run the VL Serializer package on each Mac where Office is installed.

For more information, see [Overview of the Volume License (VL) Serializer](../mac/volume-license-serializer.md).

For more information about how to deploy and manage Office LTSC on devices running macOS, see [Deployment guide for Office for Mac](../mac/deployment-guide-for-office-for-mac.md).
