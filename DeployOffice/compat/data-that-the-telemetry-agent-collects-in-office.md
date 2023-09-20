---
title: "Data collected by the agent for Office Telemetry Dashboard"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: conceptual
ms.service: office-perpetual-itpro
ms.localizationpriority: medium
ms.collection: Tier2
description: "Learn about the data collected by the agent for Office Telemetry Dashboard."
ms.date: 03/01/2023
---

# Data collected by the agent for Office Telemetry Dashboard

***Applies to:*** *Office 2019, Office 2016*

> [!IMPORTANT]
> - Office Telemetry Dashboard is no longer supported in Microsoft 365 Apps for enterprise (as of Version 2208), and is removed in Version 2301 (and later).
> - For more information, see [Removal of Office Telemetry Dashboard from Microsoft 365 Apps for enterprise](telemetry-dashboard-removal.md).
  
The Office Telemetry Dashboard uses an agent to collect several types of inventory, usage, and health data for installations of Office, such as the following:
  
- The file names of Office files that are in the Most Recently Used list.
- The names of add-ins and solutions that interact with Office.
- System information such as user name and computer name.
    
The agent collects different kinds of information for different applications as applicable. For example, for Excel, Outlook, PowerPoint, and Word, the agent collects data that allows you to determine:
  
- Whether the document has specific metadata for a particular file, such VBA macros, data connections, or ActiveX controls.
- Whether the document has encountered compatibility issues or critical errors while it is being used.
- How Office files and solutions are used on a user's computer. Data of this type that is gathered by the agent is referred to as session data. 
    
The agent doesn't collect any of the following kinds of information:
  
- The contents of files.
- Information about files that are not in the Most Recently Used list.
 
> [!IMPORTANT]
> - Office Telemetry Dashboard is an on-premises tool that collects inventory, usage, and health data about the Office documents and solutions, such as add-ins, used in your organization. The data is primarily designed to help your organization with application compatibility testing.
> - Data collected for Office Telemetry Dashboard is stored in a SQL Server database controlled by your organization and the data collected is ***not*** sent to Microsoft. For more information, see [Data collected by the agent for Office Telemetry Dashboard](data-that-the-telemetry-agent-collects-in-office.md).
> - Data collected for Office Telemetry Dashboard is different than Office diagnostic data, which can be sent to Microsoft. For more information about Office diagnostic data, see [Overview of privacy controls for Microsoft 365 Apps](../privacy/overview-privacy-controls.md).
> - Settings used to manage Office Telemetry Dashboard have no impact on Office diagnostic data and vice versa. For more information about managing Office diagnostic data, see [Use policy settings to manage privacy controls for Microsoft 365 Apps](../privacy/manage-privacy-controls.md).


## Office applications from which the agent collects data

The agent collects inventory-related data, hardware and software data, and user data in Office 2019, Office 2016, Office 2013, Office 2010, Office 2007, and Office 2003 for the following applications:
  
- Access
- Excel
- OneNote
- Outlook
- PowerPoint
- Project
- Publisher
- Visio
- Word

> [!NOTE]
> Office 2003, Office 2007, Office 2010, and Office 2013 are no longer supported.
    
For Office 2019, Office 2016, and Office 2013 only, the agent collects data for the following applications:
  
- Excel
- Outlook
- PowerPoint
- Word

## Data that is collected by the agent for all computers that it monitors

The agent collects the following data for all computers that it monitors. This data includes inventory data, user data, and hardware and software data. You can find the list of Office versions and operating systems that the agent supports in [Office Telemetry Dashboard agent](deploy-telemetry-dashboard.md#agent).
  
### Data about recently opened Office documents and templates

The agent collects the following data about recently opened Office documents and templates. This data is sorted by the worksheet where it appears in Office Telemetry Dashboard.
  
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
  
- For OneNote, the agent collects only Notebook name and location.
- For Outlook, the agent doesn't collect any inventory data of document files.
- For files that are stored in a network share or SharePoint site, the agent collects only the file name and location.
- If the list of most recently used documents is disabled on a user's computer (by Group Policy or the user disabled it by themselves), the agent doesn't collect inventory data for document files and templates.
    
### Data about recently loaded add-ins and apps for Office

The agent collects the following data about recently loaded add-ins and apps for Office. This data is sorted by the worksheet where it appears in Office Telemetry Dashboard.
  
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
- Level
- Computer
- Last updated
- Label (1-4)
- Version of the agent
    
### Data about hardware and software

The agent collects the following data about hardware and software. This data is sorted by the worksheet where it appears in Office Telemetry Dashboard.
  
**Telemetry Processor** worksheet:
  
- Computer name
- Level
- Users
- Computers
- Last updated (date and time)
    
**Deployments** worksheet:
  
- Office versions
- Number of 32-bit deployments
- Number of 64-bit deployments
- Number of ARM deployments
    

## Data that is collected only for Office 2019, Office 2016, and Office 2013

In Office 2019, Office 2016, and Office 2013, the agent also collects the following  data for Excel, Outlook, PowerPoint, and Word. This data is sorted by the worksheet where it appears in Office Telemetry Dashboard.
  
Data is collected during application run time. If the inventory data was collected by the agent, but the application hasn't started collecting data, then some data, such as **Success (%)** and **Load time**, won't be shown in the dashboard until the user opens documents or loads solutions during application run time.
  
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

- [Manage the privacy of data monitored by Office Telemetry Dashboard](manage-the-privacy-of-data-monitored-by-telemetry-in-office.md)
- [Office Telemetry Dashboard worksheets](telemetry-dashboard-worksheet-reference.md)
- [Guide to Office Telemetry Dashboard resources](compatibility-and-telemetry-in-office.md)

