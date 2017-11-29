---
title: "Best Practices Deployment scenarios"
ms.author: jwhit
author: jwhit-MSFT
manager: laurawi
ms.date: 3/10/2017
ms.audience: ITPro
ms.topic: concetpual
ms.service: o365-administration
localization_priority: Normal
ms.collection: Ent_O365
ms.custom: Ent_Office_ProPlus
ms.assetid: 4d9d796b-4291-4e0c-bd75-751b434eeb01
description: "The Best Practices Guide includes deployment recommendations and real-world examples from the Office 365 Product Group and delivery experts from Microsoft Services. For a list of all the articles, see Best practices."
---

# Best Practices: Deployment scenarios
[![Help for Office 365 IT Pros](../images/0d973495-46cc-42dc-a26e-87933e8b0a6b.png)
  
](http://technet.microsoft.com/library/6e18d402-f35e-415a-83b1-56620d4074ff%28Office.14%29.aspx)
 *The Best Practices Guide includes deployment recommendations and real-world examples from the Office 365 Product Group and delivery experts from Microsoft Services. For a list of all the articles, see [Best practices](best-practices.md).* 
  
## The Enterprise Managed scenario
<a name="Enterprise"> </a>

The Enterprise Managed scenario represents large to very large organizations, with tens of thousands of employees who are distributed globally. Enterprise Managed scenarios use software management tools such as System Center Configuration Manager to manage end user client devices and software. Users are not local administrators on their machines. The IT department in the Enterprise Managed scenario typically controls and automates the technologies.
  
![Enterprise Managed deployment](../images/180d081a-aad7-40f9-bb18-ff65ff166530.png)
  
## The Locally Managed scenario
<a name="Local"> </a>

The Locally Managed scenario represents medium to large organizations that range up to ten thousand employees. There may be multiple sites in different countries or continents, but locally managed is not considered to be distributed globally. Locally Managed does not have software distribution tools to manage client software, but instead uses a Distributed File System and network shares to host deployment packages for end users. Locally Managed leverages batch files or scripts that run with elevated privileges so the deployment is automated for end users, who are generally not local administrators on their machines.
  
![Locally Managed deployment](../images/067af377-022d-4a4b-aa04-993669398ebc.png)
  
## The Cloud Managed scenario
<a name="Cloud"> </a>

The Cloud Managed scenario represents small businesses that typically range in the hundreds of employees, and are generally located out of one country or a single office. Cloud Managed does not have software distribution tools to manage client software, but instead uses network shares to host deployment packages for end users. Cloud Managed uses batch files or scripts so the deployment is automated for end users, but because users have local administrator rights, some software installation is left up to the end user.
  
![Cloud Managed deployment](../images/f1468c2b-b347-4f55-b6b7-0fa9e23a7e97.png)
  

