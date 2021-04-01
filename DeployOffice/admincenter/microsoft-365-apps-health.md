---
title: "Microsoft 365 Apps health"
ms.author: jacarril
author: javiercarrillo
manager: laurawi
audience: ITPro
ms.topic: article
ms.service: o365-proplus-itpro
localization_priority: Normal
hideEdit: true
description: "Provides Office admins information about Microsoft 365 Apps health within their environment"
---

# Microsoft 365 Apps health

The Microsoft 365 Apps health dashboard in the [Microsoft 365 Apps admin center](https://config.office.com) helps you keep your Office apps up to date by providing visibility into how they are performing on your client devices and offering guidance to help optimize and troubleshoot arising issues. 

Requirements:
- Microsoft 365 Apps for enterprise or Microsoft 365 Apps for business, Version 1908 or later
- A version of Windows 10 supported by Microsoft 365 Apps for enterprise or Microsoft 365 Apps for business
- Microsoft 365 (or Office 365) for Business Standard, Business Premium, A3, A5, E3, or E5 subscription plan

> [!NOTE]
> The dashboard might show insights for versions older than 1908, but those versions aren't officially supported.

## How to get to the health dashboard

Go to the [Microsoft 365 Apps admin center](https://config.office.com) and click **Apps health** in the left-hand navigation. For information on using the admin center and enabling preview features, see [Overview of the Microsoft 365 Apps admin center](overview.md).

## Overview

The Microsoft 365 Apps health dashboard is designed to help you optimize and troubleshoot Office apps in your tenant. Its main benefits are:

- **Zero-effort setup**: it is powered by Office diagnostic data, so there is no need for additional agents or processes running on your premises
- **Visibility**: you can view how app health is evolving at any time, and correlate it with changes in your infrastructure 
- **Actionable**: it proactively detects problems or areas of optimization in your Office apps and presents them as advisories

The dashboard monitors Word, Excel, PowerPoint, Outlook, OneNote, and Publisher on Windows and offers health trends and advisories, which are updated every 24 hours. 

## Metrics, Trends, and Advisories

Currently, Microsoft 365 Apps health offers trends for the following performance and reliability metrics:
- App Crash Rate: the number of app crashes over number of user sessions, within the selected scope (app, build)
- App Boot Time: the time it takes from the moment the user opens the Office client until it is ready for user input, within the selected scope (app, build)
- App File Open Time (local): the time it takes from the moment the user opens a file from a local drive until the file is ready for user input, within the selected scope (app, build)
- App File Open Time (SharePoint): the time it takes from the moment the user opens a file from a SharePoint site or OneDrive for Business until the file is ready for user input, within the selected scope (app, build)

> [!TIP]
> To learn more about how to interpret trends, see [Performance trends](#performance-trends).

When a noteworthy change in a trend is detected, the dashboard presents it as an advisory. Advisories help you isolate fault domains and are defined in the context of a metric of a specific Office app, build, and channel (for example, crash rate of Word in build 16.0.13628.20274 in the Current update channel) and inform about a deterioration or improvement and are categorized as significant or minor. 

Advisories are detected by comparing the metric's value against that of a baseline, which can be:

- The value of the metric of the same app, build, and update channel in the past
- The value of the metric of the same app from the most active build of the same update channel in your tenant

> [!NOTE]
> "Not enough sessions" or "Not enough events" is displayed if not enough signals have been observed for the specific app and build in the space of 24 hours.

## Using Microsoft 365 Apps health

When you first sign in to the Microsoft 365 Apps health dashboard, you will see the Overview page. This page contains high-level insights about the Office clients health and activity in your tenant.

- App health overview: highlights the builds for which significant health deteriorations have been detected in your tenant. It includes the number of devices observed to run the impacted builds in the last 14 days. This is useful to assess impact and prioritize troubleshooting of impacted builds 
- App currency overview: shows the percentage of devices running builds from the recommended Monthly and Monthly Enterprise update channels. It also highlights the percentage of devices running builds that are out of support and should be updated as soon as possible to a supported build
- List of recent advisories: shows the latest advisories (generated in the last 24 hours) on significant deteriorations or improvements in the health trends of your Office apps. Each row includes the description of the deterioration as well as the impact app, build, and update channel. You can select any advisory to see additional details or navigate to Advisory History to see past (older than 24 hours) advisories
- Monitoring Coverage: shows the percentage of users in your organization who are sending diagnostic data to the dashboard over the last 14 days. The higher the percentage, the more representative the insights on the dashboard will be. You can expand this insight to see this percentage for each of the update channels deployed in your organization as well as the number of devices monitored by the dashboard. Note that the number of devices reported might differ from what your device management solution shows as device population might have changed in your organization during the 14-day period or due to devices not reporting diagnostic data or not being actively used. The number of devices is intended to provide an idea of magnitude rather than a precise device management count. 

### App metrics
This view helps you assess the health for each of the Office apps separately. This is useful if your organization's operations depend on specific Office app that you need to monitor closely. The following information is available for each app:

- Application name
- The number of app sessions in the last 14 days, which informs how widely the app is used in your organization
- Number of advisories on significant deteriorations in the last 24 hours

You can click on any app to get additional details

### App details
This view shows the health trends for a selected Office app across all the builds and update channels deployed in your tenant. You can select an app, metric, and build and the daily metric values will be plotted on a graph. By default, the most active and latest available builds are presented. You can also view other builds. Typical use cases for this view include:

- Comparing the performance and reliability of the selected Office app across builds (for example, latest builds versus most active build in your tenant)
- Discovering advisories for the selected Office client across your tenant, regardless of how many builds and update channels you use
- Validating user escalations about the performance and reliability of an Office client

### Channel and build metrics
This view is similar to App metrics but treats Office apps as a suite rather than as individual apps. Channel metrics help you discover the channels, versions, and builds actively being used in your tenant and assess their health. For each build, the following information is available: 

- Office version and build number
- The total number of sessions for apps of that build the last 14 days, which informs you how widely the build is used in your organization
- Number of advisories on significant deteriorations across the build in the last 24 hours
- Remarks about whether the build is unsupported, the most active in your tenant, and the latest available by Microsoft

You can click on any build to see additional details:
- Release information (release date, end of support date, whether the build is a feature or security update)
- The list of apps running the build, as well as their metrics in the last 24 hours (you can select an app to navigate further into the App Details page for the app)
- Details on the advisories on significant deteriorations across the build in the last 24 hours (description, impacted application and metric)

Common scenarios where this view can help include: 
- Assess how a recently deployed build is behaving
- Identify the build with most active devices
- Identify if unsupported builds are still being used in your tenant
- Compare performance and reliability across builds and update channels
- Assess fragmentation (usage of too many builds) of Office clients in your tenant  


### All advisories
This view shows advisories across all apps and builds used in your tenant in the past 30 days (including the last 24 hours). This view is useful to investigate if a recent advisory or health trend change has occurred in the past.

The following details are available for each advisory:
- Advisory description, which includes the name of the impacted metric and its change compared with the baseline
- Impacted application 
- Channel and build
- Advisory type, which indicates whether the change is significant or minor and whether it is a deterioration or an improvement
- Date of creation of the advisory

You can get additional troubleshooting information by selecting an advisory: 
- The trend of the metric for both the impacted and baseline builds over the last 30 days
- The channel, version, and number of the build used as baseline 
- The value of the trend change in the last 24 hours
- The value of the trend change at the time of the advisory creation (for advisories older than 24 hours)
- Guidance on how to proceed depending on the support status of the build and its age

This view shows the trends for a selected health metric and Office app across all the builds deployed in your tenant, grouped by update channel. 

Microsoft 365 Apps health monitors performance and reliability trends across your Office apps and presents advisories when noteworthy changes in those trends are detected. These changes can be deteriorations or improvements and are categorized as significant or minor.

Advisories are defined in the context of a metric of a specific Office app, build, and channel and are detected by comparing the metric's value against that of a baseline, which can be:

- The value of the metric of the same app, build, and update channel in the past
- The value of the metric of the same app, from the most active build of the same update channel in your tenant

The advisory view will help you understand the context of the regression and get guidance. On this view, you will see:

- Office app, build, and metric where trend change has been detected
- Number of user sessions in the impacted build and app
- Value of the monitored metric when the regression was detected
- Current value of the monitored metric
- Recommended troubleshooting actions

Note that the Active devices count refers to the number of devices in your tenant on which the Office apps are being used. There may be a slight misalignment with management tools as these typically report number of devices on which the Office apps are installed, even if they are not being used.

## Data for the Microsoft 365 Apps health dashboard

The Microsoft 365 Apps health dashboard uses the diagnostic data that your Office apps send to Microsoft. Diagnostic data is always under your control. To learn more about diagnostic data and the controls available to you see [Overview of privacy controls for  Microsoft 365 Apps for enterprise](../privacy/overview-privacy-controls.md).

## Performance trends

Apps Health shows performance trends for the selected scope (app, build).  For builds rolled out at a monthly cadence, this enables you to see how a build’s performance changes over the build’s lifecycle.  For instance, when a build is first released it has lower usage so the performance metrics are often higher, then as the build usage increases and stabilizes the performance metrics go down and stabilize. Then when a new build is rolled out it goes through the same pattern while the old build has reduced usage and performance metrics show a correlated change.  The specific patterns are often unique to your organization and the way that build rollouts happen within your tenant. Hover over a trend to see the current usage (Event Count) to understand when the builds have similar usage and therefore it makes sense to compare them.  Often the closer the usage is between builds the more comparable the performance trends are.

Beyond build-to-build comparisons Performance trends can be used to assess the health of Office applications at any time and as changes are being made within your tenant.  Here are some common use cases that can cause performance shifts and are items to check if an unexpected shift in performance occurs:

- Add-ins: If there are changes in add-ins for Office including new add-ins, updating existing add-ins, or removing add-ins.

- Antivirus (AV) Software: Changes in antivirus software updates, including new software, updating to a new version, or removing AV software.

- Policy Changes: Updating policies that affect file handling or Office applications specifically can cause performance shifts.

- Changes in deployment: Adding or removing devices can cause a change in performance patterns that set a new “normal” or expected pattern.  Changing the order of rollout to machines can cause the on-boarding and aging out of builds to have different performance patterns.

Here are examples of other common scenarios where performance patterns change and aren’t necessarily cause for alarm:

- Seasonality: Change in usage around holidays or different seasons for the company or industry

- OS updates: Updates, like OS updates, that result in machines rebooting commonly increases performance trends during those times and it can last for several days after as the updates move across the organization

- Machine Reboots: Like above, anything that causes many machines to reboot will affect performance trends, in particular for boot.  This could be deploying configurations that require a reboot, building repairs requiring a power outage, weather power outages, or other events.

- Device Hardware Changes: When new hardware is rolled out or there is a shift in the hardware configuration of devices that can cause performance trend movement as performance improves or degrades for the new devices

- Usage Shifts: For example, if users are encouraged or defaults are changed that lead to different usage patterns.  For instance, making the default save location for Office files SharePoint, instead of local.  This will result in more File Opens from SharePoint and fewer from the local drive, which will likely have correlated performance shifts.


For build rollouts that happen less frequently, the build-to-build comparisons can be more challenging since you can’t see the full lifecycle of the build that is aging out.  In those scenarios here are a few suggestions that can help:

- Event Counts: Hovering over a point in the trends will bring up additional data including the Event Count.  Check the Event Counts for the current build before the new rollout started and once the new build has similar counts then the performance trends will be a better comparison for assessing the current versus new build.

- New Build Performance Characteristics:   Even if the trend isn’t shown, keep in mind that as a new build rolls out and usage increases the performance pattern often changes.  In many cases, the performance metrics in new builds will start higher and will come down as their usage increases.

Investigation workflow for unexpected shifts in Office performance:

1. **Verify Usage**: When shifts in a metric occur, be sure to check the event volumes, which can be done by hovering over a trend line in the graph. Performance metrics can shift significantly depending on the audience of a build and the event volume – a good first step here is to ensure the signals have similar usage.
2. **Device changes**: Device changes can often cause temporary or permanent changes in the performance of Office.  Therefore, the next step is to investigate if there have been changes to add-ins, anti-virus software, updated policies, updated registry keys, OS updates, VM configuration updates, updated Office build, or hardware changes.  Verify if those updates happened at the same time as the shifts in metrics.
3. **Confirm findings or continue analysis**:  Using a device that is exhibiting slower performance:
  - If the shift correlates with a change in the device environment then test the scenario on the device with and without the change to confirm that is the source of the performance shift. For instance, if a new anti-virus software was rolled out get a device with the anti-virus software and measure the performance of the scenario several times.  Then remove the anti-virus software and measure the performance several times. Compare the results to verify that the removal of the anti-virus software resolves the shift in performance.
  - If no correlating factor was found at the broad level, then measure the current performance on the device and begin removing common factors testing performance after each change to identify the source. For instance, remove add-ins one by one and see if performance improves when they are removed. If it isn’t add-in related, then remove anti-virus and continue testing performance at each step to find the source.
  - Test on other devices to build confidence that is the source of the issue.
4. Take appropriate action to fix or mitigate the performance issue and monitor performance trends as the change is rolled out  
