---
title: Best practices Uninstall XML files for cloud managed
ms.prod: OFFICE365
ms.assetid: c9ce5ffa-bfc7-4207-a6c0-c24fa9ae9db2
---


# Best practices: Uninstall XML files for cloud managed

 *The Best Practices Guide includes deployment recommendations and real-world examples from the Office 365 Product Group and delivery experts from Microsoft Services. For a list of all the articles, see  [Best practices guide for deploying Office 365 ProPlus in the enterprise](best-practices-guide-for-deploying-office-365-proplus-in-the-enterprise.md).* 
  
    
    

 *Cloud Managed*  needs an uninstall XML file for the following package:
|||
|:-----|:-----|
|**Package** <br/> |**Languages** <br/> |
|Office 365 ProPlus  <br/> |1 language  <br/> |
   

## Office 365 ProPlus


```

<Configuration>
    <Remove>
      <Product ID="O365ProPlusRetail" > 
         <Language ID="en-us" />
      </Product> 
    </Remove>
    <Property Name="FORCEAPPSHUTDOWN" Value="TRUE" />
    <Display Level="None" />
</Configuration> 
```

 **XML configuration file breakdown**
  
    
    

|||
|:-----|:-----|
|**Component** <br/> |**Explanation** <br/> |
|Product ID="O365ProPlusRetail"  <br/> |SKU of Office 365 ProPlus being removed  <br/> |
|Language ID="en-us"  <br/> |The language being removed from Office 365 ProPlus  <br/> |
|FORCEAPPSHUTDOWN Value ="True"  <br/> |Forces any Office apps that are blocking the uninstall of Office to shut down. Data loss may occur.  <br/> |
|Display Level="None"  <br/> |No UI when removing Office 365 ProPlus  <br/> |
   

