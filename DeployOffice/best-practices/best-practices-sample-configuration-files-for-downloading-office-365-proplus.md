---
title: "Best practices Sample configuration files for downloading Office 365 ProPlus"
ms.author: jwhit
author: jwhit-MSFT
manager: laurawi
ms.date: 9/9/2017
ms.audience: ITPro
ms.topic: reference
ms.service: o365-administration
localization_priority: Normal
ms.collection: Ent_O365
ms.custom: Ent_Office_ProPlus
ms.assetid: 8efa2040-4259-42e7-8087-f589adcc4190
description: "The Best Practices Guide includes deployment recommendations and real-world examples from the Office 365 Product Group and delivery experts from Microsoft Services. For a list of all the articles, see Best practices."
---

# Best practices: Sample configuration files for downloading Office 365 ProPlus

 *The Best Practices Guide includes deployment recommendations and real-world examples from the Office 365 Product Group and delivery experts from Microsoft Services. For a list of all the articles, see [Best practices](best-practices.md).* 
  
This article includes some common XML configuration files for using the Office Deployment Tool to download Office 365 ProPlus source files.
  
## Sample Download File with all Office Applications - Semi-Annual Channel

```
<Configuration>
   <Add OfficeClientEdition="32" Channel="Broad">
      <Product ID="O365ProPlusRetail">
         <Language ID="en-us" />
      </Product>
   </Add>
</Configuration> 
```

 **XML configuration file breakdown**
  
|||
|:-----|:-----|
|**Component** <br/> |**Explanation** <br/> |
|OfficeClientEdition="32"  <br/> |The architecture of Office being downloaded.  <br/> |
|Channel="Broad"  <br/> |The channel build of Office 365 ProPlus being downloaded.  <br/> |
|Product ID="O365ProPlusRetail"  <br/> |SKU of Office 365 ProPlus being downloaded  <br/> |
|Language ID="en-us"  <br/> |The default language forOffice 365 ProPlus.  <br/> |
   
## Sample Download File with all Office Applications in 64-bit - Monthly Channel

```
<Configuration>
   <Add OfficeClientEdition="64" Channel="Monthly">
      <Product ID="O365ProPlusRetail"> 
         <Language ID="en-us" />
      </Product> 
   </Add>
</Configuration> 
```

 **XML configuration file breakdown**
  
|||
|:-----|:-----|
|**Component** <br/> |**Explanation** <br/> |
|OfficeClientEdition="64"  <br/> |The architecture of Office being downloaded.  <br/> |
|Channel="Monthly"  <br/> |The channel build of Office 365 ProPlus being downloaded.  <br/> |
|Product ID="O365ProPlusRetail"  <br/> |SKU of Office 365 ProPlus being downloaded  <br/> |
|Language ID="en-us"  <br/> |The default language forOffice 365 ProPlus.  <br/> |
   
## Sample Download File with all Office Applications with English and Spanish - Semi-Annual Channel

```
<Configuration>
   <Add OfficeClientEdition="32" Channel="Broad">
      <Product ID="O365ProPlusRetail"> 
         <Language ID="en-us" />
         <Language ID="es-es" /> 
      </Product>
   </Add> 
</Configuration> 
```

 **XML configuration file breakdown**
  
|||
|:-----|:-----|
|**Component** <br/> |**Explanation** <br/> |
|OfficeClientEdition="32"  <br/> |The architecture of Office being downloaded.  <br/> |
|Channel="Broad"  <br/> |The channel build of Office 365 ProPlus being downloaded.  <br/> |
|Product ID="O365ProPlusRetail"  <br/> |SKU of Office 365 ProPlus being downloaded  <br/> |
|Language ID="en-us"  <br/> |The default language forOffice 365 ProPlus.  <br/> |
|Language ID="es-es"  <br/> |The additional language being downloaded for Office 365 ProPlus.  <br/> |
   
## Sample Download File with all Applications including Visio and Project 2016 Click to Run - Semi-Annual Channel

```
<Configuration>
   <Add OfficeClientEdition="32" Channel="Broad">
      <Product ID="O365ProPlusRetail"> 
         <Language ID="en-us" />
      </Product>
      <Product ID="VisioProRetail">
         <Language ID="en-us" /> 
      </Product>
      <Product ID="ProjectProRetail">
         <Language ID="en-us" />
      </Product> 
   </Add>
</Configuration> 
```

 **XML configuration file breakdown**
  
|||
|:-----|:-----|
|**Component** <br/> |**Explanation** <br/> |
|OfficeClientEdition="32"  <br/> |The architecture of Office being downloaded.  <br/> |
|Channel="Broad"  <br/> |The channel build of Office 365 ProPlus being downloaded.  <br/> |
|Product ID="O365ProPlusRetail"  <br/> |SKU of Office 365 ProPlus being downloaded  <br/> |
|Language ID="en-us"  <br/> |The default language forOffice 365 ProPlus.  <br/> |
|Product ID="VisioProRetail"  <br/> |Visio 2016 Office 365 ProPlus. Note: Visio 2016 Office 365 ProPlus must be on the same update channel as Office 365 ProPlus.  <br/> |
|Language ID="en-us"  <br/> |The default language being downloaded for Visio 2016 Click to Run.  <br/> |
|Product ID="ProjectProRetail"  <br/> |Project 2016Office 365 ProPlus. Note: Project 2016 Office 365 ProPlus must be on the same update channel as Office 365 ProPlus.  <br/> |
|Language ID="en-us"  <br/> |The default language being downloaded for Project 2016 Click to Run.  <br/> |
   
## Sample Download File with all Applications including Visio and Project 2016 Click to Run with English and Spanish - Semi-Annual Channel

```
<Configuration>
   <Add OfficeClientEdition="32" Channel="Broad">
      <Product ID="O365ProPlusRetail">
         <Language ID="en-us" />
         <Language ID="es-es" /> 
      </Product>
      <Product ID="VisioProRetail"> 
         <Language ID="en-us" />
         <Language ID="es-es" /> 
      </Product>
      <Product ID="ProjectProRetail"> 
         <Language ID="en-us" />
         <Language ID="es-es" /> 
      </Product>
   </Add> 
</Configuration> 
```

 **XML configuration file breakdown**
  
|||
|:-----|:-----|
|**Component** <br/> |**Explanation** <br/> |
|OfficeClientEdition="32"  <br/> |The architecture of Office being downloaded.  <br/> |
|Channel="Broad"  <br/> |The channel build of Office 365 ProPlus being downloaded.  <br/> |
|Product ID="O365ProPlusRetail"  <br/> |SKU of Office 365 ProPlus being downloaded  <br/> |
|Language ID="en-us"  <br/> |The default language forOffice 365 ProPlus.  <br/> |
|Language ID="es-es"  <br/> |The additional language being downloaded for Office 365 ProPlus.  <br/> |
|Product ID="VisioProRetail"  <br/> |Visio 2016 Office 365 ProPlus. Note: Visio 2016 Office 365 ProPlus must be on the same update channel as Office 365 ProPlus.  <br/> |
|Language ID="en-us"  <br/> |The default language being downloaded for Visio 2016 Click to Run.  <br/> |
|Language ID="es-es"  <br/> |The additional language being downloaded for Visio 2016 Click to Run.  <br/> |
|Product ID="ProjectProRetail"  <br/> |Project 2016Office 365 ProPlus. Note: Project 2016 Office 365 ProPlus must be on the same update channel as Office 365 ProPlus.  <br/> |
|Language ID="en-us"  <br/> |The default language being downloaded for Project 2016 Click to Run.  <br/> |
|Language ID="es-es"  <br/> |The additional language being downloaded for Project 2016 Click to Run.  <br/> |
   
## Sample Download File with all Applications including Visio (VL) and Project (VL) 2016 Click to Run - Semi-Annual Channel

```
<Configuration>
   <Add OfficeClientEdition="32" Channel="Broad">
      <Product ID="O365ProPlusRetail">
         <Language ID="en-us" />
      </Product>
      <Product ID="VisioProXVolume">
         <Language ID="en-us" />
      </Product>
      <Product ID="ProjectProXVolume">
         <Language ID="en-us" />
      </Product> 
   </Add>
</Configuration> 
```

 **XML configuration file breakdown**
  
|||
|:-----|:-----|
|**Component** <br/> |**Explanation** <br/> |
|OfficeClientEdition="32"  <br/> |The architecture of Office being downloaded.  <br/> |
|Channel="Broad"  <br/> |The channel build of Office 365 ProPlus being downloaded.  <br/> |
|Product ID="O365ProPlusRetail"  <br/> |SKU of Office 365 ProPlus being downloaded  <br/> |
|Language ID="en-us"  <br/> |The default language forOffice 365 ProPlus.  <br/> |
|Product ID="VisioProXVolume"  <br/> |Visio 2016 Office 365 ProPlus volume licensed. Note: Visio 2016 Office 365 ProPlus must be on the same update channel as Office 365 ProPlus.  <br/> |
|Language ID="en-us"  <br/> |The default language being downloaded for Visio 2016 Click to Run.  <br/> |
|Product ID="ProjectProXVolumel"  <br/> |Project 2016Office 365 ProPlus volume licensed. Note: Project 2016 Office 365 ProPlus must be on the same update channel as Office 365 ProPlus.  <br/> |
|Language ID="en-us"  <br/> |The default language being downloaded for Project 2016 Click to Run.  <br/> |
   

