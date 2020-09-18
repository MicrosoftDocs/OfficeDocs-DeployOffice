---
title: "Overview of the Microsoft 365 Apps Admin Center"
ms.author: jwhit
author: jwhit-MSFT
manager: laurawi
audience: ITPro
ms.topic: article
ms.service: o365-proplus-itpro
localization_priority: Normal
ms.collection: 
- Ent_O365
- M365-modern-desktop
ms.custom: Ent_Office_ProPlus
description: "Overview of the Microsoft 365 Apps Admin Center"
---

# Overview of the Microsoft 365 Apps admin center

The [Microsoft 365 Apps admin center](https://aka.ms/o365clientmgmt) provides modern management in the cloud for admins who  deploy and manage Microsoft 365 Apps in the enterprise. This article lists the features and services available in the admin center. For newly released or announced features, see [What's new in preview](#whats-new-in-preview).
 
## How to get to the admin center

Sign in at [config.office.com](https://config.office.com/) with your admin account. To sign into the admin center, your account must have either the global administrator, security administrator, or Office apps administrator role.

## Office cloud policy service

The Office cloud policy service lets you enforce policy settings for Microsoft 365 Apps for enterprise on a user's device, even if the device isn't domain joined or otherwise managed. When a user signs into Microsoft 365 Apps for enterprise on a device, the policy settings roam to that device. You can also enforce some policy settings for Office for the web, both for users who are signed in and for users who access documents anonymously. 

For more information, see [Overview of the Office cloud policy service for Microsoft 365 Apps for enterprise](../overview-office-cloud-policy-service.md).

## Security Policy Advisor

You can use Security Policy Advisor to receive and implement security policy recommendations. These recommendations are based on Microsoft best practices and information about your existing environment. 

For more information, see [Overview of Security Policy Advisor for Microsoft 365 Apps for enterprise](../overview-of-security-policy-advisor.md).

## Office customization tool

The Office customization tool creates the configuration files that are used to deploy Office in large organizations. These configuration files give you more control over an Office installation: you can define which applications and languages are installed, how those applications should be updated, and application preferences. After creating the configuration files, you can use them with the [Office Deployment Tool](overview-office-deployment-tool.md) to deploy a customized version of Office. 

For more information, see [Overview of the Office Customization Tool](../overview-of-the-office-customization-tool-for-click-to-run.md).

## What's new in preview

The following features and services have been recently released in preview or recently announced. In some cases, they are not yet available. If you want to enable preview features in the admin center, click a preview feature and accept the license.

### Microsoft 365 Apps health 

> [!IMPORTANT]
> This is pre-release documentation for a preview program that isn’t available to everyone and is subject to change.

Microsoft 365 Apps health monitors reliability and performance metrics and provides custom guidance to help optimize and troubleshoot Microsoft 365 Apps on your client devices.  

Requirements: Windows 10 and Microsoft 365 Apps, version 2006 or later. To use with earlier versions, see [Configure client devices](#configure-client-devices-with-earlier-versions-of-microsoft-365-apps). 

For more information on how to use the Apps health service, see [Microsoft 365 Apps health](microsoft-365-apps-health.md).

### Inventory 

> [!IMPORTANT]
> This is pre-release documentation for a feature that has been announced but is not yet available. More information will be provided when it's available in preview.

You can use the inventory pane to view details about the client devices in your organization, including hardware, operating system and the version of Office on the device. 

Requirements: Windows 10 and Microsoft 365 Apps, version 2006 or later. To use with earlier versions, see [Configure client devices](#configure-client-devices-with-earlier-versions-of-microsoft-365-apps). 

### Security currency

> [!IMPORTANT]
> This is pre-release documentation for a feature that has been announced but is not yet available. More information will be provided when it's available in preview.

Security currency shows whether the client devices in your organization have been updated with the latest security patch.

Requirements: Windows 10 and Microsoft 365 Apps, version 2006 or later. To use with earlier versions, see [Configure client devices](#configure-client-devices-with-earlier-versions-of-microsoft-365-apps). 

### Servicing profile

> [!IMPORTANT]
> This is pre-release documentation for a feature that has been announced but is not yet available. More information will be provided when it's available in preview.

The servicing profile provides a simple way for admins to manage and monitor updates to Microsoft 365 Apps for client devices. Devices in the servicing profile receive updates for the Monthly Enterprise Channel beginning the second Tuesday of every month. To help plan for network capacity, updates are delivered in waves. Using the servicing profile, you can monitor which devices have been updated and fix update issues, including restoring devices to a previous build.

Requirements: Windows 10 and Microsoft 365 Apps, version 2006 or later. To use with earlier versions, see [Configure client devices](#configure-client-devices-with-earlier-versions-of-microsoft-365-apps). 

### Configure client devices with earlier versions of Microsoft 365 Apps

If you want to use a feature that requires version 2006 or later, you can [download a new component for the click-to-run service](https://go.microsoft.com/fwlink/?linkid=2141871) and install it on those devices. 
