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
ms.date: 12/13/2023
---

# Overview of update validation in the Microsoft 365 Apps admin center

Microsoft is dedicated to providing admins with tools that streamline processes and reduce risks. To that end, we're introducing update validation, an innovative feature now included within cloud update in the Microsoft 365 Apps admin center. This feature provides a comprehensive method to test updates. It ensures the stability and performance of Microsoft 365 Apps and their add-ins on select devices prior to widespread deployment. By allowing for a way to validate with confidence, we aim to make it easier to switch to Monthly Enterprise Channel. 

> [!TIP]
> For a guided introduction to update validation, check out the [Introducing update validation in the Microsoft 365 Apps admin center](https://youtu.be/xZtXI-Ws-pE)

## Benefits of update validation

- **Efficiency & risk mitigation:** By testing Microsoft 365 builds on a smaller subset first, admins can address potential app compatibility concerns early on. This focused testing reduces the time and effort traditionally required for widespread deployment testing, significantly reducing the risk associated with monthly updates.
- **Visibility & confidence:** update validation provides post-deployment health summaries for the initial wave of devices. With these health summaries, admins can determine the health of Microsoft 365 Apps and add-ins before and after an update. This invaluable insight boosts confidence and enables a smoother transition to monthly updates.

## Requirements for using update validation

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
