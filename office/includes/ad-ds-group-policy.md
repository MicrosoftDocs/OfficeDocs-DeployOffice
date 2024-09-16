---
author: nwhite
ms.author: nwhite
manager: dougeby
ms.service: office-perpetual-itpro
ms.localizationpriority: high
ms.topic: include
description: Explains how to use Group Policy to specify update settings.
ms.date: 09/18/2024
---
<!--This file is shared by ltsc/2024/update.md, ltsc/2024/update.md. Headings are driven by article context.-->
If you have Windows Server and Active Directory Domain Services (AD DS) deployed in your organization, you can configure update settings for Office by using Group Policy. To do this, download the most current [Administrative Template files (ADMX/ADML for Office)](https://www.microsoft.com/download/details.aspx?id=49030), which include the policy settings for Office.

After you copy the Administrative Template files to AD DS, you'll find the update policy settings under Computer Configuration\Policies\Administrative Templates\Microsoft Office 2016 (Machine)\Updates in the Group Policy Management tool. You'll also find a description of how to configure each policy setting. For example, you can use the "Update path" Group Policy setting to specify where Office should look for updates.
