---
title: "Office Customization Tool (OCT) 2016 Help Add/Modify Registry Entry dialog box"
ms.author: danbrown
author: DHB-MSFT
manager: laurawi
ms.date: 8/28/2015
ms.audience: ITPro
ms.topic: get-started-article
ms.prod: office-perpetual-itpro
localization_priority: Normal
ms.collection: Ent_O365
ms.custom: Ent_Office_VL
ms.assetid: 38078300-8715-4d5d-90b3-5888403dd9cb
description: "In the Add/Modify Registry Entry dialog box, you can configure the following information for each registry entry, and then choose OK:"
---

# Office Customization Tool (OCT) 2016 Help: Add/Modify Registry Entry dialog box

In the **Add/Modify Registry Entry** dialog box, you can configure the following information for each registry entry, and then choose **OK**:
  
- From the **Root** list, select the branch that contains the entries you want to add or modify. Settings are applied once per user (HKEY_CURRENT_USER) or once per computer (HKEY_LOCAL_MACHINE). Note that you cannot add registry entries to the root of HKEY_USERS or HKEY_LOCAL_MACHINE. 
    
- From the **Data type** menu and select the data type for the registry value you are adding or modifying. 
    
- In the **Key** box, type the name of the subkey where the entry is stored, for example, Software\Microsoft\Office\16.0\Common. 
    
- Select **Create empty key** if the registry entry does not contain a value name or value data. Some settings are determined by the presence or absence of the registry entry. 
    
- In the **Value name** type the name for the new registry entry. If you include **Value data**, but leave this field blank, the value is assigned the name <Default>. A key can have only one <Default> value name. 
    
- In the **Value data** box, type the value to store in the new registry entry. The data must match the data type. 
    
## See also

#### 

[Office Customization Tool (OCT) 2016 Help: Add registry entries](oct-2016-help-add-registry-entries.md)

