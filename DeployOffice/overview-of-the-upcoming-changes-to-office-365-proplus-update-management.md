---
title: "Overview of the upcoming changes to Office 365 ProPlus update management"
ms.author: danbrown
author: DHB-MSFT
manager: laurawi
ms.date: 10/11/2017
ms.audience: ITPro
ms.topic: get-started-article
ms.service: o365-proplus-itpro
localization_priority: Normal
ms.collection: Ent_O365
ms.custom: Ent_Office_ProPlus
ms.assetid: 78b33779-9356-4cdf-9d2c-08350ef05cca
description: "On April 20th, we announced some changes to better align the Office 365 ProPlus and Windows 10 update models. In that blog post, we highlighted these key changes:"
---

# Overview of the upcoming changes to Office 365 ProPlus update management

On April 20th 2017, we announced some changes to better align the Office 365 ProPlus and Windows 10 update models. In that [blog post titled "Office 365 ProPlus updates"](https://go.microsoft.com/fwlink/p/?linkid=846981), we highlighted these key changes that are now in effect:
  
- **Two updates a year.** We have reduced the Office 365 ProPlus update cadence from three to two times a year, with semi-annual feature updates to Windows 10 and Office 365 ProPlus planned for March and September.
    
- **18 months of support.** We have extended the support period for Office 365 ProPlus semi-annual feature updates from 12 to 18 months (starting from the initial release) so IT professionals can choose to update once or twice a year.
    
As part of these changes, Office 365 ProPlus has changed the names of its update channels to make them more descriptive.
  
All these changes went into effect in September 2017.
  
> [!NOTE]
> These changes also apply to Visio Pro for Office 365 and Project Online Desktop Client. 
  
The following information is intended to help you understand these upcoming changes and understand what steps, if any, you need to take when it comes to updating Office 365 ProPlus on Windows 10.
  
- [The names of the Office 365 ProPlus update channels have changed](overview-of-the-upcoming-changes-to-office-365-proplus-update-management.md#BKMK_Names)
    
- [The default enterprise release schedule for Office 365 ProPlus have changed to twice a year](overview-of-the-upcoming-changes-to-office-365-proplus-update-management.md#BKMK_Schedule)
    
- [The support duration for Semi-Annual Channel releases has increased](overview-of-the-upcoming-changes-to-office-365-proplus-update-management.md#BKMK_Duration)
    
- [The purpose of each Office 365 ProPlus update channel stays the same](overview-of-the-upcoming-changes-to-office-365-proplus-update-management.md#BKMK_Purpose)
    
- [How you deploy updates for Office 365 ProPlus stays the same](overview-of-the-upcoming-changes-to-office-365-proplus-update-management.md#BKMK_Deploy)
    
- [Recommended next steps](overview-of-the-upcoming-changes-to-office-365-proplus-update-management.md#BKMK_Steps)
    
- [Upcoming schedule for Office 365 ProPlus releases](overview-of-the-upcoming-changes-to-office-365-proplus-update-management.md#BKMK_Upcoming)
    
<a name="BKMK_Names"> </a>
## The names of the Office 365 ProPlus update channels are changing

We heard your feedback and we made the names for our update channels more descriptive. 
  
Here is a list of the name changes for Office 365 ProPlus. We'll start using the new names in September 2017. 
  
|**New name**|**Old name**|
|:-----|:-----|
|Monthly Channel  <br/> |Current Channel  <br/> |
|Semi-Annual Channel (Targeted)  <br/> |First Release for Deferred Channel  <br/> |
|Semi-Annual Channel  <br/> |Deferred Channel  <br/> |
   
> [!NOTE]
> We made some slight changes to the names for Semi-Annual Channel. We've changed "(Pilot)" to "(Targeted)" and we've removed the "(Broad)" designation from the new name for Deferred Channel. These names will be aligned across Windows 10 and Office 365 ProPlus feature update releases. <br/> <br/> For information about upcoming changes to the names of Windows 10 feature update releases, [read this blog post](http://blogs.technet.microsoft.com/windowsitpro/2017/07/27/waas-simplified-and-aligned/). 
  
<a name="BKMK_Schedule"> </a>
## The default enterprise release schedule for Office 365 ProPlus is changing to twice a year

Previously, Office 365 ProPlus recieved feature updates in First Release for Deferred Channel in February, June, and October. Those feature updates are then available in Deferred Channel four months later.
  
Starting in September 2017, Office 365 ProPlus now recives feature updates in Semi-Annual Channel (Targeted) twice a year, in March and September. Those feature updates will then be available in Semi-Annual Channel four months later, in July and January.
  
Windows 10 also targets the March and September time frames for feature updates to Windows 10 in order to provide customers with a more predictable, consistent release schedule.
  
Office 365 ProPlus continues to receive security updates and quality updates monthly, if necessary, for these update channels on the second Tuesday of each month. Note that Semi-Annual Channel only gets a quality update if there is a critical customer issue that needs to be fixed. There are no changes to the Office 365 ProPlus release schedule for Monthly Channel.
  
> [!IMPORTANT]
> Office released a new Deferred Channel and First Release for Deferred Channel on June 13, 2017. The new semi-annual schedule began on September 12, 2017. This was a month earlier than the previously planned October release.For more information, see [Upcoming schedule for Office 365 ProPlus releases](overview-of-the-upcoming-changes-to-office-365-proplus-update-management.md#BKMK_Upcoming) and [Recommended next steps](overview-of-the-upcoming-changes-to-office-365-proplus-update-management.md#BKMK_Steps). 
  
<a name="BKMK_Duration"> </a>
## The support duration for Semi-Annual Channel releases has increased

With the change to a twice-a-year release schedule, the semi-annual feature update releases of Office 365 ProPlus is now supported for 18 months, instead of 12 months, starting from the initial release.
  
A new version, with feature updates, will be released to Semi-Annual Channel (Targeted) in March and September. Four months later, that version, with those feature updates, will be released in Semi-Annual Channel and will be supported for the next 14 months. For example, a new version of Semi-Annual Channel (Targeted) will be released in March 2018. In July 2018, that version will be made available in Semi-Annual Channel and will be supported until September 2019.
  
This change provides more time and flexibility for IT Pros to deploy releases. For example, customers who want to update once a year will be able to do so with the extended support duration on Semi-Annual Channel. For customers who want to get new features as quickly as possible, we will continue to offer an update channel that provides monthly feature updates.
  
System Center Configuration Manager will continue to support Office 365 ProPlus and Windows 10 across their 18 month support period.
  
<a name="BKMK_Purpose"> </a>
## The purpose of each Office 365 ProPlus update channel stays the same


The names may have changed, but the purpose of each update channel remains the same. For example, Monthly Channel, formerly named Current Channel, is still the release that provides new features to Office 365 ProPlus approximately every month. 
  
The following table provides a summary of the purpose, target audience, and release frequency of each update channel.
  
||**Monthly Channel**|**Semi-Annual Channel (Targeted)**|**Semi-Annual Channel**|
|:-----|:-----|:-----|:-----|
|**Purpose** <br/> |Monthly updates with the latest features  <br/> |IT pilots, application validation, and end-user acceptance testing before broad deployment  <br/> |Broad deployment  <br/> |
|**Target audience** <br/> |Representative end users, developers, and ISVs  <br/> |IT testers, app and add-in owners, representative end users  <br/> |All enterprise end users  <br/> |
|**Release frequency** <br/> |Monthly  <br/> |Twice per year, in March and September  <br/> |Twice a year, in January and July  <br/> |
   
Semi-Annual Channel (Targeted) releases for Office 365 ProPlus are intended to provide enterprises time to pilot and to validate their line-of-business applications, add-ins, and macros with Office 365 ProPlus before Semi-Annual Channel is released. If you find problems with a release of Semi-Annual Channel (Targeted), provide feedback as soon as possible to Microsoft through your [Microsoft Premier](https://go.microsoft.com/fwlink/p/?linkid=847275) agreement or your Microsoft account representative.
  
The following illustration shows the relationship between the Office 365 ProPlus update channels and the approximate release schedule.
  
![The three primary Office 365 update channels, showing the relationship between the update channels and the release cadence](images/16fae804-8d79-43db-8902-2adbbc6e0c9e.png)
  
For more information about the Office 365 ProPlus and Windows 10 update models, see [Overview of update channels for Office 365 ProPlus](overview-of-update-channels-for-office-365-proplus.md) and [Windows 10 servicing branches](https://go.microsoft.com/fwlink/p/?linkid=847276).
  
<a name="BKMK_Deploy"> </a>
## How you deploy updates for Office 365 ProPlus stays the same

Even though there are changes to release names, release schedules, and support duration, how you update Office 365 ProPlus remains the same. 
  
For example, if Office 365 ProPlus is currently configured to use Deferred Channel and to get updates directly from the Office Content Delivery Network (CDN), there are no changes you need to make for the January 2018 release of the first Semi-Annual Channel. You will continue to get updated automatically.
  
If you manage the update process by downloading updated versions of Office 365 ProPlus and then deploying those updates with your enterprise software deployment tools, such as System Center Configuration Manager, you can continue to do that just like you have been doing.
  
<a name="BKMK_Steps"> </a>
## Recommended next steps

If you are currently using Deferred Channel, and doing enterprise pilots and application validation on First Release for Deferred Channel, be sure to review the [Upcoming schedule for Office 365 ProPlus releases](overview-of-the-upcoming-changes-to-office-365-proplus-update-management.md#BKMK_Upcoming). 
  
If you've just started deploying Office 365 ProPlus, we recommend that you have less than 10% of your users on First Release for Deferred Channel to do your enterprise pilots and application validation. 
  
If your organization hasn't yet deployed Office 365 ProPlus or Windows 10, you can learn more here:
  
- [Deployment guide for Office 365 ProPlus](deployment-guide-for-office-365-proplus.md)
    
- [Best practices](best-practices/best-practices.md)
    
- [Application compatibility readiness](https://aka.ms/officeappcompat)
    
- [Windows 10 deployment considerations](https://go.microsoft.com/fwlink/p/?linkid=847277)
    
- [Overview of Windows as a service](https://go.microsoft.com/fwlink/p/?linkid=847278)
    
For deployment assistance with Office 365 ProPlus or Windows 10, [contact FastTrack](https://go.microsoft.com/fwlink/p/?linkid=847279).
  
<a name="BKMK_Upcoming"> </a>
## Upcoming schedule for Office 365 ProPlus releases

The change to the Office 365 ProPlus release cadence began with the release made September 12, 2017. 
  
> [!IMPORTANT]
> Office released a new Deferred Channel and First Release for Deferred Channel on June 13, 2017. The first version of Semi-Annual Channel (Targeted) was released on September 12, 2017. This was a month earlier than the previously planned October release. The first Semi-Annual Channel was released on January 9, 2018. For more information, see the schedule listed below and [Recommended next steps](overview-of-the-upcoming-changes-to-office-365-proplus-update-management.md#BKMK_Steps). 
  
Here's a schedule of key previous and upcoming dates for Office 365 ProPlus releases, separated by update channel. All dates are approximate and not all dates are listed.
  
|**Date**|**First Release for Deferred Channel  <br/> Semi-Annual Channel (Targeted)**|**Deferred Channel  <br/> Semi-Annual Channel**|**IT Pro action to take**|
|:-----|:-----|:-----|:-----|
|June 13, 2017  <br/> | New features are released to First Release for Deferred Channel. <br/> <br/> Enterprise pilots and application validation should begin. <br/>  <br/>This is the last release using the name "First Release for Deferred Channel." <br/>  The next release with new features is scheduled for September 12, 2017. <br/><br/> **Important:** You only have 3 months, instead of 4 months, to do enterprise pilots and application validation, since the next release is scheduled for September, so plan accordingly. <br/> | New features are released to Deferred Channel. <br/><br/>  This version of Deferred Channel is supported until January 2018. <br/> <br/>The next release with new features is scheduled for September 12, 2017. <br/><br/> **Important:** The next release with new features is only 3 months away, instead of 4 months, so plan accordingly. <br/> | Continue to deploy these update channels in your environment as you have been doing previously. <br/><br/>  For enterprise pilots, validate your line-of-business applications, add-ins, and macros with First Release for Deferred Channel. <br/> <br/> If you find problems with First Release for Deferred Channel, provide feedback as soon as possible to Microsoft through your [Microsoft Premier](https://go.microsoft.com/fwlink/p/?linkid=847275) agreement or your Microsoft account representative. <br/> |
|July 11, 2017  <br/> <br/>August 8, 2017  <br/> | If needed, quality updates and security updates are released to First Release for Deferred Channel. <br/> <br/> This is the regular update schedule for this update channel. <br/> | If needed, quality updates and security updates are released to Deferred Channel. <br/> <br/> This is the regular update schedule for this update channel. <br/> | Continue to update these update channels in your environment as you have been doing previously. <br/> <br/> Continue to do enterprise pilots and application validation with First Release for Deferred Channel, and provide feedback to Microsoft, as needed. <br/> |
|September 12, 2017  <br/> | The first Semi-Annual Channel (Targeted) is released. <br/> <br/> This release contains new features. <br/> <br/> Enterprise pilots and application validation should begin. <br/>  <br/>This is the first release with the new name and the new release schedule. <br/> <br/> The next release with new features is scheduled for March 13, 2018. <br/> | New features are released to Deferred Channel. <br/>  <br/>This version of Deferred Channel is supported until July 2018. <br/><br/>  This is the last release using the name "Deferred Channel." <br/>  <br/>The next release with new features is scheduled for January 9, 2018. <br/> | Continue to deploy these update channels in your environment as you have been doing previously. Even though the names and cadence are changing, how you deploy remains the same. <br/> <br/> For enterprise pilots, validate your line-of-business applications, add-ins, and macros with Semi-Annual Channel (Targeted). <br/><br/>  If you find problems with Semi-Annual Channel (Targeted), provide feedback as soon as possible to Microsoft through your [Microsoft Premier](https://go.microsoft.com/fwlink/p/?linkid=847275) agreement or your Microsoft account representative. <br/> <br/> Be sure to be aware of the new release schedule. There is no longer a release in October for Deferred Channel or for First Release for Deferred Channel. <br/> |
|January 9, 2018  <br/> || The first Semi-Annual Channel is released. <br/> <br/> This release contains new features. <br/> <br/> This version of Semi-Annual Channel is supported until March 2019. <br/> <br/> This is the first release with the new name, new release schedule, and the new support duration. <br/> <br/> The next release with new features is scheduled for July 10, 2018. <br/> | Continue to deploy this update channel in your environment as you have been doing previously. Even though the name and cadence has changed, how you deploy remains the same. <br/>  <br/>Be sure to be aware of the new release schedule. There is no longer a release in February or June for Deferred Channel or for First Release for Deferred Channel. <br/> |
|March 13, 2018  <br/> | New features are released to Semi-Annual Channel (Targeted). <br/>  <br/>Enterprise pilots and application validation should begin. <br/> <br/> The next release with new features is scheduled for September 11, 2018. <br/> || Continue to deploy this update channel in your environment as you have been doing previously. Even though the name and cadence has changed, how you deploy remains the same. <br/>  <br/>For enterprise pilots, validate your line-of-business applications, add-ins, and macros with Semi-Annual Channel (Targeted). <br/> <br/> If you find problems with Semi-Annual Channel (Targeted), provide feedback as soon as possible to Microsoft through your [Microsoft Premier](https://go.microsoft.com/fwlink/p/?linkid=847275) agreement or your Microsoft account representative. <br/> |
|July 10, 2018  <br/> || New features are released to Semi-Annual Channel. <br/>  <br/>This version of Semi-Annual Channel is supported until September 2019. <br/> <br/> The next release with new features is scheduled for January 8, 2019. <br/> | Continue to deploy this update channel in your environment as you have been doing previously. Even though the name and cadence has changed, how you deploy remains the same. <br/> |
|September 11, 2018  <br/> | New features are released to Semi-Annual Channel (Targeted). <br/><br/>  Enterprise pilots and application validation should begin. <br/>  <br/>The next release with new features is scheduled for March 12, 2019. <br/> || Continue to deploy this update channel in your environment as you have been doing previously. Even though the name and cadence has changed, how you deploy remains the same. <br/><br/>  For enterprise pilots, validate your line-of-business applications, add-ins, and macros with Semi-Annual Channel (Targeted). <br/> <br/> If you find problems with Semi-Annual Channel (Targeted), provide feedback as soon as possible to Microsoft through your [Microsoft Premier](https://go.microsoft.com/fwlink/p/?linkid=847275) agreement or your Microsoft account representative. <br/> |
   

