---
title: "Office Customization Tool (OCT) 2016 Help Add/Modify Registry Entry dialog box"
ms.author: danbrown
author: DHB-MSFT
manager: dougeby
ms.date: 9/22/2015
audience: ITPro
ms.topic: article
ms.service: office-perpetual-itpro
ms.localizationpriority: medium
ms.collection: tier2
ROBOTS: NOINDEX, NOFOLLOW
---

# Office Customization Tool (OCT) 2016 Help: Add/Modify Registry Entry dialog box

**Applies to:** *Office Professional Plus 2016, Office Standard 2016*

In the **Add/Modify Registry Entry** dialog box, you can configure the following information for each registry entry, and then choose **OK**:
  
- From the **Root** list, select the branch that contains the entries you want to add or modify. Settings are applied once per user (HKEY_CURRENT_USER) or once per computer (HKEY_LOCAL_MACHINE). Note that you cannot add registry entries to the root of HKEY_USERS or HKEY_LOCAL_MACHINE. 
    
- From the **Data type** menu and select the data type for the registry value you are adding or modifying. 
    
- In the **Key** box, type the name of the subkey where the entry is stored, for example, Software\Microsoft\Office\16.0\Common. 
    
- Select **Create empty key** if the registry entry does not contain a value name or value data. Some settings are determined by the presence or absence of the registry entry. 
    
- In the **Value name** type the name for the new registry entry. If you include **Value data**, but leave this field blank, the value is assigned the name \<Default\>. A key can have only one \<Default\> value name. 
    
- In the **Value data** box, type the value to store in the new registry entry. The data must match the data type. 
    
## Related topics
[Office Customization Tool (OCT) 2016 Help: Add registry entries](oct-2016-help-add-registry-entries.md)

