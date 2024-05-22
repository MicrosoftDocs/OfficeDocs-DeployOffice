---
title: "Overview of licensing and activation in Microsoft 365 Apps"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
ms.reviewer: mattphil
audience: ITPro
ms.topic: conceptual
ms.service: o365-proplus-itpro
ms.collection: Tier1
ms.localizationpriority: medium
recommendations: true
description: "Explains how to assign Microsoft 365 Apps licenses to users, and how individual installations are activated."
ms.date: 05/22/2024
---

# Overview of licensing and activation in Microsoft 365 Apps

This article shows how to assign Microsoft 365 Apps licenses to users and how to activate installations of Microsoft 365 Apps.

> [!NOTE]
> The information in this article also applies to Project Online Desktop Client and Visio Online Plan 2, which are licensed separately from Microsoft 365 Apps. 
 
Before deploying Microsoft 365 Apps to users in your organization, you must first assign licenses to those users. Each license allows a user to install Microsoft 365 Apps on up to five desktops, five tablets, and five mobile devices. Each installation is activated and kept activated automatically by cloud-based services associated with Office 365 (or Microsoft 365). This automatic activation means you don’t have to keep track of product keys and you don’t have to figure out how to use other activation methods such as Key Management Service (KMS) or Multiple Activation Key (MAK). All you have to do is purchase enough licenses, keep your Office 365 (or Microsoft 365) subscription current, and make sure your users can connect to the Office Licensing Service via the internet at least once every 30 days. When single sign-on is enabled, Microsoft 365 Apps detects the user’s credentials and is activated automatically.

If you remove a user's license, like when they leave your organization, their Microsoft 365 Apps installations enter [reduced functionality mode](overview-licensing-activation-microsoft-365-apps.md#what-is-reduced-functionality-mode). The Office Licensing Service, part of Microsoft 365, monitors licensed users and the number of computers they have Office installed on.

> [!NOTE]
> To activate Microsoft 365 Apps, TLS 1.2 must be enabled by default on the operating system. Some older operating systems, such as Windows 7 Service Pack 1 (SP1) and Windows Server 2012, need an update applied to enable TLS 1.2 by default. For more information, see [Update to enable TLS 1.1 and TLS 1.2 as default secure protocols in WinHTTP in Windows](https://support.microsoft.com/topic/c4bd73d2-31d7-761e-0178-11268bb10392). But, running Microsoft 365 Apps on these older operating systems isn't supported. For more information, see [End of support resources for Office](endofsupport/resources.md).
   
## Assign and manage licenses

To use Microsoft 365 Apps, your users need the appropriate license. Use one of these options to assign licenses:

- Assign a license to a user directly in the Office 365 portal by selecting a check box on the licenses page for the user’s account. 

- Use Office 365 PowerShell. For more information, see [Assign Microsoft 365 licenses to user accounts with PowerShell](/microsoft-365/enterprise/assign-licenses-to-user-accounts-with-microsoft-365-powershell).

- If you have a subscription to Microsoft Entra ID P1 or a higher version, you're eligible for group-based licensing. This feature is also available with Office 365 Enterprise E3, Office 365 A3, or Office 365 GCC G3 and newer versions. You can assign one or more product licenses to a group, and Microsoft Entra ID ensures that the licenses are assigned to all members of the group. Any new members who join the group are assigned the appropriate licenses. When they leave the group, those licenses are removed. For more information, see [Group-based licensing in Microsoft Entra ID](/azure/active-directory/fundamentals/active-directory-licensing-whatis-azure-portal). 

After a user is assigned a license, you can deploy Office to your users or your users can install Office directly from the Office 365 portal. If the user isn't assigned a license, they can't install Office from the Office 365 portal. We recommend assigning the license 24 hours prior to the deployment so you can ensure that the license is provisioned. 

## Licensing Modes

There are various licensing modes that can be used with a supported version of Microsoft 365 Apps.

### Subscription User Based Licensing
[More Information](about-microsoft-365-apps.md#licensing-differences)
- Subscription user based licensing is the default licensing mode for Microsoft 365 Apps. In this mode, the license is carried within the user’s profile. With a single license, users can install and activate Microsoft 365 Apps on up to 5 desktops/laptops, 5 tablets, and 5 mobile devices. Subscription User Based Licensing requires user level activation and requires user sign-in with a Microsoft Entra account.
- Subscription-based user licensing is recommended for most situations where each user has specific computers and rarely shares them.

### Shared Computer Activation
[More Information](overview-shared-computer-activation.md)
- In this license mode, you can install Microsoft 365 Apps on a single computer shared by multiple users. Each user signs in with their own account.
- This mode is typically used in scenarios with multiple licensed users connecting to the same device. It's the preferred configuration of Microsoft 365 Apps when used with Remote Desktop Services (RDS) and Virtual Desktop Infrastructure (VDI). It's ideal for shift workers, bank tellers, and users that need to [roam](office-deployment-tool-configuration-options.md#sharedcomputerlicensing-property-part-of-property-element) across devices.

### Device Based Licensing
[More Information](device-based-licensing.md)
- The Device Based License is designed to simplify management of Microsoft 365 Apps for Enterprise on devices shared by many users. Anyone that signs in and uses that device can use Microsoft 365 Apps for Enterprise to create and edit documents. Device Based Licensing doesn't require user level activation and doesn't require the user to have a Microsoft Entra account. There's no limit to the number of sign-ins and anyone with device access can use Microsoft 365 Apps for Enterprise applications.
- It's applicable in shared and open access device scenarios where users work across multiple shared devices or where users need occasional access. This licensing mode is an ideal mode for healthcare and education customers that don't sync generic accounts to Microsoft Entra ID.

> [!NOTE]
> The device must be synced to Microsoft Entra ID for a Device Based License to be assigned.

### Unattended License
[More Information](https://developer.microsoft.com/office/blogs/new-licensing-options-for-microsoft-365-for-unattended-scenarios)
- Organizations use an array of tools to connect applications and processes together, including frameworks automating other applications. These automation processes could be unattended in their operation and applying traditional user accounts isn't best practice.
- The Unattended License allows for the use of Office with service accounts or other non-user accounts, typically common for automation process execution.

> [!NOTE]
> Office applications are not specifically designed for large scale unattended usage scenarios. For more information, see [Considerations for Unattended Automation of Office in the Microsoft 365 for Unattended RPA Environment](/office/client-developer/integration/considerations-unattended-automation-office-microsoft-365-for-unattended-rpa)

### Viewer Mode
[More Information](overview-viewer-mode.md)
- This mode can be used when your organization has users that only need view/print capabilities instead of full create or edit capabilities. Viewer mode allows unlicensed users of Microsoft 365 Apps to view and print Office files without being prompted to activate Office. When Word, Excel, or PowerPoint are opened, users see a banner message underneath the ribbon in their Office apps that informs them that Office is in Viewer Mode.
- Viewer mod is ideal when the users have an Office for the Web license but not a Microsoft 365 Apps license.

> [!NOTE]
> It is not recommended to use Shared Computer Activation in conjunction with Viewer mode to prevent conflicts with the user's Office 365 application license.

## Activating Microsoft 365 Apps

Microsoft 365 Apps communicates with the Office Licensing Service and the Activation and Validation Service to obtain and activate a product key. Each day, or each time the user signs in their computer, the computer connects to the Activation and Validation Service to verify the license status and extend the product key. As long as the computer can connect to the internet at least once every 30 days, Microsoft 365 Apps remains fully functional. If the computer goes offline for more than 30 days, Microsoft 365 Apps enters reduced functionality mode until the next time a connection can be made. To get Microsoft 365 Apps fully functional again, the user can connect to the internet and let the Activation and Validation Service reactivate the installation, though in some cases the user might have to sign back in first.
 
> [!IMPORTANT]
> Because of its online activation features, Microsoft 365 Apps won't work on computers that are completely cut off from the internet. For those computers, we recommend installing Office LTSC Professional Plus 2021 and using a [traditional activation method](vlactivation/plan-volume-activation-of-office.md) such as Key Management Service (KMS) or Active Directory Domain Services.
 
### Managing activated installations

Each Microsoft 365 Apps license allows a user to install Microsoft 365 Apps on up to five desktops, five tablets, and five mobile devices. The user manages installations in the Office 365 portal.
  
If a user installs Microsoft 365 Apps on more than 10 devices, then the device that wasn't used for the longest amount of time is automatically deactivated. Microsoft 365 Apps goes into reduced functionality mode on the deactivated device.

> [!NOTE]
> This automatic deactivation is only supported for Windows devices at this time. 
 
## What is reduced functionality mode?

In reduced functionality mode, Microsoft 365 Apps remains installed on the device, but users can only view and print their documents. All features for editing or creating new documents are disabled, and the user sees a message similar to this one:
 
:::image type="content" source="./media/overview-licensing-activation-microsoft-365-apps/product-deactivated.png" alt-text="Product deactivation prompt with options to enter a product key or sign in to an active account.":::
 
The user can then choose one of the available options to reactivate Microsoft 365 Apps on that computer.

If a user doesn't have a license and tries to use Microsoft 365 Apps on an installed computer, the apps operate in reduced functionality mode. Also, the user is prompted to sign in and activate every time they open an app, such as Word or Excel.

## Improvements in licensing and activation

In Microsoft 365 Apps version 1910 and later, we made the following improvements:

- Users can install Microsoft 365 Apps on a new device without being prompted to deactivate it on another device. If a user has more than 10 devices with Microsoft 365 Apps activated, then the device that wasn't for the longest amount of time is automatically deactivated.

- When Microsoft 365 Apps on a device is deactivated, either from the portal or because a license was removed, a new user on that device can activate Microsoft 365 Apps without an error.

- When a user activates Microsoft 365 Apps on a device and a second user signs on to that device, both activations are now displayed in the activation report in the Microsoft 365 admin center.

## Related articles

[Licensing and activation data sent to Office 365 by Microsoft 365 Apps](./licensing-activation-data-sent-microsoft-365-apps.md)
 
[About Microsoft 365 Apps in the enterprise](./about-microsoft-365-apps.md)
 
[Choose how to deploy Microsoft 365 Apps](./plan-microsoft-365-apps.md)
