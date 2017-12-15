---
title: "Best practices Uninstall XML files for enterprise managed"
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
ms.assetid: 8d86741d-51da-4b73-91bb-506579494bd3
description: "The Best Practices Guide includes deployment recommendations and real-world examples from the Office 365 Product Group and delivery experts from Microsoft Services. For a list of all the articles, see Best practices."
---

# Best practices: Uninstall XML files for enterprise managed

 *The Best Practices Guide includes deployment recommendations and real-world examples from the Office 365 Product Group and delivery experts from Microsoft Services. For a list of all the articles, see [Best practices](best-practices.md).* 
  
 *Enterprise Managed*  needs uninstall XML files for the following packages:
  
|||
|:-----|:-----|
|**Package** <br/> |**Languages** <br/> |
|Office 365 ProPlus - North America Region  <br/> |3 languages  <br/> |
|Office 365 ProPlus - LATAM Region  <br/> |2 languages  <br/> |
|Office 365 ProPlus - AsiaPAC Region  <br/> |7 languages  <br/> |
|Office 365 ProPlus - EU Region  <br/> |6 languages  <br/> |
|Project Pro (VL)  <br/> |1 language  <br/> |
|Visio Pro (VL)  <br/> |1 language  <br/> |
   
## Example uninstall XML files

The following are the  *Enterprise Managed*  example uninstall XML files to remove Office 365 clients.
  
### Office 365 ProPlus - North America Region

```
Configuration>
  <Remove>
    <Product ID="O365ProPlusRetail">
      <Language ID="en-us" />
      <Language ID="fr-fr" />
      <Language ID="es-es" />
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
   
### Office 365 ProPlus - LATAM Region

```
<Configuration>
  <Remove>
    <Product ID="O365ProPlusRetail">
      <Language ID="es-es" />
      <Language ID="pt-br" />
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
   
### Office 365 ProPlus - AsiaPac Region

```
<Configuration>
  <Remove>
    <Product ID="O365ProPlusRetail">
      <Language ID="zh-cn" />
      <Language ID="zh-tw" />
      <Language ID="id-id" />
      <Language ID="ja-jp" />
      <Language ID="ko-kr" />
      <Language ID="ms-my" />
      <Language ID="th-th" />
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
   
### Office 365 ProPlus - EU Region

```
<Configuration>
  <Remove>
    <Product ID="O365ProPlusRetail">
      <Language ID="cs-cz" />
      <Language ID="da-dk" />
      <Language ID="nl-nl" />
      <Language ID="fi-fi" />
      <Language ID="de-de" />
      <Language ID="el-gr" />
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
   
### Project Pro (VL)

```
<Configuration>
  <Remove>
    <Product ID="ProjectProXVolume">
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
|Product ID="ProjectProXVolume"  <br/> |SKU of Office 365 ProPlus being removed  <br/> |
|Language ID="en-us"  <br/> |The language being removed from Project Pro (VL)  <br/> |
|FORCEAPPSHUTDOWN Value ="True"  <br/> |Forces any Office apps that are blocking the uninstall of Project Pro (VL) to shut down. Data loss may occur.  <br/> |
|Display Level="None"  <br/> |No UI when removing Project Pro (VL)  <br/> |
   
### Visio Pro (VL)

```
<Configuration>
  <Remove>
    <Product ID="VisioProXVolume">
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
|Product ID="VisioProXVolume"  <br/> |SKU of Visio Pro (VL) being removed  <br/> |
|Language ID="en-us"  <br/> |The language being removed from Visio Pro (VL)  <br/> |
|FORCEAPPSHUTDOWN Value ="True"  <br/> |Forces any Office apps that are blocking the uninstall of Visio Pro (VL) to shut down. Data loss may occur.  <br/> |
|Display Level="None"  <br/> |No UI when removing Visio Pro (VL)  <br/> |
   

