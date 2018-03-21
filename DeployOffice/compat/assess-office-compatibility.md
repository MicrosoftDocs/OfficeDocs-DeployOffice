---
title: "Assess Office compatibility"
ms.author: danbrown
author: DHB-MSFT
manager: laurawi
ms.date: 12/20/2016
ms.audience: ITPro
ms.topic: get-started-article
ms.service: o365-proplus-itpro
localization_priority: Normal
ms.collection: Ent_O365
ms.custom: Ent_Office_Compat
ms.assetid: b0d56d5f-f780-483e-8f95-dc7360a05208
description: "Explains how to assess compatibility between versions of Office in your deployment, and use tools like Telemetry Dashboard that help you plan for an Office deployment."
---

# Assess Office compatibility

 **Summary:** Explains how to assess compatibility between versions of Office in your deployment, and use tools like Telemetry Dashboard that help you plan for an Office deployment. 
  
 **Audience:** IT Professionals 
  
Keeping an Office deployment project on track requires two key aspects: using the right process to assess Office compatibility, and using tools that help you understand the potential risks of an Office upgrade. Office helps you do both. When you use the process described in this topic with the telemetry tools that are in Office, you can speed up your Office deployments and get users up and running on the new version of Office with minimal disruptions. In this article, you'll learn more about the compatibility process and how Office telemetry fits into this process.
  
> [!IMPORTANT]
> This article is part of [Compatibility and telemetry in Office](compatibility-and-telemetry-in-office.md). Use the roadmap as a starting point for articles, downloads, scripts, and videos that help you assess Office compatibility. > **Are you looking for compatibility information about individual Office applications?** You can find this information by searching for "Office compatibility" on [Office Support](https://support.office.com). 
  
In this article:
  
- [What is Office telemetry?](assess-office-compatibility.md#bkmk_whatisofficetelemetry)
    
- [Telemetry and the Office compatibility process](assess-office-compatibility.md#intro)
    
- [Phase 1: Discover which Office documents and solutions are being used](assess-office-compatibility.md#discover)
    
- [Phase 2: Rationalize the inventory data to identify business-critical Office documents and solutions](assess-office-compatibility.md#rationalize)
    
- [Phase 3: Validate that Office files and solutions work](assess-office-compatibility.md#validate)
    
- [Phase 4: Manage the transition to the new version of Office](assess-office-compatibility.md#manage)
    
## What is Office telemetry?
<a name="bkmk_whatisofficetelemetry"> </a>

Office telemetry is a compatibility monitoring framework introduced in Office 2013 that replaced the Office 2010 compatibility tools Office Migration Planning Manager (OMPM), Office Code Compatibility Inspector (OCCI), and Office Environment Assessment Tool (OEAT). When you use Office telemetry as part of the Office compatibility process, it helps minimize the time that you spend assessing Office compatibility. It also reduces the risks associated with an Office upgrade. 
  
Office telemetry in Office 2016 works as follows: When an Office document or solution is loaded, used, closed, or raises an error in certain Office 2016 applications, the application adds a record about the event to a local data store. Each record includes a description of the problem and a link to more information. Inventory and usage data is also tracked.
  
How does Office telemetry work in earlier versions of Office? Office telemetry is not built into Office 2003, Office 2007, and Office 2010. For those clients, you deploy an agent that collects information about the installed add-ins and the most recently used documents. You won't get application event data for these clients like you do with Office 2016 clients, but you'll get inventory and usage data that helps you discover what is being used and likely important to your business. 
  
If you have questions about how to use Telemetry Dashboard, you can read blog posts about Telemetry Dashboard in the [Office IT Pro blog](https://go.microsoft.com/fwlink/p/?LinkID=260542amp;).
  
## Telemetry and the Office compatibility process
<a name="intro"> </a>

The Office compatibility tools address common issues that can make Office deployments difficult. These tools help by speeding up deployments, reducing the unknown factors in your deployment through reporting, and lay a foundation for future Office upgrades. For the best results, use the telemetry-based compatibility infrastructure that's built into Office works with a phased approach to assess Office compatibility.
  
**Phases of the Office compatibility process**

|||
|:-----|:-----|
|![Icon for the Discover phase](../images/ORK_Compat_Discover_reverse.png)|Discover what is being used, by whom, and how often. This helps you determine what to test for compatibility with the version of Office you are upgrading. Documents and solutions that are used frequently and by multiple users are good candidates for testing.  <br/> |
|![Icon for the Rationalize phase](../images/ORK_Compat_Rationalize_reverse.png)|Partner with business groups to identify what's critical to the business. The data that you find during the discovery phase can help jumpstart and guide this discussion. The goal is to identify the business-critical documents and solutions that have to be ready on the first day of your Office deployment.  <br/> |
|![Icon for the Validate phase](../images/ORK_Compat_Validate_reverse.png)|Start a pilot deployment where users test the documents and solutions that are required to run the business by using Office. We call this user acceptance testing. Troubleshoot any issues that occur for documents and solutions that need to be ready on the first day of deployment.  <br/> |
|![Icon for the Manage phase](../images/ORK_Compat_Manage_reverse.jpg)|Deploy Office and continue to monitor your documents and solutions. Watch for trends in Office performance and behavior as updated Office solutions are deployed. Use your Help Desk resources to troubleshoot issues as they occur for non-business-critical documents and solutions.  <br/> |
   
In this article, we'll discuss each phase of the compatibility process and describe how you can use Office telemetry tools to support the process.
  
## Phase 1: Discover which Office documents and solutions are being used
<a name="discover"> </a>

Your goal for the Discover phase is to know what's being used the most and by whom. There are two approaches that you can take to start the discovery process.
  
- The preferred approach is to start to deploy Telemetry Agent to help you discover usage within monitored groups and then use those results to begin discussions with business groups.
    
- Another option is to partner with your business groups and ask them for a list of their business-critical documents and solutions. If they have a disaster recovery plan, you can likely find this list in their plan. The downside to this approach is that their lists might not be up-to-date. You should plan to use telemetry data to help refine these lists if you choose this approach.
    
Whether or not you start with a blank list, there is no avoiding working with your business groups. The telemetry tools can't tell you what's important to the business. The tools can give you some leads on what's important based on use, but only the business groups can tell you how dependent their business is on those documents and solutions. For example, if you only base your work on telemetry data, you might miss seasonally used solutions, such as year-end sales reports or annual performance review templates, or other documents that aren't being used at the time that you collect data.
  
Now it's time to start to make plans to deploy Telemetry Agent to the existing Office clients. Here are some considerations to think about before you deploy the agent. You will find requirements to deploy the agent in [Telemetry agent](deploy-telemetry-dashboard.md#agent). If you haven't yet deployed Telemetry Dashboard, you will find that information in [Deploy Telemetry Dashboard](deploy-telemetry-dashboard.md).
  
### Choose which Office client computers to monitor

We recommend that you monitor about 20% of the client computers across your organization. This sample should include representative users from every business group so that you can identify line-of-business solutions that are used within pockets of the organization. Make sure to include expert users in that sample and users who express interest in piloting Office. There might be cases in which monitoring a complete group or organizational unit (OU) is less restrictive or easier than selecting separate client computers to participate. Small organizations might also choose to monitor all client computers. 
  
### Identify privacy concerns with business group stakeholders

Some business groups, such as human resources, legal, and finance, might have concerns about exposing personal or sensitive files in the telemetry data. Telemetry Dashboard offers several ways to prevent exposing this data. For example, you can configure the Telemetry Agent to intentionally obscure file names and titles. You can also prevent data from certain applications from being reported. You can learn more about the privacy settings in [Manage the privacy of data monitored by telemetry in Office](manage-the-privacy-of-data-monitored-by-telemetry-in-office.md). Review the privacy options with the business groups and decide which kinds of Office data that you want to exclude from reporting in Telemetry Dashboard. 
  
### Decide how you want to categorize clients that are shown in Telemetry Dashboard

When you deploy Telemetry Agent to clients, you can specify up to four labels that describe the clients. These labels help you filter data in the dashboard so that you can focus on individual business groups, specific kinds of users, users in certain geographical locations, and so on. Develop this list as you work with business groups. You can learn more about how to configure labels when you [Deploy Telemetry Dashboard](deploy-telemetry-dashboard.md), in the section [Enabling and configuring the telemetry agent](deploy-telemetry-dashboard.md#configure).
  
## Phase 2: Rationalize the inventory data to identify business-critical Office documents and solutions
<a name="rationalize"> </a>

The goal of the Rationalize phase is to identify business-critical Office documents and solutions. We recommend that you collect data in Telemetry Dashboard for at least one day before you start to look for trends.
  
The sections that follow will help you interpret the data, work with business groups, and decide what to test.
  
### Gain insights from data in Telemetry Dashboard

As data starts to populate in Telemetry Dashboard, you can start to look for usage trends. Here are some tips to get you started. 
  
- Look to see whether any departments or groups are not represented but should be. For example, if there are no finance solutions being used, you might have forgotten to enable monitoring for the finance group.
    
- Look for documents and solutions that are used by more than 10% of users. These are candidates for additional evaluation.
    
- Look for documents that are used by 3 or more users. Is there a trend for co-authoring? Are these templates? You might find that fewer documents are shared than solutions.
    
- Jot down solutions that you know are very important that you will want to track in the future even if the user numbers are low.
    
- Look to see where documents were opened from. This can help you differentiate between an attachment in an email message and a frequently edited document.
    
- Look for multiple file sizes of the same solution or document. This could indicate that multiple versions are being used. These are candidates for future consolidation.
    
### Work with business groups to decide what Office documents and solutions to test

At this point, you may have already worked with business groups to identify their critical documents and solutions. Compare the list they gave you with the usage data that's shown in Telemetry Dashboard. Does the usage data support the input from the business groups? If not, could there be a seasonal explanation? For example, are some solutions used more towards the end of the fiscal year? It's worth having another conversation with business groups about any differences you find so that you can adjust your plans for user acceptance testing.
  
If you haven't worked with business groups yet, this is the time to approach them. The initial usage data can help you create a list of documents and solutions that are candidates for testing and remediation. But instead of assigning priority levels, such as high, medium, or low, it's better to rank documents and solutions by the type of testing they will undergo. Ask your business groups to assign them to one of the choices in the following table:
  
**Classifying Office documents and solutions to test**

|||
|:-----|:-----|
|Documents and solutions that IT is accountable for and must keep functioning at all costs  <br/> |**Proactive testing** <br/> These high-priority documents and solutions are tested, fixed, and ready for use on the first day of the Office deployment.  <br/> |
|Documents and solutions that IT will fix if somebody calls about them  <br/> |**Reactive testing** <br/> These solutions are fixed only when a user reports an issue to your help desk.  <br/> |
|Documents and solutions that nobody cares about  <br/> |**Don't test** <br/> |
   
When you approach business groups to classify their documents and solutions, you might meet some resistance from business groups that assign everything to the high priority list. One of our Office compatibility experts, Chris Jackson, wrote an article for TechNet Magazine that describes some costs behind Office compatibility testing. You can use this information to help justify reactive testing and ease the emotional fears that often affect Office migrations. Read more at [Microsoft Office: The Mathematics of Office Compatibility](https://go.microsoft.com/fwlink/p/?LinkId=266229).
  
## Phase 3: Validate that Office files and solutions work
<a name="validate"> </a>

After you complete the Discover and Rationalize phases, it's time to start to test the high priority documents and solutions for compatibility with Office. The goal of the Validate phase is to verify that the solutions and documents work in the environment that users need them to work in. This doesn't mean that the solution or document doesn't have bugs. It just means that the bugs don't prevent users from doing their work. 
  
Unfortunately, there is no tool that will do this work for you. You have to ask users to test the documents and solutions by doing their work in Office. We call this user acceptance testing, and it's unavoidable. The good news is that user acceptance testing is much easier now with Click-to-Run, which helps transform user acceptance testing into piloting. Encourage users to use their documents and solutions in the new version of Office, and advise them to use their earlier version of Office if they encounter issues.
  
Telemetry data is also a big help in this phase because it can tell you what is broken and how. Telemetry Dashboard shows positive and negative trends that can help you quickly see the stability of documents or solutions as they are updated. 
  
Here are some guidelines to help you plan and monitor user acceptance testing.
  
### Identify users for user acceptance testing

Owners of the business-critical documents and solutions are strong candidates for taking part in user acceptance testing. By looking at the list that you generated during discovery, each department can identify the owners. If not, telemetry data can help by showing you most active users.
  
You should also recruit technical users within each department, because they are likely to know the details of how the solution or document works. Also look for a diverse base of testers across job levels, roles, and locations.
  
### Set up an environment for user acceptance testing

One important rule of user acceptance testing is that the test environment must be as similar to the production environment as possible. There are several ways to set up a test environment. You can set up a separate organizational unit (OU) within the production domain, or set up a completely separate test environment that is identical to the production environment. You want the test environment to be easy to set up and easy for users to access. The goal is to remove barriers to testing and to minimize complaints from users who say that there is no time to test. Your organization might already have a testing environment provisioned and centrally managed. If so, use it. If you don't have a test environment already, don't set one up. Use Click-to-Run instead.
  
Click-to-Run provides all the benefits of testing in production without all the risk. Installing Office by using Click-to-Run allows users to run their earlier versions of Office alongside the current version of Office. If a problem or incompatibility arises, users can still do their work by using the earlier version of Office.
  
It is much easier to transform user acceptance testing into piloting when you use Click-to-Run. You deploy the new environment while keeping the previous one, and you can monitor the status of the Click-to-Run deployments of Office by using Telemetry Dashboard. You can see which builds are being used and the compatibility issues that are being reported. Monitoring user acceptance testing and piloting by using Telemetry Dashboard helps ease the fear of not knowing the impact of the new version. You can offer more information to business groups and Office solution owners beyond just status of the deployment.
  
> [!IMPORTANT]
> We recommend that you use side-by-side installations of Office as a temporary solution for user acceptance testing and piloting, not as a long-term solution for production environments. Plan to phase out the earlier version of Office when your production deployments begin. 
  
You can learn more about Click-to-Run in [Overview of Click-to-Run](http://technet.microsoft.com/library/cbc72706-c7b1-4080-bf2f-5d34aa67df11.aspx).
  
### Fix issues in high priority Office documents and solutions

By now you have identified the high priority documents and solutions that have to be ready on day one of deployment, and users have tested them by using Office. In addition to bug reports from users, data in Telemetry Dashboard indicates how Word, Excel, and Microsoft Outlook perform when used with your existing Office documents and solutions. As you collect information about bugs and other issues, work with in-house developers and business group managers to create remediation plans. You'll have to decide whether to retire solutions or fix them (if they were developed in-house) and work with vendors to obtain updated versions (for third-party products).
  
Both Telemetry Dashboard and Telemetry Log can help you during this process. You can monitor the health of Word, Excel, and Microsoft Outlook as you deploy incremental fixes or new versions of Office solutions. Developers can [use the Office Telemetry Log](https://go.microsoft.com/fwlink/p/?LinkId=260532) to observe the compatibility events that occur on the local computer when Word, Excel, and Microsoft Outlook are used with existing documents and solutions. 
  
Your development teams might have automated testing tools that can help with the testing process. Ensure that the tools are tuned in such a way that only issues that block deployment are flagged and fixed for readiness on the first day of deployment. It's probably not worth fixing bugs that don't affect the user's day-to-day work, at least not for day one. Those solutions can be fixed over time if it is necessary.
  
> [!NOTE]
> You may wonder whether it's a good idea to substitute vendor support statements with compatibility testing. Chris Jackson covers the cost pros and cons of researching vendor support in his article [Microsoft Office: The Mathematics of Office Compatibility](https://go.microsoft.com/fwlink/p/?LinkId=266229). 
  
## Phase 4: Manage the transition to the new version of Office
<a name="manage"> </a>

Your goals for the Manage phase are to use Telemetry Dashboard to monitor Office usage and add-ins and prepare users for the transition to Office. You can also set compatibility mode for Office to ensure that people who are still using earlier versions of Office have full editing capabilities when collaborating with users who have already transitioned to the new version of Office.
  
As you deploy Office, you'll start to see Office health and usage trends that help you unlock the value of your Office investments and give you insight for future deployments. For example, knowing what ActiveX controls are being used can help with future Windows updates. Is Excel being used not just as a spreadsheet tool, but as a front-end application that uses a data connection? How do new Office solutions affect the environment? When the time comes to do another Office deployment, you might find that you can skip the discovery process completely because you'll know exactly what's being used and what's important.
  
These sections provide more guidance about the Manage phase.
  
### Manage Office 2016 add-ins by using Telemetry Dashboard

As you monitor solutions that are used by Office, you are likely to find add-ins that are slow to load or that crash frequently. You might also find add-ins that should not be used in your organization. Group Policy settings allow you to manage these add-ins when they are used with Office. 
  
Telemetry Dashboard provides an interface for configuring these settings. On the Solutions worksheet, select the **Add-in management** link at the top of the page, which brings you to the Add-in management worksheet. On that worksheet, you can see telemetry data about each add-in and select a Group Policy setting to control each add-in. Use the instructions on the worksheet to generate a script that you can run to apply the GPO to an Active Directory organizational unit. 
  
There are individual add-in management settings for each supported Office application. They are located in the following paths:
  
- User Configuration\Administrative Templates\ _Office application name_\Miscellaneous\List of managed add-ins
    
- User Configuration\Administrative Templates\ _Office application name_\Miscellaneous\Block all unmanaged add-ins
    
### Phase out earlier versions of Office

We recommend that you run Office 2016 with an older version of Office side-by-side only as a short-term compatibility solution during pilot testing. When your pilot phase ends and your production deployments begin, we recommend that you start to remove earlier versions of Office from production computers that run Office 2016. This avoids any widespread issues that can be caused by file type associations that might break after updates or repair operations.
  
### Manage compatibility mode in Office

In Office, compatibility mode is used automatically to open documents that were created in earlier versions of Office applications. Compatibility mode blocks new or improved features in Office for that document. This ensures that users who have earlier versions of Office will still have full editing capabilities when they open the same document. Compatibility mode also preserves the layout of the document.
  
As part of your overall Office training plan, you should provide guidance to users about how compatibility mode works. For more information on administrative settings for compatibility mode, see [Manage compatibility mode for Office](manage-compatibility-mode-for-office.md). You can find end-user topics about compatibility mode by searching for "Office compatibility mode" on [support.office.com](https://support.office.com).
  
### Prepare help desk and users for change

Your Help Desk should be ramped up on Office and ready to support users. Here are some resources to help them get up to speed:
  
- [Self-paced Office training](https://go.microsoft.com/fwlink/p/?LinkId=266233)
    
- [End user training resources for Office and Office 365](http://technet.microsoft.com/library/12c9aa22-73f5-41f1-98bf-1e6351890576.aspx)
    
## See also
<a name="manage"> </a>

#### 

[Compatibility and telemetry in Office](compatibility-and-telemetry-in-office.md)
  
[Deploy Telemetry Dashboard](deploy-telemetry-dashboard.md)
  
[Manage the privacy of data monitored by telemetry in Office](manage-the-privacy-of-data-monitored-by-telemetry-in-office.md)
#### 

[Let's manage add-ins using Telemetry Dashboard](https://go.microsoft.com/fwlink/p/?LinkId=266224)

