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
ms.date: 06/22/2023
---

# New Improvements to Microsoft 365 Apps admin center coming soon!

New improvements are coming to the Microsoft 365 Apps admin center, specifically targeting the servicing profile and inventory features. If you're currently using these services, here are some key details to keep in mind:

## Overview
For both the servicing profile and inventory a new user interface as well as some feature updates will be released soon. The transition will happen automatically. No manual intervention or actions are required. Both the inventory data and as well as update status and configuration of servicing profiles will be carried forward.

The upcoming changes will mainly happen in three areas:

- [New Terminology](#new-terminology)
- [New user experience](#changes-in-user-experience)
- [Changes to existing features](#changes-in-features) and [what admin's should consider](#considerations-for-admins)

## New Terminology

**Cloud update:** Introducing the next generation of servicing profile, enhanced with advanced capabilities and an improved user experience.
**Profile:** Every update management configuration for each cadence is referred to as a Profile. Tenants can currently use a Monthly profile. Soon, they'll also have the options to use a Current profile and/or a Semi-Annual profile. These profiles enable tenants to manage Microsoft 365 Apps updates on their devices as applicable to their specific tenant.

> [!NOTE]
> The schedule and availability of Current profile and Semi-Annual profile are not determined as of yet.

## Changes in user experience

Here's what you should expect:

- New Updates Overview page in the Servicing section which provides a comprehensive snapshot of the update progress
- The settings for **Exclude Groups** and **Exclusion Windows** are now located in a new entry **Settings** under the **Servicing** node.
- The Devices tab in cloud update is no longer be available. Instead, device details are accessible through View All Devices from the Updates Overview and Profile Overview pages.
- The Device Selection Criteria from the Settings tab are removed.
- Inventory will get additional columns:
  - Cloud update status: representing if this device is currently updated by profiles
  - Is Excluded: Representing if this device belongs to an Azure AD group which is excluded using the 'Exclude Group' setting

## Changes in features

- The Updates Overview page, along with the individual Profile Overview page, is now available. This provides a comprehensive snapshot of the progress of updates across your tenant, and the configurations of your tenant settings. These settings are now available at the broader tenant level.
- Exclude groups and exclusion window settings transition to a tenant level instead of the device level. You can find them in the Tenant Settings tab.
  - Exclude groups: Devices excluded as part of the exclude groups setting will continue to be excluded from Semi Annual Profile and Current Profile after they become available.
  - Exclusion window: Any exclusion window that's set, applies at a tenant level. This means no updates happen for devices managed by cloud update across Current Profile, Monthly Profile and Semi-Annual Profile, during an active exclusion window for applicable devices groups.

 The following columns will also be made available in Inventory:

- Cloud update status: This column is available in Inventory when you select View Devices. Cloud update status indicates the devices in your tenant that cloud update actively manages.
- Is Excluded: In the Inventory's Devices view, this column appears after you select View All Devices from either the Updates Overview or Profile Overview pages of cloud update. It flags the devices in your tenant that are excluded from cloud update due to the exclude groups setting at the tenant level.

## Considerations for admins

**If you're onboarding to cloud update as a new customer**

- Only devices from the Monthly Enterprise Channel map to Monthly Enterprise Channel devices. The option to onboard a subset of devices through Start Small will no longer be available.

**If you're an existing customer using Azure AD group-based filtering or have fully on-boarded your Monthly Enterprise Channel devices to cloud update**

-  Azure AD group-based filtering  is no longer accessible. Now, the Profile handles the onboarding, management, and updating of all devices on the Monthly Enterprise Channel
- The option to exclude devices or Microsoft Azure Active Directory (Azure AD) groups based on the presence of macros, add-ins, or minimum disk space has been removed. As a result, Profile is now onboarding, managing, and updating any devices previously exempt from these settings.

> [!IMPORTANT]
> If you're using cloud update through Azure AD group-based filtering or you've fully on-boarded to the Monthly Profile, be aware of these changes. All devices on the Monthly Enterprise Channel in your tenant currently excluded from cloud update due to Azure AD group-based filtering, macros and add-ins presence, or limited disk space will be affected. These devices will automatically transition to Monthly Profile for management and updates.
