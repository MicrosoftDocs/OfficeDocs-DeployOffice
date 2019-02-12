---
title: "Delay receiving feature updates from Semi-Annual Channel for Office 365 ProPlus"
ms.author: danbrown
author: DHB-MSFT
manager: laurawi
ms.audience: ITPro
ms.topic: reference
ms.service: o365-proplus-itpro
localization_priority: Normal
ms.collection: Ent_O365
ms.custom: Ent_Office_ProPlus
description: "Provides IT Pros with the steps to delay receiving feature updates from Semi-Annual Channel, but still receive the most current security updates for a supported version"
---

# Delay receiving feature updates from Semi-Annual Channel for Office 365 ProPlus

Office 365 clients that get updates from Semi-Annual Channel, such as Office 365 ProPlus, receive new features twice a year, in January and July. If Office is configured to receive updates automatically from the Office Content Delivery Network (CDN), then you get these feature updates from Semi-Annual Channel automatically.
  
> [!IMPORTANT]
> Starting with Version 1708, Deferred Channel is named Semi-Annual Channel. 
  
If you have a specific business need to delay receiving these feature updates from Semi-Annual Channel, you can configure Office to not receive these feature updates, but still receive the most current security updates. 
  
For example, if you're currently using Version 1708 of Semi-Annual Channel, which was released in January 2018, you can continue using it and getting security updates for it until March 2019. But, as of July 10, 2018, there's another version available from Semi-Annual Channel, Version 1803, which provides new features. Version 1803 is the default version for Semi-Annual Channel. If you don't specify which version you want, you get updated to Version 1803. Therefore, if you want to continue getting updates for Version 1708 of Semi-Annual Channel, you have to specify that's the version you want. This will require you to perform some manual steps every month.
  
## Delay receiving feature updates from Semi-Annual Channel when using the Office Content Delivery Network (CDN)

To continue to get security updates for Version 1708 from the Office CDN, you need to do the following:
  
- Configure Office to get the latest build of Version 1708 of Semi-Annual Channel from the Office CDN. As of July 10, 2018, the latest build is 8431.2280.
    
- On the second Tuesday of the following months - for example, on August 14, 2018 - refer to [this table](https://docs.microsoft.com/officeupdates/update-history-office365-proplus-by-date) to determine the latest build number for Version 1708. The second Tuesday of each month is when Microsoft releases a new build with security updates for Semi-Annual Channel.
    
- Once you have the latest build number, re-configure Office to get this latest build of Version 1708 of Semi-Annual Channel.
    
To configure Office to update to a specific version, you can use either Group Policy or the Office Deployment Tool. Once the target version is set, Office attempts to update to that version the next time it looks for updates. 
  
The following table provides information about the relevant Group Policy and Office Deployment Tool settings. The table also includes the registry value that is set when you use Group Policy or the Office Deployment Tool. 
  
|**Configuration tool**|**Setting**|**Registry value and key**|**Additional information**|
|:-----|:-----|:-----|:-----|
|Group Policy  <br/> |Target Version  <br/> |Value: updatetargetversion  <br/> Key: HKEY_LOCAL_MACHINE\\SOFTWARE\\Policies\\Microsoft\\Office\\16.0\\Common\\OfficeUpdate  <br/> |You can find this policy setting under Computer Configuration\\Administrative Templates\\Microsoft Office 2016 (Machine)\\Updates.  <br/> <br/>If you use the Group Policy setting, its setting takes precedence over the setting configured by the Office Deployment Tool.  <br/> |
|Office Deployment Tool  <br/> |TargetVersion  <br/> |Value: updatetoversion  <br/> Key: HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Office\\ClickToRun\\Configuration  <br/> |You configure this attribute in the Updates element in the configuration.xml file. Your xml file should look something like the following example.  <br/> ```<Configuration>  <Updates Enabled="TRUE" TargetVersion="16.0.8431.2280" Channel="Broad" /> </Configuration>```<br/>If you use the Office Deployment Tool, you need to re-run setup.exe, with your configuration.xml file, on each computer in order to update this setting.  <br/> |
   
On the second Tuesday of each month, until March 2019, you need to update the Group Policy setting or the configuration.xml with the latest build number for Version 1708 of Semi-Annual Channel. For example, for July 2018, you specify the target version as 16.0.8431.2280.
  
  
## Delay receiving feature updates from Semi-Annual Channel when using an internal network location

If you don't want to get updates from the Office CDN, you can use Group Policy or the Office Deployment Tool to specify the location for Office to look for updates. For example, every month you can use the Office Deployment Tool to download the latest build of Version 1708 of Semi-Annual Channel to a file share on your local network. Then, you can use Group Policy or the Office Deployment Tool to configure Office to look at that file share for updates. For more information, see [Configure update settings for Office 365 ProPlus](configure-update-settings-for-office-365-proplus.md).
  
To download the latest build with the Office Deployment Tool, you need to configure both the Version and the Channel attributes in the Add element of the configuration.xml file.
  
## Related topics
[Update history for Office 365 ProPlus (listed by date)](https://docs.microsoft.com/officeupdates/update-history-office365-proplus-by-date)
  
[Overview of update channels for Office 365 ProPlus](overview-of-update-channels-for-office-365-proplus.md)
  
[Configuration options for the Office Deployment Tool](configuration-options-for-the-office-2016-deployment-tool.md)
  
[Release information for updates to Office 365 ProPlus](https://docs.microsoft.com/officeupdates/release-notes-office365-proplus)
  
[Download the Office Deployment Tool](https://go.microsoft.com/fwlink/p/?LinkID=626065)
  
[Download the Group Policy Administrative Template files (ADMX/ADML) for Office](https://www.microsoft.com/download/details.aspx?id=49030)

