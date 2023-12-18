---
title: "Overview of update validation in the Microsoft 365 Apps admin center"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
ms.reviewer: dedut
audience: ITPro
ms.topic: conceptual
ms.service: o365-proplus-itpro
ms.localizationpriority: medium
ms.collection: Tier1
hideEdit: true
description: "Update validation enables admins to test Microsoft 365 updates on a subset of devices, ensuring stability before a full-scale rollout."
ms.date: 12/18/2023
---

# Overview
Update Validation, a feature of the [Cloud Update](cloud-update.md) service in the [Microsoft 365 Apps admin center](https://config.office.com), enables administrators to trial and verify new updates for the Monthly Enterprise Channel](../updates/overview-update-channels.md#monthly-enterprise-channel-overview) before organization-wide implementation. This feature automatically collects and consolidates health indicators such as app and add-in performance and reliability data, and brings attention to any identified issues.

For organizations that prefer to validate updates before large-scale deployment, Update Validation assists in maintaining the stability and performance of Microsoft 365 Apps and their add-ins. Its automated nature reduces the need for manual administrative work and simplifies the update deployment process.

> [!TIP]
> For a guided introduction to update validation, check out the [Introducing update validation in the Microsoft 365 Apps admin center](https://youtu.be/xZtXI-Ws-pE) video.

## Benefits
- **Efficiency & risk mitigation:** By testing Microsoft 365 Apps updates on a smaller subset first, admins can address potential app compatibility concerns early on. This focused testing reduces the time and effort traditionally required for widespread deployment testing, significantly reducing the risk associated with monthly updates.
- **Visibility & confidence:** Update validation provides post-deployment health summaries for the initial wave of devices. With these health summaries, admins can determine the health of Microsoft 365 Apps and add-ins before and after an update. This invaluable insight boosts confidence and enables a smoother transition to monthly updates.
- **Actionable insights**: If any degradation is detected, administrators can easily pinpoint the affected devices, apps, and add-ins. In the event of significant issues, administrators have the option to pause the rollout or revert updated devices to the previous update, all from the same administrative interface.

## How it works
If [prerequisits](#prerequisits) are met and update validation is enabled, it automatically validates updates as described below.

When a new update is released for the Monthly Enterprise Channel and Cloud update starts to update devices on wave 1, update validation will automatically perform the following actions:
- It calculates the average app start performance as well as app reliability (also known as crash rate or UAE) for each individual app (Word, Excel, PowerPoint, Outlook, and OneNote), individual add-in, per device which is on wave 1. For this it takes the diagnostic data received within the seven days prior into account.
- Once a device has updates to the latest update, the service starts to calculate post-update values for the same health indicators. Once a statistical confidence of 95% is reached, it compares each individual post-update values to the pre-update ones.
- Describe 'business filter'
- Once this comparison concluded for at least ten devices, the results are shown in the portal and continously updated with more health data coming in.
- The following states are shown to the admin in the portal:
    - **Grey** / Collecting more data: This state is shown until enough data has been received to make a statistically reliable assessment of the health data.
    - **Green Assessment**: If no devices shows a degradation of any of the collected health signals, a green status is shown and the admin is encouraged to continue the deployment.
    - **Yellow Assessment / Minor degradations***: A minor degradation was detected and the admin is advised to monitor the deployment. This is shown when e.g. one app start performance signal has degraded, two add-ins starting slower or one add-in is crashing more often.
    - **Red Assessment / Warning**: A major degradation was detected and the admin if offered to pause the deployment or roll the latest update back to get enough time for troubleshooting the issue.
 

-  Currently, the following apps and add-ins are considered:
    -  Word
    -  Excel
    -  PowerPoint
    -  Outlook
    -  OneNote
    -  Each individual add-in
-
-
-
-     For this it summarizes the diagnostic data received from each device within the seven days prior to the release day. It calculates the following values:
    - App launch performance
    - App stability (also known as crash rate or UAE)
    - Add-in boot performance
    - Add-in stability
- These values are calculated individually for
    -  Word
    -  Excel
    -  PowerPoint
    -  Outlook
    -  OneNote



## Prerequisits

To use update validation, the following requirements must be met:
- Devices must be managed via cloud update.
- Diagnostic data must be turned on for your devices.
- Devices must be on Monthly Enterprise Channel.
- You must configure and implement rollout waves.
- A period of seven days must be set between wave one and wave two rollouts.
 
## Add-ins in update validation

Add-ins are an integral part of the ecosystem, and it's crucial for admins to understand their effects during the validation process:
- **Health Analysis:** Admins receive comprehensive insights allowing them to evaluate if the health of their add-ins remains stable or deteriorate after an update.


## Upcoming Changes

Update validation is universally accessible to all admins deploying rollout waves. A pivotal change accompanying this feature is the modification of the duration between the first and second rollout wave to seven days. This change aims to facilitate a statistically significant validation process, ensuring reliable results. It's worth noting that the duration between subsequent waves remains consistent with the current setup. Admins don't have to navigate through complex setup processes or opt for manual activation; the feature is automatically enabled for all tenants using rollout waves.

## Preparation Checklist

To fully use update validation:
- Confirm that diagnostic data is activated for your devices at the necessary level.
- Ensure that wave one devices offer a diverse representation of your organization’s departments and usage scenarios, including various add-ins. This diverse representation promotes early issue detection and timely resolution, further minimizing potential risks.
 
## Update validation FAQ

#### What is update validation?
update validation is a feature that allows admins to reduce the time and effort needed for testing by providing a means to validate live in production.

#### What are the goals of update validation?
The ultimate goals are to modernize the validation process, reduce the app compatibility risk and effort needed for testing, and provide admins with more visibility and control over build rollout (and its effect).
 
#### When should I use update validation?
Update validation is meant to give you confidence that a build is ready to be rolled out to the devices in your tenant. It achieves this goal by analyzing performance and reliability signals from your devices comparing before/after the build rollout in wave one.

#### When should I avoid using update validation?
This feature isn't for you if you don't have application compatibility (especially add-ins) and presently, don't carry out manual validation of Microsoft 365 Apps builds before a rollout.

#### What is the expected outcome of health validation scenarios?
The expected outcome of health validation scenarios is to prove that the introduction of a new build doesn’t affect the health of the tenant negatively.

#### Is update validation supported for all customers?
No. Update validation is supported for Monthly Enterprise Channel with wave customization (with at least two waves defined).

#### What is the minimum number of devices required in wave one to view update validation results?
You need a minimum of 10 devices that held a session in the seven days before and after a Patch Tuesday.

#### Beyond the number of devices, what else should be considered for wave one to maximize the value of update validation?
For optimal value, wave one should be a representative set of the wider tenant. This representation should include diverse usage scenarios, and comprehensive app and add-in coverage.

#### Only IT users are designated for wave one and I prefer not to add other pilot users to this wave. Can I access the update validation feature in subsequent waves, like wave two?

No. The feature is meant to detect issues early by using a sample of real production users who represent different departments and their realistic usage scenarios. The detection is only as good as the representation. By delaying validation to later waves, we're deferring risk not minimizing it.
