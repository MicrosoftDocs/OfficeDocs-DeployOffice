---
title: "Plan security settings for VBA macros in Office 2016"
ms.author: danbrown
author: DHB-MSFT
manager: laurawi
ms.date: 11/10/2015
ms.audience: ITPro
ms.topic: get-started-article
ms.service: o365-proplus-itpro
localization_priority: Normal
ms.collection: Ent_O365
ms.custom: Ent_Office_Security
ms.assetid: 9fe385d6-3c8f-458b-918f-b524d0b05f74
description: "Explains how Visual Basic for Applications (VBA) and VBA macro settings control the way VBA and VBA macros behave in Office."
---

# Plan security settings for VBA macros in Office 2016

 **Summary:** Explains how Visual Basic for Applications (VBA) and VBA macro settings control the way VBA and VBA macros behave in Office 2016. 
  
  
If you want to control the way Visual Basic for Applications (VBA) and VBA macros behave, you can change Office 2016 VBA and VBA macros settings for the following applications: Access 2016, Excel 2016, PowerPoint 2016, Publisher 2016, Visio 2016, and Word 2016.
  
<a name="about"> </a>

## Plan VBA and VBA macro security settings

Office 2016 provides several settings that enable you to control the behavior of VBA and VBA macros. By configuring these settings, you can do the following:
  
- Change the security warning settings for VBA macros. This includes disabling VBA macros, enabling all VBA macros, and changing the way that users are notified about VBA macros.
    
- Block VBA macros from running in Word, Excel, and PowerPoint files from the Internet.
    
- Disable VBA.
    
- Change how VBA macros behave in applications that are started programmatically through Automation.
    
- Change how antivirus software scans encrypted VBA macros.
    
By default, VBA is enabled and trusted VBA macros are allowed to run. This includes VBA macros in documents that are saved in a trusted location, VBA macros in trusted documents, and VBA macros that meet the following criteria:
  
- The macro is signed by the developer who uses a digital signature.
    
- The digital signature is valid.
    
- This digital signature is current (not expired).
    
- The certificate associated with the digital signature was issued by a reputable certification authority (CA).
    
- The developer who signed the macro is a trusted publisher.
    
> [!NOTE]
> The default security setting for macros is different in Outlook 2016. For more information, see the Outlook 2016 security documentation. 
  
VBA macros that aren't trusted aren't allowed to run until a user clicks the Message Bar and selects to enable the VBA macro.
  
### Use Office 2016 Telemetry Dashboard to see VBA macro usage data

You can easily get some visibility into VBA macro usage in your organization by reviewing data in Office 2016 Telemetry Dashboard. There is a built-in report named "Inventory" that collects and displays unique instance data about each Office solution that is monitored. This includes whether an Office document uses VBA macros.
  
To use the following procedure you must have already deployed and configured Office Telemetry Dashboard. For information about Office Telemetry Dashboard, see [Compatibility and telemetry in Office](..//compat/compatibility-and-telemetry-in-office.md).
  
### To view VBA macro usage in an Office 2016 Telemetry Dashboard report

1. Open Telemetry Dashboard and connect to your telemetry database.
    
2. In the navigation pane of Telemetry Dashboard, choose **Custom report**.
    
3. When the Custom report page opens, choose **Create custom report**.
    
4. In the PivotTable Fields list, Inventory section, find and select **Has VBA**. Review the report for any VBA related warnings. If you need to investigate more, select additional fields in the Inventory table.
    
5. Save the data if you'd like, then close the Telemetry Dashboard.
    
<a name="changedefault"> </a>
## Change the Office 2016 security warning settings for VBA macros

Office 2016 provides a setting that enables you to change the security warning settings and the behavior of VBA macros. Use the following guidelines to determine how to configure this setting if you want to change how users are notified about untrusted VBA macros or change the default behavior of VBA macros.
  
**Group Policy setting name:** VBA Macro Notification Settings 
  
- **Description:** This setting controls how applications warn users about Visual Basic for Applications (VBA) macros. You configure this setting on a per-application basis for Access 2016, Excel 2016, PowerPoint 2016, Publisher 2016, Visio 2016, and Word 2016. You can select one of four possible options for this setting: 
    
  - **Disable all with notification** The application displays the Trust Bar for all macros, whether signed or unsigned. This is the default setting. 
    
  - **Disable all except digitally signed macros** The application displays the Trust Bar for digitally signed macros. This allows users to enable them or leave them disabled. Any unsigned macros are disabled, and users aren't notified or given the ability to enable the unsigned macros. 
    
  - **Disable all without notification** The application disables all macros, whether signed or unsigned, and doesn't notify users. 
    
  - **Enable all macros (not recommended; potentially dangerous code can run)** All macros are enabled, whether signed or unsigned. This option can significantly reduce security by letting dangerous code to run undetected. 
    
- **Impact:** If you enable this setting and select the **Disable all except digitally signed macros** option, documents and templates that contain unsigned macros lose all functionality supplied by those macros. To prevent this loss of functionality, users can put files that contain macros in a trusted location. 
  
    > [!IMPORTANT]
    > If **Disable all except digitally signed macros** is selected, users can't open unsigned Access 2016 databases. 
  
    If you select **Disable all without notification**, documents and templates that contain unsigned and signed macros lose all functionality that is supplied by those macros. This is true even if a macro is signed and the publisher is listed in the Trusted Publisher list.
    
- **Guidelines:** Organizations that have a highly restrictive security environment typically enable this setting and select the **Disable all except digitally signed macros** option. Organizations that don't let users run macros typically enable this setting and select **Disable all without notification**.
    
<a name="blockvba"> </a>

## Block VBA macros from running in Word, Excel and PowerPoint files from the Internet in Office 2016

Office provides a Group Policy setting that enables you to block macros from running in Word, Excel and PowerPoint files from the Internet. By default, macros in Word, Excel and PowerPoint files are enabled according to the macro warning setting. Files are identified as coming from the Internet based on the zone information added to the file by the Attachment Execution Service (AES). AES adds zone information to files that are downloaded by Outlook, Internet Explorer, and some other applications. Use the following guidelines to determine how to configure this setting if you want to block macros on Word, Excel, and PowerPoint files from the Internet.
  
You configure this setting using Group Policy. There isn't a Trust Center equivalent.
  
**Group Policy setting name:** Block macros from running in Office files from the Internet 
  
- **Description:** This setting blocks VBA macros from running in Excel 2016, PowerPoint 2016, and Word 2016 on files from the Internet. You can configure this setting on a per-application basis. 
  
- **Impact:** If you enable this policy setting, macros are blocked from running on files from the internet, even if **Enable all macros** is selected in the **Macro Settings** section of the Trust Center. Also, instead of having the choice to "Enable Content," users will receive a notification that macros are blocked from running. If the Office file is saved to a trusted location or was previously trusted by the user, macros will be allowed to run. 
  
- **Guidelines:** Organizations that have highly restrictive security environments but need to use documents with VBA macros typically enable this setting. If your organization has business-critical requirements for using documents that are considered to originate from the Internet and that have VBA code, don't enable this setting. 
  
<a name="changevba"> </a>

## Disable VBA in Office 2016

Office 2016 provides a Group Policy setting that enables you to disable VBA. By default, VBA is enabled. Use the following guidelines to determine how to configure this setting if you want to disable VBA.
  
> [!NOTE]
> You can only disable VBA by using Group Policy. There isn't a Trust Center equivalent. 
  
**Group Policy setting name:** Disable VBA for Office applications 
  
- **Description:** This setting disables VBA in Excel 2016, Outlook 2016, PowerPoint 2016, Publisher 2016, SharePoint Designer 2013, and Word 2016, and prevents any VBA code from running in these applications. You can't configure this setting on a per-application basis. It's a global setting. Enabling this setting doesn't install or remove any VBA-related code from a user's computer. 
    
- **Impact:** If you enable this setting, VBA code doesn't run. If your organization has business-critical requirements for using documents that have VBA code, don't enable this setting. 
    
- **Guidelines:** Organizations that have highly restrictive security environments typically enable this setting. 
    
<a name="changeauto"> </a>

## Change how Office 2016 VBA macros behave in applications that are started programmatically

Office 2016 provides a setting that enables you to change the way VBA macros behave in applications that are started programmatically through Automation. By default, when a separate program is used to programmatically start Excel 2016, PowerPoint 2016, or Word 2016, any macros can run in the application that was programmatically started. Use these guidelines to determine how to configure this setting if you want to do the following:
  
- Prevent macros from running in applications that are programmatically started through Automation.
    
- Allow VBA macros to run according to the VBA macro security settings that are configured for the applications that are programmatically started through Automation.
    
**Group Policy setting name:** Automation Security 
  
- **Description:** This setting controls whether macros can run in an application that is opened programmatically by another application. This setting is a global setting and applies to Excel 2016, PowerPoint 2016, and Word 2016. You can't configure this setting on a per-application basis. You can choose one of three options for this setting: 
    
  - **Disable macros by default** All macros are disabled in the programmatically opened application. 
    
  - **Macros enabled (default)** Macros are allowed to run in the programmatically opened application. This option enforces the default configuration. 
    
  - **Use application macro security level** Macro functionality is determined according to how you configure the **VBA macro warning settings** setting for each application. 
    
- **Impact:** If you enable this setting and select the **Disable macros by default** option, macros won't run in applications that are programmatically started. This can be a problem if an application is started programmatically and then opens a document or a template that contains macros. In this case, the functionality that is provided by the macros is not available. The same situation might occur if you select the **Use application macro security level** option and you disable macros using the **VBA macro warning settings** setting. 
    
- **Guidelines:** Most organizations enable this setting and select the **Use application macro security level** option. But, organizations that have a highly restrictive security environment typically enable this setting and select the **Disable macros by default** option. 
    
<a name="preventencrypted"> </a>

## Change how encrypted VBA macros are scanned for viruses in Office 2016

Office 2016 provides a setting that enables you to change the way encrypted VBA macros are scanned by antivirus software in Excel 2016, PowerPoint 2016, and Word 2016. By default, if a document, presentation, or workbook is encrypted and contains VBA macros, the VBA macros are disabled unless antivirus software is installed on the client computer. In addition, encrypted VBA macros are scanned by the client computer's antivirus software when a user opens a document that contains encrypted macros. Use these guidelines to determine how to configure this setting if you want to do the following:
  
- Allow all encrypted VBA macros to run without being scanned by antivirus software.
    
- Scan encrypted VBA macros if antivirus software is installed, but enable encrypted VBA macros if no antivirus software is installed.
    
**Group Policy setting names:** Scan encrypted macros in Excel Open XML documents, Scan encrypted macros in PowerPoint Open XML documents, Scan encrypted macros in Word Open XML documents 
  
- **Description:** This setting controls the way encrypted VBA macros undergo virus scanning. This setting is a per-application setting and can be configured for Excel 2016, PowerPoint 2016, and Word 2016. You can choose one of three options for this setting: 
    
  - **Scan encrypted macros (default)** All encrypted VBA macros are disabled unless they are scanned by antivirus software. This option enforces the default configuration. 
    
  - **Scan if anti-virus software available** Encrypted VBA macros are disabled unless they are scanned by antivirus software. However, if no antivirus software is installed on the client computer, all encrypted VBA macros are enabled. 
    
  - **Load macros without scanning** Encrypted VBA macros are enabled and aren't scanned, regardless of whether antivirus software is installed on the client computer. 
    
- **Impact:** If you enable this setting and select the **Load macros without scanning** option, security could be significantly reduced by encrypted macros that have not been scanned for viruses. The same is true if the client computer doesn't have antivirus software installed and you enable this setting and select the **Scan if anti-virus software available** option 
    
- **Guidelines:** Most organizations use the default configuration for this setting and don't change this setting. 
    
<a name="addtional"> </a>

## Related Office 2016 VBA macro settings

Two other settings affect how VBA macros behave in Office 2016 applications. If you are changing VBA macro settings because you have a special security environment, you might want to evaluate the following settings:
  
**Group Policy setting name:** Trust access to Visual Basic project 
  
- **Description:** This setting determines whether automation clients can access the VBA project. This setting is a per application setting and can be set individually for Excel 2016, PowerPoint 2016, and Word 2016. 
  
**Group Policy setting name:** Disable all Trust Bar notifications for security issues 
  
- **Description:** This setting prevents users from seeing Message Bar warnings, such as warnings about unsafe VBA macros. This is a global setting that applies to Excel 2016, PowerPoint 2016, and Word 2016. You can't configure this setting on a per-application basis. 
  

