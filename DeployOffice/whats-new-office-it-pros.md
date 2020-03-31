---
title: "What's new in Office deployment for IT Pros"
ms.author: jwhit
author: jwhit-MSFT
manager: laurawi
audience: ITPro
ms.topic: get-started-article
ms.service: o365-administration
localization_priority: Normal
ms.collection: Ent_O365
ms.custom: 
 - Ent_Office_ProPlus
 - seo-marvel-mar2020
description: This article describes the new tools, content, and processes for IT Pros deploying Office in an enterprise environment.
---

# What's new in Office deployment for IT Pros

This article lists new features, tools, and articles for IT Pros who deploy Office in the enterprise. For a list of Office deployment articles that have been changed over the last several weeks, see [Content updates](deploy-office-content-updates.md). For details on Office announcements and plans, see the [Microsoft 365 Roadmap](https://products.office.com/business/office-365-roadmap).


## March 2020

We're starting to publish best practice articles from Microsoft experts in the field who work with enterprise customers to deploy Office. The first article is now live: [Build dynamic, lean, universal packages for Office 365 ProPlus](fieldnotes/build-dynamic-lean-universal-packages.md).

## November 2019

After deploying Office 365 ProPlus, you can change the update channel for a device by using Group Policy or the Office Deployment Tool (ODT). For example, you can move a device from Semi-Annual Channel to Semi-Annual Channel (Targeted). We've published a new article that covers how to change the update channel. For more information, see [Change the Office 365 ProPlus update channel for devices in your organization](change-update-channels.md).

## October 2019

### Privacy controls for Office on iOS devices

Starting with Version 2.30 of the Office apps for iOS, there are new preference settings that allow you to control settings related to diagnostic data and connected experiences. For more information, see [Use preferences to manage privacy controls for Office on iOS devices](privacy/ios-privacy-preferences.md).

## September 2019

### General availability of Security Policy Advisor
Security Policy Advisor is now generally available. You can use Security Policy Advisor to receive and implement security policy recommendations that are based on Microsoft best practices and information about your existing environment. Security Policy Advisor can only be used in combination with the Office cloud policy service.

For more information, see this [blog post](https://techcommunity.microsoft.com/t5/Security-Privacy-and-Compliance/Security-Policy-Advisor-for-Office-365-ProPlus-is-now-Generally/ba-p/835778) and [Overview of Security Policy Advisor for Office 365 ProPlus](overview-of-security-policy-advisor.md).

### Windows 7 end of support and Office 365 ProPlus
***Support for Windows 7 ended on January 14, 2020.*** Using Office 365 ProPlus on older, unsupported operating systems may cause performance and reliability issues over time. Therefore, if your organization is using Office 365 ProPlus on devices running Windows 7, we strongly recommend your organization move those devices to [Windows 10](https://www.microsoft.com/microsoft-365/windows/end-of-windows-7-support?rtc=1#office-ContentAreaHeadingTemplate-s9f0ou1).

Even though Windows 7 is longer supported, we've decided to continue to provide you with security updates for Office 365 ProPlus for the next 3 years, until January 2023. For more information, see [Windows 7 end of support and Office 365 ProPlus](windows-7-support.md).

### Delivery Optimization and Office 365 ProPlus
Delivery Optimization is a peer-to-peer distribution technology available in Windows 10 that allows devices to share content, such as updates, that the devices have downloaded from Microsoft over the internet. This can help reduce network bandwidth because a device can get portions of the update from another device on its local network instead of having to download the update completely from Microsoft. 

Office 365 ProPlus on devices running Windows 10 can take advantage of Delivery Optimization during installation and when receiving updates, if certain requirements are met. For more information, see [Delivery Optimization and Office 365 ProPlus](delivery-optimization.md).

### Security baseline for Office 365 ProPlus
Microsoft has announced the final release of the recommended security configuration baseline settings for Office 365 ProPlus, version 1908. For more information, see this [blog post](https://techcommunity.microsoft.com/t5/Microsoft-Security-Baselines/Security-baseline-for-Office-365-ProPlus-v1908-Sept-2019-FINAL/ba-p/873084).

## August 2019

### Privacy controls for Office for Mac
Starting with Version 16.28 of Office for Mac, there are new preference settings that allow you to control settings related to diagnostic data and connected experiences. For more information, see [Use preferences to manage privacy controls for Office for Mac](privacy/mac-privacy-preferences.md).

## July 2019

### Microsoft Teams and existing installations of Office 365 ProPlus
Microsoft Teams will be added to ***existing*** installations of Office 365 ProPlus, starting with Version 1906 in Monthly Channel. For more information, see [Deploy Microsoft Teams with Office 365 ProPlus](teams-install.md).

### Create and manage your deployment configurations in the cloud
You can now use the [Office Customization Tool](https://config.office.com/) to create, save, and manage your deployment configurations in the cloud. When you run the Office Deployment Tool, you can reference these configurations directly. For more details, see [Overview of the Office Customization Tool](overview-of-the-office-customization-tool-for-click-to-run.md).

### Security baseline for Office 365 ProPlus
Microsoft has announced the *draft* release of the recommended security configuration baseline settings for Microsoft Office 365 ProPlus, version 1907. For more information, see this [blog post](https://techcommunity.microsoft.com/t5/Microsoft-Security-Baselines/Security-baseline-for-Office-365-ProPlus-v1907-July-2019-DRAFT/ba-p/771308).

### Set a deadline for updates from Microsoft AutoUpdate (MAU)
Starting with version 4.13 of Microsoft AutoUpdate (MAU), you can set a deadline for when updates are required to be installed on a user's device. For more information, see [Set a deadline for updates from Microsoft AutoUpdate](mac/mau-deadline.md).

## June 2019

### Comparison of application compatibility and readiness assessments tools
Are you trying to figure out whether to use the Readiness Toolkit, readiness features in Configuration Manager (current branch), or Office Telemetry Dashboard? For recommendations, see [Overview of application compatibility and readiness assessment tools for Office 365 ProPlus](readiness-tools.md)

## April 2019

### Use the MigrateArch attribute to change Office 365 ProPlus from 32-bit to 64-bit
It's now easier to change an existing installation of Office 365 ProPlus from 32-bit to 64-bit. You can use the MigrateArch attribute in a configuration.xml file along with the Office Deployment Tool. The migration process will preserve existing products, languages, and other deployment settings.

For more information, see [Change an Office 365 ProPlus installation from 32-bit to 64-bit](change-bitness.md).

### General availability of Office cloud policy service
The Office cloud policy service (OCPS) is now generally available.  OCPS is a cloud-based service that enables you to enforce policy preferences for Office 365 ProPlus on a user's device, even if the device isn't domain joined or otherwise managed. The policy preferences roam to whichever device the user signs into and uses Office 365 ProPlus.

For more information, see [Overview of the Office cloud policy service for Office 365 ProPlus](overview-office-cloud-policy-service.md).

### Preview of Security Policy Advisor
Security Policy Advisor is now available for public preview. You can use Security Policy Advisor to receive and implement security policy recommendations that are based on Microsoft best practices and information about your existing environment. Security Policy Advisor can only be used in combination with the Office cloud policy service.

For more information, see [Overview of Security Policy Advisor](overview-of-security-policy-advisor.md).

### Privacy controls for Office 365 ProPlus
Microsoft is committed to providing you with the information and controls you need to make choices about how your data is collected and used when you're using Office 365 ProPlus.

Starting with Version 1904, there are new, updated, and improved privacy controls for diagnostic data and connected experiences. For more information, see [Overview of privacy controls for Office 365 ProPlus](privacy/overview-privacy-controls.md).


### Use SQL Server with the Readiness Toolkit
The Readiness Toolkit now supports storing report results in a SQL Server database. If you use SQL Server, you also get a Power BI report, instead of an Excel workbook. For more information, see [Use SQL Server to store report results](use-the-readiness-toolkit-to-assess-application-compatibility-for-office-365-pro.md#use-sql-server-to-store-report-results).

## March 2019
Language deployment for Office 365 ProPlus continues to improve. For best practices on using the Office Content Delivery Network (CDN) as a backup, matching languages to your operating system or existing installation of Office, and deploying only language packs or proofing tools, see [Overview of deploying languages in Office 365 ProPlus](overview-of-deploying-languages-in-office-365-proplus.md).

## February 2019
Microsoft Teams will be installed for ***new*** installations of Office 365 ProPlus, starting with Version 1902 in Monthly Channel. For more information, see [Deploy Microsoft Teams with Office 365 ProPlus](teams-install.md).

## January 2019

### Public preview of Office client policy service
A public preview is now available for the Office client policy service, which is a cloud-based service that enables you to enforce policy preferences for Office 365 ProPlus on a user's device, even if the device isn't domain joined or otherwise managed. The policy preferences roam to whichever device the user signs into and uses Office 365 ProPlus.

For more information, see the following resources:
 - [Announcing the new cloud-based policy management service for Office 365 ProPlus](https://techcommunity.microsoft.com/t5/Office-365-Blog/Announcing-the-new-cloud-based-policy-management-service-for/ba-p/310405)
 - [Overview of the Office client policy service (Preview) for Office 365 ProPlus](overview-office-client-policy-service.md)

### Office for Mac available in the Mac App Store
Office apps, such as Word and Outlook, are now available from the Mac App Store. Most require an Office 365 subscription to activate. You can use a supported enterprise mobility management (EMM) tool to deploy these apps to your users. For more information, see [Deploy Office for Mac from the Mac App Store](mac/deploy-mac-app-store.md).


## October 2018

The [Office Customization Tool](https://config.office.com/) is now generally available. The OCT makes it easy to customize your deployment of Office 365 ProPlus and other Click-to-Run Office products. Instead of building the configuration files in a text editor, you can now use this simple web-based interface. Go directly to the [tool](https://config.office.com/) or read more about it [here](overview-of-the-office-customization-tool-for-click-to-run.md).

When installing language packs, you can save network bandwidth by installing only proofing tools. For more details, see [Deploy proofing tools](overview-of-deploying-languages-in-office-365-proplus.md#deploy-proofing-tools) and [Languages, culture codes, and companion proofing languages](overview-of-deploying-languages-in-office-365-proplus.md#languages-culture-codes-and-companion-proofing-languages).

For best practices on deploying Office 365 ProPlus with Configuration Manager, see [our new article](deploy-office-365-proplus-with-configuration-manager.md).

## September 2018

Office 2019 is the latest version of Microsoft's productivity software that's available as a one-time purchase from a retail store or through a volume licensing agreement. Note that Office 2019 is separate from Office that's available through Office 365 plans. For example, if you've deployed Office 365 ProPlus to the users in your organization, you don't need Office 2019. You already have all the features, and many more, that are included in Office 2019. For more details, see [Overview of Office 2019](office2019/overview.md) and [Deploy Office 2019](office2019/deploy.md).
 
## August 2018

Version 1.2 of the Readiness Toolkit was released, with new functionality to conceal folder and file name info collected in the scan and the ability to capture add-in usage info. For more details, see [Use the Readiness Toolkit to assess application compatibility for Office 365 ProPlus](use-the-readiness-toolkit-to-assess-application-compatibility-for-office-365-pro.md).

## July 2018

You can now  use the Office Deployment Tool to apply application preferences to Office 365 ProPlus as part of an initial deployment or as an update to existing installations of Office. For more details, see [Apply application preferences to Office 365 ProPlus](overview-of-the-office-2016-deployment-tool.md#apply-application-preferences-to-office-365-proplus).

## June 2018

To help you uninstall versions of Office that use Windows Installer (MSI) as the installation technology, you can now use the Office Deployment Tool and specify the RemoveMSI element in your configuration.xml file. For more details, see [Remove existing MSI versions of Office when upgrading to Office 365 ProPlus](upgrade-from-msi-version.md).

For best practices for planning your deployment of Office 365 ProPlus, see [Assess your environment and requirements for deploying Office 365 ProPlus](assess-office-365-proplus.md) and [Plan your enterprise deployment of Office 365 ProPlus](plan-office-365-proplus.md).


