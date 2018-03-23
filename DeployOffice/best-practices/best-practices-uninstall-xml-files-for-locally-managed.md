---
title: "Best practices Uninstall XML files for locally managed"
ms.author: jwhit
author: jwhit-MSFT
manager: laurawi
ms.date: 3/22/2017
ms.audience: ITPro
ms.topic: reference
ms.service: o365-proplus-itpro
localization_priority: Normal
ms.collection: Ent_O365
ms.custom:
- Ent_Office_ProPlus_Best
- Ent_Office_ProPlus
ms.assetid: d66205f9-cf21-43df-bb19-af18cf0048bb
description: "The Best Practices Guide includes deployment recommendations and real-world examples from the Office 365 Product Group and delivery experts from Microsoft Services. For a list of all the articles, see Best practices."
---

# Best practices: Uninstall XML files for locally managed

 *The Best Practices Guide includes deployment recommendations and real-world examples from the Office 365 Product Group and delivery experts from Microsoft Services. For a list of all the articles, see [Best practices](best-practices.md).* 
  
 *Locally Managed*  needs uninstall XML files for the following packages:
  
|||
|:-----|:-----|
|**Package** <br/> |**Languages** <br/> |
|Office 365 ProPlus - CanAm Region  <br/> |2 languages  <br/> |
|Office 365 ProPlus - Germany  <br/> |1 language  <br/> |
|Project Pro  <br/> |1 language  <br/> |
|Visio Pro  <br/> |1 language  <br/> |
|Project Pro (VL)  <br/> |1 language  <br/> |
|Visio Pro (VL)  <br/> |1 language  <br/> |
   
## Example uninstall XML files

The following are the  *Locally Managed*  example uninstall XML files for removing Office 365 clients.
  
### Office 365 ProPlus - CanAm Region

```
<Configuration>
  <Remove>
    <Product ID="O365ProPlusRetail">
      <Language ID="en-us" />
      <Language ID="fr-fr" />
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
|Language ID="ii-cc"  <br/> |The languages being removed from Office 365 ProPlus  <br/> |
|FORCEAPPSHUTDOWN Value ="True"  <br/> |Forces any Office apps that are blocking the uninstall of Office to shut down. Data loss may occur.  <br/> |
|Display Level="None"  <br/> |No UI when removing Office 365 ProPlus  <br/> |
   
## Office 365 ProPlus - Germany

```
<Configuration>
  <Remove>
    <Product ID="O365ProPlusRetail">
      <Language ID="de-de" />
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
|Language ID="de-de"  <br/> |The language being removed from Office 365 ProPlus  <br/> |
|FORCEAPPSHUTDOWN Value ="True"  <br/> |Forces any Office apps that are blocking the uninstall of Office to shut down. Data loss may occur.  <br/> |
|Display Level="None"  <br/> |No UI when removing Office 365 ProPlus  <br/> |
   
## Project Pro

```
<Configuration>
  <Remove>
    <Product ID="ProjectProRetail">
      <Language ID="en-es" />
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
|Product ID="ProjectProRetail"  <br/> |SKU of Project Pro being removed  <br/> |
|Language ID="en-es"  <br/> |The language being removed from Project Pro  <br/> |
|FORCEAPPSHUTDOWN Value ="True"  <br/> |Forces any Office apps that are blocking the uninstall of Project Pro to shut down. Data loss may occur.  <br/> |
|Display Level="None"  <br/> |No UI when removing Project Pro  <br/> |
   
## Visio Pro

```
<Configuration>
  <Remove>
    <Product ID="VisioProRetail">
      <Language ID="en-es" />
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
|Product ID="VisioProRetail"  <br/> |SKU of Visio Pro being removed  <br/> |
|Language ID="en-es"  <br/> |The language being removed from Visio Pro  <br/> |
|FORCEAPPSHUTDOWN Value ="True"  <br/> |Forces any Office apps that are blocking the uninstall of Visio Pro to shut down. Data loss may occur.  <br/> |
|Display Level="None"  <br/> |No UI when removing Visio Pro  <br/> |
   

