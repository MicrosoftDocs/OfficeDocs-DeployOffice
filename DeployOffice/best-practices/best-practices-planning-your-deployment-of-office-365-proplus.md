---
title: "Best practices Planning your deployment of Office 365 ProPlus"
ms.author: jwhit
author: jwhit-MSFT
manager: laurawi
ms.date: 9/10/2017
ms.audience: ITPro
ms.topic: concetpual
ms.service: o365-proplus-itpro
localization_priority: Normal
ms.collection:
- Ent_O365
- Strat_O365_ProPlus
ms.custom:
- Ent_Office_ProPlus_Best
- Strat_O365_ProPlus
- Ent_Office_ProPlus
ms.assetid: df4dba28-cc45-41a0-9b23-a1535523ab8c
description: "The Best Practices Guide includes deployment recommendations and real-world examples from the Office 365 Product Group and delivery experts from Microsoft Services. For a list of all the articles, see Best practices."
---

# Best practices: Planning your deployment of Office 365 ProPlus

 *The Best Practices Guide includes deployment recommendations and real-world examples from the Office 365 Product Group and delivery experts from Microsoft Services. For a list of all the articles, see [Best practices](best-practices.md).* 
  
Creating a deployment plan is a key component when migrating to Office 365 ProPlus. Planning is based on discovered assessment items, including constraints and how to implement Office 365 ProPlus to meet the goals of the project.
  
The following items should be considered when creating an Office 365 ProPlus deployment plan.
  
## Source locations

When planning for the Office source locations, it is recommended for the customer to use the existing tools and processes. Office 365 ProPlus can be deployed and updated directly from the Office Content Delivery Network (CDN), System Center Configuration Manager, or an internal share such as a network share or Distributed File System (DFS).
  
For more information on deployment source locations, see [Best practices: Deploying Office 365 ProPlus](best-practices-deploying-office-365-proplus.md).
  
## Channel membership

To establish a build validation process within the organization, Microsoft recommends the following channel membership guidance:
  
- 1% get Monthly Channel
    
- 10% get Semi-Annual Channel (Targeted)
    
- 89% get Semi-Annual Channel
    
For specific guidance on channel membership and management, see [Best practices: Managing channels](best-practices-managing-channels.md).
  
## Base client packaging

Because Office 365 ProPlus is a customizable package, you should determine what application sets each business group should get. Applications that are initially excluded can be added back in later; specific applications can be removed after Office 365 ProPlus has already been installed. If an application isto be excluded from the Office 365 ProPlus deployment, you should create a plan to restore or replace the application.
  
## Architecture

Planning should be completed to identify the deployment scenarios and use cases for the 64-bit architecture version of Office 365 ProPlus. The deployment plan should include how existing Office 64-bit users will be transitioned to the new Office 365 ProPlus client.
  
## Deployment configurations

Appropriate planning must be done to create all of the required install XMLs for the various end user deployment scenarios in the organization. The install XMLs should also include the option to install individually supported language packs for users who need a language that was not part of the original Office 365 ProPlus installation.
  
## Shared computing

Because Office 365 ProPlus has a specific Shared Computer Activation mode, the deployment plan should include how shared workstations and VDI environments will receive the correct installation package, as well as how they will be managed.
  
## Side by side

While Office 365 ProPlus supports generally an N-1 coexistence scenario with previous versions of Office, careful consideration and planning must be completed for any side by side scenarios. If Office side by side is going to be used in the environment, the deployment plan should contain an estimated time line of when users will transition off of the legacy Office applications and rely solely on Office 365 ProPlus. Although Office side by side is generally supported by Microsoft, it is not recommend as a long term solution for end users.
  
For more information on coexistence planning for side by side, InfoPath, and Project and Visio deployments, see [Best practices: Planning - reference materials](best-practices-planningreference-materials.md).
  
## Infopath

Because InfoPath is no longer part of the Office 2016 suite, a separate standalone installation of InfoPath 2013 must be configured and deployed. InfoPath will no longer be a part of the Office suite moving forward; plan accordingly.
  
## Project and Visio

There are multiple versions of Project and Visio that are supported to run alongside with Office 365 ProPlus. Customers can leverage their existing Project and Visio MSI versions, or leverage the Click-to-Run (C2R) versions that support traditional volume licensing and Office 365 licensing models. The deployment plan should also include how users will request a Project or Visio install, and whether or not the process will be automated.
  
## Office Scrub Tool (OffScrub)

You should use OffScrub to remove the legacy versions of Office prior to installing Office 365 ProPlus, including the 2013 version of Office 365 ProPlus. The deployment plan should include how the OffScrub tool will be used and integrated into the task sequence or deployment script.
  
For more information on the OffScrub tool, see [Best practices: Using OffScrub](best-practices-using-offscrub.md).
  
## Office 2016 for Mac

When planning for Office 2016 for Mac, existing Mac distribution methods and solutions should be considered.
  
For more information about Office 2016 for Mac deployments, see [Best practices: Deploying Office 2016 to Mac clients](best-practices-deploying-office-2016-to-mac-clients.md).
  
## Licensing

When planning an Office 365 ProPlus deployment, careful considerations and planning should be done to ensure all users are assigned the appropriate Office 365 license that includes Office 365 ProPlus prior to the deployment.
  
## Network

Office 365 ProPlus requires the following ports and protocols to be open: [Office 365 URLs and IP address ranges](https://support.office.com/en-us/article/Office-365-URLs-and-IP-address-ranges-8548a211-3fe7-47cb-abb1-355ea5aa88a2?ui=en-US&amp;rs=en-US&amp;ad=US).
  
It requires a reliable connection to the Office CDN during both the deployment and management phases. Therefore, adequate planning should make sure that the network can support the deployment and management methodologies.
  
For more network considerations, see [Best practices: Planning - reference materials](best-practices-planningreference-materials.md).
  
## Skipping builds and rollbacks

When Office 365 ProPlus updates to the next available version, it uses binary delta compression. However, when you skip a build or roll back, full file delta replication is used, which uses more bandwidth. You can switch from channel to channel; however, this is a 100% file download and should be avoided unless absolutely required. It is important to plan for the unlikely scenarios that a build will be skipped, or that a rollback to a previous version must be completed. Both scenarios have an impact on the network, so careful considerations should be made on when the actions can be performed to minimize end user impact.
  
The following table provides examples (the actual numbers vary from build to build):
  
||||||
|:-----|:-----|:-----|:-----|:-----|
|**Explanation** <br/> |**Current build** <br/> |**Next build** <br/> |**Compression type** <br/> |**Size** <br/> |
|Update to next current build  <br/> |2060  <br/> |2062  <br/> |Binary Delta  <br/> |~134 MB  <br/> |
|Roll back large jump  <br/> |2060  <br/> |1078  <br/> |File Delta  <br/> |~677 MB  <br/> |
|Changing channel  <br/> |Semi-Annual Channel  <br/> |Monthly Channel  <br/> |100% File Delta  <br/> |~1,000 MB  <br/> |
   
For more information about performing a rollback, see [Best practices: Channel management](best-practices-channel-management.md).
  
## Group Policy settings

Office offers about 3,000 group policy settings to allow a granular control of security, privacy, and user experience. In most cases, only a subset of these are needed to adjust the configuration to the needs, requirements, and intended user experience of an organization. It is important to include other departments that are responsible for IT security, data protection, and privacy early to get a sign-off of the GPOs before the actual deployment happens.
  
### Call to action

- Review [Best practices: Group policy and Office 365 ProPlus](best-practices-group-policy-and-office-365-proplus.md) with more than 250 proven, commonly set policies for users and computers. Check the listed additional settings.
    
- Adjust the settings to fit your needs and requirements.
    
- Get a Resultant Set of Policy (RSOP) of today's policies and review them. Identify settings not covered in the Best Practices for Office 365 ProPlus, and consider adding them if the setting is still needed.
    
- Check which settings where introduced in Office 2013 and Office 2016 and consider adding them to your list of settings.
    
- Identify which entity in your organization must sign off security and privacy related settings, present them and get a sign-off.
    
- Get a sign off and hand the settings over to the team that administers the group Policy Settings. The Best Practices settings can easily be imported into your environment.
    

