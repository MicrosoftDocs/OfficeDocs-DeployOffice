---
title: "Required service data for Office"
ms.author: danbrown
author: DHB-MSFT
manager: laurawi
audience: ITPro
ms.topic: reference
ms.service: o365-proplus-itpro
localization_priority: Priority
ms.collection: Ent_O365
ms.custom: 
- Ent_Office_ProPlus
- Ent_Office_Privacy
description: "Provides Office admins with an overview of required service data that is collected about connected experiences in Office."
hideEdit: true
---
# Required service data for Office 

> [!IMPORTANT]
> The information in this article applies to Version 1904 or later of the following Office client software installed on a computer running Windows:
> - Office 365 ProPlus and Office 365 Business
> - Office 365 Personal, Office 365 Home, or other versions of Office that are part of an Office 365 subscription.
> - Project and Visio that come with some subscription plans, such as the Project Online Professional plan or Visio Online Plan 2.
>
> The information also applies to Version 16.28 or later of the following Office for Mac applications: Excel, Outlook, OneNote, PowerPoint, and Word.

Office consists of client software applications and connected experiences designed to enable you to create, communicate, and collaborate more effectively. Working with others on a document stored on OneDrive for Business or translating the contents of a Word document into a different language are examples of connected experiences.

Required service data is crucial because it enables us to deliver these cloud-based connected experiences and help make these experiences secure and perform as expected for our customers. Three types of information make up required service data.

- **Customer content**, which is content you create using Office, such as text typed in a Word document, and is used in conjunction with the connected experience.
- **Functional data**, which includes information needed by a connected experience to perform its task, such as configuration information about the app.
- **Service diagnostic data**, which is the data necessary to keep the service secure, up to date, and performing as expected. Because this data is strictly related to the connected experience, it is separate from required or optional diagnostic data levels.

## Example of required service data for a connected experience

To help you understand required service data, the following is an example scenario using PowerPoint Designer, which is a connected experience you can use when creating slides for a presentation. PowerPoint Designer helps you improve your slides by automatically generating design ideas to choose from. While you're putting content on a slide, Designer works in the background to match that content to professionally designed layouts.

The required service data that is sent to Microsoft to enable this connected experience for you could include the following:

- *Customer content*, such as the text or images you added to your slide.
- *Functional data*, such as which slide you are working on and its layout.
- *Service diagnostic data*, such as events that tell us if the design idea was correctly applied to your slide and that the service calls were performing correctly.

## View and manage required service data

You can see service diagnostic data by using the Diagnostic Data Viewer. For more information, see [Examples of events for service diagnostic data](#examples-of-events-for-service-diagnostic-data).

We give you the ability to choose which types of connected experiences you want to use in Office, which then determines what required service data is sent to us. PowerPoint Designer, for example, is one of several connected experiences that analyzes your content. If you choose to turn off connected experience that analyze content, no required service data about PowerPoint Designer is sent to us because PowerPoint Designer won’t be available to use.

Required service data is also collected and sent to Microsoft for the essential services of Office, such as the licensing service that confirms that you are properly licensed to use Office. This data for essential services is sent regardless of any other privacy-related settings that you have configured.

For more information, see the following:

- [Connected experiences in Office](connected-experiences.md)
- [Essential services for Office](essential-services.md)
- [Using the Diagnostic Data Viewer with Office](https://support.office.com/article/cf761ce9-d805-4c60-a339-4e07f3182855)

If you’re the admin for your organization, you might also be interested in the following:

- [Overview of privacy controls for Office 365 ProPlus](overview-privacy-controls.md)
- [Use policy settings to manage privacy controls for Office 365 ProPlus](manage-privacy-controls.md)
- [Use preferences to manage privacy controls for Office for Mac](mac-privacy-preferences.md)

## Examples of events for service diagnostic data

Service diagnostic data appears in the Diagnostic Data Viewer and is organized into the same categories that required and optional diagnostic data use. For example, *Product and service usage* or *Product and service performance.*

The events for service diagnostic data provide us necessary information about whether a connected experience is performing as a customer would expect. For example, whether the service used by the connected experience started successfully and was available when needed, whether there were errors or other unexpected issues (crashes) when interacting with the service, and the responsiveness or performance of the service.

The following table provides some examples of events for service diagnostic data.

| **Name**      | **Description**    |
| ---------- | --------------------- |
| Office.Excel.Coauth.SaveXrr     | An event triggered in Excel when using the collaboration service that reports details on individual revisions that are written to the revision log. This provides latency monitoring and indicates errors in Excel that are related to the collaboration  |
| Office.Excel.Coauth.CloseWorkbook  | An event triggered in Excel when using the collaboration service that reports when a workbook is closed. This is needed in determining any errors with reload and auto-refresh. It provides success measurement for collaboration service activities.   |
| Office.Security.OCX.NonTrustedEncounter    | An event triggered in Office applications (including Word, Excel, Outlook, PowerPoint, and Visio) when a user opens an untrusted document with an ActiveX control. It is used to broadly assess use of ActiveX controls embedded in Office documents and to drive security mitigations in response to security incidents.  |
| Office.Security.UrlReputation.GetUrlReputation | An event triggered in Office applications (including Word, Excel, PowerPoint, Visio, and Publisher) that tracks the success or failure of Safe Links calls. It is used to make sure that the Safe Links service is working properly and to diagnose any problems.  |
| Office.Voice.VoiceManager.StreamingAudio   | An event triggered in Office applications (including Word, Outlook, and PowerPoint) that provides information about the health of audio streaming to the speech service. It contains information about the size of audio streamed and any errors that may have occurred. This information is used to monitor the service health and to diagnose any issues that may have been reported by customers. |
