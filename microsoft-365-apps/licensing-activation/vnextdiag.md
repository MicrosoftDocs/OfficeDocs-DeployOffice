---
title: Check the license and activation status for Microsoft 365 Apps
ms.author: nwhite
author: nicholasswhite
manager: dougeby
ms.reviewer: mattphil
audience: ITPro
ms.topic: how-to
ms.service: o365-proplus-itpro
ms.collection: Tier2
ms.localizationpriority: medium
recommendations: true
description: Learn about using vnextdiag.ps1 to check the license and activation status of Microsoft 365 Apps.
ms.date: 03/15/2024
---

# Check the license and activation status for Microsoft 365 Apps

For many years, Microsoft 365 Apps used the Office Software Protection Platform and Activation Verification Services to manage product activation. But starting with Version 1910, Microsoft 365 Apps moved to a newer activation method.

Because of this change, you can no longer use the ospp.vbs script to view and manage the activation status of Microsoft 365 Apps. Instead, you can use a PowerShell script named vnextdiag.ps1. That script is included with Microsoft 365 Apps, starting with Version 2104.

> [!NOTE]
> - The subscription versions of the Project and Visio desktop apps also use the new activation method, starting with Version 1910.
> - You still need to use ospp.vbs for volume licensed versions of Office, such as Office LTSC 2021 and Office 2019. For more information, see [Tools to manage volume activation of Office](/office/volume-license-activation/tools-to-manage-volume-activation-of-office).

## Verify that Microsoft 365 Apps is using the new activation method

There are three different ways that you can verify that Microsoft 365 Apps is using the new activation method.

- Open Word and go to **File** > **Account** > **About Word**. Near the top of the dialog, you should see an entry for License ID. For Microsoft 365 Apps, the ID starts with EWW.

> [!NOTE]
> - The License ID for consumer versions of Microsoft 365, such as Microsoft 365 Family, starts with CWW instead of EWW.
> - For volume licensed versions of Office, such as Office LTSC 2021, a Product ID is listed instead of a License ID.

- Open Registry Editor and go to HKEY_CURRENT_USER\SOFTWARE\Microsoft\Office\16.0\Common\Licensing\LicensingNext. There you should see a list of activated products. A value of 2 indicates that the product is using the new activation method.

- In File Explorer, go to %localappdata%\Microsoft\Office\Licenses. In that folder, you should see a subfolder with a number. In that subfolder there should be individual files for each product that is activated with the new activation method.


## View activation of Microsoft 365 Apps by using vnextdiag.ps1

To view the activation status of Microsoft 365 Apps, you can use the PowerShell script named vnextdiag.ps1.

To use vnextdiag.ps1, you need to open a Windows PowerShell command prompt and navigate to the C:\Program Files\Microsoft Office\Office16 folder. From there, use the following command:

```powershell
./vnextdiag.ps1 -action list
```

> [!NOTE]
> If you’ve installed a 32-bit version of Microsoft 365 Apps on a 64-bit version of Windows, the script is in the C:\Program Files (x86)\Microsoft Office\Office16 folder.

The PowerShell script shows the products that are installed on the device and, for each product, some of the following information:
- Type of license, such as User|Subscription.
- Name of the product, such as O365ProPlusRetail or VisioProRetail.
- State of the license, such as Licensed.
- Email of the user that activated the product.
- ID of the tenant associated with the user.

If the device is configured for [shared computer activation](../deploy/overview-office-deployment-tool.md) or [device-based licensing](../licensing-activation/device-based-licensing.md), the output of running vnextdiag.ps1 shows that information.

## Reset the activation of Microsoft 365 Apps by using vnextdiag.ps1

You can also use vnextdiag.ps1 to reset the activation of Microsoft 365 Apps. To force reactivation of a product installed on the device, use the following command from the Windows PowerShell command prompt:

```powershell
./vnextdiag.ps1 -action remove -LicenseId EWW_GUID_ID
```

For LicenseId, use the LicenseID for the product you want to reactivate, as shown in the vnextdiag.ps1 output. For Microsoft 365 Apps, the ID starts with EWW.

> [!NOTE]
> You can also reset the activation status of your products by deleting the files in the subfolder under %localappdata%\Microsoft\Office\Licenses. The next time you start Microsoft 365 Apps, the product is activated and the license files in the subfolder are recreated.
