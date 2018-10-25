---
title: "Data that the telemetry agent collects in Office"
ms.author: danbrown
author: DHB-MSFT
manager: laurawi
ms.audience: ITPro
ms.topic: reference
ms.service: o365-proplus-itpro
localization_priority: Normal
ms.collection: Ent_O365
ms.custom: Ent_Office_Compat
description: "Learn about the data that the telemetry agent collects for Office."
---

# Data that the telemetry agent collects in Office

***Applies to:*** *Office 365 ProPlus, Office 2019, and Office 2016*


> [!NOTE]
> To assess your Office compatibility, we recommend using the [Readiness Toolkit for Office add-ins and VBA](https://www.microsoft.com/en-us/download/details.aspx?id=55983). The Readiness Toolkit is a free download and can be used to identify the VBA macros and add-ins used in your organization. Also, the Excel-based readiness reports can tell you which add-ins are adopted or supported in Office 365 ProPlus and can provide suggestions on how to remediate VBA macros issues that are identified. For more information, see [Use the Readiness Toolkit to assess application compatibility for Office 365 ProPlus](../use-the-readiness-toolkit-to-assess-application-compatibility-for-office-365-pro.md).

  
The telemetry agent collects several types of telemetry data for Office as described in this article. For example, 
  
- The file names of Office files that are in the Most Recently Used list.

- The names of add-ins and solutions that interact with Office.

- System information such as user name and computer name.
    
The agent collects different kinds of information for different applications as applicable. For example, for Excel, Microsoft Outlook, PowerPoint, and Word, the agent collects data that allows you to determine:
  
- Whether the document has specific metadata for a particular file, such VBA macros, data connections, or ActiveX controls.

- Whether the document has encountered compatibility issues or critical errors while it is being used.
  
- How Office files and solutions are used on a user's computer. Data of this type that is gathered by the agent is referred to as session data. 
    
The agent doesn't collect any of the following kinds of information:
  
- The contents of files.
    
- Information about files that are not in the Most Recently Used list.
    
    
<a name="TelemetryApps"> </a>

## Office applications from which the telemetry agent collect data

The telemetry agent collects inventory-related data, hardware and software data, and user data in Office 2019, Office 2016, Office 2013, Office 2010, Office 2007, and Office 2003 for the following applications:
  
- Access
- Excel
- OneNote
- Outlook
- PowerPoint
- Project
- Publisher
- Visio
- Word
    
For Office 2019, Office 2016, and Office 2013 only, the agent collects telemetry data for the following applications:
  
- Excel
- Outlook
- PowerPoint
- Word
    
<a name="allComputers"> </a>

## Telemetry data that is collected by the agent for all computers that it monitors

The agent collects the following data for all computers that it monitors. This data includes inventory data, user data, and hardware and software data. You can find the list of Office versions and operating systems that the agent supports in [Telemetry agent](deploy-telemetry-dashboard.md#agent).
  
### Data about recently opened Office documents and templates

The agent collects the following data about recently opened Office documents and templates. This data is sorted by the worksheet where it appears in Telemetry Dashboard.
  
**Documents** worksheet: 
  
- File name
    
- File format (extension)
    
- Total users
    
- Number of Office
    
**Document details** worksheet: 
  
- User name
    
- Computer name
    
- Location
    
- Size (KB)
    
- Author
    
- Last loaded
    
- Title
    
- Office version
    
Exceptions to data collected about recently opened Office documents and templates
  
- For OneNote, Telemetry Agent collects only Notebook name and location.
    
- For Outlook, Telemetry Agent doesn't collect any inventory data of document files.
    
- For files that are stored in a network share or SharePoint site, the agent collects only the file name and location.
    
- If the list of most recently used documents is disabled on a user's computer (by Group Policy or the user disabled it by themselves), the agent doesn't collect inventory data for document files and templates.
    
### Data about recently loaded add-ins and apps for Office

The agent collects the following data about recently loaded add-ins and apps for Office. This data is sorted by the worksheet where it appears in Telemetry Dashboard.
  
**Solutions** worksheet: 
  
- Solution name
    
- Total users
    
- Number of Office users 
    
**Solution details** worksheet: 
  
- User name
    
- Computer name
    
- Solution version
    
- Architecture (CPU architectures: x86/x64/ARM)
    
- Load time
    
- Description
    
- Size (KB)
    
- Location (.dll/manifest file path)
    
### User data

The agent collects the following user data. This data appears in the **Agents** worksheet. 
  
- User name
    
- Level (Telemetry Agent status)
    
- Computer
    
- Last updated
    
- Label (1-4)
    
- Version of the agent
    
### Data about hardware and software

The agent collects the following data about hardware and software. This data is sorted by the worksheet where it appears in Telemetry Dashboard.
  
**Telemetry Processor** worksheet: 
  
- Computer name
    
- Level (telemetry processor status)
    
- Users
    
- Computers
    
- Last updated (date and time)
    
**Deployments** worksheet: 
  
- Office versions
    
- Number of 32-bit deployments
    
- Number of 64-bit deployments
    
- Number of ARM deployments
    
<a name="data2016"> </a>

## Telemetry data that is collected only for Office 2019, Office 2016, and Office 2013

In Office 2019, Office 2016, and Office 2013, the agent also collects the following telemetry data for Excel, Microsoft Outlook, PowerPoint, and Word. This data is sorted by the worksheet where it appears in Telemetry Dashboard.
  
Telemetry data is collected during application run time. If the inventory data was collected by the agent, but the application hasn't started collecting telemetry data, then some data, such as **Success (%)** and **Load time**, won't be shown in the dashboard until the user opens documents or loads solutions during application run time.
  
**Documents** worksheet: 
  
- Success (%)
    
- Sessions
    
- Critical compatibility issue or crash
    
- Informative compatibility issue or load failure
    
**Document details** worksheet: 
  
VBA, OLE, external data connection, ActiveX control, and assembly reference information are logged starting from the second time that the user opens the document. This information won't be collected if the user opens the document only one time.
  
- Last loaded date and time
    
- Has VBA? (true/false)
    
- Has OLE? (true/false)
    
- Has external data connection? (true/false)
    
- Has assembly reference? (true/false)
    
**Document sessions** worksheet: 
  
- Date and time that the critical or informative event happened
    
**Solutions** worksheet: 
  
- Success (%)
    
- Sessions
    
- Critical compatibility issue or crash
    
- Informative compatibility issue or load failure
    
- Load time (time taken to load add-ins or apps for Office)
    
**Solution issues** worksheet: 
  
- Event ID
    
- Title
    
- Explanation
    
- More info
    
- Users
    
- Sessions
    
## Related topics

- [Manage the privacy of data monitored by telemetry in Office](manage-the-privacy-of-data-monitored-by-telemetry-in-office.md)
- [Telemetry Dashboard worksheet reference](telemetry-dashboard-worksheet-reference.md)
- [Compatibility and telemetry in Office](compatibility-and-telemetry-in-office.md)

