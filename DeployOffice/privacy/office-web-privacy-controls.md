---
title: "Use policy settings to manage privacy controls for Office for the web applications"
description: "Provides Office admins with information about how to manage privacy settings for Office for the web applications."
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

# Use policy settings to manage privacy controls for Office for the web applications

> [!NOTE]
> For a list of Office products covered by this privacy information, see [Privacy controls available for Office products](products-versions-privacy-controls.md).

As an administrator for your organization, you can control whether your users have the choice to use optional connected experiences when they use Office for the web applications, such as Word for the web or PowerPoint for the web. This choice is available to your users only if they're signed in with their work or school account when they use Office for the web applications. To control whether your users have the choice to use optional connected experiences, you use the *Allow the use of additional optional connected experiences in Office* policy setting.

## Overview of optional connected experiences

Optional connected experiences are cloud-backed services that are available to your users when they’re using Office. Examples of optional connected experiences include creating a map chart in Excel or inserting an online picture into your Word document, both of which rely on services provided by Microsoft Bing. The use of these cloud-backed services is optional.

Optional connected experiences aren't covered by your organization’s commercial agreement with Microsoft. Instead, optional connected experiences are offered by Microsoft directly to your users and are governed by the [Microsoft Services Agreement](https://www.microsoft.com/servicesagreement). In some cases, third-party content or functionality are provided through these optional connected experiences and other terms may also apply.

Some optional connected experiences might not be available in Office for the web applications, but are available when using other versions of Office, such as the desktop version on a device running Windows.

For more information, see [Overview of optional connected experiences in Office](optional-connected-experiences.md).

## Configure the policy setting by using Cloud Policy

You can use the *Allow the use of additional optional connected experiences in Office* policy setting to control whether your users have the choice to use optional connected experiences. To configure this policy setting for Office for the web applications, you need to use [Cloud Policy](../admincenter/overview-cloud-policy.md).  

If you don’t configure this policy setting, the choice to use optional connected experiences will be available to your users. If you disable this policy setting, your users won’t be able to use any of the optional connected experiences.

For Office for the web applications, the policy setting applies to when your users are working on Office documents that are saved to web-based storage from Microsoft, such as OneDrive or SharePoint.

Because you’re using Cloud Policy, this policy setting also applies to when your users are using Office on Windows, Mac, iOS, or Android devices. You can’t configure this policy setting just for when your users are using Office for the web applications. But, you can create a policy configuration that includes this policy setting and have that policy configuration only apply to users that access documents anonymously using Office for the web applications.

If you choose to make optional connected experiences available to your users, your users will be shown a privacy notification the first time they use an Office for the web app. This notification lets your users know that you’ve given them the option to use these optional connected experiences. The notification also informs your users that the optional connected experiences are provided under the Microsoft Services Agreement. Because this notification is important information for your users, this notification must be shown and can't be turned off, hidden, or accepted on behalf of your users.

## Users can choose to turn off optional connected experiences

If you choose to make optional connected experiences available to your users, your users can go to their [account privacy settings](https://support.microsoft.com/office/3e7bc183-bf52-4fd0-8e6b-78978f7f121b#ID0EAADAAA=Online&ID0EBBH=Web) and choose to turn off their access to optional connected experiences. This choice is available in the account privacy settings only if your users are signed in with their work or school account. There's no way that you, as the admin, can prevent individual users in your organization from turning off their access to optional connected experience in their account privacy settings if you've given your users the choice to use optional connected experiences.

## Related articles

- [Overview of privacy controls for Microsoft 365 Apps for enterprise](overview-privacy-controls.md)
- [Use policy settings to manage privacy controls for Microsoft 365 Apps for enterprise](manage-privacy-controls.md)
- [Use preferences to manage privacy controls for Office for Mac](mac-privacy-preferences.md)
- [Use preferences to manage privacy controls for Office on iOS devices](ios-privacy-preferences.md)
- [Use policy settings to manage privacy controls for Office on Android devices](android-privacy-controls.md)