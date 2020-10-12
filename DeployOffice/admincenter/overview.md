---
title: "Overview of the Microsoft 365 Apps admin center"
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
- M365initiative-coredeploy
ms.custom: Ent_Office_ProPlus
description: "Overview of the Microsoft 365 Apps admin center"
---

# Overview of the Microsoft 365 Apps admin center

The [Microsoft 365 Apps admin center](https://config.office.com/) provides modern management in the cloud for admins who  deploy and manage Microsoft 365 Apps in the enterprise. This article lists the features and services available in the admin center. For newly released or announced features, see [What's new in preview](#whats-new-in-preview).
 
## How to get to the admin center

Sign in at [config.office.com](https://config.office.com/) with your admin account. To sign into the admin center, your account must have either the global administrator, security administrator, or Office apps administrator role.

## Office cloud policy service

The Office cloud policy service lets you enforce policy settings for Microsoft 365 Apps for enterprise on a user's device, even if the device isn't domain joined or otherwise managed. When a user signs into Microsoft 365 Apps for enterprise on a device, the policy settings roam to that device. You can also enforce some policy settings for Office for the web, both for users who are signed in and for users who access documents anonymously. 

For more information, see [Overview of the Office cloud policy service for Microsoft 365 Apps for enterprise](../overview-office-cloud-policy-service.md).

## Security Policy Advisor

You can use Security Policy Advisor to receive and implement security policy recommendations. These recommendations are based on Microsoft best practices and information about your existing environment.

For more information, see [Overview of Security Policy Advisor for Microsoft 365 Apps for enterprise](../overview-of-security-policy-advisor.md).

## Office Customization Tool

The Office Customization Tool creates the configuration files that are used to deploy Office in large organizations. These configuration files give you more control over an Office installation: you can define which applications and languages are installed, how those applications should be updated, and application preferences. After creating the configuration files, you can use them with the [Office Deployment Tool](../overview-office-deployment-tool.md) to deploy a customized version of Office.

For more information, see [Overview of the Office Customization Tool](../overview-of-the-office-customization-tool-for-click-to-run.md).

## What's new in preview

The following features and services have been recently released in preview or recently announced. If you want to enable preview features in the admin center, click a preview feature and accept the license. If you have enabled preview features and want to disable them, contact Microsoft support.

> Preview features aren't available to everyone and are subject to change.

### Microsoft 365 Apps health 

Microsoft 365 Apps health monitors reliability and performance metrics and provides custom guidance to help optimize and troubleshoot Microsoft 365 Apps on your client devices. For more information, see [Microsoft 365 Apps health](microsoft-365-apps-health.md).

### Inventory

You can use the inventory page to see information about the devices in your organization, including hardware, operating system, and the Office software running on that device. For more information, see [Overview of inventory](inventory.md).

### Security update status

You can use the security update status page in the Microsoft 365 Apps admin center to see the which devices have installed the latest security updates for Office. For more information, see [Overview of the security update status](security-update-status.md).

### Servicing profile

With servicing profiles, you can automatically deliver monthly Office updates for specific users or groups. You can throttle updates for users where network bandwidth is an issue and you can enable update waves for controlled roll-outs based on whether devices meet specific criteria. For more information, see [Overview of servicing profile](servicing-profile.md).
