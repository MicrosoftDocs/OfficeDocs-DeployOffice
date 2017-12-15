---
title: "Best practices Download XML files for locally managed"
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
ms.assetid: 5b5f4aab-7100-4e14-b3d6-218d0a267765
description: "The Best Practices Guide includes deployment recommendations and real-world examples from the Office 365 Product Group and delivery experts from Microsoft Services. For a list of all the articles, see Best practices."
---

# Best practices: Download XML files for locally managed

 *The Best Practices Guide includes deployment recommendations and real-world examples from the Office 365 Product Group and delivery experts from Microsoft Services. For a list of all the articles, see [Best practices](best-practices.md).* 
  
 *Locally Managed*  must download XML files for the following packages:
  
|||
|:-----|:-----|
|**Package** <br/> |**Languages** <br/> |
|Office 365 ProPlus - Semi-Annual Channel - 32-Bit  <br/> |3 languages  <br/> |
|Project Pro - Semi-Annual Channel - 32-bit  <br/> |1 language  <br/> |
|Visio Pro - Semi-Annual Channel - 32-bit  <br/> |1 language  <br/> |
|Office 365 ProPlus, Project Pro, and Visio Pro - Semi-Annual Channel (Targeted) - 32-bit  <br/> |1 language  <br/> |
   
 *Locally Managed*  expects Monthly Channel users to self-provision and self-manage.
  
## Example download XML files

The following are the  *Locally Managed*  example download XML files to download Office 365 client source files.
  
### Office 365 ProPlus, Project Pro, and Visio Pro - Semi-Annual Channel - 32-bit

```
<Configuration>
  <Add OfficeClientEdition="32" Channel="Broad">
    <Product ID="O365ProPlusRetail">
      <Language ID="en-us" />
      <Language ID="fr-fr" />
      <Language ID="de-de" />
    </Product>
    <Product ID="ProjectProRetail">
      <Language ID="en-us" />
    </Product>
    <Product ID="VisioProRetail">
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
|Product ID="ProjectProRetail"  <br/> |SKU of Project Pro being downloaded  <br/> |
|Language ID="en-us"  <br/> |The language being downloaded for Project Pro  <br/> |
|Product ID="VisioProRetail"  <br/> |SKU of Visio Pro being downloaded  <br/> |
|Language ID="en-us"  <br/> |The language being downloaded for Visio Pro  <br/> |
   
### Office 365 ProPlus, Project Pro, and Visio Pro - Semi-Annual Channel (Targeted) - 32-bit

```
<Configuration>
  <Add OfficeClientEdition="32" Channel="Targeted">
    <Product ID="O365ProPlusRetail">
      <Language ID="en-us" />
    </Product>
    <Product ID="ProjectProRetail">
      <Language ID="en-us" />
    </Product>
    <Product ID="VisioProRetail">
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
|Product ID="ProjectProRetail"  <br/> |SKU of Project Pro being downloaded  <br/> |
|Language ID="en-us"  <br/> |The language being downloaded for Project Pro  <br/> |
|Product ID="VisioProRetail"  <br/> |SKU of Visio Pro being downloaded  <br/> |
|Language ID="en-us"  <br/> |The language being downloaded for Visio Pro  <br/> |
   

