---
title: "Delivery Optimization and Office 365 ProPlus"
ms.author: danbrown
author: DHB-MSFT
manager: laurawi
audience: ITPro
ms.topic: article
ms.service: o365-proplus-itpro
localization_priority: Normal
ms.collection: Ent_O365
ms.custom: Ent_Office_ProPlus
description: "Provides Office admins with information about using Delivery Optimization to reduce network bandwidth when installing or updating Office 365 ProPlus."
---

# Delivery Optimization and Office 365 ProPlus

> [!IMPORTANT]
> Office 365 ProPlus is being renamed to **Microsoft 365 Apps for enterprise**. To learn more about this name change, [read this blog post](https://go.microsoft.com/fwlink/p/?linkid=2120533). 
>
> For details of when this change takes effect, and what actions admins might need to take, [read this article](name-change.md).

Delivery Optimization is a peer-to-peer distribution technology available in Windows 10 that allows devices to share content, such as updates, that the devices have downloaded from Microsoft over the internet. This can help reduce network bandwidth because a device can get portions of the update from another device on its local network instead of having to download the update completely from Microsoft.

Office 365 ProPlus on devices running Windows 10 can take advantage of Delivery Optimization during installation and when receiving updates, if certain [requirements](#requirements-for-using-delivery-optimization-with-office-365-proplus) are met.

Delivery Optimization can be an effective way to reduce network bandwidth without the need for additional infrastructure or administrative overhead, especially for those organizations that don't have Microsoft Endpoint Configuration Manager (current branch) or other enterprise software distribution tools, or that want to shift content handling from on-premises to the cloud.

## Overview of Delivery Optimization

For more information about Delivery Optimization in Windows 10, see the following information. Even though the information primarily covers Windows 10 updates, the concepts and configuration are similar for Office 365 ProPlus since Office uses the capabilities of Delivery Optimization provided by Windows 10.

- [Delivery Optimization for Windows 10 updates](https://docs.microsoft.com/windows/deployment/update/waas-delivery-optimization)
- [Set up Delivery Optimization for Windows 10 updates](https://docs.microsoft.com/windows/deployment/update/waas-delivery-optimization-setup)
- [Delivery Optimization reference](https://docs.microsoft.com/windows/deployment/update/waas-delivery-optimization-reference)
- [Delivery Optimization: Scenarios and configuration options](https://techcommunity.microsoft.com/t5/Windows-IT-Pro-Blog/Delivery-Optimization-Scenarios-and-configuration-options/ba-p/280195)
- [Delivery Optimization deep dive: How to reduce internet bandwidth impact on your network (Ignite 2018 presentation)](https://www.youtube.com/watch?v=o0C2j7msdCE)
- [Delivery Optimization - a deep dive (Ignite 2017 presentation)](https://channel9.msdn.com/Events/Ignite/Microsoft-Ignite-Orlando-2017/BRK2048)


## Requirements for using Delivery Optimization with Office 365 ProPlus

To use Delivery Optimization with Office 365 ProPlus, the device must be running at least Version 1709 of Windows 10.

In addition, the following are requirements for Office 365 ProPlus:

- At least Version 1808 for background updates
- At least Version 1908 for installing or for user-initiated updates
- Configured to be installed from or to receive updates directly from the Office Content Delivery Network (CDN) on the internet

By user-initiated updates, we're referring to when the user goes to **File** > **Account** in an Office app, such as Word, and then chooses **Update Options** > **Update Now**. Otherwise, Click-to-Run tries to automatically download and install updates for Office 365 ProPlus in the background without any prompting from the user.


## Configure Office 365 ProPlus to use Delivery Optimization

Delivery Optimization is enabled by default on devices running the Windows 10 Enterprise or Windows 10 Education editions. Therefore, there isn't anything additional you need to do for Office 365 ProPlus to start taking advantage of Delivery Optimization for background updates.

To use Delivery Optimization for background updates of Office 365 ProPlus, there is no additional configuration needed.

To take advantage of Delivery Optimization when installing or when doing user-initiated updates, do the following:
- For Version 1912 or later of Office 365 ProPlus, no additional configuration is needed.
- For Version 1908 through Version 1911, you need to configure a registry key on devices in your organization before installing Office 365 ProPlus on those devices. You can use the following [reg add](https://docs.microsoft.com/windows-server/administration/windows-commands/reg-add) command to configure the registry key:  
<br/> `reg add HKLM\SOFTWARE\Policies\Microsoft\office\16.0\common\officeupdate  /v SetDOAsPrimary /t REG_DWORD /d 1`

> [!NOTE]
> - Version 1912 is available in Monthly Channel as of January 8, 2020.
> - Version 2002 is scheduled to be available in Semi-Annual Channel (Targeted) in March 2020 and in Semi-Annual Channel in July 2020. Version 2002 or later won't require the registry key.

If you're using Configuration Manager or local network shares to manage installing and updating Office 365 ProPlus on devices, Delivery Optimization won't be used. Delivery Optimization is used only if you're installing or updating Office 365 ProPlus directly from the Office Content Delivery Network (CDN) on the internet. If you want some of these devices, such as those on Monthly Channel, to take advantage of Delivery Optimization, you need to reconfigure them to use the Office CDN. You can do that by using the Office Deployment Tool or Group Policy settings, depending how your environment is configured. You have to remove any configuration of the update path as well as the use of the [OfficeMgmtCOM](configuration-options-for-the-office-2016-deployment-tool.md#officemgmtcom-attribute-part-of-add-element) attribute, which enables Configuration Manager to manage updates.

## Configure Delivery Optimization settings for Office 365 ProPlus

There are some settings that you can configure to allow your environment to take better advantage of Delivery Optimization.  For example, you should choose the appropriate [download mode](https://docs.microsoft.com/windows/deployment/update/waas-delivery-optimization-reference#download-mode) for your environment. The download mode defines how devices determine whether other devices are suitable peers. Here are some recommendations for download mode:

- If you're using Microsoft Endpoint Configuration Manager (current branch) in your environment, you should consider using *Group (2)* for the download mode and use boundary groups for the GroupID. If you do this, Delivery Optimization uses the existing information about which devices are in the same [boundary group](https://docs.microsoft.com/configmgr/core/plan-design/hierarchy/fundamental-concepts-for-content-management#delivery-optimization) and consider all of them to be peers. This can save you from having to define new peer groups for Delivery Optimization to use.
- If you're not using Configuration Manager, you can still use *Group (2)* for download mode. This uses the Active Directory site to determine which devices should be considered as peers.
- If you're not using Active Directory, consider using *LAN (1)* for the download mode.

There are a few other settings that have specific implications for Office 365 ProPlus:

- [Minimum Peer Caching Content File Size](https://docs.microsoft.com/windows/deployment/update/waas-delivery-optimization-reference#minimum-peer-caching-content-file-size): Updates for Office 365 ProPlus contain files which are as small as 1 megabyte. To maximize the effectiveness of Delivery Optimization you can reduce value of this setting down to its minimum.
- [Delay background download from http (in secs)](https://docs.microsoft.com/windows/deployment/update/waas-delivery-optimization-reference#delay-background-download-from-http-in-secs) and [Delay foreground download from http (in secs)](https://docs.microsoft.com/windows/deployment/update/waas-delivery-optimization-reference#delay-foreground-download-from-http-in-secs):  A higher value for these settings allows devices to search longer for peers, but it also increases the time needed for an update. For background updates, users aren't likely to be impacted. But if you set this to 5 minutes and do a user-initiated update, the update might take up to 5 minutes longer due to the search for peer devices. Take this into consideration during testing or troubleshooting.

Delivery Optimization also handles how the devices download content from the HTTP source, such as from the Office CDN, and not just between the devices. In those cases, there are settings available to throttle bandwidth, which can be useful in sites with constrained bandwidth. There are several settings available, including the following:

- [Maximum Download Bandwidth](https://docs.microsoft.com/windows/deployment/update/waas-delivery-optimization-reference#maximum-download-bandwidth) for a throttle based on an absolute value.
- [Maximum Background Download Bandwidth](https://docs.microsoft.com/windows/deployment/update/waas-delivery-optimization-reference#maximum-background-download-bandwidth) for a throttle based on a percentage.
- [Set Business Hours to Limit Background Download Bandwidth](https://docs.microsoft.com/windows/deployment/update/waas-delivery-optimization-reference#set-business-hours-to-limit-background-download-bandwidth) for a throttle based on the time of day.

For additional configuration options available for Delivery Optimization, see [Delivery Optimization reference](https://docs.microsoft.com/windows/deployment/update/waas-delivery-optimization-reference).


## Viewing data about the use of Delivery Optimization

On an individual device, you can go to **Settings** > **Update & Security** > **Delivery Optimization** > **Activity monitor**. You can also use PowerShell cmdlets. For more information about those cmdlets, see [Monitor Delivery Optimization](https://docs.microsoft.com/windows/deployment/update/waas-delivery-optimization-setup#monitor-delivery-optimization).

If your organization uses [Update Compliance](https://docs.microsoft.com/windows/deployment/update/update-compliance-monitor), a Delivery Optimization report is available. For more information, see [Delivery Optimization in Update Compliance](https://docs.microsoft.com/windows/deployment/update/update-compliance-delivery-optimization). 

Keep in mind that this information represents overall results for Delivery Optimization, not just from using Delivery Optimization for Office 365 ProPlus. For example, it might include information related to Windows 10 updates, depending how your environment is configured.  Also, you won't be able to get 100% of the content from peer devices.


## Additional information about Delivery Optimization and Office 365 ProPlus

- You can also take advantage of Delivery Optimization if you're using the [AllowCdnFallback](configuration-options-for-the-office-2016-deployment-tool.md#allowcdnfallback-attribute-part-of-add-element) attribute to allow devices to use the Office Content Delivery Network (CDN) on the internet as a source for installing additional language packs.
- If you're already using Configuration Manager (current branch) and [peer cache](https://docs.microsoft.com/configmgr/core/plan-design/hierarchy/client-peer-cache) to manage installing and updating Office 365 ProPlus, Delivery Optimization won't provide any added benefit for content coming from your on-premises infrastructure.
- You can also try using a Microsoft Connected Cache server, which is an application installed on Windows Server and can be used with distribution points in Configuration Manager (current branch). For more information, see [Microsoft Connected Cache in Configuration Manager](https://docs.microsoft.com/configmgr/core/plan-design/hierarchy/microsoft-connected-cache).
- Delivery Optimization can also be used with Office 365 Business and with subscription versions of Project and Visio. The same requirements listed above for Office 365 ProPlus apply.
- Volume licensed versions of Office 2019, such as Office Professional Plus 2019, can take advantage of Delivery Optimization, but only for background updates. Delivery Optimization isn't available for installing or for foreground updates. The same applies to volume licensed versions of Project 2019 and Visio 2019.
- If you're already using a 3rd party peer-to-peer solution along with Configuration Manager, Delivery Optimization isn't expected to cause any problems with that solution.