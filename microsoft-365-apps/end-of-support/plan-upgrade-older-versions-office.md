---
title: "Plan an upgrade from older versions of Office to Microsoft 365 Apps"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: conceptual
ms.service: o365-proplus-itpro
ms.collection: Tier1
ms.localizationpriority: medium
recommendations: true
description: "Provides recommendations, information, and links to help administrators and IT Pros in large enterprises plan their upgrades to Microsoft 365 Apps from older versions of Office, such as Office 2016 and Office 2013."
ms.date: 09/18/2024
---

# Plan an upgrade from older versions of Office to Microsoft 365 Apps

***Applies to:*** *Volume licensed versions of Office 2019, Office 2016, Office 2013, Office 2010, and Office 2007*

The following table shows the end of support dates for older versions of Office.

|Office version |End of support date  |
|---------|---------|
|Office 2019 |October 14, 2025    |
|Office 2016 |October 14, 2025    |
|Office 2013 |April 11, 2023    |
|Office 2010 |October 13, 2020  |
|Office 2007 |October 10, 2017  |

This article provides recommendations, information, and links to help IT Pros and Office admins in organizations plan their upgrades from these older versions of Office to Microsoft 365 Apps. If you haven't begun to upgrade from these older versions of Office, we recommend you start now.

We also recommend business and enterprise customers use the deployment benefits provided by Microsoft and Microsoft Certified Partners, including [Microsoft FastTrack](https://www.microsoft.com/fasttrack) for cloud migrations.

> [!NOTE]
> - If you're a home user who wants to upgrade from an older version of Office to the latest version of Office, see [How do I upgrade Office?](https://support.microsoft.com/office/ee68f6cf-422f-464a-82ec-385f65391350)
> - If you're an admin at a small business or organization who wants to help your users upgrade to the latest version of Office, see [Upgrade your Microsoft 365 for business users to the latest Office client](/microsoft-365/admin/setup/upgrade-users-to-latest-office-client).

## What does end of support mean?

Office, like almost all Microsoft products, has a support lifecycle during which we provide bug fixes and security fixes. This lifecycle lasts for some years from the date of the product's initial release. The end of this lifecycle is known as the product's end of support. After Office reaches its end of support, Microsoft no longer provides the following services:
  
- Technical support for issues
- Bug fixes for issues that are discovered
- Security fixes for vulnerabilities that are discovered

Because of these changes, we strongly recommend that you upgrade to a supported version of Office as soon as possible.

> [!TIP]
> - To find the support lifecycle for a Microsoft product, see [Search Product and Services Lifecycle Information](/lifecycle/products/).
> - To discuss or learn more about end of support for Office versions, go to the [Microsoft Office End of Support](https://techcommunity.microsoft.com/t5/microsoft-office-end-of-support/ct-p/OfficeEOS) area of the Microsoft Tech Community.

## What are my options?

Before your older version of Office reaches its end of support, you should explore your options and prepare an upgrade plan to either of these latest versions of Office:
  
- Microsoft 365 Apps, the subscription version of Office that comes with many Microsoft 365 enterprise and business plans.

- Office Long Term Service Channel (LTSC) 2024, and Office LTSC 2021 are sold as a one-time purchase, through a volume license agreement, and available for one device per license.

A key difference between Microsoft 365 Apps and Office LTSC is that Microsoft 365 Apps is continuously updated, with new features released as frequently as monthly. In contrast, Office LTSC versions include only the features available at their initial release—Office LTSC 2024 in September 2024, and Office LTSC 2021 in September 2021.

> [!NOTE]  
> Office LTSC 2024 and Office LTSC 2021 are designed for specific scenarios, such as regulated devices that cannot accept feature updates, process control devices on manufacturing floors, and specialty systems that cannot connect to the internet.  
> For more information, see [Overview of Office LTSC 2021](/office/ltsc/2021/overview.md) and [Overview of Office LTSC 2024](/office/ltsc/2021/deploy.md).

This article provides guidance on upgrading to Microsoft 365 Apps.

## What is Microsoft 365? What is Microsoft 365 Apps?

Microsoft 365 (and Office 365) provides subscription plans that include access to Office applications and other cloud services, including Teams, Exchange Online, and OneDrive. For more information, see the following resources:

- [Compare Microsoft 365 enterprise plans](https://www.microsoft.com/microsoft-365/compare-microsoft-365-enterprise-plans)
- [Compare enterprise plans for Office 365](https://www.microsoft.com/microsoft-365/enterprise/compare-office-365-plans)
- [Microsoft 365 and Office 365 service descriptions](/office365/servicedescriptions/office-365-service-descriptions-technet-library)

Microsoft 365 Apps is the version of Office that comes with many of those enterprise and business subscription plans. Microsoft 365 Apps includes the full versions of Office apps installed on your client devices. For example, Word, PowerPoint, Excel, Outlook, and OneNote.

Unlike volume licensed versions of Office, Microsoft 365 Apps provides a user-based licensing model that allows your users to install Office on multiple devices with their license. For example, install and use Microsoft 365 Apps on both a Windows 11 device and a Mac, as well as on a mobile device. Other options are available, such as [device-based licensing](../licensing-activation/device-based-licensing.md) or [shared computer activation](../deploy/overview-office-deployment-tool.md) for devices shared by multiple users, and [extended offline access](../licensing-activation/overview-extended-offline-access.md) for devices that aren't connected to the internet for an extended period of time.  

There are also differences in how you deploy, activate, and update Microsoft 365 Apps compared to older volume licensed versions of Office. For more information about Microsoft 365 Apps, see the following information:

- [About Microsoft 365 Apps in the enterprise](../deploy/about-microsoft-365-apps.md)
- [Deployment guide for Microsoft 365 Apps](../deploy/deployment-guide-microsoft-365-apps.md)

## Review the system requirements for Microsoft 365 Apps

Before upgrading to Microsoft 365 Apps, verify that your client devices meet or exceed the minimum [system requirements](https://www.microsoft.com/microsoft-365/microsoft-365-and-office-resources).
  
In addition, you should review the system requirements for your Office server workloads. For more information, see [Exchange Server supportability matrix](/exchange/plan-and-deploy/supportability-matrix) and [System Requirements for Office server products](https://www.microsoft.com/microsoft-365/microsoft-365-and-office-resources?rtc=1#coreui-heading-scilts8).
  
## Plan for Microsoft 365

Because Microsoft 365 Apps comes with many enterprise Microsoft 365 (and Office 365) plans, you should review the capabilities of your current plan as part of planning an upgrade to Microsoft 365 Apps. Before deploying Microsoft 365 Apps, for example, you should ensure that all your users have accounts and licenses.

For more information, see the following resources:

- [Microsoft 365 for enterprise overview](/microsoft-365/enterprise/microsoft-365-overview)
- [Deploy Microsoft 365 Enterprise for your organization](/microsoft-365/enterprise/setup-overview-for-enterprises)

## Assess application compatibility

Before deploying Microsoft 365 Apps, you want to test your business-critical VBA macros, non-Microsoft add-ins, and complex documents and spreadsheets to assess their compatibility with Microsoft 365 Apps. For more information, see [Assess application compatibility](../deploy/assess-microsoft-365-apps.md#step-4---assess-application-compatibility).
  
If you use the Microsoft Configuration Manager (current branch), you can use the [Microsoft 365 Apps readiness dashboard](/mem/configmgr/sum/deploy-use/office-365-dashboard#bkmk_readiness-dash). Or, you can get assistance from Microsoft through the [App Assure](https://www.microsoft.com/fasttrack/microsoft-365/app-assure) program.

## Assess your infrastructure and environment

To decide how to upgrade to Microsoft 365 Apps, you should evaluate your infrastructure and environment, including the following areas:
  
- Number and distribution of your clients, including required languages.
- IT infrastructure, including operating systems, mobile device support, user permissions and management, and software distribution methods.
- Network infrastructure, including connections to the internet and internal software distribution points.
- Cloud infrastructure, including existing Microsoft 365 (or Office 365) capabilities, user licensing, and identity.

Your assessment of these components influences how you want to upgrade. For more information, see [Assess your environment and requirements for deploying Microsoft 365 Apps](../deploy/assess-microsoft-365-apps.md).

## Choose how you want to deploy and update Microsoft 365 Apps

You can deploy and update Microsoft 365 Apps directly from the cloud, from a local source on your local network, or with Configuration Manager (or another software distribution solution). Which option you choose depends on your environment and business requirements. When you deploy from the cloud, for example, it minimizes your administrative overhead but could require more network bandwidth. When you use Configuration Manager or a local source for deployment, on the other hand, you might have more control over which devices get deployed and updated and the timing of those updates.

For more information, see [Plan your enterprise deployment of Microsoft 365 Apps](../deploy/plan-microsoft-365-apps.md).

## Choose how often to update Office with new features

With Microsoft 365 Apps, you can control how frequently your users receive feature updates to their Office applications. For example, you can get new features as soon as they’re ready, once a month, or once every six months.

For more information, see the following resources:

- [Overview of update channels for Microsoft 365 Apps](../updates/overview-update-channels.md)
- [What's new in Microsoft 365](https://support.microsoft.com/office/95c8d81d-08ba-42c1-914f-bca4603e1426)
- [Release notes for Microsoft 365 Apps releases](/officeupdates/release-notes-microsoft365-apps#release-notes-for-microsoft-365-apps-releases)

## Plan for more languages

You can install language accessory packs after you deploy Microsoft 365 Apps in one of its base languages. There are two ways to install language accessory packs:

- Have your users download and install the language accessory packs for themselves.
- Use the Office Deployment Tool to deploy the appropriate language accessory packs to your users.

For more information, see [Overview of deploying languages for Microsoft 365 Apps](../deploy/overview-deploying-languages-microsoft-365-apps.md).

## Review new policy settings for Group Policy

As with any new version of Office, there are new Administrative Template files (ADMX/ADML) for Group Policy. All policy settings for Microsoft 365 Apps are located in HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Office\16.0 and HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft\Office\16.0.

You can [download the Administrative Template files (ADMX/ADML)](https://www.microsoft.com/download/details.aspx?id=49030) for Group Policy for Microsoft 365 Apps from the Microsoft Download Center for free. The download includes an Excel file that lists all the policy settings for Microsoft 365 Apps.

> [!NOTE]
> The Administrative Template files (ADMX/ADML) for Microsoft 365 Apps share the same download as Office 2019 and Office 2016. This is because Microsoft 365 Apps, Office 2019 and Office 2016 use the same product version number, 16.0.

If you have Microsoft 365 Apps for enterprise, you can also use Cloud Policy to apply most user-based policy settings. For more information, see [Overview of Cloud Policy service for Microsoft 365](../admin-center/overview-cloud-policy.md).

## Remove older versions of Office when you upgrade

We recommend that you uninstall any previous versions of Office before installing Microsoft 365 Apps on a device. You can remove these older versions of Office at the same time that you're installing Microsoft 365 Apps.

For more information, see [Remove existing MSI versions of Office when upgrading to Microsoft 365 Apps](../deploy/upgrade-from-msi-version.md).

## Upgrade to newer versions of Project and Visio

The desktop versions of Project and Visio share the same end of support dates as the Office suites for those versions. For example, support for Project 2013 ended on April 11, 2023 and support for Visio 2016 ends on October 14, 2025.

Subscription plans for Project and Visio are available and include regular feature updates. These plans are sold separately from plans that include Microsoft 365 Apps. For more information, see the following resources:

- [Project plans and pricing information](https://www.microsoft.com/microsoft-365/project/compare-microsoft-project-management-software)
- [Visio plans and pricing information](https://www.microsoft.com/microsoft-365/visio/microsoft-visio-plans-and-pricing-compare-visio-options)

The most recent volume licensed versions are Project 2021 and Visio LTSC 2021. These versions were released in September 2021 and don't receive regular feature updates.

For more information, see the following articles:

- [Deployment guide for Project](../deploy/deployment-guide-for-project.md)
- [Deployment guide for Visio](../deploy/deployment-guide-for-visio.md)

## Related articles

- [Office versions and connectivity to Microsoft 365 services](microsoft-365-services-connectivity.md)
- [Windows and Office configuration support matrix (PDF)](https://aka.ms/windows-office-support-matrix)