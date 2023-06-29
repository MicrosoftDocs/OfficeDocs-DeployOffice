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
A new user interface and new features are released to servicing profile and inventory soon. The transition happens automatically. No manual intervention or actions are required. Both the inventory data and current configuration of servicing profiles are retained. Also, some features are changed or even removed. This article gives you an overview of the changes and potential impact on your existing configuration.

Review these sections to prepare for the shift:

- [New Terminology](#new-terminology)
- [New user experience](#changes-in-user-experience)
- [Changes to existing features](#changes-in-features) and [what admin's should consider](#considerations-for-admins)

## New Terminology

- **Cloud Update**: **servicing profiles** is renamed to **Cloud Update**.
- **Profile:** Each update management configuration for an update channel is referred to as a profile. Tenants can currently use a Monthly profile. Soon you can also use a Current profile and/or a Semi-Annual profile. These profiles enable you to manage Microsoft 365 Apps updates across update channels with specific configurations for each.

> [!NOTE]
> The schedule and availability of Current profile and Semi-Annual profile are not determined as of yet. Monitor this article for any updates.

## Changes in user experience

Here's what you should expect:

- The entry **Servicing** in the left-hand navigation gets renamed to **Cloud Update**.
- A new **Overview** page gets added to the **Cloud Update** section. It provides a comprehensive snapshot of the update progress across profiles.
- In the **Monthly Enterprise** navigation point, the following changes are introduced:
  - The **Devices** tab is removed. To view a list of devices with e.g, the assigned rollout wave, navigate to **Overview** and select **View All Devices**. 
  - The **Issues** tab is removed. Issues and devices with failed updates are now listed on the **Overview** page.
  - On the **Settings** tab, the entires for **Exclude Groups** and **Exclusion Windows** are now located in a new entry **Tenant Settings** on the **Overview** page.
  - The **Device Selection Criteria** from the **Settings** tab are removed.
- Inventory gets an extra column:
  - **Cloud Update Status**: Shows status of a given device in regards to Cloud Updates. For example, if the device is currently onboarding to or already managed by a profile. 

## Changes in features

Review the changes in features described. Also refer to the next section to evaluate how these changes might impact your current configuration of servicing profiles.

- **Exclude groups** and **Exclusion window** are now applying on a tenant level rather than on profile level. An excluded device is excluded from all profiles, regardless in which profile the particular device actually is. Similarly, a set **exclusion window** applies to all profiles, rather than a specific one. For example, an exclusion window set to pause updates next week will prevent all profiles (Monthly, Current and Semi-Annual) from initiating updates during the set time frame.
- **Device Selection Criteria** is removed. Hence, a profile (for example, Monthly Profile) applies now to all Microsoft 365 Apps instances running on the corresponding update channel. The removal includes **Include devices by Azure AD group**, by **Update Channel**, **disk space** and the selectors for **Macros Usage** and **Add-ins**.

## Considerations for admins

**If you haven't used servicing profile before**
Cloud Updates maps all devices on a specific update channel to a matching profile. For example, after enabling the **Monthly profile**, all devices, which are running Microsoft 365 Apps on Monthly Enterprise Channel fall into the scope of this profile. If you need to exclude devices from the profile's scope, use the **Exclude group** feature.

After you have enabled a profile, devices have to connect to the service to get fully onboarded to the profile. If this step is pending, the **Cloud Update Status** for the device is shown as **Onboarding to ...** in inventory. In addition, the device isn't listed on the **Overview** or the respective profile page. Once the connection to the service was made, the status switches to "**Managed by ...** and the device is shown on the **Overview** and profile pages.

**If you are using servicing profile already**

**Removal of update channel selector**: The Monthly profile now only targets devices, which are already on the Monthly Enterprise Channel. The selector can no longer be used to convert devices from, for example, Semi-Annual Enterprise Channel to Monthly Enterprise Channel. See [Change the Microsoft 365 Apps update channel](../updates/change-update-channels.md) for your options on changing update channels.

**Removal of Azure AD groups-based filtering**: During the change, your Azure AD group(s) used to restrict the scope of servicing profiles are removed. The new profile automatically targets all devices, which are on Monthly Enterprise Channel and haven't been excluded. Your Azure AD groups aren't getting deleted, but removed from the profile. Any custom wave configuration remains the same. If you need to continue restricting the scope of the Monthly profile to a subset of devices, consider excluding the other devices using Azure AD groups.

**Removal of disk space selector**: After the change, Cloud Update targets devices regardless of the remaining disk space. If you have set a value, it is removed, and the behavior is similar to selection "0 GB" today. There's no mitigation for this change.

**Removal of macro in use selector**: After the change, Cloud Update targets devices regardless of the usage of files with macros. If you have currently selected the option "Exclude devices with macro usage", the future behavior is equivalent to the selection "Include all devices". If you need to continue to exclude certain devices, consider using the **Exclude groups** feature.

**Removal of Add-in installed selector**: After the change, Cloud Update targets devices regardless of which add-ins are installed. If you have currently selected the option "Exclude devices with any add-in installed", the future behavior is equivalent to the selection "Include all devices". If you need to continue to exclude certain devices, consider using the **Exclude groups** feature.

**Change in onboarding flow**: After the change, devices have to connect to Cloud Updates at least once to be shown on the **Overview** and individual profile page. For example, newly installed devices will initially show up in inventory only. The **Cloud Update Status** is **Onboarding to ...** at this stage. Only after the device has checked-in with Cloud Updates once, the **Cloud Update Status** will change to **Managed by ...** and the device is shown on the **Overview** and profile pages.
