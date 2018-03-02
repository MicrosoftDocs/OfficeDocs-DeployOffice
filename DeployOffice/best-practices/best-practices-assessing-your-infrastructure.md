---
title: "Best practices Assessing your infrastructure"
ms.author: jwhit
author: jwhit-MSFT
manager: laurawi
ms.date: 3/23/2017
ms.audience: ITPro
ms.topic: concetpual
ms.service: o365-administration
localization_priority: Normal
ms.collection: 
- Ent_O365
- Strat_O365_ProPlus
ms.custom:
- DeployProPlus
- DeployProPlus_SOConly
- Strat_O365_ProPlus
- Ent_Office_ProPlus
ms.assetid: f4899394-87f3-425c-9902-ddd65eaaac97
description: "The Best Practices Guide includes deployment recommendations and real-world examples from the Office 365 Product Group and delivery experts from Microsoft Services. For a list of all the articles, see Best practices."
---

# Best practices: Assessing your infrastructure

 *The Best Practices Guide includes deployment recommendations and real-world examples from the Office 365 Product Group and delivery experts from Microsoft Services. For a list of all the articles, see [Best practices](best-practices.md).* 
  
Deploying Office 365 ProPlus requires the same level of planning as any large-scale Office client deployment. The focus of the Best Practices for Office 365 ProPlus focuses on key actives that are specific to deploying Office 365 ProPlus.
  
This topic covers key infrastructure assessment components and application compatibility discovery processes, as well as tools to aide with understanding the scope and remediation needs for Office 365 ProPlus.
  
For Office 365 ProPlus, there are two key areas that the assessment should focus on; these are understanding the infrastructure and environment, and application compatibility for legacy Office client products. It is important when preparing for the Office 365 ProPlus deployment that you understand the current state of the environment and the differences between Office 365 ProPlus and legacy MSI based clients.
  
## Environment assessment

The assessment phase incorporates planning and requirements gathering.
  
For Office 365 ProPlus specifically, the following list describes key areas for assessment:
  
- Understand the Office 365 components that are already being used in the environment, and determine any settings or configurations that are needed to enable and support Office 365 ProPlus.
    
- Understand the software distribution solutions that are currently being used.
    
- Assess network bandwidth capabilities to determine the best distribution method for first installation and update management.
    
- Understand the current versions of client software in the environment.
    
- Understand the Office applications that are required by the customer for each segment of users.
    
## Application compatibility assessment

The second area to focus on when planning an Office 365 ProPlus deployment is application compatibility. The common application compatibility issues when moving to a new version of Office are VBA, macros, third party add-ins, and complex documents. Many customers have a difficult time collecting the relevant data in their environment, as well as defining what components are business critical and which components are used by individuals.
  
To simplify these activities, the following four-phase approach helps to identify the components that must be remediated prior to migrating to Office 365 ProPlus. The process involves leveraging the business users and the Telemetry Dashboard.
  
|||
|:-----|:-----|
|**Phase** <br/> |**Description** <br/> |
|Discover the components  <br/> |Discover what is being used, by whom, and how often. This helps determine what to test for compatibility with the new version of Office. Documents and solutions that are used frequently and by large numbers of users are good candidates for testing.  <br/> |
|Rationalize the business-critical components  <br/> |Partner with business groups to identify what's critical to the business. The discovery data can help jumpstart and guide this discussion. The goal is to identify the business-critical documents and solutions that must be ready on the first day of the Office deployment.  <br/> |
|Validate the solution  <br/> |Start a pilot deployment where users test required documents and solutions by using Office. This is called user acceptance testing. Troubleshoot any issues that occur for documents and solutions that must be ready on the first day of deployment.  <br/> |
|Manage the components for future validation of critical components  <br/> |Deploy Office and monitor documents and solutions. Watch for trends in Office performance and behavior as updated Office solutions are deployed. Use your Help Desk resources to troubleshoot issues as they occur for non-business-critical documents and solutions.  <br/> |
   
For specific guidance on each phase of the application compatibility framework, see [Assess Office compatibility with other versions of Office](https://technet.microsoft.com/en-us/library/ee819096%28v=office.16%29.aspx).
  
For specific guidance on the Telemetry Dashboard installation and usage, see [Best practices: Office Telemetry](best-practices-office-telemetry.md).
  
## Call to action

- Review the suggested questionnaire for the different focus areas. See [Best practices: Focus areas for assessment](best-practices-focus-areas-for-assessment.md).
    
- Identify the appropriate contact for each area and discuss the questions with them.
    
- Note down all responses and use them as the foundation for your planning.
    
## Related Topics

[Best practices: Assessment - reference materials](best-practices-assessmentreference-materials.md)
  

