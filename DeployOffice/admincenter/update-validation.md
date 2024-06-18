---
title: "Overview of update validation in the Microsoft 365 Apps admin center"
ms.author: manoth
author: nicholasswhite
manager: dougeby
ms.reviewer: manoth
audience: ITPro
ms.topic: conceptual
ms.service: o365-proplus-itpro
ms.localizationpriority: medium
ms.collection: Tier1
description: "Update validation enables admins to test Microsoft 365 updates on a subset of devices, ensuring stability before a full-scale rollout."
ms.date: 06/18/2024
---

# Update validation

## Overview
Update Validation, a feature within the [Cloud Update](cloud-update.md) service in the [Microsoft 365 Apps admin center](https://config.office.com), enables administrators to validate new updates for the [Monthly Enterprise Channel](../updates/overview-update-channels.md#monthly-enterprise-channel-overview) before organization-wide deployment. This feature automatically collects and consolidates health indicators such as app and add-in performance and reliability data and brings attention to any identified issues. Its automated nature reduces the need for manual administrative work and simplifies the update deployment process.

> [!TIP]
> For a guided introduction to update validation, check out the [Introducing update validation in the Microsoft 365 Apps admin center](https://youtu.be/xZtXI-Ws-pE) video.

> [!NOTE]
> Update validation for add-ins is currently in private preview. It will become broadly available in Q1 2024.

## Benefits
Many large organizations choose to roll out new updates to only some devices at first. Staggering the deployment helps them find and fix potential problems early on and reduces the chance of having an issue impacting many devices. But it also means more work for the admins. They often must manually gather early feedback from sources like the help desk team or specific testers. And the feedback may not be clear or detailed enough to identify the actual issue without more investigation and troubleshooting. Overall, it adds to the admin's workload and slows down the deployment of the update.

Update validation helps administrators to automatically gather health signals, check them for devices on the first deployment wave, and determine if it's safe to proceed with the update deployment. Administrators can see a single interface that walks them through the process. Problems across apps and add-ins are automatically detected, evaluated, and highlighted. If there are issues, administrators can easily identify the affected devices, apps, and add-ins. Also, administrators can stop the rollout or restore updated devices to the previous update, all from the same administrative interface.

Update validation removes any irrelevant or inaccurate information from the health data by using statistical tests and thresholds. The admins get assessments based on reliable insights that show the actual impacts on the user's workflow.

## How it works
Update validation is automatically enabled once custom rollout waves are configured for the Monthly Enterprise Channel in Cloud Update. Once Cloud Update deploys a new update to device, the following actions are performed automatically:

- **Calculation of pre-update health:**  Using the Diagnostic Data received from devices on the first deployment wave from the seven days prior to the update release, it calculates performance and reliability baselines for each individual device, individual app, and individual add-in.
- **Calculation of post-update health:** Once a device installed the latest update, the same baselines are calculated once a statistical confidence of 95% is reached.
- **Filtering and comparison**: It compares the pre- and post-update metrics and calculates the actual change. Minor degradations below a certain threshold are filtered out.
- **Scoring**: Negative changes (degradations) are individually scored.
- **Calculating and showing assessment**: Once enough data has been received and validated, an assessment is shown to the admin.
    - **Green:** No/minor degradations were detected. The admin is encouraged to proceed with the deployment of the update.
    - **Yellow:** Limited degradations were detected, and the admin is advised to monitor the deployment closely.
    - **Red:** At least one major degradation was detected, and the admin is offered the option to pause the deployment or initiate a rollback.

For a status of yellow or red, the admin can review the list of devices and see which device, add-in/app, and health metric caused the given assessment.

## Requirements

### Supported built-in admin roles

<!--Using include for adding requirements-->
[!INCLUDE [Roles requirements](./includes/requirements-roles.md)]

### Licensing requirements

<!--Using include for adding requirements-->
[!INCLUDE [License requirements](./includes/requirements-licenses.md)]

### Product version requirements

<!--Using include for adding requirements-->
[!INCLUDE [Version requirements](./includes/requirements-versions.md)]

### Additional requirements
The following additional requirements must be met:
- Devices must be managed via cloud update.
- Diagnostic data for Office must be turned on for your devices.
    - We recommend that you enable [optional diagnostic data](../privacy/optional-diagnostic-data.md) to get reliability and performance results.
    - If your devices send [required diagnostic data](../privacy/required-diagnostic-data.md) only, only reliability results are shown.
- Devices must be on Monthly Enterprise Channel.
- You must configure and implement rollout waves.
- A period of seven days must be set between wave one and wave two rollouts.

## How to enable update validation
Configure [custom waves](cloud-update.md#rollout-waves) for cloud update. The first wave is automatically set to a seven day delay and update validation enabled. Ensure that wave one devices offer a diverse representation of your organization’s departments and usage scenarios, including  add-ins. This diverse representation promotes early issue detection and timely resolution, further minimizing potential risks.

## How to disable update validation
In case you want to disable update validation, your options are:
- Navigate to **Cloud Update > Monthly Enterprise channel > Settings > Rollout waves** and select the **Opt out of update validation** option.
- Disabled rollout waves altogether by setting the option **Use rollout waves** to *No, not needed*. Without rollout waves, update validation gets disabled automatically.

## In-Depth description
### Pre-update health baseline
Update validation is using Diagnostic Data sent by devices from the first rollout wave. The following metrics are computed using the data from the seven days prior to update's release:

- Performance: The app launch performance, measured in seconds.
- Reliability: The average crash rate, measured in percent.

These metrics are individually calculated for each of the following apps and add-ins:

- Word
- Excel
- PowerPoint
- Outlook
- OneNote
- Each public add-in, except for the ones bundled with Microsoft 365 Apps

These metrics are calculated individually per device and form the pre-update baseline for the given device. For example, if there are 10 devices on the first deployment wave and each device runs Microsoft 365 Apps with two extra add-ins, 14 metrics are calculated per device, 140 in total.

### Post-update health baseline
Once a device has updated to the newest version and sends Diagnostic Data, update validation starts to compute the post-update baseline. It uses the same metrics as the pre-update baseline and calculates them on an ongoing base. Once a statistical confidence of 95% is passed, the results are sent to the next stage. It might take several days for update validation to receive enough Diagnostic Data.

### Applying thresholds and scoring results
This stage involves comparing the baselines and individual metrics for each device. Metrics that have improved, such as the app launch time of Outlook, are disregarded in the subsequent steps. However, metrics that have worsened, such as the reliability of Word, are evaluated using the following thresholds to determine if the user is affected by the degradation.

- For each app, check if:
    - Performance is above 5 seconds and at least 1 second slower than before.
    - Reliability is below 99% and at least 1 percentage point lower than before.
- For each add-in, check if:
    - Performance is at least 1 second slower than before.
    - Reliability is below 99% and at least 1 percentage point lower than before.

The thresholds help to filter out degradations that are statistically significant, but not disruptive to users. For example, imagine Outlook's app start performance slows down from two seconds to three seconds. This is a 50% degradation, but it has not much impact on the user. Outlook still starts up fairly quickly and might not disrupt the user's daily routine.

Any degradation that exceeds the thresholds is then assigned a score.

- A degradation in the performance of an app: 0.5 points
- A degradation in the reliability of an app: 1 point
- A degradation in the performance of an add-in: 0.25 points
- A degradation in the reliability of an add-in: 0.5 points

### Showing assessment
A **grey** assessment indicates that more data is needed before a reliable evaluation can be made. This assessment is shown until data from at least 10 devices has been processed and scored. The scores are then summarized, and an assessment is shown to the admin:

- A green assessment means that the score is below 0.5. This implies no or minimal degradations and it should be safe to proceed with the update deployment.
- A yellow assessment means that the score is between 0.5 and 1.0. This implies limited degradations, and it's recommended to continue with the update deployment and monitor for any issues.
- A red assessment means that the score is above 1.0. This implies significant degradations, and the admin is advised to review which devices, apps and add-ins are affected and decide if the update deployment should be paused. The admin can also roll back devices that already received the update from the same interface.

For example:
- If Word starts slower than before on one device and exceeds the threshold, this adds 0.5 points to the score and results in a yellow assessment.
- If an add-in crashes more frequently than before on two devices and exceeds the threshold, this adds 1 point to the score and results in a red assessment. This doesn't have to be the same add-in across the two devices.
