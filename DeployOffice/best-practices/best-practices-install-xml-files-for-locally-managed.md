---
title: "Best practices Install XML files for locally managed"
ms.author: jwhit
author: jwhit-MSFT
manager: laurawi
ms.date: 9/9/2017
ms.audience: ITPro
ms.topic: reference
ms.service: o365-proplus-itpro
localization_priority: Normal
ms.collection: Ent_O365
ms.custom:
- Ent_Office_ProPlus_Best
- Ent_Office_ProPlus
ms.assetid: 3a3b98be-c33e-4ed5-8403-9cf71eccb904
description: "The Best Practices Guide includes deployment recommendations and real-world examples from the Office 365 Product Group and delivery experts from Microsoft Services. For a list of all the articles, see Best practices."
---

# Best practices: Install XML files for locally managed

 *The Best Practices Guide includes deployment recommendations and real-world examples from the Office 365 Product Group and delivery experts from Microsoft Services. For a list of all the articles, see [Best practices](best-practices.md).* 
  
 *Locally Managed*  needs install XML files for: the following packages:
  
|||
|:-----|:-----|
|**Package** <br/> |**Languages** <br/> |
|Office 365 ProPlus - Semi-Annual Channel - Desktops - 32-bit - CanAm Region  <br/> |2 languages  <br/> |
|Office 365 ProPlus - Semi-Annual Channel - Desktops - 32-bit - Germany  <br/> |1 language  <br/> |
|Project Pro - Semi-Annual Channel - Desktops - 32-bit  <br/> |1 language  <br/> |
|Visio Pro - Semi-Annual Channel - Desktops - 32-bit  <br/> |1 language  <br/> |
|Project Pro (VL) - Semi-Annual Channel - Desktops - 32-bit  <br/> |1 language  <br/> |
|Project Pro (VL) - Semi-Annual Channel - Desktops - 32-bit  <br/> |1 language  <br/> |
|Office 365 ProPlus - Semi-Annual Channel - VDI/Shared Computers - 32-bit - All regions  <br/> |17 languages  <br/> |
|Individual languages - Semi-Annual Channel - Desktops 32-bit  <br/> |3 languages  <br/> |
|Office 365 ProPlus - Semi-Annual Channel (Targeted) - Desktops - 32-bit  <br/> |1 language  <br/> |
|Project Pro (VL)- Semi-Annual Channel (Targeted) - Desktops - 32-bit  <br/> |1 language  <br/> |
|Visio Pro (VL) - Semi-Annual Channel (Targeted) - Desktops - 32-bit  <br/> |1 language  <br/> |
   
 *Locally Managed*  expects Monthly Channel users to self-provision and self-manage. Access will be excluded from the installation in all cases.
  
## Example install XML files

The following are the  *Locally Managed*  example install XML files for configuring and installing Office 365 clients.
  
### Office 365 ProPlus - Semi-Annual Channel - Desktops - 32-bit - CanAm Region

```
<Configuration>
  <Add OfficeClientEdition="32" Channel="Broad">
    <Product ID="O365ProPlusRetail">
      <Language ID="en-us" />
      <Language ID="fr-fr" />
      <ExcludeApp ID="Access" />
    </Product>
  </Add>
    <Property Name="FORCEAPPSHUTDOWN" Value="TRUE" />
    <Logging Level="Standard" />
    <Display Level="None" AcceptEULA="TRUE" />
</Configuration> 
```

 **XML download file breakdown**
  
|||
|:-----|:-----|
|**Component** <br/> |**Explanation** <br/> |
|OfficeClientEdition="32"  <br/> |The architecture of Office being installed  <br/> |
|Product ID="O365ProPlusRetail"  <br/> |SKU of Office 365 ProPlus being installed  <br/> |
|Language ID="en-us"  <br/> |The default language being installed for Office 365 ProPlus  <br/> |
|Language ID="fr-fr"  <br/> |The additional language being installed for Office 365 ProPlus  <br/> |
|ExcludeApp ID="Access"  <br/> |Excludes Access from Office 365 ProPlus installation  <br/> |
|FORCEAPPSHUTDOWN Value ="True"  <br/> |Forces any Office apps that are blocking the install of Office to shut down. Data loss may occur.  <br/> |
|Display Level="None"  <br/> |Hides the UI when installing Office 365 ProPlus  <br/> |
|AcceptEULA="TRUE"  <br/> |Accept the License Agreement  <br/> |
   
### Office 365 ProPlus - Semi-Annual Channel - Desktops - 32-bit - Germany

```
<Configuration>
  <Add OfficeClientEdition="32" Channel="Broad">
    <Product ID="O365ProPlusRetail">
      <Language ID="de-de" />
      <ExcludeApp ID="Access" />
    </Product>
  </Add>
    <Property Name="FORCEAPPSHUTDOWN" Value="TRUE" />
    <Logging Level="Standard" />
    <Display Level="None" AcceptEULA="TRUE" />
</Configuration>
```

 **XML download file breakdown**
  
|||
|:-----|:-----|
|**Component** <br/> |**Explanation** <br/> |
|OfficeClientEdition="32"  <br/> |The architecture of Office being installed  <br/> |
|Product ID="O365ProPlusRetail"  <br/> |SKU of Office 365 ProPlus being installed  <br/> |
|Language ID="de-de"  <br/> |The default language being installed for Office 365 ProPlus  <br/> |
|ExcludeApp ID="Access"  <br/> |Excludes Access from Office 365 ProPlus installation  <br/> |
|FORCEAPPSHUTDOWN Value ="True"  <br/> |Forces any Office apps that are blocking the install of Office to shut down. Data loss may occur.  <br/> |
|Display Level="None"  <br/> |Hides the UI when installing Office 365 ProPlus  <br/> |
|AcceptEULA="TRUE"  <br/> |Accept the License Agreement  <br/> |
   
### Project Online Desktop Client - Semi-Annual Channel - Desktops - 32-bit

```
<Configuration>
  <Add OfficeClientEdition="32" Channel="Broad">
    <Product ID="ProjectProRetail">
      <Language ID="en-us" />
    </Product>
  </Add>
    <Display Level="None" AcceptEULA="TRUE" />
    <Logging Level="Standard" />
</Configuration> 
```

 **XML download file breakdown**
  
|||
|:-----|:-----|
|**Component** <br/> |**Explanation** <br/> |
|OfficeClientEdition="32"  <br/> |The architecture of Office being installed  <br/> |
|Product ID="ProjectProRetail"  <br/> |SKU of Office Project Pro being installed  <br/> |
|Language ID="en-us"  <br/> |The default language being installed for Project Pro  <br/> |
|Display Level="None"  <br/> |Hides the UI when installing Project Pro  <br/> |
|AcceptEULA="TRUE"  <br/> |Accept the License Agreement  <br/> |
   
### Visio Pro - Semi-Annual Channel - Desktops - 32-bit

```
<Configuration>
  <Add OfficeClientEdition="32" Channel="Broad">
    <Product ID="VisioProRetail">
      <Language ID="en-us" />
    </Product>
  </Add>
    <Display Level="None" AcceptEULA="TRUE" />
    <Logging Level="Standard" />
</Configuration> 
```

 **XML download file breakdown**
  
|||
|:-----|:-----|
|**Component** <br/> |**Explanation** <br/> |
|OfficeClientEdition="32"  <br/> |The architecture of Office being installed  <br/> |
|Product ID="VisioProRetail"  <br/> |SKU of Office Visio Pro being installed  <br/> |
|Language ID="en-us"  <br/> |The default language being installed for Visio Pro  <br/> |
|Display Level="None"  <br/> |Hides the UI when installing Visio Pro  <br/> |
|AcceptEULA="TRUE"  <br/> |Accept the License Agreement  <br/> |
   
### Office 365 ProPlus - Semi-Annual Channel - VDI/Shared Computer Activation - 32-bit

```
<Configuration>
  <Add OfficeClientEdition="32" Channel="Broad">
    <Product ID="O365ProPlusRetail">
      <Language ID="en-us" />
      <Language ID="fr-fr" />
      <Language ID="de-de" />
      <ExcludeApp ID="Access" />
    </Product>
  </Add>
    <Property Name="SharedComputerLicensing" Value="1" />
    <Logging Level="Standard" />
    <Display Level="None" AcceptEULA="TRUE" />
</Configuration> 
```

 **XML download file breakdown**
  
|||
|:-----|:-----|
|**Component** <br/> |**Explanation** <br/> |
|OfficeClientEdition="32"  <br/> |The architecture of Office being installed  <br/> |
|Product ID="O365ProPlusRetaill"  <br/> |SKU of Office 365 ProPlus being installed  <br/> |
|Language ID="en-us"  <br/> |The default language being installed for Office 365 ProPlus  <br/> |
|Language ID="ii-cc"  <br/> |The additional languages being installed for Office 365 ProPlus  <br/> |
|ExcludeApp ID="Access"  <br/> |Excludes Access from Office 365 ProPlus installation  <br/> |
|SharedComputerLicensing Value="1"  <br/> |Places Office 365 ProPlus into Shared Computer Activation mode  <br/> |
|Display Level="None"  <br/> |Hides the UI when installing Office 365 ProPlus  <br/> |
|AcceptEULA="TRUE"  <br/> |Accept the License Agreement  <br/> |
   
### Individual languages - Semi-Annual Channel - Desktops 32-bit

```
<Configuration>
  <Add OfficeClientEdition="32" Channel="Broad">
    <Product ID="LanguagePack">
      <Language ID="de-de" />
    </Product>
  </Add>
</Configuration> 
```

 **XML download file breakdown**
  
|||
|:-----|:-----|
|**Component** <br/> |**Explanation** <br/> |
|OfficeClientEdition="32"  <br/> |The architecture of Office being installed  <br/> |
|Product ID="LanguagePack"  <br/> |SKU of language pack being installed  <br/> |
|Language ID="de-de"  <br/> |The language being installed for Office 365 ProPlus  <br/> |
   
### Office 365 ProPlus - Semi-Annual Channel (Targeted) - Desktops - 32-bit

```
<Configuration>
  <Add OfficeClientEdition="32" Channel="Targeted">
    <Product ID="O365ProPlusRetail">
      <Language ID="en-us" />
      <ExcludeApp ID="Access" />
    </Product>
  </Add>
    <Property Name="FORCEAPPSHUTDOWN" Value="TRUE" />
    <Logging Level="Standard" />
    <Display Level="None" AcceptEULA="TRUE" />
</Configuration> 
```

 **XML download file breakdown**
  
|||
|:-----|:-----|
|**Component** <br/> |**Explanation** <br/> |
|OfficeClientEdition="32"  <br/> |The architecture of Office being installed  <br/> |
|Product ID="O365ProPlusRetaill"  <br/> |SKU of Office 365 ProPlus being installed  <br/> |
|Language ID="en-us"  <br/> |The default language being installed for Office 365 ProPlus  <br/> |
|ExcludeApp ID="Access"  <br/> |Excludes Access from Office 365 ProPlus installation  <br/> |
|FORCEAPPSHUTDOWN Value ="True"  <br/> |Forces any Office apps that are blocking the install of Office to shut down. Data loss may occur.  <br/> |
|Display Level="None"  <br/> |Hides the UI when installing Office 365 ProPlus  <br/> |
|AcceptEULA="TRUE"  <br/> |Accept the License Agreement  <br/> |
   
### Project Pro - Semi-Annual Channel (Targeted) - Desktops - 32-bit

```
<Configuration>
  <Add OfficeClientEdition="32" Channel="Targeted">
    <Product ID="ProjectProRetail">
      <Language ID="en-us" />
    </Product>
  </Add>
  <Display Level="None" AcceptEULA="TRUE" />
  <Logging Level="Standard" />
</Configuration>
```

 **XML download file breakdown**
  
|||
|:-----|:-----|
|**Component** <br/> |**Explanation** <br/> |
|OfficeClientEdition="32"  <br/> |The architecture of Office being installed  <br/> |
|Product ID="ProjectProRetail"  <br/> |SKU of Office 365 Project Pro being installed  <br/> |
|Language ID="en-us"  <br/> |The default language being installed for Project Pro  <br/> |
|Display Level="None"  <br/> |Hides the UI when installing Project Pro  <br/> |
|AcceptEULA="TRUE"  <br/> |Accept the License Agreement  <br/> |
   
### Visio Pro - Semi-Annual Channel (Targeted) - Desktops 32-bit

```
<Configuration>
  <Add OfficeClientEdition="32" Channel="Targeted">
    <Product ID="VisioProRetail">
      <Language ID="en-us" />
    </Product>
  </Add>
  <Display Level="None" AcceptEULA="TRUE" />
  <Logging Level="Standard" />
</Configuration> 
```

 **XML download file breakdown**
  
|||
|:-----|:-----|
|**Component** <br/> |**Explanation** <br/> |
|OfficeClientEdition="32"  <br/> |The architecture of Office being installed  <br/> |
|Product ID="VisioProRetail"  <br/> |SKU of Office 365 Visio Pro being installed  <br/> |
|Language ID="en-us"  <br/> |The default language being installed for Visio Pro  <br/> |
|Display Level="None"  <br/> |Hides the UI when installing Visio Pro  <br/> |
|AcceptEULA="TRUE"  <br/> |Accept the License Agreement  <br/> |
   

