---
title: Best practices for using OffScrub
ms.prod: OFFICE365
ms.assetid: 07cf6be3-b6c7-435d-a1a7-6febe2cc3fd7
---


# Best practices for using OffScrub

 *The Best Practices Guide includes deployment recommendations and real-world examples from the Office 365 Product Group and delivery experts from Microsoft Services. For a list of all the articles, see  [Best practices guide for deploying Office 365 ProPlus in the enterprise](best-practices-guide-for-deploying-office-365-proplus-in-the-enterprise.md).* 
  
    
    

The Office Scrub tool (OffScrub) is the best way to remove a previous version of Office. OffScrub has a better success rate of removing Office than traditional methods. It will call the setup.exe and msiexec.exe to remove the previous bits. It is best equipped to deal with machine or software corruption, and completely removes the Office app shortcuts for the previous Office versions. It is recommended to use OffScrub in almost every situation of migrating from previous versions of Office. OffScrub is supported by Premier, whom you should contact to obtain the latest version for your specific Office deployment.
Reasons for OffScrub to be used with legacy Office to Office 2016 C2R migrations:
  
    
    


- If Office source bits or the cache is missing or unhealthy, the legacy product does not uninstall.
    
  
- Guarantees a clean uninstall.
    
  
- Does not touch the User Hive.
    
  
- Has verbose logging.
    
  
- Removes legacy addon products such a Visio Viewer, etc.
    
  
- Can remove Project and Visio and Office in one command.
    
  
- Removes non-standard company approved Office Applications. This applies to companies that allow users to install and leverage non-corporate products
    
  
Reasons for OffScrub to be used with Office 2013 CR2 to Office 2016 C2R migrations:
- Office 2013 Icons on task bar are not removed.
    
  
- Shortcut Icons are not removed.
    
  
- Upgrade process doesn't always do a clean uninstall. Removal of the bits with Offscrub typically ensures a clean uninstall.
    
  
- Quicker than native process.
    
  
- Does not touch the User Hive
    
  
- Has verbose logging.
    
  
- Can remove Project and Visio and Office in one command.
    
  
- Removes legacy addon products such a Visio Viewer, etc.
    
  

