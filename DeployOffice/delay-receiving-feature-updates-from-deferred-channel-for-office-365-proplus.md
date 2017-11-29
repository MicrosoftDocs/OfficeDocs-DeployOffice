---
title: "Delay receiving feature updates from Deferred Channel for Office 365 ProPlus"
ms.author: danbrown
author: DHB-MSFT
manager: laurawi
ms.date: 9/12/2017
ms.audience: ITPro
ms.topic: get-started-article
ms.service: o365-administration
localization_priority: Once
ms.collection: Ent_O365
ms.custom: Ent_Office_ProPlus
ms.assetid: 42a703ac-618c-4cb1-bc29-3014de45692b

description: "Office 365 clients that get updates from Deferred Channel, such as Office 365 ProPlus, receive new features for the Office 2016 apps a few times a year. If Office is configured to receive updates automatically from the Office Content Delivery Network (CDN), then you get these feature updates from Deferred Channel automatically."
---

# Delay receiving feature updates from Deferred Channel for Office 365 ProPlus

Office 365 clients that get updates from Deferred Channel, such as Office 365 ProPlus, receive new features for the Office 2016 apps a few times a year. If Office is configured to receive updates automatically from the Office Content Delivery Network (CDN), then you get these feature updates from Deferred Channel automatically.
  
> [!IMPORTANT]
> The release cadence for Deferred Channel is changing. Starting in 2018, Deferred Channel will get new features every January and July. Also, Deferred Channel will be named Semi-Annual Channel. For more information, see [Overview of the upcoming changes to Office 365 ProPlus update management](overview-of-the-upcoming-changes-to-office-365-proplus-update-management.md). 
  
If you have a specific business need to delay receiving these feature updates from Deferred Channel, you can configure Office to not receive these feature updates, but still receive the most current security updates.
  
For example, if you're currently using Version 1701 of Deferred Channel, which was released in June 2017, you can continue using it and getting security updates for it until January 2018. But, as of September 12, 2017, there's another version available from Deferred Channel, Version 1705, which provides new features. Version 1705 is the default version for Deferred Channel. If you don't specify which version you want, you get updated to Version 1705. Therefore, if you want to continue getting updates for Version 1701 of Deferred Channel, you have to specify that's the version you want. This will require you to perform some manual steps every month.
  
## Delay receiving feature updates from Deferred Channel when using the Office Content Delivery Network (CDN)

To continue to get security updates for Version 1701 from the Office CDN, you need to do the following:
  
- Configure Office to get the latest build of Version 1701 of Deferred Channel from the Office CDN. As of September 12, 2017, the latest build is 7766.2116.
    
- On the second Tuesday of the following months - for example, on October 10, 2017 - refer to [this table](http://technet.microsoft.com/library/ae942449-1fca-4484-898b-a933ea23def7%28Office.14%29.aspx#BKMK_ByVersion) to determine the latest build number for Version 1701. The second Tuesday of each month is when Microsoft releases a new build with security updates for Deferred Channel.
    
- Once you have the latest build number, re-configure Office to get this latest build of Version 1701 of Deferred Channel.
    
To configure Office to update to a specific version, you can use either Group Policy or the Office Deployment Tool. Once the target version is set, Office attempts to update to that version the next time it looks for updates. 
  
The following table provides information about the relevant Group Policy and Office Deployment Tool settings. The table also includes the registry value that is set when you use Group Policy or the Office Deployment Tool. 
  
|**Configuration tool**|**Setting**|**Registry value and key**|**Additional information**|
|:-----|:-----|:-----|:-----|
|Group Policy  <br/> |Target Version  <br/> |Value: updatetargetversion  <br/> Key: HKEY_LOCAL_MACHINE\\SOFTWARE\\Policies\\Microsoft\\Office\\16.0\\Common\\OfficeUpdate  <br/> |You can find this policy setting under Computer Configuration\\Administrative Templates\\Microsoft Office 2016 (Machine)\\Updates.  <br/> If you use the Group Policy setting, its setting takes precedence over the setting configured by the Office Deployment Tool.  <br/> |
|Office Deployment Tool  <br/> |TargetVersion  <br/> |Value: updatetoversion  <br/> Key: HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Office\\ClickToRun\\Configuration  <br/> |You configure this attribute in the Updates element in the configuration.xml file.  <br/> Your xml file should look something like the following example.  <br/> ```<Configuration>  <Updates Enabled="TRUE" TargetVersion="16.0.7766.2116" Channel="Deferred" /> </Configuration>```If you use the Office Deployment Tool, you need to re-run setup.exe, with your configuration.xml file, on each computer in order to update this setting.  <br/> |
   
On the second Tuesday of each month, until January 2018, you need to update the Group Policy setting or the configuration.xml with the latest build number for Version 1701 of Deferred Channel. For example, for September 2017, you specify the target version as 16.0.7766.2116.
  
Another possibility is to run the following command from an elevated command prompt:
  
```
C:\\Program Files\\Common Files\\Microsoft Shared\\ClickToRun\\OfficeC2RClient.exe /update user updatetoversion="16.0.7766.2116"
```

When you run this command, Office looks at the configured update location, such as the Office CDN, and tries to update to the specified version. This update happens immediately, instead of waiting for the next time Office is scheduled to look for updates, which could be in a few days.
  
## Delay receiving feature updates from Deferred Channel when using an internal network location

If you don't want to get updates from the Office CDN, you can use Group Policy or the Office Deployment Tool to specify the location for Office to look for updates. For example, every month you can use the Office Deployment Tool to download the latest build of Version 1701 of Deferred Channel to a file share on your local network. Then, you can use Group Policy or the Office Deployment Tool to configure Office to look at that file share for updates. For more information, see [Configure update settings for Office 365 ProPlus](configure-update-settings-for-office-365-proplus.md).
  
To download the latest build with the Office Deployment Tool, you need to configure both the Version and the Channel attributes in the Add element of the configuration.xml file.
  
## See also

#### Other Resources

[Version and build numbers of update channel releases](http://technet.microsoft.com/library/ae942449-1fca-4484-898b-a933ea23def7%28Office.14%29.aspx)
  
[Overview of update channels for Office 365 ProPlus](overview-of-update-channels-for-office-365-proplus.md)
  
[Configuration options for the Office 2016 Deployment Tool](configuration-options-for-the-office-2016-deployment-tool.md)
  
[Office 365 client update channel releases](https://technet.microsoft.com/office/mt465751)
  
[Download the Office 2016 Deployment Tool](http://go.microsoft.com/fwlink/p/?LinkID=626065)
  
[Download the Office 2016 Administrative Template files (ADMX/ADML) for Group Policy](https://www.microsoft.com/download/details.aspx?id=49030)

