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
recommendations: true
description: "Migration planning guide for new Outlook"
ms.custom: QuickDraft  
ai-usage: ai-assisted
ms.date: 07/29/2024
---

# New Outlook for Windows migration plan

**Customer Intent for this Article:** To provide IT administrators with a comprehensive guide to plan and execute the migration from classic Outlook to new Outlook for Windows.

## Plan your migration

### Planning a Successful Migration

Detailed planning is critical when upgrading a critical software application. Outlining a robust plan helps mitigate risks, allocate resources accordingly, minimize downtime, and ensure the productivity of your team is minimally affected.

### Migration Project Checklist

Use the available checklist to ensure you complete all key activities in preparation for your upgrade to new Outlook. The checklist includes tasks like building your team, defining your project scope, preparing your environment, and conducting a pilot. Access the checklist in the [New Outlook for Windows Migration Kit](https://aka.ms/newOutlookAdoption).

### Build Your Project Team

Any successful project begins by bringing the right team together. Your project stakeholders should include representatives across your organization who have accountability for project success. There are two types of stakeholders:

- **A sponsorship coalition** inclusive of executive and business sponsors, and anyone with a key role in the project success.
- **The project team** consisting of technical and user readiness members responsible for completing the various tasks associated with the project plan.

All roles might not apply to your project, or you might include others that aren't listed. Adjust roles as appropriate. Access a table of roles, responsibilities, and names in the [New Outlook for Windows Migration Kit](https://aka.ms/newOutlookAdoption).

### Define Your Project Scope

Taking the time to define your project scope and goals help ensure everyone on your project team is aligned and working toward the same end results. Use this definition throughout your project to ensure you're on track for your desired end-state. Use the goals section to measure against your outcomes and mitigate as needed.

1. **Outline the scope for this project.** The scope defines the current focus of your project.
1. **Establish your project timeline.** Define the timeline for your Outlook upgrade journey, including placeholders for an adequate pilot (minimum 45 days) and a phased upgrade. 
1. **Define the goals for this project.** Your goals define the outcome you want and enable you to measure the success of the project. 
1. **Identify your baseline.** Your baseline visualizes your current state to track progress. Access a sample project timeline, baseline table, and other resources in the [New Outlook for Windows Migration Kit](https://aka.ms/newOutlookAdoption).
1. **Define your risk and mitigation plan.** Proactively assess potential risks and define a mitigation strategy for overcoming issues that might arise. A risk register is an excellent tool for tracking risks and their potential impact while capturing your mitigation plan. Access a sample risk and mitigation plan table in the [New Outlook for Windows Migration Kit](https://aka.ms/newOutlookAdoption).
1. **Outline your upgrade approach** Your organization might decide to move everyone to new Outlook at once or allow users the option to use classic Outlook and new Outlook together for a while. Articulate your plan here, then validate as part of your pilot. After your pilot, reassess this plan and make any adjustments based on learnings from the pilot program.

### Review Path Options

Microsoft offers flexibility in how you get to new Outlook. The two primary paths are:

- Path 1: Allow classic Outlook and new Outlook to coexist.
- Path 2: Move all users to new Outlook.

Consider feature requirements and overlap, experience considerations, and the velocity of moving users over. Access a sample table to track these in the [New Outlook for Windows Migration Kit](https://aka.ms/newOutlookAdoption).

Things to consider:

- **Feature requirements and overlap:** There are differences in feature availability between versions. Review as part of your pilot which features are available at the time of your upgrade. A growing feature comparison listing can be found in the [New and Classic feature comparison table](https://aka.ms/newOutlookFeatureComparison).
- **Experience consideration:** Mails, calendar, contacts. What features are available for users? Upcoming? No longer supported? Having a clear understanding of these items can help assess the path to take. A growing feature comparison listing can be found in the [New and Classic feature comparison table](https://aka.ms/newOutlookFeatureComparison).
- **Velocity of moving users over:** Every organization is different, and requires different choices based on the best experience for their users.  
  - **Quick velocity:** All users have the same capability and experience which simplifies adoption.
  - **Slower velocity:** Large organizations might move slower due to more complex requirements  
- **Cohorts:** Increased success when users adopt all key scenarios.  

### Prepare Your Organization

To realize maximum value from new Outlook, users must actually use it. Design the right readiness plan to help accelerate adoption and facilitate the transition from classic Outlook to new Outlook. Identify your user readiness channels across awareness, training, and support options. Access a table identifying resources for each of these channels in the [New Outlook for Windows Migration Kit](https://aka.ms/newOutlookAdoption).

### Conduct an Upgrade Pilot

Think of a pilot as a "test drive" of your upgrade strategy to validate readiness and prepare for the next steps on your upgrade journey. Use the pilot to validate functional readiness, identify peer champions, and hone messaging to support expanded adoption. Access template emails, surveys, and a test plan in the [New Outlook for Windows Migration Kit](https://aka.ms/newOutlookAdoption).

### Drive Operational Excellence

Upgrade success doesn't end when your deployment is complete. Include a plan to support ongoing change and ensure you have a plan to implement new changes as they come online. Execute an agile change management approach to facilitate new features and solutions while minimizing user disruption. Access a set of helpful resources in the [New Outlook resource listing](https://aka.ms/newOutlookResources).

## Implement your migration

### Compatibility requirements

New Outlook for Windows requires a minimum OS version Windows 10 Version 1809 (Build 17763) and an internet connection.

### Obtain the new Outlook for Windows

- **For end users:** New Outlook is available through the classic Outlook in-app toggle and the Windows app store.

- **With Windows:** New PCs include the new Outlook for Windows by default, replacing the native Mail and Calendar apps (2024).

### Toggle In / Out

You can switch to the new Outlook application by using the toggle found in the Outlook for Windows app. This closes out your Outlook for Windows client and opens new Outlook for Windows.

### Download from the Windows Store

You can also download it from the Windows Store. See more: [Deployment overview for the new Outlook for Windows](/micorosft-365-apps/outlook/get-started/deployment-new-outlook).

### Manage settings

Adjusting your new Outlook for Windows settings also results in changes to your Outlook on the web settings.

### Set a central distribution location

To install the new Outlook on a single computer with many users, follow these steps:

1. Download the Setup.exe.
2. Open PowerShell 7 in administrator mode (from **Start**, right-click the PowerShell, and select **Run as Administrator**).
3. Navigate to where the Setup.exe file is located.
4. Run the following command: `.\Setup.exe --provision true --quiet --start-`

To deploy this installer to a group of computers or your entire organization, use Intune, Microsoft Endpoint Configuration Manager, Group Policy, or a non-Microsoft distribution software to distribute the installer to your target computers, and then run the installer on each computer.

### Manage updates

The new Outlook for Windows app updates automatically, with new build updates shipping weekly. Ensure reliable delivery of updates by allowing access to the Microsoft 365 CDN on the `*.office.net` domain. For more information, see [Manage updates in new Outlook for Windows](/micorosft-365-apps/outlook/manage/manage-updates-new-outlook-windows).

### Service-delivered features

New features are released through rings through our service, starting with validation in internal rings before expanding into a production audience. External customers can receive features as part of a Targeted Release ring (for early previews) or Standard Release rings (most common). For more information, see [Set up the Standard or Targeted release options](/microsoft-365/admin/manage/release-options-in-office-365).

### More de3tails

For more general FAQs, see the Frequently Asked Questions document in the [New Outlook for Windows Adoption Kit](https://aka.ms/newOutlookAdoption).

### Availability & Deployment

Classic Outlook is available until at least 2029. For more information, see the [Progressive stages of migration to new Outlook](/micorosft-365-apps/outlook/get-started/guide-product-availability).

The toggle is now available to Semiannual channel users as of build 16731.20504 (out of July fork, as of January 2024).

The preview is now available in Current Channel, Monthly Enterprise Channel, and Semi-Annual Channel. The toggle to try the new Outlook (located in the top right of the window) is available to users with supported accounts only. Exchange on-prem is currently unsupported. Admins can control visibility of the toggle via a registry value.

For more information on build numbers related to each of the upcoming releases, see the [Progressive stages of migration to new Outlook](/micorosft-365-apps/outlook/get-started/guide-product-availability).

The new Outlook for Windows does an update check upon each launch. If a new version is available, it's automatically downloaded and installed.

Some of the admin controls available include:

- Prevent mailboxes from your organization from being added.
- Hide the toggle from the Classic Outlook for Windows app.
- Block personal accounts from being added if there's a primary organization account.
- Block new Outlook from being automatically installed on Windows upgrade to builds 23H2+.
- Require new Outlook for Windows runs with an organization account as the primary account on managed devices.
- Require users on classic Outlook for Windows to migrate to new Outlook for Windows.

The new Outlook for Windows can be deployed through the classic Outlook for Windows in-app toggle and the Windows app store for end users. Admins can deploy through Intune Configuration manager and scripts.

If you prefer to not have the new Outlook for Windows show up in your organization's devices, you can remove it after installing as part of the update. Admins can do this by following the instructions to remove the app package using PowerShell and using the parameter: Microsoft.OutlookForWindows. The PowerShell cmdlet to use is:

```powershell
Remove-AppxProvisionedPackage -AllUsers -Online -PackageName (Get-AppxPackage Microsoft.OutlookForWindows).PackageFullName
```

For more information on how to manage the transition between classic and new Outlook, see [Run new Outlook and classic Outlook side by side](https://support.microsoft.com/office/run-new-outlook-and-classic-outlook-side-by-side-a624c36d-c50f-43bc-9c8b-dd17b5690ffb).