---
title: "Best practices Install XML files for enterprise managed"
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
ms.assetid: be130915-09ab-4303-b436-ae7b84266e28
description: "The Best Practices Guide includes deployment recommendations and real-world examples from the Office 365 Product Group and delivery experts from Microsoft Services. For a list of all the articles, see Best practices."
---

# Best practices: Install XML files for enterprise managed

 *The Best Practices Guide includes deployment recommendations and real-world examples from the Office 365 Product Group and delivery experts from Microsoft Services. For a list of all the articles, see [Best practices](best-practices.md).* 
  
 *Enterprise Managed*  needs install XML files for the following packages:
  
|||
|:-----|:-----|
|**Package** <br/> |**Languages** <br/> |
|Office 365 ProPlus - Semi-Annual Channel - Desktops - 32-bit - North America Region  <br/> |3 languages  <br/> |
|Office 365 ProPlus - Semi-Annual Channel - Desktops - 32-bit - LATAM Region  <br/> |3 languages  <br/> |
|Office 365 ProPlus - Semi-Annual Channel - Desktops - 32-bit - AsiaPAC Region  <br/> |8 languages  <br/> |
|Office 365 ProPlus - Semi-Annual Channel - Desktops - 32-bit - EU Region  <br/> |8 languages  <br/> |
|Project Pro (VL) - Semi-Annual Channel - Desktops - 32-bit  <br/> |1 language  <br/> |
|Project Pro (VL) - Semi-Annual Channel - Desktops - 32-bit  <br/> |1 language  <br/> |
|Office 365 ProPlus - Semi-Annual Channel - VDI/Shared Computers - 32-bit - All regions  <br/> |17 languages  <br/> |
|Individual languages - Semi-Annual Channel - Desktops 32-bit  <br/> |17 languages  <br/> |
|Office 365 ProPlus - Semi-Annual Channel - Desktops - 64-bit  <br/> |1 language  <br/> |
|Office 365 ProPlus - Semi-Annual Channel (Targeted) - Desktops - 32-bit  <br/> |1 language  <br/> |
|Project Pro (VL)- Semi-Annual Channel (Targeted) - Desktops - 32-bit  <br/> |1 language  <br/> |
|Visio Pro (VL) - Semi-Annual Channel (Targeted) - Desktops - 32-bit  <br/> |1 language  <br/> |
   
 *Enterprise Managed*  expects Monthly Channel users to self-provision and self-manage. OneDrive for Business will be excluded from the installation in all cases.
  
## Example install XML files

The following are the  *Enterprise Managed*  example install XML files for configuring and installing Office 365 clients.
  
### Office 365 ProPlus - Semi-Annual Channel - Desktops - 32-bit - North America Region

```
<Configuration>
   <Add OfficeClientEdition="32" Channel="Broad">
      <Product ID="O365ProPlusRetail">
         <Language ID="en-us" />
         <Language ID="fr-fr" />
         <Language ID="es-es" />
         <ExcludeApp ID="Groove" />
      </Product>
   </Add>
   <Property Name="FORCEAPPSHUTDOWN" Value="TRUE" />
   <Logging Level="Standard" />
   <Display Level="None" AcceptEULA="TRUE" />
</Configuration> 
```

 **XML configuration file breakdown**
  
|||
|:-----|:-----|
|**Component** <br/> |**Explanation** <br/> |
|OfficeClientEdition="32"  <br/> |The architecture of Office being installed  <br/> |
|Product ID="O365ProPlusRetail"  <br/> |SKU of Office 365 ProPlus being installed  <br/> |
|Language ID="en-us"  <br/> |The default language being installed for Office 365 ProPlus  <br/> |
|Language ID="ii-cc"  <br/> |The additional languages being installed for Office 365 ProPlus  <br/> |
|ExcludeApp ID="Groove"  <br/> |Excludes OneDrive from Office 365 ProPlus installation  <br/> |
|FORCEAPPSHUTDOWN Value ="True"  <br/> |Forces any Office apps that are blocking the install of Office to shut down. Data loss may occur.  <br/> |
|Display Level="None"  <br/> |Hides the UI when installing Office 365 ProPlus  <br/> |
|AcceptEULA="TRUE"  <br/> |Accept the License Agreement  <br/> |
   
### Office 365 ProPlus - Semi-Annual Channel - Desktops - 32-bit - LATAM Region

```
<Configuration>
   <Add OfficeClientEdition="32" Channel="Broad">
      <Product ID="O365ProPlusRetail">
         <Language ID="es-es" />
         <Language ID="pt-br" />
         <Language ID="en-us" />
         <ExcludeApp ID="Groove" />
      </Product>
   </Add>
   <Property Name="FORCEAPPSHUTDOWN" Value="TRUE" />
   <Logging Level="Standard" />
   <Display Level="None" AcceptEULA="TRUE" />
</Configuration>
```

 **XML configuration file breakdown**
  
|||
|:-----|:-----|
|**Component** <br/> |**Explanation** <br/> |
|OfficeClientEdition="32"  <br/> |The architecture of Office being installed  <br/> |
|Product ID="O365ProPlusRetail"  <br/> |SKU of Office 365 ProPlus being installed  <br/> |
|Language ID="en-us"  <br/> |The default language being installed for Office 365 ProPlus  <br/> |
|Language ID="ii-cc"  <br/> |The additional languages being installed for Office 365 ProPlus  <br/> |
|ExcludeApp ID="Groove"  <br/> |Excludes OneDrive from Office 365 ProPlus installation  <br/> |
|FORCEAPPSHUTDOWN Value ="True"  <br/> |Forces any Office apps that are blocking the install of Office to shut down. Data loss may occur.  <br/> |
|Display Level="None"  <br/> |Hides the UI when installing Office 365 ProPlus  <br/> |
|AcceptEULA="TRUE"  <br/> |Accept the License Agreement  <br/> |
   
### Office 365 ProPlus - Semi-Annual Channel - Desktops - 32-bit - AsiaPAC Region

```
Configuration>
   <Add OfficeClientEdition="32" Channel="Broad">
      <Product ID="O365ProPlusRetail">
         <Language ID="zh-cn" />
         <Language ID="zh-tw" />
         <Language ID="id-id" />
         <Language ID="ja-jp" />
         <Language ID="ko-kr" />
         <Language ID="ms-my" />
         <Language ID="th-th" />
         <Language ID="en-us" />
         <ExcludeApp ID="Groove" />
      </Product>
   </Add>
   <Property Name="FORCEAPPSHUTDOWN" Value="TRUE" />
   <Logging Level="Standard" />
   <Display Level="None" AcceptEULA="TRUE" />
</Configuration> 
```

 **XML configuration file breakdown**
  
|||
|:-----|:-----|
|**Component** <br/> |**Explanation** <br/> |
|OfficeClientEdition="32"  <br/> |The architecture of Office being installed  <br/> |
|Product ID="O365ProPlusRetail"  <br/> |SKU of Office 365 ProPlus being installed  <br/> |
|Language ID="zh-cn"  <br/> |The default language being installed for Office 365 ProPlus  <br/> |
|Language ID="ii-cc"  <br/> |The additional languages being installed for Office 365 ProPlus  <br/> |
|ExcludeApp ID="Groove"  <br/> |Excludes OneDrive from Office 365 ProPlus installation  <br/> |
|FORCEAPPSHUTDOWN Value ="True"  <br/> |Forces any Office apps that are blocking the install of Office to shut down. Data loss may occur.  <br/> |
|Display Level="None"  <br/> |Hides the UI when installing Office 365 ProPlus  <br/> |
|AcceptEULA="TRUE"  <br/> |Accept the License Agreement  <br/> |
   
### Office 365 ProPlus - Semi-Annual Channel - Desktops - 32-bit - EU region

```
<Configuration>
   <Add OfficeClientEdition="32" Channel="Broad">
      <Product ID="O365ProPlusRetail">
         <Language ID="cs-cz" />
         <Language ID="da-dk" />
         <Language ID="nl-nl" />
         <Language ID="fi-fi" />
         <Language ID="de-de" />
         <Language ID="el-gr" />
         <Language ID="en-us" />
         <Language ID="fr-fr" />
         <ExcludeApp ID="Groove" />
      </Product>
   </Add>
   <Property Name="FORCEAPPSHUTDOWN" Value="TRUE" />
   <Logging Level="Standard" />
   <Display Level="None" AcceptEULA="TRUE" />
</Configuration> 
```

 **XML configuration file breakdown**
  
|||
|:-----|:-----|
|**Component** <br/> |**Explanation** <br/> |
|OfficeClientEdition="32"  <br/> |The architecture of Office being installed  <br/> |
|Product ID="O365ProPlusRetail"  <br/> |SKU of Office 365 ProPlus being installed  <br/> |
|Language ID="cs-cz"  <br/> |The default language being installed for Office 365 ProPlus  <br/> |
|Language ID="ii-cc"  <br/> |The additional languages being installed for Office 365 ProPlus  <br/> |
|ExcludeApp ID="Groove"  <br/> |Excludes OneDrive from Office 365 ProPlus installation  <br/> |
|FORCEAPPSHUTDOWN Value ="True"  <br/> |Forces any Office apps that are blocking the install of Office to shut down. Data loss may occur.  <br/> |
|Display Level="None"  <br/> |Hides the UI when installing Office 365 ProPlus  <br/> |
|AcceptEULA="TRUE"  <br/> |Accept the License Agreement  <br/> |
   
### Project Pro (VL) - Semi-Annual Channel - Desktops - 32-bit

```
<Configuration>
   <Add OfficeClientEdition="32" Channel="Broad">
      <Product ID="ProjectProXVolume">
         <Language ID="en-us" />
      </Product>
   </Add>
   <Display Level="None" AcceptEULA="TRUE" />
   <Logging Level="Standard" />
</Configuration> 
```

 **XML configuration file breakdown**
  
|||
|:-----|:-----|
|**Component** <br/> |**Explanation** <br/> |
|OfficeClientEdition="32"  <br/> |The architecture of Office being installed  <br/> |
|Product ID="ProjectProXVolume"  <br/> |SKU of Office 365 Project Pro being installed  <br/> |
|Language ID="en-us"  <br/> |The default language being installed for Office 365 Project Pro  <br/> |
|Display Level="None"  <br/> |Hides the UI when installing Office 365 Project Pro  <br/> |
|AcceptEULA="TRUE"  <br/> |Accept the License Agreement  <br/> |
   
### Visio Pro (VL) - Semi-Annual Channel - Desktops - 32-bit

```
<Configuration>
   <Add OfficeClientEdition="32" Channel="Broad">
      <Product ID="VisioProXVolume">
         <Language ID="en-us" />
      </Product>
   </Add>
   <Display Level="None" AcceptEULA="TRUE" />
   <Logging Level="Standard" />
</Configuration> 
```

 **XML configuration file breakdown**
  
|||
|:-----|:-----|
|**Component** <br/> |**Explanation** <br/> |
|OfficeClientEdition="32"  <br/> |The architecture of Office being installed  <br/> |
|Product ID="VisioProXVolume"  <br/> |SKU of Office 365 Visio Pro being installed  <br/> |
|Language ID="en-us"  <br/> |The default language being installed for Office 365 Visio Pro  <br/> |
|Display Level="None"  <br/> |Hides the UI when installing Office 365 Visio Pro  <br/> |
|AcceptEULA="TRUE"  <br/> |Accept the License Agreement  <br/> |
   
### Office 365 ProPlus - Semi-Annual Channel - VDI/Shared Computer Activation - 32-bit

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
      <ExcludeApp ID="Groove" />
    </Product>
  </Add>
    <Property Name="SharedComputerLicensing" Value="1" />
    <Logging Level="Standard" />
    <Display Level="None" AcceptEULA="TRUE" />
</Configuration> 
```

 **XML configuration file breakdown**
  
|||
|:-----|:-----|
|**Component** <br/> |**Explanation** <br/> |
|OfficeClientEdition="32"  <br/> |The architecture of Office being installed  <br/> |
|Product ID="O365ProPlusRetail"  <br/> |SKU of Office 365 ProPlus being installed  <br/> |
|Language ID="en-us"  <br/> |The default language being installed for Office 365 ProPlus  <br/> |
|Language ID="ii-cc"  <br/> |The additional languages being installed for Office 365 ProPlus  <br/> |
|ExcludeApp ID="Groove"  <br/> |Excludes OneDrive from Office 365 ProPlus installation  <br/> |
|SharedComputerLicensing Value="1"  <br/> |Places Office 365 ProPlus into Shared Computer Activation mode  <br/> |
|Display Level="None"  <br/> |Hides the UI when installing Office 365 ProPlus  <br/> |
|AcceptEULA="TRUE"  <br/> |Accept the License Agreement  <br/> |
   
### Individual languages Semi-Annual Channel - Desktops 32-bit

```
<Configuration>
  <Add OfficeClientEdition="32" Channel="Broad">
    <Product ID="LanguagePack">
      <Language ID="es-es" />
    </Product>
  </Add>
</Configuration> 
```

 **XML configuration file breakdown**
  
|||
|:-----|:-----|
|**Component** <br/> |**Explanation** <br/> |
|OfficeClientEdition="32"  <br/> |The architecture of Office being installed  <br/> |
|Product ID="LanguagePack"  <br/> |SKU of language pack being installed  <br/> |
|Language ID="es-es"  <br/> |The default language being installed for Office 365 ProPlus  <br/> |
   
### Office 365 ProPlus - Semi-Annual Channel - Desktops - 64-Bit

```
<Configuration>
  <Add OfficeClientEdition="64" Channel="Broad">
    <Product ID="O365ProPlusRetail">
      <Language ID="en-us" />
      <ExcludeApp ID="Groove" />
    </Product>
  </Add>
    <Property Name="FORCEAPPSHUTDOWN" Value="TRUE" />
    <Display Level="None" AcceptEULA="TRUE" />
</Configuration> 
```

 **XML configuration file breakdown**
  
|||
|:-----|:-----|
|**Component** <br/> |**Explanation** <br/> |
|OfficeClientEdition="64"  <br/> |The architecture of Office being installed  <br/> |
|Product ID="O365ProPlusRetail"  <br/> |SKU of Office 365 ProPlus being installed  <br/> |
|Language ID="en-us"  <br/> |The default language being installed for Office 365 ProPlus  <br/> |
|ExcludeApp ID="Groove"  <br/> |Excludes OneDrive from Office 365 ProPlus installation  <br/> |
|FORCEAPPSHUTDOWN Value ="True"  <br/> |Forces any Office apps that are blocking the install of Office to shut down. Data loss may occur.  <br/> |
|Display Level="None"  <br/> |Hides the UI when installing Office 365 ProPlus  <br/> |
|AcceptEULA="TRUE"  <br/> |Accept the License Agreement  <br/> |
   
### Office 365 ProPlus - Semi-Annual Channel (Targeted) - Desktops - 32-bit

```
<Configuration>
  <Add OfficeClientEdition="32" Channel="Targeted">
    <Product ID="O365ProPlusRetail">
      <Language ID="en-us" />
      <ExcludeApp ID="Groove" />
    </Product>
  </Add>
  <Property Name="FORCEAPPSHUTDOWN" Value="TRUE" />
  <Logging Level="Standard" />
  <Display Level="None" AcceptEULA="TRUE" />
</Configuration> 
```

 **XML configuration file breakdown**
  
|||
|:-----|:-----|
|**Component** <br/> |**Explanation** <br/> |
|OfficeClientEdition="32"  <br/> |The architecture of Office being installed  <br/> |
|Product ID="O365ProPlusRetail"  <br/> |SKU of Office 365 ProPlus being installed  <br/> |
|Language ID="en-us"  <br/> |The default language being installed for Office 365 ProPlus  <br/> |
|ExcludeApp ID="Groove"  <br/> |Excludes OneDrive from Office 365 ProPlus installation  <br/> |
|FORCEAPPSHUTDOWN Value ="True"  <br/> |Forces any Office apps that are blocking the install of Office to shut down. Data loss may occur.  <br/> |
|Display Level="None"  <br/> |Hides the UI when installing Office 365 ProPlus  <br/> |
|AcceptEULA="TRUE"  <br/> |Accept the License Agreement  <br/> |
   
### Project Pro (VL) - Semi-Annual Channel (Targeted) - Desktops - 32-bit

```
<Configuration>
  <Add OfficeClientEdition="32" Channel="Targeted">
    <Product ID="ProjectProXVolume">
      <Language ID="en-us" />
    </Product>
  </Add>
  <Property Name="FORCEAPPSHUTDOWN" Value="TRUE" />
  <Display Level="None" AcceptEULA="TRUE" />
  <Logging Level="Standard" />
</Configuration> 
```

 **XML configuration file breakdown**
  
|||
|:-----|:-----|
|**Component** <br/> |**Explanation** <br/> |
|OfficeClientEdition="32"  <br/> |The architecture of Office being installed  <br/> |
|Product ID="ProjectProXVolume"  <br/> |SKU of Project Pro (VL) being installed  <br/> |
|Language ID="en-us"  <br/> |The default language being installed for Project Pro (VL)  <br/> |
|FORCEAPPSHUTDOWN Value ="True"  <br/> |Forces any Office apps that are blocking the install of Project to shut down. Data loss may occur.  <br/> |
|Display Level="None"  <br/> |Hides the UI when installing Office 365 ProPlus  <br/> |
|AcceptEULA="TRUE"  <br/> |Accept the License Agreement  <br/> |
   
### Visio Pro - Semi-Annual Channel (Targeted) - Desktops - 32-bit

```
<Configuration>
  <Add OfficeClientEdition="32" Channel="Targeted">
    <Product ID="VisioProXVolume">
      <Language ID="en-us" />
    </Product>
  </Add>
  <Property Name="FORCEAPPSHUTDOWN" Value="TRUE" />
  <Display Level="None" AcceptEULA="TRUE" />
  <Logging Level="Standard" />
</Configuration> 
```

 **XML configuration file breakdown**
  
|||
|:-----|:-----|
|**Component** <br/> |**Explanation** <br/> |
|OfficeClientEdition="32"  <br/> |The architecture of Office being installed  <br/> |
|Product ID="VisioProXVolume"  <br/> |SKU of Visio Pro (VL) being installed  <br/> |
|Language ID="en-us"  <br/> |The default language being installed for Visio Pro (VL)  <br/> |
|FORCEAPPSHUTDOWN Value ="True"  <br/> |Forces any Office apps that are blocking the install of Visio to shut down. Data loss may occur.  <br/> |
|Display Level="None"  <br/> |Hides the UI when installing Office 365 ProPlus  <br/> |
|AcceptEULA="TRUE"  <br/> |Accept the License Agreement  <br/> |
   

