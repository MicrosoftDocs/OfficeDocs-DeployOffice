---
title: "App Health"
ms.author: jacarril
author: jacarril__update_with_your_github_username
manager: laurawi
audience: ITPro
ms.topic: article
ms.service: o365-proplus-itpro
localization_priority: None
ROBOTS: NOINDEX, NOFOLLOW
hideEdit: true
---

# App Health

> [!IMPORTANT]
> This is pre-release documentation for a preview program that isn’t available to everyone and is subject to change.

The Microsoft 365 Apps Health dashboard on Apps Admin Center is designed to help you optimize and troubleshoot Office clients in your tenant. Its main:

- Zero onboarding: it leverages diagnostics data that your tenant already shares with Microsoft so there is not need for additional agents or processes running on your premises
- Insightful: it analysis diagnostics data proactively looking for regressions or issues and creates insights to help you discover problems or areas of optimization in your Office clients
- Actionable: it provides steps, based on best practices, to troubleshoot issues or optimize your Office client environment

Diagnostics data is always under your control. To learn more about diagnostics data and the controls available to you see [Privacy Controls on Microsoft 365 Apps](https://docs.microsoft.com/en-us/deployoffice/privacy/overview-privacy-controls)

## Accessing the Microsoft 365 Apps Health dashboard
The Microsoft 365 Apps Health dashboard is available at https://config.office.com/apphealth on the Apps Admin Center. In order to use it you will need:
- An account with the [Office App Administrator role ](https://docs.microsoft.com/azure/active-directory/users-groups-roles/directory-assign-admin-roles#office-apps-administrator-permissions) 
- During the preview period, you will need to join the preview program on Apps Admin Center. If you have not joined the preview program yet, you will be prompted to do so when visiting the Microsoft 365 Apps Health dashboard for the first time

## Using the Microsoft 365 Apps Health dashboard
### Overview
When you first sign-in to the Microsoft 365 Apps Health dashboard, you will see the Overview page. This page contains high level insights about the Office clients health and activity in your tenant. 
- Performance and reliability scores: these are measured against industry benchmarks and their purpose is to help you compare  the performance and reliability of the Office clients in your tenant versus the industry
- Supported versions score: indicates the percentage of active devices in your tenant that are using supported versions of the Office clients. You ensure your devices are secure and supported, want for this score to be as close to 100% as possible, all the time
- Diagnostics data coverage: because the insights on the Microsoft 365 Apps Health are powered by diagnostics data, it is important that you understand which percentage of your devices are configured to send diagnostics data to Microsoft. Ideally, you want this percentage to be as high as possible and equally distributed across the [update channels](https://docs.microsoft.com/en-us/deployoffice/overview-update-channels) you have configured devices in your tenant to
- Activity in recommended channels: this insight informs you about the percentage of Office client activity that is taking place on devices set to the Current and Monthly Enterprise channels, which deliver the latest and most secure features for the Office clients. In order to boost collaboration and productivity in your organization, you want this number to be as high as possible

### App Metrics
### Channel Metrics
