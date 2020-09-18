---
title: "Microsoft 365 Apps health"
ms.author: jacarril
author: javiercarrillo
manager: laurawi
audience: ITPro
ms.topic: article
ms.service: o365-proplus-itpro
localization_priority: None
ROBOTS: NOINDEX, NOFOLLOW
hideEdit: true
description: "Provides Office admins information about Microsoft 365 Apps health within their environment"
---

# Microsoft 365 Apps health

> [!IMPORTANT]
> This is pre-release documentation for a preview program that isn’t available to everyone and is subject to change.

The Microsoft 365 Apps health dashboard on Apps Admin Center is designed to help you optimize and troubleshoot Office clients in your tenant. Its main benefits are:

- Zero-effort: no need for additional agents or processes running on your premises
- Insightful: it proactively detects problems or areas of optimization in your Office clients
- Actionable: it provides steps, based on best practices, to troubleshoot issues or optimize your Office client environment

## Accessing the Microsoft 365 Apps health dashboard

The Microsoft 365 Apps health dashboard is available at https://config.office.com/apphealth on the Apps Admin Center. In order to use it, you will need:

- An account with the [Office App Administrator role ](https://docs.microsoft.com/azure/active-directory/users-groups-roles/directory-assign-admin-roles#office-apps-administrator-permissions)
- During the preview period, you will need to join the preview program on Apps Admin Center. If you have not joined the preview program yet, you will be prompted to do so when visiting the Microsoft 365 Apps health dashboard for the first time

## Using the Microsoft 365 Apps health dashboard

### Overview

When you first sign-in to the Microsoft 365 Apps health dashboard, you will see the Overview page. This page contains high-level insights about the Office clients health and activity in your tenant.

- Advisories in your tenant: shows the latest advisories on performance and reliability regressions in occurring on your tenant. You can select any advisory to see advisory details
- Performance and reliability scores: these scores are measured against industry benchmarks and their purpose is to help you compare  the performance and reliability of the Office clients in your tenant versus the industry
- Supported versions score: indicates the percentage of active devices in your tenant that are using supported versions of the Office clients. You ensure your devices are secure and supported, want for this score to be as close to 100% as possible, all the time
- Activity in recommended channels: this insight informs you about the percentage of Office client activity that is taking place on devices set to the Current and Monthly Enterprise channels, which deliver the latest and most secure features for the Office clients. In order to boost collaboration and productivity in your organization, you want this number to be as high as possible

### Advisory Details

The Microsoft 365 Apps health dashboard monitors performance and reliability metrics across your Office clients. An advisory informs you about regressions occurring in those metrics, within your tenant.

The advisory view will help you understand the context of the regression and get guidance. On this view, you will see:

- Office client, build, and metric where a regression has occurred
- Number of user sessions in the impacted build and app
- Value of the monitored metric when the regression was detected
- Current value of the monitored metric
- Recommended troubleshooting actions

### App Metrics

This view shows the reliability and performance of the Office clients across all builds, versions, and channels active in your tenant. This view helps you discover issues related to a specific application (for example, Excel), across all versions and builds in your tenant.

The list of applications shows you:

- The name of the application
- The performance and reliability scores for the application (across all builds and versions of the application in your tenant)
- The number of performance and reliability advisories for the application (across all builds and versions of the application in your tenant)

You can select an application to view more details.

### App Details

This view presents performance and reliability metrics and advisories for the selected Office client, across all active builds and update channels in your tenant. Some common scenarios where this view can help are:

- Compare the performance and reliability of the selected Office client across builds (for example, latest builds versus most active build in your tenant)
- Discover advisories for the selected Office client across your tenant, regardless of how many builds and update channels you use
- Fact-check user escalations about the performance and reliability of an Office client

### Channel Metrics

This view the reliability and performance of your Office clients for each of the active builds in your tenant, grouped by channel. Some common scenarios where this view can help are:

- Assess how a recently deployed build is behaving
- Identify the build with most active devices
- Identify if unsupported builds are still being used in your tenant
- Compare performance and reliability across builds and update channels
- Assess fragmentation (usage of too many builds) of Office clients in your tenant  

You can select a build to get more information on the build and see the performance and reliability metrics for all the Office clients within the selected build. 

### Build Details

This view provides you with additional release information and Office client performance and reliability metrics for the selected build. Some common scenarios where this view can help are:

- Obtain additional release information about the build (for example, release type, release date, end of support date)
- Assess how the Office client performance and reliability of a specific build is evolving in your tenant
- Identify Office clients usage within the selected build
- Discover advisories related to the build

## Frequently asked questions

### How is the data for the Microsoft 365 Apps health dashboard obtained?

The Microsoft 365 Apps health dashboard uses the diagnostic data that your Office clients send to Microsoft. You are in control of which data and which devices send this data.

Diagnostic data is always under your control. To learn more about diagnostic data and the controls available to you see [Privacy Controls on Microsoft 365 Apps](https://docs.microsoft.com/deployoffice/privacy/overview-privacy-controls)

### Which apps are covered and on which platforms?

The apps covered at the moment are: Word, Excel, PowerPoint, Outlook, OneNote, and Publisher on Windows. We will be adding coverage for more apps in the future.

### How fresh is the data?

At preview, the Microsoft 365 Apps health dashboard detects issues every 24 hours.

### What is 'active device count' and why is it different from what my device management tools show?

Active devices count refers to number of devices in your tenant on which the Office apps are being used. There may be a slight misalignment with management tools as these typically report number of devices on which the Office apps are installed, even if they are not being used.

### What performance and reliability metrics are monitored by the Microsoft 365 Apps health dashboard?

At the moment, Microsoft 365 Apps health offers monitoring for the following metrics:

- App Crash Rate: indicates you the number of app crashes over number of user sessions, within the selected scope (app, build)
- App Boot Time: indicates the time it takes from the moment the user opens the Office client until it is ready for user input, within the selected scope (app, build)
- App File Open Time (local): indicates the time it takes from the moment the user saves a file to their local computer until the file has completed saving, within the selected scope (app, build)
- App File Open Time (SharePoint): indicates the time it takes from the moment the user save a file to a SharePoint site or OneDrive for Business until the file has completed saving, within the selected scope (app, build)

#### Will you be adding more performance and reliability metrics?

Yes, during the preview period, you will see more metrics show up on the Microsoft 365 Apps health dashboard

#### Can I see add-in metrics?

Not yet, but we are working hard on it

#### Why do I see some metrics as 'pending'?

'Pending' will be displayed whenever not enough signals have been observed for the specific app and build which means statistical significance has not been reached to provide you with a reliable metric value.

#### Can I export data?

Not yet, but we are working hard on it

#### How does this dashboard integrate with Office Telemetry Dashboard (OTD)?

The Microsoft 365 Apps health dashboard aspires to offer capabilities and insights that supersede OTD, while requiring less work and resources from your organization and users.
