---
title: "Configure update settings for Microsoft 365 Apps"
ms.author: jwhit
author: jwhit-MSFT
manager: laurawi
audience: ITPro
ms.topic: get-started-article
ms.service: o365-proplus-itpro
localization_priority: Normal
ms.collection: Ent_O365
ms.custom: Ent_Office_ProPlus
ms.assetid: a073ea21-62ed-40ef-8405-fd287f7d0b11

description: "Explains how admins can use the Office Deployment Tool or Group Policy to Configure update settings for Microsoft 365 Apps."
---

# Configure update settings for Microsoft 365 Apps
  
There are two ways that you can configure update settings for Microsoft 365 Apps in your organization:
  
- Office Deployment Tool
    
- Group Policy
    
Here are the update settings that you can configure by using the Office Deployment Tool or Group Policy.
  
|**Update setting**|**Office Deployment Tool setting**|**Group Policy setting**|
|:-----|:-----|:-----|
|Set updates to occur automatically  <br/> |Enabled  <br/> |Enable automatic updates  <br/> |
|Specify a location to look for updates  <br/> |UpdatePath  <br/> |Update path  <br/> |
|Specify the version of Microsoft 365 Apps to update to  <br/> |TargetVersion  <br/> |Target version  <br/> |
|Set a deadline by when updates have to be applied  <br/> |Deadline  <br/> |Update deadline  <br/> |
|Hide update notifications from users  <br/> |You can't configure this setting by using the Office Deployment Tool.  <br/> |Hide update notifications  <br/> |
|Hide the option to enable or disable Office automatic updates  <br/> |You can't configure this setting by using the Office Deployment Tool.  <br/> |Hide options to enable or disable updates  <br/> |
   
By default, updates for Microsoft 365 Apps are downloaded automatically from the internet and applied in the background, without any user or administrator intervention. You can use these update settings to change that behavior and make other changes about how Microsoft 365 Apps is updated.
  
In most cases, you'll use either the Office Deployment Tool or Group Policy, not both, to configure update settings. If you do use both to configure a setting, the Group Policy setting overrides the setting configured by the Office Deployment Tool.
  
## Use the Office Deployment Tool to configure update settings for Microsoft 365 Apps
<a name="ODT"> </a>

Users can install Microsoft 365 Apps themselves from the Office 365 portal, but using the Office Deployment Tool to deploy Microsoft 365 Apps to your users gives you more control over the installation. For example, you can control how Microsoft 365 Apps is updated.
  
The settings that the Office Deployment Tool uses to install and update Microsoft 365 Apps are contained in a configuration.xml file. This file is a text file that can be edited in Notepad. There is a [list of settings](office-deployment-tool-configuration-options.md) that you can specify, including settings for configuring updates.
  
For example, if you want Microsoft 365 Apps to get updates automatically from a network share called  \\\server\updates, you'd include the following line in your configuration.xml file:
  
```xml
<Updates Enabled="TRUE" UpdatePath="\\server\updates" />
```

The update settings in the configuration.xml file are applied to Microsoft 365 Apps when you use the Office Deployment Tool to deploy Microsoft 365 Apps. If you decide to change these settings, you must update your configuration.xml file, and then run the Office Deployment Tool again.
  
## Use Group Policy to configure update settings for Microsoft 365 Apps
<a name="GP"> </a>

If you have Windows Server and Active Directory Domain Services (AD DS) deployed in your organization, you can configure update settings for Microsoft 365 Apps by using Group Policy. To use Group Policy, download the most current [Administrative Template files (ADMX/ADML) for Office](https://www.microsoft.com/download/details.aspx?id=49030), which include the policy settings for Microsoft 365 Apps.


After you copy the Administrative Template files to AD DS, you'll find the update policy settings under Computer Configuration\\Policies\\Administrative Templates\\Microsoft Office 2016 (Machine)\\Updates in the Group Policy Management Console. You'll also find a description of how to configure each policy setting.
  
![Group Policy settings updates](images/86a9781c-0e91-4e5d-b334-7a0d07d85466.jpg)
  
If you decide to make a change later, update the Group Policy setting by using the Group Policy Management Console. The updated policy settings are automatically applied to Microsoft 365 Apps, through the normal Group Policy update process.
  
Group Policy settings can be used regardless of whether users install Microsoft 365 Apps themselves from the Office 365 portal, or if you deploy Microsoft 365 Apps to your users by using the Office Deployment Tool.
  
   
## Related articles
[Overview of the update process for Microsoft 365 Apps](overview-update-process-microsoft-365-apps.md)
  
[Choose how to manage updates to Microsoft 365 Apps](choose-how-manage-updates-microsoft-365-apps.md)
  
[End-user update notifications for Microsoft 365 Apps](end-user-update-notifications-microsoft-365-apps.md)

