---
title: "Overview of Office 2019 (for IT Pros)"
ms.author: danbrown
author: DHB-MSFT
manager: laurawi
audience: ITPro
ms.topic: overview
ms.prod: office-perpetual-itpro
localization_priority: Normal
ms.collection: Ent_O365
ms.custom: 
- Ent_Office_VL
- Office2019
description: "Provides IT admins with an overview of deploying Office 2019."
---

# Overview of Office 2019 (for IT Pros)
 
Office 2019 is the latest version of Microsoft's productivity software that's available as a one-time purchase from a retail store or through a volume licensing agreement.

> [!IMPORTANT]
> Office 2019 is separate from Office that's available through Microsoft 365 (or an Office 365) plans. For example, if you've deployed Microsoft 365 Apps for enterprise (previously named Office 365 ProPlus) to the users in your organization, you don't need Office 2019. You already have all the features, and many more, that are included in Office 2019. 
  
Volume licensed versions of Office 2019 are available for enterprise admins to download and deploy to the users in their organization. This includes the following Office products:

- Office Professional Plus 2019
- Office Standard 2019
- Project Professional 2019
- Project Standard 2019
- Visio Professional 2019
- Visio Standard 2019

These Office products now use Click-to-Run, instead of Windows Installer (MSI), as the installation technology. But, how you activate these Office products – for example, by using Key Management Service (KMS) – remains the same.

Office 2019 for Mac is also available for volume licensed customers. For more information, see [Deployment Guide for Office for Mac](../mac/deployment-guide-for-office-for-mac.md).

## What's changed in Office 2019?

The biggest change since Office 2016 is that the installation technology used by the new volume licensed versions of Office is Click-to-Run, instead of Windows Installer (MSI). Click-to-Run has been the installation technology for most Office products since the release of Office 2013.

In addition to Click-to-Run, the following are some other changes that you need to be aware of:

- Office 2019 is supported on Windows 10, Windows 10 SAC, Windows Server 2019, or Windows 10 LTSC 2019. but isn’t supported on Windows 7 or Windows 8.1. For more information, review the [Office 2019 System Requirements](https://products.office.com/office-resources).
- To configure and perform installations, you use the latest [Office Deployment Tool](https://www.microsoft.com/download/details.aspx?id=49117), which is a free tool download from the Microsoft Download Center. The Office Customization Tool that you previously used for Windows Installer (MSI) is no longer used.
- Instead of downloading the installation files from the Volume Licensing Service Center (VLSC), you use the Office Deployment Tool to download the installation files directly from the Office Content Delivery Network (CDN) on the internet.
- When you install Office Professional Plus 2019, all apps are installed by default. But, you can configure the Office Deployment Tool to exclude certain apps from being installed.
- Office 2019 is installed on the system drive, which is usually the C:\ drive. The installation location can’t be changed.
- You can configure updates to Office 2019 via Group Policy Editor, such as security updates and bug fixes, to be automatically downloaded and installed from the Office CDN. Individual downloads for each security update or bug fix aren’t available. 


## What's stayed the same in Office 2019?

Even though there is a different installation technology, you can still use the same software distribution tools, such as Microsoft Endpoint Configuration Manager, that you currently use to deploy Office. Also, how you activate volume licensed versions of Office – for example, by using Key Management Service (KMS) – remains the same.

The major version of Office 2019 is staying at 16.0, so some additional things are staying the same if you're upgrading from Office 2016, including the following:

- Existing Group Policy settings will continue to work, because the registry location for those settings will still be located in **HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Office\16.0** and **HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft\Office\16.0.**
- Other registry locations and settings information that reference 16.0 will still apply.
- Add-ins and other extensibility solutions that are compatible with Office 2016 will most likely be compatible with Office 2019 or will require only minimal testing.


## What are the new features in Office 2019?

For information about the new features in Office 2019, see the “what’s new” articles for [Access](https://support.microsoft.com/office/f52c5317-3494-4105-9c56-5a2abb8e0f87), [Excel](https://support.microsoft.com/office/5a201203-1155-4055-82a5-82bf0994631f), [Outlook](https://support.microsoft.com/office/0c64df36-0908-4ff6-a7fc-573a62800525), [PowerPoint](https://support.microsoft.com/office/8355a56a-f643-42d2-8454-784fa9b3d109), [Project](https://support.microsoft.com/office/6be41c8a-c4b2-409a-9ef7-d250377ad3b7), [Visio](https://support.microsoft.com/office/19b8e98d-9cf9-40ad-9277-eb65e3713a79), and [Word](https://support.microsoft.com/office/d3d31e5e-2bb8-4433-80bb-08279beef4b3).  Office 2019 includes some, but not all, features that are available in versions of Office that come with Microsoft 365 (or an Office) plan.

If Office 2019 won’t receive additional new features now that it has been released.And you want to get new Office features on an on-going basis, you should consider moving to an Microsoft 365 (or an Office 365) plan that includes Office. Most of these enterprise plans include Microsoft 365 Apps for enterprise (previously named Office 365 ProPlus), which includes the same Office apps as Office Professional Plus 2019. For more information, see [Enterprise Options for Office 365](https://products.office.com/business/compare-more-office-365-for-business-plans) and [What’s new in Microsoft 365](https://support.microsoft.com/office/95c8d81d-08ba-42c1-914f-bca4603e1426).

## How do I upgrade to Office 2019?

We recommend that you should uninstall all existing versions of Office suites, before you deploy Office 2019. If you’re uninstalling previous versions of Office products that were installed with Windows Installer (MSI), the Office Deployment Tool can remove most of those products for you as part of the installation of Office 2019. For more information, see [Remove existing versions of Office before installing Office 2019](deploy.md#remove-existing-versions-of-office-before-installing-office-2019).

## Additional information

- Office Professional Plus 2019 includes Access, Excel, Outlook, PowerPoint, Publisher, Word, and Skype for Business.
- There isn’t a 2019 version of OneNote, but OneNote is available for Office 2019 (and as of March 2020, OneNote is included alongside the other Office apps as part of the default deployment). For more information, see [Deployment Guide for OneNote](../deployment-guide-onenote.md).
- All products in the Office 2019 are available in both 32-bit and 64-bit versions. We recommend 64-bit on computers that have 4 gb or more of memory. But you should assess application compatibility and other factors that might require you to use the 32-bit version.  For more information, see [Choose between the 64-bit or 32-bit version of Office](https://support.microsoft.com/office/2dee7807-8f95-4d0c-b5fe-6c6f49b8d261).
- After downloading the installation files, internet access isn’t required to install, activate, or use Office 2019.
- There isn’t a 2019 version of SharePoint Designer or InfoPath. The last version for both products is 2013.
- Volume licensed versions of Office 2019 aren't supported on [Windows 10 in S mode](https://support.microsoft.com/windows/851057d6-1ee9-b9e5-c30b-93baebeebc85) or when using [Windows Defender Application Control (WDAC)](https://docs.microsoft.com/windows/security/threat-protection/windows-defender-application-control/wdac-and-applocker-overview).


## Related articles

- [Deploy Office 2019 (for IT Pros)](deploy.md)
- [Update Office 2019 (for IT Pros)](update.md)
- [Volume Activation for Office](../vlactivation/plan-volume-activation-of-office.md)
