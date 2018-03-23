---
title: "Best practices Focus areas for assessment"
ms.author: jwhit
author: jwhit-MSFT
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
ms.assetid: 1eca17f1-64f4-48ad-93ab-51f48aff70f4
description: "The Best Practices Guide includes deployment recommendations and real-world examples from the Office 365 Product Group and delivery experts from Microsoft Services. For a list of all the articles, see Best practices."
---

# Best practices: Focus areas for assessment

 *The Best Practices Guide includes deployment recommendations and real-world examples from the Office 365 Product Group and delivery experts from Microsoft Services. For a list of all the articles, see [Best practices](best-practices.md).* 
  
This article describes the assessment focus areas for your Office 365 ProPlus deployment.
  
## Size and distribution

- Number of devices targeted for the deployment.
    
- List of countries and regions to cover.
    
- List of languages supported by central IT department.
    
- Estimated number of the following:
    
  - Travelling users
    
  - Travelling users
    
  - Employees sharing a device (e.g. shift and factory floor workers)
    
## IT infrastructure

- Operating Systems (OS) supported by central IT department, if multiple (for example, Windows 7 x86 and x64).
    
- Number of devices per OS type.
    
- Number and type of Bring Your Own Device (BYOD)s.
    
- Number of mobile and fixed devices.
    
- Do all devices have a common base language (e.g. en-us)?
    
- Do users have administrative rights on their machines?
    
- Number of the following: 
    
  - Remote Desktops Service servers
    
  - Remote Desktops Service farms
    
  - Remote Desktops Service users
    
  - Static VDI clients
    
  - Dynamic VDI clients
    
- How is software currently distributed? System Center Configuration Manager (which version, how many sites)?
    
- How are clients and users managed? Active Directory Domain Service?
    
- Are all devices and users located in the same Directory Service or spread across several forests (e.g. one per region)?
    
- List of sites and number of targeted devices per site.
    
- If planning to leverage on premises Exchange servers
    
  - Is it at least Exchange 2010?
    
  - Is Autodiscover enabled?
    
- If planning to leverage on premises Lync or Skype for Business Servers, is it at least Lync 2010?
    
## Network infrastructure

- From a software deployment perspective, which sites: 
    
  - Are well connected to the internal software distribution solution (e.g. System Center Configuration Manager)?
    
  - Are moderately well connected to the internal software distribution solution>
    
  - Are poorly connected to the internal software distribution solution?
    
- Which sites are well connected to the internet?
    
- Can the network handle the impact of the deployment and management scenarios selected?
    
## Application landscape

- Which versions and editions of Office are currently deployed?
    
- Is there a mix in CPU architecture (Office 32-bit and 64-bit in production)?
    
- How many installations of Project exist? Which version(s) and editions?
    
- How many installations of Visio exist? Which version(s) and editions?
    
- Is InfoPath used in production?
    
- Is there a need to exclude applications from the deployment (for example, Access)?
    
- Should end users be able to add applications if they were excluded to the base install (for example, Access)?
    
- Is Office currently configured and managed by Group Policy settings?
    
- How many Group Policy objects exist to configure the client? Are there any subsets for specific user groups?
    
- What are the number of Office languages packs deployed per region?
    
- Which applications are out of scope (for example, Publisher or OneDrive)?
    
- Are there any known dependencies on legacy, end of life, or discontinued products (for example, Access 97)?
    
- Is there a known group of users which test new releases and updated first (e.g. Application Owners, QA group, Pilot group)?
    
## Cloud infrastructure

- Is the Office 365 tenant configured and ready for production?
    
- Are the user licenses available in the tenant? Which SKU was purchased?
    
- Is identity already setup up? Which flavor (Cloud IDs, Synchronized IDs or Federated IDs)?
    
- If you are using Federated IDs, which identity provider is used (for example, Active Directory Federation Services)?
    
- Is the identity synchronization set up and working?
    
- Are all users accounts already synchronized to the tenant?
    
- Do the user accounts have the necessary Office 365 ProPlus license assigned?
    
- Is the self-service Office 365 ProPlus installation from the Office 365 portal blocked today?
    
- Are all URLs and IPs listed required for Office 365 whitelisted in the web proxies?
    
- Is the cloud infrastructure signed off by the security and compliance department?
    

