---
title: "What's new in Office deployment for IT Pros"
ms.author: danbrown
author: DHB-MSFT
manager: dougeby
audience: ITPro
ms.topic: article
ms.service: o365-administration
ms.localizationpriority: medium
ms.collection: 
- Ent_O365
- m365initiative-coredeploy
ms.custom: Ent_Office_ProPlus
recommendations: false
description: "This article lists the new tools, content, and processes for IT Pros deploying Office."
---

# What's new in Office deployment for IT Pros

This article lists new features, tools, and articles for IT Pros who deploy Office in the enterprise. For details on Office announcements and plans, see the [Microsoft 365 roadmap](https://www.microsoft.com/microsoft-365/roadmap).

## November 2021

### Retirement of Security Policy Advisor

We're retiring Security Policy Advisor in the Microsoft 365 Apps admin center beginning on November 8, 2021. Security Policy Advisor is no longer available to accept new tenants to manage Office cloud security policies. Also, Security Policy Advisor will be disabled for all tenants who haven't previously deployed a policy with Security Policy Advisor.

If you're already using Security Policy Advisor, we recommend migrating your security policies to the Office cloud policy service to avoid any interruption in managing them. For more information, see [Manually migrate security policies from Security Policy Advisor to the Office cloud policy service](migrate-security-policies-from-spa-to-ocps).

## October 2021

### Windows and Office configuration support matrix (updated)

Are you wondering which versions of Office are supported on Windows 11? Or how long Microsoft 365 Apps will be supported on Windows 10?

You can download and print the recently updated [Windows and Office configuration support matrix](https://go.microsoft.com/fwlink/p/?linkid=2111390) to use as a reference.

### Performance recommendations for Microsoft 365 Apps on Windows 10

When a Microsoft 365 user experiences poor performance using any of the core Office applications (such as Word, Excel, PowerPoint, and Outlook), it can have an impact on their productivity. There are many factors that customers can influence directly that can also impact the end-user experience.

We've published a new "best practices from the field" article that will help you understand these factors and provide recommendations that will allow you to take the appropriate steps necessary to provide your end users with successful performance on the Microsoft 365 platform.

For more information, see [Performance recommendations for Microsoft 365 Apps on Windows 10](fieldnotes/performance-recommendations.md).

## September 2021

### Office LTSC 2021

Office LTSC 2021 is generally available to volume licensed customers as of September 16, 2021. If you've deployed Microsoft 365 Apps to users in your organization, you don't need Office LTSC 2021. You already have all the features that are included in Office LTSC 2021, along with many more features that aren't in Office LTSC 2021. 

For more information, see [Overview of Office LTSC 2021](ltsc2021/overview.md) and [Office LTSC is now generally available](https://www.microsoft.com/microsoft-365/blog/2021/09/16/office-ltsc-is-now-generally-available/).

## April 2021

Microsoft has announced the final release of the recommended security configuration baseline settings for Version 2104 of Microsoft 365 Apps for enterprise. For more information, see this [blog post](https://techcommunity.microsoft.com/t5/microsoft-security-baselines/security-baseline-for-microsoft-365-apps-for-enterprise-v2104/ba-p/2307695).

## March 2021

Microsoft 365 Apps is starting to provide new or improved features that rely on Microsoft Edge WebView2. WebView2 requires that Microsoft Edge WebView2 Runtime be installed on the device running Office. Therefore, WebView2 Runtime will be installed on devices running Windows and that have Version 2101 or later of Microsoft 365 Apps installed. For more information, see [Microsoft Edge WebView2 and Microsoft 365 Apps](webview2-install.md).

## February 2021

[Extended offline access](overview-extended-offline-access.md) enables devices running Microsoft 365 Apps for enterprise to stay activated for up to six months without the need to connect to the internet to validate the license and install updates. Extended offline access is not available as a license for all customers. To find out about eligibility for your organization, contact your Microsoft account representative.

## January 2021

[Overview of the unattended robotic process automation with Microsoft 365 Apps for enterprise](overview-unattended.md) covers how to enable RPA for Microsoft 365 Apps, including licensing requirements.

## November 2020

[Learn from Microsoft experts](fieldnotes/roadmap-to-modern-management.md) how they've been working with customers to implement the new admin capabilities for monitoring, managing, and updating the installation of Microsoft 365 Apps.

## October 2020

The [Microsoft 365 Apps admin center](https://config.office.com/) provides modern management in the cloud for admins who deploy and manage Microsoft 365 Apps in the enterprise. For a list of features and services available in the admin center, including newly released and announced features, see [Overview of the Microsoft 365 Apps admin center](admincenter/overview.md).

## July 2020

### End of support resources

We've published the following new articles to provide information about end of support events related to Office.

- [End of support resources for Office](endofsupport/resources.md)
- [Office versions and connectivity to Office 365 services](endofsupport/office-365-services-connectivity.md)
- [Windows Server end of support and Microsoft 365 Apps](endofsupport/windows-server-support.md)
- [Windows 8 end of support and Microsoft 365 Apps](endofsupport/windows-8-support.md)

You can download and print the [Office configuration support matrix](https://go.microsoft.com/fwlink/p/?linkid=2111390) to use as a reference.

To discuss or learn more about end of support for Office versions, visit [Microsoft Office End of Support](https://techcommunity.microsoft.com/t5/microsoft-office-end-of-support/ct-p/OfficeEOS) on the Microsoft Tech Community.

## June 2020

### Update channels for Microsoft 365 Apps renamed
The names of the update channels for Microsoft 365 Apps have changed. For example, Monthly Channel is now named Current Channel and Semi-Annual Channel is now named Semi-Annual Enterprise Channel. To learn more, including what actions you might need to take, see [Changes to update channels for Microsoft 365 Apps](update-channels-changes.md).

## May 2020

### Introduction of Monthly Enterprise Channel
A new update channel for Microsoft 365 Apps is now available: Monthly Enterprise Channel. This update channel provides new Office features once a month, on the second Tuesday of the month. These once-a-month updates will also include, as needed, security updates and non-security updates. 

You can deploy Monthly Enterprise Channel just like you would any other update channel. For example, by using the Office Deployment Tool, Group Policy, or Microsoft Endpoint Configuration Manager.

For more information, see [Overview of update channels for Microsoft 365 Apps](overview-update-channels.md).

## April 2020

### Office 365 ProPlus renamed
Office 365 ProPlus has been renamed to **Microsoft 365 Apps for enterprise**, starting with Version 2004. To learn more, including what actions you might need to take, see [Name change for Office 365 ProPlus](name-change.md). In our documentation, we'll usually just refer to it as Microsoft 365 Apps.

### Best practices articles
We've published two new best practice articles from the field:[Choose how to install Microsoft 365 Apps](fieldnotes/install-options.md) and [Choose how to deliver updates for Microsoft 365 Apps](fieldnotes/choose-how-to-deliver-updates.md).

### Viewer mode
Viewer mode allows unlicensed users of Microsoft 365 Apps to view and print Office files without being prompted to activate Office. To use viewer mode, you must have version 1902 of Microsoft 365 Apps or later. To enable viewer mode, your organization must have an Office 365 or Microsoft 365 license subscription. For more information, see [Overview of viewer mode](overview-viewer-mode.md).

## March 2020

We're starting to publish best practice articles from Microsoft experts in the field who work with enterprise customers to deploy Office. The first article is now live: [Build dynamic, lean, universal packages for Microsoft 365 Apps for enterprise](fieldnotes/build-dynamic-lean-universal-packages.md).

## November 2019

After deploying Microsoft 365 Apps, you can change the update channel for a device by using Group Policy or the Office Deployment Tool (ODT). For example, you can move a device from Semi-Annual Enterprise Channel to Monthly Enterprise Channel. We've published a new article that covers how to change the update channel. For more information, see [Change the Microsoft 365 Apps update channel for devices in your organization](change-update-channels.md).

## October 2019

### Privacy controls for Office on iOS devices

Starting with Version 2.30 of the Office apps for iOS, there are new preference settings that allow you to control settings related to diagnostic data and connected experiences. For more information, see [Use preferences to manage privacy controls for Office on iOS devices](privacy/ios-privacy-preferences.md).

## September 2019

### Windows 7 end of support and Microsoft 365 Apps
***Support for Windows 7 ended on January 14, 2020.*** Using Microsoft 365 Apps on older, unsupported operating systems may cause performance and reliability issues over time. Therefore, if your organization is using Microsoft 365 Apps on devices running Windows 7, we strongly recommend your organization moves those devices to [Windows 10](https://www.microsoft.com/microsoft-365/windows/end-of-windows-7-support?rtc=1#office-ContentAreaHeadingTemplate-s9f0ou1).

Even though Windows 7 is longer supported, we've decided to continue to provide you with security updates for Microsoft 365 Apps for the next three years, until January 2023. For more information, see [Windows 7 end of support and Microsoft 365 Apps](endofsupport/windows-7-support.md).

### Delivery Optimization and Microsoft 365 Apps
Delivery Optimization is a peer-to-peer distribution technology available in Windows 10 that allows devices to share content, such as updates, that the devices have downloaded from Microsoft over the internet. Delivery Optimization can help reduce network bandwidth because a device can get portions of the update from another device on its local network instead of having to download the update completely from Microsoft.

Microsoft 365 Apps on devices running Windows 10 can take advantage of Delivery Optimization during installation and when receiving updates, if certain requirements are met. For more information, see [Delivery Optimization and Microsoft 365 Apps](delivery-optimization.md).

### Security baseline for Microsoft 365 Apps
Microsoft has announced the final release of the recommended security configuration baseline settings for Microsoft 365 Apps, version 1908. For more information, see this [blog post](https://techcommunity.microsoft.com/t5/Microsoft-Security-Baselines/Security-baseline-for-Office-365-ProPlus-v1908-Sept-2019-FINAL/ba-p/873084).

## August 2019

### Privacy controls for Office for Mac
Starting with Version 16.28 of Office for Mac, there are new preference settings that allow you to control settings related to diagnostic data and connected experiences. For more information, see [Use preferences to manage privacy controls for Office for Mac](privacy/mac-privacy-preferences.md).

## July 2019

### Microsoft Teams and existing installations of Microsoft 365 Apps
Microsoft Teams will be added to ***existing*** installations of Microsoft 365 Apps, starting with Version 1906 in Current Channel. For more information, see [Deploy Microsoft Teams with Microsoft 365 Apps](teams-install.md).

### Create and manage your deployment configurations in the cloud
You can now use the [Office Customization Tool](https://config.office.com/) to create, save, and manage your deployment configurations in the cloud. When you run the Office Deployment Tool, you can reference these configurations directly. For more information, see [Overview of the Office Customization Tool](admincenter/overview-office-customization-tool.md).

### Security baseline for Microsoft 365 Apps
Microsoft has announced the *draft* release of the recommended security configuration baseline settings for Microsoft 365 Apps, version 1907. For more information, see this [blog post](https://techcommunity.microsoft.com/t5/Microsoft-Security-Baselines/Security-baseline-for-Office-365-ProPlus-v1907-July-2019-DRAFT/ba-p/771308).

### Set a deadline for updates from Microsoft AutoUpdate (MAU)
Starting with version 4.13 of Microsoft AutoUpdate (MAU), you can set a deadline for when updates are required to be installed on a user's device. For more information, see [Set a deadline for updates from Microsoft AutoUpdate](mac/mau-deadline.md).

## June 2019

### Comparison of application compatibility and readiness assessments tools
Are you trying to figure out whether to use the Readiness Toolkit, readiness features in Configuration Manager (current branch), or Office Telemetry Dashboard? For recommendations, see [Overview of application compatibility and readiness assessment tools for Microsoft 365 Apps](readiness-tools.md).

## April 2019

### Use the MigrateArch attribute to change Microsoft 365 Apps from 32-bit to 64-bit
It's now easier to change an existing installation of Microsoft 365 Apps from 32-bit to 64-bit. You can use the MigrateArch attribute in a configuration.xml file along with the Office Deployment Tool. The migration process will preserve existing products, languages, and other deployment settings.

For more information, see [Change a Microsoft 365 Apps installation from 32-bit to 64-bit](change-bitness.md).

### General availability of Office cloud policy service
The Office cloud policy service is now generally available.  It's a cloud-based service that enables you to enforce policy preferences for Microsoft 365 Apps on a user's device, even if the device isn't domain joined or otherwise managed. The policy preferences roam to whichever device the user signs into and uses Microsoft 365 Apps.

For more information, see [Overview of the Office cloud policy service for Microsoft 365 Apps for enterprise](admincenter/overview-office-cloud-policy-service.md).

### Privacy controls for Microsoft 365 Apps
Microsoft is committed to providing you with the information and controls you need to make choices about how your data is collected and used when you're using Microsoft 365 Apps.

Starting with Version 1904, there are new, updated, and improved privacy controls for diagnostic data and connected experiences. For more information, see [Overview of privacy controls for Microsoft 365 Apps](privacy/overview-privacy-controls.md).


### Use SQL Server with the Readiness Toolkit
The Readiness Toolkit now supports storing report results in a SQL Server database. If you use SQL Server, you also get a Power BI report, instead of an Excel workbook. For more information, see [Use SQL Server to store report results](readiness-toolkit-application-compatibility-microsoft-365-apps.md#use-sql-server-to-store-report-results).

## March 2019
Language deployment for Microsoft 365 Apps continues to improve. For best practices on using the Office Content Delivery Network (CDN) as a backup, matching languages to your operating system or existing installation of Office, and deploying only language packs or proofing tools, see [Overview of deploying languages for Microsoft 365 Apps](overview-deploying-languages-microsoft-365-apps.md).

## February 2019
Microsoft Teams will be installed for ***new*** installations of Microsoft 365 Apps, starting with Version 1902 in Current Channel. For more information, see [Deploy Microsoft Teams with Microsoft 365 Apps](teams-install.md).

## January 2019

### Public preview of Office cloud policy service
A public preview is now available for the Office cloud policy service, which is a cloud-based service that enables you to enforce policy preferences for Microsoft 365 Apps on a user's device, even if the device isn't domain joined or otherwise managed. The policy preferences roam to whichever device the user signs into and uses Microsoft 365 Apps.

For more information, see the following resources:
 - [Announcing the new cloud-based policy management service for Office 365 ProPlus](https://techcommunity.microsoft.com/t5/Office-365-Blog/Announcing-the-new-cloud-based-policy-management-service-for/ba-p/310405)
 - [Overview of the Office cloud policy service](admincenter/overview-office-cloud-policy-service.md)

### Office for Mac available in the Mac App Store
Office apps, such as Word and Outlook, are now available from the Mac App Store. Most require an Office 365 (or Microsoft 365) subscription to activate. You can use a supported enterprise mobility management (EMM) tool to deploy these apps to your users. For more information, see [Deploy Office for Mac from the Mac App Store](mac/deploy-mac-app-store.md).

## October 2018

The [Office Customization Tool](https://config.office.com/) is now generally available. The OCT makes it easy to customize your deployment of Microsoft 365 Apps and other Click-to-Run Office products. Instead of building the configuration files in a text editor, you can now use a web-based interface. Go directly to the [tool](https://config.office.com/) or read more about it here: [Overview of the Office Customization Tool](admincenter/overview-office-customization-tool.md).

When installing language packs, you can save network bandwidth by installing only proofing tools. For more information, see [Deploy proofing tools](overview-deploying-languages-microsoft-365-apps.md#deploy-proofing-tools) and [Languages, culture codes, and companion proofing languages](overview-deploying-languages-microsoft-365-apps.md#languages-culture-codes-and-companion-proofing-languages).

For best practices on deploying Microsoft 365 Apps with Configuration Manager, see [our new article](deploy-microsoft-365-apps-configuration-manager.md).

## September 2018

Office 2019 is the latest version of Microsoft's productivity software that's available as a one-time purchase from a retail store or through a volume licensing agreement. Office 2019 is separate from Office that's available through Office 365 (or Microsoft 365) plans. For example, if you've deployed Microsoft 365 Apps to the users in your organization, you don't need Office 2019. You already have all the features, and many more, that are included in Office 2019. For more information, see [Overview of Office 2019](office2019/overview.md) and [Deploy Office 2019](office2019/deploy.md).

## August 2018

Version 1.2 of the Readiness Toolkit was released, with new functionality to conceal folder and file name info collected in the scan and the ability to capture add-in usage info. For more information, see [Use the Readiness Toolkit to assess application compatibility for Microsoft 365 Apps](readiness-toolkit-application-compatibility-microsoft-365-apps.md).

## July 2018

You can now  use the Office Deployment Tool to apply application preferences to Microsoft 365 Apps as part of an initial deployment or as an update to existing installations of Office. For more information, see [Apply application preferences to Microsoft 365 Apps](overview-office-deployment-tool.md#apply-application-preferences-to-microsoft-365-apps).

## June 2018

To help you uninstall versions of Office that use Windows Installer (MSI) as the installation technology, you can now use the Office Deployment Tool and specify the RemoveMSI element in your configuration.xml file. For more information, see [Remove existing MSI versions of Office when upgrading to Microsoft 365 Apps](upgrade-from-msi-version.md).

For best practices for planning your deployment of Microsoft 365 Apps, see [Assess your environment and requirements for deploying Microsoft 365 Apps](assess-microsoft-365-apps.md) and [Plan your enterprise deployment of Microsoft 365 Apps](plan-microsoft-365-apps.md).