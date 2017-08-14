---
title: Best practices Sample configuration files for installing Office 365 ProPlus
ms.prod: OFFICE365
ms.assetid: 13aa8058-b524-4c73-930b-0802b2617ab4
---


# Best practices: Sample configuration files for installing Office 365 ProPlus

 *The Best Practices Guide includes deployment recommendations and real-world examples from the Office 365 Product Group and delivery experts from Microsoft Services. For a list of all the articles, see  [Best practices guide for deploying Office 365 ProPlus in the enterprise](best-practices-guide-for-deploying-office-365-proplus-in-the-enterprise.md).* 
  
    
    

 This article contains some common example XML files to configure and install Office UNRESOLVED_TOKEN_VAL(365) ProPlus.
## Sample configuration with all Office applications with updates enabled from CDN, interface display, license agreement


```

<Configuration>
   <Add OfficeClientEdition="32" >
      <Product ID="O365ProPlusRetail">
         <Language ID="en-us" />
      </Product>
   </Add>
   <Updates Enabled="TRUE" />
   <Display Level="Full" AcceptEULA="TRUE" />
</Configuration> 
```

 **XML configuration file breakdown**
  
    
    

|||
|:-----|:-----|
|**Component** <br/> |**Explanation** <br/> |
|OfficeClientEdition="32"  <br/> |The architecture of Office being downloaded.  <br/> |
|Product ID="O365ProPlusRetail"  <br/> |SKU of Office UNRESOLVED_TOKEN_VAL(365) ProPlus being downloaded  <br/> |
|Language ID="en-us"  <br/> |The default language forOffice UNRESOLVED_TOKEN_VAL(365) ProPlus.  <br/> |
|Updates Enabled="TRUE"  <br/> |Updates are enabled to automatically download from CDN.  <br/> |
|Display Level="Full"  <br/> |Full UI when installing Office UNRESOLVED_TOKEN_VAL(365) ProPlus.  <br/> |
|AcceptEULA="TRUE"  <br/> |Accept the license agreement.  <br/> |
   

## Sample configuration with all Office applications with SourcePath, updates enabled from internal source, interface display, license agreement


```

<Configuration>
   <Add SourcePath="\\\\Server\\Share" OfficeClientEdition="32" >
      <Product ID="O365ProPlusRetail">
         <Language ID="en-us" />
      </Product>
   </Add>
   <Updates Enabled="TRUE" UpdatePath="\\\\Server\\Share\\Updates" />
   <Display Level="Full" AcceptEULA="TRUE" />
</Configuration> 
```

 **XML configuration file breakdown**
  
    
    

|||
|:-----|:-----|
|**Component** <br/> |**Explanation** <br/> |
|OfficeClientEdition="32"  <br/> |The architecture of Office being downloaded.  <br/> |
|Product ID="O365ProPlusRetail"  <br/> |SKU of Office UNRESOLVED_TOKEN_VAL(365) ProPlus being downloaded  <br/> |
|Language ID="en-us"  <br/> |The default language forOffice UNRESOLVED_TOKEN_VAL(365) ProPlus.  <br/> |
|Updates Enabled="TRUE"  <br/> |Updates are enabled.  <br/> |
|UpdatePath="\\\\Server\\Share\\Updates"  <br/> |Updates to install from \\\\Server\\Share\\Updates.  <br/> |
|Display Level="Full"  <br/> |Full UI when installing Office UNRESOLVED_TOKEN_VAL(365) ProPlus.  <br/> |
|AcceptEULA="TRUE"  <br/> |Accept the license agreement.  <br/> |
   

## Sample configuration with Word excluded with SourcePath, updates enabled from internal source, interface display, license agreement, logging


```

<Configuration>
   <Add SourcePath="\\\\Server\\Share" OfficeClientEdition="32" >
      <Product ID="O365ProPlusRetail"> 
         <Language ID="en-us" />
         <ExcludeApp ID="Word" /> 
      </Product>
   </Add>
   <Updates Enabled="TRUE" UpdatePath="\\\\Server\\Share\\Updates" />
   <Display Level="Full" AcceptEULA="TRUE" />
   <Logging Level="Standard" Path="%temp%" /> 
</Configuration> 
```

 **XML configuration file breakdown**
  
    
    

|||
|:-----|:-----|
|**Component** <br/> |**Explanation** <br/> |
|OfficeClientEdition="32"  <br/> |The architecture of Office being downloaded.  <br/> |
|Product ID="O365ProPlusRetail"  <br/> |SKU of Office UNRESOLVED_TOKEN_VAL(365) ProPlus being downloaded  <br/> |
|Language ID="en-us"  <br/> |The default language forOffice UNRESOLVED_TOKEN_VAL(365) ProPlus.  <br/> |
|ExcludeApp ID="Word"  <br/> |Excludes Word from being installed.  <br/> |
|Updates Enabled="TRUE"  <br/> |Updates are enabled.  <br/> |
|UpdatePath="\\\\Server\\Share\\Updates"  <br/> |Updates to install from \\\\Server\\Share\\Updates.  <br/> |
|Display Level="Full"  <br/> |Full UI when installing Office UNRESOLVED_TOKEN_VAL(365) ProPlus.  <br/> |
|AcceptEULA="TRUE"  <br/> |Accept the license agreement.  <br/> |
|Logging Level="Standard"  <br/> |Logging is enabled.  <br/> |
|Path="%temp%"  <br/> |Log is written to %temp%.  <br/> |
   

## Sample configuration with all applications including Visio and Project 2016 Click to Run with SourcePath, updates enabled from internal source, no interface display, license agreement


```

<Configuration>
   <Add SourcePath="\\\\Server\\Share" OfficeClientEdition="32" >
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
   <Updates Enabled="TRUE" UpdatePath="\\\\Server\\Share\\Updates" />
   <Display Level="NONE" AcceptEULA="TRUE" />
</Configuration>
```

 **XML configuration file breakdown**
  
    
    

|||
|:-----|:-----|
|**Component** <br/> |**Explanation** <br/> |
|OfficeClientEdition="32"  <br/> |The architecture of Office being downloaded.  <br/> |
|Product ID="O365ProPlusRetail"  <br/> |SKU of Office UNRESOLVED_TOKEN_VAL(365) ProPlus being downloaded  <br/> |
|Language ID="en-us"  <br/> |The default language forOffice UNRESOLVED_TOKEN_VAL(365) ProPlus.  <br/> |
|Product ID="ProjectProRetail"  <br/> |SKU of Project being installed.  <br/> |
|Language ID="en-us"  <br/> |The default language being installed for Project 2016 Click to Run.  <br/> |
|Product ID="VisioProRetail"  <br/> |SKU of Visio being installed.  <br/> |
|Language ID="en-us"  <br/> |The default language being installed for Visio 2016 Click to Run.  <br/> |
|Updates Enabled="TRUE"  <br/> |Updates are enabled.  <br/> |
|UpdatePath="\\\\Server\\Share\\Updates"  <br/> |Updates to install from \\\\Server\\Share\\Updates.  <br/> |
|Display Level="NONE"  <br/> |No UI when installing Office UNRESOLVED_TOKEN_VAL(365) ProPlus, Project, and Visio  <br/> |
|AcceptEULA="TRUE"  <br/> |Accept the license agreement.  <br/> |
   

## Sample configuration with all applications including Visio (VL) and Project (VL) 2016 Click to Run with SourcePath, updates enabled from internal source, no interface display, license agreement


```

<Configuration>
   <Add SourcePath="\\\\Server\\Share" OfficeClientEdition="32" >
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
   <Updates Enabled="TRUE" UpdatePath="\\\\Server\\Share\\Updates" />
   <Display Level="NONE" AcceptEULA="TRUE" />
</Configuration> 
```

 **XML configuration file breakdown**
  
    
    

|||
|:-----|:-----|
|**Component** <br/> |**Explanation** <br/> |
|OfficeClientEdition="32"  <br/> |The architecture of Office being downloaded.  <br/> |
|Product ID="O365ProPlusRetail"  <br/> |SKU of Office UNRESOLVED_TOKEN_VAL(365) ProPlus being downloaded  <br/> |
|Language ID="en-us"  <br/> |The default language forOffice UNRESOLVED_TOKEN_VAL(365) ProPlus.  <br/> |
|Product ID="ProjectProXVolume"  <br/> |SKU of Project being installed (volume licensed).  <br/> |
|Language ID="en-us"  <br/> |The default language being installed for Project 2016 Click to Run.  <br/> |
|Product ID="VisioProXVolume"  <br/> |SKU of Visio being installed (volume licensed).  <br/> |
|Language ID="en-us"  <br/> |The default language being installed for Visio 2016 Click to Run.  <br/> |
|Updates Enabled="TRUE"  <br/> |Updates are enabled.  <br/> |
|UpdatePath="\\\\Server\\Share\\Updates"  <br/> |Updates to install from \\\\Server\\Share\\Updates.  <br/> |
|Display Level="NONE"  <br/> |No UI when installing Office UNRESOLVED_TOKEN_VAL(365) ProPlus, Project, and Visio  <br/> |
|AcceptEULA="TRUE"  <br/> |Accept the license agreement.  <br/> |
   

## Sample Configuration with all applications including Visio and Project 2016 Click to Run with SourcePath, updates disabled from internal source, interface display, license agreement, logging


```

<Configuration>
   <Add SourcePath="\\\\Server\\Share" OfficeClientEdition="32" >
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
   <Updates Enabled="FALSE" UpdatePath="\\\\Server\\Share\\Updates" />
   <Display Level="Full" AcceptEULA="TRUE" />
    <Logging Level="Standard" Path="%temp%" /> 
</Configuration> 
```

 **XML configuration file breakdown**
  
    
    

|||
|:-----|:-----|
|**Component** <br/> |**Explanation** <br/> |
|OfficeClientEdition="32"  <br/> |The architecture of Office being downloaded.  <br/> |
|Product ID="O365ProPlusRetail"  <br/> |SKU of Office UNRESOLVED_TOKEN_VAL(365) ProPlus being downloaded  <br/> |
|Language ID="en-us"  <br/> |The default language forOffice UNRESOLVED_TOKEN_VAL(365) ProPlus.  <br/> |
|Product ID="ProjectProRetail"  <br/> |SKU of Project being installed.  <br/> |
|Language ID="en-us"  <br/> |The default language being installed for Project 2016 Click to Run.  <br/> |
|Product ID="VisioProRetail"  <br/> |SKU of Visio being installed.  <br/> |
|Language ID="en-us"  <br/> |The default language being installed for Visio 2016 Click to Run.  <br/> |
|Updates Enabled="FALSE"  <br/> |Updates are disabled.  <br/> |
|UpdatePath="\\\\Server\\Share\\Updates"  <br/> |Updates to install from \\\\Server\\Share\\Updates.  <br/> |
|Display Level="Full"  <br/> |Full UI when installing Office UNRESOLVED_TOKEN_VAL(365) ProPlus, Project, and Visio  <br/> |
|AcceptEULA="TRUE"  <br/> |Accept the license agreement.  <br/> |
|Logging Level="Standard"  <br/> |Logging is enabled.  <br/> |
|Path="%temp%"  <br/> |Log is written to %temp%.  <br/> |
   

