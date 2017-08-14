---
title: Best practices for managing updates in Office 365 ProPlus
ms.prod: OFFICE365
ms.assetid: 7c80254b-cc14-441c-8500-333d32c71949
---


# Best practices for managing updates in Office 365 ProPlus

> [!IMPORTANT]
> On April 20, we announced changes to better align the Office 365 ProPlus and Windows 10 update models. In that  [blog post](https://go.microsoft.com/fwlink/p/?linkid=846981), we highlighted changes to the release cadence and the support duration of feature updates for Office 365 ProPlus. As part of these changes, Office 365 ProPlus is also changing the names of its update channels. > For more information about these changes, see  [Overview of the upcoming changes to Office 365 ProPlus update management](overview-of-the-upcoming-changes-to-office-365-proplus-update-management.md). > As most of these changes take effect in September 2017, this content will be updated in the next few months. 
  
    
    

 *The Best Practices Guide includes deployment recommendations and real-world examples from the Office 365 Product Group and delivery experts from Microsoft Services. For a list of all the articles, see  [Best practices guide for deploying Office 365 ProPlus in the enterprise](best-practices-guide-for-deploying-office-365-proplus-in-the-enterprise.md).* 
Because Office UNRESOLVED_TOKEN_VAL(365) ProPlus is an Evergreen product, it is important to consider ongoing management after Office UNRESOLVED_TOKEN_VAL(365) ProPlus is deployed. This article provides a high level overview of the components that are involved with Office UNRESOLVED_TOKEN_VAL(365) ProPlus management.
  
    
    


## IT managed and unmanaged deployment scenarios

In general, the Office UNRESOLVED_TOKEN_VAL(365) ProPlus deployment solution includes functionality to deploy, maintain, and update clients from both an on premise infrastructure and off premise Office Content Delivery Network (CDN) infrastructure. The on premise and off premise deployment infrastructures give IT administrators flexibility to manage the initial deployment and maintenance of the Office client for different connectivity and end user segments of the environment.
  
    
    
For more information on deployment scenarios and channel management, see  [Best practices for managing channels](best-practices-for-managing-channels.md).
  
    
    

## Patching and update channels with Office 365 ProPlus

With the 2016 release of Office UNRESOLVED_TOKEN_VAL(365) ProPlus, Microsoft introduces the concept of update channels. Update channels give IT admins control over when new features will be rolled out to end users. It allows IT admins more time to validate critical business applications with new features, and lets IT admins manage communications and training needs of their end users . A majority of enterprise customers will use the Deferred Channel for their general end user population; however, IT admins should also use other channels for their pilot and pre-production user groups to create validation, communications, and training processes to ease feature roll outs to their end users.
  
    
    
Each device in the customer's environment can be a member of a specified channel, which controls feature adoption and code stability. To balance the speed of adoption, running a stable environment, and preparing for updates and product changes, it is recommended to leverage all channels and segment the customer end user base by purpose and function. By segmenting the work force and having multiple groups, customer's IT admins have more flexibility and control. For detailed information on the Office UNRESOLVED_TOKEN_VAL(365) update channels, see  [Best practices: Update channels](best-practices-update-channels.md).
  
    
    
The following image shows how new features and non-security updates are propagated from Current Channel to First Release for Deferred Channel to Deferred Channel.
  
    
    

  
    
    
![Office 365 release cadence](images/99a17880-4029-44e9-b478-be4058c30f92.png)
  
    
    
See also  [Best practices for managing channels](best-practices-for-managing-channels.md)
  
    
    

## Ongoing Office 365 ProPlus management and maintenance

In addition to checking for new Office 365 ProPlus build releases, you should periodically check for newer builds of the 2016 Office Deployment Tool and Office 2016 Administrative Template files. New releases of these items can include new features or capabilities to help IT admins manage Office 365 ProPlus deployments. It is recommended that you have a process in place to make sure that the Office Deployment Tool and Office 2016 Administrative Template files that are being used are the latest available versions from Microsoft.
  
    
    

