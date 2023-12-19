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
ms.date: 12/19/2023
---

# Overview
Update Validation, a feature within the [Cloud Update](cloud-update.md) service in the [Microsoft 365 Apps admin center](https://config.office.com), enables administrators to validate new updates for the [Monthly Enterprise Channel](../updates/overview-update-channels.md#monthly-enterprise-channel-overview) before organization-wide deployment. This feature automatically collects and consolidates health indicators such as app and add-in performance and reliability data and brings attention to any identified issues. Its automated nature reduces the need for manual administrative work and simplifies the update deployment process.

> [!TIP]
> For a guided introduction to update validation, check out the [Introducing update validation in the Microsoft 365 Apps admin center](https://youtu.be/xZtXI-Ws-pE) video.

# Benefits
A common practice in larger organizations is to deploy new updates to a subset of devices first. This way, they can identify and contain potential issues early in the deployment cycle and limit the risk of disruptive issues to a manageable number of devices. However, this approach also creates extra work for administrators. Often, the feedback channels are not automated, and the admin must actively collect early feedback from sources such as the help desk team or dedicated testers. Moreover, the feedback may be vague or too general to pinpoint the actual issues without further investigation and troubleshooting. This increases the admin's workload and delays the deployment of the update, which could affect the organization's security posture.

Update validation enables administrators to collect health signals automatically, evaluate them for devices on the first deployment wave, and decide if it is safe to continue the update deployment. Administrators can view a simple interface that guides them through the process. Any degradations across apps and add-ins are detected, assessed, and highlighted automatically. If there are any issues, administrators can easily pinpoint the affected devices, apps, and add-ins. In the event of significant issues, administrators have the option to pause the rollout or revert updated devices to the previous update, all from the same administrative interface.

By applying statistical tests and thresholds, update validation eliminates any noise from the health data. The admins receive evaluations based on robust insights that show the real effects on the user's workflow. As generated insights are generated based on diagnostic data received from devices on wave 1, those are specific to the organization and its unique setup.

# How it works

If cloud updates is configured with at least two custom rollout waves, update validation is enabled by default. When a new update for the Monthly Enterprise Channel is released and begins to deploy to devices on wave 1, update validation automatically performs the following actions for each device:

- It calculates the pre-update health baseline. It uses the Diagnostic Data received within the seven days before the update to measure the start performance and reliability of Word, Excel, PowerPoint, Outlook, OneNote, and each individual add-in.
- It calculates the post-update health metrics. After a device applies the update, it continuously calculates the same health metrics.
- Once a statistical confidence of 95% is reached, it compares the pre- and post-update metrics and calculates the actual change. Minor degradations below a certain threshold are filtered out.
- It applies a scoring system to evaluate the remaining degradations.

After calculating scores for at least ten devices, an assessment is run, and the results are displayed to the admin. The results are color-coded and continuously updated with more data being received:

- **Green:** No degradations or only very minor degradations were detected. The admin is encouraged to proceed with the deployment of the update.
- **Yellow:** Minor degradation was detected, and the admin is advised to monitor the deployment closely.
- **Red:** At least one major degradation was detected, and the admin is offered the option to pause the deployment or initiate an update rollback.

For a status of yellow or red, the admin can view the list of devices and see which device, add-in/app, and health metric caused the status change.

# How thresholds and scoring works

As explained above, each device, app and add-in has several health metrics. A device without add-ins would have twenty metrics: app start performance and app reliability for Word, Excel, PowerPoint, Outlook, and OneNote. These metrics are divided into ten pre-update and ten post-update ones. Each add-in adds four more metrics. The metrics are compared and filtered after reaching a statistical confidence of 95%, using the following thresholds:

- For apps, start performance must take more than 5 seconds to start and at least 1 second longer than before.
- For apps, reliability must be less than 99% and at least 1 percentage point lower than before.
- For add-ins, start performance is at least 1 second slower than before.
- For add-ins, reliability must be less than 99% and at least 1 percentage point lower than before.

The thresholds help to ignore degradations that are statistically significant, but not disruptive to users. For instance, suppose Outlook's app start performance worsens from two seconds to three seconds. This is a 50% degradation, but it does not affect the user much. Outlook still starts up quickly. Similarly, if the reliability drops from 99.9% to 99.8%, the crash rate technically doubles from 0.1% to 0.2%. But only two out of a thousand app sessions are affected. This may not disrupt the user's daily routine.

The following criteria are used to score the metrics that pass the threshold filter:
- A degradation in the start performance of Word, Excel, PowerPoint, Outlook, or OneNote: 0.5 points
- A degradation in the start performance of an add-in: 0.25 points
- A degradation in the reliability of Word, Excel, PowerPoint, Outlook, or OneNote: 1 point
- A degradation in the reliability of an add-in: 0.5 points

The scores for all devices are added up. A score higher than 0.5 means a yellow status, and a score higher than 1 means a red status. For example:
- On one device, Word starts slower than before and exceeds the threshold. This gives 0.5 points and a yellow status.
- On two devices, an add-in crashes more frequently than before and exceeds the threshold. This gives 0.5 points twice, or 1 point total, and a red status.

# How to enable update validation

To use update validation, the following requirements must be met:
- Devices must be managed via cloud update.
- Diagnostic data must be turned on for your devices.
- Devices must be on Monthly Enterprise Channel.
- You must configure and implement rollout waves.
- A period of seven days must be set between wave one and wave two rollouts.

Ensure that wave one devices offer a diverse representation of your organization’s departments and usage scenarios, including various add-ins. This diverse representation promotes early issue detection and timely resolution, further minimizing potential risks.


# How to disable update validation

In case you want to disable update validation, these are your options:
- Navigate to **Cloud Update > Monthly Enterprise channel > Settings > Rollout waves** and select the **Opt out of update validation** option.
- If you disabled waves by setting the option **Use rollout waves** to *No, not needed*, update validation will be automatically disabled.
