---
title: "Troubleshoot issues with shared computer activation for Office 365 ProPlus"
ms.author: danbrown
author: DHB-MSFT
manager: laurawi
audience: ITPro
ms.topic: troubleshooting
ms.service: o365-proplus-itpro
localization_priority: Normal
ms.collection: Ent_O365
ms.custom: Ent_Office_ProPlus
search.appverid:
- MET150

description: "Explains how to troubleshoot issues with deployments of Office 365 ProPlus that are configured to use shared computer activation."
---

# Troubleshoot issues with shared computer activation for Office 365 ProPlus

If you're having problems getting shared computer activation to work when you deploy Office 365 ProPlus to shared computers in your organization, try the following to fix the problem.

> [!TIP]
> You can download and run the [Microsoft Support and Recovery Assistant](https://aka.ms/SaRA_TshootOfficeSCA_Docs) to install Office 365 ProPlus in shared computer activation mode.

<a name="Plan"> </a>
  
## Check that your Office 365 plan supports shared computer activation


To use shared computer activation, you must have an Office 365 plan that includes Office 365 ProPlus.
  
> [!NOTE]
> You also can use shared computer activation with Visio Online Plan 2 (previously named Visio Pro for Office 365) or Project Online Desktop Client. You just need a subscription plan that includes those products. 

<a name="Enabled"> </a>
  
## Verify that shared computer activation is enabled for Office 365 ProPlus

Here are two ways that you can check whether shared computer activation is enabled on the computer that has Office 365 ProPlus installed.
  
- Open any Office 365 ProPlus program, such as Word. Go to **File** > **Account** > **About Word** (or whatever the name of the app is). On the second line from the top, underneath the MSO version number, you should see **Shared Computer Activation**, instead of a Product ID, like in the following screenshot.
    
     ![Screenshot of the About Word dialog box, showing "Shared Computer Activation" underneath the MSO version number.](images/246f2714-8b13-48af-9e2d-0a15213adcc9.png)
  
- Use Registry Editor, and go to **HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Office\\ClickToRun\\Configuration**. There should be a value for SharedComputerLicensing with a setting of 1.
    
<a name="Succeeded"> </a>

## Verify that activation for Office 365 ProPlus succeeded

On the shared computer, after you open any Office 365 ProPlus program, go to the following folder:
  
  %localappdata%\Microsoft\Office\16.0\Licensing
  
If activation succeeded, there are some text files in the folder, like in the following screenshot. Don't make any changes to these files.
  
![Screenshot of the Licensing folder, showing the licensing token files for shared computer activation.](images/adb109f0-757c-4e0e-87fa-ea87ba54b610.png)
  
If you've configured the licensing token to roam, these text files will appear in the folder that you've specified.

<a name="Reset"> </a>

## Remove existing default activations

If Office has already been activated using the Default Activation Configuration, you need to clear this activation first to allow Office to perform the Shared Computer Activation. Follow the steps to [reset the activation] (https://docs.microsoft.com/en-us/office/troubleshoot/activation/reset-office-365-proplus-activation-state) and let the user re-launch Office.

<a name="Errors"> </a>

## Review error messages for shared computer activation

If you're having problems using shared computer activation, you might get one of the following error messages.

<a name="Products"> </a>
  
### The products we found in your account cannot be used to activate Office in shared computer scenarios.


This error means that you don't have an Office 365 plan that includes Office 365 ProPlus. Therefore, you can't use shared computer activation.
  
![Error message cannot activate products into shared scenario](images/67637fc5-35cc-4118-acc1-e68fe1155512.png)
  
<a name="Unlicensed"> </a>

### UNLICENSED PRODUCT Most features are turned off because a shared computer license isn't available.

This error means that a licensing token wasn't obtained from the Office Licensing Service on the Internet. Office 365 ProPlus is now in reduced functionality mode. The user can view and print Office 365 ProPlus documents, but can't create or edit documents.
  
You can try these steps to fix this problem:
  
- [Check that the user is assigned a license](https://support.office.com/article/997596b5-4173-4627-b915-36abac6786dc) for Office 365 ProPlus.
    
- Check that the user signs in with her user account for Office 365 if the **Activate Office** dialog box appears when the user opens an Office 365 ProPlus program.
    
- Check that there is connectivity between the shared computer and the Internet.
    
![Unlicensed product error message](images/4bab7afd-4ffa-4775-bc8b-86767198d140.png)
  
<a name="Verify"> </a>

### Sorry, we cannot verify the license currently installed for this product.

This error means that Office 365 ProPlus has a problem with the user's licensing token on the shared computer. The user should make sure to sign in to Office 365 ProPlus with his user account for Office 365 so that Office 365 ProPlus can obtain a new licensing token from the Office Licensing Service on the Internet.
  
![Cannot verify product license message](images/f8bb9b93-f25d-44ff-b46e-a9e163704663.png)
  
<a name="Expires"> </a>

### PRODUCT NOTICE Your shared computer license expires on <date> and we're having trouble renewing it.

This error means that Office 365 ProPlus tried to renew the licensing token automatically, but there was a problem. One possible cause for this is that the shared computer wasn't connected to the Internet when Office 365 ProPlus tried to renew the licensing token with the Office Licensing Service.
  
The licensing token is valid until the date listed in the error message. The user can continue to use Office 365 ProPlus to create, edit, and print documents. The user can choose **Renew** to try to renew the license before the license token expires.
  
![Shared computer license expires date](images/f29ab2ab-6699-41b4-8fbb-232f66137426.png)
  
<a name="Used"> </a>

### Sorry, this Office 365 account has recently been used to activate too many computers.

Microsoft places a limit on the number of shared computers that a user can activate Office 365 ProPlus on in a given time period. This error means that the user exceeded that limit.
  
![Too many computer activated](images/1166f881-87da-4667-a4bd-e92c23859de2.png)
  
## Related topics
[Overview of shared computer activation for Office 365 ProPlus](overview-of-shared-computer-activation-for-office-365-proplus.md)
  
[Deploy Office 365 ProPlus by using Remote Desktop Services](deploy-office-365-proplus-by-using-remote-desktop-services.md)

