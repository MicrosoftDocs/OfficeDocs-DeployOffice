---
title: "Overview of extended offline access for Microsoft 365 Apps for enterprise"
ms.author: jwhit
author: jwhit-MSFT
manager: laurawi
audience: ITPro
ms.topic: article
ms.service: o365-proplus-itpro
localization_priority: null
ms.collection: 
- Ent_O365
- M365-modern-desktop
ms.custom: Ent_Office_ProPlus
description: "Overview of extended offline access for Microsoft 365 Apps."
---

# Overview of extended offline access for Microsoft 365 Apps

Extended offline access enables devices running Microsoft 365 Apps for enterprise to stay activated for up to six months without the need to connect to the internet to validate the license and install updates. To use extended offline access, you must have version 2002 of Microsoft 365 Apps or later. To enable extended offline access, your organization must have a Microsoft 365 Apps license subscription.

> [!IMPORTANT]
> Extended offline access is not available as a license for all customers. To find out about eligibility for your organization, contact your Microsoft account representative.

Extended offline access is designed for users with devices that need to go offline for an extended period, such as users in secure environments, remote locations, or on field trips with no connectivity. 

## Enable extended offline access with Group Policy

To enable extended offline access for users in your organization with Group Policy:

- Enable the **Allow extended offline use** policy setting. You can find this policy setting under HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Office\16.0\Common\Licensing.

To use this policy setting, download and install the [Group Policy Administrative Template files (ADMX/ADML) for enabling the extended offline access for Microsoft 365 Apps](https://download.microsoft.com/download/5/6/c/56ce6724-dbdf-4794-819c-470077b6f6b0/Group_Policy.zip) from the Microsoft Download Center.

## Enable extended offline access with the registry

If you can't use group policy to enable extended offline access, you can update the registry. To enable the setting, set the following:

    -[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Office\16.0\Common\Licensing]
    "ExtendedOfflineSubscription"=dword:00000001
    
    -[HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Policies\Microsoft\Office\16.0\Common\Licensing]
    "ExtendedOfflineSubscription"=dword:00000001

To disable the setting, set the following:

    -[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Office\16.0\Common\Licensing]
    "ExtendedOfflineSubscription"=dword:00000000
    
    -[HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Policies\Microsoft\Office\16.0\Common\Licensing]
    "ExtendedOfflineSubscription"=dword:00000000

## Extended offline access for devices with no internet access

When a device loses internet access, the user can continue to use Office without an internet connection for up to 180 days.  When 15 days remain, the user receives an in-client notification to connect to the internet so the license can be verified. If possible, the user should connect the device to the internet, which will enable an additional 180 days. 

If the device cannot connect to the internet every 180 days, you can still [extend the Office license for offline use](https://support.office.com/article/extend-your-office-license-for-offline-use-06de5162-e230-4ce6-83bb-e6f06190a8f5).

## User experience for extended offline access

When Extended Offline Access is enabled on a device, the Office account page for Microsoft 365 Apps on the device displays the license expiration date and links to information about extending the license.

## Considerations when using extended offline access

- Extended offline access is currently supported for Word, Excel, and PowerPoint.  Project and Visio subscription plans are not supported. For information about how to exclude applications when deploying, see [ExcludeApp element](office-deployment-tool-configuration-options.md#excludeapp-element). 
- Updates, such as new features and security updates, must be applied manually if the device is not connected to the internet.
- For information about the availability of Version 2002 or later in the update channels for Microsoft 365 Apps, see [Update history for Microsoft 365 Apps](https://docs.microsoft.com/officeupdates/update-history-office365-proplus-by-date).