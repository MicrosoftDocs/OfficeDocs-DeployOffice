---
title: "Delay receiving feature updates from Semi-Annual Channel for Office 365 ProPlus"
ms.author: danbrown
author: DHB-MSFT
manager: laurawi
ms.date: 1/9/2018
ms.audience: ITPro
ms.topic: get-started-article
ms.service: o365-proplus-itpro
localization_priority: Normal
ms.collection: Ent_O365
ms.custom: Ent_Office_ProPlus
ms.assetid: 42a703ac-618c-4cb1-bc29-3014de45692b

description: "Office 365 clients that get updates from Semi-Annual Channel, such as Office 365 ProPlus, receive new features for the Office 2016 apps a few times a year. If Office is configured to receive updates automatically from the Office Content Delivery Network (CDN), then you get these feature updates from Semi-Annual Channel automatically."
---

# Delay receiving feature updates from Semi-Annual Channel for Office 365 ProPlus

Office 365 clients that get updates from Semi-Annual Channel, such as Office 365 ProPlus, receive new features for the Office 2016 apps twice a year, in January and July. If Office is configured to receive updates automatically from the Office Content Delivery Network (CDN), then you get these feature updates from Semi-Annual Channel automatically.
  
> [!IMPORTANT]
> Starting with Version 1708, Deferred Channel is named Semi-Annual Channel. 
  
If you have a specific business need to delay receiving these feature updates from Semi-Annual Channel, you can configure Office to not receive these feature updates, but still receive the most current security updates.
  
For example, if you're currently using Version 1705 of Deferred Channel, which was released in September 2017, you can continue using it and getting security updates for it until July 2018. But, as of January 9, 2018, there's another version available from Semi-Annual Channel, Version 1708, which provides new features. Version 1708 is the default version for Semi-Annual Channel. If you don't specify which version you want, you get updated to Version 1708. Therefore, if you want to continue getting updates for Version 1705 of Deferred Channel, you have to specify that's the version you want. This will require you to perform some manual steps every month.
  
## Delay receiving feature updates from Semi-Annual Channel when using the Office Content Delivery Network (CDN)

To continue to get security updates for Version 1705 from the Office CDN, you need to do the following:
  
- Configure Office to get the latest build of Version 1705 of Deferred Channel from the Office CDN. As of January 9, 2018, the latest build is 8201.2217.
    
- On the second Tuesday of the following months - for example, on February 13, 2018 - refer to [this table](https://support.office.com/article/ae942449-1fca-4484-898b-a933ea23def7) to determine the latest build number for Version 1705. The second Tuesday of each month is when Microsoft releases a new build with security updates for Semi-Annual Channel.
    
- Once you have the latest build number, re-configure Office to get this latest build of Version 1705 of Deferred Channel.
    
To configure Office to update to a specific version, you can use either Group Policy or the Office Deployment Tool. Once the target version is set, Office attempts to update to that version the next time it looks for updates. 
  
The following table provides information about the relevant Group Policy and Office Deployment Tool settings. The table also includes the registry value that is set when you use Group Policy or the Office Deployment Tool. 
  
|**Configuration tool**|**Setting**|**Registry value and key**|**Additional information**|
|:-----|:-----|:-----|:-----|
|Group Policy  <br/> |Target Version  <br/> |Value: updatetargetversion  <br/> Key: HKEY_LOCAL_MACHINE\\SOFTWARE\\Policies\\Microsoft\\Office\\16.0\\Common\\OfficeUpdate  <br/> |You can find this policy setting under Computer Configuration\\Administrative Templates\\Microsoft Office 2016 (Machine)\\Updates.  <br/> <br/>If you use the Group Policy setting, its setting takes precedence over the setting configured by the Office Deployment Tool.  <br/> |
|Office Deployment Tool  <br/> |TargetVersion  <br/> |Value: updatetoversion  <br/> Key: HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Office\\ClickToRun\\Configuration  <br/> |You configure this attribute in the Updates element in the configuration.xml file. Your xml file should look something like the following example.  <br/> ```<Configuration>  <Updates Enabled="TRUE" TargetVersion="16.0.8201.2217" Channel="Deferred" /> </Configuration>```<br/>If you use the Office Deployment Tool, you need to re-run setup.exe, with your configuration.xml file, on each computer in order to update this setting.  <br/> |
   
On the second Tuesday of each month, until July 2018, you need to update the Group Policy setting or the configuration.xml with the latest build number for Version 1705 of Deferred Channel. For example, for January 2018, you specify the target version as 16.0.8201.2217.
  
Another possibility is to run the following command from an elevated command prompt:
  
```
C:\Program Files\Common Files\Microsoft Shared\ClickToRun\OfficeC2RClient.exe /update user updatetoversion="16.0.8201.2217"
```

When you run this command, Office looks at the configured update location, such as the Office CDN, and tries to update to the specified version. This update happens immediately, instead of waiting for the next time Office is scheduled to look for updates, which could be in a few days.
  
## Delay receiving feature updates from Semi-Annual Channel when using an internal network location

If you don't want to get updates from the Office CDN, you can use Group Policy or the Office Deployment Tool to specify the location for Office to look for updates. For example, every month you can use the Office Deployment Tool to download the latest build of Version 1705 of Deferred Channel to a file share on your local network. Then, you can use Group Policy or the Office Deployment Tool to configure Office to look at that file share for updates. For more information, see [Configure update settings for Office 365 ProPlus](configure-update-settings-for-office-365-proplus.md).
  
To download the latest build with the Office Deployment Tool, you need to configure both the Version and the Channel attributes in the Add element of the configuration.xml file.
  
##Related topics
[Update history for Office 365 ProPlus (listed by date)](https://docs.microsoft.com/officeupdates/update-history-office365-proplus-by-date)
  
[Overview of update channels for Office 365 ProPlus](overview-of-update-channels-for-office-365-proplus.md)
  
[Configuration options for the Office Deployment Tool](configuration-options-for-the-office-2016-deployment-tool.md)
  
[Release information for updates to Office 365 ProPlus](https://docs.microsoft.com/officeupdates/release-notes-office365-proplus)
  
[Download the Office Deployment Tool](http://go.microsoft.com/fwlink/p/?LinkID=626065)
  
[Download the Office 2016 Administrative Template files (ADMX/ADML) for Group Policy](https://www.microsoft.com/download/details.aspx?id=49030)

