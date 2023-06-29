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
ms.date: 06/29/2023
---

# New Improvements to Microsoft 365 Apps admin center coming soon!

New improvements are coming to the Microsoft 365 Apps admin center, specifically targeting the servicing profile and inventory features. If you're currently using these services, here are some key details to keep in mind:

## Overview
For both the servicing profile and inventory a new user interface as well as new features updates be released soon. The transition will happen automatically. No manual intervention or actions are required. Both the inventory data and as well as update status and configuration of servicing profiles will be carried forward. In tandem, some existing features will receive updates or be removed as well.

The upcoming changes will mainly happen in three areas:

- [New Terminology](#new-terminology)
- [New user experience](#changes-in-user-experience)
- [Changes to existing features](#changes-in-features) and [what admin's should consider](#considerations-for-admins)

## New Terminology

- **Cloud Update**: We will rename **servicing profiles** to **Cloud Update**.
- **Profile:** Each update management configuration for an update channel is referred to as a profile. Tenants can currently use a Monthly profile. Soon, they'll also have the options to use a Current profile and/or a Semi-Annual profile. These profiles enable you to manage Microsoft 365 Apps updates across update channels with specific configurations for each.

> [!NOTE]
> The schedule and availability of Current profile and Semi-Annual profile are not determined as of yet.

## Changes in user experience

Here is what you should expect:

- The entry **Servicing** in the left-hand navigation gets renamed to **Cloud Update**.
- A new **Overview** page gets added to the **Cloud Update** section. It provides a comprehensive snapshot of the update progress across profiles.
- In the **Monthly Enterprise** navigation point, the following changes will be introduced:
  - The **Devices** tab is removed. To view a list of devices with e.g, the assigned rollout wave, navigate to **Overview** and click on **View All Devices**. 
  - The **Issues** tab is removed. Issues and devices with failed updates will now be listed on the **Overview** page.
  - On the **Settings** tab, the entires for **Exclude Groups** and **Exclusion Windows** are now located in a new entry **Tenant Settings** on the **Overview** page.
  - The **Device Selection Criteria** from the Settings tab are removed.
- Inventory will get an additional column:
  - **Cloud Update Status**: Shows status of a given device in regards to Cloud Updates. E.g., if the device is currently onboarding to a profile or is already managed by a profile. 

## Changes in features

Please review the changes in features described below. Also refer to the next section to evaluate how this might impact your current configuration of servicing profiles.

- **Exclude groups** and **Exclusion window** are now applying on a tenant level rather than on profile level. An excluded device will be exclude from all profile, regardless to  which one the device is assigned. Similar, a set **exclusion window** applies to all profiles, rather than a specific one. For example, an exclusion window set to pause applying updates next week will prevent all profiles (Monthly, Current and Semi-Annual) from initiating updates next week.
- **Device Selection Criteria** is removed. Hence, a profile (e.g., Monthly Profile) will apply to all Microsoft 365 Apps instances which which run on the corresponding update channel. The removal covers Including devices by Azure AD group, by Update Channel, disk space as well as if macros has been used or add-ins are installed.

## Considerations for admins

**If you haven't used servicing profile before**
Note that Cloud Updates will map all devices which are on a specific update channel to a matching profile. E.g., after enabling the **Monthly profile**, all devices which are running Microsoft 365 Apps on Monthly Enterprise Channel fall into the scope of this profile. If you need to exclude devices from being automtically updated, please leverage the **Exclude group** feature.

Also note, after enabling a profile, devices need to go through an initial configuration step. Before this step has finished, their **Cloud Update Status** will be shown as **Onboarding to ...** in inventory and the devices are not listed on the **Overview** or respective profile pages page. Once the initial configuration has been received by the device, the status will switch to "**Managed by ...** and the device will be shown on the **Overview** and profile pages.

**If you're an existing customer using Azure AD group-based filtering or have fully on-boarded your Monthly Enterprise Channel devices to cloud update**

-  Azure AD group-based filtering  is no longer accessible. Now, the Profile handles the onboarding, management, and updating of all devices on the Monthly Enterprise Channel
- The option to exclude devices or Microsoft Azure Active Directory (Azure AD) groups based on the presence of macros, add-ins, or minimum disk space has been removed. As a result, Profile is now onboarding, managing, and updating any devices previously exempt from these settings.

> [!IMPORTANT]
> If you're using cloud update through Azure AD group-based filtering or you've fully on-boarded to the Monthly Profile, be aware of these changes. All devices on the Monthly Enterprise Channel in your tenant currently excluded from cloud update due to Azure AD group-based filtering, macros and add-ins presence, or limited disk space will be affected. These devices will automatically transition to Monthly Profile for management and updates.
