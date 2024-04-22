---
title: "Prevent file format attacks by using Office file validation in Office 2016"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: conceptual
ms.service: office-perpetual-itpro
ms.collection: Tier2
ms.localizationpriority: medium
ROBOTS: NOINDEX, NOFOLLOW
description: "Explains how you can prevent file format attacks using file validation in Office."
ms.date: 04/19/2024
---

# Prevent file format attacks by using Office file validation in Office 2016

 **Summary:** Explains how you can prevent file format attacks using file validation in Office 2016. 
  
  
By validating files, Office 2016 helps prevent file format attacks by scanning Office binary file formats before they're opened in Excel 2016, PowerPoint 2016, or Word 2016. You can change how Office 2016 validates files that are stored in Microsoft Office binary file formats by configuring settings.
  
<a name="about"> </a>

## Plan how to validate files in Office

Office file validation helps detect and prevent a kind of exploit known as a file format attack or file fuzzing attack. File format attacks exploit the integrity of a file and occur when someone modifies the structure of a file with the intent of adding malicious code. Usually, the malicious code is run remotely and is used to elevate the privilege of restricted accounts on the computer. An attacker can use the code to gain access to the computer. Gaining this access could enable an attacker to read sensitive information from the computer's hard disk drive or install malware, such as a worm or a key logging program. To validate files, Office compares a file's structure to a predefined file schema, which is a set of rules that determine what a readable file looks like. If Office detects that a file's structure doesn't follow all rules that are described in the schema, the file isn't validated.
  
File format attacks occur most frequently in files that are stored in Office binary file formats. For this reason, Office scans and validates the following kinds of files:
  
- Excel 97-2003 Workbook files. These files have an .xls extension and include all Binary Interchange File Format 8 (BIFF8) files.
    
- Excel 97-2003 Template files. These files have an .xlt extension and include all BIFF8 files.
    
- Microsoft Excel 5.0/95 files. These files have an .xls extension and include all BIFF5 files.
    
- PowerPoint 97-2003 Presentation files. These files have a .ppt extension.
    
- PowerPoint 97-2003 Show files. These files have a .pps extension.
    
- PowerPoint 97-2003 Template files. These files have a .pot extension.
    
- Word 97-2003 Document files. These files have a .doc extension.
    
- Word 97-2003 Template files. These files have a .dot extension.
    
Office 2016 provides several settings that let you change how Office works to validate files:
  
- Enable or disable Office file validation.
    
- Specify document behavior when a file fails validation.
    
- Prevent Office 2016 from sending Office file validation information to Microsoft.
    
By default, Office validates files. Any files that fail validation are opened in Protected View. Users can choose to enable editing for these files. Also, users are prompted to send Office file validation information to Microsoft. If users grant permission, only information for files that fail validation is collected and sent to Microsoft.
  
We recommend that you don't change the default settings for Office file validation. However, some organizations might have to configure Office file validation settings to suit special security requirements. Specifically, the following types of organizations have security requirements that might require a change to the default settings for the Office file validation:
  
- **Organizations that restrict access to the Internet.** Office file validation, which prompts users to send validation error information to Microsoft approximately every two weeks, could violate an organization's Internet access policies. In this case, you might choose to prevent Office from sending the information to Microsoft. For more information, see [Turn off Office file validation reporting in Office](prevent-file-format-attacks-using-file-validation.md#errorreport) later in this article. 
    
- **Organizations that have highly restrictive security environments.** You can configure Office file validation so that files that fail validation can't be opened or can only be opened in Protected View. This approach is more restrictive than the default settings for Office file validation and might be suitable to organizations that have a locked-down security environment. For more information about how to change document behavior, see [Change document behavior when validation fails in Office](prevent-file-format-attacks-using-file-validation.md#behavior) later in this article. 
    
- **Organizations that do not want their files sent to Microsoft.** If users allow it, Office file validation sends a copy of all files that fail validation to Microsoft. You can configure Office file validation so that users aren't prompted to send validation information to Microsoft. 
    
<a name="turnoff"> </a>

## Turn off Office file validation in Office 2016

You can use the **Turn off file validation** setting to disable Office file validation. This setting must be configured on a per-application basis for Excel 2016, PowerPoint 2016, and Word 2016. This setting prevents files that are stored in the Office binary file format from being scanned and validated. For example, if you enable the **Turn off file validation** setting for Excel 2016, Office file validation doesn't scan or validate Excel 97-2003 Workbook files, Excel 97-2003 Template files, or Microsoft Excel 5.0/95 files. If a user opens one of those file types, and the file contains a file format attack, the attack won't be detected or prevented unless some other security control detects and prevents such an attack. 
  
We recommend that you don't turn off Office file validation. Office file validation is a key part of the layered defense strategy in Office 2016 and should be enabled on all computers throughout an organization. If you want to prevent files from being validated by Office file validation, we recommend that you also set up trusted locations. Files that are opened from trusted locations skip Office file validation checks. You can also trust specific documents to prevent a file from being validated by Office file validation. Files that are considered to be trusted documents don't undergo Office file validation checks. 
  
<a name="behavior"> </a>

## Change document behavior when validation fails in Office

You can use the **Set document behavior if file validation fails** Group Policy setting to change how documents behave when they fail validation. When you enable this setting, you can select one of the following two options: 
  
- **Block files** Files that fail validation don't open in Protected View and users can't open files for editing. 
  
    If you select the **Open files in Protected View** option, when a file fails validation, users see the following text in the Message Bar: 
    
    **PROTECTED VIEW Office has detected a problem with this file. Click for more details.**
  
    If a user selects the Message Bar, the Microsoft Office Backstage view appears, which provides a more lengthy description of the problem and lets users enable the file for editing.
    
- **Open files in Protected View** Files open in Protected View so users can see the content of the file, but users can't open files for editing. This option represents the default behavior for Office file validation. 
  
    If you select the **Block files** option, users see the following text in a dialog box when a file fails validation: 
    
    **Office has detected a problem with this file. To help protect your computer this file cannot be opened**. 
  
    Users can expand the dialog box and see a more detailed explanation of why the file doesn't open, or they can close the dialog box by selecting **OK**.
    
<a name="errorreport"> </a>

## Turn off Office file validation reporting in Office

You can use the **Turn off error reporting for files that fail file validation** Group Policy setting to suppress the dialog box that prompts users to send information to Microsoft. This setting also prevents validation information from being sent to Microsoft. 
  
Every time that a file fails validation, Office 2016 collects information about why the file failed validation. Approximately two weeks after a file fails validation, Office 2016 prompts users to send Office file validation information to Microsoft. The validation information includes such things as the file types, file sizes, how long it took to open the files, and how long it took to validate the files. A Copy of any file that failed validation is sent to Microsoft. Users see the list of files when they're prompted to send validation information to Microsoft. Users can decline to send validation information to Microsoft, which means no information about failed validations is sent to Microsoft and no files are sent to Microsoft. If an organization restricts Internet access, has restrictive Internet access policies, or doesn't want files sent to Microsoft, you might have to enable the **Turn off error reporting for files that fail file validation** Group Policy setting. 
  
> [!IMPORTANT]
> Office file validation can occasionally indicate that a file failed validation when, in fact, the file is valid. Validation reporting helps Microsoft improve Office file validation and minimize the occurrence of false positive results. 
  
## Related articles
[Block specific file format types in Office 2016](block-specific-file-format-types.md)
  
[Prevent file format attacks by using Office file validation in Office 2016](prevent-file-format-attacks-using-file-validation.md)
  
[Set up a safe environment to open files by using Protected View in Office 2016](protected-view.md)

