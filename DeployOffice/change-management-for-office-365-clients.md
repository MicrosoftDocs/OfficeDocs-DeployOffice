---
title: Change management for Office 365 clients
ms.prod: OFFICE365
ms.assetid: 9d9fc2d3-23e1-4309-8ae6-12ef5b6a8dcd
---



# Change management for Office 365 clients

> [!IMPORTANT]
> On April 20, we announced changes to better align the Office 365 ProPlus and Windows 10 update models. In that  [blog post](https://go.microsoft.com/fwlink/p/?linkid=846981), we highlighted changes to the release cadence and the support duration of feature updates for Office 365 ProPlus. As part of these changes, Office 365 ProPlus is also changing the names of its update channels. > For more information about these changes, see  [Overview of the upcoming changes to Office 365 ProPlus update management](overview-of-the-upcoming-changes-to-office-365-proplus-update-management.md). > As most of these changes take effect in September 2017, this content will be updated in the next few months. 
  
    
    

The client applications that are included with Office 365 are now being released regularly with updates that provide new features and functionality together with security and other updates. Windows 10 has also adopted the new servicing model and is also releasing new functionality regularly. As an IT Professional, you need to understand this new servicing model and how you can manage the releases while your organization takes advantage of the new functionality. 
This article gives you an overview of the new servicing model, and helps you understand the release channels and cadence, and how to effectively manage releases of the Office 365 client applications for your organization.
  
    
    

In this article:
-  [A New Update Strategy: The Servicing Model](change-management-for-office-365-clients.md#ServicingModel)
    
  
-  [Release Options](change-management-for-office-365-clients.md#Branches)
    
  
-  [Release Cadences](change-management-for-office-365-clients.md#Cadence)
    
  
-  [Types of Changes](change-management-for-office-365-clients.md#Changes)
    
  
-  [Roles and Responsibilities](change-management-for-office-365-clients.md#Roles)
    
  
-  [Manage Update Deployments](change-management-for-office-365-clients.md#Manage)
    
  
Download this information as a model poster in  [Visio](https://go.microsoft.com/fwlink/?LinkId=626680) or [PDF](https://go.microsoft.com/fwlink/?LinkId=626681) format.
  
    
    
![Servicing model poster](images/f0f92823-29ae-443e-af36-d913c6ba6486.png)
  
    
    
For an overview, watch the following video.
  
    
    
![Your browser does not support video. Install Microsoft Silverlight, Adobe Flash Player, or Internet Explorer 9.](images/MSN_Video_Widget.gif)
  
    
    

  
    
    

  
    
    

## A New Update Strategy: The Servicing Model
<a name="ServicingModel"> </a>

Both Windows 10 and Office 365 have adopted the servicing model for client updates. This means that new features, non-security updates, and security updates are released regularly, so your users can have the latest functionality and improvements. The servicing model also includes time for enterprise organizations to test and validate releases before adopting them.
  
    
    

### What is the Servicing Model?

In a traditional development model it can take months of planning, development, and testing before a large release is ready. Traditional deployments take enterprises years to plan, evaluate test, pilot, and deploy and then maintain the entire environment. 
  
    
    
The following illustration shows a traditional release model:
  
    
    

  
    
    
![Traditional release model](images/37437b6c-5325-4739-ac6a-0dca404329ca.png)
  
    
    
The following illustration shows a traditional deployment model:
  
    
    

  
    
    
![Traditional deployment model](images/45ce18de-b51b-4bda-8189-c593883ddd80.png)
  
    
    
In a servicing model, new features and innovations can be developed and released in a quick cadence, so that customers are always seeing improvements. Because development has changed, so does the deployment process for an enterprise organization. Quicker release of features mean that you can evaluate, pilot, and deploy different sets of features at the same time.
  
    
    
The following illustration shows releases in a servicing world:
  
    
    

  
    
    
![Releases in a servicing world](images/64f9e1cf-db58-43bc-945a-9dc643eb6596.png)
  
    
    
The following illustration shows deployment in a servicing world:
  
    
    

  
    
    
![Deployment in a servicing world](images/03839cb7-6e68-4697-9eb4-194c7edba3c4.png)
  
    
    

  
    
    

  
    
    

### What's in it for Enterprise Organizations?

You want up-to-date features, but you also want the control and support you need to run your business. With the variety of release programs for Windows 10 and Office 365, you can evaluate new features, pilot them with specific groups in your organization, and then deploy them widely to your organization. You can also keep specialty systems on a long-term build for control.
  
    
    
Use the update option that's right for your devices and your business needs. We recommend the following:
  
    
    

|||||
|:-----|:-----|:-----|:-----|
|**Device type** <br/> |![Phones and tablets](images/7686c89d-eff0-4ab2-8b28-5eed68967351.png)|![Laptops and desktops](images/99e17d65-144f-442b-9181-9090ec421e48.png)|![Specialty systems](images/4b7f1d61-6020-4781-b5a4-d5f87ee03bc3.png)|
|**Update option** <br/> |iOS or Android devices receive regular updates from their respective app stores. Devices running the Office Universal apps automatically receive regular updates from the Microsoft store.  <br/> For Windows 10 devices, use Current Branch to get regular updates with the latest features.  <br/> |Use Current Branch (Windows) and Current Channel (Office 365) to get regular updates with the latest features.  <br/> Have custom add-ins? Choose Current Branch for Business (Windows) and Deferred Channel (Office 365) so you have time to test.  <br/> |Use Windows 10 Long Term Servicing Branch and Office Professional Plus 2016 client installs (using MSI files) for control.  <br/> |
   

#### Focus on your business, not managing the software.

The following table explains ways you can focus on your business, not managing the software, with the Office 365 client applications.
  
    
    

|||
|:-----|:-----|
|**Stay up to date** <br/> |Regular updates mean your users' phones, tablets, and desktops stay up to date with the latest fixes.  <br/> |
|**Mix and match programs** <br/> |Follow your business needs - not all systems need to follow the same deployment model. You can even use different models for Windows and Office on the same devices.  <br/> |
|**Save on management** <br/> |Allow automatic updates to the fully tested Current Branch for Business (Windows) and Deferred Channel (Office 365) instead of managing the software packages yourself.  <br/> |
|**Stay in the loop** <br/> |See what's coming in the next releases and find out what security updates have been included by reviewing communications from Microsoft.  <br/> |
|**Manage risk** <br/> |Use Current Branch for Business (Windows) and Deferred Channel or First Release for Deferred Channel (Office 365) to test critical line-of-business applications that must remain up and running.  <br/> |
|**Save on development** <br/> |First, check the marketplace - others may have a solution that works. If you need custom development, use best practices to ensure add-ins work after updates.  <br/> |
   

## Release Options
<a name="Branches"> </a>

You need to understand the different release options for Windows 10 and the Office 365 client applications so you can choose the right options for your business. You decide what works and choose the combinations of releases to support for your organization. This section provides an overview and helps you choose.
  
    
    

### Summary of Release Options

Use the following table to choose the right release option for your business needs:
  
    
    


|**        ![Up to date innovation](images/c43eb782-f0b4-4592-a07c-4d2c01a68966.png)                               <br/> Up to date innovation**|**        ![Have time to evaluate](images/84c2cca8-ef2e-4fd9-8294-4232f3f012c9.png)                               <br/> Have time to evaluate**|**        ![Security always](images/21459b91-f971-416c-8cfe-0a85c2769520.png)                               <br/> Security, always**|
|:-----|:-----|:-----|
|Get the latest features right away. Choose Current Branch (Windows 10) and Current Channel (Office 365).  <br/> | Test with your existing systems. Choose these releases: <br/>  Windows 10: Current Branch for Business <br/>  Office 365: Deferred Channel and First Release for Deferred Channel <br/> |You'll always get the latest security updates, no waiting, whichever program you choose.  <br/> |
   

### Default channels for client applications

Office 365 includes different sets of client applications. Office 365 Business includes the core Office applications (Word, Excel, PowerPoint, Microsoft Outlook, OneNote, and Publisher), and Office 365 ProPlus includes the core applications plus Skype for Business and Access. Project Online Desktop Client and Visio Pro for Office 365 also follow this release model. 
  
    
    
The following illustration shows these sets of client applications.
  
    
    

  
    
    
![Default channels for client applications](images/bc32bed2-b7be-4652-93d0-4f0f90b97e8e.png)
  
    
    
By default, the client applications for Office 365 are set to these channel releases:
  
    
    

- **Office 365 Business, Project Online Desktop Client, and Visio Pro for Office 365** are set to use Current Channel.
    
  
- **Office 365 ProPlus** is set to use Deferred Channel.
    
  
But you can determine which channel is used for your client applications, according to your business needs.
  
    
    
For more information about the channels for Office 365 client applications, see  [Overview of update channels for Office 365 ProPlus](overview-of-update-channels-for-office-365-proplus.md).
  
    
    

### Which Release Option?

This table shows the release options for Windows 10 and Office 365 clients.
  
    
    


|**Release Options**|**Available for Office 365 client?**|**Available for Windows 10?**|
|:-----|:-----|:-----|
|**Windows Insider Preview Branch** lets you preview features and give feedback. <br/> |No  <br/> |Yes  <br/> |
|**Current Branch** gives your users the latest released features. It's great for your mobile users who bring their own devices, your sales force out in the field, and for test systems or pilot programs. <br/> |No  <br/> |Yes  <br/> |
|**Current Channel** gives your users the latest released features. It's great for your mobile users who bring their own devices, your sales force out in the field, and for test systems or pilot programs. <br/> |Yes  <br/> |No  <br/> |
|**First Release for Deferred Channel** gives you time to check out the features and test your customizations or processes. <br/> |Yes  <br/> |No  <br/> |
|**Current Branch for Business** gives you a couple of months lead-time before you get the latest version. It's best for desktops and laptops in the office. Enjoy new features, and the fact that millions of users have tested and validate them. <br/> |No  <br/> |Yes  <br/> |
|**Deferred Channel** gives you a couple of months lead-time before you get the latest version. It's best for desktops and laptops in the office. Enjoy new features, and the fact that millions of users have tested and validate them. <br/> |Yes  <br/> |No  <br/> |
|**Office Professional Plus 2016 client installs (using MSI files)** is good for scenarios where maximum control is required and the device has limited internet access. <br/> |No  <br/> |No  <br/> |
|**Long Term Servicing Branch** is best for scenarios where control over the operating system deployment is of prime importance. <br/> |No  <br/> |Yes  <br/> |
   
The release options at the top of the table provides the freshest features, those at the bottom provide the most administrative control. Freshness indicates rapid access to new features and the ability to provide feedback to Microsoft. You'll sacrifice features for extra control - use the most controlled options for specialty systems, like factory floors, air traffic control, or emergency room devices. Current Branch for Business (Windows) and Deferred Channel (Office 365) offer a balance between new features and control. 
  
    
    

## Release Cadences
<a name="Cadence"> </a>

It is important to keep both Windows and your Office clients up to date. Office 365 and Windows 10 are working to align release cadences to make this easier. Both will have regular security updates and will have new features releasing 2 or 3 times per year. There is also a long-term service branch available for Windows 10 for specialty devices.
  
    
    

### Windows 10 Release Cadence

Windows 10 has four types of release branches:
  
    
    

- **Windows Insider Preview** Join the [Windows Insider](https://insider.windows.com/) program to evaluate and provide feedback on pre-release features, and perform application compatibility validation testing. New features are released frequently.
    
  
- **Current Branch** After new features have been tested through the Windows Insider program, they are released along with bug fixes and security patches as the Current Branch. A new Current Branch is released a few times a year.
    
  
- **Current Branch for Business** The features from Current Branch are rolled into the Current Branch for Business a few times a year. Microsoft supports a Current Branch for Business release for at least 8 months.
    
  
- **Long Term Servicing Branch** This branch provides a supported OS platform for 10 years. Enterprises can choose to move to a new release or stay where they are at and skip to the next one. Long Term Servicing Branches are infrequently used for specialty devices. Use Office Professional Plus 2016 clients with these devices.
    
  
The following illustration shows the relationships between these releases for Windows 10. 
  
    
    

  
    
    
![Windows 10 release cadence](images/42471221-f1a5-4bd6-9d7e-5f24a3049330.png)
  
    
    
Read  [Windows 10 servicing options for updates and upgrades](https://go.microsoft.com/fwlink/?LinkId=626683) for more information.
  
    
    

### Office 365 Client Release Cadence

Office 365 clients have the following types of releases:
  
    
    

- **Current Channel** New features, security updates, and fixes can be released to the Current Channel every month. This is the default release schedule for Office 365 Business clients.
    
  
- **First Release for Deferred Channel** You can validate this release for four months before it becomes a Deferred Channel release. New features are included only at the beginning of a release. This channel is refreshed with non-security updates and security updates every month.
    
  
- **Deferred Channel** The First Release for Deferred Channel is rolled up and released as the Deferred Channel every 4 months. No new features are added until the next Deferred Channel, although security updates will continue to be released. Each Deferred Channel is supported for an additional 4 months, at which point users must move to the next release. This is the default release schedule for Office 365 ProPlus clients.
    
  
The following illustration shows the relationships between these releases for Office 365 ProPlus. 
  
    
    

  
    
    
![Office 365 release cadence](images/99a17880-4029-44e9-b478-be4058c30f92.png)
  
    
    

  
    
    

  
    
    

### Office Mobile Apps

Office Mobile Apps for iOS and Android have regular releases available through their respective app stores. Office Universal Apps for Windows have regular releases available through the Microsoft Store.
  
    
    

### Office Professional Plus 2016 client installs

Security updates are made available for the Office clients that you install by using .MSI files as part of the Office Volume Licensing program. New features are not delivered outside of full product releases. Recommended for devices on the Long Term Servicing Branch of Windows 10.
  
    
    

### Deployment tools

The following table lists the deployment tools that can be used for Windows 10 and the Office 365 client applications:
  
    
    


|**Tool**|**Supported for Windows 10?**|**Supported for Office 365 clients?**|
|:-----|:-----|:-----|
|Windows Update for Business  <br/> |Yes  <br/> |No  <br/> |
|Windows Server Update Services  <br/> |Yes  <br/> |No  <br/> |
|System Center Configuration Manager  <br/> |Yes  <br/> |Yes  <br/> |
|Microsoft InTune  <br/> |Yes  <br/> |Yes  <br/> |
|3rd party software deployment tools  <br/> |Yes  <br/> |Yes  <br/> |
   

## Types of Changes
<a name="Changes"> </a>

There are several types of changes that are made to Office 365 on a regular basis. The communication channels for those changes, and the actions that you might have to take for them will vary, depending on the type of change.
  
    
    
This section explains the types of changes you can expect, when to expect changes, and what you need to do to be prepared for changes in Office 365.
  
    
    

### Types of Changes for the Office 365 Service and Client Applications

Not all changes have the same impact on your users or require action. Some are planned and some unplanned by their nature (non-security updates and security updates aren't usually planned in advance). Depending on the type of change, the communication channel also varies. The following table lists the types of changes you can expect for the Office 365 service and client applications.
  
    
    


||**        ![Functionality](images/920badf4-7064-49b3-bc49-e61a033c4415.png)                               <br/> Functionality**|**        ![Non-security updates](images/88099880-fe32-4da5-9724-d9e11ff51d62.png)                               <br/> Non-security updates**|**        ![Security always](images/21459b91-f971-416c-8cfe-0a85c2769520.png)                               <br/> Security**|
|:-----|:-----|:-----|:-----|
|**Type of change** <br/> | Feature updates <br/>  New features or applications <br/>  Deprecated features <br/> | Client hotfixes for issues <br/> | Security patches <br/> |
|**Advance notice?** <br/> |30 days notice for changes that require action  <br/> |No, these are included in the monthly build for all channels  <br/> |No, these are included in the monthly build for all channels  <br/> |
|**Communication channel** <br/> | Message Center <br/>  [Office 365 Roadmap](https://go.microsoft.com/fwlink/?LinkID=529454) <br/>  [Office Blog](https://go.microsoft.com/fwlink/?LinkId=626089) <br/>  [Office 365 Network](https://go.microsoft.com/fwlink/?LinkID=525063) in Yammer <br/> | TechNet [Office 365 client update channel releases](https://go.microsoft.com/fwlink/?LinkID=626090) page <br/> | Security bulletin <br/> |
|**Requires tenant admin action?** <br/> |Sometimes  <br/> |Rarely  <br/> |Rarely  <br/> |
|**What kind of action?** <br/> | Change settings <br/>  Communicate changes to users <br/>  Validate customizations <br/> | Change admin settings <br/> ||
|**Requires testing?** <br/> |Rarely - check business critical Add-ins  <br/> |Sometimes - testing the fix against processes or customizations  <br/> |Rarely  <br/> |
|**Examples of changes** <br/> | Feature updates: PowerPoint - simpler process for embedding videos <br/>  New features or applications: Skype for Business <br/> | Hotfixes based on customer reported bugs <br/> ||
   

### Guidelines for managing change when using Office Add-ins:


- We recommend that customers use Current Channel to get the latest updates. If you have Office customizations or Add-ins deployed, you can use the Deferred Channel, which delays updates to Office until you have had the change to test and fix your customizations. To test and fix your customizations before updates are applied to Deferred Channel, use First Release for Deferred Channel. Use the Office Telemetry Dashboard to check Add-ins for compatibility. For more information, see  [Compatibility and telemetry in Office](https://go.microsoft.com/fwlink/?LinkId=626610).
    
  
- If your developers built the Office Add-in, we suggest they update the code and redeploy the custom Office Add-in.
    
  
- If you built your customization using VBA, VSTO, or COM, consider rebuilding your customization as an Office Add-in, or check the Office Store to see if there is a 3rd-party Add-in that provides similar functionality.
    
  
- Consider decommissioning Office Add-in that are no longer used or have low utilization.
    
  
More information about  [Office Add-ins](https://go.microsoft.com/fwlink/?LinkID=626869).
  
    
    

### Tips for Testing

For functionality changes, you should test against your add-ins and other customizations to see if you need to update them. Use these tips for testing:
  
    
    

- Don't wait - have a pilot team use the Current Channel builds to start evaluating new features. Use the First Release for Deferred Channel if you need a longer lead time for testing.
    
  
- Use an Azure virtual environment to test against your customizations or processes.
    
  
- Align your work with the release schedule - schedule testing passes monthly.
    
  

## Roles and Responsibilities
<a name="Roles"> </a>

Responsibility for managing change is shared between Microsoft and you as the admin of your Office 365 tenancy. The balance of responsibility is different for an online service than it is for an on-premises server or client.
  
    
    
Understand the roles both Microsoft and you need to play before, during, and after a change occurs to the service.
  
    
    
Review what's included in each release on the  [Office 365 client update channel releases](https://go.microsoft.com/fwlink/?LinkId=626090) page on TechNet.
  
    
    

### Balance of Responsibility

In a service offering, the balance of responsibility for things such as hardware maintenance and security updates shifts to the service provider (Microsoft) instead of the customer (you). However, you still need to ensure that custom software continues to function as expected when updates are rolled out.
  
    
    
For on-premises products, your organization takes on most of the responsibility for managing change.
  
    
    
Your responsibility for change management is based on the type of service. The following chart summarizes the balance of responsibility for both Microsoft and the customer for online services and on-premises software.
  
    
    


||**Office 365 service**|**Office 365 clients**|**On-premises clients and servers**|
|:-----|:-----|:-----|:-----|
|**Responsibility** <br/> |**Microsoft's** <br/> |**The Customers'** <br/> |**Microsoft's** <br/> |**The Customers'** <br/> |**Microsoft's** <br/> |**The Customers'** <br/> |
|Provide new functionality  <br/> |X  <br/> ||X  <br/> ||X  <br/> |X  <br/> |
|Test new features for quality assurance  <br/> |X  <br/> ||X  <br/> |X  <br/> |X  <br/> |X  <br/> |
|Communicate about new features  <br/> |X  <br/> |X  <br/> |X  <br/> |X  <br/> |X  <br/> |X  <br/> |
|Integrate custom software  <br/> |X  <br/> |X  <br/> |X  <br/> |X  <br/> ||X  <br/> |
|Apply security updates  <br/> |X  <br/> |||X  <br/> ||X  <br/> |
|Maintain system software  <br/> |X  <br/> |||X  <br/> ||X  <br/> |
|Maintain hardware  <br/> |X  <br/> |||X  <br/> ||X  <br/> |
   

### Microsoft's Role and Your Role

Microsoft and you both play a role in managing change for Office 365 before, during, and after a change.
  
    
    

#### Before a change

Microsoft's role
  
    
    

- Set expectations for service changes.
    
  
- Notify customers 30 days in advance for changes that require administrator action.
    
  
- Publish majority of new features and updates on the  [Office 365 Roadmap](https://go.microsoft.com/fwlink/?LinkID=529454).
    
  
Customer's role
  
    
    

- Understand what to expect for changes and communications.
    
  
- Read Message Center,  [Office 365 Roadmap](https://go.microsoft.com/fwlink/?LinkID=529454) and [Office Blog](https://go.microsoft.com/fwlink/?LinkId=626089) regularly.
    
  
- Set up pilot teams to preview new functionality using Current Channel.
    
  
- Review and update internal change management processes.
    
  
- Understand the Office 365 system requirements and check compliance.
    
  

#### During a change

Microsoft's role
  
    
    

- Roll change out to customers.
    
  
- Specifically for Office 365 clients: release a new Current Channel each month and new security and non-security updates for Deferred Channel.
    
  
- Monitor telemetry and support escalations for any unexpected issues.
    
  
Customer's role
  
    
    

- Check Message Center and review the additional information link.
    
  
- Take any action required (if applicable) and test any add-ins.
    
  
- If using an internal share for updates, download the latest builds and upload to your share.
    
  
- If a break/fix scenario is experienced, create a Support Request.
    
  

#### After a change

Microsoft's role
  
    
    

- Listen to customer feedback to improve rollout of future changes.
    
  
- Listen to feedback from the  [Office 365 Network](https://go.microsoft.com/fwlink/?LinkID=525063) in Yammer and admin feedback tool.
    
  
- Update  [Office 365 Roadmap](https://go.microsoft.com/fwlink/?LinkID=529454) statuses and add new features.
    
  
Customer's role
  
    
    

- Work with people in your organization to adopt the change (get help on the  [Office 365 Success Center](http://go.microsoft.com/fwlink/?LinkID=523734)).
    
  
- Review change management processes and bottlenecks for opportunities to streamline, and use more Microsoft resources.
    
  
- Provide general feedback in the  [Office 365 Network](https://go.microsoft.com/fwlink/?LinkID=525063) in Yammer and specific feedback in the admin feedback tool.
    
  
- Train users to provide app specific feedback using the Smile button in Office apps.
    
  

## Manage Update Deployments
<a name="Manage"> </a>

You choose when and how updates are deployed to your organization by configuring:
  
    
    

- **Which channel to use.** This controls how often updates are available.
    
  
- **Which update method to use (automatic or manual).** This controls how your client computers get the updates.
    
  

### How to Apply Updates

You can decide how updates are deployed to your users' computers. You can allow the client computers to automatically receive updates over the Internet or from an on-premises location. Alternatively, you might want to have more control by packaging the updates yourself and manually delivering them to client computers over your network.
  
    
    

#### Methods for applying Office updates to client computers

The following table explains three methods you can use to apply Office updates to client computers.
  
    
    


|**Automatic**|**Manual**|
|:-----|:-----|
|**From the Internet** <br/> |**From an on-premises location** <br/> |**From an on-premises location** <br/> |
|Microsoft makes an updated build available on the Internet. The client computers automatically install the updates when they are available.  <br/> |An administrator downloads the updated build to an on-premises location. The client computers automatically install the updates when they are available.  <br/> |An administrator downloads the updated build to an on-premises location. The administrator uses scripts or software distribution tools to push the updated build to the client computers.  <br/> |
   
The following illustration shows these methods:
  
    
    

  
    
    
![Apply Office updates to clients](images/c8774868-5fc5-4f07-890a-8ae777d5d44d.png)
  
    
    

  
    
    

  
    
    

#### Do you need to control the delivery of updates?

To decide which method to use, consider the following scenarios:
  
    
    

- Customizations
    
  - **Allow automatic updates for...**Users or computers that are primarily for productivity and don't use customizations or integrated solutions.
    
    Recommended Channel:  Current Channel
    
  
  - **Use manual delivery of updates for...**Users or computers that rely on customizations or integrated solutions that work with the Office 365 clients.
    
    Recommended Channel:  Deferred Channel. Validate by using First Release for Deferred Channel. 
    
  
- Managed or un-managed computers?
    
  - **Allow automatic updates from the Internet for...**Consumers and small businesses without an IT department.
    
  
  - **Deploy from an on-premises location when...**You want to control when updates are pushed out to your organization's computers.
    
  

### How to configure channels and update methods

Use the following methods to configure which channels are used by which client computers and how those clients computers are updated:
  
    
    

- Office Deployment Tool
    
  
- Group Policy - for centralized administration of domain-joined computers.
    
  

## See also
<a name="Manage"> </a>


#### Other Resources


  
    
    
 [Overview of update channels for Office 365 ProPlus](overview-of-update-channels-for-office-365-proplus.md)
  
    
    
 [Windows 10 servicing options for updates and upgrades](https://go.microsoft.com/fwlink/?LinkId=626683)
  
    
    
 [Microsoft cloud IT architecture resources](https://go.microsoft.com/fwlink/?LinkId=690243)
  
    
    
 [Office 365 client update channel releases](https://go.microsoft.com/fwlink/?LinkId=626090)
