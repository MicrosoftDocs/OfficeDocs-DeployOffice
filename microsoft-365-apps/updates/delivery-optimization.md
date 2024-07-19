---
title: "Delivery Optimization and Microsoft 365 Apps"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: conceptual
ms.service: o365-proplus-itpro
ms.collection: Tier2
ms.localizationpriority: medium
recommendations: true
description: "Provides Office admins with information about using Delivery Optimization to reduce network bandwidth when installing or updating Microsoft 365 Apps."
ms.date: 03/01/2023
---

# Delivery Optimization and Microsoft 365 Apps

Delivery Optimization is a peer-to-peer distribution technology available in Windows 11 and Windows 10 that allows devices to share content, such as updates, that the devices have downloaded from Microsoft over the internet. This can help reduce network bandwidth because a device can get portions of the update from another device on its local network instead of having to download the update completely from Microsoft.

Microsoft 365 Apps on devices running Windows 11 or Windows 10 can take advantage of Delivery Optimization during installation and when receiving updates, if certain [requirements](#requirements-for-using-delivery-optimization-with-microsoft-365-apps) are met.

Delivery Optimization can be an effective way to reduce network bandwidth without the need for additional infrastructure or administrative overhead, especially for those organizations that don't have Microsoft Configuration Manager (current branch) or other enterprise software distribution tools, or that want to shift content handling from on-premises to the cloud.

## Overview of Delivery Optimization

For more information about Delivery Optimization in Windows, see the following information. Even though the information primarily covers Windows 10 updates, the concepts and configuration are similar for Microsoft 365 Apps since Office uses the capabilities of Delivery Optimization provided by Windows.

- [Delivery Optimization for Windows 10 updates](/windows/deployment/update/waas-delivery-optimization)
- [Set up Delivery Optimization for Windows 10 updates](/windows/deployment/update/waas-delivery-optimization-setup)
- [Delivery Optimization reference](/windows/deployment/update/waas-delivery-optimization-reference)
- [Delivery Optimization: Scenarios and configuration options](https://techcommunity.microsoft.com/t5/Windows-IT-Pro-Blog/Delivery-Optimization-Scenarios-and-configuration-options/ba-p/280195)
- [Delivery Optimization deep dive: How to reduce internet bandwidth impact on your network (Ignite 2018 presentation)](https://www.youtube.com/watch?v=o0C2j7msdCE)
- [Delivery Optimization - a deep dive (Ignite 2017 presentation)](https://channel9.msdn.com/Events/Ignite/Microsoft-Ignite-Orlando-2017/BRK2048)

## Requirements for using Delivery Optimization with Microsoft 365 Apps

The following requirements must be met to use Delivery Optimization with Microsoft 365 Apps.

- A supported version of Windows 11 or Windows 10 that is supported by Microsoft 365 Apps.
- At least Version 1912 of Microsoft 365 Apps.
- Microsoft 365 Apps is configured to be installed from or to receive updates directly from the Office Content Delivery Network (CDN) on the internet.

## Configure Microsoft 365 Apps to use Delivery Optimization

Microsoft 365 Apps can use Delivery Optimization during installation and for background or user-initiated (foreground) updates. By user-initiated updates, we're referring to when the user goes to **File** > **Account** in an Office app, such as Word, and then chooses **Update Options** > **Update Now**. Otherwise, Click-to-Run tries to automatically download and install updates for Microsoft 365 Apps in the background without any prompting from the user.

Delivery Optimization is enabled by default on devices running the Enterprise or Education editions of Windows. Therefore, there isn't anything more you need to do for Microsoft 365 Apps to start taking advantage of Delivery Optimization.

If you're using Configuration Manager or local network shares to manage installing and updating Microsoft 365 Apps on devices, Delivery Optimization won't be used. Delivery Optimization is used only if you're installing or updating Microsoft 365 Apps directly from the Office Content Delivery Network (CDN) on the internet. If you want some of these devices, such as those on Current Channel, to take advantage of Delivery Optimization, you need to reconfigure them to use the Office CDN. You can do that by using the Office Deployment Tool or Group Policy settings, depending how your environment is configured. You have to remove any configuration of the update path and the use of the [OfficeMgmtCOM](../deploy/office-deployment-tool-configuration-options.md#officemgmtcom-attribute-part-of-add-element) attribute, which enables Configuration Manager to manage updates.

## Configure Delivery Optimization settings for Microsoft 365 Apps

There are some settings that you can configure to allow your environment to take better advantage of Delivery Optimization.  For example, you should choose the appropriate [download mode](/windows/deployment/update/waas-delivery-optimization-reference#download-mode) for your environment. The download mode defines how devices determine whether other devices are suitable peers. Here are some recommendations for download mode:

- If you're using Microsoft Configuration Manager (current branch) in your environment, you should consider using *Group (2)* for the download mode and use boundary groups for the GroupID. If you do this, Delivery Optimization uses the existing information about which devices are in the same [boundary group](/mem/configmgr/core/plan-design/hierarchy/fundamental-concepts-for-content-management#delivery-optimization) and consider all of them to be peers. This can save you from having to define new peer groups for Delivery Optimization to use.
- If you're not using Configuration Manager, you can still use *Group (2)* for download mode. This uses the Active Directory site to determine which devices should be considered as peers.
- If you're not using Active Directory, consider using *LAN (1)* for the download mode.

There are a few other settings that have specific implications for Microsoft 365 Apps:

- [Minimum Peer Caching Content File Size](/windows/deployment/update/waas-delivery-optimization-reference#minimum-peer-caching-content-file-size): Updates for Microsoft 365 Apps contain files that are as small as 1 megabyte. To maximize the effectiveness of Delivery Optimization, you can reduce value of this setting down to its minimum.
- [Delay background download from http (in secs)](/windows/deployment/update/waas-delivery-optimization-reference#delay-background-download-from-http-in-secs) and [Delay foreground download from http (in secs)](/windows/deployment/update/waas-delivery-optimization-reference#delay-foreground-download-from-http-in-secs):  A higher value for these settings allows devices to search longer for peers, but it also increases the time needed for an update. For background updates, users aren't likely to be impacted. But if you set this to 5 minutes and do a user-initiated update, the update might take up to 5 minutes longer due to the search for peer devices. Take this into consideration during testing or troubleshooting.

Delivery Optimization also handles how the devices download content from the HTTP source, such as from the Office CDN, and not just between the devices. In those cases, there are settings available to throttle bandwidth, which can be useful in sites with constrained bandwidth. There are several settings available, including the following settings:

- [Maximum Download Bandwidth](/windows/deployment/update/waas-delivery-optimization-reference#maximum-download-bandwidth) for a throttle based on an absolute value.
- [Maximum Background Download Bandwidth](/windows/deployment/update/waas-delivery-optimization-reference#maximum-background-download-bandwidth) for a throttle based on a percentage.
- [Set Business Hours to Limit Background Download Bandwidth](/windows/deployment/update/waas-delivery-optimization-reference#set-business-hours-to-limit-background-download-bandwidth) for a throttle based on the time of day.

For additional configuration options available for Delivery Optimization, see [Delivery Optimization reference](/windows/deployment/update/waas-delivery-optimization-reference).

## Viewing data about the use of Delivery Optimization

On an individual device, you can go to **Settings** > **Update & Security** > **Delivery Optimization** > **Activity monitor**. You can also use PowerShell cmdlets. For more information about those cmdlets, see [Monitor Delivery Optimization](/windows/deployment/update/waas-delivery-optimization-setup#monitor-delivery-optimization).

If your organization uses [Update Compliance](/windows/deployment/update/update-compliance-monitor), a Delivery Optimization report is available. For more information, see [Delivery Optimization in Update Compliance](/windows/deployment/update/update-compliance-delivery-optimization).

Keep in mind that this information represents overall results for Delivery Optimization, not just from using Delivery Optimization for Microsoft 365 Apps. For example, it might include information related to Windows updates, depending how your environment is configured.  Also, you won't be able to get 100% of the content from peer devices.

## Additional information about Delivery Optimization and Microsoft 365 Apps

- You can also take advantage of Delivery Optimization if you're using the [AllowCdnFallback](../deploy/office-deployment-tool-configuration-options.md#allowcdnfallback-attribute-part-of-add-element) attribute to allow devices to use the Office Content Delivery Network (CDN) on the internet as a source for installing additional language packs.
- If you're already using Configuration Manager (current branch) and [peer cache](/mem/configmgr/core/plan-design/hierarchy/client-peer-cache) to manage installing and updating Microsoft 365 Apps, Delivery Optimization won't provide any added benefit for content coming from your on-premises infrastructure.
- You can also try using a Microsoft Connected Cache server, which is an application installed on Windows Server and can be used with distribution points in Configuration Manager (current branch). For more information, see [Microsoft Connected Cache in Configuration Manager](/mem/configmgr/core/plan-design/hierarchy/microsoft-connected-cache).
- Delivery Optimization can also be used with the subscription versions of the Project and Visio desktop apps. The same [requirements](#requirements-for-using-delivery-optimization-with-microsoft-365-apps) as for Microsoft 365 Apps apply.
- Office LTSC Professional Plus 2021 and Office LTSC Standard 2021 can take advantage of Delivery Optimization for installing, background updates, and user-initiated updates. The same applies to volume licensed versions of Project 2021 and Visio LTSC 2021.
- Volume licensed versions of Office 2019, such as Office Professional Plus 2019, can take advantage of Delivery Optimization, but only for background updates. Delivery Optimization isn't available for installing or for user-initiated updates. The same applies to volume licensed versions of Project 2019 and Visio 2019.
- If you're already using a third party peer-to-peer solution along with Configuration Manager, Delivery Optimization isn't expected to cause any problems with that solution.