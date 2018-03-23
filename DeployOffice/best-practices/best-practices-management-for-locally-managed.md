---
title: "Best practices Management for locally managed"
ms.author: danbrown
author: DHB-MSFT
manager: laurawi
ms.date: 3/22/2017
ms.audience: ITPro
ms.topic: concetpual
ms.service: o365-proplus-itpro
localization_priority: Normal
ms.collection: Ent_O365
ms.custom:
- Ent_Office_ProPlus_Best
- Ent_Office_ProPlus
ms.assetid: ae2bcbfa-2c03-4f4d-b951-8352f079e3d0
description: "The Best Practices Guide includes deployment recommendations and real-world examples from the Office 365 Product Group and delivery experts from Microsoft Services. For a list of all the articles, see Best practices."
---

# Best practices: Management for locally managed

 *The Best Practices Guide includes deployment recommendations and real-world examples from the Office 365 Product Group and delivery experts from Microsoft Services. For a list of all the articles, see [Best practices](best-practices.md).* 
  
 *Locally Managed*  wants to apply some GPO management to their Office 365 ProPlus systems, as well as to test specific scenarios they are likely to encounter.
  
The items are:
  
- Configure infrastructure
    
- License users
    
- Add languages
    
- Remove languages
    
- Add Access
    
- Roll back a build
    
- Switch channels
    
- Configure policy
    
  - Group Policy for desktops
    
  - Additional Group Policy objects for VDI
    
  - Group Policy for OneDrive for Business
    
## Configure infrastructure and maintain network, ports, and protocols

Office 365 is a cloud service; therefore, it requires Internet access. If you manage by URL, then updates are less frequent and typically only needed when new products or features are released. However, if you manage by IP address range, then changes occur more often. The following page should be referenced and subscribed to in an RSS feed: [Office 365 URLs and IP address ranges](https://support.office.com/en-us/article/Office-365-URLs-and-IP-address-ranges-8548a211-3fe7-47cb-abb1-355ea5aa88a2?ui=en-US&amp;rs=en-US&amp;ad=US).
  
## License users

See [Assign licenses to user accounts with Office 365 PowerShell](https://technet.microsoft.com/en-us/library/dn771770.aspx).
  
## Add languages

The **ProductID="LanguagePack"** element lets you add languages to an existing Office 365 client install without needing to know its existing configuration settings.
  
```
<Configuration>
  <Add OfficeClientEdition="32">
    <Product ID="LanguagePack">
      <Language ID="es-es" />
    </Product>
  </Add>
</Configuration> 
```

## Remove languages

The **remove** element lets you remove a language from an existing Office 365 client install.
  
```
<Configuration>
  <Remove>
    <Product ID="O365ProPlusRetail">
      <Language ID="es-es" />
    </Product>
  </Remove>
</Configuration> 
```

OR
  
```
<Configuration>
  <Remove>
    <Product ID="LanguagePack">
      <Language ID="es-es" />
    </Product>
  </Remove>
</Configuration> 
```

## Add Access

By removing the exclude statement from an application, it will include the application when re-run. If the newly run install XML file differs from the previous file used to install, the latest configuration settings are applied.
  
```
<Configuration>
  <Add OfficeClientEdition="32" Channel="Current">
    <Product ID="O365ProPlusRetail">
      <Language ID="en-us" />
    </Product>
  </Add>
</Configuration> 
```

## Roll back a build

 *Locally Managed*  can leverage a batch file or script that is hosted in their existing DFS structure to perform a client rollback. For step-by-step guidance on performing a rollback using the **OfficeC2RClient.exe** update engine, see[Channel management](http://www.deployoffice.com/preferred-practices/).
  
## Switch channels

To change a user's channel membership, see [Channel management](http://www.deployoffice.com/preferred-practices/).
  
## Configure policy

We highly recommend that you periodically check for new GPO templates. As new Office features are rolled out, GPOs are often updated and new Office management GPOs are released.
  
[Office 2016 Administrative Template files (ADMX/ADML) and Office Customization Tool](https://www.microsoft.com/en-us/download/details.aspx?id=49030).
  
### Additional Group Policy for VDI

Additional GPO should be considered around Outlook and Cached Mode for shared computing.  *Locally Managed*  has set the value to 3 days.
  
### Group Policy for OneDrive

See [Administrative settings for the OneDrive for Business Next Generation Synch Client](https://support.office.com/en-us/article/Administrative-settings-for-the-new-OneDrive-sync-client-0ecb2cf5-8882-42b3-a6e9-be6bda30899c?ui=en-US&amp;rs=en-US&amp;ad=US).
  
## Locally Managed Mac Client Updates

Similar to Office 365 ProPlus, Microsoft provides new builds that contain application updates. This means that individual security or feature updates cannot be downloaded or installed. However, with a locally managed deployment, admins can select which applications to apply updates to. Office 2016 for Mac has a program named Microsoft AutoUpdate to automatically check for updates daily. Microsoft AutoUpdate can be configured to daily, weekly, monthly, or manually depending on preferences.
  
Because  *Locally Managed*  has a small Mac population and no Mac software distribution tool, they should configure Microsoft AutoUpdate to download updates automatically to users' computers, and then have the users manually install the updates.
  

