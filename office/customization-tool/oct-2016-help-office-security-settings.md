---
title: "Office Customization Tool (OCT) 2016 Help Office security settings"
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

# Office Customization Tool (OCT) 2016 Help: Office security settings

**Applies to:** *Office Professional Plus 2016, Office Standard 2016*

**Summary**: Customizes security settings for Office applications.
  
> [!NOTE]
> Security settings specified in a Setup customization (.msp) file become the default settings on users' computers; however, users can change them after installation. To help lock down and to enforce security settings, you must use Group Policy.
  
The Trusted Publishers list identifies trusted sources for digitally signed macros, add-ins, Microsoft ActiveX controls, and other executable code used by Office applications. Choose **Add** next to the **Add the following digital certificates to the Trusted Publishers list** box to add a digital certificate (CER file) to the Trusted Publishers list.
  
Office applications share a certificate-based trusted sources list with Microsoft Internet Explorer. The Trusted Locations list identifies locations from which any file can be opened without being checked by the Trust Center security feature.
  
To add a new location, choose **Add** next to **Add the following paths to the Trusted Locations list**, type the following information, and then choose **OK**:
  
1. Expand the **Application** menu, and then select the Office application that uses this location.
  
2. In the **Path** box, type the path of the trusted location. Enter a fully qualified path with drive letter or UNC path. The path can include environment variables.
  
3. Select **Subfolders of this location are also trusted** to include subfolders as trusted locations.
  
4. In the **Description** box, type text that describes the purpose of the location.
  
To remove a trusted location from this list, select it, and then choose **Remove**.
  
> [!NOTE]
> When you specify one or more trusted locations here, the Trusted Locations list previously defined on the user's computer is cleared and replaced by this list.
  
Select **Remove all Trusted Locations written by OCT during installation** to clear the Trusted Locations list on the users' computers. You can select this check box even if there are no trusted locations defined on this page, if you want to clear the Trusted Locations list on the users' computers.
  
In the **Default Security Settings** list, set default security levels for Office applications. For each Office application, you can set some of the following options:
  
- Allowed trusted locations options
  
  - **Allow trusted locations that are NOT on user's computer**
  
  - **Allow Trusted Locations on the Users machine only** (application default)
  
  - **Disable all trusted locations** (only files signed by trusted publishers will be trusted)
  
- Application add-ins warnings options
  
  - **Disable all Application Extensions**
  
  - **Require that Application Extensions are signed by a trusted publisher**
  
  - **Require that Extensions are signed, and silently disable unsigned Extensions**
  
  - **Enable all installed Application Add-ins** (application default)
  
- VBA macro warnings options
  
  - **Disable all VBA macros**
  
  - **Disable Trust Bar warning for unsigned VBA macros** (unsigned code will be disabled)
  
  - **Disable all VBA macros with notification** (application default)
  
  - **No security checks for VBA macros** (not recommended, code in all documents can run)
  
For Microsoft Project, you can also set the default security setting for add-ins and templates. The options are **Trust all installed add-ins and templates** and **Do not trust installed add-ins and templates**.
  
For **Unsafe ActiveX Initialization**, determine whether unsigned, and therefore potentially unsafe, ActiveX controls can initialize by using persisted data, that is, data that is saved from one instance of the control to the next. The possible values are:
  
- **\<do not configure\>** - Setup doesn't modify the setting specified on the user's computer. New applications are installed with the default setting, which is **Prompt user to use persisted data**.
  
- **Prompt user to use control defaults** - The user is warned before an application initiates ActiveX controls that might be unsafe. If the user trusts the source of the document, the control is initialized using its default settings.
  
- **Prompt user to use persisted data** - The user is warned before an application initiates ActiveX controls that might be unsafe. If the user trusts the source of the document, the control is initialized using persisted data.
  
- **Do not prompt** - All unsigned ActiveX controls run without prompting the user. This setting provides the least protection and isn't recommended.
  
- **Do not prompt and disable all controls** - All unsigned ActiveX controls aren't run and the user isn't warned.