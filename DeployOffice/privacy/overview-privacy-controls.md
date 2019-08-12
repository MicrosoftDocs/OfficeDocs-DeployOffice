---
title: "Overview of privacy controls for Office 365 ProPlus"
ms.author: danbrown
author: DHB-MSFT
manager: laurawi
audience: ITPro
ms.topic: conceptual
ms.service: o365-proplus-itpro
localization_priority: Priority
ms.collection: 
- Ent_O365
- M365-modern-desktop
ms.custom: 
- Ent_Office_ProPlus
- Ent_Office_Privacy
description: "Provides Office admins with an overview of privacy controls for Office 365 ProPlus, including for diagnostic data and connected experiences."
hideEdit: true
---

# Overview of privacy controls for Office 365 ProPlus

Microsoft is committed to providing you with the information and controls you need to make choices about how your data is collected and used when you’re using Office 365 ProPlus.

Starting with Version 1904 of Office 365 ProPlus (which was released in Monthly Channel on April 29, 2019), we are providing you with new, updated, and improved privacy controls for the following areas:
- ***Diagnostic data*** that is collected and sent to Microsoft about Office client software being used on computers running Windows in your organization.
- ***Connected experiences*** that use cloud-based functionality to provide enhanced Office features to you and your users.

As part of these changes, there are new and updated user interface (UI) elements and policy settings.

> [!IMPORTANT]
> - These changes apply to Access, Excel, OneNote, Outlook, PowerPoint, Publisher, and Word.
> - These changes also apply to the following:
>   - Version 16.28 or later of the following Office for Mac applications: Excel, Outlook, OneNote, PowerPoint, and Word.
>   - Version 1904 or later of the desktop versions of Project and Visio that come with some subscription plans, such as the Project Online Professional plan or Visio Online Plan 2.
> - The privacy controls released in Version 1904 are expected to be available in Semi-Annual Channel (Targeted) in September 2019 and in Semi-Annual Channel in January 2020.
> - We will be extending these new and improved privacy controls to additional Office clients, including Teams and our mobile apps. We’ll provide more information about those changes in the upcoming months. We will continue to carefully listen to your feedback and make improvements across all Office 365 clients and services.

## Diagnostic data sent from Office 365 ProPlus to Microsoft

Diagnostic data is used to keep Office secure and up-to-date, detect, diagnose and remediate problems, and also make product improvements. This data does not include a user’s name or email address, the content of the user’s files, or information about apps unrelated to Office.

This diagnostic data is collected and sent to Microsoft about Office client software being used on computers running Windows in your organization.

There are three levels of diagnostic data for Office 365 ProPlus client software that you can choose from:

- **Required** The minimum data necessary to help keep Office secure, up-to-date, and performing as expected on the device it’s installed on.

- **Optional** Additional data that helps us make product improvements and provides enhanced information to help us detect, diagnose, and remediate issues.

- **Neither** No diagnostic data about Office client software running on the user’s device is collected and sent to us. This option, however, significantly limits our ability to detect, diagnose, and remediate problems your users may encounter using Office.

Required diagnostic data could include, for example, information about the version of Office installed on the device or include information that indicates that Office applications are crashing when trying to open documents. Optional diagnostic data could include information about the time it takes to save a document, which could indicate an issue specific to saving to your device.

If you choose to send us optional diagnostic data, required diagnostic data is also included.

As an admin for your organization, you’ll be able to use a policy setting to choose which level of diagnostic data is sent to us. Optional diagnostic data will be sent to Microsoft unless you change the setting. Providing optional diagnostic data better enables the Office engineering team at Microsoft to detect, diagnose, and mitigate issues to reduce impacts to your organization.

Your users won’t be able to change the diagnostic data level for their devices if they are signed in to Office with their organizational credentials, which is sometimes referred to as a work or school account.

This diagnostic data doesn’t include names of users, their email addresses, or the content of their Office files. Our system creates a unique ID that it associates with your user’s diagnostic data. When we receive diagnostic data showing that one of our apps crashed 100 times, this unique ID lets us determine if it was a single user who crashed 100 times or if it was 100 different users who each crashed once. We don’t use this unique ID to identify a specific user.

To see what diagnostic data is being sent to Microsoft, you can use the Diagnostic Data Viewer, which you can download and install for free from the Microsoft Store.

For more information, see the following:

- [Required diagnostic data for Office](required-diagnostic-data.md)
- [Optional diagnostic data for Office](optional-diagnostic-data.md)
- [Use policy settings to manage privacy controls for Office 365 ProPlus](manage-privacy-controls.md)
- [Use preferences to manage privacy controls for Office for Mac](mac-privacy-preferences.md)
- [Using the Diagnostic Data Viewer with Office](https://support.office.com/article/cf761ce9-d805-4c60-a339-4e07f3182855)

## Connected experiences for Office 365 ProPlus

Office 365 ProPlus consists of client software applications and connected experiences designed to enable you to create, communicate, and collaborate more effectively. Working with others on a document stored on OneDrive for Business or translating the contents of a Word document into a different language are examples of connected experiences.

We understand that you might want to choose which types of connected experiences are available to your users when working in Office applications. As an admin for your organization, you’ll have policy settings that allow you to choose whether to provide the following types of connected experiences to your users:

- **Experiences that analyze your content** Experiences that use your Office content to provide you with design recommendations, editing suggestions, data insights, and similar features. For example, PowerPoint Designer or Editor in Word.

- **Experiences that download online content** Experiences that allow you to search and download online content including templates, images, 3D models, videos, and reference materials to enhance your documents. For example, Office templates or PowerPoint QuickStarter.

For example, you might choose to provide your users with connected experiences that download online content, but not connected experiences that analyze content. If you don’t configure these policy settings, all these connected experiences will be available to your users.

In addition, there is a policy setting that allows you turn off all these connected experiences, and which will also turn off other connected experiences, such as document co-authoring and online file storage. But even if you use this policy setting to turn off all these connected experiences, certain Office functionality will remain available, such as synching your mailbox in Outlook, using Teams or Skype for Business, as well as the essential services described below.

If you choose not to provide your users with certain types of connected experiences, either the ribbon or menu command for those connected experiences will be grayed out or the users will get an error message when they try to use those connected experiences.

Your users won’t be able to choose whether to turn these connected experiences on or off if they are signed in to Office with their organizational credentials, which is sometimes referred to as a work or school account.

For more information, see the following:

- [Connected experiences in Office](connected-experiences.md)
- [Use policy settings to manage privacy controls for Office 365 ProPlus](manage-privacy-controls.md)
- [Use preferences to manage privacy controls for Office for Mac](mac-privacy-preferences.md)

## Optional connected experiences for Office 365 ProPlus

In addition to the connected experiences mentioned above that are included with Office 365 ProPlus, there are optional connected experiences that you may choose to allow your users to access with their organization account. For example, the LinkedIn features of the Resume Assistant in Word or the 3D Maps feature in Excel, which uses Bing.

These are optional connected experiences that are not covered by your organization’s commercial agreement with Microsoft but are governed by separate terms and conditions. Optional connected experiences offered by Microsoft directly to your users are governed by the [Microsoft Services Agreement](https://www.microsoft.com/servicesagreement) instead of the [Online Services Terms](https://www.microsoft.com/licensing/product-licensing/products).

Because these optional connected experiences are governed by separate terms and conditions, you manage them separately from the connected experiences mentioned above. As an admin for your organization, you’ll be able to use a policy setting to choose whether to make these optional connected experiences available, as a group, to your users. If you don’t configure this policy setting, these optional connected experiences are available to your users.

Even if you choose to make these optional connected experiences available to your users, your users will have the option to turn these optional connected experiences off as a group by going to the [privacy settings dialog box](https://support.office.com/article/3e7bc183-bf52-4fd0-8e6b-78978f7f121b). Your users will only have this choice if they are signed in to Office with their organizational credentials (sometimes referred to as a work or school account), not if they are signed in with a personal email address.

For more information, see the following:

- [Overview of optional connected experiences in Office](optional-connected-experiences.md)
- [Use policy settings to manage privacy controls for Office 365 ProPlus](manage-privacy-controls.md)
- [Use preferences to manage privacy controls for Office for Mac](mac-privacy-preferences.md)

## Required service data for connected experiences

Required service data is data that enables us to deliver these cloud-based connected experiences and help make these experiences secure and perform as expected. Three types of information make up required service data.

- **Customer content**, which is content you create using Office, such as text typed in a Word document.
- **Functional data**, which includes information needed by a connected experience to perform its task, such as configuration information about the app.
- **Service diagnostic data**, which is the data necessary to keep the service secure, up to date, and performing as expected. Because this data is strictly related to the connected experience, it is separate from required or optional diagnostic data levels.

To help you understand required service data, the following is an example scenario using PowerPoint Designer, which is a connected experience you can use when creating slides for a presentation. PowerPoint Designer helps you improve your slides by automatically generating design ideas to choose from. While you're putting content on a slide, Designer works in the background to match that content to professionally designed layouts.

The required service data that is sent to Microsoft to enable this connected experience for you could include the following:

- *Customer content*, such as the text or images you added to your slide.
- *Functional data*, such as which slide you are working on and its layout.
- *Service diagnostic data*, such as events that tell us if the design idea was correctly applied to your slide and that the service calls were performing correctly.

If you choose not to provide your users with the category of connected experiences that includes PowerPoint Designer, the feature will be turned off and none of this required service data is sent to us.

For more information, see [Required service data for Office](required-service-data.md).

## Essential services for Office 365 ProPlus

There are also a set of services that are essential to how Office 365 ProPlus functions and cannot be disabled. For example, the licensing service that confirms that you are properly licensed to use Office 365 ProPlus. Required service data about these services is collected and sent to Microsoft, regardless of any other policy settings that you have configured.

For more information, see [Essential services for Office](essential-services.md).

## Related topics
- [Privacy at Microsoft](https://privacy.microsoft.com/)
- [Windows privacy](https://docs.microsoft.com/windows/privacy/)
