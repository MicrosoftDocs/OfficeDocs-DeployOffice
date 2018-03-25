---
title: "Designate trusted locations for files in Office 2016"
ms.author: danbrown
author: DHB-MSFT
manager: laurawi
ms.date: 12/20/2016
ms.audience: ITPro
ms.topic: get-started-article
ms.service: o365-proplus-itpro
localization_priority: Normal
ms.collection: Ent_O365
ms.custom: Ent_Office_Security
ms.assetid: 5b677942-4aa4-4127-a247-b1cfd86912a9
description: "Explains how to use a designate a folder on a user's computer or a network share as a trusted location to help differentiate safe files from potentially harmful files in Office."
---

# Designate trusted locations for files in Office 2016

 **Summary:** Explains how to use a designate a folder on a user's computer or a network share as a trusted location to help differentiate safe files from potentially harmful files in Office 2016. 
  
 **Audience:** IT Professionals 
  
If you want to differentiate safe files from potentially harmful files, you can designate a network share as a trusted location in Office 2016. Office lets you designate trusted file sources on the hard disks of users' computers or on a network share. When a folder is designated as a trusted file source, any file that is saved in the folder is assumed to be a trusted file. When a user opens a trusted file, all content in the file is enabled and active, and users aren't notified about any potential risks that might be contained in the file. These can include, for example, unsigned add-ins and Microsoft Visual Basic for Applications (VBA) macros, links to content on the Internet, or database connections.
  
> [!TIP]
> **Are you looking for security information about individual Office 2016 applications?** You can find this information by searching for "2016 security" on [Office Support](https://support.office.com). 
  
    
## Plan trusted locations settings in Office
<a name="about"> </a>

Office 2016 provides several settings that let you configure how Office uses trusted locations. By configuring these settings, you can do the following:
  
- Specify trusted locations globally or on a per-application basis.
    
- Allow a network share to be a trusted location.
    
- Prevent users from designating trusted locations.
    
- Disable trusted locations.
    
You can use trusted locations with the following applications: Access 2016, Excel 2016, InfoPath 2016, PowerPoint 2016, Visio 2016, and Word 2016. 
  
The following list describes the default configuration for trusted locations:
  
- Trusted locations is enabled.
    
- Users can't designate network shares as trusted locations. But, users can change this setting in the Trust Center. See [View my options and settings in the Trust Center](https://go.microsoft.com/fwlink/p/?LinkId=275740) for user instructions on trusted locations and other user options in the Trust Center. 
    
- Users can add folders to the trusted locations list.
    
- Both user-defined and policy-defined trusted locations can be used to specify trusted locations. 
    
In addition, several folders are designated as trusted locations in a default installation of Office 2016. The default folders for each application are listed in the following tables. (InfoPath 2016 and Visio 2016 have no default trusted locations.)
  
### Access 2016 trusted locations

The following table lists the default trusted location for Access 2016.
  
**Default trusted location for Access 2016**

|**Default trusted location**|**Folder description**|**Are subfolders trusted also?**|
|:-----|:-----|:-----|
|Program Files\Microsoft Office 16\Root\Office16\ACCWIZ  <br/> |Wizard databases  <br/> |No (Disallowed)  <br/> |
   
### Excel 2016 trusted locations

The following table lists the default trusted locations for Excel 2016.
  
**Default trusted locations for Excel 2016**

|**Default trusted locations**|**Folder description**|**Are subfolders trusted also?**|
|:-----|:-----|:-----|
|Program Files\Microsoft Office 16\Root\Templates  <br/> |Application templates  <br/> |Yes (Allowed)  <br/> |
|Users\ _user_name_\Appdata\Roaming\Microsoft\Templates  <br/> |User templates  <br/> |No (Disallowed)  <br/> |
|Program Files\Microsoft Office 16\Root\Office16\XLSTART  <br/> |Excel startup  <br/> |Yes (Allowed)  <br/> |
|Users\ _user_name_\Appdata\Roaming\Microsoft\Excel\XLSTART  <br/> |User startup  <br/> |No (Disallowed)  <br/> |
|Program Files\Microsoft Office 16\Root\Office16\STARTUP  <br/> |Office startup  <br/> |Yes (Allowed)  <br/> |
|Program Files\Microsoft Office 16\Root\Office16\Library  <br/> |Add-ins  <br/> |Yes (Allowed)  <br/> |
   
### PowerPoint 2016 trusted locations

The following table lists the default trusted locations for PowerPoint 2016.
  
**Default trusted locations for PowerPoint 2016**

|**Default trusted locations**|**Folder description**|**Are subfolders trusted also?**|
|:-----|:-----|:-----|
|Program Files\Microsoft Office 16\Root\Templates  <br/> |Application templates  <br/> |Yes (Allowed)  <br/> |
|Users\ _user_name_\Appdata\Roaming\Microsoft\Templates  <br/> |User templates  <br/> |Yes (Allowed)  <br/> |
|Users\ _user_name_\Appdata\Roaming\Microsoft\Addins  <br/> |Add-ins  <br/> |No (Disallowed)  <br/> |
|Program Files\Microsoft Office 16\Root\Document Themes 16  <br/> |Application themes  <br/> |Yes (Allowed)  <br/> |
   
### Word 2016 trusted locations

The following table lists the default trusted locations for Word 2016.
  
**Default trusted locations for Word 2016**

|**Default trusted locations**|**Folder description**|**Are subfolders trusted also?**|
|:-----|:-----|:-----|
|Program Files\Microsoft Office 16\Root\Templates  <br/> |Application templates  <br/> |Yes (Allowed)  <br/> |
|Users\ _user_name_\Appdata\Roaming\Microsoft\Templates  <br/> |User templates  <br/> |No (Disallowed)  <br/> |
|Users\ _user_name_\Appdata\Roaming\Microsoft\Word\Startup  <br/> |User startup  <br/> |No (Disallowed)  <br/> |
   
## Implement trusted locations in Office 2016
<a name="implementlocations"> </a>

To implement trusted locations, you must determine the following:
  
- The applications for which you want to configure trusted locations.
    
- The folders that you want to designate as trusted locations.
    
- The folder sharing and folder security settings that you want to apply to your trusted locations.
    
- The restrictions that you want to apply to trusted locations.
    
### Determine the applications for which you want to configure trusted locations

Use the following guidelines to help determine the applications for which you want to configure trusted locations:
  
- Trusted locations affect all content in a file. This includes add-ins, ActiveX controls, hyperlinks, links to data sources and media, and VBA macros. Moreover, files that are opened from trusted locations skip file validation checks, File Block checks, and don't open in Protected View.
    
- Each application provides the same settings for configuring trusted locations. This means that you can independently customize trusted locations for each application.
    
- You can disable trusted locations for one or more applications, and implement trusted locations for other applications.
    
### Determine the folders to designate as trusted locations

Use the following guidelines to help determine the folders that you want to designate as trusted locations:
  
- You can specify trusted locations on a per-application basis or globally.
    
- One or more applications can share a trusted location.
    
- To prevent malicious users from adding files to a trusted location or from modifying files that are saved in a trusted location, you must apply operating system security settings to any folder that you designate as a trusted location. 
    
-  By default, only trusted locations that are on users' hard disks are allowed. To enable trusted locations on network shares, you must enable the **Allow trusted locations on my network (not recommended)** setting. 
    
- We don't recommend that you specify root folders, such as drive C, or the whole Documents or My Documents folder as trusted locations. Instead, create a subfolder within those folders and specify only that folder as a trusted location.
    
In addition, you must use the guidelines in the following sections if you want to:
  
- Use environment variables to specify trusted locations.
    
- Specify web folders (that is, http://paths) as trusted locations.
    
#### Use environment variables to specify trusted locations

You can use environment variables by using Group Policy and the OCT to specify trusted locations. But, for environment variables to work correctly when you use them within the OCT, you must change the value type that is used to store trusted locations in the registry. If you use an environment variable to specify a trusted location, and you don't make the necessary registry modification, the trusted location appears in the Trust Center, but it's unavailable and it's listed as a relative path that contains the environment variables. After you change the value type in the registry, the trusted location appears in the Trust Center as an absolute path and is available.
  
### To use environment variables to specify trusted locations

1. Use Registry Editor to locate the trusted location that is represented by an environment variable.
    
    To open Registry Editor, click **Start**, click **Run**, type **regedit**, and then click **OK**.
    
    Or, if you are using Windows 8 or Windows 8.1, swipe from the right to reveal the charms, choose the Search charm, and type **regedit**.
    
    Trusted locations that are configured by using the OCT are stored in the following location:
    
    **HKEY_CURRENT_USER/Software/Microsoft/Office/16.0/application_name/Security/Trusted Locations**
    
    Where  _application_name_ can be Access, Excel, PowerPoint, Visio, or Word. 
    
    Trusted locations are stored in registry entries named  _Path_, and they are stored as String Value (REG_SZ) value types. Be sure to locate each  _Path_ entry that uses environment variables to specify a trusted location. 
    
2. Change the  _Path_ value type. 
    
    Applications in the Office 2016 can't recognize environment variables that are stored as String Value (REG_SZ) value types. For applications to recognize environment variables, you must change the value type of the  _Path_ entry so that it is an Expandable String Value (REG_EXPAND_SZ) value type. To do this, follow these steps: 
    
1. Write down or copy the value of the  _Path_ entry. This should be a relative path that contains one or more environment variables. 
    
2. Delete the  _Path_ entry. 
    
3. Create a  _Path_entry of type Expandable String Value (REG_EXPAND_SZ).
    
4. Change the new  _Path_ entry so that it has the same value that you wrote down or copied in the first step. 
    
    Be sure to make this change for each  _Path_ entry that uses environment variables to specify a trusted location. 
    
#### Specify web folders as trusted locations

You can specify web folders (that is, http://paths) as trusted locations. But, only those web folders that support Web Distributed Authoring and Versioning (WebDAV) or FrontPage Server Extensions Remote Procedure Call (FPRPC) protocols are recognized as trusted locations. Use the following guidelines if you aren't sure whether a web folder supports the WebDAV or FPRPC protocols:
  
- If you open an application in Internet Explorer, check the most recently used files list. If the most recently used files list indicates that the file is located on a remote server, instead of in the Temporary Internet Files folder, it is likely that the web folder supports WebDAV in some form. For example, if you open a document while browsing Internet Explorer, and it opens in Word 2016, the most recently used files list should show that the document is located on the remote server and not in the local Temporary Internet Files folder. 
    
- Try to use the **Open** dialog box to browse to the web folder. If the path supports WebDAV, you probably can browse to the web folder or you are prompted for credentials. If the web folder doesn't support WebDAV, navigation fails and the dialog box closes. 
    
> [!NOTE]
> Sites that are created with SharePoint Server 2016 can be designated as trusted locations. 
  
### Determine folder sharing and folder security settings for trusted location folders

All folders that you specify as trusted locations must be secured. Use the following guidelines to determine which sharing settings and security settings that you have to apply to each trusted location:
  
- If a folder is shared, configure sharing permissions so that only authorized users have access to the shared folder. Be sure to use the principle of least privilege and grant permissions that are appropriate to a user. That is, grant Read permission to those users who don't have to change trusted files, and grant Full Control permission to those users who have to change trusted files.
    
- Apply folder security permissions so that only authorized users can read or change the files in trusted locations. Make sure to use the principle of least privilege and to grant permissions that are appropriate to a user. That is, grant Full Control permissions to only those users who have to change files. Then, grant more-restrictive permissions to those users who need only to read files.
    
### Determine restrictions for trusted locations

Office 2016 provides several settings that enable you to restrict or control the behavior of trusted locations. Use the following guidelines to determine how to configure these settings.
  
 **Group Policy Setting name:** Allow mix of policy and user locations 
  
> **Description:** This setting controls whether trusted locations can be defined by users, the OCT, and Group Policy, or if they must be defined by Group Policy alone. By default, users can designate any location as a trusted location and a computer can have any combination of user-created, OCT-created, and Group Policy-created trusted locations. 
    
> **Impact:** If this setting is disabled, all trusted locations that aren't created by Group Policy are disabled and users can't create new trusted locations in the Trust Center. Disabling this setting will cause some disruption for users who have defined their own trusted locations in the Trust Center. Applications treat such locations as they treat any other untrusted locations, which means that users see Message Bar warnings about content such as ActiveX controls and VBA macros when they open files, and they have to choose whether to enable controls and macros or leave them disabled This is a global setting that applies to all applications for which you configure trusted locations. 
    
> **Guidelines:** Organizations that have a highly restrictive security environment typically disable this setting. Organizations that manage their desktop configurations through Group Policy typically disable this setting. 
    
 **Group Policy Setting name:** Allow Trusted Locations on the network 
  
> **Description:** This setting controls whether trusted locations on the network can be used. By default, trusted locations that are network shares are disabled. But users can still select the **Allow Trusted Locations on my network (not recommended)** check box in the Trust Center, which will enable users to designate network shares as trusted locations. This isn't a global setting. You must configure this setting on a per-application basis for Access 2016, Excel 2016, PowerPoint 2016, Visio 2016, and Word 2016. 
    
> **Impact:** Disabling this setting disables all trusted locations that are network shares and prevents users from selecting the **Allow Trusted Locations on my network (not recommended)** check box in the Trust Center. Disabling this setting will cause some disruption for users who have defined their own trusted locations in the Trust Center. If you disable this setting, and a user attempts to designate a network share as a trusted location, a warning informs the user that the current security settings don't allow them to create trusted locations that are remote paths or network paths. If an administrator designates a network share as a trusted location through Group Policy or by using the OCT, and this setting is disabled, the trusted location is disabled. Applications treat such locations like any other untrusted locations, which means that users see Message Bar warnings about content such as ActiveX controls and VBA macros when they open files. They have to choose whether to enable controls and macros or leave them disabled. 
    
> **Guidelines:** Organizations that have a highly restrictive security environment typically disable this setting. 
    
> [!NOTE]
> You can also use the **Remove all Trusted Locations written by the OCT during installation** setting to delete all trusted locations that were created by configuring the OCT. 
  
## Disable trusted locations in Office 2016
<a name="disablelocations"> </a>

Office 2016 provides a Group Policy setting that you can use to disable trusted locations. You must configure this setting on a per-application basis for Access 2016, Excel 2016, PowerPoint 2016, Visio 2016, and Word 2016. Use the following guidelines to determine whether you should use this setting.
  
 **Group Policy Setting name:** Disable all Trusted Locations 
  
> **Description:** This setting lets you disable the trusted locations on a per-application basis. By default, users can create trusted locations. 
    
> **Impact:** Enabling this setting disables all trusted locations. This includes trusted locations that are as follows: 
    
    - Created by default during Setup.
    
    - Created by using the OCT.
    
    - Created by users through the Trust Center.
    
    - Created by using Group Policy.
    
    Enabling this setting also prevents users from configuring trusted locations settings in the Trust Center. If you enable this setting, make sure that you notify users that they can't use trusted locations. If users have been opening files from trusted locations, and you enable this setting, users might start seeing warnings in the Message Bar and they might be required to respond to Message Bar warnings to enable content, such as ActiveX controls, add-ins, and VBA macros.
    
> **Guidelines:** Organizations that have a highly restrictive security environment typically enable this setting. 
    

