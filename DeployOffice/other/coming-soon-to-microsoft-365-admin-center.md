---
title: "New Improvements to Microsoft 365 Apps admin center coming soon"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
ms.reviewer: dimehta
audience: ITPro
ms.topic: conceptual
ms.service: o365-proplus-itpro
ms.collection: Tier1
ms.localizationpriority: medium
ROBOTS: NOINDEX, NOFOLLOW
recommendations: false
hideEdit: true
description: "Introduce enhancements for better servicing and inventory management, streamlining updates and user experience"
ms.date: 06/13/2023
---

# New Improvements to Microsoft 365 Apps admin center coming soon!

New improvements are coming to the Microsoft 365 Apps admin center, specifically targeting the servicing profile and inventory features. If you're currently using these services, here are some key details to keep in mind:

## Overview
Transitioning to our updated services? Don't worry, we've got you covered! If inventory and cloud update are part of your settings, these are automatically activated in the new setup, eliminating the need for manual intervention. You won't have to navigate through the portal and make any selections. If inventory was functioning prior to the update, it continues to do so afterwards. Similarly, if profiles were consistently updating your Monthly Enterprise Channel devices, they'll continue to do so. It's a seamless transition designed for your convenience!

## New Terminology

**Cloud update:** Introducing the next generation of servicing profile, enhanced with advanced capabilities and an improved user experience.  
**Profile:** Each update management configuration for every cadence will be called a Profile. Tenants have the option to use a Monthly profile, and later, options to use a Current profile and/or Semi-Annual profile will soon be available. These profiles enable tenants to manage Microsoft 365 Apps updates on their devices as applicable to their specific tenant.

> [!NOTE]
> The schedule and availability of Current profile and Semi-Annual profile are not determined as of yet.

## Changes in user experience

Cloud update, formerly known as servicing profile, will receive significant improvements in user experience. Here's what you should expect:

- Devices from other channels can't directly be mapped to a profile that's not built for that channel.
- The Devices tab in cloud update will no longer be available. Instead, device details are accessible through View All Devices from the Updates Overview and Profile Overview pages.
- The Device Selection Criteria from the Settings tab are removed.

Inventory will now be the go-to source for all device information across the portal. This applies irrespective of the context in which the device information is viewed, such as View Devices. Here, the Devices page lists all devices activated with a Microsoft 365 subscription license in your organization.

## Changes in features

- The Updates Overview page is available, in addition to the individual Profile Overview page. This provides a snapshot of the updates progress across your tenant and your tenant settings. These are settings that are now applicable at a tenant level instead of just the profile level.
- Exclude groups and exclusion window settings transition to a tenant level instead of the device level. You can find them in the Tenant Settings tab.
  - Exclude groups: Devices excluded as part of the exclude groups setting will continue to be excluded from Semi Annual Profile and Current Profile after they become available.
  - Exclusion window: Any exclusion window that's set will apply at a tenant level. This means no updates happen for devices managed by cloud update across Current Profile, Monthly Profile and Semi-Annual Profile, during an active exclusion window for applicable devices groups.

 The following columns will also be made available in Inventory:

- Cloud update status: This column will be available in Inventory when you select View Devices. It indicates which devices in your tenant are actively managed by cloud update.
- Is Excluded: In the Inventory's Devices view, this column appears after you select View All Devices from either the Updates Overview or Profile Overview pages of cloud update. It flags the devices in your tenant that are excluded from cloud update due to the exclude groups setting at the tenant level.

## Considerations for admins

### If you're onboarding to cloud update as a new customer

- Only devices from the Monthly Enterprise Channel map to Monthly Enterprise Channel devices. The option to onboard a subset of devices through Start Small will no longer be available.

### If you're an existing customer using Start Small or those who have fully on-boarded their Monthly Enterprise Channel devices to cloud update

- Start Small capability is no longer available. Profile onboards, manages, and updates all devices on the Monthly Enterprise Channel.
- The option to exclude devices or Microsoft Azure Active Directory (Azure AD) groups based on the presence of macros, add-ins, or minimum disk space has been removed. As a result, the profile onboards, manages, and updates any devices that these settings previously excluded.

> [!IMPORTANT]
> If you're using cloud update through Start Small or you've fully on-boarded to the Monthly Profile, be aware of these changes. All devices on the Monthly Enterprise Channel in your tenant currently excluded from cloud update due to Start Small, macros and add-ins presence, or limited disk space will be affected. These devices will automatically transition to Monthly Profile for management and updates.
