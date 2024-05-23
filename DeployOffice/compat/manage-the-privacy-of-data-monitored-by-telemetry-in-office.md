---
title: "Manage the privacy of data monitored by Office Telemetry Dashboard"
ms.author: nwhite
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: conceptual
ms.service: office-perpetual-itpro
ms.localizationpriority: medium
ms.collection: Tier2
description: "Learn about the data collection process and how to configure settings that help protect user privacy when using Office Telemetry Dashboard."
ms.date: 05/21/2024
---

# Manage the privacy of data monitored by Office Telemetry Dashboard

***Applies to:*** *Office 2019, Office 2016*

> [!IMPORTANT]
> - Office Telemetry Dashboard is no longer supported in Microsoft 365 Apps for enterprise (as of Version 2208), and is removed in Version 2301 (and later).
> - For more information, see [Removal of Office Telemetry Dashboard from Microsoft 365 Apps for enterprise](telemetry-dashboard-removal.md).

Office Telemetry Dashboard is an Excel workbook that shows compatibility and inventory data for the Office files, add-ins, and solutions used in an organization. Office Telemetry Dashboard displays the file names and titles of documents in each user's Most Recently Used list, which might reveal personal or confidential information about the user or organization. The names of add-ins and other solutions that are used by Office are also displayed. This article explains how settings in Office Telemetry Dashboard and Office Telemetry Agent protect user privacy. These settings disguise file names and titles or prevent data for selected applications and solutions from being reported.

The agent collects inventory, usage, and health data, then uploads it to a shared folder. A service called Office Telemetry Processor processes this data and inserts it into an SQL database. Office Telemetry Dashboard connects to this database so that it can show the usage of Office files, add-ins, and solutions.

The agent is built into Office 2019 and Office 2016 and is installed separately on computers that run earlier versions of Office. Whether the agent is built in or deployed separately, it doesn't generate or collect any data until you enable logging. Use the registry or Group Policy Administrative Template files (ADMX/ADML) for Office as described in [Deploy Office Telemetry Dashboard](deploy-telemetry-dashboard.md). After logging begins, data is stored on the local computer under %LocalAppData%\Microsoft\Office\16.0\Telemetry and is uploaded periodically to a shared folder.

> [!IMPORTANT]
> - Office Telemetry Dashboard is an on-premises tool that collects inventory, usage, and health data about the Office documents and solutions, such as add-ins, used in your organization. The data is primarily designed to help your organization with application compatibility testing.
> - Data collected for Office Telemetry Dashboard is stored in a SQL Server database controlled by your organization and the data collected is ***not*** sent to Microsoft. For more information, see [Data collected by the agent for Office Telemetry Dashboard](data-that-the-telemetry-agent-collects-in-office.md).
> - Data collected for Office Telemetry Dashboard is different than Office diagnostic data, which can be sent to Microsoft. For more information about Office diagnostic data, see [Overview of privacy controls for Microsoft 365 Apps](../privacy/overview-privacy-controls.md).
> - Settings used to manage Office Telemetry Dashboard have no impact on Office diagnostic data and vice versa. For more information about managing Office diagnostic data, see [Use policy settings to manage privacy controls for Microsoft 365 Apps](../privacy/manage-privacy-controls.md).


<a name="Configure"> </a>  

## How to configure privacy and performance settings in Office Telemetry Dashboard

There are several ways that you can configure the level of detail that is displayed for Office files, add-ins, and solutions in Office Telemetry Dashboard. Some methods, such as changing the reporting threshold, prevent certain information from being shown in Office Telemetry Dashboard. Other methods prevent the agent from uploading data so that it's never added to the database. Setting a threshold and preventing certain data from uploading can also help improve the performance of the database and custom reports.

The following image provides a quick overview of the three methods that Office Telemetry Dashboard provides to help you protect user privacy. 

**Three ways to configure privacy settings in Office Telemetry Dashboard**

:::image type="content" source="../compat/media/manage-the-privacy-of-data-monitored-by-telemetry-in-office/telemetry-privacy-methods.png" alt-text="An image showing three methods to manage privacy in Office telemetry: obfuscate document details, exclude certain applications from reporting, and set thresholds for user counts.":::


### Adjust the reporting threshold in the database to show only files that are used by multiple users

Office Telemetry Dashboard tracks the number of users who use an Office file that has the same name. These files are usually shared and accessed by multiple users, and they often have more business value than files used by a single user. As part of your compatibility planning, you can choose to ignore inventory and compatibility events for files used by a single user and instead monitor files used across a department. Configuring Office Telemetry Dashboard to report files that are used by, say, three or more users also helps avoid displaying personal files, such as resumes. This setting reduces the data set returned in custom reports in Office Telemetry Dashboard, helping you work around the [2-GB memory limitation](https://go.microsoft.com/fwlink/p/?LinkID=330482) in the 32-bit version of Excel. 

To prevent Office Telemetry Dashboard from displaying files that have a single author, you run a script that adjusts the minimum reporting threshold in the database. Use the [Telemetry Dashboard Administration Tool](https://go.microsoft.com/fwlink/p/?LinkId=281836) (Tdadm) to filter out files that appear on two or fewer clients. Set the **Threshold** value to three, or to a larger value if needed, as shown in the following example. 

```console
tdadm.exe -o settings -databaseserver dbserver -databasename dbname -threshold 3
```

For more information about Tdadm, see the [Tdadm wiki](https://go.microsoft.com/fwlink/p/?LinkId=281837).

### Disguise or obscure user and file data that is shown in Office Telemetry Dashboard

It's common for users in an organization to save Office files by using file names that contain sensitive or confidential information. These files might have high business value, justifying their monitoring for compatibility issues. However, business groups like legal and human resources might object to monitoring their computers to avoid revealing confidential file names to administrators using Office Telemetry Dashboard. 

To allow yourself and other administrators to identify the owners of Office files that have compatibility issues without revealing file names or specific locations, you can enable file obfuscation, which disguises Office file names, titles, and file paths. This setting is configured on the agent, which performs the obfuscation task before uploading data to the shared folder. The data that is stored on the local computer isn't obfuscated.

The following table describes different ways in which file information is disguised.

**Examples of obfuscated file names, file paths, and titles**

Actual file details on the monitored client computer 

|Example|**File name**|**File path**|**Title**|
|:-----|:-----|:-----|:-----|
|#1 |Resume_Contoso.xlsx  |C:\Users\John\Documents |Resume_Contoso.docx  |
|#2|Merger_Contoso.docx   |\\\FileShare\Operations\FY2018   |Merger_Contoso.docx   |
|#3|FY2018_Merger.xlsx   |https://sharepoint/sites/HR/SharedDocuments   |FY2018_Merger.xlsx   |
|#4 |10 cures for diseases.pptx   |Outlook:C:\Users\John\AppData\Local\Microsoft\Windows\Temporary Internet Files\Content.Outlook\1234ABCD   |10 cures for diseases   |

Data that is sent to the shared folder after you enable file obfuscation.

|Example|**File name**|**File path**|**Title**|
|:-----|:-----|:-----|:-----|
|#1  |Re\*.xlsx   |C:\\*   |\*  |
|#2 |Me\*.docx   |\\\FileShare\\*   |\*   |
|#3 |FY\*.xlsx   |https://sharepoint/*   |\*   |
|#4|10\*.pptx   |Outlook:\*   |\*   |

#### To enable file obfuscation by using the registry

The following example enables file obfuscation in the registry of a client computer. Save this code sample as a .reg file and then run it on the monitored client computers.

```console
Windows Registry Editor Version 5.00
[HKEY_CURRENT_USER\Software\Policies\Microsoft\Office\16.0\osm]
"EnableFileObfuscation"=dword:00000001
```

For more information about how to use .reg files, see [How to add, modify, or delete registry subkeys and values by using a registration entries (.reg) file](https://go.microsoft.com/fwlink/p/?LinkID=200827).

#### To enable file obfuscation by using Group Policy settings

The following table describes the name and path of the Group Policy setting that enables file obfuscation. You can download the Administrative Template files (ADMX/ADML) for Office from the [Microsoft Download Center](https://go.microsoft.com/fwlink/p/?LinkId=626001).

**Group Policy setting that enables file obfuscation**

|**Setting name**|**Path**|
|:-----|:-----|
|Turn on privacy settings in Office Telemetry Agent  <br/> |User Configuration\Policies\Administrative Templates\Microsoft Office 2016\Telemetry Dashboard  <br/> |

### Prevent certain applications or solutions from being reported in Office Telemetry Dashboard

For business groups with employees handling trade secrets or sensitive data, you can prevent the collection and upload of information about specific Office applications or Office solution types to the shared folder. For example, a business group might decide that Excel files are too sensitive for monitoring. Another group might decide that they care only about Access-related solutions and that they don't want to monitor other applications.

#### To configure exclusion settings by using the registry

The following table describes the registry values that prevent specific applications from being reported to Office Telemetry Dashboard.

**Agent registry settings under HKEY_CURRENT_USER\Software\Policies\Microsoft\Office\16.0\OSM\preventedapplications**

|**Value name**|**Value type**|**Value description and data**|
|:-----|:-----|:-----|
|accesssolution  <br/><br/> olksolution  <br/><br/> onenotesolution  <br/> <br/>pptsolution  <br/> <br/>projectsolution  <br/> <br/>publishersolution  <br/><br/> visiosolution  <br/> <br/>wdsolution  <br/> <br/>xlsolution  <br/> |REG_DWORD  <br/> |Prevents data for specific Office applications from being reported to Office Telemetry Dashboard. The agent won't report any data that interacts with the specified application. This includes document files that are used by the application and COM add-ins that are loaded the application. The value names correspond to Office applications as follows: <br/> <br/> accesssolution: Access solutions  <br/><br/> olksolution: Microsoft Outlook solutions  <br/><br/> onenotesolution: OneNote solutions  <br/><br/> pptsolution: PowerPoint solutions  <br/><br/> projectsolution: Project solutions  <br/><br/> publishersolution: Publisher solutions <br/> <br/> visiosolution: Visio solutions  <br/><br/> wdsolution: Word solutions  <br/><br/> xlsolution: Excel solutions  <br/><br/> **Value:** <br/><br/> 1 = Prevent reporting <br/> <br/> 0 = Allow reporting <br/> <br/> Default = 0 (Allow reporting)  <br/> |

The following table describes the registry values that prevent specific solution types from being reported to Office Telemetry Dashboard.

**Agent registry settings under HKEY_CURRENT_USER\Software\Policies\Microsoft\Office\16.0\OSM\preventedsolutiontypes**

|**Value name**|**Value type**|**Value description and data**|
|:-----|:-----|:-----|
|agave  <br/> appaddins <br/> <br/> comaddins<br/>  <br/> documentfiles  <br/><br/> templatefiles  <br/> |REG_DWORD  <br/> |Prevents data for specific solutions from being reported to Office Telemetry Dashboard. The value names correspond to Office solution types as follows:  <br/> <br/>agave: apps for Office  <br/> <br/>appaddins: Application-specific add-ins. These include Excel add-ins such as .xla and xlam, Word add-ins such as .dotm, and PowerPoint add-ins such as .ppa and .ppam. <br/> <br/> comaddins: COM add-ins <br/> <br/> documentfiles: Office document files  <br/><br/> templatefiles: Office template files <br/> <br/> **Value:** <br/><br/> 1 = Prevent reporting <br/> <br/> 0 = Allow reporting  <br/><br/> Default = 0 (Allow reporting)  <br/> |

The following example disables reporting for all solution and application types. Save this sample as a .reg file and then remove any applications or solutions that you want to allow reporting for. Otherwise they'll all be disabled because their value is set to 00000001.

```console
Windows Registry Editor Version 5.00
[HKEY_CURRENT_USER\Software\Policies\microsoft\office\16.0\osm\preventedapplications]
"accesssolution"=dword:00000001
"olksolution"=dword:00000001
"onenotesolution"=dword:00000001
"pptsolution"=dword:00000001
"projectsolution"=dword:00000001
"publishersolution"=dword:00000001
"visiosolution"=dword:00000001
"wdsolution"=dword:00000001
"xlsolution"=dword:00000001

[HKEY_CURRENT_USER\Software\Policies\microsoft\office\16.0\osm\preventedsolutiontypes]
"agave"=dword:00000001
"appaddins"=dword:00000001
"comaddins"=dword:00000001
"documentfiles"=dword:00000001
"templatefiles"=dword:00000001
```

For more information about how to use .reg files, see [How to add, modify, or delete registry subkeys and values by using a registration entries (.reg) file](https://go.microsoft.com/fwlink/p/?LinkID=200827).

#### To configure exclusion settings by using Group Policy settings

The following table describes the name and path of the Group Policy settings that exclude reporting for selected Office applications and solutions. You can download the Administrative Template files (ADMX/ADML) for Office from the [Microsoft Download Center](https://go.microsoft.com/fwlink/p/?LinkId=626001).

**Exclusion policy settings under User Configuration\Policies\Administrative Templates\Microsoft Office 2016\Telemetry Dashboard**

|**Setting**|**Description**|
|:-----|:-----|
|Office applications to exclude from Office Telemetry Agent reporting  <br/> |Prevents data for specific Office applications from being reported to Office Telemetry Dashboard.  <br/> |
|Office solutions to exclude from Office Telemetry Agent reporting  <br/> |Prevents data for specific Office solutions from being reported to Office Telemetry Dashboard.  <br/> |

<a name="Disable"> </a>

## Disable data collection for the agent

To stop collecting data on the local computer, update the registry or set Group Policy settings as follows.

### To stop logging by using the registry

The following example stops logging and uploading by the agent. Save the example as a .reg file and run it on the client computer.

```console
Windows Registry Editor Version 5.00
[HKEY_CURRENT_USER\Software\Policies\Microsoft\Office\16.0\osm]
"Enablelogging"=dword:00000000
"EnableUpload"=dword:00000000
```

For more information about how to use .reg files, see [How to add, modify, or delete registry subkeys and values by using a registration entries (.reg) file](https://go.microsoft.com/fwlink/p/?LinkID=200827).

### To stop logging by using the Group Policy settings

The policy settings that are listed in the following table are available in the path **User Configuration\Policies\Administrative Templates\Microsoft Office 2016\Telemetry Dashboard**. Set these policy settings to **Disabled** to turn off data collection and uploading for the agent. You can download the Administrative Template files (ADMX/ADML) for Office from the [Microsoft Download Center](https://go.microsoft.com/fwlink/p/?LinkId=626001).

**Agent policy settings that disable logging**

|**Setting**|**Description**|
|:-----|:-----|
|Turn on telemetry data collection  <br/> |Set this setting to Disabled to turn off data collection.  <br/> |
|Turn on data uploading for Office Telemetry Agent  <br/> |Set this setting to Disabled to stop uploading data to the shared folder.  <br/> |

<a name="Delete"> </a>

## Delete data that is stored on client computers

Disabling logging doesn't delete the data that is already collected from a computer. To delete this data on the local client computer, delete the files evt.tbl, sln.tbl, user.tbl that are located under %LocalAppData%\Microsoft\Office\16.0\Telemetry.

## Related articles

- [Guide to Office Telemetry Dashboard resources](compatibility-and-telemetry-in-office.md)
- [Deploy Office Telemetry Dashboard](deploy-telemetry-dashboard.md)
- [Data collected by the agent for Office Telemetry Dashboard](data-that-the-telemetry-agent-collects-in-office.md)

