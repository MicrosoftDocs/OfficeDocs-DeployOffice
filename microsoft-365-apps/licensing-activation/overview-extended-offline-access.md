---
title: "Overview of extended offline access for Microsoft 365 Apps for enterprise"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: conceptual
ms.service: o365-proplus-itpro
ms.collection: Tier2
ms.localizationpriority: medium
recommendations: false
description: "Overview of extended offline access for Microsoft 365 Apps."
ms.date: 03/01/2023
---

# Overview of extended offline access for Microsoft 365 Apps

Extended offline access enables devices running Microsoft 365 Apps for enterprise to stay activated for up to six months without the need to connect to the internet to validate the license and install updates. To use extended offline access, you must have Version 2002 or later of Microsoft 365 Apps. To enable extended offline access, your organization must have a Microsoft 365 Apps license subscription.

> [!IMPORTANT]
> Extended offline access is not available as a license for all customers. To find out about eligibility for your organization, contact your Microsoft account representative.

Extended offline access is designed for users with devices that need to go offline for an extended period, such as users in secure environments, remote locations, or on field trips with no connectivity. 

## Online setup of the device for users

To enable extended offline access for users in your organization:
- Admin installs Microsoft 365 Apps and enables extended offline access by deploying the [Group Policy](#enable-extended-offline-access-with-group-policy) or the [registry](#enable-extended-offline-access-with-the-registry).
- Once deployed, the user signs into Windows using a Microsoft Entra account.
- User launches an Office app like Word or Excel.
- User confirms Office license is valid for 180 days.

## User experience for extended offline access

When extended offline access is enabled on a device, the Office account page for Microsoft 365 Apps on the device displays the license expiration date and a link to information about extending the license.

> **License Information**  
Device name: PC-XXXXXX  
License expires: *\<date\>*  
To extend this license, go to https://go.microsoft.com/fwlink/?linkid=2109092


## Enable extended offline access with Group Policy

To enable extended offline access for users in your organization with Group Policy:

- Enable the **Allow extended offline use** policy setting. You can find this policy setting under Computer Configuration\Policies\Administrative Templates\Microsoft Office\Licensing Settings.

To use this policy setting, download and install the [Group Policy Administrative Template files (ADMX/ADML) for enabling the extended offline access for Microsoft 365 Apps](https://download.microsoft.com/download/5/6/c/56ce6724-dbdf-4794-819c-470077b6f6b0/Group_Policy.zip) from the Microsoft Download Center.

## Enable extended offline access with the registry

If you can't use Group Policy to enable extended offline access, you can update the registry. To enable the setting, set the following:

```console
[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Office\16.0\Common\Licensing]
"ExtendedOfflineSubscription"=dword:00000001
    
[HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Policies\Microsoft\Office\16.0\Common\Licensing]
"ExtendedOfflineSubscription"=dword:00000001
```

To disable the setting, set the following:

```console
[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Office\16.0\Common\Licensing]
"ExtendedOfflineSubscription"=dword:00000000
    
[HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Policies\Microsoft\Office\16.0\Common\Licensing]
"ExtendedOfflineSubscription"=dword:00000000
```

## Extended offline access for devices with no internet access

When a device loses internet access, the user can continue to use Office without an internet connection for up to 180 days. When 15 days remain, the user receives an in-client notification to connect to the internet so the license can be verified. If possible, the user should connect the device to the internet, which will enable an additional 180 days. 

If the device cannot connect to the internet every 180 days, you can still [extend the Office license for offline use](https://support.microsoft.com/office/06de5162-e230-4ce6-83bb-e6f06190a8f5).

## Considerations when using extended offline access

- Extended offline access is currently supported for Word, Excel, PowerPoint, Outlook, OneNote, Publisher and Access, as well as Project and Visio subscription plans. For information about how to exclude applications when deploying, see [ExcludeApp element](office-deployment-tool-configuration-options.md#excludeapp-element). 
- Updates, such as new features and security updates, must be applied manually if the device is not connected to the internet.
- For information about the availability of Version 2002 or later in the update channels for Microsoft 365 Apps, see [Update history for Microsoft 365 Apps](/officeupdates/update-history-office365-proplus-by-date).
