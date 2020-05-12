---
title: "Overview of update channels for Microsoft 365 Apps"
ms.author: danbrown
author: DHB-MSFT
manager: laurawi
audience: ITPro
ms.topic: conceptual
ms.service: o365-proplus-itpro
localization_priority: Priority
ms.collection:
- Ent_O365
- M365-modern-desktop
ms.custom: Ent_Office_ProPlus
description: "Provides IT Pros with an overview of the update channels for Microsoft 365 Apps, including Current Channel, Monthly Enterprise Channel, and Semi-Annual Enterprise Channel"
---

# Overview of update channels for Microsoft 365 Apps

> [!IMPORTANT]
> We're making some changes to the update channels for Microsoft 365 Apps:
> - Introducing a new update channel: Monthly Enterprise Channel
> - Updating the names of the existing update channels
> - Changing the default update channel for Microsoft 365 Apps for enterprise
>
> To learn more, [read this article](update-channels-changes.md). In the following article, we include Monthly Enterprise Channel and we use the new names.

One of the benefits of Microsoft 365 Apps is that Microsoft provides new (and updated) features for Office apps, such as Excel and Word, on a regular basis. You can control how often the users in your organization get these new features by specifying the update channel.

In addition to new features, update channels provide, as needed, security and non-security updates on a regular basis, every month. Non-security updates provide fixes for known issues and provide stability or performance improvements for Office. 

There are three primary update channels:

- [Current Channel](#current-channel-overview)
- [Monthly Enterprise Channel](#monthly-enterprise-channel-overview)
- [Semi-Annual Enterprise Channel](#semi-annual-enterprise-channel-overview)

We recommend Current Channel, because it provides your users with the newest Office features as soon as they are ready. If you need additional predictability of when these new Office features are released each month, we recommend Monthly Enterprise Channel. In those cases where you have select devices that require extensive testing before receiving new features, we recommend Semi-Annual Enterprise Channel.

But, we realize that there are multiple factors that will determine which update channel you select for your deployment of Microsoft 365 Apps. For example, network bandwidth utilization, end-user training and support, line-of-business applications, and other organizational requirements.

## Comparison of the update channels for Microsoft 365 Apps

The following table provides a comparison of Current Channel, Monthly Enterprise Channel, and Semi-Annual Enterprise Channel.


|  |Current <br></br>Channel|Monthly Enterprise <br></br>Channel  |Semi-Annual Enterprise <br></br>Channel  |
|---------|---------|---------|---------|
|*Recommended use*     | Provide your users with new Office features as soon as they are ready, but on no set schedule.|Provide your users with new Office features only once a month and on a predictable schedule.|For select devices in your organization, where extensive testing is needed before rolling out new Office features. For example, to comply with regulatory, governmental, or other organizational requirements.|
|*Release frequency*<sup>1</sup>|At least once a month (likely more often), but on no set schedule| Once a month, on the second Tuesday of the month  |Once a month, on the second Tuesday of the month|
|*Feature updates*<sup>2</sup>     |As soon as they’re ready (usually once a month), but on no set schedule|Once a month, on the second Tuesday of the month|Twice a year (in January and July), on the second Tuesday of the month|
|*Security updates*<sup>3</sup><br></br>*(if needed)*|Once a month, on the second Tuesday of the month|Once a month, on the second Tuesday of the month |Once a month, on the second Tuesday of the month|
|*Non-security updates*<sup>2</sup><br></br>*(if needed)*|Usually at least once a month (possibly more often), but no set schedule|Once a month, on the second Tuesday of the month|Once a month, on the second Tuesday of the month|
|*Support duration for a given version*<sup>4</sup> |Until the next version is released with new features, which is usually about one month |Two months|Fourteen months|

<sup>1</sup> For a list of release dates for these update channels, including version and build numbers, see [Update history for Microsoft 365 Apps](https://docs.microsoft.com/officeupdates/update-history-microsoft365-apps-by-date). 

<sup>2</sup> For information about what feature updates and non-security updates are included in a given release of these update channels, see [Release notes for Microsoft 365 Apps releases](https://docs.microsoft.com/officeupdates/release-notes-microsoft365-apps#release-notes-for-microsoft-365-apps-releases).

<sup>3</sup> For a list of security updates included in a given release of these update channels, see [Release notes for Microsoft 365 Apps Security Updates](https://docs.microsoft.com/officeupdates/microsoft365-apps-security-updates)

<sup>4</sup> For a table that shows which version and build is currently supported for each of these update channels, see [Update history for Microsoft 365 Apps](https://docs.microsoft.com/officeupdates/update-history-microsoft365-apps-by-date). 

> [!NOTE]
> - To ensure that you have the most up-to-date security and non-security updates, we recommend that you always update to the most current version and build available for your update channel.
> - To simplify update management, we recommend that you configure devices to get Office updates directly from the Office Content Delivery Network (CDN) on the internet. For more information, including implications for network bandwidth utilization, see [Managing updates](#managing-updates).

## Current Channel overview
We recommend Current Channel, because it provides your users with the newest Office features as soon as they are ready.  Current Channel usually receives new features at least once a month, but there is no set schedule for when those updates are released.

Current Channel also receives other updates during the month, which include security and non-security updates. There is no set schedule for these updates, but in general there are two or three releases each month, including one on the second Tuesday of the month.

### Feature updates for Current Channel
New, or updated, features for Current Channel usually are released every month. There is no set schedule for when a feature update for Current Channel occurs. A feature update for Current Channel is made available only when various release criteria are met, including criteria related to stability and performance.

In some cases, a new feature is made available only to a subset of users as the feature is gradually rolled out in Current Channel.

For a list of feature updates included in a given release of Current Channel, see [Release notes for Microsoft 365 Apps releases](https://docs.microsoft.com/officeupdates/release-notes-microsoft365-apps#release-notes-for-microsoft-365-apps-releases).

#### Preview upcoming new features of Current Channel
To become familiar with the new features coming in the next feature release of Current Channel, we recommend that you use Current Channel (Preview). 

There isn’t a set release schedule for Current Channel (Preview). In general, a new version of Current Channel (Preview) with new features is released at least a week or more before that new version is released to Current Channel. There might be several releases of Current Channel (Preview), with non-security updates, before that version is released to Current Channel.

You should deploy Current Channel (Preview) to a small, representative sample of users in your organization. This can help you identify any possible issues for your organization before those new features are released more broadly to your users that have Current Channel.

We also encourage you to use Current Channel (Preview) so that you can identify any possible issues that you want us to fix before that version is released to Current Channel. This can help reduce the number of non-security updates that are needed for Current Channel.

### Security updates for Current Channel
If needed, security updates for Current Channel are released on the second Tuesday of the month. 
Security updates are cumulative. The most current release of Current Channel includes the security updates from previous releases of Current Channel. 

Separate downloads of just security updates for Current Channel aren’t available. Also, new security updates aren’t provided for versions of Current Channel that are no longer supported.

For a list of security updates included in a given release of Current Channel, see [Release notes for Microsoft 365 Apps Security Updates](https://docs.microsoft.com/officeupdates/microsoft365-apps-security-updates).

### Non-security updates for Current Channel
If needed, non-security updates are provided for Current Channel. Non-security updates provide fixes for known issues and provide stability or performance improvements for Office.

There is no set schedule for when non-security updates are released for Current Channel. Non-security updates are usually included with the following releases:

- When a new version of Current Channel is released with new features
- When security updates are released on the second Tuesday of the month

Non-security updates can be released at other times. For example, to fix an issue with a new feature that was recently released. In general, Current Channel can get two or three updates per month that contain only non-security updates.

We also encourage you to use Current Channel (Preview) so that you can identify any possible issues that you want us to fix before that version is released to Current Channel. This can help reduce the number of non-security updates that are needed for Current Channel.

Non-security updates are cumulative. The most current release of Current Channel includes the non-security updates from previous releases of Current Channel. 

Separate downloads of just non-security updates for Current Channel aren’t available. Also, new non-security updates aren’t provided for versions of Current Channel that are no longer supported. They are listed as “Resolved issues.”

For a list of non-security updates included in a given release of Current Channel, see [Release notes for Microsoft 365 Apps releases](https://docs.microsoft.com/officeupdates/release-notes-microsoft365-apps#release-notes-for-microsoft-365-apps-releases). They are listed as “Resolved issues.”

### Support duration for Current Channel
Any given version of Current Channel is supported only until the next version of Current Channel is released, which is usually every month.  For example, Version 2004 is supported until Version 2005 is released. To see which version of Current Channel is currently supported, refer to the table at the top of [Update history for Microsoft 365 Apps](https://docs.microsoft.com/officeupdates/update-history-microsoft365-apps-by-date). 

## Monthly Enterprise Channel overview

We recommend Monthly Enterprise Channel if you want to provide your users with new Office features each month, but only want to receive one update per month on a predictable release schedule.

Updates to Monthly Enterprise Channel are released on the second Tuesday of the month. This monthly update can include feature, security, and non-security updates. 

### Feature updates for Monthly Enterprise Channel
New, or updated, features are released in Monthly Enterprise Channel on the second Tuesday of the month. These new features are features that are already available to all users in Current Channel. Separate downloads of just feature updates for Monthly Enterprise Channel aren’t available.

Features that are currently in Current Channel need to meet certain release criteria before they are included in a feature update for Monthly Enterprise Channel. Because of this, some features that are in Current Channel aren’t included right away in the next available feature update for Monthly Enterprise Channel.

For a list of feature updates included in a given release of Monthly Enterprise Channel, see [Release notes for Microsoft 365 Apps releases](https://docs.microsoft.com/officeupdates/release-notes-microsoft365-apps#release-notes-for-microsoft-365-apps-releases).

##### Preview upcoming new features of Monthly Enterprise Channel

There is no dedicated preview channel for Monthly Enterprise Channel, like there is for Current Channel and for Semi-Annual Enterprise Channel.

To become familiar with the new features in a monthly feature release of Monthly Enterprise Channel, you can have a representative sample of users in your organization download and start using the new version as soon as it becomes available on the Office CDN. Then, let the new version roll out to the remainder of your organization over the course of several days as Office automatically becomes aware that a new version is available on the Office CDN.

If you're thinking of using Current Channel as your preview channel, be aware that new features you see in Current Channel aren’t necessarily the same new features you’ll see in the next monthly feature update for Monthly Enterprise Channel. That’s because Current Channel can contain new features that are only available to a subset of users as the feature is gradually rolled out. Monthly Enterprise Channel will only contain features that have been completely rolled out in Current Channel. Therefore, a new feature that's available in Current Channel might not be available in Monthly Enterprise Channel for several months, because the feature is still being rolled out in Current Channel.

### Security updates for Monthly Enterprise Channel
If needed, security updates for Monthly Enterprise Channel are released on the second Tuesday of the month.

Security updates are cumulative. The most current release of Monthly Enterprise Channel includes the security updates from previous releases of Monthly Enterprise Channel. 

Separate downloads of just security updates for Monthly Enterprise Channel aren’t available. Also, new security updates aren’t provided for versions of Monthly Enterprise Channel that are no longer supported.

For a list of security updates included in a given release of Monthly Enterprise Channel, see [Release notes for Microsoft 365 Apps Security Updates](https://docs.microsoft.com/officeupdates/microsoft365-apps-security-updates).

### Non-security updates for Monthly Enterprise Channel
If needed, non-security updates for Monthly Enterprise Channel are provided on the second Tuesday of the month. Non-security updates provide fixes for known issues and provide stability or performance improvements for Office. 

If there is a critical issue that needs to be fixed sooner, such as one related to data loss, we will provide an updated release with the fix, instead of waiting for the next scheduled monthly update.

Non-security updates are cumulative. The most current release of Monthly Enterprise Channel includes the non-security updates from previous releases of Monthly Enterprise Channel. 

Separate downloads of just non-security updates for Monthly Enterprise Channel aren’t available. Also, new non-security updates aren’t provided for versions of Monthly Enterprise Channel that are no longer supported.

For a list of non-security updates included in a given release of Monthly Enterprise Channel, see [Release notes for Microsoft 365 Apps releases](https://docs.microsoft.com/officeupdates/release-notes-microsoft365-apps#release-notes-for-microsoft-365-apps-releases). They are listed as “Resolved issues.”

### Support duration for Monthly Enterprise Channel
Any given version of Monthly Enterprise Channel is supported for two months. For example, the version of Monthly Enterprise Channel that is released on the second Tuesday of August is supported until the second Tuesday of October. 

At any given time, there are always two versions of Monthly Enterprise Channel that are supported. To see which versions of Monthly Enterprise Channel are currently supported, refer to the table at the top of [Update history for Microsoft 365 Apps](https://docs.microsoft.com/officeupdates/update-history-microsoft365-apps-by-date).

## Semi-Annual Enterprise Channel overview

We recommend Semi-Annual Enterprise Channel only for those select devices in your organization where extensive testing is needed before rolling out new Office features. For example, to comply with regulatory, governmental, or other organizational requirements. Or, in those cases where there are other reasons why your organization can’t provide your users with new Office features on a more frequent basis than twice a year.

Updates to Semi-Annual Enterprise Channel are released on the second Tuesday of the month. In January and July, the monthly update can include feature, security, and non-security updates. In other months, the update can include security and non-security updates.

### Feature updates for Semi-Annual Enterprise Channel
New, or updated, features are released in Semi-Annual Enterprise Channel twice a year, on the second Tuesday in January and July. New features aren’t added to Semi-Annual Enterprise Channel at any other time. Separate downloads of just feature updates for Semi-Annual Enterprise Channel aren’t available.

These new features are features that are already available to all users in Monthly Enterprise Channel. Features that are currently in Monthly Enterprise Channel need to meet certain release criteria before they are included in a feature update for Semi-Annual Enterprise Channel. Because of this, some features that are in Monthly Enterprise Channel aren’t included right away in the next available feature update for Semi-Annual Enterprise Channel.

For a list of feature updates included in a given release of Semi-Annual Enterprise Channel, see [Release notes for Microsoft 365 Apps releases](https://docs.microsoft.com/officeupdates/release-notes-microsoft365-apps#release-notes-for-microsoft-365-apps-releases).

#### Preview upcoming new features of Semi-Annual Enterprise Channel
To become familiar with the new features coming in the next feature release of Semi-Annual Enterprise Channel, we recommend that you use Semi-Annual Enterprise Channel (Preview).

Semi-Annual Enterprise Channel (Preview) is released with new features twice a year, on the second Tuesday in March and September. This provides you with four months before those same new features are released in Semi-Annual Enterprise Channel. Semi-Annual Enterprise Channel (Preview) also receives, if needed, security and non-security updates every month, on the second Tuesday of the month.

You should deploy Semi-Annual Enterprise Channel (Preview) to a small, representative sample of users in your organization. This can help you identify any possible issues for your organization before those new features are released more broadly to your users that have Semi-Annual Enterprise Channel.

We also encourage you to use Semi-Annual Enterprise Channel (Preview) so that you can identify any possible issues that you want us to fix in the four months before that version is released to Semi-Annual Enterprise Channel. Once a version is released to Semi-Annual Enterprise Channel, the approval process for non-security updates becomes even more rigorous.

### Security updates for Semi-Annual Enterprise Channel
If needed, security updates for Semi-Annual Enterprise Channel are released on the second Tuesday of the month. 

Security updates are cumulative. The most current release of Semi-Annual Enterprise Channel includes the security updates from previous releases of Semi-Annual Enterprise Channel. 

Separate downloads of just security updates for Semi-Annual Enterprise Channel aren’t available. Also, new security updates aren’t provided for versions of Semi-Annual Enterprise Channel that are no longer supported.

For a list of security updates included in a given release of Semi-Annual Enterprise Channel, see [Release notes for Microsoft 365 Apps Security Updates](https://docs.microsoft.com/officeupdates/microsoft365-apps-security-updates).

### Non-security updates for Semi-Annual Enterprise Channel
If needed, non-security updates for Semi-Annual Enterprise Channel are provided on the second Tuesday of the month. Non-security updates provide fixes for known issues and provide stability or performance improvements for Office.

If there is a critical issue that needs to be fixed sooner, such as one related to data loss, we will provide an updated release with the fix, instead of waiting for the next scheduled monthly update.

We tend to provide fewer non-security updates for Semi-Annual Enterprise Channel than the other update channels. In part, that’s because most issues are identified, thanks to customer feedback, and fixed when the features are rolled out earlier in the other update channels, such as Current Channel and Monthly Enterprise Channel. Also, many customers have asked us to provide an update channel that doesn’t change often, because changes could require them to do another round of compliance testing. So, before we approve the release of any non-security updates to Semi-Annual Enterprise Channel, we carefully assess the impact of introducing the change to the update channel. Critical issues that result in data loss, or significantly affect a large number of customers using Semi-Annual Enterprise Channel, are likely to be approved. We also encourage you to use Semi-Annual Enterprise Channel (Preview), so that you can identify any possible issues you want us to fix in the four months before that version is released to Semi-Annual Enterprise Channel.

Non-security updates are cumulative. The most current release of Semi-Annual Enterprise Channel includes the non-security updates from previous releases of Semi-Annual Enterprise Channel.

Separate downloads of just non-security updates for Semi-Annual Enterprise Channel aren’t available. Also, new non-security updates aren’t provided for versions of Semi-Annual Enterprise Channel that are no longer supported.

For a list of non-security updates included in a given release of Semi-Annual Enterprise Channel, see [Release notes for Microsoft 365 Apps releases](https://docs.microsoft.com/officeupdates/release-notes-microsoft365-apps#release-notes-for-microsoft-365-apps-releases). They are listed as “Resolved issues.”

### Support duration for Semi-Annual Enterprise Channel
Any given version of Semi-Annual Enterprise Channel is supported for fourteen months. This means that the new version of Semi-Annual Enterprise Channel that is released in January is supported until March of the following year, and the July release is supported until September of the following year.

At any given time, there are always two versions of Semi-Annual Enterprise Channel that are supported. To see which versions of Semi-Annual Enterprise Channel are currently supported, refer to the table at the top of [Update history for Microsoft 365 Apps](https://docs.microsoft.com/officeupdates/update-history-microsoft365-apps-by-date).

The longer support duration for Semi-Annual Enterprise Channel is intended to provide more time and flexibility for those organizations that have devices that require extensive testing before rolling out new Office features. For example, in those cases where organizations have to comply with specific regulatory, governmental, or other organizational requirements. The longer support duration gives these organizations the ability to deploy new features only once a year if needed. 

## How to configure and manage update channels

Update channels are device-specific and apply only to installations of Office on devices running Windows. The choice of an update channel for a device is not a setting that follows the user from device to device. For example, if a user works on different devices running Windows, those devices could be configured to use different update channels. That means the user could have access to different Office features depending on which device they’re using.

Also, you can only configure one update channel for a device. For example, if you’re installing Office, Project, and Visio on the same device, they all must use the same update channel. You can’t have a mix of update channels on the same device.

Not all devices in your organization have to be configured with the same update channel. For example, IT staff and application developers might be on Current Channel (Preview), so that they can try out upcoming new Office features, while the rest of the organization is on Monthly Enterprise Channel. If you decide to implement different update channels within your organization, keep in mind that groups of users might have access to different features depending on which update channel they’re on, which might make collaborating between groups of users more difficult.

### Default update channel

Each subscription product is configured with a default update channel. If you don’t specify the update channel when you install the product by itself on a device, the product will be configured to use the default update channel.

Current Channel is the default update channel for most subscription products, such as Microsoft 365 Apps for business and the subscription versions of the Project and Visio desktop apps. The exception is Microsoft 365 Apps for enterprise, which uses Semi-Annual Enterprise Channel as the default update channel.

But, starting on June 9, 2020, Current Channel will become the default channel for Microsoft 365 Apps for enterprise in most cases. For more information, see [Change to the default update channel for Microsoft 365 Apps for enterprise](update-channels-changes.md#change-to-the-default-update-channel-for-microsoft-365-apps-for-enterprise).

### Configure the update channel

#### Office Deployment Tool  
You can use the [Office Deployment Tool](overview-office-deployment-tool.md) and specify the Channel attribute in your configuration file. There is a Channel attribute available in the Add element and in the Updates element. For more information, see [Configuration options for the Office Deployment Tool](office-deployment-tool-configuration-options.md).

#### Group Policy  
You can [download](https://www.microsoft.com/download/details.aspx?id=49030) the Administrative Template files (ADMX/ADML) and enable the Update Channel policy setting. When you enable the policy setting, you can select the appropriate update channel from a drop-down list. You can find this policy setting under Computer Configuration\Policies\Administrative Templates\Microsoft Office 2016 (Machine)\Updates.

#### Microsoft 365 admin center 
If you allow your users to install Office for themselves from the portal, you can specify which update channel they install. To do that, sign in to the Microsoft 365 admin center with your admin account, go to **Show all** > **Settings** > **Settings** > **Services** > **Office software download settings**, and then choose the appropriate update channel for your users. This setting applies to all users in your tenant and only applies to users that install Office for themselves from the portal.

### Manage the update channel
After Office is installed, you can change the update channel for a device. For more information on how to do that, see [Change the Microsoft 365 Apps update channel for devices in your organization](change-update-channels.md). Keep in mind that if you change the update channel for the device, the features that the user has access to will change. For example, if you move the device from Current Channel to Semi-Annual Enterprise Channel, the user might lose access to features that they’ve been using, because those features aren’t available yet in Semi-Annual Enterprise Channel.

## Additional information about update channels for Microsoft 365 Apps

### Other products
- These update channels also apply to the subscription versions of the Project and Visio desktop apps. For example, if you have Project Plan 3 or Visio Plan 2.
- If you're deploying Office Professional Plus 2019 or Office Standard 2019, which are volume licensed versions of Office, there is a different update channel you need to use. For more information, see [Update channel for Office 2019](office2019/update.md#update-channel-for-office-2019).

### Managing updates
- To simplify managing updates, especially for Current Channel and Monthly Enterprise Channel, we recommend that you configure devices to receive updates directly from the Office Content Delivery Network (CDN) on the internet.
- If you configure devices to get updates directly from the Office CDN, and those devices are running Windows 10, you can take advantage of [Delivery Optimization](delivery-optimization.md) to help reduce network bandwidth utilization. 
- When we make a new release available on the Office CDN, we gradually advertise the availability of this release over a period of several days to devices worldwide that have Office installed. This way not all devices in your organization will try to access the Office CDN at the same time to download the new release, which could possibly cause network bandwidth utilization issues.
- For examples of approximate update sizes when updating from a recent release to the most current release of an update channel, see [Download sizes for updates to Microsoft 365 Apps](https://docs.microsoft.com/officeupdates/download-sizes-microsoft365-apps-updates).
- If you use Microsoft Endpoint Configuration Manager, you can manage updates for these update channels by using the Software Update management workflow. For more information, see [Manage updates to Microsoft 365 Apps with Microsoft Endpoint Configuration Manager](manage-microsoft-365-apps-updates-configuration-manager.md).

### Version and build information
- To see the update channel that Office is configured for, open an Office app, such as Word, and go to **File** > **Account**. The name of the update channel appears in the **Product Information** section under the **About** heading. The version and build number for the update channel are also shown there.
- When an update channel release contains feature updates, the version number is updated. For example, from Version 2004 to Version 2005. If a release contains only new security updates or new non-security updates, then only the build number gets updated and the version number remains the same.

### Support duration for other update channels
- Any given version of Current Channel (Preview) is supported only until the next version of Current Channel (Preview) is released, which is usually every month.  For example, Version 2004 is supported until Version 2005 is released.
- Any given version of Semi-Annual Enterprise Channel (Preview) is supported for only six months. This coincides with how often Semi-Annual Enterprise Channel (Preview) is updated with new features. For example, the version of Semi-Annual Enterprise Channel (Preview) that is released in March with new features is supported until September, which is the next time new features are released in Semi-Annual Enterprise Channel (Preview). The September release is supported until the following March.  To see what version of Semi-Annual Enterprise Channel (Preview) is currently supported, refer to the table at the top of [Update history for Microsoft 365 Apps](https://docs.microsoft.com/officeupdates/update-history-microsoft365-apps-by-date). 

### Office Insider program
- The Office Insider program gives you early access to Office features through these update channels: Beta Channel and Current Channel (Preview). For more information, see [Office Insider for Business](https://insider.office.com/business).
- Beta Channel, which was previously named Insider (and sometimes referred to as Insider Fast), provides access to new features even before they are available in Current Channel (Preview). But, Beta Channel is ***not*** supported so should only be used in test environments and by a small group of select users, such as IT staff or application developers.