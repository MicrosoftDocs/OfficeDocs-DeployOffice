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
A new user interface and new features will be released to servicing profile and inventory soon. The transition happens automatically. No manual intervention or actions are required. Both the inventory data and current configuration of servicing profiles are retained, except for some changes layed out below. In tandem, some features are changed or removed.

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
- In the **Monthly Enterprise** navigation point, the following changes will be introduced:
  - The **Devices** tab is removed. To view a list of devices with e.g, the assigned rollout wave, navigate to **Overview** and click on **View All Devices**. 
  - The **Issues** tab is removed. Issues and devices with failed updates will now be listed on the **Overview** page.
  - On the **Settings** tab, the entires for **Exclude Groups** and **Exclusion Windows** are now located in a new entry **Tenant Settings** on the **Overview** page.
  - The **Device Selection Criteria** from the **Settings** tab are removed.
- Inventory gets an additional column:
  - **Cloud Update Status**: Shows status of a given device in regards to Cloud Updates. For example, if the device is currently onboarding to or already managed by a profile. 

## Changes in features

Review the changes in features described. Also refer to the next section to evaluate how these changes might impact your current configuration of servicing profiles.

- **Exclude groups** and **Exclusion window** are now applying on a tenant level rather than on profile level. An excluded device is excluded from all profiles, regardless in which profile the particular device actually is. Similarly, a set **exclusion window** applies to all profiles, rather than a specific one. For example, an exclusion window set to pause updates next week will prevent all profiles (Monthly, Current and Semi-Annual) from initiating updates during the set time frame.
- **Device Selection Criteria** is removed. Hence, a profile (for example, Monthly Profile) will apply to all Microsoft 365 Apps instances running on the corresponding update channel. The removal includes **Include devices by Azure AD group**, by **Update Channel**, **disk space** and the selectors for **Macros Usage** and **Add-ins**.

## Considerations for admins

**If you haven't used servicing profile before**
Cloud Updates maps all devices on a specific update channel to a matching profile. For example, after enabling the **Monthly profile**, all devices, which are running Microsoft 365 Apps on Monthly Enterprise Channel fall into the scope of this profile. If you need to exclude devices from the profile's scope, use the **Exclude group** feature.

After enabling a profile, devices have to connect to the service to get fully onboarded to the profile. If this step is pending, the **Cloud Update Status** for the device is shown as **Onboarding to ...** in inventory. In addition, the device is not listed on the **Overview** or the respective profile pages page. Once the connection to the service was made, the status switches to "**Managed by ...** and the device is shown on the **Overview** and profile pages.

**If you're an existing customer using Azure AD group-based filtering or have fully on-boarded your Monthly Enterprise Channel devices to cloud update**

-  Azure AD group-based filtering  is no longer accessible. Now, the Profile handles the onboarding, management, and updating of all devices on the Monthly Enterprise Channel
- The option to exclude devices or Microsoft Azure Active Directory (Azure AD) groups based on the presence of macros, add-ins, or minimum disk space has been removed. As a result, Profile is now onboarding, managing, and updating any devices previously exempt from these settings.

> [!IMPORTANT]
> If you're using cloud update through Azure AD group-based filtering or you've fully on-boarded to the Monthly Profile, be aware of these changes. All devices on the Monthly Enterprise Channel in your tenant currently excluded from cloud update due to Azure AD group-based filtering, macros and add-ins presence, or limited disk space will be affected. These devices will automatically transition to Monthly Profile for management and updates.
