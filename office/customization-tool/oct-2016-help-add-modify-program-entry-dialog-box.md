---
title: "Office Customization Tool (OCT) 2016 Help Add/Modify Program Entry dialog box"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
ms.topic: concept-article
ms.service: office-perpetual-itpro
ms.localizationpriority: medium
ms.collection: must-keep
ROBOTS: NOINDEX, NOFOLLOW
ms.date: 06/07/2024
---

# Office Customization Tool (OCT) 2016 Help: Add/Modify Program Entry dialog box

**Applies to:** *Office Professional Plus 2016, Office Standard 2016*

On the **Add installations and run programs** page, if you choose **Add**, the **Add Program Entry** dialog box opens. If you select an entry on the **Add installations and run programs** page, and then choose **Modify**, the **Modify Program Entry** dialog box opens. You can enter the following information in the **Add Program Entry** or **Modify Program Entry** dialog boxes:
  
- In the **Target** box, type the path and file name of the executable program.
    
    Expand the **Target** list to include any of the following standard Windows folders in the path of the executable file.
    

|**Target**|**Windows location**|
|:-----|:-----|
|**[INSTALLLOCATION]** <br/> |The folder in which Office is installed  <br/> |
|**[System Folder]** <br/> |Windows\System32 folder  <br/> |
|**[WindowsFolder]** <br/> |Windows folder  <br/> |
|**[ProgramFilesFolder]** <br/> |Program Files folder  <br/> |
|**[CommonFilesFolder]** <br/> |Program Files\Common Files folder  <br/> |
|**[DesktopFolder]** <br/> |Windows Desktop folder  <br/> |
|**[StartMenuFolder]** <br/> |Windows Start menu  <br/> |
|**[ProgramMenuFolder]** <br/> |Windows Start\Programs menu  <br/> |
|**[CommonFiles64Folder]** <br/> |Program Files\Common Files folder (on 64-bit Windows)  <br/> |
|**[ProgramFIles64Folder]** <br/> |Program Files folder (on 64-bit Windows)  <br/> |
|**[System64Folder]** <br/> |Windows\System32 folder (on 64-bit Windows)  <br/> |

- In the **Arguments** box, type a string of command-line options; for example, /q /path c:\temp.

- Select **Run this program after the Office product has been installed** if you want the program listed in the **Target** box to run after the Office installation is complete. This is the recommended option. If the program doesn't terminate normally, or if it restarts the computer, the Office installation isn't affected. However, programs further down the list don't run.

- Select **Run this program before the Office product has been installed** if you want the program listed in the **Target** box to run before the Office installation starts. If the program doesn't terminate normally, or if it restarts the computer, Office isn't installed, and programs further down the list don't run.

- Choose **OK**.

## Related articles

- [Office Customization Tool (OCT) 2016 Help: Add installations and run programs](oct-2016-help-add-installations-and-run-programs.md)