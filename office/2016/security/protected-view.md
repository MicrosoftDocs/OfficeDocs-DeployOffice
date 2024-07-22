---
title: "Set up a safe environment to open files by using Protected View in Office 2016"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: conceptual
ms.service: office-perpetual-itpro
ms.collection: Tier2
ms.localizationpriority: medium
ROBOTS: NOINDEX, NOFOLLOW
description: "Explains how to use Protected View settings to open documents, presentations, and workbooks in a sandbox environment in Office."
ms.date: 04/19/2024
---

# Set up a safe environment to open files by using Protected View in Office 2016

 **Summary:** Explains how to use Protected View settings to open documents, presentations, and workbooks in a sandbox environment in Office 2016. 
  
  
Change how the sandbox preview feature in Office 2016 behaves by configuring Protected View settings. Protected View in Office 2016 is a security feature designed to minimize risks to your computer. It opens files in a restricted environment, allowing you to inspect them before editing in Excel 2016, PowerPoint 2016, or Word 2016.

> [!NOTE]
> - If you are looking for information on protected view in individual Office 2016 applications, see [What is Protected View](https://go.microsoft.com/fwlink/p/?LinkId=393945) instead.
> - If you are an IT Professional and planning to configure Protected View settings for Office 2016 in your organization, you're at the right place, so keep reading.
   

<a name="about"> </a>
    
## Plan Protected View settings in Office 2016

Protected View helps prevent several kinds of exploits by opening documents, presentations, and workbooks in a sandbox environment. A sandbox is a piece of computer memory or a specific computer process that is isolated from certain operating system components and applications. Because of this isolation, programs and processes that run in a sandbox environment are considered less dangerous. Sandbox environments are frequently used to test new applications and services that might otherwise make a computer unstable or fail. Sandbox environments are also used to prevent applications and processes from harming a computer. 
  
When you open a file in Protected View, you can view its content. However, editing, saving, printing, or viewing details of any digital signatures in the file isn't possible. Active file content, such as ActiveX controls, add-ins, database connections, hyperlinks, and Visual Basic for Applications (VBA) macros, isn't enabled. Users can however, copy content from the file and paste it into another document.
  
### Default behavior of Protected View in Office 2016

By default, Protected View is enabled in Excel 2016, PowerPoint 2016, and Word 2016, but files open in Protected View only under certain conditions. In some cases, files bypass Protected View and are opened for editing. For example, files that are opened from trusted locations and files that are trusted documents bypass several security checks and aren't opened in Protected View.
  
By default, files open in Protected View if any one of the following conditions is true:
  
- **A file skips or fails Office File Validation** Office File Validation is a security feature that scans files for file format exploits. If Office File Validation detects a possible exploit or some other unsafe file corruption, the file opens in Protected View. 
    
- **Zone information determines that a file is not safe** Attachment Execution Services (AES) adds zone information to files that are downloaded by Microsoft Outlook, Internet Explorer, and some other applications. Also, in Windows 8.1 and later versions, Windows adds zone information to files that are edited using Microsoft Store applications. If a file's zone information indicates that the file originated from an untrusted website or the Internet, the file opens in Protected View. 
    
- **A user opens a file in Protected View** Users can open files in Protected View by choosing **Open in Protected View** in the **Open** dialog box, or by holding down the SHIFT key, choosing a file name, and, from its shortcut menu (right-click), choosing **Open in Protected View**.
    
- **A file is opened from an unsafe location** By default, unsafe locations include the user's Temporary Internet Files folder and the downloaded program files folder. You can also use Group Policy settings to designate other unsafe locations. 
    
In some cases, Protected View is bypassed even if one or more of the previously listed conditions are met. Specifically, files open outside of Protected View these cases:
  
- A file is opened from a trusted location.
    
- A file is considered a trusted document.
    
- A file is edited using a trusted Microsoft Store application.
    
### Change Protected View behavior in Office 2016

We recommend that you don't change the default behavior of Protected View. Protected View is an important part of the layered defense strategy in Office 2016, and is designed to work with other security features such as Office File Validation and File Block. We understand that some organizations might have to change Protected View settings to suit special security requirements. If this applies to you, then you can use these settings to change how Protected View works:
  
- Prevent files that are downloaded from the Internet from opening in Protected View.
    
- Prevent files that are stored in unsafe locations from opening in Protected View.
    
- Prevent attachments opened in Outlook 2016 from opening in Protected View.
    
- Add locations to the list of unsafe locations.
    
- Add trusted Microsoft Store applications.
    
In addition, you can use File Block settings and Office File Validation settings to force files to open in Protected View. For more information, see [Force files to open in Protected View in Office 2016](protected-view.md#force) later in this article. 
  

<a name="bypass"> </a>

## Prevent files from opening in Protected View in Office 2016


You can change Protected View settings so that certain files bypass Protected View. To do so, you need to  *disable*  some settings in the Trust Center. These settings don't apply if File Block settings force the file to open in Protected View. Also, these settings don't apply if a file fails Office File Validation. You can configure each of these settings on a per-application basis for Excel 2016, PowerPoint 2016, and Word 2016. 
  
### To prevent files from opening in Protected View in Office 2016

1. From any Office application, go to **File** > **Options** > **Trust Center** > **Trust Center Settings**.
    
2. Choose which Protected View settings you want to disable from the following options:
    
   - **Enable Protected View for files originating from the Internet** Disable this setting to force files to bypass Protected View if the zone information indicates that the file was downloaded from the Internet zone. This setting applies to files that are downloaded by using Internet Explorer and Outlook or files edited by Microsoft Store applications. 
    
   - **Enable Protected View for files that are located in potentially unsafe locations** Disable this setting to force files to bypass Protected View if the files are opened from an unsafe location. You can add folders to the unsafe locations list by using the **Specify list of unsafe locations** setting, which is discussed later in this article. 
    
   - **Enable Protected View Outlook attachments** Disable this setting to force Excel 2016, PowerPoint 2016, and Word 2016 files that are opened as Outlook 2016 attachments to bypass Protected View. 
    
<a name="force"> </a>

## Force files to open in Protected View in Office 2016

The File Block and Office File Validation features have settings that let you force files to open in Protected View when certain conditions are met. You can use these settings to determine the circumstances under which files open in Protected View.
  
### Use File Block to force Office 2016 files to open in Protected View

The File Block feature lets you prevent users from opening or saving certain file types. When you use File Block settings to block a file type, you can choose one of three file block actions:
  
- Blocked and not allowed to open.
    
- Blocked and opened only in Protected View (users can't enable editing).
    
- Blocked and opened in Protected View (users can enable editing). 
    
By selecting the second or third option, you can force blocked file types to open in Protected View. You can configure File Block settings only on a per-application basis for Excel 2016, PowerPoint 2016, and Word 2016. For more information about File Block settings, see [Block specific file format types in Office 2016](block-specific-file-format-types.md).
  
### Use Office File Validation settings to force Office 2016 files to open in Protected View

Office File Validation is a security feature. It scans files for format exploits before an Office 2016 application opens them. By default, files that fail Office File Validation are opened in Protected View and users can enable editing after previewing the file in Protected View. You can use the Group Policy Protected View setting **Set document behavior if file validation fails** to change this default behavior. You can use this setting to select one of two possible options for files that fail Office File Validation: 
  
- **Block completely** Files that fail Office File Validation can't be opened in Protected View or opened for editing. 
    
- **Open in Protected View** Files that fail Office File Validation are opened in Protected View. This is the default. 
    
By selecting the second option, you can restrict Protected View behavior for files that fail Office File Validation. You can configure this Office File Validation setting only on a per-application basis for Excel 2016, PowerPoint 2016, and Word 2016. For more information about Office File Validation settings, see [Prevent file format attacks by using Office file validation in Office 2016](prevent-file-format-attacks-using-file-validation.md).
  

<a name="unsafe"> </a>

## Add files to the list of unsafe files

You can use the **Specify list of unsafe locations** setting to add locations to the unsafe locations list. Files that are opened from unsafe locations are always opened in Protected View. The unsafe locations feature doesn't prevent users from editing a document. It only forces a document to open in Protected View before it's edited. This is a global setting that applies to Excel 2016, PowerPoint 2016, and Word 2016. 
  

<a name="store"> </a>

## Add trusted Microsoft Store applications

In Windows 8.1 and later versions of Windows, the operating system automatically adds the Internet Zone identifier to files that are edited by Microsoft Store applications. As a result, such files open in Protected View when opened in Office 2016.
  
In Office 2016, you can specify trusted Microsoft Store applications. This enables specific files that are edited by these applications to bypass Protected View when opened in Office 2016. By default, this list of trusted Microsoft Store applications includes Word Mobile, Excel Mobile and PowerPoint Mobile. Users with local administrator privileges or Enterprise Administrators can add more Microsoft Store applications to this list by adding the Microsoft Store Package Family Name (PFN) to the following registry key:
  
HKEY_CURRENT_USER\Software\Microsoft\Office\Common\Security\TrustedStoreApps\
  
Contact the developer of the application in order to obtain the PFN of the application you want to add to the Trusted Microsoft Store application. This is a global setting that applies to Excel 2016, PowerPoint 2016, and Word 2016.
  
## Related articles
- [Block specific file format types in Office 2016](block-specific-file-format-types.md)
- [Prevent file format attacks by using Office file validation in Office 2016](prevent-file-format-attacks-using-file-validation.md)

