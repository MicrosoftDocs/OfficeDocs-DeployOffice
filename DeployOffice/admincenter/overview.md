---
title: "Overview of the Microsoft 365 Apps admin center"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: article
ms.service: o365-proplus-itpro
ms.localizationpriority: medium
ms.collection: Tier1
recommendations: true
description: "Overview of the Microsoft 365 Apps admin center"
ms.date: 03/01/2023
---

# Overview of the Microsoft 365 Apps admin center

The [Microsoft 365 Apps admin center](https://config.office.com/) provides modern management in the cloud for admins who  deploy and manage Microsoft 365 Apps in the enterprise. This article lists the features and services available in the admin center.

## How to get to the admin center

Sign in at [config.office.com](https://config.office.com/) with your admin account. To sign into the admin center, your account must have either the global administrator, security administrator, or Office apps administrator role.

> [!IMPORTANT]
>- The features in the Microsoft 365 Apps admin center, such as inventory and servicing profiles, aren't available to customers who have the following plans:
>   - Office 365 operated by 21Vianet
>   - Office 365 GCC
>   - Office 365 GCC High and DoD
>- Some functionality of the Office Customization Tool is available to all customers regardless of which plan they have. For more information, see [Office Customization Tool](#office-customization-tool).

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

## Servicing profile

With servicing profiles, you can automatically deliver monthly Office updates for specific users or groups. The updates are automated and sourced from the Office Content Delivery Network (CDN) on the internet, which allows for maximum uptime and minimizing end user impact and interruption. For more information, see [Overview of servicing profile](servicing-profile.md).

## OneDrive sync health

You can use the OneDrive sync health dashboard to check the sync status and sync app version of individual devices, monitor Known Folder Move roll out, and track sync errors. For more information, see [OneDrive sync reports in the Apps Admin Center](/onedrive/sync-health).