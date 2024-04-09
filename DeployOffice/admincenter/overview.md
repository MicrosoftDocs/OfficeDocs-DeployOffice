---
title: "Overview of the Microsoft 365 Apps admin center"
ms.author: manoth
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: conceptual
ms.service: o365-proplus-itpro
ms.localizationpriority: medium
ms.collection: 
 - tier3
 - essentials-manage
recommendations: true
description: "Overview of the Microsoft 365 Apps admin center and the features and services available in the admin center."
ms.date: 04/09/2024
---

# Overview of the Microsoft 365 Apps admin center

The [Microsoft 365 Apps admin center](https://config.office.com/) provides modern management in the cloud for admins who deploy and manage Microsoft 365 Apps in the enterprise. This article lists the features and services available in the admin center.

## Requirements

### Supported built-in admin roles

You can use any of the following Microsoft Entra built-in roles to access and manage features in the Microsoft 365 Apps admin center:

| Role                       | Description       |
| -------------------------- | ----------------- |
| Global Administrator       | This role can manage all aspects of Microsoft Entra ID and Microsoft services that use Microsoft Entra identities.
| Security Administrator     | This role can read security information and reports and manage configuration in Microsoft Entra ID and Office 365.
| Office Apps Administrator (**Recommended**) | This role can manage Office apps cloud services, including policy and settings management, and manage the ability to select, unselect, and publish 'what's new' feature content to end-user's devices.

> [!NOTE]
> Global Reader is another built-in role supported by the Microsoft 365 Apps admin center, but it does not support some features like cloud update or the Modern App Settings page.

### Licensing requirements

The center supports the following subscription plans:

| Type       | Subscription Plan |
| ---------- | ----------------- |
| Education  | <li>Microsoft 365 A3</li><li>Microsoft 365 A5</li>
| Business   | <li>Microsoft 365 Business Standard</li><li>Microsoft 365 Business Premium</li>
| Enterprise | <li>Microsoft 365 E3</li><li>Microsoft 365 E5</li>

> [!IMPORTANT]
> The center is not available to customers who have the following plans:
>- Microsoft 365 operated by 21Vianet
>- Microsoft 365 GCC
>- Microsoft 365 GCC High and DoD

### Product version requirements

You can manage Microsoft 365 Apps on Windows with the following version requirements:

- [Supported version of Microsoft 365 Apps](/officeupdates/update-history-microsoft365-apps-by-date)
- [Supported version of Microsoft Windows 10/11](/windows/release-health/supported-versions-windows-client)
- [Supported version of Windows Server that supports Microsoft 365 Apps](../endofsupport/windows-server-support.md)

### Network requirements

Devices running Microsoft 365 Apps require access to the following endpoints:

| Microsoft service | URLs required on allowlist |
| ----------------- | -------------------------- |
| Microsoft 365 Apps admin center      | <li>login.live.com</li><li>\*.config.office.com</li><li>\*.config.office.net</li>
| Office Content Delivery Network (CDN)        | <li>officecdn.microsoft.com</li><li>officecdn.microsoft.com.edgesuite.net</li><li>otelrules.azureedge.net</li>

  Source: [Microsoft 365 URLs and IP address ranges](/microsoft-365/enterprise/urls-and-ip-address-ranges)

### Requirements for using Microsoft Entra groups

Some features support the use of [Microsoft Entra groups](/entra/fundamentals/concept-learn-about-groups). For example, groups can be used to configure custom [rollout waves](cloud-update.ms#rollout-waves) or setup [device exclusions](cloud-update.ms#exclude-groups) in cloud update. In all cases, the membership of these groups supports user and/or device objects with the following requirements:

- **Device objects** must be Microsoft Entra joined or hybrid joined.
- **User objects** must be present in Microsoft Entra ID and have a [supported license](#licensing-requirements) assigned.
- Multiple groups can be used, but a single group should contain no more than 20,000 objects.
- Nested groups supports up to three levels deep.

> [!NOTE]
> The Cloud Policy Service only supports user objects as the policies set apply on a user level, not device level.

## Cloud Policy service for Microsoft 365

> [!NOTE]
> "Office cloud policy service" has been renamed to "Cloud Policy service for Microsoft 365." In most cases, we'll just refer to it as Cloud Policy.

Cloud Policy lets you enforce policy settings for Microsoft 365 Apps for enterprise on a user's device, even if the device isn't domain joined or otherwise managed. When a user signs into Microsoft 365 Apps for enterprise on a device, the policy settings roam to that device. You can also enforce some policy settings for Office for the web, both for users who are signed in and for users who access documents anonymously.

For more information, see [Overview of Cloud Policy service for Microsoft 365](overview-cloud-policy.md).

## Office Customization Tool

The Office Customization Tool creates the configuration files that are used to deploy Office in large organizations. These configuration files give you more control over an Office installation: you can define which applications and languages are installed, how those applications should be updated, and application preferences. After creating the configuration files, you can use them with the [Office Deployment Tool](../overview-office-deployment-tool.md) to deploy a customized version of Office.

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

## OneDrive sync health

You can use the OneDrive sync health dashboard to check the sync status and sync app version of individual devices, monitor Known Folder Move roll out, and track sync errors. For more information, see [OneDrive sync reports in the Apps Admin Center](/onedrive/sync-health).
