---
title: "Overview of privacy controls for Microsoft 365 Apps for enterprise"
description: "Provides Office admins with an overview of privacy controls for Microsoft 365 Apps for enterprise, including for diagnostic data and connected experiences."
author: DHB-MSFT
ms.author: danbrown
manager: laurawi
ms.topic: conceptual
ms.service: o365-proplus-itpro
ms.localizationpriority: high
ms.collection: 
 - privacy-microsoft365
 - essentials-privacy
hideEdit: true
ms.date: 05/31/2024
---

# Overview of privacy controls for Microsoft 365 Apps for enterprise

> [!NOTE]
> For a list of Office products covered by this privacy information, see [Privacy controls available for Office products](products-versions-privacy-controls.md).

Microsoft is committed to providing you with the information and controls you need to make choices about how your data is collected and used when you’re using Microsoft 365 Apps for enterprise.

Starting with Version 1904 of Microsoft 365 Apps for enterprise, we're providing you with new, updated, and improved privacy controls for the following areas:
- ***Diagnostic data*** that is collected and sent to Microsoft about Office client software running on the user's device in your organization.
- ***Connected experiences*** that use cloud-based functionality to provide enhanced Office features to you and your users.

As part of these changes, there are new and updated user interface (UI) elements and policy settings.

## Diagnostic data sent from Microsoft 365 Apps for enterprise to Microsoft

Diagnostic data is used to keep Office secure and up-to-date, detect, diagnose and remediate problems, and also make product improvements. This data doesn't include a user’s name or email address, the content of the user’s files, or information about apps unrelated to Office.

This diagnostic data is collected and sent to Microsoft about Office client software running on the user's device in your organization.

There are three levels of diagnostic data for Microsoft 365 Apps for enterprise client software that you can choose from:

- **Required** The minimum data necessary to help keep Office secure, up-to-date, and performing as expected on the device it’s installed on.

- **Optional** Additional data that helps us make product improvements and provides enhanced information to help us detect, diagnose, and remediate issues. This data may also be used in aggregate to train and improve experiences powered by machine learning, such as recommended actions, text predictions, and contextual help.

- **Neither** No diagnostic data about Office client software running on the user’s device is collected and sent to us. This option, however, significantly limits our ability to detect, diagnose, and remediate problems your users may encounter using Office.

Required diagnostic data could include, for example, information about the version of Office installed on the device or include information that indicates that Office applications are crashing when trying to open documents. Optional diagnostic data could include information about the time it takes to save a document, which could indicate an issue specific to saving to your device.

If you choose to send us optional diagnostic data, required diagnostic data is also included.

> [!NOTE]
> Even if you choose Neither, required service data will be sent from the user's device to Microsoft. For more information, see [Required service data for Office](required-service-data.md).

As an admin for your organization, you’ll be able to use a policy setting to choose which level of diagnostic data is sent to us. Optional diagnostic data will be sent to Microsoft unless you change the setting. Providing optional diagnostic data better enables the Office engineering team at Microsoft to detect, diagnose, and mitigate issues to reduce impacts to your organization.

Your users won’t be able to change the diagnostic data level for their devices if they're signed in to Office with their organizational credentials, which is sometimes referred to as a work or school account.

This diagnostic data doesn’t include names of users, their email addresses, or the content of their Office files. Our system creates a unique ID that it associates with your user’s diagnostic data. When we receive diagnostic data showing that one of our apps crashed 100 times, this unique ID lets us determine if it was a single user who crashed 100 times or if it was 100 different users who each crashed once. We don’t use this unique ID to identify a specific user.

To see what diagnostic data is being sent to Microsoft, you can use the Diagnostic Data Viewer, which you can download and install for free from the Microsoft Store.

For more information, see the following articles:

- [Required diagnostic data for Office](required-diagnostic-data.md)
- [Optional diagnostic data for Office](optional-diagnostic-data.md)
- [Use policy settings to manage privacy controls for Microsoft 365 Apps for enterprise](manage-privacy-controls.md)
- [Use preferences to manage privacy controls for Office for Mac](mac-privacy-preferences.md)
- [Use preferences to manage privacy controls for Office on iOS devices](ios-privacy-preferences.md)
- [Use policy settings to manage privacy controls for Office on Android devices](android-privacy-controls.md)
- [Using the Diagnostic Data Viewer with Office](https://support.microsoft.com/office/cf761ce9-d805-4c60-a339-4e07f3182855)

## Connected experiences for Microsoft 365 Apps for enterprise

Microsoft 365 Apps for enterprise consists of client software applications and connected experiences designed to enable you to create, communicate, and collaborate more effectively. Working with others on a document stored on OneDrive for Business or translating the contents of a Word document into a different language are examples of connected experiences.

We understand that you might want to choose which types of connected experiences are available to your users when working in Office applications. As an admin for your organization, you’ll have policy settings that allow you to choose whether to provide the following types of connected experiences to your users:

- **Experiences that analyze your content** Experiences that use your Office content to provide you with design recommendations, editing suggestions, data insights, and similar features. For example, PowerPoint Designer or Translator.

- **Experiences that download online content** Experiences that allow you to search and download online content including templates, images, 3D models, videos, and reference materials to enhance your documents. For example, Office templates or PowerPoint QuickStarter.

For example, you might choose to provide your users with connected experiences that download online content, but not connected experiences that analyze content. If you don’t configure these policy settings, all these connected experiences will be available to your users.

In addition, there's a policy setting that allows you turn off all these connected experiences, and which will also turn off other connected experiences, such as document coauthoring and online file storage. But even if you use this policy setting to turn off all these connected experiences, certain Office functionality will remain available, such as synching your mailbox in Outlook, using Teams or Skype for Business, as well as the essential services described below.

If you choose not to provide your users with certain types of connected experiences, either the ribbon or menu command for those connected experiences will be grayed out or the users will get an error message when they try to use those connected experiences.

Your users won’t be able to choose whether to turn these connected experiences on or off if they're signed in to Office with their organizational credentials, which is sometimes referred to as a work or school account.

For more information, see the following articles:

- [Connected experiences in Office](connected-experiences.md)
- [Use policy settings to manage privacy controls for Microsoft 365 Apps for enterprise](manage-privacy-controls.md)
- [Use preferences to manage privacy controls for Office for Mac](mac-privacy-preferences.md)
- [Use preferences to manage privacy controls for Office on iOS devices](ios-privacy-preferences.md)
- [Use policy settings to manage privacy controls for Office on Android devices](android-privacy-controls.md)

## Optional connected experiences for Microsoft 365 Apps for enterprise

In addition to the connected experiences mentioned above that are included with Microsoft 365 Apps for enterprise, there are optional connected experiences that you may choose to allow your users to access with their organization account. For example, the 3D Maps feature in Excel, which uses Bing.

These are optional connected experiences that aren't covered by your organization’s commercial agreement with Microsoft but are governed by separate terms and conditions. Optional connected experiences offered by Microsoft directly to your users are governed by the [Microsoft Services Agreement](https://www.microsoft.com/servicesagreement) instead of the [Microsoft Product Terms](https://www.microsoft.com/licensing/docs/view/Product-Terms).

Because these optional connected experiences are governed by separate terms and conditions, you manage them separately from the connected experiences mentioned above. As an admin for your organization, you’ll be able to use a policy setting to choose whether to make these optional connected experiences available, as a group, to your users. If you don’t configure this policy setting, these optional connected experiences are available to your users.

Even if you choose to make these optional connected experiences available to your users, your users will have the option to turn off these optional connected experiences as a group by going to the [privacy settings dialog box](https://support.microsoft.com/office/3e7bc183-bf52-4fd0-8e6b-78978f7f121b). Your users will only have this choice if they're signed in to Office with their organizational credentials (sometimes referred to as a work or school account), not if they're signed in with a personal email address.

For more information, see the following articles:

- [Overview of optional connected experiences in Office](optional-connected-experiences.md)
- [Use policy settings to manage privacy controls for Microsoft 365 Apps for enterprise](manage-privacy-controls.md)
- [Use preferences to manage privacy controls for Office for Mac](mac-privacy-preferences.md)
- [Use preferences to manage privacy controls for Office on iOS devices](ios-privacy-preferences.md)
- [Use policy settings to manage privacy controls for Office on Android devices](android-privacy-controls.md)
- [Use policy settings to manage privacy controls for Office for the web applications](office-web-privacy-controls.md)

## Required service data for connected experiences

As you use a connected experience, data is sent to and processed by Microsoft to provide you that connected experience. This data is crucial because this information enables us to deliver these cloud-based connected experiences. We refer to this data as required service data.

Required service data can include information related to the operation of the connected experience that is needed to keep the underlying service secure, up to date, and performing as expected. If you choose to use a connected experience that analyzes your content, for example Translator in Word, the text you typed and selected to translate in the document is also sent and processed to provide you the connected experience. Required service data can also include information needed by a connected experience to perform its task, such as configuration information about the Office app.

For more information, see [Required service data for Office](required-service-data.md).

## Essential services for Microsoft 365 Apps for enterprise

There's also a set of services that are essential to how Microsoft 365 Apps for enterprise functions and can't be disabled. For example, the licensing service that confirms that you're properly licensed to use Microsoft 365 Apps for enterprise. Required service data about these services is collected and sent to Microsoft, regardless of any other policy settings that you have configured.

For more information, see [Essential services for Office](essential-services.md).

## Related articles
- [Privacy at Microsoft](https://privacy.microsoft.com/)
- [Windows privacy](/windows/privacy/)