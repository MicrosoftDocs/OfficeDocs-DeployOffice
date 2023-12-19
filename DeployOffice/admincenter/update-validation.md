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
Update Validation, a feature within the [Cloud Update](cloud-update.md) service in the [Microsoft 365 Apps admin center](https://config.office.com), enables administrators to trial and verify new updates for the [Monthly Enterprise Channel](../updates/overview-update-channels.md#monthly-enterprise-channel-overview) before organization-wide deployment. This feature automatically collects and consolidates health indicators such as app and add-in performance and reliability data, and brings attention to any identified issues. Its automated nature reduces the need for manual administrative work and simplifies the update deployment process.

> [!TIP]
> For a guided introduction to update validation, check out the [Introducing update validation in the Microsoft 365 Apps admin center](https://youtu.be/xZtXI-Ws-pE) video.

## Benefits
- **Efficiency & risk mitigation:** By testing Microsoft 365 Apps updates on a smaller subset first, admins can address potential app compatibility concerns early on. This focused testing reduces the time and effort traditionally required for widespread deployment testing, significantly reducing the risk associated with monthly updates.
- **Visibility & confidence:** Update validation provides post-deployment health summaries for the initial wave of devices. With these health summaries, admins can determine the health of Microsoft 365 Apps and add-ins before and after an update. This invaluable insight boosts confidence and enables a smoother transition to monthly updates.
- **Actionable insights:** If any degradation is detected, administrators can easily pinpoint the affected devices, apps, and add-ins. In the event of significant issues, administrators have the option to pause the rollout or revert updated devices to the previous update, all from the same administrative interface.

## Overview of how it works

If cloud updates is configured with at least two custom rollout waves, update validation is enabled by default. When a new update for the Monthly Enterprise Channel is released and begins to deploy to devices on wave 1, update validation automatically performs the following actions for each device:

- It calculates the pre-update health baseline. It uses the Diagnostic Data received within the seven days before the update to measure the start performance and reliability of Word, Excel, PowerPoint, Outlook, OneNote, and each individual add-in.
- It calculates the post-update health metrics. After a device applies the update, it continously calculates the same health metrics based on Diagnostic Data being received.
- Once a statistical confidence of 95% is reached, it compares the metrics and calculates the actual change. Minor degradations below a certain threshold are filtered out.
- It applies a scoring system to evaluate the remaining degradations.

After calculating scores for at least ten devices, an assessment is run and the results are displayed to the admin. The results are color-coded as follows:

- **Green:** No degradations or only very minor degradations were detected. The admin is encouraged to proceed with the deployment of the update.
- **Yellow:** Minor degradation was detected and the admin is advised to monitor the deployment closely.
- **Red:** At least one major degradation was detected and the admin is offered the option to pause the deployment or initiate an update rollback.

For a status of yellow or red, the admin can view the list of devices and see which device, add-in/app, and health metric caused the status change.

The assessment is updated continuously as more diagnostic data becomes available.

## How thresholds and scoring works

As explained above, each device, app and add-in has several health metrics. A device without add-ins would have twenty metrics: app start performance and app reliability for Word, Excel, PowerPoint, Outlook and OneNote. These metrics are divided into ten pre-update and ten post-update. Each add-in adds four more metrics. The metrics are compared and filtered after reaching a statistical confidence of 95%, using the following thresholds:

- The app must take more than 5 seconds to start, which is at least 1 second longer than before.
- The app must have less than 99% reliability, which is at least 1 percentage point lower than before.

The thresholds help us ignore degradations that are statistically significant, but not really noticeable to users. For instance, suppose Outlook's app start performance worsens from two seconds to three seconds. This is a 50% degradation, but it does not affect the user much. Outlook still starts up quickly. Similarly, if the reliability drops from 99.9% to 99.8%, the crash rate increases from 0.1% to 0.2%. This means twice as many sessions crash, but only two out of a thousand. This may not disrupt the user's daily routine.

The following criteria are used to score the metrics that pass the threshold filter:
- A degradation in the start performance of Word, Excel, PowerPoint, Outlook, or OneNote: 0.5 points
- A degradation in the start performance of an add-in: 0.25 points
- A degradation in the reliability of Word, Excel, PowerPoint, Outlook, or OneNote: 1 point
- A degradation in the reliability of an add-in: 0.5 points

The scores for all devices are added up. A score higher than 0.5 means a yellow status, and a score higher than 1 means a red status. For example:
- On one device, Word starts slower than before and exceeds the threshold. This gives 0.5 points and a yellow status.
- On two devices, an add-in crashes more frequently than before and exceeds the threshold. This gives 2 times 0.5 points, or 1 point total, and a red status.

## Prerequisits

To use update validation, the following requirements must be met:
- Devices must be managed via cloud update.
- Diagnostic data must be turned on for your devices.
- Devices must be on Monthly Enterprise Channel.
- You must configure and implement rollout waves.
- A period of seven days must be set between wave one and wave two rollouts.

## Preparation Checklist

To fully use update validation:
- Confirm that diagnostic data is activated for your devices at the necessary level.
- Ensure that wave one devices offer a diverse representation of your organization’s departments and usage scenarios, including various add-ins. This diverse representation promotes early issue detection and timely resolution, further minimizing potential risks.
