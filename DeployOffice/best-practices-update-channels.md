---
title: Best practices Update channels
ms.prod: OFFICE365
ms.assetid: 0a185e67-2b81-4c97-8c45-65984d8a9d9b
---


# Best practices: Update channels

> [!IMPORTANT]
> On April 20, we announced changes to better align the Office 365 ProPlus and Windows 10 update models. In that  [blog post](https://go.microsoft.com/fwlink/p/?linkid=846981), we highlighted changes to the release cadence and the support duration of feature updates for Office 365 ProPlus. As part of these changes, Office 365 ProPlus is also changing the names of its update channels. > For more information about these changes, see  [Overview of the upcoming changes to Office 365 ProPlus update management](overview-of-the-upcoming-changes-to-office-365-proplus-update-management.md). > As most of these changes take effect in September 2017, this content will be updated in the next few months. 
  
    
    

 *The Best Practices Guide includes deployment recommendations and real-world examples from the Office 365 Product Group and delivery experts from Microsoft Services. For a list of all the articles, see  [Best practices guide for deploying Office 365 ProPlus in the enterprise](best-practices-guide-for-deploying-office-365-proplus-in-the-enterprise.md).* 
With the 2016 release of Office UNRESOLVED_TOKEN_VAL(365) ProPlus, Microsoft introduced the concept of update channels to allow IT admins to have more control over new feature rollouts and business application validation. IT admins should leverage all channels to create validation, communications, and training processes. Preexisting QA or validation groups should be used.
  
    
    

Security updates are released every month for each production update channel in support. The Deferred Channel builds are released on the second Tuesday of a month (Patch Tuesday), while the First Release for Deferred Channel and Current Channel builds are quality-driven rather than date-driven, and can vary from the patch Tuesday release cadence. The following sections should be reviewed in order for the customer to understand each update channel.
## Current Channel (CC)

Current Channel for Office UNRESOLVED_TOKEN_VAL(365) ProPlus provides monthly releases that contain new or updated features, security updates, and non-security updates, such as updates that provide stability or performance improvements for Office. Not every Current Channel release contains all of these features and updates. A Current Channel release is supported only until the next Current Channel release is available; no new security updates are provided for previous Current Channel releases.
  
    
    
Leveraging Current Channel is ideal for users and/or organizations that want to provide users with the newest Office features as soon as they are available, and are not concerned about testing these features before deploying to production. Current Channel is released at quality-driven intervals rather than date-driven intervals. Current Channel is ideal for users in a customer's pilot group that are evaluating new features and functionality prior to rolling the features out to the broad user community.
  
    
    

## First Release for Deferred Channel (FRDC)

First Release for Deferred Channel for Office UNRESOLVED_TOKEN_VAL(365) ProPlus provides monthly releases that can contain new or updated features, security updates, and non-security updates, such as updates that provide stability or performance improvements for Office. It is intended to give pre-production users and compatibility testers a chance to adequately test the upcoming Deferred Channel release to identify possible issues that may need to be fixed with line-of-business applications, add-ins, and/or macros. First Release for Deferred Channel is a fully supported version of Office UNRESOLVED_TOKEN_VAL(365) ProPlus. When using the Deferred Channel for production users, it is strongly recommended to have approximately 10% of the overall end user population on First Release for Deferred Channel to do ample testing in preparing for the next Deferred Channel release.
  
    
    

## Deferred Channel (DC)

Deferred Channel for Office UNRESOLVED_TOKEN_VAL(365) ProPlus provides releases every four months that can contain new features, security updates, and non- security updates, such as updates that provide stability or performance improvements for Office. Subsequent Deferred Channel builds, released monthly for three months after the primary Deferred Channel release, contains security updates only. Deferred Channel might not have all of the new features that are included in the most recent Current Channel. After it is released, no new features are added to the Deferred Channel and it will only receive monthly security updates. A Deferred Channel release is supported for eight months, but after the eight-month period no new security updates are provided. There will always be two Deferred Channel releases available.
  
    
    
Deferred Channel is recommended for users and/or organizations that do not want to deploy the latest features of Office without adequate testing. Deferred Channel is also ideal for users and/or organizations that have a significant number of line-of-business applications, add-ins, and/or macros that need to be tested with each release.
  
    
    

> [!NOTE]
>  Deferred Channel is the default update branch for Office UNRESOLVED_TOKEN_VAL(365) ProPlus 2016.
  
    
    


## Update channel references

The following links provide detailed information about update channels:
  
    
    

-  [Overview of update channels for Office 365 ProPlus](https://technet.microsoft.com/en-us/library/mt455210.aspx)
    
  
-  [Version and build numbers of update channel releases for Office 365 clients](https://technet.microsoft.com/en-us/library/mt592918.aspx)
    
  
-  [Office 365 client update channel releases](https://technet.microsoft.com/en-us/office/mt465751)
    
  
-  [What's new and improved in Office 2016 for Office 365](https://support.office.com/en-us/article/What-s-new-and-improved-in-Office-2016-for-Office-365-95c8d81d-08ba-42c1-914f-bca4603e1426?ui=en-US&amp;rs=en-US&amp;ad=US)
    
  

