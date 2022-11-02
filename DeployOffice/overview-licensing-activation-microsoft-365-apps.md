---
title: "Overview of licensing and activation in Microsoft 365 Apps"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
ms.reviewer: mattphil
audience: ITPro
ms.topic: article
ms.service: o365-proplus-itpro
ms.localizationpriority: medium
ms.collection: Ent_O365
ms.custom: Ent_Office_ProPlus
recommendations: true
description: "Explains how to assign Microsoft 365 Apps licenses to users, and how individual installations are activated."
---

# Overview of licensing and activation in Microsoft 365 Apps

This article shows how to assign Microsoft 365 Apps licenses to users and how to activate installations of Microsoft 365 Apps.

> [!NOTE]
> The information in this article also applies to Project Online Desktop Client and Visio Online Plan 2 (previously named Visio Pro for Office 365), which are licensed separately from Microsoft 365 Apps.  
  
Before deploying Microsoft 365 Apps to users in your organization, you must first assign licenses to those users. Each license allows a user to install Microsoft 365 Apps on up to five desktops, five tablets, and five mobile devices. Each installation is activated and kept activated automatically by cloud-based services associated with Office 365 (or Microsoft 365). This automatic activation means you don’t have to keep track of product keys and you don’t have to figure out how to use other activation methods such as Key Management Service (KMS) or Multiple Activation Key (MAK). All you have to do is purchase enough licenses, keep your Office 365 (or Microsoft 365) subscription current, and make sure your users can connect to the Office Licensing Service via the internet at least once every 30 days. When single sign-on is enabled, Microsoft 365 Apps detects the user’s credentials and is activated automatically.

If you remove a user's license (for example, if the user leaves your organization), any installations of Microsoft 365 Apps that the user had will go into [reduced functionality mode](overview-licensing-activation-microsoft-365-apps.md#what-is-reduced-functionality-mode). The Office Licensing Service, a part of Microsoft 365, keeps track of which users are licensed and how many computers they've installed Office on.

> [!NOTE]
> To activate Microsoft 365 Apps, TLS 1.2 must be enabled by default on the operating system. Some older operating systems, such as Windows 7 Service Pack 1 (SP1) and Windows Server 2012, need an update applied to enable TLS 1.2 by default. For more information, see [Update to enable TLS 1.1 and TLS 1.2 as default secure protocols in WinHTTP in Windows](https://support.microsoft.com/topic/c4bd73d2-31d7-761e-0178-11268bb10392). But, running Microsoft 365 Apps on these older operating systems isn't supported. For more information, see [End of support resources for Office](endofsupport/resources.md).
     
## Assign and manage licenses

To use Microsoft 365 Apps, your users will need the appropriate license. To assign licenses, do one of the following:

- Assign a license to a user directly in the Office 365 portal by selecting a check box on the licenses page for the user’s account. 

- Use Office 365 PowerShell. For more information, see [Assign Microsoft 365 licenses to user accounts with PowerShell](/microsoft-365/enterprise/assign-licenses-to-user-accounts-with-microsoft-365-powershell).

- If you have a subscription for Azure AD Premium P1 and above, or an edition of Office 365 Enterprise E3 or Office 365 A3 or Office 365 GCC G3 and above, you can use group-based licensing with Azure AD. You can assign one or more product licenses to a group, and Azure AD ensures that the licenses are assigned to all members of the group. Any new members who join the group are assigned the appropriate licenses. When they leave the group, those licenses are removed. For more information, see  [Group-based licensing in Azure Active Directory](/azure/active-directory/fundamentals/active-directory-licensing-whatis-azure-portal). 

After a user is assigned a license, you can deploy Office to your users or your users can install Office directly from the Office 365 portal. If the user hasn't been assigned a license, the user can't install Office from the Office 365 portal. We recommend assigning the  license 24 hours prior to the deployment so you can ensure that the license is provisioned. 

## Licensing Modes

There are various licensing modes that can be used with a supported version of Microsoft 365 Apps.

### Subscription User Based Licensing
[More Information](about-microsoft-365-apps.md#licensing-differences)
- This is the default licensing mode for Microsoft 365 Apps.  In this mode, the license is carried within the user’s profile.  With a single license, users can install and activate Microsoft 365 Apps on up to 5 desktops/laptops, 5 tablets, and 5 mobile devices.  Subscription User Based Licensing requires user level activation and requires user sign-in with an Azure Active Directory account.
- It is recommended for most scenarios where the user has defined computers and don’t often share them.

### Shared Computer Activation
[More Information](overview-shared-computer-activation.md)
- This licensing mode lets you deploy Microsoft 365 Apps to a single computer that is shared by multiple users and where those users are logging in with their own account.
- This mode is typically used in scenarios with multiple licensed users connecting to the same device.  It is the preferred configuration of Microsoft 365 Apps when used with Remote Desktop Services (RDS) and Virtual Desktop Infrastructure (VDI).  It is ideal for shift workers, bank tellers, and users that need to [roam](office-deployment-tool-configuration-options.md#sharedcomputerlicensing-property-part-of-property-element) across devices.

### Device Based Licensing
[More Information](device-based-licensing.md)
- The Device Based License is designed to simplify management of Microsoft 365 Apps for Enterprise on devices shared by many users.  Anyone that signs in and uses that device can use Microsoft 365 Apps for Enterprise to create and edit documents.  Device Based Licensing does not require user level activation and does not require the user to have an Azure Active Directory account.  There is no limit to the number of sign-ins and anyone with device access can use Microsoft 365 Apps for Enterprise applications.
- It is applicable in shared and open access device scenarios where users work across multiple shared devices or where users need occasional access.  This is an ideal mode for healthcare and education customers that do not sync generic accounts to Azure Active Directory.

> [!NOTE]
> The device must be synced to Azure Active Directory for a Device Based License to be assigned.

### Unattended License
[More Information](https://developer.microsoft.com/office/blogs/new-licensing-options-for-microsoft-365-for-unattended-scenarios)
- Organizations use an array of tools to connect applications and processes together, including frameworks automating other applications.  These automation processes may be unattended in their operation and leveraging traditional user accounts is not best practice.
- The Unattended License allows for the use of Office with service accounts or other non-user accounts, typically common for automation process execution.

> [!NOTE]
> Office applications are not specifically designed for large scale unattended usage scenarios.  For more information, see [Considerations for Unattended Automation of Office in the Microsoft 365 for Unattended RPA Environment](/office/client-developer/integration/considerations-unattended-automation-office-microsoft-365-for-unattended-rpa)

### Viewer Mode
[More Information](overview-viewer-mode.md)
- This mode can be used when your organization has users that only need view/print capabilities instead of full create or edit capabilities.  This allows unlicensed users of Microsoft 365 Apps to view and print Office files without being prompted to activate Office.  When Word, Excel, or PowerPoint are opened, users see a banner message underneath the ribbon in their Office apps that informs them that Office is in Viewer Mode.
- This is an ideal mode when the users have an Office for the Web license but not a Microsoft 365 Apps license.

## Activating Microsoft 365 Apps

Microsoft 365 Apps communicates with the Office Licensing Service and the Activation and Validation Service to obtain and activate a product key. Each day, or each time the user logs on to their computer, the computer connects to the Activation and Validation Service to verify the license status and extend the product key. As long as the computer can connect to the internet at least once every 30 days, Microsoft 365 Apps remains fully functional. If the computer goes offline for more than 30 days, Microsoft 365 Apps enters reduced functionality mode until the next time a connection can be made. To get Microsoft 365 Apps fully functional again, the user can connect to the internet and let the Activation and Validation Service reactivate the installation, though in some cases the user may have to sign back in first.
  
> [!IMPORTANT]
> Because of its online activation features, Microsoft 365 Apps won't work on computers that are completely cut off from the internet. For those computers, we recommend installing Office LTSC Professional Plus 2021 and using a [traditional activation method](vlactivation/plan-volume-activation-of-office.md) such as Key Management Service (KMS) or Active Directory Domain Services.
  
### Managing activated installations

Each Microsoft 365 Apps license allows a user to install Microsoft 365 Apps on up to five desktops, five tablets, and five mobile devices. The user manages installations in the Office 365 portal.
    
If a user installs Microsoft 365 Apps on more than 10 devices, then the device that hasn't been used for the longest amount of time is automatically deactivated. Microsoft 365 Apps goes into reduced functionality mode on the deactivated device. Note that this automatic deactivation is only supported for Windows devices at this time. 
  
## What is reduced functionality mode?

In reduced functionality mode, Microsoft 365 Apps remains installed on the device, but users can only view and print their documents. All features for editing or creating new documents are disabled, and the user sees a message like the following:
  
![Product deactivated.](images/78aa59b0-8772-4ba2-8094-bfeb65602ab7.png)
  
The user can then choose one of the available options to reactivate Microsoft 365 Apps on that computer.

If the user hasn't been assigned a license, and they try to use Microsoft 365 Apps on a computer where it's installed, it will be in reduced functionality mode. Also, the user will be prompted to sign in and activate every time they open an app, such as Word or Excel.

## Improvements in licensing and activation

In Microsoft 365 Apps version 1910 and later, we made the following improvements:

- Users can install Microsoft 365 Apps on a new device without being prompted to deactivate it on another device. If a user has more than 10 devices with Microsoft 365 Apps activated, then the device that hasn't been used for the longest amount of time is automatically deactivated.

- When Microsoft 365 Apps on a device has been deactivated, either from the portal or because a license has been removed, a new user on that device can activate Microsoft 365 Apps without an error.

- When a user activates Microsoft 365 Apps on a device and a second user signs on to that device, both activations are now displayed in the activation report in the Microsoft 365 admin center.

## Related topics

[Licensing and activation data sent to Office 365 by Microsoft 365 Apps](./licensing-activation-data-sent-microsoft-365-apps.md)
  
[About Microsoft 365 Apps in the enterprise](./about-microsoft-365-apps.md)
  
[Choose how to deploy Microsoft 365 Apps](./plan-microsoft-365-apps.md)
