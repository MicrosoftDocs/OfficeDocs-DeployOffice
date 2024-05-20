---
title: "Custom reporting and database schema reference for Office Telemetry Dashboard"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: conceptual
ms.service: office-perpetual-itpro
ms.localizationpriority: medium
ms.collection: Tier2
description: "Describes how to create custom reports in Office Telemetry Dashboard, shows sample reports, and lists the tables and fields in the database."
ms.date: 05/20/2024
---

# Custom reporting and database schema reference for Office Telemetry Dashboard

***Applies to:*** *Office 2019, Office 2016*

> [!IMPORTANT]
> - Office Telemetry Dashboard is no longer supported in Microsoft 365 Apps for enterprise (as of Version 2208), and is removed in Version 2301 (and later).
> - For more information, see [Removal of Office Telemetry Dashboard from Microsoft 365 Apps for enterprise](telemetry-dashboard-removal.md).

The built-in worksheets in Office Telemetry Dashboard display lots of useful data, but sometimes you want more control over how the data is displayed. To do this, you can use the custom reporting feature in Office Telemetry Dashboard. This feature uses PivotTable reports to help give you a deeper view into how Office is being used in your organization. In this article, you can learn how to create custom reports, and you can find information about the database tables and fields that are used in custom reports.

> [!IMPORTANT]
> - Office Telemetry Dashboard is an on-premises tool that collects inventory, usage, and health data about the Office documents and solutions, such as add-ins, used in your organization. The data is primarily designed to help your organization with application compatibility testing.
> - Data collected for Office Telemetry Dashboard is stored in a SQL Server database controlled by your organization and the data collected is ***not*** sent to Microsoft. For more information, see [Data collected by the agent for Office Telemetry Dashboard](data-that-the-telemetry-agent-collects-in-office.md).
> - Data collected for Office Telemetry Dashboard is different than Office diagnostic data, which can be sent to Microsoft. For more information about Office diagnostic data, see [Overview of privacy controls for Microsoft 365 Apps](../privacy/overview-privacy-controls.md).
> - Settings used to manage Office Telemetry Dashboard have no impact on Office diagnostic data and vice versa. For more information about managing Office diagnostic data, see [Use policy settings to manage privacy controls for Microsoft 365 Apps](../privacy/manage-privacy-controls.md).
  
<a name="overview"> </a>

## Overview of custom reports in Office Telemetry Dashboard

The built-in worksheets in Office Telemetry Dashboard show you a relevant subset of the data that is collected by the agents. However, the built-in worksheets aren't customizable, and you might want to see a combined view of data that appears on different worksheets. This is where custom reporting can help you use PivotTable reports to view data in meaningful ways. 

For example, the following screenshot shows a custom report that lists the unregistered ActiveX controls that are detected on monitored clients. You can see that we've added fields to display the solution name, user name, and business group (as configured for Label 2 when the agents were deployed). This report helps us identify the solutions that use unregistered ActiveX controls and who is using them. In contrast, the **Documents** worksheet lists these solutions but doesn't have a column to indicate whether unregistered ActiveX controls are detected. You have to view the **Document sessions** worksheet for each document to see whether ActiveX controls are being used. 
  
**Custom report that shows unregistered ActiveX solutions**

:::image type="content" source="/DeployOffice/compat/media/custom-reporting-and-database-schema-reference-for-telemetry-dashboard/ork_customreport_activexreport.png" alt-text="Custom report table listing users, departments, and event ID counts for an ActiveX control issue.":::
  
> [!IMPORTANT]
> To use labels in custom reports, you have to configure them when you deploy the agents. If you haven't already done this, we recommend that you carefully plan labels that support the types of custom reporting that you'll do. For example, setting labels to identify business groups, locations, and job roles can help you find trends and issues for specific groups or types of users. [Enabling and configuring the agent](deploy-telemetry-dashboard.md#configure) will help you configure labels (known as **tags** in the Group Policy settings and registry settings for the agent). 
  
As another example, the following screenshot shows the list of Office client computers as displayed in the **Deployments** worksheet. This shows a high-level summary of Office deployments. But it doesn't give you a breakdown of how Office is deployed across business groups. 
  
**The Deployments worksheet**

:::image type="content" source="/DeployOffice/compat/media/custom-reporting-and-database-schema-reference-for-telemetry-dashboard/ork_cr_officedeployments.png" alt-text="Table showing Office deployments with counts for 32-bit, 64-bit, and ARM versions.":::
  
You can get a more detailed view of Office clients by using a custom report. In the following illustration, the Office clients are grouped by business groups (as configured for Label 2) so that you can see the breakdown of Office deployments across each group. You can also create a PivotChart to help show the data. This custom report uses a hidden table, System_details, that you have to manually add before you can add Office versions to your report. You can learn how to do this in [Hidden tables in Office Telemetry Dashboard custom reports](custom-reporting-and-database-schema-reference-for-telemetry-dashboard.md#hidden_tables).
  
**Custom report showing Office deployments by business group**

:::image type="content" source="/DeployOffice/compat/media/custom-reporting-and-database-schema-reference-for-telemetry-dashboard/ork_cr_officecustomreport.png" alt-text="Custom report table and bar chart showing the count of Office installations by department and version.":::
  
<a name="Create_customreport"> </a>

## Create custom reports in Office Telemetry Dashboard

You can create a single custom report on the **Custom report** worksheet. This automatically loads the default tables and creates a basic custom report that you can use as a starting point. Then, you can add and remove fields to design a report that meets your business needs. For performance reasons, not all tables are loaded automatically when you create a custom report. You can add tables by using the procedure in [Hidden tables in Office Telemetry Dashboard custom reports](custom-reporting-and-database-schema-reference-for-telemetry-dashboard.md#hidden_tables). The most common reason to add hidden tables is to gain access to Office builds, which are available in the **System_details** table. 
  
In this video demo, you can see custom reporting in action. We compare data that is shown in the **Solutions** worksheet to similar data that is shown in a custom report. This video will also help you learn how to add and move fields in a PivotTable report. 
  
**Custom reporting in Office Telemetry Dashboard**

> [!VIDEO https://www.microsoft.com/videoplayer/embed/ed8327e4-c063-40f5-a634-230c067d73b4?autoplay=false]

*Although this video is for an earlier version of Office, the information also applies to newer versions of Office.*
  
If you use large data sets in your custom reports, you might encounter the [2-GB memory limitation](https://go.microsoft.com/fwlink/p/?LinkID=330482) when you use the 32-bit version of Excel. There are a couple ways that you can work around this limitation: 
  
- Use the 64-bit version of Excel, which doesn't have the 2-GB memory limitation, but does have other drawbacks. See [Choose between the 64-bit or 32-bit version of Office](https://go.microsoft.com/fwlink/p/?LinkId=250955) to learn more. 
    
- Change the reporting threshold in the database to control the amount of data pulled into PowerPivot for custom reports. Learn more about this setting in [How to configure privacy and performance settings in Office Telemetry Dashboard](manage-the-privacy-of-data-monitored-by-telemetry-in-office.md#Configure).
    
To create a custom report, you have to first start Office Telemetry Dashboard. The following table describes how to start the dashboard in different versions of Windows.
  
**To start Office Telemetry Dashboard**

|**If you have this operating system**|**Follow these steps to start Office Telemetry Dashboard**|
|:-----|:-----|
|Windows 10, Windows 7, or Windows Server 2008 R2  <br/> |From the **Start** menu, choose **All Programs**, then **Microsoft Office 2016 Tools**, then **Telemetry Dashboard for Office 2016**.  <br/> |
|Windows 8.1  <br/> |On the **Start** screen, type **Telemetry Dashboard**, and then choose it from the search results.  <br/> |
|Windows Server 2012 or Windows Server 2012 R2  <br/> |Swipe in from the right edge to show the charm bar, and then choose **Search** to see all the apps that are installed on the computer. Next, choose **Telemetry Dashboard for Office 2016**.  <br/> |

For Office 2019, look for **Telemetry Dashboard for Office** under **Microsoft Office Tools**.

> [!NOTE]
> - Support for Windows 7 and Windows Server 2008 R2 ended on January 14, 2020.
> - Support for Windows 8.1 ended on January 10, 2023.
   
### To create a custom report

1. In Office Telemetry Dashboard, on the **Getting Started** worksheet, choose **Connect to Database**.
    
2. In the **Data connection settings** dialog box, type the names of the computer running SQL Server and the SQL database that you specified when you installed Office Telemetry Processor. 
    
3. In the navigation pane, choose **Custom report**.
    
4. On the **Custom report** worksheet, choose **Create custom report**.
    
To help you get started, the following tables provide procedures for creating different kinds of custom reports.
  
**Sample custom reports in Office Telemetry Dashboard**

To create a custom report that shows solution stability, do the following:
1. From the Lookup_solutions table, drag Solution name to the FILTERS well. 
2. After the Solution name field is added to the custom report, use the filter button (next to the Solution name) to choose the solution. 
3. From the Inventory table, drag Solution version to the ROWS well. 

:::image type="content" source="/DeployOffice/compat/media/custom-reporting-and-database-schema-reference-for-telemetry-dashboard/ork_cr_solutionstability.png" alt-text="PivotTable showing solution versions and the count of event IDs for a specific solution.":::

To create a custom report that shows Excel warnings, do the following: 
1. From the Lookup_issue_definitions table, drag Severity to the FILTERS well. 
2. After the Severity field is added to the custom report, use the filter button (next to Severity) to choose Warning. 
3. From the Lookup_solutions table, drag Application to the FILTERS well, and then adjust the filter to select Excel. 
4. From the Lookup_solutions table, drag File name to the ROWS well.

:::image type="content" source="/DeployOffice/compat/media/custom-reporting-and-database-schema-reference-for-telemetry-dashboard/ork_cr_excelwarnings.png" alt-text="Excel PivotTable showing the count of event IDs for files with Excel warnings.":::
   
<a name="default_tables"> </a>

## Default tables and fields in Office Telemetry Dashboard custom reports

The following tables describe the six tables and their related fields that are shown by default in the **PivotTable Fields** list when you create custom reports. 
  
**Default tables**

|**Table name**|**Description**|
|:-----|:-----|
|Events  <br/> |Contains issue events for the past three months.  <br/> |
|Inventory  <br/> |Contains unique instance data, such as load time and solution version, about the Office documents and solutions that are monitored.  <br/> |
|Lookup_computers  <br/> |Contains information about the computers that are monitored. This includes computer name, domain, hardware information, and Windows version.  <br/> |
|Lookup_issue_definitions  <br/> |Contains information about the issues that were detected, such as issue type, issue title, severity, and explanation.  <br/> |
|Lookup_solutions  <br/> |Contains information about solutions that were detected, such as solution type, name, and publisher.  <br/> |
|Lookup_users  <br/> |Contains information about the users who use monitored client computers, such as their user name, domain, and label settings.  <br/> |
   
The following table lists the fields in the **Events** table. 
  
**Fields in the Events table**

|**Field name**|**Type**|**Description**|
|:-----|:-----|:-----|
|Event ID  <br/> |Number  <br/> |The primary key for this table.  <br/> |
|Issue ID  <br/> |Number  <br/> | Connects to the **Lookup_issue_definitions** table.  <br/> <br/> You can view these definitions in the following articles:  <br/><br/> - [Compatibility issues in Office](/office/client-developer/shared/compatibility-issues-in-office) <br/> - [Troubleshooting Office files and custom solutions with the telemetry log](/office/client-developer/shared/troubleshooting-office-files-and-custom-solutions-with-the-telemetry-log) (see Table 2)  <br/> |
|Inventory ID  <br/> |String  <br/> |Connects to the **Inventory** table.  <br/> |
|Solution ID  <br/> |Number  <br/> |Connects to the **Lookup_solutions** table.  <br/> |
|User ID  <br/> |Number  <br/> |Connects to the **Lookup_users** table.  <br/> |
|Computer ID  <br/> |Number  <br/> |Connects to the **Lookup_computers** table.  <br/> |
|Event date  <br/> |Date/time  <br/> |Shows the date and time of the event.  <br/> |
|Application version (detail)  <br/> |String  <br/> |Shows the version of the Office application that triggered the event.  <br/> |
   
The following table lists the fields in the **Inventory** table. 
  
**Fields in the Inventory table**

|**Field name**|**Type**|**Description**|
|:-----|:-----|:-----|
|Inventory ID  <br/> |Strings  <br/> |The primary key for this table.  <br/> |
|Solution ID  <br/> |Numbers  <br/> |Connects to the **Lookup_solutions** table.  <br/> |
|User ID  <br/> |Numbers  <br/> |Connects to the **Lookup_users** table.  <br/> |
|Computer ID  <br/> |Numbers  <br/> |Connects to the **Lookup_computers** table.  <br/> |
|Friendly name  <br/> |Strings  <br/> |Shows the friendly name of the solution.  <br/> |
|Location  <br/> |Strings  <br/> |Shows the file location of the file.  <br/> |
|Load time (seconds)  <br/> |Numbers  <br/> |Shows the load time of the solution in seconds.  <br/> |
|Title  <br/> |Strings  <br/> |Shows the title of the document.  <br/> |
|Author  <br/> |Strings  <br/> |Shows the author of the document.  <br/> |
|CPU architecture  <br/> |Strings  <br/> |Shows the CPU architecture.  <br/> |
|Solution version  <br/> |Strings  <br/> |Shows the solution version.  <br/> |
|Load behavior  <br/> |Numbers  <br/> |Shows the load behavior of the COM add-ins as follows: <br/> <br/> **0** - Do not load automatically (Unloaded)  <br/> **1** - Do not load automatically (Loaded)  <br/> **2** - Load at startup (Unloaded)  <br/> **3** - Load at startup (Loaded)  <br/> **8** - Load on demand (Unloaded)  <br/> **9** - Load on demand (Loaded)  <br/> **16** - Load first time, and then load on demand (Loaded)  <br/> |
|File size (bytes)  <br/> |Numbers  <br/> |Shows the file size in bytes.  <br/> |
|Has VBA  <br/> |Boolean  <br/> |Shows 1 if the document has VBA.  <br/> |
|Has OLE  <br/> |Boolean  <br/> |Shows 1 if the document has OLE objects.  <br/> |
|Has external data connection  <br/> |Boolean  <br/> |Shows 1 if the document has an external data connection.  <br/> |
|Has ActiveX control  <br/> |Boolean  <br/> |Shows 1 if the document has an ActiveX control.  <br/> |
|Has assembly reference  <br/> |Boolean  <br/> |Shows 1 if the document has an assembly reference.  <br/> |
|Has XML schema  <br/> |Boolean  <br/> |Shows 1 if the document has an XML schema.  <br/> |
|Has XML expansion pack  <br/> |Boolean  <br/> |Shows 1 if the document has an XML expansion pack.  <br/> |
|Last loaded  <br/> |Date/time  <br/> |Shows the last date and time that the solution was loaded.  <br/> |
|Last scanned  <br/> |Date/time  <br/> |Shows the last date and time that the computer was scanned by the agent.  <br/> |
   
The following table shows the fields in the **Lookup_computers** table. 
  
**Fields in the Lookup_computers table**

|**Field name**|**Type**|**Description**|
|:-----|:-----|:-----|
|Computer ID  <br/> |Number  <br/> |The primary key for this table.  <br/> |
|Computer name  <br/> |String  <br/> |Shows the computer name.  <br/> |
|Computer domain  <br/> |String  <br/> |Shows the domain name that is registered for this computer.  <br/> |
|Telemetry Agent version  <br/> |String  <br/> |Shows the agent version that uploads the data to the database.  <br/> |
|Computer processor name  <br/> |String  <br/> |Shows the processor name of the computer.  <br/> |
|Number of processors (logical)  <br/> |Number  <br/> |Shows the number of logical processors in the computer.  <br/> |
|Number of processors (physical)  <br/> |Number  <br/> |Shows the number of physical processors in the computer.  <br/> |
|System type  <br/> |String  <br/> |Shows the architecture type (32-bit or 64-bit) of the computer.  <br/> |
|Computer installed memory  <br/> |Number  <br/> |Shows amount of memory (in megabytes) that is installed in this computer.  <br/> |
|Display resolution  <br/> |String  <br/> |Shows this computer's screen resolution (for example, 1280 x 780).  <br/> |
|Display resolution (width)  <br/> |Number  <br/> |Shows the screen resolution width.  <br/> |
|Display resolution (height)  <br/> |Number  <br/> |Shows the screen resolution height.  <br/> |
|Windows version  <br/> |String  <br/> |Shows the Windows version of the computer.  <br/> |
|Windows version (detail)  <br/> |String  <br/> |Shows Windows version in detail.  <br/> |
|Windows system locale  <br/> |String  <br/> |Shows the system locale setting for Windows.  <br/> |
|Windows system display language  <br/> |String  <br/> |Shows system display language for Windows.  <br/> |
|IE version  <br/> |String  <br/> |Shows the Internet Explorer version.  <br/> |
|IE version (detail)  <br/> |String  <br/> |Shows the Internet Explorer version in detail.  <br/> |
   
The following table shows the fields in the **Lookup_solutions** table. 
  
**Fields in the Lookup_solutions table**

|**Field name**|**Type**|**Description**|
|:-----|:-----|:-----|
|Solution ID  <br/> |Number  <br/> |The primary key for this table.  <br/> |
|Solution type  <br/> |String  <br/> |Shows the solution or document type.  <br/> |
|Application  <br/> |String  <br/> |Shows the application that used this solution or document.  <br/> |
|Solution name  <br/> |String  <br/> |Shows the solution name.  <br/> |
|File name  <br/> |String  <br/> |Shows the solution or document file name.  <br/> |
|ProgID  <br/> |String  <br/> |Shows the solution ProgID.  <br/> |
|Publisher  <br/> |String  <br/> |Shows the solution or document publisher name.  <br/> |
   
The following table shows the fields in the **Lookup_users** table. 
  
**Fields in the Lookup_users table**

|**Field name**|**Type**|**Description**|
|:-----|:-----|:-----|
|User ID  <br/> |Number  <br/> |The primary key for this table.  <br/> |
|User name  <br/> |String  <br/> |Shows the user name.  <br/> |
|User domain  <br/> |String  <br/> |Shows the domain name for this user.  <br/> |
|Label 1  <br/> |String  <br/> |Shows the Label 1 setting.  <br/> |
|Label 2  <br/> |String  <br/> |Shows the Label 2 setting.  <br/> |
|Label 3  <br/> |String  <br/> |Shows the Label 3 setting.  <br/> |
|Label 4  <br/> |String  <br/> |Shows the Label 4 setting.  <br/> |
   
The following table shows the fields in the **Lookup_issue_definitions** table. 
  
**Fields in the Lookup_issue_definitions table**

|**Field name**|**Type**|**Description**|
|:-----|:-----|:-----|
|Issue ID  <br/> |Number  <br/> |The primary key for this table.  <br/> |
|Severity  <br/> |String  <br/> |Shows the severity of issue.  <br/> |
|Issue type  <br/> |String  <br/> |Shows the issue type.  <br/> |
|Issue title  <br/> |String  <br/> |Shows the issue title.  <br/> |
|Explanation  <br/> |String  <br/> |Shows the issue explanation.  <br/> |
|More info  <br/> |String  <br/> |Shows the URL where you can get more information.  <br/> |
   
<a name="hidden_tables"> </a>

## Hidden tables in Office Telemetry Dashboard custom reports


Not all tables are loaded when you create a custom report. If you want to access more data for your custom report, you can load the **Usage_summary**, **Issue_summary**, and **System_details** tables. Follow these steps to add these hidden tables to Office Telemetry Dashboard. 
  
### To add hidden tables to Office Telemetry Dashboard

1. Follow the steps in [Create custom reports in Office Telemetry Dashboard](custom-reporting-and-database-schema-reference-for-telemetry-dashboard.md#Create_customreport) to start Office Telemetry Dashboard, connect to the database, and create a custom report. 
    
2. After you create the custom report, select any area in the custom report. This makes the **ANALYZE** tab available on the ribbon. 
    
3. On the **ANALYZE** tab (under **PIVOTTABLE TOOLS**) on the ribbon, in the **Data** group, select **Change Data Source**, and then select **Connection Properties**.
    
4. In the **Workbook Connections for Custom report** dialog box, select **Telemetry Dashboard - Custom report**, select **Properties**, and then select the **Definition** tab. 
    
5. In the **Command text** box, add the following text (don't delete or overwrite the existing text): ,"Usage_summary", "Issue_summary", "System_details"
    
6. Choose **OK**, and on each dialog box, select **Close**.
    
7. In the **PivotTable Fields** list, Choose **ALL**, and then scroll down to see the newly added tables for **Usage_summary**, **Issue_summary**, and **System_details**. 
    
8. Right-click each new table, and choose **Show in Active Tab**. The new tables are added to the **Active** list under **PivotTable Fields** in the right column for easier access. 
    
The following tables list the hidden tables that you have to manually add to Office Telemetry Dashboard and describe the fields in the hidden tables.
  
**Hidden tables in Office Telemetry Dashboard custom reports**

|**Table name**|**Comments**|
|:-----|:-----|
|Usage_summary  <br/> | Shows data for seven days, one month, and three months. You can use this table to create a relationship to the following tables to see more details: <br/> <br/> - **Inventory** <br/> - **Lookup_computers** <br/> - **Lookup_solutions** <br/> - **Lookup_users** <br/> |
|Issue_summary  <br/> | Shows the issues that have occurred in the last seven days, one month, and three months. You can use this table to create a relationship to following tables to see more details: <br/> <br/> - **Inventory** <br/> - **Lookup_computers** <br/> - **Lookup_issue_definitions** <br/> - **Lookup_solutions** <br/> - **Lookup_users** <br/> |
|System_details  <br/> |Shows user and computer information.  <br/> |
   
The following table describes the fields in the Usage_summary table.
  
**Fields in the Usage_summary table**

|**Field name**|**Type**|**Description**|
|:-----|:-----|:-----|
|Inventory ID  <br/> |String  <br/> |Connects to the **Inventory** table to gain access to more details in the PivotTable report.  <br/> |
|Solution ID  <br/> |Number  <br/> |Connects to the **Lookup_solutions** table to obtain more details in PivotTable report if there's no relationship between the **Inventory** and **Lookup_solutions** tables.  <br/> |
|User ID  <br/> |Number  <br/> |Connects to the **Lookup_users** table to obtain more details in the PivotTable report if there's no relationship between the **Inventory** and **Lookup_users** tables.  <br/> |
|Computer ID  <br/> |Number  <br/> |Connects to the **Lookup_computers** table to obtain more details in PivotTable report if there's no relationship between the **Inventory** and **Lookup_computers** tables.  <br/> |
|Total session (last seven days)  <br/> |Number  <br/> |Shows the total number of sessions in the last seven days.  <br/> |
|Total session (last one month)  <br/> |Number  <br/> |Shows the total number of sessions in the last one month.  <br/> |
|Total session (last three months)  <br/> |Number  <br/> |Shows the total number of sessions in the last three months.  <br/> |
|Failed session (last seven days)  <br/> |Number  <br/> |Shows the total number of sessions that had an issue in last the seven days.  <br/> |
|Failed session (last one month)  <br/> |Number  <br/> |Shows the total number of sessions that had an issue in the last one month.  <br/> |
|Failed session (last three months)  <br/> |Number  <br/> |Shows the total number of sessions that had an issue in the last three months.  <br/> |
   
The following table describes the fields in the Issue_summary table.
  
**Fields in the Issue_summary table**

|**Field name**|**Type**|**Description**|
|:-----|:-----|:-----|
|Issue ID  <br/> |Number  <br/> |Connects to the **Lookup_issue_definitions** table to obtain more details in the PivotTable report.  <br/> |
|Inventory ID  <br/> |String  <br/> |Connects to the **Inventory** table to obtain more details in the PivotTable report.  <br/> |
|Solution ID  <br/> |Number  <br/> |Connects to the **Lookup_solutions** table to obtain more details in the PivotTable report if there's no relationship between the **Inventory** and **Lookup_solutions** tables.  <br/> |
|User ID  <br/> |Number  <br/> |Connects to the **Lookup_users** table to obtain more details in the PivotTable report if there's no relationship between the **Inventory** and **Lookup_users** tables.  <br/> |
|Computer ID  <br/> |Number  <br/> |Connects to the **Lookup_computers** table to obtain more details in the PivotTable report if there's no relationship between the **Inventory** and **Lookup_computers** tables.  <br/> |
|Number of instances (last seven days)  <br/> |Number  <br/> |Shows the number of issue events in the last seven days.  <br/> |
|Number of instances (last one month)  <br/> |Number  <br/> |Shows the number of issue events in the last one month.  <br/> |
|Number of instances (last three months)  <br/> |Number  <br/> |Shows the number of issue events in the last three months.  <br/> |
   
The following table describes the fields in the System_details table.
  
**Fields in the System_details table**

|**Field name**|**Type**|**Description**|
|:-----|:-----|:-----|
|Computer name  <br/> |String  <br/> |Shows the computer name.  <br/> |
|Computer domain  <br/> |String  <br/> |Shows the domain name that is registered for this computer.  <br/> |
|User name  <br/> |String  <br/> |Shows the user name.  <br/> |
|User domain  <br/> |String  <br/> |Shows the domain name for this user.  <br/> |
|Label 1  <br/> |String  <br/> |Shows the Label 1 setting.  <br/> |
|Label 2  <br/> |String  <br/> |Shows the Label 2 setting.  <br/> |
|Label 3  <br/> |String  <br/> |Shows the Label 3 setting.  <br/> |
|Label 4  <br/> |String  <br/> |Shows the Label 4 setting.  <br/> |
|Telemetry Agent version  <br/> |String  <br/> |Shows the version of agent that collected this data.  <br/> |
|Telemetry Processor (file share)  <br/> |String  <br/> |Shows the file share for the processor that uploaded data to the database.  <br/> |
|Telemetry Processor (computer)  <br/> |String  <br/> |Shows the computer name for the processor that uploaded data to the database.  <br/> |
|Computer processor name  <br/> |String  <br/> |Shows the processor name of the computer.  <br/> |
|Number of processors (logical)  <br/> |Number  <br/> |Shows the number of logical processors in the computer.  <br/> |
|Number of processors (physical)  <br/> |Number  <br/> |Shows the number of physical processors in the computer.  <br/> |
|System type  <br/> |String  <br/> |Shows the system type of the computer.  <br/> |
|Computer installed memory  <br/> |Number  <br/> |Shows amount of memory (in megabytes) that is installed in this computer.  <br/> |
|Display resolution  <br/> |String  <br/> |Shows this computer's screen resolution (for example, 1280 x 780).  <br/> |
|Display resolution (width)  <br/> |Number  <br/> |Shows the screen resolution width.  <br/> |
|Display resolution (height)  <br/> |Number  <br/> |Shows the screen resolution height.  <br/> |
|Windows version  <br/> |String  <br/> |Shows the Windows version of the computer.  <br/> |
|Windows version (detail)  <br/> |String  <br/> |Shows Windows version details.  <br/> |
|Windows system locale  <br/> |String  <br/> |Shows the system locale setting for Windows.  <br/> |
|Windows system display language  <br/> |String  <br/> |Shows the system display language setting for Windows.  <br/> |
|IE version  <br/> |String  <br/> |Shows the Internet Explorer version.  <br/> |
|IE version (details)  <br/> |String  <br/> |Shows the Internet Explorer version in detail.  <br/> |
|Windows system local (user)  <br/> |String  <br/> |Shows the Windows system local setting (user setting).  <br/> |
|Windows display language (user)  <br/> |String  <br/> |Shows the Windows system display language (user setting).  <br/> |
|Last scanned  <br/> |Date/time  <br/> |Shows the agent scanned date/time.  <br/> |
|Office 2003  <br/> |String  <br/> |Shows Office 2003 version details, if it's installed.  <br/> |
|Office 2007  <br/> |String  <br/> |Shows Office 2007 version details, if it's installed.  <br/> |
|Office 2010  <br/> |String  <br/> |Shows Office 2010 version details, if it's installed.  <br/> |
|Office 15  <br/> |String  <br/> |Shows Office 2013 version details, if it's installed.  <br/> |
|Office 16  <br/> |String  <br/> |Shows Office 2019 or Office 2016 version details, if it's installed.  <br/> |
   
<a name="default_relationships"> </a>

## Default data relationships in Office Telemetry Dashboard custom reports

The following illustrations show the relationships between tables in the database. 
  
**Default relationships between tables in the database**

:::image type="content" source="/DeployOffice/compat/media/custom-reporting-and-database-schema-reference-for-telemetry-dashboard/ork_cr_defaultrelationships.png" alt-text="Entity relationship diagram showing events, issue definitions, solutions, users, computers, and inventory tables.":::
  
**The Usage_summary table and its relationships**

:::image type="content" source="/DeployOffice/compat/media/custom-reporting-and-database-schema-reference-for-telemetry-dashboard/ork_cr_usage_summary.png" alt-text="Entity relationship diagram with usage summary, inventory, solutions, users, and computers tables.":::
  
**The Issue_summary table and its relationships**

:::image type="content" source="/DeployOffice/compat/media/custom-reporting-and-database-schema-reference-for-telemetry-dashboard/ork_cr_issue_summary.png" alt-text="Entity relationship diagram with issue summary, inventory, solutions, users, and computers tables.":::
  
## Related articles

- [Guide to Office Telemetry Dashboard resources](compatibility-and-telemetry-in-office.md)
- [Deploy Office Telemetry Dashboard](deploy-telemetry-dashboard.md)
- [Office Telemetry Dashboard worksheets](telemetry-dashboard-worksheet-reference.md)