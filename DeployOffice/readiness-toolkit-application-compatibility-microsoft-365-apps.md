---
title: "Use the Readiness Toolkit to assess application compatibility for Microsoft 365 Apps"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: conceptual
ms.service: o365-proplus-itpro
ms.collection: Tier2
ms.localizationpriority: medium
recommendations: false
description: "Provides IT Pros with info on how the Readiness Toolkit for Office add-ins and VBA can identify compatibility issues and provide readiness info for moving to Microsoft 365 Apps"
ms.date: 12/18/2023
---

# Use the Readiness Toolkit to assess application compatibility for Microsoft 365 Apps

> [!IMPORTANT]
> The Readiness Toolkit will be retired at the end of March 2024. If you use the Microsoft Configuration Manager (current branch), you can use the [Microsoft 365 Apps readiness dashboard](/mem/configmgr/sum/deploy-use/office-365-dashboard#bkmk_readiness-dash) to assess your add-in compatibility. For more information, see the [retirement section](#office-readiness-toolkit-retirement).

The Readiness Toolkit for Office add-ins and VBA can help you identify compatibility issues with your Microsoft Visual Basic for Applications (VBA) macros and add-ins that you use with Office. The Readiness Toolkit includes the Readiness Report Creator, which creates an Excel report with VBA macro compatibility and add-in readiness information to help your organization assess its readiness to move to Microsoft 365 Apps.

You can download the Readiness Toolkit for free from the [Microsoft Download Center](https://www.microsoft.com/download/details.aspx?id=55983). We recommend that you always download and use the most current version. The Readiness Toolkit checks if you're using the most current version when you run a report and prompts you to download the most current version. You don't have to uninstall the older version of the Readiness Toolkit before installing the most current version.

> [!IMPORTANT]
> The Readiness Toolkit doesn't repair or fix the code in your VBA macros. If you create an advanced report, the report does provide guidance, when available, for remediating your VBA macro code. 

The Readiness Report Creator scans for VBA macros across multiple Office applications. It supports Word, Excel, PowerPoint, Outlook, Access, Project, Visio, and Publisher files. This tool is compatible with Office versions starting from Office 2003. It can also scan for certain types of add-ins used with Office. Add-ins for all Office applications are identified, but it doesn't include web add-ins. For more information, see [File extensions analyzed for VBA macros](readiness-toolkit-application-compatibility-microsoft-365-apps.md#BKMK_FileExt) and [Types of add-ins for which the Readiness Report Creator collects data](readiness-toolkit-application-compatibility-microsoft-365-apps.md#BKMK_AddinTypes).

The download is an MSI file that you can use to install the Readiness Toolkit on a user's computer. After you install and run the Readiness Report Creator, the UI wizard steps you through the process of creating a readiness report. Additionally, there's a standalone executable that can be run from the command line or used with scripts. This executable is useful if you need to collect readiness information from users throughout your enterprise in a more automated manner For more information, see [Getting readiness information for multiple users in an enterprise](readiness-toolkit-application-compatibility-microsoft-365-apps.md#BKMK_Enterprise).

The following information is provided to help you use the Readiness Report Creator:

- [Create a readiness report](readiness-toolkit-application-compatibility-microsoft-365-apps.md#BKMK_Creating), including requirements and limitations, choosing the information to base your report on, and the difference between a basic and an advanced report.

- [Interpreting the information in the readiness report](readiness-toolkit-application-compatibility-microsoft-365-apps.md#BKMK_Interpreting), for both VBA macros and add-in readiness.

- [Collect readiness information for multiple users in an enterprise](readiness-toolkit-application-compatibility-microsoft-365-apps.md#BKMK_Enterprise), and using a command-line version of the Readiness Report Creator to scan multiple computers.

- [Use SQL Server to store report results](#use-sql-server-to-store-report-results) and use Power BI to analyze report results to overcome some of the limitations of using Excel, especially for reports with large quantities of data.  

- [Use labels to categorize and filter data in reports](#use-labels-to-categorize-and-filter-data-in-reports) to help you analyze and make decisions about your organization's readiness.

- [Manage the privacy of data collected in reports](#manage-the-privacy-of-data-collected-in-reports) to show you how to conceal sensitive information about file paths and names. 

- [Collect and show add-in usage information in reports](#collect-and-show-add-in-usage-information-in-reports) to get better insights into which add-ins are used most often within your organization and by whom.

- [Additional information](readiness-toolkit-application-compatibility-microsoft-365-apps.md#BKMK_AddInfo) details file extensions analyzed by the Readiness Report Creator. It also explains the types of add-ins for which the Readiness Report Creator collects data. Furthermore, it includes examples of the information sent to Microsoft when you create an advanced report.

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


> [!NOTE]
> - We recommend using the 64-bit version of Excel, especially if you expect more than 400,000 results to appear in the readiness report.
> - Windows 7 and Excel 2010 are no longer supported products.

Also, there a few limitations about the Readiness Report Creator that you should know about:

- The Readiness Report Creator can't scan password protected files. If you try to scan one of these files, the file shows up as "Password protected" in the report.

- By default, the Readiness Report Creator can't scan files that are saved in a SharePoint document library, in OneDrive, or in some other type of cloud-based storage location. If you try to scan one of these files, the file shows up as "Cloud-based" in the report. For a possible workaround, see [How to scan cloud-based files](#how-to-scan-cloud-based-files).

- The Readiness Report Creator lists each issue with an Office document in a separate row in an Excel worksheet. Therefore, the Readiness Report Creator can only return 1,046,575 results. If you expect to exceed these limits, we recommend that you narrow the scope of your report, such as to a specific department.

<a name="BKMK_ChoosingInfo"> </a>

### Choosing the information to use to create your report

To create a readiness report, you first need to select what information to use to create the report. The following table lists the possible options and an explanation of each option. It also specifies which type of readiness report is created with each option.

|**Option**|**Explanation**|**Report created**|
|:-----|:-----|:-----|
|Most recently used Office documents and installed add-ins on this computer  <br/> |The Readiness Report Creator focuses on scanning Office documents. It specifically targets documents in the user's list of most recent files. This approach ensures the scan is limited to documents that are regularly accessed.  <br/> <br/>In addition, the Readiness Report Creator looks for any add-ins for Office that are installed on the computer on which the Readiness Report Creator is run.  <br/> |VBA and Add-in  <br/> |
|Office documents in a local folder or network share.  <br/> |The Readiness Report Creator scans the Office documents in the folder or network share that you specify. The Readiness Report Creator automatically scans the specified location, and all the subfolders in that location.  <br/><br/> **Note:** With this option, the Readiness Report Creator doesn't look for add-ins installed on the computer on which the Readiness Report Creator is run. <br/> |VBA only  <br/> |
|Previous readiness results saved together in a local folder or network share.  <br/> |This option allows you to create a consolidated report comprised of individual readiness results from multiple standalone computers.  <br/> <br/>For example, you might want to run the Readiness Report Creator on all the computers in the Finance department, saving the results of each scan to a network share. Then, you can use this option to create a consolidated report for the Finance department.  <br/><br/> For more information, see [Getting readiness information for multiple users in an enterprise](readiness-toolkit-application-compatibility-microsoft-365-apps.md#BKMK_Enterprise).  <br/> |VBA only, or VBA and Add-in, depending on what readiness results are being used.  <br/> |
|Add in data from Office Telemetry Dashboard.  <br/> |If you're already using [Office Telemetry Dashboard](compat/plan-telemetry-dashboard-deployment.md) to assess add-in compatibility, you can use the information that you collected to create a readiness report. You just need to provide the Readiness Report Creator with the appropriate information to access the database for Office Telemetry Dashboard. <br/><br/> **Note:** With this option, the Readiness Report Creator doesn't look for VBA macros. GRANT SELECT access on the database is required for the user to run this option. <br/> |Add-in only  <br/> |

<a name="BKMK_ChooseBasicAdv"> </a>

### Choosing between a basic and an advanced report

Select the information you want to use for your report and specify a location to save it. Then, decide whether to create a basic report or an advanced report.

We strongly recommend that you create an advanced report because an advanced report provides additional information to help you assess the compatibility of your VBA macros and add-ins with Microsoft 365 Apps. For example, in an advanced report, you get the following additional information:

- Remediation advice, when available, for issues found in your VBA macros. This information is shown in a separate worksheet in the report.

- Readiness status for add-ins. For example, the report might show that the software provider has a supported version of the add-in for Microsoft 365 Apps.

The readiness status for add-ins is derived from telemetry-based computations and explicit support statements from ISVs. 

To provide you with the most up-to-date remediation advice and readiness status, the Readiness Report Creator contacts Microsoft when it creates the report. Some information about your VBA macros and add-ins is sent to Microsoft. For more information about what is sent, see [Examples of the information sent to Microsoft when creating an advanced report](readiness-toolkit-application-compatibility-microsoft-365-apps.md#BKMK_InfoSent).

 **Important:** If you're creating an advanced report, make sure the computer on which you're running the Readiness Toolkit has access to the internet. Since the Readiness Toolkit uses a publicly available web-service, your firewall must allow the following URLs:

- `https://officeclient.microsoft.com/serverconfig16`

- `https://ready.osi.office.net/orfo/api/readinesssummary`

- `https://ready.osi.office.net/orfo/api/vbareportsummary`

<a name="BKMK_Interpreting"> </a>

## Interpreting the information in the readiness report

The Readiness Report Creator creates a readiness report as an Excel file. The readiness information available in the report depends on what information you based your report on, and whether you chose to create a basic or advanced report.

Each report starts with an Overview page, which provides high-level information about the results, and links to the reports available - [VBA](readiness-toolkit-application-compatibility-microsoft-365-apps.md#BKMK_VBAReport) or [Add-in](readiness-toolkit-application-compatibility-microsoft-365-apps.md#BKMK_AddinReport) or both.

<a name="BKMK_VBAReport"> </a>

### VBA readiness reports

The following table provides a list of the different tabs (worksheets) that are shown in a VBA readiness report.

|**Worksheet name**|**Contents**|
|:-----|:-----|
|VBA Overview  <br/> |Displays three pie charts to provide a high-level overview of the results of the scan.  <br/><br/> Each pie chart shows different information: the status of the files scanned, the readiness status for the unique macros found during the scan, and readiness status of the unique files scanned. For more information about the file status and readiness status values that appear in these pie charts, see the tables later in this section.  <br/> <br/>The Readiness Toolkit creates a unique hash of the VBA macro code to identify macros that are reused in multiple files. Similarly, the Toolkit identifies duplicate files by using a comparable method. This process helps provide a more realistic assessment of the number of unique VBA macros and files that need evaluation.  <br/> <br/>**Note:** If you plan to deploy the 64-bit version of Microsoft 365 Apps, be sure that the "Include 64-bit readiness data" check box is selected and that you refresh the report. <br/> |
|VBA Summary  <br/> |Provides some predefined PivotTables to allow you to analyze the data captured from the scan.  <br/> <br/>If these PivotTables don't meet your specific needs, you can create your own based on the data on the VBA Results worksheet.  <br/> |
|VBA Results  <br/> |Provides information on each file scanned by the Readiness Report Creator. If multiple issues are found in a scanned file, there's a separate row for each issue.  <br/><br/> See the table under the "Detailed VBA information" heading at the end of this section for an explanation of the information that appears in each column.  <br/> |
|VBA Remediation  <br/> |Provides proposed changes to VBA macro code found during the scan.  <br/><br/> See the table under the "Detailed VBA information" heading at the end of this section for an explanation of the information that appears in each column.  <br/> |
|VBA References  <br/> |List references identified in code and in the VBA project. These references are used to call external DLLs, linked files, and ODBC connections for use by the VBA code.  <br/><br/> See the table under the "Detailed VBA information" heading at the end of this section for an explanation of the information that appears in each column.  <br/> |

 **File status:** The report also categorizes, by a file status, the files that were scanned. The following table lists the possible file statuses that can appear in a readiness report, and an explanation of the file status.

|**File status**|**Explanation**|
|:-----|:-----|
|No VBA  <br/> |The file was scanned and no VBA macro code was found.  <br/> |
|Has VBA  <br/> |The file was scanned and VBA macro code was found.  <br/> |
|Cloud-based  <br/> |The file couldn't be scanned because it's in a SharePoint document library, in OneDrive, or in some other type of cloud-based storage location.  <br/> |
|Password protected  <br/> |The file is password protected so it couldn't be scanned for VBA macros.  <br/> |
|Inaccessible  <br/> |The file couldn't be scanned for some reason, such as the Readiness Report Creator had insufficient permission to access the file, the file is corrupted, or the file uses an old Office file format.  <br/> |
|Inaccessible - Driver required <br/> |The file couldn't be scanned because the required Microsoft Access Database Engine 2010 isn't installed on the computer performing the scan. <br/> |
|Locked  <br/> |The file was locked or in use when the scan was performed.  <br/> |
|Error  <br/> |The VBA code stream trying to be read during the scan wasn't in a valid format. Sometimes opening, and then saving, the file in a supported Office version allows the Readiness Report Creator to scan the file.  <br/> |

 **Severity level:** The report categorizes, by a severity level, the issues found with the VBA macros to help you estimate how much effort it takes to address the issues found. If multiple issues are found with a VBA macro, the report displays the highest severity level in the pie chart.

The following table lists the possible severities that can appear in a readiness report, and an explanation of the severity level.

|**Severity**|**Explanation**|
|:-----|:-----|
|Ready to upgrade  <br/> |No issues were found in this file and it's compatible with Microsoft 365 Apps.  <br/> |
|Code design awareness  <br/> |The code functions as expected, and the user didn't notice any change. However, the feature, property, or method operates differently than before, or it might be deprecated in favor of a newer version.  <br/> |
|Minimal validation recommended  <br/> |No runtime or compile time errors are expected, but the API functionality could change in some way. The user should run a spot check on the file with Microsoft 365 Apps to ensure it continues to function as expected. To minimize environmental issues, ideally run the spot check on the computer that the macro usually runs.  <br/> |
|Limited remediation required  <br/> |Some refactoring of code is required. But, there's a clear replacement and so the expectation is that the work required to fix the macro is reduced.  <br/> |
|Significant remediation required  <br/> |Significant code refactoring is required to enable the code to continue to function as it did in the legacy Office version. For example, an API that was deprecated, but no replacement function was provided. In this case, the only option available is to recreate the functionality.  <br/> |

 **Detailed VBA information:** The VBA Results, VBA Remediation, and VBA References tabs in the VBA readiness report each contain similar columns of information. The following table provides a list of those columns, along with an explanation of what information is contained those columns.

|**Column name**|**Explanation**|**Example**|
|:-----|:-----|:-----|
|Guideline  <br/> |The guideline (rule) identified when document was scanned.  <br/> |Program Toolbars and Menu Bars are no longer visible in Access 2013.  <br/> |
|Severity  <br/> |Severity of issue identified.  <br/> |Significant remediation required  <br/> |
|Source Location  <br/> |Location of the file that was scanned.  <br/> |D:\\My Documents\\My Files\\  <br/> |
|Source File  <br/> |Name of the file that was scanned.  <br/> |MyFileName.xlsx  <br/> |
|Source File Hash  <br/> |Uniquely generated hash for the file.  <br/> |36426A0DCFC06F6425E205F107A5CA58  <br/> |
|Source File Extension  <br/> |Extension of the file that was scanned.  <br/> |.docm  <br/> |
|Module  <br/> |Name of the module where the code issue was identified.  <br/> |mDJSCommandBars  <br/> |
|Line #  <br/> |Line number where the code issue was identified.  <br/> |112  <br/> |
|Type  <br/> |Type of issue that was identified.  <br/> |VBA  <br/> |
|Member  <br/> |VBA Module section name where the issue was identified (that is, function).  <br/> |CommandBars  <br/> |
|Statement  <br/> |The section of the code where the issue was identified.  <br/> |Dim ctlName As CommandBarControl  <br/> |
|VBA Hash  <br/> |Uniquely generated hash for the VBA code.  <br/> |CC-D2-F3-9C-58-48-04-E4-16-5B-B6-44-B3-EB-EB-FE  <br/> |
|Reference  <br/> |Link to description of issue and help content (where applicable).  <br/> |[https://technet.microsoft.com/library/cc178954.aspx](/previous-versions/office/office-2013-resource-kit/cc178954(v=office.15)) <br/> |
|FileStatus  <br/> |Classification of the status of the file that was processed.  <br/> |Password protected  <br/> |
|64-bit  <br/> |Specifies if the issue identified is 64-bit specific.  <br/> |Yes  <br/> |
|UserHash  <br/> |User of the file.  <br/> |Katharine Cruz  <br/> |
|DeviceName  <br/> |Name of the computer where the scan was performed.  <br/> |Laptop01  <br/> |
|Original code  <br/> |VBA code found in the macro, which could cause issues when moving to a 64-bit version of Office.  <br/> |Private Declare Function FindWindow Lib "user32" Alias "FindWindowA" (ByVal lpClassName As String, ByVal lpWindowName As String) As Long  <br/> |
|Proposed changes  <br/> |Suggestions on how the VBA code in the macro can be updated to work correctly with a 64-bit version of Office.<sup>1, 2</sup> <br/> |Private Declare PtrSafe Function FindWindow Lib "user32" Alias "FindWindowA" (ByVal lpClassName As String, ByVal lpWindowName As String) As LongPtr  <br/> |
|Label1 <br/>|Value of custom label, if configured. For more information, see [Use labels to categorize and filter data in reports](#use-labels-to-categorize-and-filter-data-in-reports). <br/>|North America <br/>|
|Label2 <br/>|Value of custom label, if configured. For more information, see [Use labels to categorize and filter data in reports](#use-labels-to-categorize-and-filter-data-in-reports). <br/>|San Francisco <br/>|
|Label3 <br/>|Value of custom label, if configured. For more information, see [Use labels to categorize and filter data in reports](#use-labels-to-categorize-and-filter-data-in-reports). <br/>|Finance <br/>|
|Label4 <br/>|Value of custom label, if configured. For more information, see [Use labels to categorize and filter data in reports](#use-labels-to-categorize-and-filter-data-in-reports). <br/>|Controller <br/>|
|Source file reference |Unique value used to identify the file name in the file-names.log file when concealing file names when doing a scan. For more information, see [Manage the privacy of data collected in reports](#manage-the-privacy-of-data-collected-in-reports). |9FE4E090A33CDA8F4502E7E5672464C8F40E79E353DC98FF8CA84846C7D99822|
|RT Version|Version of the Readiness Toolkit installed on the computer running the scan  | 1.0.0.0 |

<sup>1</sup> For more information about writing VBA code for 64-bit versions of Office, see [64-Bit Visual Basic for Applications Overview](/office/vba/Language/Concepts/Getting-Started/64-bit-visual-basic-for-applications-overview).

<sup>2</sup> **Important:** All proposed changes are provided as is, with no warranty or guarantee. It's important to validate that all changes work as expected when you update your VBA macro code.

<a name="BKMK_AddinReport"> </a>

### Add-in report

The following table provides a list of the different tabs (worksheets) that are shown in an add-in report.

|**Worksheet name**|**Contents**|
|:-----|:-----|
|Add-in Summary  <br/> |Provides a high-level overview of the add-ins found by the Readiness Report Creator.  <br/><br/> The data at the top of the worksheet provides a quick assessment. It shows how many add-ins are likely to be compatible with Microsoft 365 Apps and how many require further research.  <br/> |
|Add-in Details  <br/> |Provides metadata information about the add-ins found (for example, publisher and version number), the total number of installs of each add-in, and, if an advanced report, the readiness status (for example, "Supported version available").  <br/> |
|By computer name  <br/> |This worksheet displays information similar to the Add-in Details worksheet. However, it lists each computer with the add-in installed, rather than just the total number of installations.  <br/> |

You can adjust what information is shown in the add-in report by selecting choices from the drop-down lists on the Add-in Summary tab, and then refreshing the report. For example, you can adjust the report to only show information about Access and Excel add-ins.

By default, add-ins shipped by Office aren't shown. If you want to see information about those add-ins, select "Yes" from the drop-down list and refresh the report. But, most enterprises don't need to worry about application compatibility of add-ins that are shipped with Office.

If you're [collecting add-in usage information](#collect-and-show-add-in-usage-information-in-reports), you can focus solely on add-ins in use by  selecting 'Yes' from the drop-down list and refresh the report.

If you plan to deploy the 64-bit version of Microsoft 365 Apps, be sure to select '64-bit' from the drop-down list and refresh the report. Doing so provides specific readiness information about the add-ins for the 64-bit version. The default selection for reports is 32-bit.

The following table lists the possible readiness statuses that you can see in the add-in report and an explanation of what each status means. 

<a name="readistat"></a>

|**Readiness status**|**Explanation**|
|:-----|:-----|
|Highly adopted  <br/> |This add-in is being widely used on Microsoft 365 Apps in other organizations, and is ready for use with Microsoft 365 Apps. But, the software provider doesn't officially support the add-in on Microsoft 365 Apps.  <br/> |
|Adopted  <br/> |This add-in is being used on Microsoft 365 Apps in other organizations, but the software provider doesn't officially support the add-in on Microsoft 365 Apps.  <br/> |
|Adopted version available <br/> |A different version of this add-in is either “Adopted” or “Highly Adopted” on Microsoft 365 Apps. <br/> |
|Contact software provider  <br/> |This add-in might have issues with Microsoft 365 Apps. You need to decide if this add-in is business critical and then contact the software provider for guidance.  <br/> |
|Supported version available  <br/> |A supported version of this add-in for Microsoft 365 Apps is available from the software provider.  <br/> |
|Unknown<sup>1,2</sup> <br/> |This add-in is unknown to Microsoft. For example, it could be a line-of-business add-in that your in-house application development team created.  <br/><br/> If you create a basic report, the readiness status for all add-ins is listed as Unknown. It's only when you create an advanced report that the Readiness Report Creator contacts Microsoft to try to get readiness status of add-ins.  <br/> |
|Insufficient data<sup>2</sup> <br/> |Microsoft is aware of this add-in but not enough information is collected to provide a readiness status for this add-in.  <br/> |

<sup>1</sup> Some of the add-ins that ship by default with Office are currently flagged as Unknown in an add-in readiness report. These add-ins are actually Highly Adopted and supported by Microsoft. Here are the names of those add-ins: ActionsPane Schema for Add-Ins, Analysis ToolPak, Analysis ToolPak - VBA, Date (XML), Conversation History Add-in for Microsoft Office 2016, Euro Currency Tools, Instant Messaging Contacts (English), Measurement Converter (Measurement Converter), Microsoft Actions Pane 3, Skype Meeting Add-in for Microsoft Office 2016, Solver Add-in, Telephone Number (XML), and Time (XML).

<sup>2</sup> For more information, see [Possible steps to take for add-ins classified as "Unknown" or "Insufficient data"](readiness-toolkit-application-compatibility-microsoft-365-apps.md#BKMK_UnknownInsufficient).

 **Detailed add-in information:** The "Add-in Details" and "By computer name" tabs in the add-in report each contain similar columns of information. The following table provides a list of those columns, along with an explanation of what information is contained in those columns.


| **Column name**                  | **Explanation**                                                                                                                                                                                                                                                                                                  |
|:---------------------------------|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Machine name  <br/>              | The name of the computer on which the add-in is installed.  <br/><br/> This column only appears on the "By computer name" tab.  <br/>                                                                                                                                                                            |
| Add-in Name  <br/>               | The name of the add-in.  <br/>                                                                                                                                                                                                                                                                                   |
| Add-in Publisher  <br/>          | The name of the add-in's publisher.  <br/>                                                                                                                                                                                                                                                                       |
| Add-in Version  <br/>            | The version of the add-in.  <br/>                                                                                                                                                                                                                                                                                |
| App  <br/>                       | The Office application that the add-in is used in. For example, Word or Excel.  <br/>                                                                                                                                                                                                                            |
| Total Installs  <br/>            | The total numbers of installs of the add-in.  <br/><br/> This column only appears on the "Add-in Details" tab.  <br/>                                                                                                                                                                                            |
| Readiness status (32-bit)  <br/> | The readiness status for the add-in. Advanced reports only. <br/> <br/> See the [Readiness status](#readistat) table for a list of possible readiness statuses.  <br/><br/> Note: If you chose "64-bit" from the drop-down list on the "Add-in Summary" tab, this column name displays as "(64-bit)" instead.  <br/>                      |
| Remarks  <br/>                   | Additional information, if available, about the readiness status of the add-in. Advanced reports only.  <br/>                                                                                                                                                                                                    |
| More information  <br/>          | Link to other readiness information about the add-in. Advanced reports only.  <br/>                                                                                                                                                                                                                         |
| Total Device Installs            | Number of devices on which the add-in is installed. <br><br> Available when collecting add-in usage information. For more information, see [Collect and show add-in usage information in reports](#collect-and-show-add-in-usage-information-in-reports).                                                        |
| Total devices add-in used        | Number of devices on which the add-in was used since you started collecting add-in usage information. <br><br> Available when collecting add-in usage information. For more information, see [Collect and show add-in usage information in reports](#collect-and-show-add-in-usage-information-in-reports). |
| Add-in used since *{date}*       | Indication of whether the add-in was used since you started collecting add-in usage information. <br><br> Available when collecting add-in usage information. For more information, see [Collect and show add-in usage information in reports](#collect-and-show-add-in-usage-information-in-reports).      |

<a name="BKMK_Enterprise"> </a>

## Getting readiness information for multiple users in an enterprise


It's easy enough to install and run the Readiness Report Creator on a single user's computer to create a readiness report. But what if you're in a large organization and need to create readiness reports for an entire department or branch office?

Along with the UI wizard version of the Readiness Report Creator, there's also a standalone executable that can be run from the command line or used with scripts. It's named ReadinessReportCreator.exe and is located in the folder where the Readiness Toolkit is installed.

If you have your users run the UI wizard version of the Readiness Report Creator, you end up with separate Excel files, one for each user. That makes it difficult to see readiness from a departmental or office-wide perspective. You also have to rely on the users to run the Readiness Report Creator and follow the instructions correctly. 

The better alternative might be to use the command line capabilities of the Readiness Report Creator and use a script to run the Readiness Report Creator to collect the information on behalf of the user. You can save the files created by the Readiness Report Creator to a network share. If you do share the files, make sure that the appropriate write permissions are given to the share.

> [!NOTE]
> If you're running the Readiness Toolkit by using Microsoft Configuration Manager, or similar enterprise software deployment tools, be sure to deploy the package using the user context, instead of the system context. Otherwise, the Readiness Toolkit won't be able to read the most recently used (MRU) information in the current user's registry hive on the computer.

You can see a list of the available command line options by opening a command prompt, navigating to the folder where you installed the Readiness Toolkit, and then typing the following command:

```console
ReadinessReportCreator.exe -help
```

The command line version of the Readiness Report Creator doesn't have the all the same capabilities as the UI wizard version. You can use the command line version to scan the most recently used Office documents and installed add-ins on a computer, or Office documents in a local folder or network share.

The following is an example of a command line that you can run to scan for both VBA macros and add-ins, and save the results to a network share for the Finance department. You have to include addinscan option as part of the command line for the add-in scan to occur.

```console
ReadinessReportCreator.exe -mru -addinscan -output \\server01\finance -silent
```

The following is an example of a command line that you can run to scan a user's most recently used Office documents and save the results to a network share for the Finance department. This only scans for VBA macros.

```console
ReadinessReportCreator.exe -mru -output \\server01\finance -silent
```

The following is an example of a command line that you can run to scan a folder, and all its subfolders, and save the results to a network share for the Finance department. This only scans for VBA macros.

```console
ReadinessReportCreator.exe -p c:\officefiles\ -r -output \\server01\finance -silent
```

It's important to note that when you run the Readiness Report Creator from the command line, the Readiness Report Creator doesn't create an Excel file. Instead the Readiness Report Creator creates JSON files containing VBA macro and add-in information from the scan.

To create a consolidated Excel report from these various command line scans, you need to run the UI wizard version of the Readiness Report Creator. For the information source, select "Previous readiness results saved together in a local folder or network share," and then specify the location where you saved all the files for the scans. The Readiness Report Creator then consolidates the information from the JSON files into a readiness report in a single Excel file.

Keep in mind that the Readiness Report Creator lists each issue with an Office document in a separate row in the Excel worksheet. Therefore, the Readiness Report Creator can only return 1,046,575 results. If you expect to exceed these limits, we recommend that you narrow the scope of your report, such as to a specific department.  Alternatively, the SQL export option, which doesn't have a limit on the number of results it can accommodate, might be a suitable choice if you expect a large number of results.

By default, the Readiness Toolkit spends 2 minutes scanning a file before timing out and moving on to another file. You can use the -t option from the command line to allow the Readiness Toolkit more than 2 minutes to scan a file.

## Use SQL Server to store report results

Starting with Version 1.2.19098 (which was released on April 9, 2019), you can export report data to any supported version of SQL Server or SQL Server Express. This capability is in response to feedback from many customers who want greater scale and more flexibility when running Readiness Toolkit reports.

You can use either the Readiness Report Creator wizard or the command line. If you're using the Readiness Report Creator, select either **Office documents in a local folder or network share** or **Previous readiness results saved together in a local folder or network share** option. Then, on the **Report settings** page, select **SQL Server report**. Provide the necessary credentials and the name of the database you want to use. If the database doesn't exist, it's created.

Instead of creating an Excel file, a Power BI report, with the same information, is created for you to review the results. This Power BI report can be expanded on or changed as desired. The Power BI report has a file extension of .pbit and is saved to the folder where the Readiness Toolkit is installed. Typically, the Readiness Toolkit is installed in C:\Program Files (x86)\Microsoft Readiness Toolkit for Office. If prompted in Power BI, select **Direct Query** data access mode.

If you're using the command line version of the Readiness Report Creator, type ReadinessReportCreator.exe -help to see the appropriate commands for using a SQL Server database. For example, to create a report from previous readiness results for the Finance department, you can use the following command. This command utilizes a local SQL database named 'Readiness'. It employs SQL Server authentication instead of Windows authentication.

```console
ReadinessReportCreator.exe -sqlimport “C:\Reports\Finance” -server localhost/SQLEXPRESS -database Readiness -username Officeadmin -password seCRet123$%^
```


<a name="labels"> </a>

## Use labels to categorize and filter data in reports
You can specify up to four custom labels to categorize and filter data in reports created by the Readiness Toolkit. Labels are available in reports that are based on scans of the most recently used Office documents and installed add-ins on the user’s computer.

You can specify any string for the custom labels. For example, you can use a label to indicate the user’s department, title, or geographic location. When the Readiness Toolkit runs on the user’s computer, the custom labels are collected and are made available in the reports that are created. For example, you can filter the report to show only data from the Finance Department or only data from offices in Africa. Assign labels in a consistent manner, such as always using Label 1 for department.

You can specify these labels by using the **Specify custom labels to use with the Readiness Toolkit** Group Policy setting. You can find this policy setting under User Configuration\Policies\Administrative Templates\Microsoft Office 2016\Readiness Toolkit. Be sure to download the latest [Administrative Template files (ADMX/ADML) for Office](https://www.microsoft.com/download/details.aspx?id=49030).

> [!NOTE]
> If you're using the Office Telemetry Dashboard and have already configured tags (labels), the Readiness Toolkit automatically collects those labels during its scan of the user's computer and will make them available in its reports. But, labels you specify for the Readiness Toolkit won't appear in the Office Telemetry Dashboard.

<a name="conceal"> </a>

## Manage the privacy of data collected in reports

It’s common for users in an organization to save Office files using file names that contain sensitive or confidential information. To protect the privacy of users and to help prevent revealing sensitive information, the Readiness Toolkit allows you to create a report that conceals the file paths and names of documents identified during a scan. You can create a report that conceals this information either by running the Readiness Report Creator from the UI wizard or from the command line. 

If you're using the UI wizard, begin by selecting either "Most recently used Office documents and installed add-ins on this computer" or "Office documents in a local folder or network share" as the type of report that you want to create. Then, on the next page of the wizard, select the **Conceal file names and paths** check box, before continuing on.

If you're using the command line to create a report, use the -ConcealNames option, as shown in the following example.

```console
ReadinessReportCreator.exe -mru -addinscan -output \\server01\finance -silent -concealnames
```

When you create a report that conceals the file paths and names of documents, the only characters that remain are the drive letter, the first two characters of the file name, and the file extension. The other characters of the file path, up to eight characters, and of the file name are replaced with asterisks (\*). For example, "c:\mergersinfo\Q4\companyx.docx" appears as "c:\\\*\*\*\*\*\*\*\*\co\*\*\*\*\*\*.docx."

When the report is created, a file named file-names.log is created on the computer that ran the scan. This file contains a complete list of the file paths and names that were scanned, without any of the information concealed. The log file also includes a reference code for each file listed. This reference code appears in a column of the report that's created. This allows you to identify the specific file in the report, in case a VBA macro or add-in issue that needs further investigation is identified in the report. The file-names.log file is saved to a temp folder in the user's AppData folder. For example, for user01, the file is saved to the C:\Users\user01\AppData\Local\Readiness Toolkit Temp\\ folder. 

<a name="usage"> </a>

## Collect and show add-in usage information in reports

If you want to get better insights into which add-ins are used most often within your organization and by whom, you can use the Readiness Toolkit to gather add-in usage information and include it in a readiness report. 

To collect add-in usage information, install the most current version of the Readiness Toolkit on each computer that you want to capture add-in usage information from. To enable the agent that generates and collects the add-in usage information, you need to enable the "Allow add-in usage data to be generated and collected by the Readiness Toolkit" Group Policy setting. This policy setting is available in the most current version of the [Administrative Template files (ADMX/ADML) for Office](https://www.microsoft.com/download/details.aspx?id=49030) that are available on the Microsoft Download Center. This policy setting is found under User Configuration\Policies\Administrative Templates\Microsoft Office 2016\Readiness Toolkit.

The data generated and collected includes when the add-in is loaded and used, and if the add-in crashes. This information is stored in the registry of the computer on which the usage agent runs.

We recommend that you allow the usage agent to run for at least 30 days, to ensure you have good coverage of your users and their usage behavior. Once the monitoring period is complete, create a readiness report to collect the information and display it in a report. After you have the information you need, turn off the usage agent by changing the Group Policy setting.

> [!NOTE]
> In this release of the Readiness Toolkit, no add-in usage information is collected on computers that are running Office 2016.

<a name="controls"> </a>

## Detect Silverlight or Flash controls

Silverlight, Shockwave Flash, and Macromedia Flash controls are blocked from activating in Microsoft 365 Apps. For more information about this, [read this Tech Community post](https://techcommunity.microsoft.com/t5/Security-Privacy-and-Compliance/Blocking-Flash-Shockwave-Silverlight-controls-from-activating-in/ba-p/191729).

To identify Office files that contain these controls, you can choose to scan all Office documents when you create a readiness report. This scans all Office files, even if those files don't contain macros. Because more files are scanned, report creation takes longer.

<a name="cloudfiles"> </a>

## How to scan cloud-based files

By default, the Readiness Report Creator can't scan files that are saved in a SharePoint document library, in OneDrive, or in some other type of cloud-based storage location. If you try to scan one of these files, the file shows up as "Cloud-based" in the report.

One possible workaround is to scan the local cache of these cloud-based files on the user's computer. If the files are only stored in a cloud-based location, you can create a mapped network drive to a OneDrive or SharePoint share. Then, you can have Readiness Report Creator scan that drive. But, when this location is scanned, the files must be downloaded in memory to perform the scan. Depending on the number and size of those files, this could result in the scan taking longer and using up a considerable amount of network bandwidth.


## Scan Office documents for macro signature issues

To enhance the security of the Office VBA macro project signing, Microsoft provides a more secure version of VBA project signature scheme: V3 signature. We recommend that organizations apply the V3 signature to all macros to eliminate the risk of tampering.

You can use the Readiness Toolkit to find existing signed VBA files in your organization that you should upgrade to use the V3 signature.

To find these files, run the Readiness Report Creator from an elevated command prompt and use the sigscan option. The following example command line scans files in the vba_files folder and creates a JSON file in the vba_results folder with the results of the scan.

```console
ReadinessReportCreator.exe -sigscan -p C:\vba_files -r -output C:\vba_results
```

To view the results in Excel, run the Readiness Toolkit and on the **Create a readiness report** page, select **Previous readiness results saved together in a local folder or network share**. Then, specify the JSON file you created using sigscan at the command line, and finish the steps in the Readiness Toolkit wizard.

> [!NOTE]
> To use sigscan, you must be using at least version 1.2.21067 of the Readiness Toolkit, which was released on March 19, 2021.

For more information, including how to upgrade those files to use the V3 signature, see [Upgrade signed Office VBA macro projects to V3 signature](https://support.microsoft.com/topic/2b8b3cae-ad64-4b4b-aa85-c4a98ca6da87).

## Identify files with VBA macros that might be blocked

VBA macros are a common way for malicious actors to gain access to deploy malware and ransomware. Therefore, to help improve security in Office, the default behavior of Office applications to block macros in files from the internet was changed. For more information, see [Macros from the internet are blocked by default in Office](security/internet-macros-blocked.md).

You can use the blockinternetscan option to run the Readiness Report Creator from a command prompt. This helps in identifying files that have VBA macros that might be blocked from running. Suppose you need to scan files in the c:\officefiles folder, including all its subfolders, on a device. To save the resulting JSON file to the Finance share on Server01, run the following command.

```console
ReadinessReportCreator.exe -blockinternetscan -p c:\officefiles\ -r -output \\server01\finance -silent
```


<a name="BKMK_AddInfo"> </a>

## Additional information

<a name="BKMK_FileExt"> </a>

### File extensions analyzed for VBA macros

The following table lists, by application, the file extensions that are analyzed when the Readiness Report Creator looks for VBA macros in Office documents.

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

The following table lists the types of add-ins that the Readiness Report Creator collects data on. Add-ins for all Office applications are identified, but it doesn't include web add-ins. Readiness information is provided for COM add-ins that we see running in Microsoft 365 Apps.

|**Add-in type**|**Office applications**|**Description**|
|:-----|:-----|:-----|
|Automation  <br/> |Excel  <br/> |Excel-supported automation add-ins are built upon COM add-ins. Functions in Automation add-ins can be called from formulas in Excel worksheets.  <br/> |
|COM  <br/> |Excel, Outlook, PowerPoint, and Word  <br/> |COM add-ins include add-ins written in C++ and Visual Studio Tools for Office (VSTO) developed using managed code.  <br/> |
|VBA  <br/> |Excel, PowerPoint, and Word  <br/> |VBA add-ins are application-specific files that contain VBA code. These include macro-enabled Word templates (.dotm), Excel add-ins (.xla, .xlam), and PowerPoint add-ins (.ppa, .ppam).  <br/> |
|WLL  <br/> |Word  <br/> |WLL (.wll) add-ins are specific to Word and built with any compiler that supports building DLLs.  <br/> |
|XLL  <br/> |Excel  <br/> |XLL add-ins (.xll) are specific to Excel and are built with any compiler that supports building DLLs (dynamic-link libraries). They don't have to be installed or registered. XLL add-ins also include DLLs that contain user-defined commands and functions.  <br/> |
|XLS RTD  <br/> |Excel  <br/> |XLS real-time data (RTD) add-ins are Excel worksheets that use the RealTimeData worksheet function to call an Automation server to retrieve data in real-time.  <br/> |

<a name="BKMK_InfoSent"> </a>

### Examples of the information sent to Microsoft when creating an advanced report

When you choose to create an [advanced report](readiness-toolkit-application-compatibility-microsoft-365-apps.md#BKMK_ChooseBasicAdv), some information is sent to Microsoft.

The following table provides a list of the information that is sent to Microsoft about the VBA macros that are found during a scan, along with examples.

|**Data**|**Description**|**Example**|
|:-----|:-----|:-----|
|DevicesScanned  <br/> |Number of computers that were scanned.  <br/> |DevicesScanned: 23  <br/> |
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
|DevicesWithNoMacros|Number of devices that didn't have macro enabled files.|DevicesWithNoMacros: 12|
|DevicesWithDeclares|Number of devices scanned that included macros that used Declare statements.|DevicesWithDeclares: 12|
|DevicesWhichRequireSignificantRemediation|Number of devices that contain macro files that require significant remediation.|DevicesWhichRequireSignificantRemediation: 12|
|DevicesBlockedFromUpgrade|Number of devices that contain macros that require remediation to be unblocked from upgrading to Microsoft 365 Apps.|DevicesBlockedFromUpgrade: 1|
|DevicesWithMacrosWithIssues|Number of devices that contain compatibility issues with macros.|DevicesWithMacrosWithIssues: 2|
|DevicesWhichRequireLimitedRemediation|Number of devices that contain macro files that require limited remediation.|DevicesWhichRequireLimitedRemediation: 12|
|DevicesWhichRequireMinimalValidation|Number of devices that contain macro files that require minimal validation.|DevicesWhichRequireMinimalValidation: 12|
|DevicesWithMacrosWithoutIssues|Number of devices that contain macros, but don’t have any compatibility issues.|DevicesWithMacrosWithoutIssues: 12|
|DevicesWithMacros|Number of devices that contain macro files.|DevicesWithMacros: 12|
|DevicesSafeToUpgrade|Number of devices are ready to upgrade to Microsoft 365 Apps.|DevicesSafeToUpgrade: 12|
|DevicesWithOlderToolVersion|Number of devices that are using an older version of the Readiness Toolkit.|DevicesWithOlderToolVersion: 12|

The following table provides a list of the information that is sent to Microsoft about the add-ins that are found during a scan, along with examples.

|**Data**|**Example**|
|:-----|:-----|
|Add-in Pro ID  <br/> |UCAddin.LyncAddin.1  <br/> |
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

The report created by the Readiness Report Creator uses macros and active content to display the information in the report. Therefore, to see the VBA macro compatibility and the add-in readiness information in the report, you need to allow macros and active content in Excel. If macros and active content aren't enabled in Excel, you see a Getting started message on the Overview worksheet when you open the report. On that page, instructions explain how to enable macros and active content. Enabling them can be as simple as clicking Enable Content in the Message Bar.

In some cases, you might not see the Message Bar and the **Enable Content** choice. It's most likely because Excel is configured to disable all macros without notification. You can check this setting by going to **File** > **Options** > **Trust Center** > **Trust Center Settings…** > **Macro Settings**. There, in the **Trust Center** dialog box, you can change the setting to **Disable all macros with notification**. After you do that, choose **OK** to save the change and close the **Trust Center** dialog box, then choose **OK** to close the **Excel Options** dialog box, and then close the report file. When you open the report file again, you should see the Message Bar and the **Enable Content** choice.

If the macro settings choices are grayed out in the **Trust Center** dialog box, an administrator configured these settings by using Group Policy and the settings can't be changed manually. In this case, the simplest solution is to open the report file on a different computer where the macro settings for Excel allow you to enable macros by selecting the **Enable Content** choice in the Message Bar.

For more information about macro setting choices, see [Enable or disable macros in Office files](https://support.microsoft.com/topic/12b036fd-d140-4e74-b45e-16fed1a7e5c6).

<a name="BKMK_UnknownInsufficient"> </a>

### Possible steps to take for add-ins classified as "Unknown" or "Insufficient data"

If an add-in is classified as "Unknown" or "Insufficient data" this means that Microsoft doesn't yet have sufficient information regarding the add-in to provide a readiness status. If this add-in is business critical for your organization, we recommend to contact the software provider who developed this add-in to see if the add-in is supported for Microsoft 365 Apps.

### Information sent in an error report to Microsoft
If there's a problem showing the readiness reports, you receive a message asking if you want to send an error report to Microsoft. For example, if there's a problem creating a graph in the report or querying the data collected.

By sending an error report to Microsoft, you can help us improve the Readiness Toolkit. The error report sent to Microsoft doesn't contain any personal data. The following table provides a list of what information is sent to Microsoft in the error report.

|**Data sent** |**Description**|
|---------|---------|
|Module|The VBA module where the error occurred.|
|Sub/Function name|The name of the sub procedure or function that the error occurred in.|
|Line identifier|The identifier placed at the beginning of the last successfully executed line of code.|
|Error message|The user message normally output by the error. Might be localized for some errors.|
|Error number|The number identifying the error.|
|Source name|The name of the object that raised the error. This name isn't the variable name.|
|Tool version|The version of the Readiness Toolkit that was being used.|
|Report GUID|A GUID generated for each report to help filter out repeated errors.|
|Session ID|The Session ID when the report was created to help correlate it with any errors logged by the Readiness Toolkit.|
|Excel version|The version of Excel used to view the readiness reports.|

## Office Readiness Toolkit retirement

Since the toolkit's launch in 2017, the interoperability of macros and add-ins between supported Office versions, such as Office 2016, and Microsoft 365 Apps has seen significant improvements. Notably, there are no disruptive changes in the VBA Object Model between Office 2016 and Microsoft 365 Apps. As a result, Microsoft plans to retire the toolkit on March 31, 2024. Please refer to the following for a summary of the upcoming changes:

- The Office Readiness Toolkit will not receive any more updates.
- If you are currently using the Office Readiness Toolkit, you can continue to use it with all its features functioning as expected until March 31, 2024.
- Support for the Office Readiness Toolkit will cease on March 31, 2024, and the download will be removed from the Microsoft Download Center.
- After March 31, 2024, you can still run the toolkit and generate reports for macro and add-in inventory. The following tabs in the report will remain unaffected:
  - Overview
  - VBA overview
  - VBA Summary
  - VBA Results
  - VBA Remediation
  - VBA References
- However, the creation of advanced reports using the user interface will no longer be possible after March 31, 2024. An error message will be displayed, and a basic report will be generated instead. The following changes will occur:
  - The tabs **Add-in Summary** and **Add-in details** will no longer display readiness information.
  - Add-ins included in the Office installation will be listed and will not be filtered out.
  - The changes will also affect the tabs **by computer name** and **Device Upgrade Readiness**, as no readiness information will be available, and the number of add-ins will differ.
  - If you use the Microsoft Configuration Manager (current branch), you can use the [Microsoft 365 Apps readiness dashboard](/mem/configmgr/sum/deploy-use/office-365-dashboard#bkmk_readiness-dash) to evaluate your add-in compatibility.
- Other features such as the Signature scan or Silverlight detection will remain unaffected. However, no support will be provided after March 31, 2024.
