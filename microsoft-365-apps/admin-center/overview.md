---
title: "Overview of the Microsoft 365 Apps admin center"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: conceptual
ms.service: o365-proplus-itpro
ms.localizationpriority: medium
ms.collection: 
 - tier1
 - essentials-manage
recommendations: true
description: "Overview of the Microsoft 365 Apps admin center and the features and services available in the admin center."
ms.date: 08/01/2024
---

# Overview of the Microsoft 365 Apps admin center

The [Microsoft 365 Apps admin center](https://config.office.com/) provides modern management in the cloud for admins who deploy and manage Microsoft 365 Apps in the enterprise. This article lists the features and services available in the admin center.

## Requirements

### Supported built-in admin roles
<!--Using include for adding requirements-->
[!INCLUDE [Roles requirements](./includes/requirements-roles.md)]

### Licensing requirements
<!--Using include for adding requirements-->
[!INCLUDE [License requirements](./includes/requirements-licenses.md)]

### Product version requirements
<!--Using include for adding requirements-->
[!INCLUDE [Version requirements](./includes/requirements-versions.md)]

### Network requirements
<!--Using include for adding requirements-->
[!INCLUDE [Network requirements](./includes/requirements-network.md)]

### Microsoft Entra groups requirements
Some features support the use of [Microsoft Entra groups](/entra/fundamentals/concept-learn-about-groups). For example, groups can be used to configure custom [rollout waves](cloud-update.md#rollout-waves) or setup [device exclusions](cloud-update.md#exclude-groups) in cloud update.

<!--Using include for adding requirements-->
[!INCLUDE [Groups requirements](./includes/requirements-groups.md)]

> [!NOTE]
> The Cloud Policy Service only supports user objects as the policies set apply on a user level, not device level.

## Cloud Policy service for Microsoft 365

> [!NOTE]
> "Office cloud policy service" has been renamed to "Cloud Policy service for Microsoft 365." In most cases, we'll just refer to it as Cloud Policy.

Cloud Policy lets you enforce policy settings for Microsoft 365 Apps for enterprise on a user's device, even if the device isn't domain joined or otherwise managed. When a user signs into Microsoft 365 Apps for enterprise on a device, the policy settings roam to that device. You can also enforce some policy settings for Office for the web, both for users who are signed in and for users who access documents anonymously.

For more information, see [Overview of Cloud Policy service for Microsoft 365](overview-cloud-policy.md).

## Office Customization Tool

The Office Customization Tool creates the configuration files that are used to deploy Office in large organizations. These configuration files give you more control over an Office installation: you can define which applications and languages are installed, how those applications should be updated, and application preferences. After creating the configuration files, you can use them with the [Office Deployment Tool](../deploy/overview-office-deployment-tool.md) to deploy a customized version of Office.

> [!NOTE]
> - If you don't sign in to the Microsoft 365 Apps admin center, you can still use the Office Customization Tool regardless of which plan you have.
> - Office 365 GCC customers can sign in and use the Office Customization Tool.

For more information, see [Overview of the Office Customization Tool](overview-office-customization-tool.md).

## Microsoft 365 Apps health

Microsoft 365 Apps health monitors reliability and performance metrics and provides custom guidance to help optimize and troubleshoot Microsoft 365 Apps on your client devices. If you're curious about application crash rate or boot time on a specific Microsoft 365 Apps version, you can see the insights within Apps Health. For more information, see [Microsoft 365 Apps health](microsoft-365-apps-health.md).

## Inventory

You can use the inventory page to see information about the devices in your organization, including hardware, operating system, and the Office software running on that device. Insights about channel, version, build, and even last signed in user are available. For more information, see [Overview of inventory](inventory.md).

## Security update status

You can use the security update status page in the Microsoft 365 Apps admin center to see which devices have installed the latest security updates for Office. Additionally, set a goal for your organization to achieve. For more information, see [Overview of the security update status](security-update-status.md).

## Cloud update

With cloud update, you can automatically deliver monthly Microsoft 365 Apps updates to devices on Current Channel or Monthly Enterprise Channel. The updates are automated and sourced from the Office Content Delivery Network (CDN) on the internet, which allows for maximum uptime and minimizing end user impact and interruption. For more information, see [Overview of cloud update](cloud-update.md).

## Update validation

Update validation enables administrators to test updates on a select group of devices prior to a full rollout. This feature safeguards against update-related disruptions by monitoring key performance and stability metrics. It delivers precise insights for proactive issue resolution, empowering admins to deploy updates with assurance. If issues are detected, it pinpoints the impacted devices and apps, offering solutions such as rollback or update suspension. For more information, see [Update Validation](update-validation.md).

## OneDrive sync health

You can use the OneDrive sync health dashboard to check the sync status and sync app version of individual devices, monitor Known Folder Move roll out, and track sync errors. For more information, see [OneDrive sync reports in the Apps Admin Center](/onedrive/sync-health).
