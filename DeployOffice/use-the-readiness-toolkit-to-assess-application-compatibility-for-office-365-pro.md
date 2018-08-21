---
title: "Use the Readiness Toolkit to assess application compatibility for Office 365 ProPlus"
ms.author: danbrown
author: DHB-MSFT
manager: laurawi
ms.audience: ITPro
ms.topic: get-started-article
ms.service: o365-proplus-itpro
localization_priority: Priority
ms.collection:
- Ent_O365
- Strat_O365_ProPlus
ms.custom:
- Ent_Office_ProPlus
- Ent_Office_Compat
description: "Provides IT Pros with info on how the Readiness Toolkit for Office add-ins and VBA can identify compatibility issues and provide readiness info for moving to Office 365 ProPlus"
---


# Use the Readiness Toolkit to assess application compatibility for Office 365 ProPlus

The Readiness Toolkit for Office add-ins and VBA can help you identify compatibility issues with your Microsoft Visual Basic for Applications (VBA) macros and add-ins that you use with Office. The Readiness Toolkit includes the Readiness Report Creator, which creates an Excel report with VBA macro compatibility and add-in readiness information to help your organization assess its readiness to move to Office 365 ProPlus.
  
You can download the Readiness Toolkit for free from the [Microsoft Download Center](https://go.microsoft.com/fwlink/p/?linkid=859119). The most current version is 1.1.18122, and was released on May 3, 2018. We recommend that you always download and use the most current version. The Readiness Toolkit checks if you're using the most current version when you run a report and will prompt you to download the most current version. 
  
> [!IMPORTANT]
> The Readiness Toolkit doesn't repair or fix the code in your VBA macros. If you create an advanced report, the report does provide guidance, when available, for remediating your VBA macro code. 
  
The Readiness Report Creator can scan for VBA macros in Word, Excel, PowerPoint, Outlook, Access, Project, Visio, and Publisher files, for Office versions as far back as Office 2003. It can also scan for certain types of add-ins used with Office. Add-ins for all Office applications are identified, but it doesn't include web add-ins. For more information, see [File extensions scanned for VBA macros](use-the-readiness-toolkit-to-assess-application-compatibility-for-office-365-pro.md#BKMK_FileExt) and [Types of add-ins for which the Readiness Report Creator collects data](use-the-readiness-toolkit-to-assess-application-compatibility-for-office-365-pro.md#BKMK_AddinTypes).
  
The download is an MSI file that you can use to install the Readiness Toolkit on a user's computer. After it's installed, when you run the Readiness Report Creator, a UI wizard steps you through the process of creating a readiness report. There is also a standalone executable that can be run from the command line or used with scripts. This is useful if you need to collect readiness information from users throughout your enterprise in a more automated manner. For more information, see [Getting readiness information for multiple users in an enterprise](use-the-readiness-toolkit-to-assess-application-compatibility-for-office-365-pro.md#BKMK_Enterprise).
  
The following information is provided to help you use the Readiness Report Creator:
  
- [Creating a readiness report](use-the-readiness-toolkit-to-assess-application-compatibility-for-office-365-pro.md#BKMK_Creating), including requirements and limitations, choosing the information to base your report on, and the difference between a basic and an advanced report.
    
- [Interpreting the information in the readiness report](use-the-readiness-toolkit-to-assess-application-compatibility-for-office-365-pro.md#BKMK_Interpreting), for both VBA macros and add-in readiness.
    
- [Getting readiness information for multiple users in an enterprise](use-the-readiness-toolkit-to-assess-application-compatibility-for-office-365-pro.md#BKMK_Enterprise), and using a command-line version of the Readiness Report Creator to scan multiple computers.
 
- [Use labels to categorize and filter data in reports](#use-labels-to-categorize-and-filter-data-in-reports) to help you analyze and make decisions about your organization's readiness.

- [Manage the privacy of data collected in reports](#manage-the-privacy-of-data-collected-in-reports) to show you how to conceal senstive information about file paths and names. 

- [Collect and show add-in usage information in reports](#collect-and-show-add-in-usage-information-in-reports) to get better insights into which add-ins are used most often within your organization and by whom.
    
- [Additional information](use-the-readiness-toolkit-to-assess-application-compatibility-for-office-365-pro.md#BKMK_AddInfo), including file extensions that are scanned by the Readiness Report Creator, the types of add-ins the Readiness Report Creator collects data on, and examples of the information sent to Microsoft when creating an advanced report.
    
> [!NOTE]
> - After running the Readiness Toolkit, many enterprises find that they have fewer compatibility issues than first expected. Based on data provided by enterprises running the Readiness Toolkit, on average 6% of scanned files have macros, and of those files, 3.3% have macro issues. So that's only 0.2% files with macro compatibility issues. For Office add-ins, 75% of add-ins found are already categorized as adopted or supported.
> - If you have feedback or questions about the Readiness Toolkit, please email us at [ReadyForOffice@microsoft.com](mailto:ReadyForOffice@microsoft.com). 
  
<a name="BKMK_Creating"> </a>

## Creating a readiness report

<a name="BKMK_Requirements"> </a>

### Requirements and limitations for using the Readiness Toolkit

Before installing and using the Readiness Toolkit, you should be aware of the following requirements:
  
- Windows 7 Service Pack 1 (SP1) or later
    
- Microsoft .NET Framework 4.5.1 or later
    
- Excel 2010 or later
    
- [Microsoft Power Query for Excel add-in](https://www.microsoft.com/download/details.aspx?id=39379) (if you're not using Excel 2016)
    
- [Microsoft Access Database Engine 2010 Redistributable](https://www.microsoft.com/download/details.aspx?id=13255) (only if you're using a Click-to-Run version of Access)
    
> [!NOTE]
> We recommend using the 64-bit version of Excel, especially if you expect more than 400,000 results to appear in the readiness report. 
  
Also, there a few limitations about the Readiness Report Creator that you should know about:
  
- The Readiness Report Creator can't scan password protected files. If you try to scan one of these files, the file shows up as "Password protected" in the report.
    
- The Readiness Report Creator can't scan files that are saved in a SharePoint document library, in OneDrive, or in some other type of cloud-based storage location. If you try to scan one of these files, the file shows up as "Cloud-based" in the report.
    
- The Readiness Report Creator lists each issue with an Office document in a separate row in an Excel worksheet. Therefore, the Readiness Report Creator can only return 1,046,575 results. If you expect to exceed these limits, we recommend that you narrow the scope of your report, such as to a specific department.
    
<a name="BKMK_ChoosingInfo"> </a>

### Choosing the information to use to create your report

To create a readiness report, you first need to select what information to use to create the report. The following table lists the possible options and an explanation of each option. It also specifies which type of readiness report is created with each option.
  
|**Option**|**Explanation**|**Report created**|
|:-----|:-----|:-----|
|Most recently used Office documents and installed add-ins on this computer  <br/> |The Readiness Report Creator only scans Office documents that are in the user's list of most recently used files. This allows you to narrow the focus of the scan to documents that a user accesses on a regular basis.  <br/> <br/>In addition, the Readiness Report Creator looks for any add-ins for Office that are installed on the computer on which the Readiness Report Creator is run.  <br/> |VBA and Add-in  <br/> |
|Office documents in a local folder or network share.  <br/> |The Readiness Report Creator scans the Office documents in the folder or network share that you specify. The Readiness Report Creator automatically scans the specified location, and all the subfolders in that location.  <br/><br/> **Note:** With this option, the Readiness Report Creator doesn't look for add-ins installed on the computer on which the Readiness Report Creator is run. <br/> |VBA only  <br/> |
|Previous readiness results saved together in a local folder or network share.  <br/> |This option allows you to create a consolidated report comprised of individual readiness results from multiple standalone computers.  <br/> <br/>For example, you might want to run the Readiness Report Creator on all the computers in the Finance department, saving the results of each scan to a network share. Then, you can use this option to create a consolidated report for the Finance department.  <br/><br/> For more information, see [Getting readiness information for multiple users in an enterprise](use-the-readiness-toolkit-to-assess-application-compatibility-for-office-365-pro.md#BKMK_Enterprise).  <br/> |VBA only, or VBA and Add-in, depending on what readiness results are being used.  <br/> |
|Add-in data from Office Telemetry dashboard.  <br/> |If you're already using [Office Telemetry Dashboard](compat/plan-telemetry-dashboard-deployment.md) to assess add-in compatibility, you can use that information which you've already collected to create a readiness report. You just need to provide the Readiness Report Creator with the appropriate information to access the database for Telemetry Dashboard. <br/><br/> **Note:** With this option, the Readiness Report Creator doesn't look for VBA macros. GRANT SELECT access on the Telemetry database is required for the user to run this option. <br/> |Add-in only  <br/> |
   
<a name="BKMK_ChooseBasicAdv"> </a>

### Choosing between a basic and an advanced report

After you select what information to use to create your report and specify a location to save your report, you need to choose whether to create a basic report or an advanced report.
  
We strongly recommend that you create an advanced report because an advanced report provides additional information to help you assess the compatibility of your VBA macros and add-ins with Office 365 ProPlus. For example, in an advanced report, you get the following additional information:
  
- Remediation advice, when available, for issues found in your VBA macros. This information is shown in a separate worksheet in the report.
    
- Readiness status for add-ins. For example, the report might show that the software provider has a supported version of the add-in for Office 365 ProPlus.
    
The readiness status for add-ins is derived from telemetry-based computations as well as explicit support statements from ISVs. 
  
To provide you with the most up-to-date remediation advice and readiness status, the Readiness Report Creator contacts Microsoft when it creates the report. Some information about your VBA macros and add-ins is sent to Microsoft. For more information about what is sent, see [Examples of the information sent to Microsoft when creating an advanced report](use-the-readiness-toolkit-to-assess-application-compatibility-for-office-365-pro.md#BKMK_InfoSent).
  
 **Important:** If you're creating an advanced report, make sure the computer on which you're running the Readiness Toolkit has access to the Internet. The Readiness Toolkit calls a publicly available web-service, so the following two URLs need to be whitelisted in your firewall:
  
- https://ready.osi.office.net/orfo/api/readinesssummary
    
- https://ready.osi.office.net/orfo/api/vbareportsummary
    
<a name="BKMK_Interpreting"> </a>

## Interpreting the information in the readiness report

The Readiness Report Creator creates a readiness report as an Excel file. The readiness information available in the report depends on what information you based your report on, as well as whether you chose to create a basic or advanced report.
  
Each report starts with an Overview page, which provides high-level information about the results, and links to the reports available - [VBA](use-the-readiness-toolkit-to-assess-application-compatibility-for-office-365-pro.md#BKMK_VBAReport) or [Add-in](use-the-readiness-toolkit-to-assess-application-compatibility-for-office-365-pro.md#BKMK_AddinReport) or both.
  
<a name="BKMK_VBAReport"> </a>

### VBA readiness reports

The following table provides a list of the different tabs (worksheets) that are shown in a VBA readiness report.
  
|**Worksheet name**|**Contents**|
|:-----|:-----|
|VBA Overview  <br/> |Displays three pie charts to provide a high-level overview of the results of the scan.  <br/><br/> Each pie charts shows different information: the status of the files scanned, the readiness status for the unique macros found during the scan, and readiness status of the unique files scanned. See the tables later in this section for more information about the file status and readiness status values that appear in these pie charts.  <br/> <br/>The Readiness Toolkit creates a unique hash of the VBA macro code to identify macros that are reused in multiple files. The Readiness Toolkit does something similar to identify duplicate files. The Readiness Toolkit does this to provide you with a more realistic assessment of how many unique VBA macros and unique files need to be evaluated.  <br/> <br/>**Note:** If you plan to deploy the 64-bit version of Office 365 ProPlus, be sure that the "Include 64-bit readiness data" check box is selected and that you've refreshed the report. <br/> |
|VBA Summary  <br/> |Provides some pre-defined PivotTables to allow you to analyze the data captured from the scan.  <br/> <br/>If these PivotTables don't meet your specific needs, you can create your own based on the data on the VBA Results worksheet.  <br/> |
|VBA Results  <br/> |Provides information on each file scanned by the Readiness Report Creator. If multiple issues are found in a scanned file, there is a separate row for each issue.  <br/><br/> See the table under the "Detailed VBA information" heading at the end of this section for an explanation of the information that appears in each column.  <br/> |
|VBA Remediation  <br/> |Provides proposed changes to VBA macro code found during the scan.  <br/><br/> See the table under the "Detailed VBA information" heading at the end of this section for an explanation of the information that appears in each column.  <br/> |
|VBA References  <br/> |List references identified in code and in the VBA project. These references are generally used to call external DLLs, linked files, and ODBC connections for use by the VBA code.  <br/><br/> See the table under the "Detailed VBA information" heading at the end of this section for an explanation of the information that appears in each column.  <br/> |
   
 **File status:** The report also categorizes, by a file status, the files that were scanned. The following table lists the possible file statuses that can appear in a readiness report, and an explanation of the file status.
  
|**File status**|**Explanation**|
|:-----|:-----|
|No VBA  <br/> |The file was scanned and no VBA macro code was found.  <br/> |
|Has VBA  <br/> |The file was scanned and VBA macro code was found.  <br/> |
|Cloud-based  <br/> |The file couldn't be scanned because it is saved in a SharePoint document library, in OneDrive, or in some other type of cloud-based storage location.  <br/> |
|Password protected  <br/> |The file is password protected so it couldn't be scanned for VBA macros.  <br/> |
|Inaccessible  <br/> |The file couldn't be scanned for some reason, such as the Readiness Report Creator had insufficient permission to access the file, the file is corrupted, or the file uses a very old Office file format.  <br/> |
|Inaccessible - Driver required <br/> |The file couldn't be scanned because the required Microsoft Access Database Engine 2010 isn't installed on the computer performing the scan. <br/> |
|Locked  <br/> |The file was locked or in use when the scan was performed.  <br/> |
|Error  <br/> |The VBA code stream trying to be read during the scan wasn't in a valid format. Sometimes opening, and then saving, the file in a supported Office version will allow the Readiness Report Creator to scan the file.  <br/> |
   
 **Severity level:** The report categorizes, by a severity level, the issues found with the VBA macros to help you estimate how much effort it will take to address the issues found. If multiple issues are found with a VBA macro, the report displays the highest severity level in the pie chart.
  
The following table lists the possible severities that can appear in a readiness report, and an explanation of the severity level.
  
|**Severity**|**Explanation**|
|:-----|:-----|
|Ready to upgrade  <br/> |No issues were found in this file and it's compatible with Office 365 ProPlus.  <br/> |
|Code design awareness  <br/> |While the code will function as expected and the user isn't likely to notice any change, the feature, property, or method works differently than previously or might be deprecated in favor of a newer version.  <br/> |
|Minimal validation recommended  <br/> |No runtime or compile time errors are expected, but the API functionality may have changed in some way. It's recommended that the user runs a spot check on the file with Office 365 ProPlus to ensure it continues to function as expected. To minimize environmental issues, ideally run the spot check on the computer that the macro usually runs.  <br/> |
|Limited remediation required  <br/> |Some refactoring of code will be required. But, there is a clear replacement and so the expectation is that the work required to fix the macro is significantly reduced.  <br/> |
|Significant remediation required  <br/> |Significant code refactoring will be required to enable the code to continue to function as it did in the legacy Office version. For example, an API that has been deprecated, but no replacement function has been provided. In this case, the only option available is to recreate the functionality.  <br/> |
   
 **Detailed VBA information:** The VBA Results, VBA Remediation, and VBA References tabs in the VBA readiness report each contain similar columns of information. The following table provides a list of those columns, along with an explanation of what information is contained those columns.
  
|**Column name**|**Explanation**|**Example**|
|:-----|:-----|:-----|
|Guideline  <br/> |The guideline (rule) identified when document has been scanned.  <br/> |Program Toolbars and Menu Bars will no longer be visible in Access 2013.  <br/> |
|Severity  <br/> |Severity of issue identified.  <br/> |Significant remediation required  <br/> |
|Source Location  <br/> |Location of the file that was scanned.  <br/> |D:\\My Documents\\My Files\\  <br/> |
|Source File  <br/> |Name of the file that was scanned.  <br/> |MyFileName.xlsx  <br/> |
|Source File Hash  <br/> |Uniquely generated hash for the file.  <br/> |36426A0DCFC06F6425E205F107A5CA58  <br/> |
|Source File Extension  <br/> |Extension of the file that was scanned.  <br/> |.docm  <br/> |
|Module  <br/> |Name of the module where the code issue was identified.  <br/> |mDJSCommandBars  <br/> |
|Line #  <br/> |Line number where the code issue was identified.  <br/> |112  <br/> |
|Type  <br/> |Type of issue that has been identified.  <br/> |VBA  <br/> |
|Member  <br/> |VBA Module section name where the issue was identified (i.e. function).  <br/> |CommandBars  <br/> |
|Statement  <br/> |The section of the code where the issue was identified.  <br/> |Dim ctlName As CommandBarControl  <br/> |
|VBA Hash  <br/> |Uniquely generated hash for the VBA code.  <br/> |CC-D2-F3-9C-58-48-04-E4-16-5B-B6-44-B3-EB-EB-FE  <br/> |
|Reference  <br/> |Link to description of issue and help content (where applicable).  <br/> |[https://technet.microsoft.com/library/cc178954.aspx](https://technet.microsoft.com/library/cc178954.aspx) <br/> |
|FileStatus  <br/> |Classification of the status of the file that was processed.  <br/> |Password protected  <br/> |
|64Bit  <br/> |Specifies if the issues identified is 64-bit specific.  <br/> |Yes  <br/> |
|UserHash  <br/> |User of the file.  <br/> |Katharine Cruz  <br/> |
|DeviceName  <br/> |Name of the device where the scan was performed.  <br/> |Laptop01  <br/> |
|Original code  <br/> |VBA code found in the macro which may cause issues when moving to a 64-bit version of Office.  <br/> |Private Declare Function FindWindow Lib "user32" Alias "FindWindowA" (ByVal lpClassName As String, ByVal lpWindowName As String) As Long  <br/> |
|Proposed changes  <br/> |Suggestions on how the VBA code in the macro can be updated to work correctly with a 64-bit version of Office.<sup>1, 2</sup> <br/> |Private Declare PtrSafe Function FindWindow Lib "user32" Alias "FindWindowA" (ByVal lpClassName As String, ByVal lpWindowName As String) As LongPtr  <br/> |
|Label1 <br/>|Value of custom label, if configured. For more information, see [Use labels to categorize and filter data in reports](#use-labels-to-categorize-and-filter-data-in-reports). <br/>|North America <br/>|
|Label2 <br/>|Value of custom label, if configured. For more information, see [Use labels to categorize and filter data in reports](#use-labels-to-categorize-and-filter-data-in-reports). <br/>|San Francisco <br/>|
|Label3 <br/>|Value of custom label, if configured. For more information, see [Use labels to categorize and filter data in reports](#use-labels-to-categorize-and-filter-data-in-reports). <br/>|Finance <br/>|
|Label4 <br/>|Value of custom label, if configured. For more information, see [Use labels to categorize and filter data in reports](#use-labels-to-categorize-and-filter-data-in-reports). <br/>|Controller <br/>|
   
<sup>1</sup> For more information about writing VBA code for 64-bit versions of Office, see [64-Bit Visual Basic for Applications Overview](https://msdn.microsoft.com/vba/language-reference-vba/articles/64-bit-visual-basic-for-applications-overview ).
  
<sup>2</sup> **Important:** All proposed changes are provided as is, with no warranty or guarantee. It's important to validate that all changes work as expected when you update your VBA macro code.
  
<a name="BKMK_AddinReport"> </a>

### Add-in report

The following table provides a list of the different tabs (worksheets) that are shown in an add-in report.
  
|**Worksheet name**|**Contents**|
|:-----|:-----|
|Add-in Summary  <br/> |Provides a high-level overview of the add-ins found by the Readiness Report Creator.  <br/><br/> The data at the top of the worksheet is intended to give you a quick assessment of how many add-ins will likely be compatible with Office 365 ProPlus and how many add-ins you'll need to do more research on.  <br/> |
|Add-in Details  <br/> |Provides metadata information about the add-ins found (for example, publisher and version number), the total number of installs of each add-in, and, if an advanced report, the readiness status (for example, "Supported version available").  <br/> |
|By computer name  <br/> |Provides similar information to what's on the Add-in Details worksheet, but lists every computer that the add-in is installed on, instead of just a total number of installs for the add-in.  <br/> |
   
You can adjust what information is shown in the add-in report by selecting choices from the drop-down lists on the Add-in Summary tab, and then refreshing the report. For example, you can adjust the report to only show information about Access and Excel add-ins.
  
By default, add-ins that are shipped by Office aren't shown. If you want to see information about those add-ins, select "Yes" from the drop-down list and refresh the report. But, most enterprises won't need to worry about application compatibility of add-ins which are shipped with Office.
  
If you plan to deploy the 64-bit version of Office 365 ProPlus, be sure to select "64-bit" from the drop-down list and refresh the report. This provides 64-bit specific readiness information about the add-ins. The default selection for reports is 32-bit.
  
The following table lists the possible readiness statuses that you can see in the add-in report and an explanation of what each status means. 
  
|**Readiness status**|**Explanation**|
|:-----|:-----|
|Highly adopted  <br/> |This add-in is being widely used on Office 365 ProPlus in other organizations, and is ready for use with Office 365 ProPlus. But, the software provider doesn't officially support the add-in on Office 365 ProPlus.  <br/> |
|Adopted  <br/> |This add-in is being used on Office 365 ProPlus in other organizations, but the software provider doesn't officially support the add-in on Office 365 ProPlus.  <br/> |
|Adopted version available <br/> |A different version of this add-in is either “Adopted” or “Highly Adopted” on Office 365 ProPlus. <br/> |
|Contact software provider  <br/> |This add-in might have issues with Office 365 ProPlus. You need to decide if this add-in is business critical and then contact the software provider for guidance.  <br/> |
|Supported version available  <br/> |A supported version of this add-in for Office 365 ProPlus is available from the software provider.  <br/> |
|Unknown<sup>1,2</sup> <br/> |This add-in is unknown to Microsoft. For example, it could be a line-of-business add-in that your in-house application development team created.  <br/><br/> If you create a basic report, the readiness status for all add-ins is listed as Unknown. It's only when you create an advanced report that the Readiness Report Creator contacts Microsoft to try to get readiness status of add-ins.  <br/> |
|Insufficient data<sup>2</sup> <br/> |Microsoft has seen this add-in but not enough information has been collected to provide a readiness status for this add-in.  <br/> |
   
<sup>1</sup> Some of the add-ins that ship by default with Office are currently flagged as Unknown in an add-in readiness report. These add-ins are actually Highly Adopted and are supported by Microsoft. Here are the names of those add-ins: ActionsPane Schema for Add-Ins, Analysis ToolPak, Analysis ToolPak - VBA, Date (XML), Conversation History Add-in for Microsoft Office 2016, Euro Currency Tools, Instant Messaging Contacts (English), Measurement Converter (Measurement Converter), Microsoft Actions Pane 3, Skype Meeting Add-in for Microsoft Office 2016, Solver Add-in, Telephone Number (XML), and Time (XML).
  
<sup>2</sup> For more information, see [Possible steps to take for add-ins classified as "Unknown" or "Insufficient data"](use-the-readiness-toolkit-to-assess-application-compatibility-for-office-365-pro.md#BKMK_UnknownInsufficient).
  
 **Detailed add-in information:** The "Add-in Details" and "By computer name" tabs in the add-in report each contain similar columns of information. The following table provides a list of those columns, along with an explanation of what information is contained in those columns.
  
|**Column name**|**Explanation**|
|:-----|:-----|
|Machine name  <br/> |The name of the computer on which the add-in is installed.  <br/><br/> This column only appears on the "By computer name" tab.  <br/> |
|Add-in Name  <br/> |The name of the add-in.  <br/> |
|Add-in Publisher  <br/> |The name of the add-in's publisher.  <br/> |
|Add-in Version  <br/> |The version of the add-in.  <br/> |
|App  <br/> |The Office application that the add-in is used in. For example, Word or Excel.  <br/> |
|Total Installs  <br/> |The total numbers of installs of the add-in.  <br/><br/> This column only appears on the "Add-in Details" tab.  <br/> |
|Readiness status (32-bit)  <br/> |The readiness status for the add-in. Advanced reports only. <br/> <br/> See the table above for a list of possible readiness statuses.  <br/><br/> Note: If you chose "64-bit" from the drop-down list on the "Add-in Summary" tab, this column name displays as "(64-bit)" instead.  <br/> |
|Remarks  <br/> |Additional information, if available, about the readiness status of the add-in. Advanced reports only.  <br/> |
|More information  <br/> |Link to additional readiness information about the add-in. Advanced reports only.  <br/> |
   
<a name="BKMK_Enterprise"> </a>

## Getting readiness information for multiple users in an enterprise


It's easy enough to install and run the Readiness Report Creator on a single user's computer to create a readiness report. But what if you're in a large organization and need to create readiness reports for an entire department or branch office?
  
Along with the UI wizard version of the Readiness Report Creator, there is also a standalone executable that can be run from the command line or used with scripts. It's named ReadinessReportCreator.exe and is located in the folder where the Readiness Toolkit is installed.
  
If you have your users run the UI wizard version of the Readiness Report Creator, you end up with separate Excel files, one for each user. That makes it difficult to see readiness from a departmental or office-wide perspective. You also have to rely on the users to run the Readiness Report Creator and follow the instructions correctly. 
  
The better alternative might be to use the command line capabilities of the Readiness Report Creator and use a script to run the Readiness Report Creator to collect the information on behalf of the user. You can save the files created by the Readiness Report Creator to a network share. If you do this, make sure that the appropriate write permissions are given to the share.
  
You can see a list of the available command line options by opening a command prompt, navigating to the folder where you installed the Readiness Toolkit, and then typing the following command:
  
```
ReadinessReportCreator.exe -help
```

The command line version of the Readiness Report Creator doesn't have the all the same capabilities as the UI wizard version. You can use the command line version to scan the most recently used Office documents and installed add-ins on a computer, or Office documents in a local folder or network share.
  
The following is an example of a command line that you can run to scan for both VBA macros and add-ins, and save the results to a network share for the Finance department. Note that you have to include addinscan option as part of the command line for the add-in scan to occur.
  
```
ReadinessReportCreator.exe -mru -addinscan -output \\server01\finance -silent
```

The following is an example of a command line that you can run to scan a user's most recently used Office documents and save the results to a network share for the Finance department. This only scans for VBA macros.
  
```
ReadinessReportCreator.exe -mru -output \\server01\finance -silent
```

The following is an example of a command line that you can run to scan a folder, and all its subfolders, and save the results to a network share for the Finance department. This only scans for VBA macros.
  
```
ReadinessReportCreator.exe -p c:\officefiles\ -r -output \\server01\finance -silent
```

It's important to note that when you run the Readiness Report Creator from the command line, the Readiness Report Creator doesn't create an Excel file. Instead the Readiness Report Creator creates JSON files containing VBA macro and add-in information from the scan.
  
To create a consolidated Excel report from these various command line scans, you need to run the UI wizard version of the Readiness Report Creator. For the information source, select "Previous readiness results saved together in a local folder or network share," and then specify the location where you saved all the files for the scans. The Readiness Report Creator then consolidates the information from the JSON files into a readiness report in a single Excel file.
  
Keep in mind that the Readiness Report Creator lists each issue with an Office document in a separate row in the Excel worksheet. Therefore, the Readiness Report Creator can only return 1,046,575 results. If you expect to exceed these limits, we recommend that you narrow the scope of your report, such as to a specific department.

<a name="labels"> </a>

## Use labels to categorize and filter data in reports
You can specify up to four custom labels to categorize and filter data in reports created by the Readiness Toolkit. Labels are available in reports that are based on scans of the most recently used Office documents and installed add-ins on the user’s computer.

You can specify any string for the custom labels. For example, you can use a label to indicate the user’s department, title, or geographic location. When the Readiness Toolkit runs on the user’s computer, the custom labels are collected and are made available in the reports that are created. For example, you can filter the report to show only data from the Finance Department or only data from offices in Africa. Assign labels in a consistent manner, such as always using Label 1 for department.

You can specify these labels by using the **Specify custom labels to use with the Readiness Toolkit** Group Policy setting. You can find this policy setting under User Configuration\Policies\Administrative Templates\Microsoft Office 2016\Readiness Toolkit. Be sure to download the latest [Office 2016 Administrative Template files (ADMX/ADML)](https://go.microsoft.com/fwlink/p/?linkid=626001).

> [!NOTE]
> If you're using the Office Telemetry Dashboard and have already configured tags (labels), the Readiness Toolkit automatically collects those labels during its scan of the user's computer and will make them available in its reports. But, labels you specify for the Readiness Toolkit won't appear in the Office Telemetry Dashboard.

<a name="conceal"> </a>

## Manage the privacy of data collected in reports

It’s common for users in an organization to save Office files using file names that contain sensitive or confidential information. To protect the privacy of users and to help prevent revealing sensitive information, the Readiness Toolkit allows you to create a report that conceals the file paths and names of documents identified during a scan. You can create a report that conceals this information either by running the Readiness Report Creator from the UI wizard or from the command line. 

If you're using the UI wizard, begin by selecting either "Most recently used Office documents and installed add-ins on this computer" or "Office documents in a local folder or network share" as the type of report that you want to create. Then, on the next page of the wizard, select the **Conceal file names and paths** check box, before continuing on.

If you are using the command line to create a report, use the -ConcealNames option, as shown in the following example.

```
ReadinessReportCreator.exe -mru -addinscan -output \\server01\finance -silent -ConcealNames
```

When you create a report that conceals the file paths and names of documents, the only characters that remain are the drive letter, the first two characters of the file name, and the file extension. The other characters of the file path, up to 8 characters, and of the file name are replaced with asterisks (\*). For example, "c:\mergersinfo\Q4\companyx.docx" will appear as "c:\\\*\*\*\*\*\*\*\*\co\*\*\*\*\*\*.docx."

When the report is created, a file named file-names.log is created on the computer that ran the scan. This file contains a complete list of the file paths and names that were scanned, without any of the information concealed. The log file also includes a reference code for each file listed. This reference code appears in a column of the report that's created. This allows you to identify the specific file in the report, in case a VBA macro or add-in issue that needs further investigation is identified in the report. The file-names.log file is saved to a temp folder in the user's AppData folder. For example, for user01, the file is saved to the C:\Users\user01\AppData\Local\Readiness Toolkit Temp\\ folder. 

<a name="usage"> </a>

## Collect and show add-in usage information in reports

If you want to get better insights into which add-ins are used most often within your organization and by whom, you can use the Readiness Toolkit to gather add-in usage information and include it in a readiness report. 

To collect add-in usage information, install the most current version of the Readiness Toolkit on each computer that you want to capture add-in usage information from. To enable the agent that generates and collects the add-in usage information, you need to enable the "Allow add-in usage data to be generated and collected by the Readiness Toolkit" Group Policy setting. This policy setting is available in the most current version of the [Office 2016 Administrative Template Files (ADMX/ADML)](https://www.microsoft.com/en-us/download/details.aspx?id=49030) that are available on the Microsoft Download Center. This policy setting is found under User Configuration\Policies\Administrative Templates\Microsoft Office 2016\Readiness Toolkit.

The data generated and collected includes when the add-in is loaded and used, and if the add-in crashes. This information is stored in the registry of the computer on which the usage agent runs.

We recommend that you allow the usage agent to run for at least 30 days, to ensure you have good coverage of your users and their usage behavior. Once the monitoring period is complete, create a readiness report to collect the information and display it in a report. After you have the information you need, turn off the usage agent by changing the Group Policy setting.

> [!NOTE]
> In this release of the Readiness Toolkit, no add-in usage information is collected on computers that are running Office 2016.

<a name="silverflash"> </a>

## Detect Silverlight or Flash controls

Silverlight, Shockwave Flash, and Macromedia Flash controls are blocked from activating in Office 365 ProPlus. To identify Office files that contain these controls, you can choose to scan all documents when you create a readiness report. This will scan all Office files, even if those files don't contain macros. Because more files are scanned, report creation will take longer.


<a name="BKMK_AddInfo"> </a>

## Additional information

<a name="BKMK_FileExt"> </a>

### File extensions scanned for VBA macros

The following table lists, by application, the file extensions that are scanned when the Readiness Report Creator looks for VBA macros in Office documents.
  
|**Application**|**File extension**|
|:-----|:-----|
|Access  <br/> |accdb, accdt, mdb  <br/> |
|Excel  <br/> |xla, xlam, xls, xlsm, xlsx, xlt, xltm, xltx  <br/> |
|Outlook  <br/> |otm  <br/> |
|PowerPoint  <br/> |pot, potm, potx, ppa, ppam, pps, ppsm, ppt, pptm, pptx, sldx, sldm  <br/> |
|Project  <br/> |mpp, mpt  <br/> |
|Publisher  <br/> |pub  <br/> |
|Visio  <br/> |vsd, vsdx, vsdm  <br/> |
|Word  <br/> |doc, docm, docx, dot, dotm, dotx  <br/> |
   
<a name="BKMK_AddinTypes"> </a>

### Types of add-ins for which the Readiness Report Creator collects data

The following table lists the types of add-ins that the Readiness Report Creator collects data on. Add-ins for all Office applications are identified, but it doesn't include web add-ins. 
  
|**Add-in type**|**Office applications**|**Description**|
|:-----|:-----|:-----|
|Automation  <br/> |Excel  <br/> |Excel-supported automation add-ins are built upon COM add-ins. Functions in Automation add-ins can be called from formulas in Excel worksheets.  <br/> |
|COM  <br/> |Excel, Outlook, PowerPoint, and Word  <br/> |COM add-ins include add-ins usually written in C++ and Visual Studio Tools for Office (VSTO) developed using managed code.  <br/> |
|VBA  <br/> |Excel, PowerPoint, and Word  <br/> |VBA add-ins are application-specific files that contain VBA code. These include macro-enabled Word templates (.dotm), Excel add-ins (.xla, .xlam), and PowerPoint add-ins (.ppa, .ppam).  <br/> |
|WLL  <br/> |Word  <br/> |WLL (.wll) add-ins are specific to Word and built with any compiler that supports building DLLs.  <br/> |
|XLL  <br/> |Excel  <br/> |XLL add-ins (.xll) are specific to Excel and are built with any compiler that supports building DLLs (dynamic-link libraries). They do not have to be installed or registered. XLL add-ins also include DLLs that contain user-defined commands and functions.  <br/> |
|XLS RTD  <br/> |Excel  <br/> |XLS real-time data (RTD) add-ins are Excel worksheets that use the RealTimeData worksheet function to call an Automation server to retrieve data in real-time.  <br/> |
   
<a name="BKMK_InfoSent"> </a>

### Examples of the information sent to Microsoft when creating an advanced report

When you choose to create an [advanced report](use-the-readiness-toolkit-to-assess-application-compatibility-for-office-365-pro.md#BKMK_ChooseBasicAdv), some information is sent to Microsoft.
  
The following table provides a list of the information that is sent to Microsoft about the VBA macros that are found during a scan, along with examples.
  
|**Data**|**Description**|**Example**|
|:-----|:-----|:-----|
|DevicesScanned  <br/> |Number of devices that were scanned.  <br/> |DevicesScanned: 23  <br/> |
|UniqueUsers  <br/> |Count of users included in scan.  <br/> |UniqueUsers: 14  <br/> |
|Rule  <br/> |Count of how many times a specific rule was found to apply to the VBA macros scanned. A GUID is used to uniquely identify the rule.  <br/> |48f05b1d-c8ad-4d0c-9453-1abdf007b2db: 23 <br/> <br/> 74db65ab-76f3-43fb-997d-0d9750efb527: 2  <br/> |
|FilesWithIssues  <br/> |Count of unique files with compatibility issues.  <br/> |FilesWithIssues: 320  <br/> |
|FilesWithDuplicateVBA  <br/> |Count of unique files containing duplicate macros.  <br/> |FilesWithDuplicateVBA: 233  <br/> |
|FilesWithNoIssuesFound  <br/> |Count of unique files with no issues.  <br/> |FilesWithNoIssuesFound: 12  <br/> |
|InaccessibleFiles  <br/> |Count of unique inaccessible files.  <br/> |InaccessibleFiles: 4  <br/> |
|FilesPasswordProtected  <br/> |Count of unique files that were password protected.  <br/> |FilesPasswordProtected: 123  <br/> |
|FilesLocked  <br/> |Count of unique locked files.  <br/> |FIlesLocked: 0  <br/> |
|FilesWithVBA  <br/> |Count of unique files with VBA.  <br/> |FilesWithVBA: 122  <br/> |
|FilesWithoutVBA  <br/> |Count of unique files without VBA.  <br/> |FilesWithoutVBA: 11  <br/> |
|Significantremediationrequired  <br/> |Count of unique files that require significant remediation.  <br/> |Significantremediationrequired: 12  <br/> |
|Limitedremediationrequired  <br/> |Count of unique files that require limited remediation  <br/> |Limitedremediationrequired: 12  <br/> |
|Minimalvalidationrequired  <br/> |Count of unique files that require minimal validation.  <br/> |Minimalvalidationrequired: 22  <br/> |
|CodeDesignChanges  <br/> |Count of unique files that contain use of features that we would recommend changes.  <br/> |CodeDesignChanges: 1  <br/> |
   
The following table provides a list of the information that is sent to Microsoft about the add-ins that are found during a scan, along with examples.
  
|**Data**|**Example**|
|:-----|:-----|
|Add-in Prog ID  <br/> |UCAddin.LyncAddin.1  <br/> |
|Friendly Name  <br/> |Skype Meeting Add-in for Microsoft Office 2016(Outlook)  <br/> |
|Description  <br/> |Skype Meeting Add-in for Microsoft Office 2016  <br/> |
|File Name  <br/> |UCADDIN.DLL  <br/> |
|Add-in CLSID  <br/> |{A6A2383F-AD50-4D52-8110-3508275E77F7}  <br/> |
|Provider  <br/> |Microsoft Corporation  <br/> |
|File Timestamp  <br/> |1499940832  <br/> |
|File Version  <br/> |16.0.8326.2044  <br/> |
|Office App  <br/> |Outlook  <br/> |
|Number of Devices  <br/> |35  <br/> |
   
<a name="BKMK_MacroSettings"> </a>

### Change macro settings to view information in the readiness report

The report created by the Readiness Report Creator uses macros and active content to display the information in the report. Therefore, to see the VBA macro compatibility and the add-in readiness information in the report, you need to allow macros and active content in Excel. If macros and active content aren't enabled in Excel, you see a **Getting started** message on the **Overview** worksheet when you open the report. On that page are instructions on how to enable macros and active content. This can be as simple as clicking **Enable Content** in the Message Bar.
  
In some cases, you might not see the Message Bar and the **Enable Content** choice. This is most likely because Excel is configured to disable all macros without notification. You can check this setting by going to **File** > **Options** > **Trust Center** > **Trust Center Settings…** > **Macro Settings**. There, in the **Trust Center** dialog box, you can change the setting to **Disable all macros with notification**. After you do that, choose **OK** to save the change and close the **Trust Center** dialog box, then choose **OK** to close the **Excel Options** dialog box, and then close the report file. When you open the report file again, you should see the Message Bar and the **Enable Content** choice.
  
If the macro settings choices are grayed out in the **Trust Center** dialog box, an administrator has configured these settings by using Group Policy and the settings can't be changed manually. In this case, the simplest solution is to open the report file on a different computer where the macro settings for Excel allow you to enable macros by selecting the **Enable Content** choice in the Message Bar.
  
For more information about macro setting choices, see [Enable or disable macros in Office files](https://support.office.com/article/12b036fd-d140-4e74-b45e-16fed1a7e5c6).
  
<a name="BKMK_UnknownInsufficient"> </a>

### Possible steps to take for add-ins classified as "Unknown" or "Insufficient data"

If an add-in is classified as "Unknown" or "Insufficient data" this means that Microsoft doesn't yet have sufficient information regarding the add-in to provide a readiness status. If this is an add-in that is business critical for your organization, you can do the following:
  
- Contact the software provider who developed this add-in to see if the add-in is supported for Office 365 ProPlus. Also, you can request that your software provider list the add-in's support for Office 365 ProPlus on the [Ready for Windows](https://go.microsoft.com/fwlink/p/?linkid=860044) site. By listing the add-in, the software provider can make the add-in's support status for Office 365 ProPlus available to other enterprises.
    
- Contact us at [ReadyForOffice@microsoft.com](mailto:ReadyForOffice@microsoft.com). We'll do our best to add the readiness status of the add-in to our database. Please provide as much information about the add-in as possible including, but not limited to, the following:
    
  - Friendly name
    
  - File version
    
  - Software provider
    
  - Download link, or any details on how to download and install the add-in.
    
  - Other details, such as the type of add-in, which Office app the add-in is used with, the Prog ID, or the CLSID.
    

<a name="errorinfo"> </a>

### Information sent in an error report to Microsoft
If there is a problem showing the readiness reports, you will receive a message asking if you want to send an error report to Microsoft. For example, if there is a problem creating a graph in the report or querying the data collected.

By sending an error report to Microsoft, you can help us improve the Readiness Toolkit. The error report sent to Microsoft doesn't contain any personally identifiable information. The following table provides a list of what information is sent to Microsoft in the error report.

 
|**Data sent** |**Description**|
|---------|---------|
|Module|The VBA module where the error occurred.|
|Sub/Function name|The name of the sub procedure or function that the error occured in.|
|Line identifier|The identifier placed at the beginning of the last successfully executed line of code.|
|Error message|The user message normally output by the error. May be localized for some errors.|
|Error number|The number identifying the error.|
|Source name|The name of the object that raised the error. This is not the variable name.|
|Tool version|The version of the Readiness Toolkit that was being used.|
|Report GUID|A GUID generated for each report to help filter out repeated errors.|
|Session ID|The Session ID when the report was created to help correlate it with any errors logged by the Readiness Toolkit.|
|Excel version|The version of Excel used to view the readiness reports.|
