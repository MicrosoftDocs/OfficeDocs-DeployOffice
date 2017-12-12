---
title: "Best practices Uninstall XML files for cloud managed"
ms.author: jwhit
author: jwhit-MSFT
manager: laurawi
ms.date: 3/22/2017
ms.audience: ITPro
ms.topic: reference
ms.service: o365-administration
localization_priority: Normal
ms.collection: Ent_O365
ms.custom:
- DeployProPlus
- DeployProPlus_BestPractices
- DeployProPlus_SOConly
- Ent_Office_ProPlus
ms.assetid: c9ce5ffa-bfc7-4207-a6c0-c24fa9ae9db2
description: "The Best Practices Guide includes deployment recommendations and real-world examples from the Office 365 Product Group and delivery experts from Microsoft Services. For a list of all the articles, see Best practices."
---

# Best practices: Uninstall XML files for cloud managed

 *The Best Practices Guide includes deployment recommendations and real-world examples from the Office 365 Product Group and delivery experts from Microsoft Services. For a list of all the articles, see [Best practices](best-practices.md).* 
  
 *Cloud Managed*  needs an uninstall XML file for the following package:
  
|||
|:-----|:-----|
|**Package** <br/> |**Languages** <br/> |
|Office 365 ProPlus  <br/> |1 language  <br/> |
   
## Office 365 ProPlus

```
<Configuration> 
    <Remove>
      <Product ID="O365ProPlusRetail" > 
         <Language ID="en-us" />
      </Product> 
    </Remove>
    <Property Name="FORCEAPPSHUTDOWN" Value="TRUE" />
    <Display Level="None" />
</Configuration> 
```

 **XML configuration file breakdown**
  
|||
|:-----|:-----|
|**Component** <br/> |**Explanation** <br/> |
|Product ID="O365ProPlusRetail"  <br/> |SKU of Office 365 ProPlus being removed  <br/> |
|Language ID="en-us"  <br/> |The language being removed from Office 365 ProPlus  <br/> |
|FORCEAPPSHUTDOWN Value ="True"  <br/> |Forces any Office apps that are blocking the uninstall of Office to shut down. Data loss may occur.  <br/> |
|Display Level="None"  <br/> |No UI when removing Office 365 ProPlus  <br/> |
   

