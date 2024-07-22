---
title: "Office Customization Tool (OCT) 2016 Help Add Account and Account Settings dialog box"
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

# Office Customization Tool (OCT) 2016 Help: Add Account and Account Settings dialog box

**Applies to:** *Office Professional Plus 2016, Office Standard 2016*

If you're adding a new account, select the type of account to add, and then choose **Next**.
  
In the **\<account type\> Settings** dialog box, set the options appropriate for the type of account that you're adding or modifying. Choose **More Settings** for additional configuration options. Choose **Finish** when you're done.
  
To ensure that e-mail services don't overlap, Outlook might not allow you to add more than one new account for the same type of service. For example, Outlook verifies that all POP accounts have unique names. The following table shows how Outlook determines whether a new account of the same type as an existing account can be added to the Setup customization file.
  
|**Account type**|**Duplicate account allowed?**|**Data used to determine whether conflict exists**|
|:-----|:-----|:-----|
|**POP3** <br/> |Yes  <br/> |Account name  <br/> |
|**IMAP** <br/> |Yes  <br/> |Account name  <br/> |
|**Exchange** <br/> |Yes  <br/> |Account name  <br/> |
|**Outlook data file (.pst)** <br/> |Yes  <br/> |File name and path of .pst file  <br/> |
|**Outlook Address Book** <br/> |No  <br/> |Existence of account  <br/> |
|**Internet Directory Service (LDAP)** <br/> |Yes  <br/> |Account name  <br/> |

## Related articles

- [Office Customization Tool (OCT) 2016 Help: Add accounts](oct-2016-help-add-accounts.md)
- [Office Customization Tool (OCT) 2016 Help: Outlook Anywhere](oct-2016-help-outlook-anywhere.md)
- [Office Customization Tool (OCT) 2016 Help: Cached Mode](oct-2016-help-cached-mode.md)