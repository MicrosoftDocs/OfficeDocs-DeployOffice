---
title: "Plan your upgrade from Office 365 ProPlus 2013 to 2016"
ms.author: danbrown
author: DHB-MSFT
manager: laurawi
ms.date: 1/9/2018
ms.audience: ITPro
ms.topic: get-started-article
ms.service: o365-proplus-itpro
localization_priority: Priority
ms.collection:
- Ent_O365
- Strat_O365_ProPlus
ms.custom: Ent_Office_ProPlus
ms.assetid: 733ff07f-8137-46e6-9904-70f59d716f6f
description: "Office 2016 is the latest version of Microsoft's productivity apps, such as Word, PowerPoint, Excel, and Microsoft Outlook. You can provide the Office 365 ProPlus users in your organization with the new and enhanced features of Office 2016 by upgrading those users from the Office 2013 version of Office 365 ProPlus to the Office 2016 version."
---

# Plan your upgrade from Office 365 ProPlus 2013 to 2016

Office 2016 is the latest version of Microsoft's productivity apps, such as Word, PowerPoint, Excel, and Microsoft Outlook. You can provide the Office 365 ProPlus users in your organization with the new and enhanced features of Office 2016 by upgrading those users from the Office 2013 version of Office 365 ProPlus to the Office 2016 version.
  
> [!IMPORTANT]
> Support for the Office 2013 version of Office 365 ProPlus ended on February 28, 2017. For more information, see Microsoft Knowledge Base (KB) article [3199744.](https://support.microsoft.com/kb/3199744)
  
Before you upgrade your users to the Office 2016 version, we recommend that you review the following information so that you can develop a plan of how best to upgrade your existing Office 365 ProPlus installations. Some of the key steps in the planning process include the following:
  
- [Review the system requirements](plan-your-upgrade-from-office-365-proplus-2013-to-2016.md#BKMK_SysReqs)
    
- [Determine which update channel to use](plan-your-upgrade-from-office-365-proplus-2013-to-2016.md#BKMK_Channel)
    
- [Download the latest version of the Office Deployment Tool](plan-your-upgrade-from-office-365-proplus-2013-to-2016.md#BKMK_ODT)
    
- [Copy existing Group Policy settings](plan-your-upgrade-from-office-365-proplus-2013-to-2016.md#BKMK_GP)
    
- [Review the network bandwidth implications](plan-your-upgrade-from-office-365-proplus-2013-to-2016.md#BKMK_Bandwidth)
    
- [Understand how long you can continue to use the Office 2013 version](plan-your-upgrade-from-office-365-proplus-2013-to-2016.md#BKMK_Office2013)
    
- [Understand when upgrades will occur](plan-your-upgrade-from-office-365-proplus-2013-to-2016.md#BKMK_WhenUpdates)
    
- [Prepare to support additional languages](plan-your-upgrade-from-office-365-proplus-2013-to-2016.md#BKMK_Languages)
    
<a name="BKMK_SysReqs"> </a>
## Review the system requirements for Office 365 ProPlus

With any new software release, you should [review the system requirements](https://products.office.com/office-system-requirements) to ensure that your computers meet those requirements. For example, for Office 2016, the minimum requirement is now 2 GB of RAM.
  
Another important change to be aware of is that Outlook 2016 doesn't support connecting to Exchange Server 2007.
 
<a name="BKMK_Channel"> </a> 
## Determine which update channel to use for Office 365 ProPlus

In Office 2016, you can control how fast your users receive feature updates to Office 365 ProPlus. One choice is a monthly update to Office 365 ProPlus, which can contain new or updated features, security updates, and non-security updates, such as updates that provide stability or performance improvements for Office. This is called the Monthly Channel release.
  
If your organization doesn't want to deploy the latest features of Office right away or you have a significant number of line-of-business applications, add-ins, or macros that you need to test with Office, then Semi-Annual Channel might be the better choice for your organization. That's because new features are made available to Semi-Annual Channel only twice a year, in January and July, instead of every month. Semi-Annual Channel is the default update channel for Office 365 ProPlus.
  
To help your organization prepare for a Semi-Annual Channel release, Microsoft provides Semi-Annual Channel (Targeted). This update channel is provided approximately four months before the availability of the next Semi-Annual Channel. The primary purpose of this update channel is to give pilot users and application compatibility testers in your organization a chance to work with the upcoming Semi-Annual Channel release. During this time, you might identify possible issues that you need to fix with your line-of-business applications, add-ins, or macros or that you want Microsoft to fix.
  
For more information, see [Overview of update channels for Office 365 ProPlus](overview-of-update-channels-for-office-365-proplus.md).
 
<a name="BKMK_ODT"> </a> 
## Download the latest Office Deployment Tool to deploy Office 365 ProPlus

In order to support new deployment capabilities available for the Office 2016 version of Office 365 ProPlus, there is a new version of the Office Deployment Tool. You can [download this new version](http://go.microsoft.com/fwlink/p/?LinkID=626065) from the Microsoft Download Center. The configuration.xml file used by the latest Office Deployment Tool supports new settings that allow you to configure the following:
  
- Which update channel to use
    
- Which language accessory packs to install
    
Also, be aware that the new version of the Office Deployment Tool can't be used to deploy the Office 2013 version of Office 365 ProPlus. You can continue to [use the previous version of the Office Deployment Tool](http://www.microsoft.com/download/details.aspx?id=36778) for those deployments.
 
<a name="BKMK_GP"> </a>
## Copy existing Group Policy settings for Office 365 ProPlus

As with any new version of Office, there is a new set of Administrative Template files (ADMX/ADML) for Group Policy settings. You can [download the Administrative Template files](https://www.microsoft.com/download/details.aspx?id=49030) from the Microsoft Download Center.
  
We've added some new settings, but maintained most of the existing Group Policy settings to help minimize changes you need to make. However, the registry location for the Group Policy settings has changed, so you need to copy your existing Group Policy settings to account for this change. All Group Policy settings for Office are now located in HKEY_LOCAL_MACHINE\\SOFTWARE\\Policies\\Microsoft\\Office\\16.0 and HKEY_CURRENT_USER\\SOFTWARE\\Policies\\Microsoft\\Office\\16.0, where 16.0 is the designation for Office 2016. For Office 2013, the Group Policy settings are located in keys named 15.0.
 
<a name="BKMK_Bandwidth"> </a> 
## Review the network bandwidth implications of upgrading Office 365 ProPlus

The installation files for Office 365 ProPlus are approximately 850 mb for the core files plus approximately 200 mb for each language deployed. Because of the underlying changes between the Office 2013 and Office 2016 versions of Office 365 ProPlus, the upgrade process takes longer and requires the entire Office 2016 build to be downloaded to users' computers. This will affect network bandwidth and is something that should be considered as part of your upgrade plan.
  
<a name="BKMK_Office2013"> </a>
## Understand how long you can continue to use the Office 2013 version of Office 365 ProPlus

Support for the Office 2013 version of Office 365 ProPlus ended on February 28, 2017. Therefore, we recommend that you upgrade to the Office 2016 version of Office 365 ProPlus as soon as possible. For more information, see Microsoft Knowledge Base (KB) article [3199744](https://support.microsoft.com/kb/3199744).
  
If you choose to continue to deploy the Office 2013 version of Office 365 ProPlus, you need to do the following:
  
- Continue to use the [Office 2013 version of the Office Deployment Tool](http://www.microsoft.com/download/details.aspx?id=36778).
    
- Make sure that your users' computers are configured to get updates from a location on your internal network. You can configure this either by using the Office Deployment Tool or by using Group Policy and the **Update Path** policy setting,
 
<a name="BKMK_WhenUpdates"> </a>
## Understand when upgrades to Office 365 ProPlus will occur

The way that the users in your organization receive the upgrade to Office 2016 depends on where you've configured Office 365 ProPlus to get updates.
  
- **From the Internet** If you've configured your users to get updates directly from the Office Content Delivery Network (CDN) on the Internet, the upgrade to Office 2016 will occur based on this [schedule](upgrade-from-office-365-proplus-2013-to-2016.md#BKMK_Key). At that time, the Office 2016 files will be automatically downloaded to users' computers and the upgrade of Office 365 ProPlus will occur. For more information about the upgrade, [read this overview](overview-of-the-upgrade-of-office-365-proplus-to-the-office-2016-version.md).
    
    If you don't want these users to be upgraded, configure them to get updates from a location on your internal network. You can configure this either by using the Office Deployment Tool or by using Group Policy and the **Update Path** policy setting.
    
- **From a location on your internal network** If you've configured your users to get updates from a location on your internal network, then the upgrade to Office 2016 is under your control. When you're ready to upgrade your users, use the [Office 2016 version of the Office Deployment Tool](http://go.microsoft.com/fwlink/p/?LinkID=626065) to download the Office 2016 version of Office 365 ProPlus. Then, you'll need to use the Office Deployment Tool to install the Office 2016 version to your users. Just copying the Office 2016 files to the update location on your internal network isn't enough. You need to initiate the installation with the Office Deployment Tool to get Office 365 ProPlus to upgrade to the Office 2016 version. If you had certain configuration settings implemented for your 2013 installation, such as excluding certain apps from being installed or enabling shared computer activation, be sure that your configuration.xml file for the 2016 installation includes those same configuration settings.
 
<a name="BKMK_Languages"> </a>   
## Prepare to support additional languages with Office 365 ProPlus

There is a change to the way additional languages are deployed in the Office 2016 version of Office 365 ProPlus. Previously, in Office, you could deploy an MSI-based language pack after you installed Office 365 ProPlus, even though those language packs weren't specifically designed to be used with Office 365 ProPlus. In Office 2016, using those language packs is no longer supported.
  
Instead, with Office 2016, you install [language accessory packs](https://support.office.com/article/82ee1236-0f9a-45ee-9c72-05b026ee809f.aspx) after you've deployed Office 365 ProPlus in one of its 40 base languages.
  
There are two ways to install language accessory packs:
  
- Have your users download and install the language accessory packs that they need. There will be a link on the **Software** page in the Office 365 portal to the language accessory packs.
    
- Use the Office Deployment Tool to deploy the appropriate language accessory packs to your users
    
You can't just install a language accessory pack by itself. It needs to be installed along with or after Office 365 ProPlus has been installed in one of the 40 base languages.
 
<a name="BKMK_Additional"> </a>
## Additional planning considerations for upgrading Office 365 ProPlus

The following are some additional considerations that you may need to take into account as you develop your plan to upgrade the users in your organization to the Office 2016 version of Office 365 ProPlus.
 
<a name="BKMK_SidebySide"> </a>
### Support policy for installing other versions of Office side-by-side with Office 365 ProPlus

You can't have the Office 2013 and the Office 2016 version of Office 365 ProPlus installed on the same computer. Also, you can't have a volume licensed version of Office 2016 installed on the same computer as the Office 2016 version of Office 365 ProPlus.
 
<a name="BKMK_VisioProject"> </a>
### Visio and Project versions that can be installed on the same computer with Office 365 ProPlus


If there is a 2013 version of Visio Pro for Office 365 or Project Online Desktop Client installed on the computer when you upgrade Office 365 ProPlus to the Office 2016 version, those versions of Visio and Project are removed from the computer. You won't be able to reinstall them after the Office 365 ProPlus installation finishes. However, you can install the 2016 versions of Visio Pro for Office 365 and Project Online Desktop Client on the same computer with the Office 2016 version of Office 365 ProPlus.

If you have a volume licensed version of Visio 2016 or Project 2016 that uses the Windows Installer (MSI) installation technology, that version can't be installed on the same computer as the Office 2016 version of Office 365 ProPlus, which uses the Click-to-Run installation technology. But, you can use the Office Deployment Tool to install a volume licensed version of Visio 2016 or Project 2016 that uses the Click-to-Run installation technology. For more information, see [Use the Office Deployment Tool to install volume licensed editions of Visio 2016 and Project 2016](use-the-office-deployment-tool-to-install-volume-licensed-editions-of-visio-2016.md).
  
> [!IMPORTANT]
> If you have installed a volume licensed version of Visio 2013 or Project 2013 using the Windows Installer (MSI) installation technology, it won't be removed from the computer during the upgrade of Office 365 ProPlus. You can continue to use the volume licensed version of Visio 2013 or Project 2013 on the computer with the Office 2016 version of Office 365 ProPlus. 

<a name="BKMK_InfoPath"> </a>
### Removal of InfoPath from Office 365 ProPlus

[InfoPath 2013 remains the current version](https://blogs.office.com/2014/01/31/update-on-infopath-and-sharepoint-forms/) and therefore won't be included in the Office 2016 version of Office 365 ProPlus. When you upgrade an existing installation of Office 365 ProPlus to the Office 2016 version, InfoPath is removed from the computer. If your users still need to use InfoPath, the previous version will be available for installation on the **Software** page in the Office 365 portal.
 

## Related topics


[What's new: Deploying Office 365 ProPlus in the enterprise](what-s-new-deploying-office-365-proplus-in-the-enterprise.md)
  
[Project 2016 - Deployment Guide for Admins](https://technet.microsoft.com/library/mt599788%28v=office.16%29.aspx)
  
[Visio 2016 - Deployment Guide for Admins](https://technet.microsoft.com/library/mt599789%28v=office.16%29.aspx)
  
[Supported scenarios for installing different versions of Office, Visio, and Project on the same computer](https://technet.microsoft.com/library/mt712177%28v=office.16%29.aspx)
  

