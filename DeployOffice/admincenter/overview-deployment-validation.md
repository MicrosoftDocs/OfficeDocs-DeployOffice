---
title: "Overview of deployment validation in the Microsoft 365 Apps admin center"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
ms.reviewer: dedut
audience: ITPro
ms.topic: conceptual
ms.service: o365-proplus-itpro
ms.localizationpriority: medium
ms.collection: Tier1
ROBOTS: NOINDEX, NOFOLLOW
recommendations: false
hideEdit: true
description: "Deployment validation enables admins to test Microsoft 365 updates on a subset of devices, ensuring stability before a full-scale rollout."
ms.date: 10/01/2023
---

# Overview of deployment validation in the Microsoft 365 Apps admin center

Microsoft is dedicated to providing admins with tools that streamline processes and reduce risks. To that end, we're introducing deployment validation, an innovative feature now included within cloud update in the Microsoft 365 Apps admin center. This feature offers a holistic approach to verifying the stability and efficiency of updates on a subset group of devices before a full-scale rollout. By allowing for a way to validate with confidence, we aim to make it easier to switch to Monthly Enterprise Channel.

## Benefits of deployment validation

- **Efficiency & risk mitigation:** By testing Microsoft 365 builds on a smaller subset first, admins can address potential app compatibility concerns. This reduces the time and effort traditionally required for widespread testing. This approach significantly reduces the risk associated with monthly updates.
- **Visibility & confidence:** Deployment validation provides post-deployment health summaries for the initial wave of devices. With this, admins can determine the health of Microsoft 365 Apps and add-ins before and after an update. This invaluable insight boosts confidence and enables a smoother transition to monthly updates.

## Requirements for using deployment validation

To use deployment validation, the following requirements must be met:
- Devices must be managed via cloud update.
- Diagnostic data must be turned on for your devices.
- Devices must be on Monthly Enterprise Channel.
- You must configure and implement rollout waves.
- A period of seven days must be set between wave one and wave two rollouts.

## Upcoming Changes

Starting October 2023, deployment validation will be universally accessible to all admins deploying rollout waves. A pivotal change accompanying this feature is the modification of the duration between the first and second rollout wave to seven days. This change aims to facilitate a statistically significant validation process, ensuring reliable results. It's worth noting that the duration between subsequent waves remain consistent with the current setup. Admins won't have to navigate through complex setup processes or opt for manual activation; the feature is automatically enabled for all tenants using rollout waves.

## Preparation Checklist

To fully leverage deployment validation:
- Confirm that diagnostic data is activated for your devices at the necessary level.
- Ensure that wave one devices offer a diverse representation of your organization’s departments and usage scenarios, including various add-ins. This promotes early issue detection and timely resolution, further minimizing potential risks.
