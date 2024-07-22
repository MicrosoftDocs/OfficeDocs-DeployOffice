---
title: "Troubleshoot issues with shared computer activation for Microsoft 365 Apps"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
ms.reviewer: mattphil
audience: ITPro
ms.topic: troubleshooting
ms.service: o365-proplus-itpro
ms.collection: Tier1
ms.localizationpriority: medium
search.appverid: MET150
recommendations: false
description: "Explains how to troubleshoot issues with deployments of Microsoft 365 Apps that are configured to use shared computer activation."
ms.date: 05/22/2024
---

# Troubleshoot issues with shared computer activation for Microsoft 365 Apps

If you're having problems getting shared computer activation to work when you deploy Microsoft 365 Apps to shared computers in your organization, try the following to fix the problem.

> [!TIP]
> You can download and run the [Microsoft Support and Recovery Assistant](https://aka.ms/SaRA_TshootOfficeSCA_Docs) to install Microsoft 365 Apps in shared computer activation mode.

<a name="Plan"> </a>
  
## Check that your Office 365 plan supports shared computer activation


To use shared computer activation, you must have an Office 365 (or Microsoft 365) plan that includes Microsoft 365 Apps and that supports shared computer activation.
  
> [!NOTE]
> You also can use shared computer activation with the subscription versions of the Project and Visio desktop apps. You just need a subscription plan that includes those products. 

<a name="Enabled"> </a>
  
## Verify that shared computer activation is enabled for Microsoft 365 Apps

Here are two ways that you can check whether shared computer activation is enabled on the computer that has Microsoft 365 Apps installed.
  
- Open any Office program, such as Word. Go to **File** > **Account** > **About Word** (or whatever the name of the app is). On the second line from the top, underneath the MSO version number, you should see **Shared Computer Activation**, instead of a Product ID, like in the following screenshot.
    
     :::image type="content" source="../media/troubleshoot-shared-computer-activation/shared-computer-activation.png" alt-text="Screenshot of Shared Computer Activation information in the About Microsoft Word section.":::
  
- Use Registry Editor, and go to **HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Office\\ClickToRun\\Configuration**. There should be a value for SharedComputerLicensing with a setting of 1.
    
<a name="Succeeded"> </a>

## Verify that activation for Microsoft 365 Apps succeeded

On the shared computer, after you open any Office program, go to the following folder:
  
  %localappdata%\Microsoft\Office\16.0\Licensing
  
If activation succeeded, there are some text files in the folder, like in the following screenshot. Don't make any changes to these files.
  
:::image type="content" source="../media/troubleshoot-shared-computer-activation/office-licensing-files.png" alt-text="Screenshot of file path showing Office licensing files in the local AppData folder.":::
  
If you configure the licensing token to roam, these text files appear in the folder that you specified.
  
<a name="Errors"> </a>

## Review error messages for shared computer activation

If you're having problems using shared computer activation, you might get one of the following error messages.

<a name="Products"> </a>
  
### The products we found in your account cannot be used to activate Office in shared computer scenarios.


This error means that you don't have an Office 365 (or Microsoft 365) plan that includes Microsoft 365 Apps and that supports shared computer activation. Therefore, you can't use shared computer activation.
  
:::image type="content" source="../media/troubleshoot-shared-computer-activation/activation-error-0x40e.png" alt-text="Screenshot of activation error message indicating the products found can't be used to activate Office in shared computer scenarios.":::
  
<a name="Unlicensed"> </a>

### UNLICENSED PRODUCT Most features are turned off because a shared computer license isn't available.

This error means that a licensing token wasn't obtained from the Office Licensing Service on the internet. Office is now in reduced functionality mode. The user can view and print Office documents, but can't create or edit documents.
  
You can try these steps to fix this problem:
  
- [Check that the user is assigned a license](/microsoft-365/admin/manage/assign-licenses-to-users) for Microsoft 365 Apps.
    
- Check that the user signs in with their user account for Office 365 if the **Activate Office** dialog box appears when the user opens an Office program.
    
- Check that there's connectivity between the shared computer and the internet.
    
:::image type="content" source="../media/troubleshoot-shared-computer-activation/unlicensed-product-notification.png" alt-text="Unlicensed product notification with instructions to close and restart Word, then sign in with an Office 365 account.":::
  
<a name="Verify"> </a>

### Sorry, we cannot verify the license currently installed for this product.

This error means that Office has a problem with the user's licensing token on the shared computer. The user should make sure to sign in to Office with their user account for Office 365 so that Office can obtain a new licensing token from the Office Licensing Service on the internet.
  
:::image type="content" source="../media/troubleshoot-shared-computer-activation/license-verification-error.png" alt-text="Screenshot of error message indicating that the license can't be verified, with error code 0x8004005.":::
  
<a name="Expires"> </a>

### PRODUCT NOTICE Your shared computer license expires on \<date\> and we're having trouble renewing it.

This error means that Office tried to renew the licensing token automatically, but there was a problem. One possible cause for this is that the shared computer wasn't connected to the internet when Office tried to renew the licensing token with the Office Licensing Service.
  
The licensing token is valid until the date listed in the error message. The user can continue to use Office apps to create, edit, and print documents. The user can choose **Renew** to try to renew the license before the license token expires.
  
:::image type="content" source="../media/troubleshoot-shared-computer-activation/product-notice.png" alt-text="Screenshot of product notice indicating shared computer license is expiring and needs renewal.":::
  
<a name="Used"> </a>

### Sorry, this Office 365 account has recently been used to activate too many computers.

Microsoft places a limit on the number of shared computers that a user can activate Office on in a given time period. This error means that the user exceeded that limit.
  
:::image type="content" source="../media/troubleshoot-shared-computer-activation/activation-error-0x420.png" alt-text="Screenshot of activation error message for Office 365 account with error code 0x420.":::

  
## Related articles

- [Overview of shared computer activation for Microsoft 365 Apps](overview-shared-computer-activation.md)
- [Deploy Microsoft 365 Apps by using Remote Desktop Services](../deploy/deploy-microsoft-365-apps-remote-desktop-services.md)