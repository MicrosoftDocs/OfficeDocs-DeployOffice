---
title: "Office Customization Tool (OCT) 2016 Help Outlook Profile"
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

# Office Customization Tool (OCT) 2016 Help: Outlook Profile

**Applies to:** *Office Professional Plus 2016, Office Standard 2016*

**Summary**: Customizes users' default Outlook profiles, which are the sets of values in the Windows registry that define user-specific information.
  
An Outlook profile can contain multiple e-mail accounts. Users can have multiple Outlook profiles, but you can configure only one profile in the Setup customization file.
  
- **Use existing profile** - Use the profile already configured on the user's computer, or prompt the user to create a profile the first time that Outlook is started. Selecting this option disables the other Outlook sections of the OCT.

- **Modify profile** - Modify the default profile on the user's computer or define changes to profiles with a name that you specify. If no default profile exists, or there's no profile by the name that you specify, Outlook creates a profile based on the options that you choose in the other Outlook sections of the OCT. Outlook uses the default profile name, **Outlook**, or the profile name that you have specified.

- **New profile** - Create a new profile on the user's computer and make it the default profile; any existing profiles aren't removed and remain available to users. You must type a name in the **Profile name** box. This name appears in the **E-mail Accounts** dialog box in Outlook. Outlook creates the profile based on the options that you choose in the other Outlook sections of the OCT.

- **Apply PRF** - Import an Outlook profile file (PRF file) to define a new default profile or update an existing profile. Selecting this option disables the other Outlook sections in the OCT but doesn't update the OCT with the settings in the PRF file. In the **Apply the following profile (PRF file)** box, type a name and path for the profile. If you created a PRF file for a previous version of Outlook, you can import it to Outlook, provided that the profile defines only MAPI services.

If you install Outlook on locked-down computers on which users don't have administrative rights, users can't configure their Outlook profiles after Outlook is installed.