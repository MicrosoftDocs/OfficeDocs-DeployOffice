---
title: "Use preferences to manage privacy controls for Office for Mac"
ms.author: danbrown
author: pbowden-msft
manager: laurawi
audience: ITPro
ms.topic: article
ms.service: o365-proplus-itpro
localization_priority: Priority
ms.collection: Ent_O365
ms.custom: 
- Ent_Office_ProPlus
- Ent_Office_Privacy
- Ent_Office_Mac
description: "Provides Office admins with information about how to use preferences to manage privacy controls for Office for Mac."
hideEdit: true
---

# Use preferences to manage privacy controls for Office for Mac

Starting with Version 16.28 of Office for Mac, there are new preference settings that allow you to control settings related to the following:

- ***Diagnostic data*** that is collected and sent to Microsoft about Office client software being used.

- ***Connected experiences*** that use cloud-based functionality to provide enhanced Office features to you and your users.

In addition, there is a new preference setting related to a **Required Data Notice** dialog for Microsoft AutoUpdate (MAU).

For more information about diagnostic data and connected experiences, see [Overview of privacy controls](overview-privacy-controls.md).

> [!NOTE]
> - For information about similar settings for Office on computers running Windows, see [Use policy settings to manage privacy controls for Microsoft 365 Apps for enterprise](manage-privacy-controls.md).
> - For information about similar settings for Office on iOS devices, see [Use preferences to manage privacy controls for Office on iOS devices](ios-privacy-preferences.md).

## Setting preferences

These new preference settings are CFPreferences API compatible and can be set using the `defaults` command in Terminal, or enforced through a Configuration Profile or Mobile Device Management (MDM) server. When the preferences are enforced, the user cannot change the values, and any in-app controls will appear disabled.

## Preference setting for diagnostic data

Diagnostic data is used to keep Office secure and up-to-date, detect, diagnose and remediate problems, and also make product improvements. For more information, see [Diagnostic data sent from Microsoft 365 Apps for enterprise to Microsoft](overview-privacy-controls.md#diagnostic-data-sent-from-microsoft-365-apps-for-enterprise-to-microsoft).

|||
|:-----|:-----|
|**Preference Domain**  | `com.microsoft.office` |
|**Key**  | `DiagnosticDataTypePreference`  |
|**Data Type**  | String |
|**Possible values**  | `BasicDiagnosticData` *(this sets the level to Required)* <br/> `FullDiagnosticData` *(this sets the level to Optional)* <br/> `ZeroDiagnosticData` *(this sets the level to Neither)* |
|**Availability** |16.28 and later |

Starting with new installations of Version 16.30, if you don't set this preference, only required diagnostic data is sent to Microsoft if users with an Office 365 (or Microsoft 365) subscription are signed in with a work or school account or if users have a volume licensed version of Office 2019 for Mac. Also, these users can't change the level of diagnostic data regardless of how you set this preference.

> [!NOTE]
> - If you install Version 16.28 or 16.29 and you don't set this preference, both optional and required diagnostic data is sent to Microsoft. If you then upgrade to Version 16.30 or later, both optional and required diagnostic data is still sent to Microsoft, unless you use this preference to set a different value.
> - If you set this preference, it also will apply to Version 1.00.217856 and later of Teams for Mac and to Version 16.28 and later of Skype for Business for Mac.

For other users, such as home users with an Office 365 (or Microsoft 365) subscription, only required diagnostic data is sent, unless the user chooses to also send optional diagnostic data by going to **Preferences** > **Privacy**.

## Preference setting for connected experiences that analyze your content

Connected experiences that analyze your content are experiences that use your Office content to provide you with design recommendations, editing suggestions, data insights, and similar features. For example, PowerPoint Designer or Researcher in Word. For a list of these connected experiences, see [Connected experiences in Office](connected-experiences.md).

|||
|:-----|:-----|
|**Preference Domain**  | `com.microsoft.office` |
|**Key**  | `OfficeExperiencesAnalyzingContentPreference`  |
|**Data Type**  | Boolean |
|**Possible values**  | `TRUE` *(enabled)* <br/> `FALSE` *(disabled)*|
|**Availability** |16.28 and later |

If you don't set this preference, connected experiences that analyze content are available to users. 

If the user has an Office 365 (or Microsoft 365) subscription and is signed in with a work or school account or if the user has a volume licensed version of Office 2019 for Mac, then the user can't turn off connected experiences that analyze content.

For other users, such as home users with an Office 365 (or Microsoft 365) subscription, the user can choose to turn off connected experiences that analyze content by going to **Preferences** > **Privacy**.

## Preference setting for connected experiences that download online content

Connected experiences that download online content are experiences that allow you to search and download online content including templates, images, 3D models, videos, and reference materials to enhance your documents. For example, Office templates or PowerPoint QuickStarter. For a list of these connected experiences, see [Connected experiences in Office](connected-experiences.md).

|||
|:-----|:-----|
|**Preference Domain**  | `com.microsoft.office` |
|**Key**  | `OfficeExperiencesDownloadingContentPreference`  |
|**Data Type**  | Boolean |
|**Possible values**  | `TRUE` *(enabled)* <br/> `FALSE` *(disabled)*|
|**Availability** |16.28 and later |

If you don't set this preference, connected experiences that download online content are available to users.

If the user has an Office 365 (or Microsoft 365) subscription and is signed in with a work or school account or if the user has a volume licensed version of Office 2019 for Mac, then the user can't turn off connected experiences that download online content.

For other users, such as home users with an Office 365 (or Microsoft 365) subscription, a user can choose to turn off connected experiences that download online content by going to **Preferences** > **Privacy**.

## Preference setting for optional connected experiences

In addition to the connected experiences mentioned above, there are some optional connected experiences that you may choose to allow your users to access with their organization account, which is sometimes referred to as a work or school account. For example, the LinkedIn features of the Resume Assistant in Word or the Weather Bar in Outlook, which uses MSN Weather. For more examples, see [Overview of optional connected experiences in Office](optional-connected-experiences.md).

|||
|:-----|:-----|
|**Preference Domain**  | `com.microsoft.office` |
|**Key**  | `OptionalConnectedExperiencesPreference`  |
|**Data Type**  | Boolean |
|**Possible values**  | `TRUE` *(enabled)* <br/> `FALSE` *(disabled)*|
|**Availability** |16.28 and later |

If you don't set this preference, optional connected experiences are available to users with an Office 365 (or Microsoft 365) subscription that are signed in with a work or school account or users who have a volume licensed version of Office 2019 for Mac. Unless you have set this preference to `FALSE`, these users can choose to turn off optional connected experiences by going to **Preferences** > **Privacy**.

For other users, such as home users with an Office 365 (or Microsoft 365) subscription, there isn't an option to turn off optional connected experiences.

## Preference setting for most connected experiences

You can use this preference to control whether most connected experiences are available to your users.

|||
|:-----|:-----|
|**Preference Domain**  | `com.microsoft.office` |
|**Key**  | `ConnectedOfficeExperiencesPreference`  |
|**Data Type**  | Boolean |
|**Possible values**  | `TRUE` *(enabled)* <br/> `FALSE` *(disabled)*|
|**Availability** |16.28 and later |

If you don't set this preference, all connected experiences are available to your users, unless you have set one of the other preferences for connected experiences previously mentioned, such as `OfficeExperiencesAnalyzingContentPreference`.

For example, if you set this preference to `FALSE`, the following types of connected experiences won't be available to your users:
- Experiences that analyze your content
- Experiences that download online content
- Optional connected experiences

In addition, if you set this preference to `FALSE`, most other connected experiences are also turned off, such as co-authoring and online file storage. For a list of these other connected experiences, see [Connected experiences in Office](connected-experiences.md).

But even if you set this preference to `FALSE`, limited Office functionality will remain available, such as synching a mailbox in Outlook, and Teams and Skype for Business will continue to work. [Essential services](essential-services.md), such as the licensing service that confirms that you’re properly licensed to use Office, will also remain available.

If the user has an Office 365 (or Microsoft 365) subscription and is signed in with a work or school account or if the user has a volume licensed version of Office 2019 for Mac, then the user can't turn off most connected experiences.

For other users, such as home users with an Office 365 (or Microsoft 365) subscription, a user can choose to turn off most connected experiences by going to **Preferences** > **Privacy**.

## Preference setting for the Required Data Notice dialog for Microsoft AutoUpdate

The first time Version 4.12 or later of Microsoft AutoUpdate (MAU) is launched, users will see a **Required Data Notice** dialog which provides them with information about what data from MAU is sent to Microsoft.

If you don't want your users to see this **Required Data Notice** dialog for Microsoft AutoUpdate, you can set the following preference. Regardless of which value you set, the dialog won't be shown to your users.

|||
|:-----|:-----|
|**Preference Domain**  | `com.microsoft.autoupdate2` |
|**Key**  | `AcknowledgedDataCollectionPolicy`  |
|**Data Type**  | String |
|**Possible values**  | `RequiredDataOnly` <br/> `RequiredAndOptionalData`|
|**Availability** |4.12 and later |

If you let your users see this dialog, then when the user chooses **OK**, the value `RequiredDataOnly` is written to `AcknowledgedDataCollectionPolicy` and the dialog is not shown to the user again.


## Related topics

- [Configuration Profile Reference (Apple developer documentation)](https://go.microsoft.com/fwlink/p/?linkid=852998)
- [Deploy preferences for Office for Mac](../mac/deploy-preferences-for-office-for-mac.md)
- [Account Privacy Settings](https://support.office.com/article/3e7bc183-bf52-4fd0-8e6b-78978f7f121b#ID0EAADAAA=Mac)
