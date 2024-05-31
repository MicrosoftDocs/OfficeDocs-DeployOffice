---
title: "Use preferences to manage privacy controls for Office on iOS devices"
description: "Provides Office admins with information about how to manage privacy settings on iOS devices."
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

# Use preferences to manage privacy controls for Office on iOS devices

> [!NOTE]
> For a list of Office products covered by this privacy information, see [Privacy controls available for Office products](products-versions-privacy-controls.md).

There are new preference settings for Office on iOS devices that allow you to control settings related to the following:

- ***Diagnostic data*** that is collected and sent to Microsoft about Office client software being used.

- ***Connected experiences*** that use cloud-based functionality to provide enhanced Office features to you and your users.

For more information about diagnostic data and connected experiences, see [Overview of privacy controls](overview-privacy-controls.md).

> [!NOTE]
> For information about similar settings for Office on computers running macOS, see [Use preferences to manage privacy controls for Office for Mac](mac-privacy-preferences.md)

## Setting device preferences
These new preference settings can also be set at the device level by a Mobile Device Management (MDM) server when the Office application is installed. Many MDM servers allow IT administrators to add an optional configuration dictionary when the server sends the `InstallApplication` MDM command to an iOS device. Refer to your MDM server documentation for more details.

The dictionary is represented as a set of key/value pairs in XML format. For example:

```xml
<dict>
	<key>DiagnosticDataTypePreference</key>
	<string>BasicDiagnosticData</string>
</dict>
```

Once sent to the device, the configuration dictionary will reside under the `com.apple.managed.configuration` key, where it will be read when the Office application is launched.

> [!NOTE]
> You can also use Cloud Policy and these 4 policy settings:
> - Configure the level of client software diagnostic data sent by Office to Microsoft
> - Allow the use of connected experiences in Office that analyze content
> - Allow the use of connected experiences in Office that download online content
> - Allow the use of additional optional connected experiences in Office
>
> Privacy settings for Outlook for iOS and OneDrive for iOS can only be configured by using Cloud Policy.
>
> For more information on using Cloud Policy, see [Overview of Cloud Policy service for Microsoft 365](../admincenter/overview-cloud-policy.md).

## Preference setting for diagnostic data

Diagnostic data is used to keep Office secure and up-to-date, detect, diagnose and remediate problems, and also make product improvements. For more information, see [Diagnostic data sent from Microsoft 365 Apps for enterprise to Microsoft](overview-privacy-controls.md#diagnostic-data-sent-from-microsoft-365-apps-for-enterprise-to-microsoft).

|Category|Details|
|:-----|:-----|
|**Key**  | `DiagnosticDataTypePreference`  |
|**Data Type**  | String |
|**Possible values**  | `BasicDiagnosticData` *(this value sets the level to Required)* <br/> `FullDiagnosticData` *(this value sets the level to Optional)* <br/> `ZeroDiagnosticData` *(this value sets the level to Neither)* |

If you don't set this preference, both required and optional diagnostic data are sent to Microsoft if users with a Microsoft 365 (or Office 365) subscription are signed in with a work or school account. Also, these users can't change the level of diagnostic data regardless of how you set this preference.

For other users, such as home users with a Microsoft 365 subscription, only required diagnostic data is sent, unless the user chooses to also send optional diagnostic data by going to **Settings** > **Privacy Settings**.

## Preference setting for connected experiences that analyze your content

Connected experiences that analyze your content are experiences that use your Office content to provide you with design recommendations, editing suggestions, data insights, and similar features. For example, PowerPoint Designer. For a list of these connected experiences, see [Connected experiences that analyze your content](connected-experiences.md#connected-experiences-that-analyze-your-content).

|Category|Details|
|:-----|:-----|
|**Key**  | `OfficeExperiencesAnalyzingContentPreference`  |
|**Data Type**  | Boolean |
|**Possible values**  | `TRUE` *(enabled)* <br/> `FALSE` *(disabled)*|

If you don't set this preference, connected experiences that analyze content are available to users.

If the user has  subscription and is signed in with a work or school account, then the user can't turn off connected experiences that analyze content.

For other users, such as home users with a Microsoft 365 subscription, the user can choose to turn off connected experiences that analyze content by going to **Settings** > **Privacy Settings**.

## Preference setting for connected experiences that download online content

Connected experiences that download online content are experiences that allow you to search and download online content including templates, images, videos, and reference materials to enhance your documents. For example, Office templates or cloud fonts. For a list of these connected experiences, see [Connected experiences that download online content](connected-experiences.md#connected-experiences-that-download-online-content).

|Category|Details|
|:-----|:-----|
|**Key**  | `OfficeExperiencesDownloadingContentPreference`  |
|**Data Type**  | Boolean |
|**Possible values**  | `TRUE` *(enabled)* <br/> `FALSE` *(disabled)*|

If you don't set this preference, connected experiences that download online content are available to users.

If the user has a Microsoft 365 (or Office 365) subscription and is signed in with a work or school account, then the user can't turn off connected experiences that download online content.

For other users, such as home users with a Microsoft 365 subscription, the user can choose to turn off connected experiences that download online content by going to **Settings** > **Privacy Settings**.

## Preference setting for optional connected experiences

In addition to the connected experiences mentioned above, there are some optional connected experiences that you may choose to allow your users to access with their organization account, which is sometimes referred to as a work or school account. For example, Office add-ins that are downloaded through the Office Store to your device. For more examples, see [Overview of optional connected experiences in Office](optional-connected-experiences.md).

|Category|Details|
|:-----|:-----|
|**Key**  | `OptionalConnectedExperiencesPreference`  |
|**Data Type**  | Boolean |
|**Possible values**  | `TRUE` *(enabled)* <br/> `FALSE` *(disabled)*|

If you don't set this preference, optional connected experiences are available to users with a Microsoft 365 (or Office 365) subscription that are signed in with a work or school account. Unless you have set this preference to FALSE, these users can choose to turn off optional connected experiences by going to **Settings** > **Privacy Settings**.

For other users, such as home users with a Microsoft 365 subscription, there isn't an option to turn off optional connected experiences.