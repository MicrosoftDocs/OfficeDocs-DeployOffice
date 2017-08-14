---
title: Choose how to manage updates to Office 365 ProPlus
ms.prod: OFFICE365
ms.assetid: e486afce-ad31-4889-87a4-28796751bb86
---


# Choose how to manage updates to Office 365 ProPlus

 **Summary:** Compares different ways to update Office 365 ProPlus, including automatically from the Internet or from an on-premises location.
  
    
    

There are three ways that admins typically apply updates for Office 365 ProPlus:
- Automatically from the Internet
    
  
- Automatically from an on-premises location
    
  
- By installing an updated version of Office 365 ProPlus
    
  
Which way is right for your organization depends on how much administrative effort you want to expend and how much control that you want to have over the update process.In most cases, you use the Office Deployment Tool or Group Policy to  [configure the appropriate update settings](configure-update-settings-for-office-365-proplus.md).
> [!IMPORTANT]
> Because individual updates aren't available for Office 365 ProPlus, you can't use Windows Update, Windows Server Update Services (WSUS), or System Center Configuration Manager to download and apply individual updates to Office 365 ProPlus. 
  
    
    


## Apply updates automatically from the Internet to Office 365 ProPlus
<a name="Internet"> </a>

This is the default setting for Office 365 ProPlus. For example, if your users install Office 365 ProPlus themselves from the Office 365 portal, Office 365 ProPlus is configured to get updates automatically from the Internet. No additional user or administrative configuration is needed.
  
    
    
Even if you use the Office Deployment Tool to deploy Office 365 ProPlus to your users, you can configure updates to be applied automatically from the Internet.
  
    
    
This option might be a good choice for your organization if you have users who travel or work remotely and don't connect to the corporate network regularly. It's also the choice that requires the least amount of administrative effort. But, this option gives you the least amount of control over the update process.
  
    
    

## Apply updates automatically from an on-premises location to Office 365 ProPlus
<a name="OnPremises"> </a>

You can configure Office 365 ProPlus to get updates automatically from a location on your network, such as a network share. You can configure the update location by using the Office Deployment Tool or Group Policy.
  
    
    
This is a good option if you want more control over the version of Office 365 ProPlus that users have installed. For example, even if the June version of Office 365 ProPlus is available, you might want your users to continue using the May version. You might want to do this because you want to test to make sure that your line-of-business applications work with the June version.
  
    
    

> [!TIP]
> For an example of how to set up a group to test updates,  [read this blog post about how to manage updates for Office 365 ProPlus](https://go.microsoft.com/fwlink/p/?LinkID=507547). 
  
    
    

You'll have to use the Office Deployment Tool to  [download updated versions of Office 365 ProPlus from the Internet](overview-of-the-office-2016-deployment-tool.md) to your local network. After it's downloaded, you can place the updated version on a network share that is close to the users.
  
    
    

## Apply updates by installing an updated version of Office 365 ProPlus
<a name="Install"> </a>

Instead of using automatic updates, you can deploy an updated version of Office 365 ProPlus to your users by using the Office Deployment Tool. You can use the Office Deployment Tool together with software distribution tools, such as System Center Configuration Manager or Microsoft Intune.
  
    
    
This option is useful if you want to control which version of Office 365 ProPlus users have, and you want to control which users get updated and when they get updated. This option provides the most control, but also requires the most administrative effort.
  
    
    
This option re-installs Office 365 ProPlus, but only new or changed files are downloaded to the user's computer.
  
    
    
If you decide to use this option, you'll disable automatic updates. You can  [control that setting](configure-update-settings-for-office-365-proplus.md) by using either the Office Deployment Tool or Group Policy.
  
    
    

## See also
<a name="Install"> </a>


#### Other Resources


  
    
    
 [Choose how to deploy Office 365 ProPlus](choose-how-to-deploy-office-365-proplus.md)
  
    
    
 [Overview of the Office 2016 Deployment Tool](overview-of-the-office-2016-deployment-tool.md)
  
    
    
 [Overview of the update process for Office 365 ProPlus](overview-of-the-update-process-for-office-365-proplus.md)
  
    
    
 [Configure update settings for Office 365 ProPlus](configure-update-settings-for-office-365-proplus.md)
  
    
    
 [End-user update notifications for Office 365 ProPlus](end-user-update-notifications-for-office-365-proplus.md)
