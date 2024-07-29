---
title: "New Outlook for Windows Migration Guide"
ms.author: janellem
author: JanelleMcIntosh-MSFT
manager: triciag
audience: ITPro
ms.topic: overview
ms.service: outlook
ms.collection: Tier3
ms.localizationpriority: medium
ms.custom: intro-overview
recommendations: true
description: "Migration planning guide for new Outlook"
ms.custom: QuickDraft  
ai-usage: ai-assisted
ms.date: 07/29/2024
---

# Migration Guide for New Outlook for Windows

**Customer Intent for this Article:** To provide IT administrators with a comprehensive guide to plan and execute the migration from classic Outlook to new Outlook for Windows.

## Section 1: Migration Planning

### Planning a Successful Migration

Detailed planning is critical when upgrading a critical software application. Outlining a robust plan will help mitigate risks, allocate resources accordingly, minimize downtime, and ensure the productivity of your team is minimally affected.

### Migration Project Checklist

Use the available checklist to ensure you have completed all key activities in preparation for your upgrade to new Outlook. The checklist includes tasks like building your team, defining your project scope, preparing your environment, and conducting a pilot. Access the checklist in the migration guide available at <https://aka.ms/newOutlookAdoption>.

### Build Your Project Team

Any successful project begins by bringing the right team together. Your project stakeholders should include representatives across your organization who have accountability for project success. There are two types of stakeholders:

- A sponsorship coalition inclusive of executive and business sponsors, as well as those with a key role in project success.
- The project team consisting of technical and user readiness members who will be completing the various tasks associated with the project plan.

Not all roles may apply to your project, or you may have others not listed. Adjust roles as appropriate. Access a table of roles, responsibilities, and names in the migration guide at <https://aka.ms/newOutlookAdoption>.

### Define Your Project Scope

Taking time to define your project scope and goals will help ensure everyone on your project team is aligned and working toward the same end results. Refer to this section throughout your project to ensure you are on track for your desired end-state. Use the goals section to measure against your outcomes and mitigate as needed.

Outline the SCOPE for this project. The scope defines the current focus of your project. Establish your project TIMELINE. Define the timeline for your Outlook upgrade journey, including placeholders for an adequate pilot (minimum 45 days) and a phased upgrade. Define the GOALS for this project. Your goals define the outcome you want and enable you to measure the success of the project. Identify your BASELINE to track progress.

Access a sample project timeline, baseline table, and other resources in the migration guide at <https://aka.ms/newOutlookAdoption>.

### Define Your Risk and Mitigation Plan

Proactively assess potential risks and define a mitigation strategy for overcoming issues that might arise. A risk register is an excellent tool for tracking risks and their potential impact while capturing your mitigation plan. Access a sample risk and mitigation plan table in the migration guide at <https://aka.ms/newOutlookAdoption>.

### Outline Your Upgrade Approach

Your organization may decide to move everyone to new Outlook at once or allow users to use classic Outlook and new Outlook together for a period of time. Articulate your plan here, then validate as part of your pilot. After your pilot, reassess this plan and make any adjustments based on learnings from the pilot program.

### Review Path Options

Microsoft offers flexibility in how you get to new Outlook. Below are the two primary paths:

- Path 1: Having classic Outlook and new Outlook coexist.
- Path 2: Moving all users to new Outlook.

Consider feature requirements and overlap, experience considerations, and the velocity of moving users over. Access a sample table to track these topics in the migration guide at <https://aka.ms/newOutlookAdoption>.

### Prepare Your Organization

To realize maximum value from new Outlook, users must actually use it. Design the right readiness plan to help accelerate adoption and facilitate the transition from classic Outlook to new Outlook. Identify your user readiness channels across awareness, training, and support options. Access a table identifying resources for each of these channels in the migration guide at <https://aka.ms/newOutlookAdoption>.

### Conduct an Upgrade Pilot

Think of a pilot as a "test drive" of your upgrade strategy to validate readiness and prepare for the next steps on your upgrade journey. Use the pilot to validate functional readiness, identify peer champions, and hone messaging to support expanded adoption. Access template emails, surveys, and a test plan at <https://aka.ms/newOutlookAdoption>.

### Drive Operational Excellence

Upgrade success does not end when your deployment is complete. Include a plan to support ongoing change and ensure you have a plan to implement new changes as they come online. Execute an agile change management approach to facilitate new features and solutions while minimizing user disruption. Access a set of helpful resources at <https://aka.ms/newOutlookResources>.

## Section 2: Migration

### Compatibility Requirements

New Outlook for Windows requires a minimum OS version Windows 10 Version 1809 (Build 17763) and an internet connection.

### Obtaining the New Outlook for Windows

For End Users: Through the Classic Outlook for Windows in-app toggle and the Windows app store.

With Windows: New PCs will include the new Outlook for Windows by default, replacing the native Mail and Calendar apps (2024).

### Toggling In / Out

You can switch to the new Outlook application by using the toggle found in the Outlook for Windows app. This will close out your Outlook for Windows client and open the New Outlook for Windows.

### Downloading from the Windows Store

You can also download it from the Windows Store. See more: [Deployment overview for the new Outlook for Windows](https://learn.microsoft.com/en-us/deployoffice/deployment-overview-new-outlook-windows).

### Managing Settings

Adjusting your new Outlook for Windows settings will result in changes to your OWA settings.

### Setting a Central Distribution Location

To install the new Outlook on a single computer with many users, follow these steps:

1.  Download the Setup.exe.
2.  Open PowerShell 7 in administrator mode (right-click the PowerShell icon and select **Run as Administrator**).
3.  Navigate to where the Setup.exe file is located.
4.  Run the following command: `.\Setup.exe --provision true --quiet --start-`

To deploy this installer to a group of computers or your entire organization, use Intune, Microsoft Endpoint Configuration Manager, Group Policy, or third-party distribution software to distribute the installer to your target computers, and then run the installer on each computer.

### Managing Updates

The new Outlook for Windows app updates automatically, with new build updates shipping weekly. Ensure reliable delivery of updates by allowing access to the Microsoft 365 CDN on the `*.office.net` domain. For more information, see [Manage updates in new Outlook for Windows](https://learn.microsoft.com/en-us/deployoffice/manage-updates-new-outlook-windows).

### Service-Delivered Features

New features are released through rings through our service, starting with validation in internal rings before expanding into a production audience. External customers can receive features as part of a Targeted Release ring (for early previews) or Standard Release rings (most common). For more information, see [Set up the Standard or Targeted release options](https://learn.microsoft.com/en-us/microsoft-365/admin/manage/release-options-in-office-365).

### Migration FAQs

For more general FAQs, please see the Frequently Asked Questions document in the New Outlook for Windows Adoption Kit found at <https://aka.ms/newOutlookAdoption>.

### Availability & Deployment

Classic Outlook will be available until at least 2029. For more information, see <https://aka.ms/newOutlookTimeline>.

The toggle is now available to Semiannual channel users as of build 16731.20504 (out of July fork, as of January 2024).

The preview is now available in Current Channel, Monthly Enterprise Channel, and Semi-Annual Channel. The toggle to try the new Outlook (located in the top right of the window) will be available to users with supported accounts only. Exchange on-prem is currently unsupported. Admins can control visibility of the toggle via a registry value.

For more information on build numbers related to each of the upcoming releases, see <https://aka.ms/newOutlookTimeline>.

The new Outlook for Windows will do an update check upon each launch. If a new version is available, it will be automatically downloaded and installed.

Some of the admin controls available include:

- Prevent mailboxes from your organization from being added.
- Hide the toggle from the Classic Outlook for Windows app.
- Block personal accounts from being added if there is a primary organization account.
- Block new Outlook from being automatically installed on Windows upgrade to builds 23H2+.
- Require new Outlook for Windows runs with an organization account as the primary account on managed devices.
- Require users on classic Outlook for Windows to migrate to new Outlook for Windows.

The new Outlook for Windows will be deployed through the Classic Outlook for Windows in-app toggle and the Windows app store for end users. For admins, it will be deployed through Intune Configuration manager and scripts.

If you prefer to not have the new Outlook for Windows show up in your organization's devices, you could remove it after it has been installed as part of the update. Admins can do this by following the instructions to remove the app package using PowerShell and using the parameter: Microsoft.OutlookForWindows. The PowerShell cmdlet to use is:

    Remove-AppxProvisionedPackage -AllUsers -Online -PackageName (Get-AppxPackage Microsoft.OutlookForWindows).PackageFullName

For more information on how to manage the transition between classic and new Outlook, see [Run new Outlook and classic Outlook side by side](https://support.microsoft.com/office/run-new-outlook-and-classic-outlook-side-by-side-a624c36d-c50f-43bc-9c8b-dd17b5690ffb).