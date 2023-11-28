---
title: "Sign up for cloud update"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: conceptual
ms.service: o365-proplus-itpro
ms.collection: Tier1
ms.localizationpriority: medium
ROBOTS: NOINDEX, NOFOLLOW
recommendations: false
hideEdit: true
description: "Introduction to cloud update, highlighting its features, benefits, and the mapping of channels to profiles"
ms.date: 11/28/2023
---

# Sign up for cloud update

> [!IMPORTANT]
>
>- The information in this article applies only to organizations that received the notification to sign up for cloud update management in the Microsoft 365 Apps admin center.
>- This article introduces cloud update, the recommended update management solution for Microsoft 365 Apps, highlighting its features, benefits, and the mapping of channels to profiles.

> [!NOTE]
> For more information about priority access for cloud update, check out the [Priority Access FAQ](#priority-access-faq).

Take advantage of this opportunity by opting to cloud update, Microsoft's recommended update management solution for Microsoft 365 Apps. This innovative tool allows you to automatically deliver updates for specific users or Microsoft Entra groups, supporting Monthly Enterprise Channel, Current Channel, and Semi-Annual Enterprise Channel. As a qualifying tenant, you stand to gain a wealth of powerful controls, proactive insights, and the simplicity of a one-step onboarding process.

With cloud update, you can update Microsoft 365 Apps while retaining your existing channel settings, giving you enhanced flexibility. This includes options to exclude specific devices or user groups, set update deadlines, or apply uniform update themes across your organization. Further, you have access to smart recommendations based on your tenant’s data, potentially identifying devices that could benefit from transitioning to more suitable update channels.

## Channel to Profile Mapping

Before onboarding to cloud update, view the current state of your tenant and make informed decisions. For example, you can see devices that are  already managed with Monthly Enterprise Channel profile and those devices that haven't onboarded yet.

The default onboarding experience maps devices to the proper cloud update profile based on the existing update channel. Devices on Current Channel and Monthly Enterprise Channel maps to their corresponding cloud update profile. Devices on Semi-Annual Enterprise Channel (Preview) and Semi-Annual Enterprise Channel map to the Semi-Annual Enterprise Channel cloud update profile, with the preview channel assigned to Wave 1 and non-preview channel assigned to Wave 2

> [!NOTE]
> All devices in Semi-Annual Enterprise Channel profile will get updates via Semi-Annual Enterprise Channel, regardless of the wave they are currently in.

## New features and benefits

Cloud update introduces a new set of powerful controls and proactive insights, along with a simple one-step onboarding process. It offers the flexibility to return to your previous management tools if cloud update doesn't work for your environment. Here are some of the new features available:

### Dashboard cards

As soon as you sign in, you can view a consolidated update progress status at the tenant level.

### Updates overview page

This page provides you with a snapshot view of update insights. It presents a comprehensive picture, including the overall percentage of updated devices, progress of updates per channel, trends in Updates & Security, issues and health signals, and Deployment Validation signals.

### Smart recommendations

Act on smart recommendations based on valuable insights from the tenant's data. These insights include identifying devices that are out of support or pinpointing devices that could benefit from being transitioned to more suitable update channels based on their specific data.

### Tenant settings

You have the ability to configure various controls at the tenant level. These configurations include options such as excluding specific devices or user groups, establishing exclusion time windows, setting update deadlines, or determining an update theme to be applied across the organization.

### Profiles overview

Delve deeper into individual profiles, allowing a more thorough examination of progress, deployment validation, and signals. Take profile-level actions to address any concerns, such as pausing, rolling back, or skipping updates, depending on the profile you're in. Additionally, you can configure individual profiles, such as Semi-Annual Enterprise Channel and Monthly Enterprise Channel profiles into waves as needed.

### Move devices to another update channel

For admins looking to effectively manage the update channel for their devices, we introduce a seamless approach in the Microsoft 365 Apps admin center. This is the recommended method to ensure that devices or groups are aligned with the desired update channel. It not only streamlines the process but also optimizes control over update channels. 

> [!NOTE]
> If you are participating in the Microsoft 365 Copilot Early Access Program (EAP), your device must be on the latest supported release of Current Channel. For more information, see [Microsoft 365 Copilot Early Access Program](https://www.microsoft.com/microsoft-365/blog/2023/05/09/introducing-the-microsoft-365-copilot-early-access-program-and-new-capabilities-in-copilot/)

1. **Sign into Microsoft 365 Apps admin center** and select **Inventory** to display a list of your devices. You'll find detailed information about each device, including its Office version and update channel.
2. Choose **Move device to another channel**.
3. In the flyout that appears, select the channel you would like to move your device to. Just below, you'll notice a search box that lets you pick the devices or groups you're aiming to move.
4. After selecting your desired devices, choose **Move devices** to set the move in motion.
5. Your device will transition to the new update channel during the next Microsoft 365 update cycle. This usually takes place within 12-24 hours. Keep an eye on the **Inventory** tab for any updates. Rest assured, if there's anything that requires your attention, we'll promptly notify you.

Make the most of this recommended feature to streamline your update processes and ensure that your devices are always in sync with your desired update preferences.

## Priority access FAQ

- **What happens if I sign up for priority access to cloud update?**

    By signing up, your tenant is staged for new features while your existing environment remains unchanged. Your interest in cloud update is recorded and your tenant is added to the priority waitlist for the new feature experience. When the new features are ready, you receive a notification that cloud update is available for your tenant.

- **I have multiple tenants. Can I choose which ones will be part of priority access?**

    Yes. You need to sign into Microsoft 365 Apps admin center with a properly elevated account for each tenant you want on the waitlist.

- **If I sign up for  priority access, will it impact the devices in my environment in any way?**

    No. Your environment isn't changed, and your existing configuration stays the same.

- **Can I remove my tenant(s) from the priority access once I’ve signed up?**

    No. You can’t undo your selection once you’ve signed up, but you can choose to not activate this feature once it’s available.

- **When will cloud update be available through the waitlist program?**

    These features are in development. Expect to hear more through in-product notifications and communications. Keep an eye on the [Microsoft 365 Roadmap](https://www.microsoft.com/microsoft-365/roadmap).

- **Is there an option to try cloud update sooner?**

    Be sure you have joined the early access program. If you want to move faster, you can submit a request using the Give Feedback button in the Microsoft 365 Apps admin center and a Microsoft representative will contact you.

- **If I don’t sign up for access now, will I have the option to activate the cloud update feature when it becomes generally available?**

    Yes. Once you receive the notification that cloud update is available for your tenant, you can choose to enable it at that time.

- **Why is the priority access option not available in the Microsoft 365 Apps admin center?**

    If you think your tenant qualifies for priority access, you can submit a request using the Give Feedback button in the Microsoft 365 Apps admin center.
