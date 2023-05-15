---
title: "Introduction to cloud update"
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
description: "Introduction to cloud update, highlighting its features, benefits, and the mapping of channels to profiles"
ms.date: 05/16/2023
---

# Introduction to cloud update

> [!IMPORTANT]
>
>- The information in this article applies only to organizations that received the notification to sign up for cloud update management in the Microsoft 365 Apps admin center.
>- This article introduces cloud update, the recommended update management solution for Microsoft 365 Apps, highlighting its features, benefits, and the mapping of channels to profiles.

Take advantage of this premium offer by opting to cloud update, Microsoft's recommended update management solution for Microsoft 365 Apps. This innovative tool allows you to automatically deliver updates for specific users or Azure Active Directory (AAD) groups, supporting Monthly Enterprise Channel, Current Channel, and Semi-Annual Enterprise Channel. As a qualifying tenant, you stand to gain a wealth of powerful controls, proactive insights, and the simplicity of a one-step onboarding process. With cloud update, you can update Microsoft 365 Apps while retaining your existing channel settings, giving you enhanced flexibility. This includes options to exclude specific devices or user groups, set update deadlines, or apply uniform update themes across your organization. Further, you'll have access to smart recommendations based on your tenant’s data, potentially identifying devices that could benefit from transitioning to more suitable update channels.

## New Features and Benefits

Cloud update introduces a new set of powerful controls and proactive insights, along with a simple one-step onboarding process. It offers the flexibility to return to your previous management tools if cloud update doesn't work for your environment. Here are some of the new features available:

### Dashboard Cards

As soon as you log in, you can view a consolidated update progress status at the tenant level.

### Updates Overview Page

This provides you with a snapshot view of update insights. It presents a comprehensive picture, including the overall percentage of updated devices, progress of updates per channel, trends in Updates & Security, issues and health signals, as well as Deployment Validation signals.

### Smart Recommendations

Act on smart recommendations based on valuable insights from the tenant's data. These insights include identifying devices that are out of support or pinpointing devices that could benefit from being transitioned to more suitable update channels based on their specific data.

### Tenant Settings

You have the ability to configure various controls at the tenant level. This includes options such as excluding specific devices or user groups, establishing exclusion time windows, setting update deadlines, or determining an update theme to be applied across the organization.

### Profiles Overview

Delve deeper into individual profiles, allowing a more thorough examination of progress, deployment validation, and signals. Take profile-level actions to address any concerns, such as pausing, rolling back, or skipping updates, depending on the profile you're in. Additionally, you can configure individual profiles, such as Semi-Annual Enterprise Channel and Monthly Enterprise Channel profiles into waves as needed.

## Channel to Profile Mapping

Before onboarding to cloud update, view the current state of your tenant. For existing customers of the Monthly Enterprise Channel profiles, the tenant may be partially enabled on cloud, while new users have yet to onboard. The mapping of devices to profiles is as follows:

- Current Enterprise Channel and Monthly Enterprise Channel devices will be mapped to current and monthly profiles, respectively.
- Semi-Annual (Preview) devices will be mapped to Wave 1 of the Semi-Annual Enterprise Channel profile by default upon onboarding.
- Semi-Annual Enterprise Channel devices will be mapped to Wave 2 of the Semi-Annual Enterprise Channel profile by default upon onboarding.

> [!NOTE] 
> All devices in the Semi-Annual Enterprise Channel profile will get updated via the Semi-Annual Enterprise Channel, regardless of the wave they are currently in.