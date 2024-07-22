---
title: "Office Customization Tool (OCT) 2016 Help Add files"
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

# Office Customization Tool (OCT) 2016 Help: Add files

**Applies to:** *Office Professional Plus 2016, Office Standard 2016*

**Summary**: Adds files to users' computers when Office is installed.
  
- To create a list of files to add to a user's computer during installation, choose **Add**, navigate to the file that you want to add to the list, and then choose **Add** again. You can use the SHIFT and CTRL keys to select multiple files at one time.

    In the **File Destination Path** dialog box, the **File name(s)** box populates automatically with the name of the files that you selected. In the **Destination path on the user's computer** box, type the path that you want for the destination folder on the user's computers, or leave the suggested path, and then choose **OK**.

- To change the destination path of a file, select the file in the list, and then choose **Modify**.

- To remove a file from the list, select the file, and then choose **Remove**. You can use the SHIFT and CTRL keys to select multiple files at one time.

When adding files to an Office installation, note the following:
  
- Files are copied into the Setup customization file when you save the customization file and exit the OCT. Large files increase the size of the customization file and the amount of time that it takes to create it.

- If you revise a file that is currently included in the customization file, you must open the customization file in the OCT, remove the file from the **Add files** list, add the revised version, and then save the customization file.

- If the user removes, repairs, or reinstalls Office, the custom files are removed or reinstalled along with Office. Setup doesn't reinstall a custom file, however, if the file has changed since installation.

## Related articles

- [Office Customization Tool (OCT) 2016 Help: File Destination Path dialog box](oct-2016-help-file-destination-path-dialog-box.md)