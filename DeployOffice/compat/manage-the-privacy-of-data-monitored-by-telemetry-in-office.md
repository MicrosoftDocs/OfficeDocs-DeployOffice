---
title: "Manage the privacy of data monitored by telemetry in Office"
ms.author: danbrown
author: DHB-MSFT
manager: laurawi
ms.audience: ITPro
ms.topic: get-started-article
ms.service: o365-proplus-itpro
localization_priority: Normal
ms.collection: Ent_O365
ms.custom: Ent_Office_Compat
description: "Learn about the telemetry data collection process and how to configure settings that help protect user privacy when using the Telemetry Dashboard in Office."
---

# Manage the privacy of data monitored by telemetry in Office

***Applies to:*** *Office 365 ProPlus, Office 2019, and Office 2016*


> [!NOTE]
> To assess your Office compatibility, we recommend using the [Readiness Toolkit for Office add-ins and VBA](https://www.microsoft.com/en-us/download/details.aspx?id=55983). The Readiness Toolkit is a free download and can be used to identify the VBA macros and add-ins used in your organization. Also, the Excel-based readiness reports can tell you which add-ins are adopted or supported in Office 365 ProPlus and can provide suggestions on how to remediate VBA macros issues that are identified. For more information, see [Use the Readiness Toolkit to assess application compatibility for Office 365 ProPlus](../use-the-readiness-toolkit-to-assess-application-compatibility-for-office-365-pro.md).


Telemetry Dashboard is an Excel workbook that displays compatibility and inventory data about the Office files, Office add-ins, and Office solutions that are used in an organization. Telemetry Dashboard displays the file names and titles of documents in each user's Most Recently Used list, which might reveal personal or confidential information about the user or organization. The names of add-ins and other solutions that are used by Office are also displayed. In this article, you can learn about settings in Telemetry Dashboard and the telemetry agent that help you protect user privacy by disguising file names and titles or by preventing data for selected applications or solutions from being reported altogether.

The telemetry agent collects inventory, usage, and other application data and uploads it to a shared folder, where it is processed by a service known as the telemetry processor and inserted into an SQL database. The Telemetry Dashboard connects to this database so that it can show the usage of Office files, add-ins, and solutions.

The telemetry agent is built into Office 365 ProPlus, Office 2019, Office 2016, and Office 2013 and is installed separately on computers that run earlier versions of Office. Regardless of whether it's built in or deployed separately, the telemetry agent never generates or collects any telemetry or inventory data until you enable telemetry logging. You can do this by using either the registry or the Group Policy Administrative Template files (ADMX/ADML) for Office as described in [Deploy Telemetry Dashboard](deploy-telemetry-dashboard.md). After logging begins, telemetry data is stored on the local computer under %LocalAppData%\Microsoft\Office\16.0\Telemetry and is uploaded periodically to a shared folder.

> [!IMPORTANT]
> The telemetry data that the telemetry agent collects for Office is not related to the diagnostic data collected for Office by Microsoft. For more information about that data, see [Diagnostic data in Office](https://support.office.com/article/f409137d-15d3-4803-a8ae-d26fcbfc91dd).

<a name="Configure"> </a>  

## How to configure privacy and performance settings in Telemetry Dashboard

There are several ways that you can configure the level of detail that is displayed for Office files, add-ins, and solutions in Telemetry Dashboard. Some methods, such as changing the reporting threshold, prevent certain information from being shown in Telemetry Dashboard. Other methods prevent the agent from uploading data so that it is never added to the telemetry database. Setting a threshold and preventing certain data from uploading can also help improve the performance of the telemetry database and custom reports.

The following image provides a quick overview of the three methods that Telemetry Dashboard provides to help you protect user privacy. 

**Three ways to configure privacy settings in Telemetry Dashboard**

![This diagram illustrates the 3 methods offered by the Office Telemetry Dashboard to protect user privacy.](../images/ORK_Telem_3Methods.gif)

### Adjust the reporting threshold in the telemetry database to show only files that are used by multiple users

Telemetry Dashboard tracks the number of users who use an Office file that has the same name. Typically these are files that are shared and accessed by multiple users and might have greater business value than files that are used by a single user. As part of your compatibility planning, you might decide not to view inventory and compatibility events about files that are used by a single user and instead monitor files that are used throughout a department. Configuring Telemetry Dashboard to report files that are used by, say, three or more users also helps avoid displaying personal files, such as resumes. This setting also reduces the data set that is returned in custom reports in Telemetry Dashboard, which can help you work around the [2-GB memory limitation](https://go.microsoft.com/fwlink/p/?LinkID=330482) in the 32-bit version of Excel. 

To prevent Telemetry Dashboard from displaying files that have a single author, you run a script that adjusts the minimum reporting threshold in the telemetry database. Specifically, you use the [Telemetry Dashboard Administration Tool](https://go.microsoft.com/fwlink/p/?LinkId=281836) (Tdadm) to filter out files that appear on two or fewer clients. To do this, set the **Threshold** value to 3 (or to a larger value, if you want) as shown in the following example. 

```
tdadm.exe -o settings -databaseserver dbserver -databasename dbname -threshold 3
```

For more information about Tdadm, see the [Tdadm wiki](https://go.microsoft.com/fwlink/p/?LinkId=281837).

### Disguise or obscure user and file data that is shown in Telemetry Dashboard

It's common for users in an organization to save Office files by using file names that contain sensitive or confidential information. Although these files might have high business value that justifies monitoring them for compatibility issues, business groups such as legal and human resources might object to having their computers monitored to avoid revealing confidential file names to administrators who use Telemetry Dashboard. 

To allow yourself and other administrators to identify the owners of Office files that have compatibility issues without revealing file names or specific locations, you can enable file obfuscation, which disguises Office file names, titles, and file paths. This setting is configured on the agent, which performs the obfuscation task before uploading data to the shared folder. The data that is stored on the local computer is not obfuscated.

The following table describes different ways in which file information is disguised.

**Examples of obfuscated file names, file paths, and titles**

||**File name**|**File path**|**Title**|
|:-----|:-----|:-----|:-----|
|Actual file details on the monitored client computer  <br/> |Resume_Contoso.xlsx  <br/> |C:\Users\John\Documents  <br/> |Resume_Contoso.docx  <br/> |
|Merger_Contoso.docx  <br/> |\\\FileShare\Operations\FY2018  <br/> |Merger_Contoso.docx  <br/> |
|FY2018_Merger.xlsx  <br/> |http:\\\sharepoint\sites\HR\SharedDocuments  <br/> |FY2018_Merger.xlsx  <br/> |
|10 cures for diseases.pptx  <br/> |Outlook:C:\Users\John\AppData\Local\Microsoft\Windows\Temporary Internet Files\Content.Outlook\1234ABCD  <br/> |10 cures for diseases  <br/> |
|Data that is sent to the shared folder after you enable file obfuscation  <br/> |Re\*\*\*\*\*\*\*\*.xlsx  <br/> |C:\\*\*\*\*\*\*\*\*  <br/> |\*\*\*\*\*\*\*\*  <br/> |
|Me\*\*\*\*\*\*\*\*.docx  <br/> |\\\FileShare\\*\*\*\*\*\*\*\*  <br/> |\*\*\*\*\*\*\*\*  <br/> |
|FY\*\*\*\*\*\*\*\*.xlsx  <br/> |http://sharepoint/\*\*\*\*\*\*\*\*  <br/> |\*\*\*\*\*\*\*\*  <br/> |
|10\*\*\*\*\*\*\*\*.pptx  <br/> |Outlook:\*\*\*\*\*\*\*\*  <br/> |\*\*\*\*\*\*\*\*  <br/> |

#### To enable file obfuscation by using the registry

The following example enables file obfuscation in the registry of a client computer. Save this code sample as a .reg file and then run it on the monitored client computers.

```
Windows Registry Editor Version 5.00
[HKEY_CURRENT_USER\Software\Policies\Microsoft\Office\16.0\osm]
"EnableFileObfuscation"=dword:00000001
```

For more information about how to use .reg files, see [How to add, modify, or delete registry subkeys and values by using a registration entries (.reg) file](https://go.microsoft.com/fwlink/p/?LinkID=200827).

#### To enable file obfuscation by using Group Policy settings

The following table describes the name and path of the Group Policy setting that enables file obfuscation. You can download the Administrative Template files (ADMX/ADML) for Office from the [Microsoft Download Center](https://go.microsoft.com/fwlink/p/?LinkId=626001).

**Group policy setting that enables file obfuscation**

|**Setting name**|**Path**|
|:-----|:-----|
|Turn on privacy settings in the telemetry agent  <br/> |User Configuration\Policies\Administrative Templates\Microsoft Office 2016\Telemetry Dashboard  <br/> |

### Prevent certain applications or solutions from being reported in Telemetry Dashboard

For business groups that employ lawyers, executives, or other employees who work with trade secrets or sensitive data, you can prevent information about specific Office applications or Office solution types from being collected and uploaded to the shared folder. For example, a business group might decide that Excel files are too sensitive for monitoring. Another group might decide that they care only about Access-related solutions and that they don't want to monitor other applications.

#### To configure exclusion settings by using the registry

The following table describes the registry values that prevent specific applications from being reported to Telemetry Dashboard.

**Telemetry agent registry settings under HKEY_CURRENT_USER\Software\Policies\Microsoft\Office\16.0\OSM\preventedapplications**

|**Value name**|**Value type**|**Value description and data**|
|:-----|:-----|:-----|
|accesssolution  <br/><br/> olksolution  <br/><br/> onenotesolution  <br/> <br/>pptsolution  <br/> <br/>projectsolution  <br/> <br/>publishersolution  <br/><br/> visiosolution  <br/> <br/>wdsolution  <br/> <br/>xlsolution  <br/> |REG_DWORD  <br/> |Prevents telemetric data for specific Office applications from being reported to Telemetry Dashboard. The agent won't report any data that interacts with the specified application. This includes document files that are used by the application and COM add-ins that are loaded the application. The value names correspond to Office applications as follows: <br/> <br/> accesssolution: Access solutions  <br/><br/> olksolution: Microsoft Outlook solutions  <br/><br/> onenotesolution: OneNote solutions  <br/><br/> pptsolution: PowerPoint solutions  <br/><br/> projectsolution: Project solutions  <br/><br/> publishersolution: Publisher solutions <br/> <br/> visiosolution: Visio solutions  <br/><br/> wdsolution: Word solutions  <br/><br/> xlsolution: Excel solutions  <br/><br/> **Value:** <br/><br/> 1 = Prevent reporting <br/> <br/> 0 = Allow reporting <br/> <br/> Default = 0 (Allow reporting)  <br/> |

The following table describes the registry values that prevent specific solution types from being reported to Telemetry Dashboard.

**Telemetry Agent registry settings under HKEY_CURRENT_USER\Software\Policies\Microsoft\Office\16.0\OSM\preventedsolutiontypes**

|**Value name**|**Value type**|**Value description and data**|
|:-----|:-----|:-----|
|agave  <br/> appaddins <br/> <br/> comaddins<br/>  <br/> documentfiles  <br/><br/> templatefiles  <br/> |REG_DWORD  <br/> |Prevents telemetric data for specific solutions from being reported to Telemetry Dashboard. The value names correspond to Office solution types as follows:  <br/> <br/>agave: apps for Office  <br/> <br/>appaddins: Application-specific add-ins. These include Excel add-ins such as .xla and xlam, Word add-ins such as .dotm, and PowerPoint add-ins such as .ppa and .ppam. <br/> <br/> comaddins: COM add-ins <br/> <br/> documentfiles: Office document files  <br/><br/> templatefiles: Office template files <br/> <br/> **Value:** <br/><br/> 1 = Prevent reporting <br/> <br/> 0 = Allow reporting  <br/><br/> Default = 0 (Allow reporting)  <br/> |

The following example disables reporting for all solution and application types. Save this sample as a .reg file and then remove any applications or solutions that you want to allow reporting for. Otherwise they will all be disabled because their value will be set to 00000001.

```
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
|Office applications to exclude from telemetry agent reporting  <br/> |Prevents telemetric data for specific Office applications from being reported to the Telemetry Dashboard.  <br/> |
|Office solutions to exclude from telemetry agent reporting  <br/> |Prevents telemetric data for specific Office solutions from being reported to the Telemetry Dashboard.  <br/> |

<a name="Disable"> </a>

## Disable data collection for the telemetry agent

To stop collecting data on the local computer, update the registry or set Group Policy settings as follows.

### To stop telemetry logging by using the registry

The following example stops logging and uploading by Telemetry Agent. Save the example as a .reg file and run it on the client computer.

```
Windows Registry Editor Version 5.00
[HKEY_CURRENT_USER\Software\Policies\Microsoft\Office\16.0\osm]
"Enablelogging"=dword:00000000
"EnableUpload"=dword:00000000
```

For more information about how to use .reg files, see [How to add, modify, or delete registry subkeys and values by using a registration entries (.reg) file](https://go.microsoft.com/fwlink/p/?LinkID=200827).

### To stop telemetry logging by using the Group Policy settings

The policy settings that are listed in the following table are available in the path **User Configuration\Policies\Administrative Templates\Microsoft Office 2016\Telemetry Dashboard**. Set these policy settings to **Disabled** to turn off data collection and uploading for the agent. You can download the Administrative Template files (ADMX/AMDL) for Office from the [Microsoft Download Center](https://go.microsoft.com/fwlink/p/?LinkId=626001).

**Telemetry agent policy settings that disable telemetry logging**

|**Setting**||
|:-----|:-----|
|Turn on telemetry data collection  <br/> |Set this setting to Disabled to turn off data collection.  <br/> |
|Turn on data uploading for the Telemetry Agent  <br/> |Set this setting to Disabled to stop uploading data to the shared folder.  <br/> |

<a name="Delete"> </a>

## Delete telemetry and inventory data that is stored on client computers

Disabling logging does not delete the data that has already been collected from a computer. To delete this data on the local client computer, delete the files evt.tbl, sln.tbl, user.tbl that are located under %LocalAppData%\Microsoft\Office\16.0\Telemetry.

## Related topics

- [Compatibility and telemetry in Office](compatibility-and-telemetry-in-office.md)
- [Deploy Telemetry Dashboard](deploy-telemetry-dashboard.md)
- [Data that the telemetry agent collects in Office](data-that-the-telemetry-agent-collects-in-office.md)

