---
title: Overview of update channels for Office 365 ProPlus
ms.prod: OFFICE365
ms.assetid: 9ccf0f13-28ff-4975-9bd2-7e4ea2fefef4
---


# Overview of update channels for Office 365 ProPlus

> [!IMPORTANT]
> On April 20, we announced changes to better align the Office 365 ProPlus and Windows 10 update models. In that  [blog post](https://go.microsoft.com/fwlink/p/?linkid=846981), we highlighted changes to the release cadence and the support duration of feature updates for Office 365 ProPlus. As part of these changes, Office 365 ProPlus is also changing the names of its update channels. > For more information about these changes, see  [Overview of the upcoming changes to Office 365 ProPlus update management](overview-of-the-upcoming-changes-to-office-365-proplus-update-management.md). > As most of these changes take effect in September 2017, this content will be updated in the next few months. 
  
    
    

One of the benefits of Office 365 ProPlus is that Microsoft can provide new features for Office apps on a regular basis, through monthly updates. However, as the admin who deploys Office 365 ProPlus to the users in your organization, you might want to have more control over how often your users get these new features. For the Office 2016 version of Office 365 ProPlus, Microsoft provides you three options, called update channels, to control how often Office 365 ProPlus is updated with new features. Here's an overview of the three options.

|**Update channel**|**Primary purpose**|**How often updated with new features**|**Default update channel for the following products**|
|:-----|:-----|:-----|:-----|
| [Current Channel](overview-of-update-channels-for-office-365-proplus.md#BKMK_CB) <br/> |Provide users with the newest features of Office as soon as they're available.  <br/> |Monthly  <br/> |Visio Pro for Office 365  <br/> Project Online Desktop Client  <br/>  Office 365 Business, which is the version of Office that comes with some Office 365 plans, such as Business Premium. <br/> |
| [Deferred Channel](overview-of-update-channels-for-office-365-proplus.md#BKMK_CBB) <br/> |Provide users with new features of Office only a few times a year.  <br/> |Every four months  <br/> |Office 365 ProPlus  <br/> |
| [First Release for Deferred Channel](overview-of-update-channels-for-office-365-proplus.md#BKMK_FRCBB) <br/> |Provide pilot users and application compatibility testers the opportunity to test the next Deferred Channel.  <br/> |Every four months  <br/> |None  <br/> |
   
Which update channel you decide to deploy to your users depends on several factors, including how many line-of-business applications, add-ins, or macros that you need to test any time there is an updated version of Office 365 ProPlus. To help you make this decision, review the following information about the three update channels that are available for Office 365 ProPlus.
## Current Channel for Office 365 ProPlus
<a name="BKMK_CB"> </a>

Current Channel might be the right choice for your organization in the following situations:
  
    
    

- You want to provide your users with the newest features of Office as soon as those features are available
    
  
- You don't have many line-of-business applications, add-ins, or macros that you need to test to determine if they work with an updated version of Office.
    
  
A new Current Channel is expected to be released at least once each month. The release can contain new or updated features, security updates, and non-security updates, such as updates that provide stability or performance improvements for Office. Not every Current Channel release will contain all of these. For example, there might be some months where there aren't any new features. 
  
    
    
A Current Channel release is supported only until the next Current Channel release is available. No new security updates are provided for previous Current Channel releases.
  
    
    

> [!NOTE]
> There is also First Release for Current Channel. This update channel provides an early look at the next Current Channel release. First Release for Current Channel is the same update channel that those in the  [Office Insider](https://www.office.com/insider) program receive.
  
    
    


## Deferred Channel for Office 365 ProPlus
<a name="BKMK_CBB"> </a>

If your organization doesn't want to deploy the latest features of Office right away or you have a significant number of line-of-business applications, add-ins, or macros that you need to test with Office, than Deferred Channel might be the better choice for your organization. That's because Deferred Channel is made available only a few times a year, instead of every month. Deferred Channel is the default update channel for Office 365 ProPlus.
  
    
    
A new Deferred Channel is expected to be released every four months. It can contain new features, security updates, and non-security updates, such as updates that provide stability or performance improvements for Office. In the four months prior to a new Deferred Channel release, Microsoft provides builds of the upcoming release so that pilot users and application compatibility testers in your organization can work with the release. These builds are called  [First Release for Deferred Channel](overview-of-update-channels-for-office-365-proplus.md#BKMK_FRCBB).
  
    
    
 Deferred Channel won't have all the new features included in the most recent Current Channel. The features included in Deferred Channel are the features from the Current Channel four months ago. This four month difference is intended to give your organization time to test the new features. If you want some of your users to have the very latest features of Office 365 ProPlus, you can provide those users with Current Channel.
  
    
    
The first Deferred Channel release will be available approximately four months after the release of Office 2016. After a Deferred Channel release is available, it only gets security updates, if there are any, in the following months. After it's been released, no new features are added to Deferred Channel. The next time you'll receive new features, if there are any, is when the next Deferred Channel release is made available. 
  
    
    
A Deferred Channel release is supported for eight months. When a new Deferred Channel release is made available, you can continue to use the Deferred Channel release that you've deployed. But four months later, when another Deferred Channel is released, your original Deferred Channel release is no longer supported and won't get any more security updates. 
  
    
    
Here's an example that might help clarify this:
  
    
    

- A new Deferred Channel is released. Let's refer to that as DC1. You deploy DC1 to the users in your organization.
    
  
- Four months later, another Deferred Channel release comes out - DC2. You decide not to deploy it. You stay with DC1 and continue to get security updates.
    
  
- Four months after that, DC3 is released. At this point, DC1 is no longer supported and won't get any new security updates. To stay on a supported release, you can either deploy DC2 or DC3 to the users in your organization. But keep in mind that in four more months, when DC4 is released, DC2 won't be supported anymore.
    
  
There are always two Deferred Channel releases available and supported. 
  
    
    

## First Release for Deferred Channel for Office 365 ProPlus
<a name="BKMK_FRCBB"> </a>

To help your organization prepare for a Deferred Channel release, Microsoft provides First Release for Deferred Channel. This update channel is provided approximately four months before the availability of the next Deferred Channel. The primary purpose of this update channel is to give pilot users and application compatibility testers in your organization a chance to work with the upcoming Deferred Channel release. During this time, you might identify possible issues that you need to fix with your line-of-business applications, add-ins, or macros or that you want Microsoft to fix.
  
    
    
During this four month testing phase, no new features are added to First Release for Deferred Channel. But, security updates and non-security updates, such as updates that provide stability or performance improvements for Office, can be added to this update channel.
  
    
    
The initial First Release for Deferred Channel is expected to be available soon after Office 2016 is released. An updated version will be available approximately every month. Even though this update channel is primarily designed for your testing, it's a fully supported version of Office 365 ProPlus. 
  
    
    
After a Deferred Channel is released, a new First Release for Deferred Channel is made available to start testing the next Deferred Channel.
  
    
    

## Visual representation of the update channels for Office 365 ProPlus
<a name="BKMK_FRCBB"> </a>

Here's an illustration of how a Current Channel release is used to create a First Release for Deferred Channel release and how a First Release for Deferred Channel release becomes a Deferred Channel release. The illustration also shows that a Deferred Channel release continues to get security updates for up to eight months. Although not shown in the illustration, a First Release for Deferred Channel release also gets security updates during the four months it's available. 
  
    
    

  
    
    
![Update Channels visual representation](images/6769367a-3c03-4ada-94d4-6c75228aabb2.png)
  
    
    

  
    
    

  
    
    

## Frequency of updates for the update channels for Office 365 ProPlus
<a name="BKMK_Frequency"> </a>

As a review, the following table provides information about how often each update channel can include feature updates, security updates, and non-security updates, such as updates that provide stability or performance improvements for Office. That doesn't mean an update channel contains any or all of these types of updates. For example, there might be a month when Current Channel doesn't contain any new or updated features. 
  
    
    


|**Update channel**|**Feature updates**|**Security updates**|**Non-security updates**|
|:-----|:-----|:-----|:-----|
| [Current Channel](overview-of-update-channels-for-office-365-proplus.md#BKMK_CB) <br/> |Monthly  <br/> |Monthly  <br/> |Monthly  <br/> |
| [Deferred Channel](overview-of-update-channels-for-office-365-proplus.md#BKMK_CBB) <br/> |Every four months  <br/> |Monthly  <br/> |Every four months  <br/> |
| [First Release for Deferred Channel](overview-of-update-channels-for-office-365-proplus.md#BKMK_FRCBB) <br/> |Every four months  <br/> |Monthly  <br/> |Monthly  <br/> |
   

## Configure the update channel to be used by Office 365 ProPlus
<a name="BKMK_Configure"> </a>

Deferred Channel is the default update channel for Office 365 ProPlus. But you can configure an Office 365 ProPlus installation to use Current Channel or First Release for Deferred Channel. Also, not all users in your organization have to be configured the same. For example, you might do the following:
  
    
    

- Provide a group of pilot users with Current Channel, so they can try out the new features of Office as they become available.
    
  
- Provide your finance department, which has several key line-of-business applications, with Deferred Channel.
    
  
- Provide your application compatibility testers with First Release for Deferred Channel so that they can test that the finance applications will work with the next Deferred Channel release.
    
  
To configure the update channel for an Office 365 ProPlus installation, you can use the latest version of the  [Office Deployment Tool](http://go.microsoft.com/fwlink/p/?LinkID=626065) or use the [Group Policy Administrative Templates files (ADMX/ADML) ](https://www.microsoft.com/download/details.aspx?id=49030) for Office 2016.
  
    
    
If you use the Office Deployment Tool, you can use the Channel attribute in the configuration.xml file. The Channel attribute can be specified in the Add element or the Update element. The relevant values are Current, Deferred, and FirstReleaseDeferred. For example, if you want to download and install the Current Channel of Office 365 ProPlus, your configuration.xml file would look like the following example. 
  
    
    



```

<Configuration>
   <Add SourcePath="\\\\server01\\office" OfficeClientEdition="32"  Channel="Current"> 
    <Product ID="O365ProPlusRetail" > 
     <Language ID="en-us" /> 
    </Product> 
   </Add> 
</Configuration>
```

The name of the Group Policy setting is Update Channel. You can find this policy setting under Computer Configuration\\Administrative Templates\\Microsoft Office 2016 (Machine)\\Updates. The relevant choices when you enable the Group Policy setting are Current, Deferred, and FirstReleaseDeferred. 
  
    
    
You can also provide users with First Release for Deferred Channel by selecting them for the  [First Release program for Office 365](https://support.office.com/article/3B3ADFA4-1777-4FF0-B606-FB8732101F47). If you do this, those users can install First Release for Deferred Channel directly from the **Software** page in the Office 365 portal.
  
    
    

## Additional information about the update channels for Office 365 ProPlus
<a name="BKMK_Configure"> </a>

Here is some additional information that might be useful to know as you determine how to configure and use Current Channel, Deferred Channel, and First Release for Deferred Channel in your organization.
  
    
    

- You can switch an Office 365 ProPlus installation from one update channel to another. For example, you might want to move a user from Current Channel to Deferred Channel. To switch update channels, you can use the Office Deployment Tool or Group Policy.
    
  
- If the user does an Online Repair of Office 365 ProPlus, the installation reverts to Deferred Channel, unless you've configured a Group Policy setting to provide a different update channel.
    
  
- If you have Visio Pro for Office 365 or Project Online Desktop Client installed on the same computer as Office 365 ProPlus, they all must use the same update channel. You can't have a mix of update channels on the same computer. 
    
  

## See also
<a name="BKMK_Configure"> </a>


#### Other Resources


  
    
    
 [Version and build numbers of update channel releases](version-and-build-numbers-of-update-channel-releases.md)
  
    
    
 [Change management for Office 365 clients](change-management-for-office-365-clients.md)
  
    
    
 [Office 365 client update channel releases](https://go.microsoft.com/fwlink/?LinkId=626090)
  
    
    
 [Plan your upgrade from Office 365 ProPlus 2013 to 2016](plan-your-upgrade-from-office-365-proplus-2013-to-2016.md)
