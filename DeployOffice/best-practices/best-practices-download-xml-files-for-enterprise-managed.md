---
title: "Best practices Download XML files for enterprise managed"
ms.author: jwhit
author: jwhit-MSFT
manager: laurawi
ms.date: 9/9/2017
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
ms.assetid: a7fcdebf-97e5-4551-84f8-f2cb993c16da
description: "The Best Practices Guide includes deployment recommendations and real-world examples from the Office 365 Product Group and delivery experts from Microsoft Services. For a list of all the articles, see Best practices."
---

# Best practices: Download XML files for enterprise managed

 *The Best Practices Guide includes deployment recommendations and real-world examples from the Office 365 Product Group and delivery experts from Microsoft Services. For a list of all the articles, see [Best practices](best-practices.md).* 
  
 *Enterprise Managed*  needs download XMLs for the following packages:
  
|||
|:-----|:-----|
|**Package** <br/> |**Languages** <br/> |
|Office 365 ProPlus - Semi-Annual Channel - 32-bit  <br/> |17 languages  <br/> |
|Project Pro (VL) - Semi-Annual Channel - 32-bit  <br/> |1 language  <br/> |
|Visio Pro (VL) - Semi-Annual Channel - 32-bit  <br/> |1 language  <br/> |
|Office 365 ProPlus - Semi-Annual Channel - 64-bit  <br/> |1 language  <br/> |
|Office 365 ProPlus, Project Pro (VL), and Visio Pro (VL) - Semi-Annual Channel (Targeted) - 32-bit  <br/> |1 language  <br/> |
   
 *Enterprise Managed*  expects Monthly Channel users to self-provision and self-manage, and will be removing the OneDrive for Business application at time of deployment for all users.
  
## Example download XML files

The following are the Enterprise Managed example download XML files for downloading Office 365 client source files.
  
### Office 365 ProPlus, Project Pro (VL), and Visio Pro (VL) - Semi-Annual Channel - 32-bit

```
<Configuration>
   <Add OfficeClientEdition="32" Channel="Broad">
      <Product ID="O365ProPlusRetail"> 
         <Language ID="en-us" />
         <Language ID="fr-fr" />
         <Language ID="es-es" />
         <Language ID="pt-br" />
         <Language ID="zh-cn" />
         <Language ID="zh-tw" />
         <Language ID="id-id" />
         <Language ID="ja-jp" />
         <Language ID="ko-kr" />
         <Language ID="ms-my" />
         <Language ID="th-th" />
         <Language ID="cs-cz" />
         <Language ID="da-dk" />
         <Language ID="nl-nl" />
         <Language ID="fi-fi" />
         <Language ID="de-de" />
         <Language ID="el-gr" />
      </Product>
      <Product ID="ProjectProXVolume">
         <Language ID="en-us" />
      </Product>
      <Product ID="VisioProXVolume">
         <Language ID="en-us" />
      </Product>
   </Add>
</Configuration> 
```

 **XML download file breakdown**
  
|||
|:-----|:-----|
|**Component** <br/> |**Explanation** <br/> |
|OfficeClientEdition="32"  <br/> |The architecture of Office being downloaded  <br/> |
|Channel="Broad"  <br/> |The channel build of Office 365 ProPlus being downloaded  <br/> |
|Product ID="O365ProPlusRetail"  <br/> |SKU of Office 365 ProPlus being downloaded  <br/> |
|Language ID="ii-cc"  <br/> |The languages being downloaded for Office 365 ProPlus  <br/> |
|Product ID="ProjectProXVolume"  <br/> |SKU of Project Pro being downloaded  <br/> |
|Language ID="en-us"  <br/> |The language being downloaded for Project Pro  <br/> |
|Product ID="VisioProXVolume"  <br/> |SKU of Visio Pro being downloaded  <br/> |
|Language ID="en-us"  <br/> |The language being downloaded for Visio Pro  <br/> |
   
### Office 365 ProPlus - Semi-Annual Channel - 64-bit

```
<Configuration>
   <Add OfficeClientEdition="64" Channel="Broad">
      <Product ID="O365ProPlusRetail">
         <Language ID="en-us" />
      </Product>
   </Add>
</Configuration> 
```

 **XML download file breakdown**
  
|||
|:-----|:-----|
|**Component** <br/> |**Explanation** <br/> |
|OfficeClientEdition="64"  <br/> |The architecture of Office being downloaded  <br/> |
|Channel="Broad"  <br/> |The channel build of Office 365 ProPlus being downloaded  <br/> |
|Product ID="O365ProPlusRetail"  <br/> |SKU of Office 365 ProPlus being downloaded  <br/> |
|Language ID="en-us"  <br/> |The language being downloaded for Office 365 ProPlus  <br/> |
   
### Office 365 ProPlus, Project Pro (VL), and Visio Pro (VL) - Semi-Annual Channel (Targeted) - 32-bit

```
<Configuration>
   <Add OfficeClientEdition="32" Channel="Targeted">
      <Product ID="O365ProPlusRetail">
         <Language ID="en-us" />
      </Product>
      <Product ID="ProjectProXVolume">
         <Language ID="en-us" />
      </Product>
      <Product ID="VisioProXVolume">
         <Language ID="en-us" />
      </Product>
   </Add>
</Configuration> 
```

 **XML download file breakdown**
  
|||
|:-----|:-----|
|**Component** <br/> |**Explanation** <br/> |
|OfficeClientEdition="32"  <br/> |The architecture of Office being downloaded  <br/> |
|Channel="Targeted"  <br/> |The channel build of Office 365 ProPlus being downloaded  <br/> |
|Product ID="O365ProPlusRetail"  <br/> |SKU of Office 365 ProPlus being downloaded  <br/> |
|Language ID="en-us"  <br/> |The language being downloaded for Office 365 ProPlus  <br/> |
|Product ID="ProjectProXVolume"  <br/> |SKU of Project Pro being downloaded  <br/> |
|Language ID="en-us"  <br/> |The language being downloaded for Project Pro  <br/> |
|Product ID="VisioProXVolume"  <br/> |SKU of Visio Pro being downloaded  <br/> |
|Language ID="en-us"  <br/> |The language being downloaded for Visio Pro  <br/> |
   

