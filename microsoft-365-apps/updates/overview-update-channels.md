---
title: "Overview of update channels for Microsoft 365 Apps"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: conceptual
ms.service: o365-proplus-itpro
ms.collection: 
 - tier1
 - essentials-manage
ms.localizationpriority: medium
recommendations: false
description: "Provides IT Pros with an overview of the update channels for Microsoft 365 Apps, including Current Channel, Monthly Enterprise Channel, and Semi-Annual Enterprise Channel"
ms.date: 08/01/2024
---

# Overview of update channels for Microsoft 365 Apps

One of the benefits of Microsoft 365 Apps is that Microsoft provides new (and updated) features for apps such as Excel and Word regularly. You can control how often the users in your organization get these new features by specifying the update channel.

In addition to new features, update channels provide, as needed, security and non-security updates regularly, every month. Non-security updates provide fixes for known issues and offer stability or performance improvements for Microsoft 365 Apps.

> [!NOTE]
> If you prefer watching over reading, check out the [Update Channels Explained video](https://youtu.be/eNn4PDkmo7s). It covers all available update channels, plus  some tips & tricks for admins.

There are three primary update channels:

- [Current Channel](#current-channel-overview)
- [Monthly Enterprise Channel](#monthly-enterprise-channel-overview)
- [Semi-Annual Enterprise Channel](#semi-annual-enterprise-channel-overview)

Choose Current Channel to give your users the newest features as soon as they're ready. If you need predictable release dates for new features each month, choose Monthly Enterprise Channel. For devices that require extensive testing before receiving new features, choose Semi-Annual Enterprise Channel.

But, we realize that there are multiple factors that determine which update channel you select for your deployment of Microsoft 365 Apps. For example, network bandwidth utilization, end-user training and support, line-of-business applications, and other organizational requirements.

## Comparison of the update channels for Microsoft 365 Apps

The following table provides a comparison of Current Channel, Monthly Enterprise Channel, and Semi-Annual Enterprise Channel.


| Category | Current Channel | Monthly Enterprise Channel | Semi-Annual Enterprise Channel |
|---------|---------|---------|---------|
| *Recommended use* | Provide your users with new Microsoft 365 Apps features as soon as they're ready, but on no set schedule. | Provide your users with new Microsoft 365 Apps features only once a month and on a predictable schedule. | For non-human devices and those running specialized or business-critical workloads that require extensive testing before new Microsoft 365 Apps features are implemented. Suitable for select devices performing automated tasks where end-users aren't present, ensuring compliance with regulatory and organizational standards. |
| *Release frequency*<sup>1</sup> | At least once a month (likely more often), but on no set schedule | Once a month, on the second Tuesday of the month | Once a month, on the second Tuesday of the month |
| *Feature updates*<sup>2</sup> | As soon as they’re ready (once a month), but on no set schedule | Once a month, on the second Tuesday of the month | Twice a year (in January and July), on the second Tuesday of the month |
| *Security updates*<sup>3</sup><br></br>*(if needed)* | Once a month, on the second Tuesday of the month | Once a month, on the second Tuesday of the month | Once a month, on the second Tuesday of the month |
| *Non-security updates*<sup>2</sup><br></br>*(if needed)* | Usually at least once a month (possibly more often), but no set schedule | Once a month, on the second Tuesday of the month | Once a month, on the second Tuesday of the month |
| *Support duration for a given version*<sup>4</sup> | Until the next version is released with new features, which is usually about one month | Two months | Fourteen months |


<sup>1</sup> For a list of release dates for these update channels, including version and build numbers, see [Update history for Microsoft 365 Apps](/officeupdates/update-history-microsoft365-apps-by-date). 

<sup>2</sup> For information about what feature updates and non-security updates are included in a given release of these update channels, see [Release notes for Microsoft 365 Apps releases](/officeupdates/release-notes-microsoft365-apps#release-notes-for-microsoft-365-apps-releases).

<sup>3</sup> For a list of security updates included in a given release of these update channels, see [Release notes for Microsoft Office security updates](/officeupdates/microsoft365-apps-security-updates)

<sup>4</sup> For a table that shows which version and build is currently supported for each of these update channels, see [Update history for Microsoft 365 Apps](/officeupdates/update-history-microsoft365-apps-by-date). 

> [!NOTE]
> - To ensure that you have the most up-to-date security and non-security updates, always update to the most current version and build available for your update channel.
> - To simplify update management, configure devices to get Microsoft 365 Apps updates directly from the Office Content Delivery Network (CDN) on the internet. For more information, including implications for network bandwidth utilization, see [Managing updates](#managing-updates).

## Current Channel overview
Choose Current Channel to provide your users with the newest Microsoft 365 Apps features as soon as they're ready. Current Channel usually receives new features at least once a month, but there's no set schedule for when those updates are released.

Current Channel also receives other updates during the month, which include security and non-security updates. There's no set schedule for these updates, but in general there are two or three releases each month, including one on the second Tuesday of the month.

### Feature updates for Current Channel
New, or updated, features for Current Channel usually are released every month. There's no set schedule for when a feature update for Current Channel occurs. A feature update for Current Channel is made available only when various release criteria are met, including criteria related to stability and performance.

In some cases, a new feature is made available only to a subset of users as the feature is gradually rolled out in Current Channel.

For a list of feature updates included in a given release of Current Channel, see [Release notes for Microsoft 365 Apps releases](/officeupdates/release-notes-microsoft365-apps#release-notes-for-microsoft-365-apps-releases).

#### Preview upcoming new features of Current Channel
To become familiar with the new features coming in the next feature release of Current Channel, we recommend that you use Current Channel (Preview). 

There isn’t a set release schedule for Current Channel (Preview). In general, a new version of Current Channel (Preview) with new features is released at least a week or more before that new version is released to Current Channel. There might be several releases of Current Channel (Preview), with non-security updates, before that version is released to Current Channel.

You should deploy Current Channel (Preview) to a small, representative sample of users in your organization. This small sample can help you identify any possible issues for your organization before those new features are released more broadly to your users that have Current Channel.

We also encourage you to use Current Channel (Preview) so that you can identify any possible issues that you want us to fix before that version is released to Current Channel. This approach can help reduce the number of non-security updates that are needed for Current Channel.

### Security updates for Current Channel
If needed, security updates for Current Channel are released on the second Tuesday of the month. 
Security updates are cumulative. The most current release of Current Channel includes the security updates from previous releases of Current Channel. 

Separate downloads of just security updates for Current Channel aren’t available. Also, new security updates aren’t provided for versions of Current Channel that are no longer supported.

For a list of security updates included in a given release of Current Channel, see [Release notes for Microsoft Office security updates](/officeupdates/microsoft365-apps-security-updates).

### Non-security updates for Current Channel
If needed, non-security updates are provided for Current Channel. Non-security updates offer fixes for known issues and provide stability or performance improvements for Microsoft 365 Apps.

There's no set schedule for when non-security updates are released for Current Channel. Non-security updates are included with the following releases:

- When a new version of Current Channel is released with new features
- When security updates are released on the second Tuesday of the month

Non-security updates can be released at other times. For example, to fix an issue with a new feature that was recently released. In general, Current Channel can get two or three updates per month that contain only non-security updates.

We also encourage you to use Current Channel (Preview) so that you can identify any possible issues that you want us to fix before that version is released to Current Channel. This approach can help reduce the number of non-security updates that are needed for Current Channel.

Non-security updates are cumulative. The most current release of Current Channel includes the non-security updates from previous releases of Current Channel. 

Separate downloads of just non-security updates for Current Channel aren’t available. Also, new non-security updates aren’t provided for versions of Current Channel that are no longer supported. The updates are listed as "Resolved issues."

For a list of non-security updates included in a given release of Current Channel, see [Release notes for Microsoft 365 Apps releases](/officeupdates/release-notes-microsoft365-apps#release-notes-for-microsoft-365-apps-releases). The updates are listed as "Resolved issues."

### Support duration for Current Channel
Any given version of Current Channel is supported only until the next version of Current Channel is released, which is usually every month. For example, Version 2004 is supported until Version 2005 is released. To see which version of Current Channel is currently supported, refer to the table at the top of [Update history for Microsoft 365 Apps](/officeupdates/update-history-microsoft365-apps-by-date). 

## Monthly Enterprise Channel overview

Choose Monthly Enterprise Channel if you want to provide your users with new Microsoft 365 Apps features each month, but only want to receive one update per month on a predictable release schedule.

Updates to Monthly Enterprise Channel are released on the second Tuesday of the month. This monthly update can include feature, security, and non-security updates. 

### Feature updates for Monthly Enterprise Channel
New, or updated, features are released in Monthly Enterprise Channel on the second Tuesday of the month. These new features are features that are already available to all users in Current Channel. Separate downloads of just feature updates for Monthly Enterprise Channel aren’t available.

Features that are currently in Current Channel need to meet certain release criteria before including them in a feature update for Monthly Enterprise Channel. Because of these criteria, some features that are in Current Channel aren’t included right away in the next available feature update for Monthly Enterprise Channel.

For a list of feature updates included in a given release of Monthly Enterprise Channel, see [Release notes for Microsoft 365 Apps releases](/officeupdates/release-notes-microsoft365-apps#release-notes-for-microsoft-365-apps-releases).

#### Preview upcoming new features of Monthly Enterprise Channel

There's no dedicated preview channel for Monthly Enterprise Channel, like there is for Current Channel and for Semi-Annual Enterprise Channel.

Introduce the latest Monthly Enterprise Channel features within your organization by having a select group of users download and use the new version as soon as it's available on the Office CDN. Following this initial release, gradually deploy the new version across your entire organization. Over the span of several days, Microsoft 365 Apps automatically recognizes and accesses the latest version from the Office CDN.

If you plan to use Current Channel for previews, its new features could differ from the features in the next Monthly Enterprise Channel update. Current Channel features aren't always the same features in the upcoming update for Monthly Enterprise Channel. The difference is because Current Channel might have new features. These features are first available to a few users and are rolled out gradually. Monthly Enterprise Channel only contains features that are rolled out in Current Channel. Therefore, a new feature that's available in Current Channel might not be available in Monthly Enterprise Channel for several months, because the feature is still being rolled out in Current Channel.

### Security updates for Monthly Enterprise Channel
If needed, security updates for Monthly Enterprise Channel are released on the second Tuesday of the month.

Security updates are cumulative. The most current release of Monthly Enterprise Channel includes the security updates from previous releases of Monthly Enterprise Channel. 

Separate downloads of just security updates for Monthly Enterprise Channel aren’t available. Also, new security updates aren’t provided for versions of Monthly Enterprise Channel that are no longer supported.

For a list of security updates included in a given release of Monthly Enterprise Channel, see [Release notes for Microsoft Office security updates](/officeupdates/microsoft365-apps-security-updates).

### Non-security updates for Monthly Enterprise Channel
If needed, non-security updates for Monthly Enterprise Channel are provided on the second Tuesday of the month. Non-security updates offer fixes for known issues and provide stability or performance improvements for Microsoft 365 Apps.

When a critical issue, like one related to data loss, requires immediate resolution, we provide an updated release with the fix before the next scheduled monthly update.

Non-security updates are cumulative. The most current release of Monthly Enterprise Channel includes the non-security updates from previous releases of Monthly Enterprise Channel. 

Separate downloads of just non-security updates for Monthly Enterprise Channel aren’t available. Also, new non-security updates aren’t provided for versions of Monthly Enterprise Channel that are no longer supported.

For a list of non-security updates included in a given release of Monthly Enterprise Channel, see [Release notes for Microsoft 365 Apps releases](/officeupdates/release-notes-microsoft365-apps#release-notes-for-microsoft-365-apps-releases). The updates are listed as "Resolved issues."

### Copilot updates for Monthly Enterprise Channel
To ensure a seamless experience with Copilot's rapidly evolving AI capabilities, updates could be introduced to Monthly Enterprise Channel ahead of the usual timeline. This proactive approach is all about enhancing the quality of Copilot features within Microsoft 365. For consistent quality, these updates are deployed only after a full rollout in Current Channel.
Updates deployed to Monthly Enterprise Channel in this manner are documented like any other update in the release notes. 

### Support duration for Monthly Enterprise Channel
Any given version of Monthly Enterprise Channel is supported for two months. For example, the version of Monthly Enterprise Channel that is released on the second Tuesday of August is supported until the second Tuesday of October. 

At any given time, there are always two versions of Monthly Enterprise Channel that are supported. To see which versions of Monthly Enterprise Channel are currently supported, refer to the table at the top of [Update history for Microsoft 365 Apps](/officeupdates/update-history-microsoft365-apps-by-date).

## Semi-Annual Enterprise Channel overview

Choose Semi-Annual Enterprise Channel only for non-human devices and those running specialized or business-critical workloads that require extensive testing before new Microsoft 365 Apps features are implemented. This channel is suitable for select devices performing automated tasks where end-users aren't present, ensuring compliance with regulatory and organizational standards.

Updates to Semi-Annual Enterprise Channel are released on the second Tuesday of the month. In January and July, the monthly update can include feature, security, and non-security updates. In other months, the update can include security and non-security updates.

### Feature updates for Semi-Annual Enterprise Channel
New, or updated, features are released in Semi-Annual Enterprise Channel twice a year, on the second Tuesday in January and July. New features aren’t added to Semi-Annual Enterprise Channel at any other time. Separate downloads of just feature updates for Semi-Annual Enterprise Channel aren’t available.

These new features are available to all users in Monthly Enterprise Channel. Features in Monthly Enterprise Channel must meet specific release criteria before they're included in a feature update for Semi-Annual Enterprise Channel. Because of this criteria, some features that are in Monthly Enterprise Channel aren’t included right away in the next available feature update for Semi-Annual Enterprise Channel.

For a list of feature updates included in a given release of Semi-Annual Enterprise Channel, see [Release notes for Microsoft 365 Apps releases](/officeupdates/release-notes-microsoft365-apps#release-notes-for-microsoft-365-apps-releases).

#### Preview upcoming new features of Semi-Annual Enterprise Channel
To become familiar with the new features coming in the next feature release of Semi-Annual Enterprise Channel, we recommend that you use Semi-Annual Enterprise Channel (Preview).

Semi-Annual Enterprise Channel (Preview) is released with new features twice a year, on the second Tuesday in March and September. This schedule provides you with four months before those same new features are released in Semi-Annual Enterprise Channel. Semi-Annual Enterprise Channel (Preview) also receives, if needed, security and non-security updates every month, on the second Tuesday of the month.

You should deploy Semi-Annual Enterprise Channel (Preview) to a small, representative sample of users in your organization. This approach can help you identify any possible issues for your organization before the new features are released more broadly to your users on Semi-Annual Enterprise Channel.

We recommend using Semi-Annual Enterprise Channel (Preview). This approach allows you to identify and report any potential issues. We can then address these concerns in the four months before the version's release on Semi-Annual Enterprise Channel. Once a version is released to Semi-Annual Enterprise Channel, the approval process for non-security updates becomes even more rigorous.

### Security updates for Semi-Annual Enterprise Channel
If needed, security updates for Semi-Annual Enterprise Channel are released on the second Tuesday of the month. 

Security updates are cumulative. The most current release of Semi-Annual Enterprise Channel includes the security updates from previous releases of Semi-Annual Enterprise Channel. 

Separate downloads of just security updates for Semi-Annual Enterprise Channel aren’t available. Also, new security updates aren’t provided for versions of Semi-Annual Enterprise Channel that are no longer supported.

For a list of security updates included in a given release of Semi-Annual Enterprise Channel, see [Release notes for Microsoft Office security updates](/officeupdates/microsoft365-apps-security-updates).

### Non-security updates for Semi-Annual Enterprise Channel
If needed, non-security updates for Semi-Annual Enterprise Channel are provided on the second Tuesday of the month. Non-security updates offer fixes for known issues and provide stability or performance improvements for Microsoft 365 Apps.

When a critical issue, like one related to data loss, requires immediate resolution, we provide an updated release with the fix before the next scheduled monthly update.

We tend to provide fewer non-security updates for Semi-Annual Enterprise Channel than the other update channels. Most issues in  Semi-Annual Enterprise Channel are identified and resolved earlier in other update channels, like Current Channel and Monthly Enterprise Channel, thanks to customer feedback. Also, many customers are asking us to provide an update channel that doesn’t change often, because changes could require them to do another round of compliance testing. So, before we approve the release of any non-security updates to Semi-Annual Enterprise Channel, we carefully assess the effect of introducing the change to the update channel. Critical issues that result in data loss, or significantly affect a large number of customers using Semi-Annual Enterprise Channel, are likely to be approved. We recommend using Semi-Annual Enterprise Channel (Preview). This approach allows you to identify and report any potential issues. We can then address these concerns in the four months before the version's release on Semi-Annual Enterprise Channel.

Non-security updates are cumulative. The most current release of Semi-Annual Enterprise Channel includes the non-security updates from previous releases of Semi-Annual Enterprise Channel.

Separate downloads of just non-security updates for Semi-Annual Enterprise Channel aren’t available. Also, new non-security updates aren’t provided for versions of Semi-Annual Enterprise Channel that are no longer supported.

For a list of non-security updates included in a given release of Semi-Annual Enterprise Channel, see [Release notes for Microsoft 365 Apps releases](/officeupdates/release-notes-microsoft365-apps#release-notes-for-microsoft-365-apps-releases). The updates are listed as "Resolved issues."

### Support duration for Semi-Annual Enterprise Channel
Any given version of Semi-Annual Enterprise Channel is supported for 14 months. The new Semi-Annual Enterprise Channel version released in January receives support until March of the next year. Similarly, the version released in July is supported until September of the following year.

At any given time, there are always two versions of Semi-Annual Enterprise Channel that are supported. To see which versions of Semi-Annual Enterprise Channel are currently supported, refer to the table at the top of [Update history for Microsoft 365 Apps](/officeupdates/update-history-microsoft365-apps-by-date).

Semi-Annual Enterprise Channel offers extended support to give organizations more time and flexibility. The extended support is especially helpful for thoroughly testing devices before implementing new Microsoft 365 Apps features. For example, in cases where organizations have to comply with specific regulatory, governmental, or other organizational requirements. The longer support duration gives these organizations the ability to deploy new features only once a year if needed.

## How to configure and manage update channels

Update channels are device-specific and apply only to installations of Microsoft 365 Apps on devices running Windows. The choice of an update channel for a device isn't a setting that follows the user from device to device. For example, if a user works on different devices running Windows, those devices could be configured to use different update channels. This means the user could have access to different features depending on which device they’re using.

Also, you can only configure one update channel for a device. For example, if you’re installing Microsoft 365 Apps, Project, and Visio on the same device, they all must use the same update channel. You can’t have a mix of update channels on the same device.

Not all devices in your organization have to be configured with the same update channel. For example, IT staff and application developers might be on Current Channel (Preview) so that they can try out upcoming new features, while the rest of the organization is on Monthly Enterprise Channel. When you implement various update channels in your organization, consider that different user groups might have access to distinct features based on their update channel. This variation in features can make collaboration between groups more challenging.

### Default update channel

Each subscription product is configured with a default update channel. If you don’t specify the update channel when you install the product by itself on a device, the product is configured to use the default update channel.

The default update channel for Microsoft 365 Apps for enterprise and Microsoft 365 Apps for business is Current Channel. This channel is also the default for the subscription versions of the Project and Visio desktop apps.

### Configure the update channel

#### Office Deployment Tool  
You can use the [Office Deployment Tool](../deploy/overview-office-deployment-tool.md) and specify the Channel attribute in your configuration file. There's a Channel attribute available in the Add element and in the Updates element. For more information, see [Configuration options for the Office Deployment Tool](../deploy/office-deployment-tool-configuration-options.md).

#### Group Policy  
You can [download](https://www.microsoft.com/download/details.aspx?id=49030) the Administrative Template files (ADMX/ADML) and enable the Update Channel policy setting. When you enable the policy setting, you can select the appropriate update channel from a drop-down list. You can find this policy setting under Computer Configuration\Policies\Administrative Templates\Microsoft Office 2016 (Machine)\Updates.

#### Microsoft 365 admin center 
If you allow your users to install Microsoft 365 Apps for themselves from the portal, you can specify which update channel they install. To do that, sign in to the Microsoft 365 admin center with your admin account, go to **Show all** > **Settings** > **Org settings** > **Services** > **Microsoft 365 installation options**, and then choose the appropriate update channel for your users. This setting applies to all users in your tenant and only applies to users that install Microsoft 365 Apps for themselves from the portal.

### Manage the update channel
After Microsoft 365 Apps is installed, you can change the update channel for a device. For more information on how to do that, see [Change the Microsoft 365 Apps update channel for devices in your organization](change-update-channels.md). Keep in mind that if you change the update channel for the device, the features that the user has access to change. For example, moving the device from Current Channel to Semi-Annual Enterprise Channel can cause the user to lose access to features they use, as those features aren't yet available in Semi-Annual Enterprise Channel.

## Additional information about update channels for Microsoft 365 Apps

### Other products
- These update channels also apply to the subscription versions of the Project and Visio desktop apps. For example, if you have Project Plan 3 or Visio Plan 2.
- OneDrive and Microsoft Teams have their own update cadences that are separate from these update channels. For more information, see [The OneDrive sync app `update` process](/onedrive/sync-client-update-process) and [Teams update process](/microsoftteams/teams-client-update).
- If you're deploying volume licensed versions of Office such as Office Long Term Service Channel (LTSC) Professional Plus 2021 or Office LTSC Standard 2021, you need to use a different update channel: PerpetualVL2021. For more information, see [Update channel for Office LTSC 2021](/office/ltsc/2021/update#update-channel-for-office-ltsc-2021).
- If you're deploying Office Professional Plus 2019 or Office Standard 2019, which are volume licensed versions of Office, there's a different update channel you need to use. For more information, see [Update channel for Office 2019](/office/2019/update#update-channel-for-office-2019).
- If you have a home subscription, like Microsoft 365 Family or Microsoft 365 Personal, you have access to specific update channels. These update channels include Current Channel and channels provided through the [Microsoft 365 Insider program](https://techcommunity.microsoft.com/t5/microsoft-365-insider-blog/microsoft-365-insider-handbook/ba-p/4205461#levels).

### Managing updates
To simplify managing updates, especially for Current Channel and Monthly Enterprise Channel, configure devices to receive updates directly from the Office Content Delivery Network (CDN) on the internet.
- If you're configuring devices using Windows 11 or Windows 10 to get updates directly from the Office CDN, take advantage of [Delivery Optimization](../updates/delivery-optimization.md) to help reduce network bandwidth utilization. 
When a new release is made available on the Office CDN, the availability is gradually advertised over several days to devices worldwide that have Microsoft 365 Apps installed. This staggered approach prevents all devices in your organization from trying to access the Office CDN simultaneously to download the new release, which could potentially cause network bandwidth utilization issues.
- For examples of approximate update sizes when updating from a recent release to the most current release of an update channel, see [Download sizes for updates to Microsoft 365 Apps](/officeupdates/download-sizes-microsoft365-apps-updates).
- If you use Microsoft Configuration Manager, you can manage updates for these update channels by using the Software Update management workflow. For more information, see [Manage updates to Microsoft 365 Apps with Microsoft Configuration Manager](manage-microsoft-365-apps-updates-configuration-manager.md).

### Version and build information
- To see the update channel that Microsoft 365 Apps is configured for, open an app, such as Word, and go to **File** > **Account**. The name of the update channel appears in the **Product Information** section under the **About** heading. The version and build number for the update channel are also shown there.
- When an update channel release contains feature updates, the version number is updated. For example, from Version 2004 to Version 2005. If a release contains only new security updates or new non-security updates, then only the build number gets updated and the version number remains the same.

### Support duration for other update channels
- Each version of Current Channel (Preview) remains supported only until the release of the next version, which typically occurs every month. For example, Version 2004 is supported until Version 2005 is released.
- Any given version of Semi-Annual Enterprise Channel (Preview) is supported for only six months. This support cadence coincides with how often Semi-Annual Enterprise Channel (Preview) is updated with new features. For example, Semi-Annual Enterprise Channel (Preview) releases a new version with features in March. This version remains supported until September when the next set of features is released. The September release is supported until the following March. To see what version of Semi-Annual Enterprise Channel (Preview) is currently supported, refer to the table at the top of [Update history for Microsoft 365 Apps](/officeupdates/update-history-microsoft365-apps-by-date). 

### Microsoft 365 Insider program
- The Microsoft 365 Insider program gives you early access to Microsoft 365 Apps features through these update channels: Beta Channel and Current Channel (Preview). For more information, see the [Microsoft 365 Insider Program for Business](../insider/index.yml).
- Beta Channel, which was previously named Insider (and sometimes referred to as Insider Fast), provides access to new features even before they're available in Current Channel (Preview). But, Beta Channel is ***not*** supported so should only be used in test environments and by a small group of select users, such as IT staff or application developers.
