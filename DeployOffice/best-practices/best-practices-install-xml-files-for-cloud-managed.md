---
title: "Best practices Install XML files for cloud managed"
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
ms.assetid: 68113166-4e85-45da-8963-ad65d3031ade
description: "The Best Practices Guide includes deployment recommendations and real-world examples from the Office 365 Product Group and delivery experts from Microsoft Services. For a list of all the articles, see Best practices."
---

# Best practices: Install XML files for cloud managed

 *The Best Practices Guide includes deployment recommendations and real-world examples from the Office 365 Product Group and delivery experts from Microsoft Services. For a list of all the articles, see [Best practices](best-practices.md).* 
  
 *Cloud Managed*  needs install XML files for the following packages:
  
|||
|:-----|:-----|
|**Package** <br/> |**Languages** <br/> |
|Office 365 ProPlus - Semi-Annual Channel - Desktops - 32-bit  <br/> |1 language  <br/> |
|Office 365 ProPlus - Semi-Annual Channel - Shared Computers - 32-bit  <br/> |1 language  <br/> |
|Office 365 ProPlus - Semi-Annual Channel (Targeted) - Desktops - 32-bit  <br/> |1 language  <br/> |
   
 *Cloud Managed*  expects Monthly Channel users to self-provision and self-manage. All applications will be included in the install.
  
## Example install XML files

The following are the  *Cloud Managed*  example install XML files for configuring and installing Office 365 clients.
  
### Office 365 ProPlus - Semi-Annual Channel - Desktops - 32-bit

```
<Configuration>
    <Add OfficeClientEdition="32" Channel="Broad">
        <Product ID="O365ProPlusRetail">
            <Language ID="en-us" />
        </Product>
    </Add>
    <Property Name="FORCEAPPSHUTDOWN" Value="TRUE" />
    <Logging Level="Standard" />
    <Display Level="None" AcceptEULA="TRUE" />
</Configuration>
```

 **XML install file breakdown**
  
|||
|:-----|:-----|
|**Component** <br/> |**Explanation** <br/> |
|OfficeClientEdition="32"  <br/> |The architecture of Office being installed  <br/> |
|Product ID="O365ProPlusRetail"  <br/> |SKU of Office 365 ProPlus being installed  <br/> |
|Language ID="en-us"  <br/> |The default language being installed for Office 365 ProPlus  <br/> |
|FORCEAPPSHUTDOWN Value ="True"  <br/> |Forces any Office apps that are blocking the install of Office to shut down. Data loss may occur.  <br/> |
|Display Level="None"  <br/> |Hides the UI when installing Office 365 ProPlus  <br/> |
|AcceptEULA="TRUE"  <br/> |Accept the License Agreement  <br/> |
   
### Office 365 ProPlus - Semi-Annual Channel - Desktops - Shared Computer Activation - 32-bit

```
<Configuration>
    <Add OfficeClientEdition="32" Channel="Broad">
        <Product ID="O365ProPlusRetail">
            <Language ID="en-us" />
        </Product>
    </Add>
    <Property Name="SharedComputerLicensing" Value="1" />
    <Property Name="FORCEAPPSHUTDOWN" Value="TRUE" />
    <Logging Level="Standard" />
    <Display Level="None" AcceptEULA="TRUE" />
</Configuration>
```

 **XML install file breakdown**
  
|||
|:-----|:-----|
|**Component** <br/> |**Explanation** <br/> |
|OfficeClientEdition="32"  <br/> |The architecture of Office being installed  <br/> |
|Product ID="O365ProPlusRetail"  <br/> |SKU of Office 365 ProPlus being installed  <br/> |
|Language ID="en-us"  <br/> |The default language being installed for Office 365 ProPlus  <br/> |
|SharedComputerLicensing Value="1"  <br/> |Places Office 365 ProPlus into Shared Computer Activation mode  <br/> |
|FORCEAPPSHUTDOWN Value ="True"  <br/> |Forces any Office apps that are blocking the install of Office to shut down. Data loss may occur.  <br/> |
|Display Level="None"  <br/> |Hides the UI when installing Office 365 ProPlus  <br/> |
|AcceptEULA="TRUE"  <br/> |Accept the License Agreement  <br/> |
   
### Office 365 ProPlus - Semi-Annual Channel (Targeted) - Desktops - 32-bit

```
<Configuration>
    <Add OfficeClientEdition="32" Channel="Targeted">
        <Product ID="O365ProPlusRetail">
            <Language ID="en-us" />
        </Product>
    </Add>
    <Property Name="FORCEAPPSHUTDOWN" Value="TRUE" />
    <Logging Level="Standard" />
    <Display Level="None" AcceptEULA="TRUE" />
</Configuration>
```

 **XML install file breakdown**
  
|||
|:-----|:-----|
|**Component** <br/> |**Explanation** <br/> |
|OfficeClientEdition="32"  <br/> |The architecture of Office being installed  <br/> |
|Product ID="O365ProPlusRetail"  <br/> |SKU of Office 365 ProPlus being installed  <br/> |
|Language ID="en-us"  <br/> |The default language being installed for Office 365 ProPlus  <br/> |
|FORCEAPPSHUTDOWN Value ="True"  <br/> |Forces any Office apps that are blocking the install of Office to shut down. Data loss may occur.  <br/> |
|Display Level="None"  <br/> |Hides the UI when installing Office 365 ProPlus  <br/> |
|AcceptEULA="TRUE"  <br/> |Accept the License Agreement  <br/> |
   

