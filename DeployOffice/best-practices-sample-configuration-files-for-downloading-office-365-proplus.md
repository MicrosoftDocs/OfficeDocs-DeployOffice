---
title: Best practices Sample configuration files for downloading Office 365 ProPlus
ms.prod: OFFICE365
ms.assetid: 8efa2040-4259-42e7-8087-f589adcc4190
---


# Best practices: Sample configuration files for downloading Office 365 ProPlus

 *The Best Practices Guide includes deployment recommendations and real-world examples from the Office 365 Product Group and delivery experts from Microsoft Services. For a list of all the articles, see  [Best practices guide for deploying Office 365 ProPlus in the enterprise](best-practices-guide-for-deploying-office-365-proplus-in-the-enterprise.md).* 
  
    
    

This article includes some common XML configuration files for using the Office 2016 Deployment Tool to download Office UNRESOLVED_TOKEN_VAL(365) ProPlus source files.
## Sample Download File with all Office Applications - Deferred Channel


```

<Configuration>
   <Add OfficeClientEdition="32" Channel="Deferred">
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
|Channel="Deferred"  <br/> |The channel build of Office UNRESOLVED_TOKEN_VAL(365) ProPlus being downloaded.  <br/> |
|Product ID="O365ProPlusRetail"  <br/> |SKU of Office UNRESOLVED_TOKEN_VAL(365) ProPlus being downloaded  <br/> |
|Language ID="en-us"  <br/> |The default language forOffice UNRESOLVED_TOKEN_VAL(365) ProPlus.  <br/> |
   

## Sample Download File with all Office Applications in 64-bit - Current Channel


```

<Configuration>
   <Add OfficeClientEdition="64" Channel="Current">
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
|Channel="Current"  <br/> |The channel build of Office UNRESOLVED_TOKEN_VAL(365) ProPlus being downloaded.  <br/> |
|Product ID="O365ProPlusRetail"  <br/> |SKU of Office UNRESOLVED_TOKEN_VAL(365) ProPlus being downloaded  <br/> |
|Language ID="en-us"  <br/> |The default language forOffice UNRESOLVED_TOKEN_VAL(365) ProPlus.  <br/> |
   

## Sample Download File with all Office Applications with English and Spanish - Deferred Channel


```

<Configuration>
   <Add OfficeClientEdition="32" Channel="Deferred">
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
|Channel="Deferred"  <br/> |The channel build of Office UNRESOLVED_TOKEN_VAL(365) ProPlus being downloaded.  <br/> |
|Product ID="O365ProPlusRetail"  <br/> |SKU of Office UNRESOLVED_TOKEN_VAL(365) ProPlus being downloaded  <br/> |
|Language ID="en-us"  <br/> |The default language forOffice UNRESOLVED_TOKEN_VAL(365) ProPlus.  <br/> |
|Language ID="es-es"  <br/> |The additional language being downloaded for Office UNRESOLVED_TOKEN_VAL(365) ProPlus.  <br/> |
   

## Sample Download File with all Applications including Visio and Project 2016 Click to Run - Deferred Channel


```

<Configuration>
   <Add OfficeClientEdition="32" Channel="Deferred">
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
|Channel="Deferred"  <br/> |The channel build of Office UNRESOLVED_TOKEN_VAL(365) ProPlus being downloaded.  <br/> |
|Product ID="O365ProPlusRetail"  <br/> |SKU of Office UNRESOLVED_TOKEN_VAL(365) ProPlus being downloaded  <br/> |
|Language ID="en-us"  <br/> |The default language forOffice UNRESOLVED_TOKEN_VAL(365) ProPlus.  <br/> |
|Product ID="VisioProRetail"  <br/> |Visio 2016 Office UNRESOLVED_TOKEN_VAL(365) ProPlus. Note: Visio 2016 Office UNRESOLVED_TOKEN_VAL(365) ProPlus must be on the same update channel as Office UNRESOLVED_TOKEN_VAL(365) ProPlus.  <br/> |
|Language ID="en-us"  <br/> |The default language being downloaded for Visio 2016 Click to Run.  <br/> |
|Product ID="ProjectProRetail"  <br/> |Project 2016Office UNRESOLVED_TOKEN_VAL(365) ProPlus. Note: Project 2016 Office UNRESOLVED_TOKEN_VAL(365) ProPlus must be on the same update channel as Office UNRESOLVED_TOKEN_VAL(365) ProPlus.  <br/> |
|Language ID="en-us"  <br/> |The default language being downloaded for Project 2016 Click to Run.  <br/> |
   

## Sample Download File with all Applications including Visio and Project 2016 Click to Run with English and Spanish - Deferred Channel


```

<Configuration>
   <Add OfficeClientEdition="32" Channel="Deferred">
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
|Channel="Deferred"  <br/> |The channel build of Office UNRESOLVED_TOKEN_VAL(365) ProPlus being downloaded.  <br/> |
|Product ID="O365ProPlusRetail"  <br/> |SKU of Office UNRESOLVED_TOKEN_VAL(365) ProPlus being downloaded  <br/> |
|Language ID="en-us"  <br/> |The default language forOffice UNRESOLVED_TOKEN_VAL(365) ProPlus.  <br/> |
|Language ID="es-es"  <br/> |The additional language being downloaded for Office UNRESOLVED_TOKEN_VAL(365) ProPlus.  <br/> |
|Product ID="VisioProRetail"  <br/> |Visio 2016 Office UNRESOLVED_TOKEN_VAL(365) ProPlus. Note: Visio 2016 Office UNRESOLVED_TOKEN_VAL(365) ProPlus must be on the same update channel as Office UNRESOLVED_TOKEN_VAL(365) ProPlus.  <br/> |
|Language ID="en-us"  <br/> |The default language being downloaded for Visio 2016 Click to Run.  <br/> |
|Language ID="es-es"  <br/> |The additional language being downloaded for Visio 2016 Click to Run.  <br/> |
|Product ID="ProjectProRetail"  <br/> |Project 2016Office UNRESOLVED_TOKEN_VAL(365) ProPlus. Note: Project 2016 Office UNRESOLVED_TOKEN_VAL(365) ProPlus must be on the same update channel as Office UNRESOLVED_TOKEN_VAL(365) ProPlus.  <br/> |
|Language ID="en-us"  <br/> |The default language being downloaded for Project 2016 Click to Run.  <br/> |
|Language ID="es-es"  <br/> |The additional language being downloaded for Project 2016 Click to Run.  <br/> |
   

## Sample Download File with all Applications including Visio (VL) and Project (VL) 2016 Click to Run - Deferred Channel


```

<Configuration>
   <Add OfficeClientEdition="32" Channel="Deferred">
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
|Channel="Deferred"  <br/> |The channel build of Office UNRESOLVED_TOKEN_VAL(365) ProPlus being downloaded.  <br/> |
|Product ID="O365ProPlusRetail"  <br/> |SKU of Office UNRESOLVED_TOKEN_VAL(365) ProPlus being downloaded  <br/> |
|Language ID="en-us"  <br/> |The default language forOffice UNRESOLVED_TOKEN_VAL(365) ProPlus.  <br/> |
|Product ID="VisioProXVolume"  <br/> |Visio 2016 Office UNRESOLVED_TOKEN_VAL(365) ProPlus volume licensed. Note: Visio 2016 Office UNRESOLVED_TOKEN_VAL(365) ProPlus must be on the same update channel as Office UNRESOLVED_TOKEN_VAL(365) ProPlus.  <br/> |
|Language ID="en-us"  <br/> |The default language being downloaded for Visio 2016 Click to Run.  <br/> |
|Product ID="ProjectProXVolumel"  <br/> |Project 2016Office UNRESOLVED_TOKEN_VAL(365) ProPlus volume licensed. Note: Project 2016 Office UNRESOLVED_TOKEN_VAL(365) ProPlus must be on the same update channel as Office UNRESOLVED_TOKEN_VAL(365) ProPlus.  <br/> |
|Language ID="en-us"  <br/> |The default language being downloaded for Project 2016 Click to Run.  <br/> |
   

