---
title: "Optional diagnostic data for Office"
description: "Provides Office admins with information about optional diagnostic data in Office, including some examples of events."
author: DHB-MSFT
ms.author: danbrown
manager: laurawi
ms.topic: conceptual
ms.service: o365-proplus-itpro
ms.localizationpriority: high
ms.collection: privacy-microsoft365
hideEdit: true
ms.date: 05/31/2024
---

# Optional diagnostic data for Office

> [!NOTE]
> For a list of Office products covered by this privacy information, see [Privacy controls available for Office products](products-versions-privacy-controls.md).

Diagnostic data is used to keep Office secure and up-to-date, detect, diagnose and fix problems, and also make product improvements. This data doesn't include a user’s name or email address, the content of the user’s files, or information about apps unrelated to Office.

This diagnostic data is collected and sent to Microsoft about Office client software running on the user's device. Some diagnostic data is required, while some diagnostic data is optional. We give you the ability to choose whether to send us required or optional diagnostic data through the use of privacy controls, such as policy settings for organizations. You can see the diagnostic data being sent to us by using the Diagnostic Data Viewer.

> [!NOTE]
> If you're using a version of Office 2019 or Office 2016 that doesn't give you or your admin the ability to choose whether to send us required or optional diagnostic data, then only required diagnostic data is sent. For example, if you're using Office Professional Plus 2019 or Office Standard 2016, which don't provide that choice, then only required diagnostic data is sent. Office 2013 doesn't send required or optional diagnostic data. For more information about which versions of Office provide this choice, see [Privacy controls available for Office products](products-versions-privacy-controls.md).

***Optional diagnostic data*** is additional data that helps us make product improvements and provides enhanced information to help us detect, diagnose, and fix issues. This data may also be used in aggregate to train and improve experiences powered by machine learning, such as recommended actions, text predictions, and contextual help.

If you choose to send us optional diagnostic data, required diagnostic data is also included. Also, diagnostic log files for Office, which contain information very similar to optional diagnostic data, might be sent. For more information about those log files, see [Overview of diagnostic log files for Office](https://support.microsoft.com/office/fba86aac-70dc-4858-ae1f-ec2034346cdf).

Examples of optional diagnostic data include data we collect about the shapes users insert into Word documents so we can provide better options, and data we collect about the time it takes for a PowerPoint slide to appear on your screen so we can improve the experience if it’s slow.

For more information about diagnostic data, see the following articles:

- [Required diagnostic data for Office](required-diagnostic-data.md)
- [Using the Diagnostic Data Viewer with Office](https://support.microsoft.com/office/cf761ce9-d805-4c60-a339-4e07f3182855)

If you’re the admin for your organization, you might also be interested in the following articles:

- [Overview of privacy controls for Microsoft 365 Apps for enterprise](overview-privacy-controls.md)
- [Use policy settings to manage privacy controls for Microsoft 365 Apps for enterprise](manage-privacy-controls.md)
- [Use preferences to manage privacy controls for Office for Mac](mac-privacy-preferences.md)
- [Use preferences to manage privacy controls for Office on iOS devices](ios-privacy-preferences.md)
- [Use policy settings to manage privacy controls for Office on Android devices](android-privacy-controls.md)

## Categories of optional diagnostic data

Optional diagnostic data is organized into the following categories:

- Software setup and inventory
- Product and service usage
- Product and service performance
- Device connectivity and configuration

These categories are shown in the Diagnostic Data Viewer and are the same categories used with required diagnostic data.

The following sections provide a description of each category and examples of events for each category.

## Software setup and inventory events

This category includes events that may cover the following areas:

- Installed product and version and the installation status
- Software add-ins and their settings​.
- Document, feature, and add-in error conditions that may compromise security, including product update readiness.

The following table provides examples of events in this category and a description of those events.

| **Event name**   | **Event description**  |
| ---- | ---- |
| Office.Extensibility.AppCommands.GetRibbonUpdatesForUserId | This event indicates whether Word successfully updates the Ribbon in the Word user interface when the user changes their identity. We use this event to detect incorrect setup and other issues that would affect the Office user interface. |
| Office.Extensibility.AppCommands.AppCmdInstall   | This event provides information about the Office add-in that the user has installed, including app ID, operating system build and version, success of installation, and duration of install.  |

## Product and service usage events

This category includes events that may cover the following areas:

- Success of application functionality. Limited to opening and closing of the application and documents, file editing, and file sharing (collaboration).​
- Determination if specific feature events have occurred, such as start or stop, and if feature is running​.
- Office accessibility features

The following table provides examples of events in this category and a description of those events.

| **Event name**   | **Event description**  |
| ------ | ------- |
| Office.Word.Commanding.Highlight  | This event indicates Word has executed the command to highlight text. We use this event to detect errors in the text-highlight command.  |
| Office.Translator.AddInLoaded   | A heartbeat to indicate that Translator feature has been loaded and rendered successfully.  |
| Office.Graphics.GVizInsertShape |Tracks the usage of the Insert Shape feature in Word and also reports details of types of shapes inserted and from which source.| 
| Office.PowerPoint.PPT.Desktop.SummaryZoomInsertionRule   | This event determines if there are any sections present in a document when the user is inserting Summary Zoom and if the user chooses to delete existing sections. |
| Office.Security.SecureReaderHost.ProtectedViewValidation | Tracks when and why a file is opened in Protected View. Used to diagnose conditions where Protected View may not be correctly triggered to ensure the feature is working properly. |

## Product and service performance events

This category includes events that may cover the following areas:

- Unexpected application exits (crashes) and the state of the application when that happens​.
- Poor response time or performance for scenarios such as application startup or opening a file.
- Errors in functionality of a feature or user experience.

The following table provides examples of events in this category and a description of those events.

| **Event name**    | **Event description**   |
| --------------- | -------------- |
| Office.Word.Word.CoreSaveTime100ns     | This event logs the performance of a document save activity by Word. We use this event to detect errors and performance issues in the Word save document activity.|
| Office.Identity.SignInForWamAccountAad  | This event is sent when a user is signed in to a Microsoft Entra ID account with Web Account Manager (WAM) library. This event sends metadata such as AppName, AppVersion, and ErrorCode if the event failed. |
| Office.PowerPoint.PPT.Desktop.FileOpen.FirstSlideMasterThumbnailRenderTime | This event collects the length of time it takes to render the first slide master thumbnail in PowerPoint.  |
| Office.Extensibility.Diagnostics   | This event provides general diagnostic information for Office add-ins, such as crash reports for debugging.|

## Device connectivity and configuration events

This category includes events that may cover the following areas:

- Network connection state and device settings, such as memory.​

The following table provides examples of events in this category and a description of those events.

| **Event name**                    | **Event description**                                                                                                                                                     |
| ------ | ----- |
| Office.Graphics.ArtViewValidate | This event logs validation the results of Graphics View that supports Graphics User Interface. We use the event to collect usage and error data about graphics rendering. |
| Office.Graphics.ARCExceptionScope | This event tracks rendering failures coming from the rendering engine. |
| Office.Extensibility.ODPLatency   | This event provides information about the user’s network connection and speed.     |
