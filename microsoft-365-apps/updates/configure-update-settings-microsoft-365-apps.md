---
title: "Configure update settings for Microsoft 365 Apps"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: conceptual
ms.service: o365-proplus-itpro
ms.collection: Tier1
ms.localizationpriority: medium
recommendations: false
description: "Explains how admins can use the Office Deployment Tool or Group Policy to Configure update settings for Microsoft 365 Apps."
ms.date: 05/20/2024
---

# Configure update settings for Microsoft 365 Apps
  
There are two ways that you can configure update settings for Microsoft 365 Apps in your organization:
  
- Office Deployment Tool
    
- Group Policy settings (using on-premises Group Policy Objects or the ADMX-ingested administrative template for Office within Intune)
  
The Administrative Template for Office imported into Intune is the same as the one used in an on-premises environment. You can use an Intune configuration profile to configure the update settings for Microsoft 365 Apps. There are two ways to create in Intune such a configuration profile: using an "Administrative templates" profile type or the Settings Catalog. The Settings Catalog has more settings available than the "Administrative templates" profile type.    

Here are some of the update settings that you can configure by using the Office Deployment Tool or Group Policy(in on-premises or Intune).
  
| Update setting | Office Deployment Tool setting | Group Policy setting(on-premises or Intune) |
|:-----|:-----|:-----|
|Set updates to occur automatically  |Enabled  |Enable automatic updates  |
|Specify a location to look for updates  |UpdatePath  |Update path  |
|Specify the version of Microsoft 365 Apps to update to  |TargetVersion  |Target version  |
|Set a deadline by when updates have to be applied  |Deadline  |Update deadline  |
|Hide update notifications from users  |You can't configure this setting by using the Office Deployment Tool.  |Hide update notifications  |
|Hide the option to enable or disable Office automatic updates  |You can't configure this setting by using the Office Deployment Tool.  |Hide options to enable or disable updates  |
|Set deferral periods for Office automatic updates |You can't configure this setting by using the Office Deployment Tool. |Delay downloading and installing updates for Office |
   
By default, updates for Microsoft 365 Apps are downloaded automatically from the internet and applied in the background, without any user or administrator intervention. You can use these update settings to change that behavior and make other changes about how Microsoft 365 Apps is updated.
  
In most cases, you use either the Office Deployment Tool or Group Policy, not both, to configure update settings. If you do use both to configure a setting, the Group Policy setting overrides the setting configured by the Office Deployment Tool.
  
## Use the Office Deployment Tool to configure update settings for Microsoft 365 Apps
<a name="ODT"> </a>
> [!IMPORTANT]
> The [Microsoft 365 admin center](https://admin.cloud.microsoft/) determines your organization's [default update channel](../manage-software-download-settings-office-365.md). If you deploy Microsoft 365 Apps using the Office Deployment Tool and do not use any additional update management (for example, [Cloud Update](../admin-center/cloud-update.md)), devices will automatically change to this default update channel.

Users can install Microsoft 365 Apps themselves from the Office 365 portal, but using the Office Deployment Tool to deploy Microsoft 365 Apps to your users gives you more control over the installation. For example, you can control how Microsoft 365 Apps is updated.
  
The settings that the Office Deployment Tool uses to install and update Microsoft 365 Apps are contained in a configuration.xml file. This file is a text file that can be edited in Notepad. There's a [list of settings](../deploy/office-deployment-tool-configuration-options.md) that you can specify, including settings for configuring updates.
  
For example, if you want Microsoft 365 Apps to get updates automatically from a network share called  \\\server\updates, you'd include the following line in your configuration.xml file:
  
```xml
<Updates Enabled="TRUE" UpdatePath="\\server\updates" />
```

The update settings in the configuration.xml file are applied to Microsoft 365 Apps when you use the Office Deployment Tool to deploy Microsoft 365 Apps. If you decide to change these settings, you must update your configuration.xml file, and then run the Office Deployment Tool again.
  
## Use Group Policy Objects to configure update settings for Microsoft 365 Apps
<a name="GP"> </a>

If you have Windows Server and Active Directory Domain Services (AD DS) deployed in your organization, you can configure update settings for Microsoft 365 Apps by using Group Policy. To use Group Policy, download the most current [Administrative Template files (ADMX/ADML) for Office](https://www.microsoft.com/download/details.aspx?id=49030), which include the policy settings for Microsoft 365 Apps.

After you copy the Administrative Template files to AD DS, find the update policy settings under Computer Configuration\\Policies\\Administrative Templates\\Microsoft Office 2016 (Machine)\\Updates in the Group Policy Management Console. You'll also find a description of how to configure each policy setting.

:::image type="content" source="media/configure-update-settings-microsoft-365-apps/group-policy-office-updates-small.jpg" alt-text="Screenshot of Group Policy settings for managing Office updates, showing various options with 'Hide option to enable or disable updates' enabled." lightbox="media/configure-update-settings-microsoft-365-apps/group-policy-office-updates.jpg":::
  
If you decide to make a change later, update the Group Policy setting by using the Group Policy Management Console. The updated policy settings are automatically applied to Microsoft 365 Apps, through the normal Group Policy update process.
  
Group Policy settings can be used regardless of whether users install Microsoft 365 Apps themselves from the Office 365 portal, or if you deploy Microsoft 365 Apps to your users by using the Office Deployment Tool.
  
   
## Related articles
[Overview of the update process for Microsoft 365 Apps](overview-update-process-microsoft-365-apps.md)
  
[Choose how to manage updates to Microsoft 365 Apps](choose-how-manage-updates-microsoft-365-apps.md)
  
[End-user update notifications for Microsoft 365 Apps](end-user-update-notifications-microsoft-365-apps.md)

