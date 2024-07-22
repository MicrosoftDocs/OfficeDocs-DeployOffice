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
ms.date: 05/16/2024
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
- **Profile:** Each update management configuration for an update channel is referred to as a profile. Tenants can use a Monthly Enterprise Channel or Current Channel profile. These profiles enable you to manage Microsoft 365 Apps updates across update channels with specific configurations for each.

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
- New URL: While **Cloud Update** is still located in the Microsoft 365 Apps admin center, the URL, to e.g., the **Overview** page has changed. Consider updating your bookmarks.

## Changes in features

Review the changes in features described. Also refer to the next section to evaluate how these changes might impact your current configuration of servicing profiles.

- **Exclude groups** and **Exclusion window** are now applying on a tenant level rather than on profile level. An excluded device is excluded from all profiles, regardless in which profile the particular device actually is.
- **Device Selection Criteria** is removed. Hence, a profile (for example, Monthly Profile) applies now to all Microsoft 365 Apps instances running on the corresponding update channel. The removal includes **Include devices by Microsoft Entra group**, by **Update Channel**, **disk space** and the selectors for **Macros Usage** and **Add-ins**.

## Considerations for admins

### If you haven't used servicing profile before
Cloud Updates maps all devices on a specific update channel to a matching profile. For example, after enabling the **Monthly profile**, all devices, which are running Microsoft 365 Apps on Monthly Enterprise Channel fall into the scope of this profile. If you need to exclude devices from the profile's scope, use the **Exclude group** feature.

After you have enabled a profile, devices have to connect to the service to get fully onboarded to the profile. If this step is pending, the **Cloud Update Status** for the device is shown as **Onboarding to ...** in inventory. In addition, the device isn't listed on the **Overview** or the respective profile page. Once the connection to the service was made, the status switches to "**Managed by ...** and the device is shown on the **Overview** and profile pages.

### If you are using servicing profile already
**Removal of update channel selector**: The Monthly profile now only targets devices, which are already on the Monthly Enterprise Channel. The selector can no longer be used to convert devices from, for example, Semi-Annual Enterprise Channel to Monthly Enterprise Channel. Instead, use the [Switch Update Channel](../admin-center/inventory.md#switch-device-update-channel) feature.

**Removal of Microsoft Entra groups-based filtering**: During the change, your Microsoft Entra group(s) used to restrict the scope of servicing profiles are removed. The new profile automatically targets all devices, which are on Monthly Enterprise Channel or Current Channel and are not excluded. Your Microsoft Entra groups aren't getting deleted, but removed from the profile. Any custom wave configuration remains the same. If you need to continue restricting the scope to a subset of devices, consider excluding the other devices using Microsoft Entra groups.

**Removal of disk space selector**: After the change, Cloud Update targets devices regardless of the remaining disk space. Any set value is removed, and the behavior is similar to selection "0 GB" today. There's no mitigation for this change.

**Removal of macro in use selector**: After the change, Cloud Update targets devices regardless of the usage of files with macros. The option "Exclude devices with macro usage" is no longer available or applied. The future behavior is equivalent to the selection "Include all devices". If you need to continue to exclude certain devices, consider using the **Exclude groups** feature.

**Removal of Add-in installed selector**: After the change, Cloud Update targets devices regardless of which add-ins are installed. The option "Exclude devices with any add-in installed" is not longer available or applied. The future behavior is equivalent to the selection "Include all devices". If you need to continue to exclude certain devices, consider using the **Exclude groups** feature.

**Change in onboarding flow**: After the change, devices have to connect to Cloud Updates at least once to be shown on the **Overview** and individual profile page. For example, newly installed devices show up in inventory only initially. The **Cloud Update Status** is **Onboarding to ...** at this stage. Only after the device has checked-in with Cloud Updates once, the **Cloud Update Status** will change to **Managed by ...** and the device is shown on the **Overview** and profile pages.

**Enablement of Current Channel profile**: When being upgraded from **Servicing Profiles** to **Cloud Updates**, the profile for devices on Current Channel gets enabled automatically. You can [disable the profile](../admin-center/cloud-update.md#deactivation) at any time after the transistion to Cloud Update.
