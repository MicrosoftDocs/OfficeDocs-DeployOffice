---
title: Performance recommendations for Microsoft 365 Apps on Windows 10
author: bgk-msft
ms.author: bkirschner
manager: dougeby
audience: ITPro 
ms.topic: conceptual 
ms.service: o365-proplus-itpro
ms.localizationpriority: medium
ms.collection: Tier3
description: "Provide guidance and recommendations to Office admins on how to improve the performance of Microsoft 365 Apps on Windows 10."
ms.date: 02/28/2024
---

# Performance recommendations for Microsoft 365 Apps on Windows 10

> [!NOTE]
> This article was written by Microsoft experts in the field who work with enterprise customers to deploy Microsoft 365 Apps.

When a Microsoft 365 user experiences poor performance using any of the core Office applications (such as Word, Excel, PowerPoint, and Outlook), it can have an impact on their productivity. It's Microsoft's goal that users have a positive experience with Microsoft apps and services. However, there are many factors that our customers can influence directly that can also impact the end-user experience. This article will help you understand these factors and provide recommendations that will allow you to take the appropriate steps necessary to provide your end users with successful performance on the Microsoft 365 platform.

> [!NOTE]
> Although this article was developed using Windows 10 data, most of the recommendations should also be applicable to Windows 11.

## General recommendations

### Network connectivity

The network connection between your end users and the Microsoft 365 services can be one of the most important components of performance.  Ultimately, a poorly performing network connection will likely result in a commensurately poor user experience. While a full network discussion is out of the scope of this article, we recommend that you review [Set up your network for Microsoft 365](/microsoft-365/enterprise/set-up-network-for-microsoft-365) for a deeper review of Microsoft’s network principles and general recommendations. The following items are some of most important recommendations that have the most direct impact on performance.

- **Size your network appropriately** Validate and test your internet bandwidth to determine download, upload, and latency constraints. For access tools and calculators, see [Network and migration planning for Office 365](/microsoft-365/enterprise/network-and-migration-planning).
- **Egress network connections locally** When your end users egress to the internet from your corporate network as close to their physical location as possible, this reduces latency and ensures that user connections are made to the nearest point of entry to Microsoft 365 services
- **Differentiate and optimize the most critical Microsoft 365 network traffic** Microsoft 365 traffic has been grouped into three categories to provide a priority-based pivot on where to focus your network optimizations. One of these categories (Optimize) represents a small set of endpoints (~10) that are required for connectivity to Microsoft 365 and are sensitive to network performance, latency, and availability. We recommend that these Optimize endpoints be given priority in your network configuration, for example, bypass or allowlist Optimize endpoints on network devices and services that perform traffic interception, SSL decryption, deep packet inspection and content filtering. For more information, see [Microsoft 365 network connectivity principles](/microsoft-365/enterprise/microsoft-365-network-connectivity-principles).

[Microsoft 365 Network Insights](/microsoft-365/enterprise/office-365-network-mac-perf-insights) is available in the Microsoft 365 admin center. Network insights give customers the ability to see their network performance and identify when the connection doesn't meet network recommendations from Microsoft. We highly recommend utilizing these capabilities to monitor and improve your network connectivity to Microsoft.

In addition, you can also use the [Microsoft 365 network connectivity test](https://connectivity.office.com/), which is a standalone tool that will give you a quick view into how well a specific device connects to Microsoft. For more information about the tool, see [Microsoft 365 network connectivity test tool](/Microsoft-365/Enterprise/office-365-network-mac-perf-onboarding-tool).

To run a test, you can do the following steps:

1. Go to https://connectivity.office.com/.
2. Select how you want the tool to determine your location. We recommend using the **Automatically Detect Location** option.
3. Optional but recommended: enter your tenant name and select the **Run Tests** button.
4. Review the **Results and impact** tab.
   - Is your egress location near your physical location?
   - Are you connecting to an Optimal Front Door location?
   - Is your relative performance better or worse than customers near you?
5. Review the **Details and solutions** tab.
   - Review and confirm any issues identified in Section 1.
   - Check **Connectivity Test results** in Section 2.
   - Follow **Recommended Actions** in Section 3.

For information about how to make sure your network is ready for Teams, see [Prepare your organization's network for Microsoft Teams](/microsoftteams/prepare-network).

### Browsers

The browser may be one of the primary ways that users access Microsoft 365, so it can have a significant impact on performance. Encourage your users to use the following best practices:

- Disable browser add-ons that might impact performance or that you don't really need.
- Increase the cache size for your temporary internet files.
- Once signed into your work or school account, keep the browser window open throughout the day. You can open other tabs and windows without signing in again. If you need to sign in to another account, use Private Browsing.
- Once each page is downloaded and open, keep them open by using tabs. It's easy to navigate between tabs and use the page later on in the day. Refresh a page only if you need the latest data on that page.
- If a page is taking too long to open, stop the page download (by pressing ESC) and then refresh the page (by pressing F5).
- When possible, reduce round trips to Microsoft 365. For example, rather than paging through lists or libraries in SharePoint, use search to locate files in a large library and filtering in a list to get directly to the results you want. Or, create views that minimize page load time. For more information, see [Manage large lists and libraries](https://support.microsoft.com/office/b8588dae-9387-48c2-9248-c24122f07c59).
- If video performance is poor, you may be able to download the video and watch it on your device. A download link may be available, or you may be able to right-click the video link, and select **Save Target as**.

### Antivirus and security software

Antivirus software and other security agents can have a negative impact on the performance of Office apps. While some level of impact is unavoidable as the software is doing its intended job, in many cases the use of these products can cause major unintended performance problems as the software interacts with other agents, Windows, and Office apps in unexpected ways. While there's no way to eliminate the impact of enterprise security agents, it's possible to mitigate the impact by following a few guidelines:

- Do an inventory of the security software and agents running in your environment and get rid of any that are no longer needed.
- Be sure that you're running the latest version of all required security software.
- Run the Office apps on a device without security agents running and compare performance while running the app on a device with the security agent running, using [performance testing guidance](#performance-testing-guidance). If there's a noticeable (more than a couple seconds) difference, work with the vendor of your security software to determine settings or exclusions that can be configured to mitigate the performance impact.

### Virtual desktops

If your company uses or plans to use Virtual Desktop Infrastructure (VDI)), your users may experience performance issues with various elements of Microsoft 365.  Managing a VDI environment is beyond the scope of this article, but there are many actions that you can take to help mitigate the effects of the VDI bottlenecks as your users work on the Microsoft 365 platform.

- Microsoft recommends using [Windows 365](https://www.microsoft.com/windows-365) or [Azure Virtual Desktop](https://azure.microsoft.com/services/virtual-desktop/) (formerly named Windows Virtual Desktop) for an optimized virtualized Windows and Office experience. Both of these options provide pre-configured images that you can deploy. These images already include the recommended performance optimizations listed below.
- Use [FSLogix](/fslogix/overview) Profile and Office Containers to improve performance in a non-persistent Windows computing environment. This technology can avoid repeated Windows Search reindexing and .OST file downloads that can otherwise cause major perf impacts in a VDI environment.
- Microsoft specifically recommends using Outlook in Cached Mode using Profile Containers as a key performance improvement.
- Stay current on Microsoft 365 Apps to get the latest VDI performance improvements.
- Implement the client-side policy “Set default search scope” to “0” to enable the default search behavior.
- Allocate dedicated memory and VRAM to avoid memory overcommitment.
- Disable personalization.
- Configure hosting server’s BIOS to “Maximum Performance.”
- Do proper capacity planning to ensure that your VDI infrastructure, including your network, can support your end users with acceptable performance.
- Test and monitor your environment to ensure that your performance benchmarks are being met.
- Follow the Microsoft Teams best practices covered in [Teams for Virtualized Desktop Infrastructure](/microsoftteams/teams-for-vdi).
- In a non-persistent VDI environment, we recommend using either the [OneDrive app](https://www.microsoft.com/microsoft-365/onedrive/download) (Windows 10 is required), or the [OneDrive web site](https://www.onedrive.com).

## Microsoft 365 recommendations

### Software updates

As Microsoft invests heavily to improve the performance of our products, it's important to stay up to date on our latest software to realize these benefits. In keeping with your deployment best practices, keep your end users on the latest supported versions of Windows 10 and Microsoft 365 Apps. For a list of supported versions, see the following articles:

- [Windows 10 release information](/windows/release-health/release-information)
- [Update history for Microsoft 365 Apps (listed by date)](/officeupdates/update-history-microsoft365-apps-by-date)

To learn more, see [Windows and Microsoft 365 Apps servicing in Microsoft 365](/training/modules/m365-modern-windows-office-servicing/).

Also, review the deployment guidance available for Windows 10 and Microsoft 365 Apps:

- [Windows client deployment resources and documentation](/windows/deployment/)
- [Deployment guide for Microsoft 365 Apps](/DeployOffice/deployment-guide-microsoft-365-apps)

### Office Add-ins

Add-ins are one of the most common causes of poor app performance, especially at larger organizations. While Add-ins can be useful to give your employees special functionality, over time Add-ins tend to proliferate and accumulate, ultimately reaching a point where they can have a major impact on performance. It's possible to mitigate this impact by following a few guidelines:

- Do an [inventory of the Add-ins](../admincenter/inventory.md#add-ins-insight) used in your environment and get rid of any that are no longer needed.
- Be sure that you're using the most recent version of the Add-in. If you need to install updates, use the [performance testing guidance](#performance-testing-guidance) to test the change.
- You can test specific add-ins by running the Office application in Safe Mode, disabling all Add-ins, and using the [performance testing guidance](#performance-testing-guidance) to establish your baseline. Then, you can enable Add-ins one at a time and record any significant performance impacts.
- If there's a noticeable (more than a couple seconds) difference and you're running the latest version, consider working with the developer to improve the Add-in or removing it from your environment. For more information, see [Best practices for developing Office Add-ins](/office/dev/add-ins/concepts/add-in-development-best-practices).

### 64-bit Office

If your users create large or complex files in Office, they may see performance improvements using the 64-bit version of Microsoft 365 Apps. 64-bit Office can access more available memory and can make a noticeable difference with large Excel spreadsheets or complex PowerPoint decks. To help you determine if you can use 64-bit Office in your environment, see [Choose between the 64-bit or 32-bit version of Office](https://support.microsoft.com/office/2dee7807-8f95-4d0c-b5fe-6c6f49b8d261).

### System requirements

While the [Microsoft 365 minimum hardware specs](https://www.microsoft.com/microsoft-365/microsoft-365-and-office-resources) are expected to provide an acceptable user experience, it's not uncommon for performance to be negatively impacted if there are other services or applications also running on the device, or if device drivers are out of date. Providing your end users with devices that are powerful enough to support all the demands that they regularly place on their devices will result in better productivity and a better user experience. There's no single device profile that is best for every user or for every company. However, based on our experience working with many large customers, we have observed the following performance behaviors:

- Solid State Drives (SSD) are twice as fast as traditional spinning disks when launching Office applications.
- 8 GB of RAM is twice as fast when launching Office applications compared to devices using 4 GB of RAM.
- CPUs with 4 physical cores results in a 30% reduction in boot times when launching Office applications compared to CPUs with 2 cores.

These observations are specific to launch times, but in general we have seen that the use of SSDs, 8 GB of RAM, and CPUs with 4 physical cores can provide a better performance experience for the user.

> [!NOTE]
> A major caveat is that while our observations are focused individual components, in reality there are multiple hardware variables that are often correlated, and you may see a different performance impact by changing them.

### End-user actions

Many common Office app performance complaints can be solved or mitigated by the end-users themselves by following some common sense (and some not-so-common sense) guidelines. Educate your users with the following information.

Review [Tips to improve PC performance in Windows](https://support.microsoft.com/windows/b3b3ef5b-5953-fb6a-2528-4bbed82fba96).

For Word:

- Disable or remove unneeded Add-ins
- Disable autocorrect
- Disable Screen Tips

For Excel:

- Review [Tips for improving Excel's performance](https://support.microsoft.com/office/a8294ac5-652d-47f2-8e89-1c3ce2c09439)
- Improve the efficiency of your calculations. For more information, see [Excel performance: Improving calculation performance](/office/vba/excel/concepts/excel-performance/excel-improving-calculation-performance).
- Keep data and lookups on the same sheet
- SORT your data before using Lookup functions
- Use tables and structured table references
- Remove redundant cells with formatting that appears to be blank. For more information, see [Locate and reset the last cell on a worksheet](https://support.microsoft.com/office/c9e468a8-0fc3-4f69-8038-b3c1d86e99e9).

For PowerPoint:

- Review [Tips for improving the performance of your presentation](https://support.microsoft.com/office/34c82835-5f23-4bf0-98cc-72235bbd2949)
- Change resolution to improve speed
- Make sure hardware graphics acceleration isn't disabled
- Compress media files
- Reduce the number of transitions and complex animation
- Don’t use large gradients or transparent objects

For Outlook:

- Review [How to troubleshoot performance issues in Outlook](https://support.microsoft.com/topic/7ac5402d-c4eb-ed6b-9545-b26dde618755)
- Use the new shared calendar method. For more information, see [Calendar sharing in Microsoft 365](https://support.microsoft.com/office/b576ecc3-0945-4d75-85f1-5efafb8a37b4).
- Disable or remove unneeded Add-ins
- Download and use the [Outlook Advanced Diagnostics tool](https://aka.ms/SaRA-OutlookAdvDiagnostics)
- Don't keep more than 100,000 items in a single folder
- Use Outlook in cached mode
- Disable “Download Shared Folders” in your Exchange profile if accessing a mailbox with more than 5,000 folders and experiencing performance issues. Otherwise, leave this setting enabled.

## Performance testing guidance

It's a good idea to test the performance impact of any significant change to your environment, such as network changes, hardware updates, and new or updated software (such as antivirus agents, add-ins, etc.) before introducing them into your production environment. If the new software will result in an unacceptable level of performance degradation, don't roll it out until the problem has been addressed. There are many ways to measure the performance impact of a change, and we recommend using the Microsoft Office Performance Assessment tool within the Windows Assessment Console. The Windows Assessment Console is available for download as part of the [Windows Assessment and Deployment Kit (ADK)](/windows-hardware/get-started/adk-install). Another option is to use the “stopwatch” method, where you start a stopwatch when you begin an activity and stop it once the activity has completed.

To test the performance impact of a change, first establish a performance baseline by performing common activities on a set of devices that don't have the change implemented. Common activity examples include launching the application, opening a file, or saving a file. After you have established your baseline, perform those same activities on a set of devices where the change has been implemented and use the same measurement methodology you used to establish your baseline. If the change resulted in a performance impact that is unacceptable for your users, then you should work to resolve these issues before implementing the change across your environment.

Here are some measurements that could be concerning:

- Launching Outlook takes longer than 20 seconds.
- Launching Word, Excel, or PowerPoint takes longer than 10 seconds.
- Opening or saving a local file (up to about 50 MB) in Word, Excel, or PowerPoint takes longer than 10 seconds.
