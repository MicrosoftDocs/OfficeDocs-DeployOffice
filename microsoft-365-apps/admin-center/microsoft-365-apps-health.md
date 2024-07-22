---
title: "Microsoft 365 Apps health"
ms.author: manoth
author: manoth-msft
manager: dougeby
audience: ITPro
ms.topic: conceptual
ms.service: o365-proplus-itpro
ms.localizationpriority: medium
ms.collection: Tier2
recommendations: false
description: "Provides Office admins information about Microsoft 365 Apps health within their environment"
ms.date: 04/25/2024
---

# Microsoft 365 Apps health

The Microsoft 365 Apps health dashboard in the [Microsoft 365 Apps admin center](https://config.office.com) helps you keep your apps healthy. It provides visibility into how they're performing on your client devices and offering guidance to help optimize and troubleshoot arising issues.

> [!TIP]
> If you prefer watching over reading, check out the our [introductional video on Apps Health](https://youtu.be/g9tiCFNDOEw).

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
> [!NOTE]
> The dashboard might show insights for unsupported versions, but those versions aren't officially supported and should be updated as soon as possible. Use [inventory](inventory.md) to identify devices running unsupported versions.

### Network requirements
<!--Using include for adding requirements-->
[!INCLUDE [Network requirements](./includes/requirements-network.md)]

### Additional requirements
**[Diagnostic data for Office](../privacy/overview-privacy-controls.md)** should be enabled on your devices, as this is the default setting. If you have limited the transmission of diagnostic data for Office, perhaps through group policy settings, it will be necessary to [modify these settings](../privacy/manage-privacy-controls.md) to permit the sending of both required and optional data.

## How to get to the health dashboard
Go to the [Microsoft 365 Apps admin center](https://config.office.com), extend the **Health** node, and select **Apps health**. For information on using the Microsoft 365 Apps admin center, see [Overview of the Microsoft 365 Apps admin center](overview.md).

## Overview
The Microsoft 365 Apps health dashboard is designed to help you optimize and troubleshoot the Microsoft 365 Apps in your tenant. Its main benefits are:

- **Zero-effort setup**: No deployment of extra agents needed, as it's using Office diagnostic data 
- **Visibility**: you can view how app health is evolving at any time, and correlate it with changes in your infrastructure 
- **Actionable**: it proactively detects problems or areas of optimization in your Office apps and presents them as advisories

The dashboard monitors Word, Excel, PowerPoint, Outlook, OneNote, and Publisher on Windows. Health trends and advisories are updated every 24 hours. 

## Metrics, Trends, and Advisories
Currently, Microsoft 365 Apps health offers trends for the following performance and reliability metrics:
- App Crash Rate: the number of app crashes over number of user sessions, within the selected scope (app, build)
- App Boot Time: the time it takes from the moment the user opens apps until it's ready for user input, within the selected scope (app, build)
- App File Open Time (local): the time it takes from the moment the user opens a file from a local drive until the file is ready for user input, within the selected scope (app, build)
- App File Open Time (SharePoint): the time it takes from the moment the user opens a file from a SharePoint site or Microsoft OneDrive for work and school until the file is ready for user input, within the selected scope (app, build)

> [!TIP]
> To learn more about how to interpret trends, see [Performance trends](#performance-trends).

When a noteworthy change in a trend is detected, the dashboard presents it as an advisory. Advisories help you isolate fault domains and are defined in the context of a metric of a specific app, build, and channel. They inform about a deterioration or improvement and are categorized as significant or minor. 

Advisories are detected by comparing the metric's value against the baseline, which can be:

- The value of the metric of the same app, build, and update channel in the past
- The value of the metric of the same app from the most active build of the same update channel in your tenant

> [!NOTE]
> "Not enough sessions" or "Not enough events" is displayed if not enough signals have been observed for the specific app and build in the space of 24 hours.

## Using Microsoft 365 Apps health

When you first sign in to the Microsoft 365 Apps health dashboard, you see the Overview page. This page contains high-level insights about the Office clients health and activity in your tenant.

- App health overview: highlights the builds for which significant health deteriorations are detected in your tenant. It lists how many devices ran these builds over the past 14 days. Use this data to prioritize fixing these builds.
- List of recent advisories: shows the latest advisories (generated in the last 24 hours) on significant deteriorations or improvements in the health trends of your Office apps. Each row includes the description of the deterioration and the affected app, build, and update channel. You can select any advisory to see more details or navigate to Advisory History to see past (older than 24 hours) advisories.
- Monitoring Coverage: shows the percentage of users in your organization who are sending diagnostic data to the dashboard over the last 14 days. The higher the percentage, the more representative the insights on the dashboard are. You can expand this insight to see the percentage for each update channel and the total number of devices the dashboard monitors in your organization. The number of devices reported might not match the numbers your device management system reports. This discrepancy can arise because the number of devices within your organization could vary within a 14-day timeframe. Additionally, some devices might not report diagnostic data or could be inactive. 

### App metrics
This view helps you assess the health for each of the Office apps separately. This information is useful if your organization's operations depend on specific Office app that you need to monitor closely. The following information is available for each app:

- Application name
- The number of app sessions in the last 14 days, which informs how widely the app is used in your organization
- Number of advisories on significant deteriorations in the last 24 hours

You can select any app to get more details.

### App details
This view shows the health trends for a selected Office app across all the builds and update channels deployed in your tenant. You can select an app, metric, and build and the daily metric values are plotted on a graph. By default, the most active and latest available builds are presented. You can also view other builds. Typical use cases for this view include:

- Comparing the performance and reliability of the selected Office app across builds (for example, latest builds versus most active build in your tenant)
- Discovering advisories for the selected Office client across your tenant, regardless of how many builds and update channels you use
- Validating user escalations about the performance and reliability of an Office client

### Channel and build metrics
This view is similar to App metrics but treats Office apps as a suite rather than as individual apps. Channel metrics help you discover channels, versions, and builds actively being used in your tenant and assess their health. For each build, the following information is available: 

- Office version and build number
- The total number of sessions for apps of that build the last 14 days, which inform you how widely the build is used in your organization
- Number of advisories on significant deteriorations across the build in the last 24 hours
- Remarks about whether the build is unsupported, the most active in your tenant, and the latest available by Microsoft

You can select any build to see more details:
- Release information (release date, end of support date, whether the build is a feature or security update)
- The list of apps running the build, and their metrics in the last 24 hours (you can select an app to navigate further into the App Details page for the app)
- Details on the advisories on significant deteriorations across the build in the last 24 hours (description, impacted application and metric)

Common scenarios where this view can help include: 
- Assess how a recently deployed build is behaving
- Identify the build with most active devices
- Identify if unsupported builds are still being used in your tenant
- Compare performance and reliability across builds and update channels
- Assess fragmentation (usage of too many builds) of Office clients in your tenant  

### Add-in health

The **Add-in health** view provides information about the reliability and performance of COM and VSTO add-ins used by Office apps in your organization. Add-ins can be downloaded and installed to provide more capabilities and functionality to apps, such as Word and Excel. There are usually two sources of add-ins:

- Public add-ins created by independent software publishers or by Microsoft are generally available to all worldwide users.
- Private add-ins developed by or for an organization for internal use only are used only by users within that organization.

The **Add-in health** view only shows information about public add-ins, including the following information:

- Name
- Publisher
- Installed version or versions
- Apps using the add-in
- Number of devices with installed add-in
- 32-bit or 64-bit
- Crash rate (as a percentage) <sup>[1]</sup>
- Load time (in seconds)

<sup>[1]</sup> *Includes both crashes and failed loads.*

Information about add-ins, like all information in Microsoft 365 Apps health, relies on the inventory feature being enabled in the Microsoft 365 Apps admin center. Data about crash rates, load times, and load failures is derived from events that are collected and sent to Microsoft when the add-in is loaded and used by the Office app.

For information about public add-ins to appear in the **Add-in health** view, you must do the following:

- Use the [inventory feature](inventory.md) in the Microsoft 365 Apps admin center
- Send at least [required diagnostic data](../privacy/required-diagnostic-data.md) to Microsoft
- Use at least Version 2112 of Microsoft 365 Apps

### All advisories
This view shows advisories across all apps and builds used in your tenant in the past 30 days (including the last 24 hours). This view is useful to investigate if a recent advisory or health trend change occurred in the past.

The following details are available for each advisory:
- Advisory description, which includes the name of the impacted metric and its change compared with the baseline
- Impacted application 
- Channel and build
- Advisory type, which indicates whether the change is significant or minor and whether it's a deterioration or an improvement
- Date of creation of the advisory

You can get more troubleshooting information by selecting an advisory: 
- The trend of the metric for both the impacted and baseline builds over the last 30 days
- The channel, version, and number of the build used as baseline 
- The value of the trend change in the last 24 hours
- The value of the trend change at the time of the advisory creation (for advisories older than 24 hours)
- Guidance on how to proceed depending on the support status of the build and its age

This view shows the trends for a selected health metric and Office app across all the builds deployed in your tenant, grouped by update channel. 

Microsoft 365 Apps health monitors performance and reliability trends across your Office apps and presents advisories when noteworthy changes in those trends are detected. These changes can be deteriorations or improvements and are categorized as significant or minor.

Advisories are identified by comparing an Office app's metric value with a baseline, which can be:

- The value of the metric of the same app, build, and update channel in the past
- The value of the metric of the same app, from the most active build of the same update channel in your tenant

The advisory view helps you understand the context of the regression and get guidance. On this view, you see:

- Office app, build, and metric where trend change is detected
- Number of user sessions in the impacted build and app
- Value of the monitored metric when the regression was detected
- Current value of the monitored metric
- Recommended troubleshooting actions

The Active devices count refers to the number of devices in your tenant on which the Office apps are being used. There might be a slight misalignment with management tools as these typically report number of devices on which the Office apps are installed, even if they aren't being used.

## Data for the Microsoft 365 Apps health dashboard

The Microsoft 365 Apps health dashboard uses the diagnostic data that your Office apps send to Microsoft. Diagnostic data is always under your control. To learn more about diagnostic data and the controls available to you see [Overview of privacy controls for  Microsoft 365 Apps for enterprise](../privacy/overview-privacy-controls.md).

## Performance trends

Apps Health shows performance trends for the selected scope (app, build). For builds rolled out at a monthly cadence, this feature allows you to see how a build’s performance changes over the build’s lifecycle. For instance, when a new build is launched, it usually has fewer users, which often result in higher performance metrics. However, as more people start using the build and its usage becomes more widespread, these performance metrics typically decrease and stabilize. Then when a new build is rolled out it goes through the same pattern while the old build reduces usage and performance metrics show a correlated change. The specific patterns are often unique to your organization and the way that build rollouts happen within your tenant. Hover over a trend to see the current usage (Event Count) to understand when the builds have similar usage and therefore it makes sense to compare them. Often the closer the usage is between builds the more comparable the performance trends are.

Beyond build-to-build comparisons Performance trends can be used to assess the health of Office applications at any time and as changes are being made within your tenant. Here are some common use cases that can cause performance shifts and are items to check if an unexpected shift in performance occurs:

- Add-ins: If there are changes in add-ins for Office including new add-ins, updating existing add-ins, or removing add-ins.

- Antivirus (AV) Software: Changes in antivirus software updates, including new software, updating to a new version, or removing AV software.

- Policy Changes: Updating policies that affect file handling or Office applications specifically can cause performance shifts.

- Changes in deployment: Adding or removing devices can cause a change in performance patterns that set a new "normal" or expected pattern. Changing the order of rollout to machines can cause the on-boarding and aging out of builds to have different performance patterns.

Here are examples of other common scenarios where performance patterns change and aren’t necessarily cause for alarm:

- Seasonality: Change in usage around holidays or different seasons for the company or industry.

- OS updates: Updates, like OS updates that result in machines rebooting commonly increases performance trends during those times and it can last for several days after as the updates move across the organization.

- Machine Reboots: Anything that causes many machines to reboot affects performance trends, in particular for boot. Such events include deploying configurations that require a reboot, building repairs requiring a power outage, weather power outages, or other events.

- Device Hardware Changes: Introducing new hardware or changing the hardware setup in devices can lead to changes in performance trends. This change in the trend happens as performance either improves or declines with the updated devices.

- Usage Shifts: For example, if users are encouraged or defaults are changed that lead to different usage patterns. For instance, making the default save location for Office files SharePoint, instead of local. This change leads to an increase in files opened from SharePoint and a decrease in files opened from the local drive, likely causing shifts in performance.


When build rollouts occur less frequently, comparing builds becomes more difficult because it's hard to observe the complete lifecycle of the aging build. For these scenarios, here are a few suggestions that can help:

- Event Counts: When you hover over a point in the trends, it displays more data, including the Event Count. Examine the Event Counts for the current build before initiating the new rollout. Once the new build achieves similar counts, comparing performance trends offers a more accurate evaluation of the current build against the new one.

- New Build Performance Characteristics: Even without visible trends, the performance patterns often change as a new build is deployed and its usage grows. Typically, performance metrics in new builds begin at a higher level and decrease as usage expands.

Investigation workflow for unexpected shifts in Office performance:

1. **Verify Usage**: When shifts in a metric occur, be sure to check the event volumes, which can be done by hovering over a trend line in the graph. Performance metrics can shift significantly depending on the audience of a build and the event volume – a good first step is to ensure the signals have similar usage.
2. **Device changes**: Device changes can often cause temporary or permanent changes in the performance of Office. The next step is to examine updates in several areas: add-ins, anti-virus software, policies, registry keys, operating systems, VM configurations, Office builds, and hardware changes. Verify if those updates happened at the same time as the shifts in metrics.
3. **Confirm findings or continue analysis**:  Using a device that is exhibiting slower performance.
  - If the shift correlates with a change in the device environment then test the scenario on the device with and without the change to confirm that is the source of the performance shift. For example, if new anti-virus software is deployed, obtain a device with this software and test the performance scenario multiple times. Then remove the anti-virus software and measure the performance several times. Compare the results to verify that the removal of the anti-virus software resolves the shift in performance.
  - If no correlating factor was found at the broad level, then measure the current performance on the device and begin removing common factors testing performance after each change to identify the source. For instance, remove add-ins one by one and see if performance improves when they're removed. If it isn’t add-in related, then remove anti-virus and continue testing performance at each step to find the source.
  - Test on other devices to build confidence that is the source of the issue.
4. Take appropriate action to fix or mitigate the performance issue and monitor performance trends as the change is rolled out.  
