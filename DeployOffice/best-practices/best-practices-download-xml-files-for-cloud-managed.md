---
title: "Best practices Download XML files for cloud managed"
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
ms.assetid: 328bc4dc-79ab-4082-a897-25ebe4fc44a9
description: "The Best Practices Guide includes deployment recommendations and real-world examples from the Office 365 Product Group and delivery experts from Microsoft Services. For a list of all the articles, see Best practices."
---

# Best practices: Download XML files for cloud managed

 *The Best Practices Guide includes deployment recommendations and real-world examples from the Office 365 Product Group and delivery experts from Microsoft Services. For a list of all the articles, see [Best practices](best-practices.md).* 
  
 *Cloud Managed*  deployments will rely on Office CDN as a content source and therefore will not create download XML files. However, in the case that they decide at a future date to host the content in an on premises source location, the following download XML files could be used.
  
 *Cloud Managed*  would need download XMLs for the following packages:
  
|||
|:-----|:-----|
|**Package** <br/> |**Languages** <br/> |
|Office 365 ProPlus Semi-Annual Channel 32-Bit  <br/> |1 language  <br/> |
|Office 365 ProPlus Semi-Annual Channel (Targeted) 32-bit  <br/> |1 language  <br/> |
   
 *Cloud Managed*  expects Monthly Channel users to self-provision and self-manage. All applications will be included during the install.
  
## Example download XML files

The following are the Cloud Managed example download XML files to download Office 365 client source files.
  
### Office 365 ProPlus - Semi-Annual Channel - 32-bit

```
<Configuration>
    <Add OfficeClientEdition="32" Channel="Broad">
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
|OfficeClientEdition="32"  <br/> |The architecture of Office being downloaded  <br/> |
|Channel="Broad"  <br/> |The channel build of Office 365 ProPlus being downloaded  <br/> |
|Product ID="O365ProPlusRetail"  <br/> |SKU of Office 365 ProPlus being downloaded  <br/> |
|Language ID="en-us"  <br/> |The language being downloaded for Office 365 ProPlus  <br/> |
   
### Office 365 ProPlus - Semi-Annual Channel (Targeted) - 32-bit

```
<Configuration>
    <Add OfficeClientEdition="32" Channel="Targeted">
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
|OfficeClientEdition="32"  <br/> |The architecture of Office being downloaded  <br/> |
|Channel="Targeted"  <br/> |The channel build of Office 365 ProPlus being downloaded  <br/> |
|Product ID="O365ProPlusRetail"  <br/> |SKU of Office 365 ProPlus being downloaded  <br/> |
|Language ID="en-us"  <br/> |The language being downloaded for Office 365 ProPlus  <br/> |
   

