---
title: Best practices Download XML files for locally managed
ms.prod: OFFICE365
ms.assetid: 5b5f4aab-7100-4e14-b3d6-218d0a267765
---


# Best practices: Download XML files for locally managed

 *The Best Practices Guide includes deployment recommendations and real-world examples from the Office 365 Product Group and delivery experts from Microsoft Services. For a list of all the articles, see  [Best practices guide for deploying Office 365 ProPlus in the enterprise](best-practices-guide-for-deploying-office-365-proplus-in-the-enterprise.md).* 
  
    
    

 *Locally Managed*  must download XML files for the following packages:
|||
|:-----|:-----|
|**Package** <br/> |**Languages** <br/> |
|Office 365 ProPlus - Deferred Channel - 32-Bit  <br/> |3 languages  <br/> |
|Project Pro - Deferred Channel - 32-bit  <br/> |1 language  <br/> |
|Visio Pro - Deferred Channel - 32-bit  <br/> |1 language  <br/> |
|Office 365 ProPlus, Project Pro, and Visio Pro - First Release for Deferred Channel - 32-bit  <br/> |1 language  <br/> |
   
 *Locally Managed*  expects Current Channel users to self-provision and self-manage.
## Example download XML files

The following are the  *Locally Managed*  example download XML files to download Office 365 client source files.
  
    
    

### Office 365 ProPlus, Project Pro, and Visio Pro - Deferred Channel - 32-bit


```

<Configuration>
  <Add OfficeClientEdition="32" Channel="Deferred">
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
|Channel="Deferred"  <br/> |The channel build of Office 365 ProPlus being downloaded  <br/> |
|Product ID="O365ProPlusRetail"  <br/> |SKU of Office 365 ProPlus being downloaded  <br/> |
|Language ID="ii-cc"  <br/> |The languages being downloaded for Office 365 ProPlus  <br/> |
|Product ID="ProjectProRetail"  <br/> |SKU of Project Pro being downloaded  <br/> |
|Language ID="en-us"  <br/> |The language being downloaded for Project Pro  <br/> |
|Product ID="VisioProRetail"  <br/> |SKU of Visio Pro being downloaded  <br/> |
|Language ID="en-us"  <br/> |The language being downloaded for Visio Pro  <br/> |
   

### Office 365 ProPlus, Project Pro, and Visio Pro - First Release Deferred Channel - 32-bit


```

<Configuration>
  <Add OfficeClientEdition="32" Channel="FirstReleaseDeferred">
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
|Channel="FirstReleaseDeferred"  <br/> |The channel build of Office 365 ProPlus being downloaded  <br/> |
|Product ID="O365ProPlusRetail"  <br/> |SKU of Office 365 ProPlus being downloaded  <br/> |
|Language ID="en-us"  <br/> |The language being downloaded for Office 365 ProPlus  <br/> |
|Product ID="ProjectProRetail"  <br/> |SKU of Project Pro being downloaded  <br/> |
|Language ID="en-us"  <br/> |The language being downloaded for Project Pro  <br/> |
|Product ID="VisioProRetail"  <br/> |SKU of Visio Pro being downloaded  <br/> |
|Language ID="en-us"  <br/> |The language being downloaded for Visio Pro  <br/> |
   

