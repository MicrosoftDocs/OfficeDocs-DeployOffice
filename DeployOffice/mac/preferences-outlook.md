---
title: "Set preferences for Outlook for Mac"
ms.author: danbrown
author: DHB-MSFT
manager: laurawi
ms.audience: ITPro
ms.topic: article
ms.service: o365-proplus-itpro
localization_priority: Normal
ms.collection: Ent_O365
ms.custom: Ent_Office_Mac
description: "Shows preferences that IT Pros can set for Outlook for Mac and Outlook 2019 for Mac"
---

# Set preferences for Outlook for Mac

***Applies to:*** *Outlook for Mac, Outlook 2019 for Mac*

As an IT admin, you may want to provide Outlook for Mac users in your organization with a standard set of preferences in either of the following ways:

- Set a default preference, which users can change.
- Force a particular preference, which users can’t change.

The following preferences can be used to simplify account setup for Office 365 mailboxes, help protect company data, and support a streamlined user experience.

These keys are CFPreferences-compatible, which means that it can be set by using enterprise management software for Mac, such as Jamf Pro.

## Mailbox settings

### Automatically configure Office 365 mailbox on first launch

The email address used for Office activation will be added on first launch.

|||
|:-----|:-----|
|**Domain**  | com.microsoft.office |
|**Key**  | OfficeAutoSignIn  |
|**Data Type**  | Boolean |
|**Possible values**  | false (default) <br/> true |
|**Availability** |16.17 |
|**Comments**| This key also suppresses first run dialogs for other Office apps, including Word, Excel, PowerPoint, and OneNote.  |



### Specify Office 365 mailbox to be added on first launch

Set the domain or full email address of Office 365 mailbox to be added on first launch.

|||
|:-----|:-----|
|**Domain**  | com.microsoft.Outlook |
|**Key**  | DefaultEmailAddressOrDomain|
|**Data Type**  | String|
|**Possible values**  | *various (example: "contoso.com")*  |
|**Availability** |16.18 |
|**Comments**| The full email address or domain specified will be added in Outlook instead of the Office activation email address.  |


### Allow only corporate mailboxes to be added

Specify one or more domains users are allowed to add in Outlook.

|||
|:-----|:-----|
|**Domain**  | com.microsoft.Outlook |
|**Key**  | AllowedEmailDomains|
|**Data Type**  | Array of Strings |
|**Possible values**  |  *Various (example: "'contoso\\\\.com$'")*  |
|**Availability** | 16.18|
|**Comments**| Format strings as regular expressions. Does not remove or disconnect accounts already added in Outlook. |


### Hide text about adding non-corporate mailboxes

Hide the “Did you know? Outlook supports…” text in the **Set Up Your Email** success dialog box.

|||
|:-----|:-----|
|**Domain**  | com.microsoft.Outlook |
|**Key** | HideCanAddOtherAccountTypesTipText|
|**Data Type**  |Boolean   |
|**Possible values**  | false (default) <br/> true  |
|**Availability** |16.18 |
|**Comments**| Only hides text. Does not impact ability to add non-corporate mailboxes. |


## Import/export settings

### Disable import

Prevent users from being able to import archive files (.olm and .pst) and Outlook 2011 for Mac data. 

|||
|:-----|:-----|
|**Domain**  | com.microsoft.Outlook |
|**Key**  |DisableImport |
|**Data Type**  |Boolean |
|**Possible values**  |  false (default) <br/> true  |
|**Availability** |16.18 |
|**Comments**| Key must be set to true and forced. |


### Disable export

Prevent users from being able to export archive files (.olm).

|||
|:-----|:-----|
|**Domain**  | com.microsoft.Outlook |
|**Key**  | DisableExport  |
|**Data Type**  |Boolean |
|**Possible values**  | false (default) <br/> true |
|**Availability** |16.18 |
|**Comments**| Key must be set to true and forced. |


## Online meetings settings

### Disable Skype for Business online meetings

Prevent users from adding Skype for Business online meeting details to events.

|||
|:-----|:-----|
|**Domain**  | com.microsoft.Outlook |
|**Key**  | DisableSkypeMeeting|
|**Data Type**  | Boolean|
|**Possible values**  |  false (default) <br/> true  |
|**Availability** | 16.19|
|**Comments**| Key must be set to true and forced. |


## Weather location settings

### Specify default weather location

Set default location for weather in calendar view.

|||
|:-----|:-----|
|**Domain**  | com.microsoft.Outlook |
|**Key** |DefaultWeatherLocation  |
|**Data Type**  |String  |
|**Possible values**  | *Various (example: “Paris, France”)* |
|**Availability** |16.18 |
|**Comments**| Use the format returned by the weather location search within Outlook. |

### Disable automatic updating of weather location 

Prevent users from choosing **Update Location Automatically** for weather location.

|||
|:-----|:-----|
|**Domain**  | com.microsoft.Outlook |
|**Key**  | Weather_update_automatically |
|**Data Type**  |Boolean |
|**Possible values**  | false (default) <br/> true  |
|**Availability** |16.19 |


## Other settings
    
### Hide local folders

Prevent users from viewing local **On My Computer** folders in the sidebar.

|||
|:-----|:-----|
|**Domain**  | com.microsoft.Outlook |
|**Key**  | HideFoldersOnMyComputerRootInFolderList|
|**Data Type**  |Boolean |
|**Possible values**  |  false (default) <br/> true  |
|**Availability** | 16.17 |
|**Comments**| Found under **Outlook** > **Preferences** > **General** > **Sidebar**. |

### Specify when pictures are downloaded for email

Set when pictures are automatically downloaded from the Internet for email.

|||
|:-----|:-----|
|**Domain**  | com.microsoft.Outlook |
|**Key**  |AutomaticallyDownloadExternalContent |
|**Data Type**  |Integer   |
|**Possible values**  | 0 = Never (default) <br/> 1 = In messages from my contacts  <br/> 2 = In all messages  |
|**Availability** |16.17 |
|**Comments**| Found under **Outlook** > **Preferences** > **Email** > **Reading** > **Security**.  |


### Disable signatures

Prevent users from being able to create, edit, and add client-side signatures.

|||
|:-----|:-----|
|**Domain**  | com.microsoft.Outlook |
|**Key**  |DisableSignatures  |
|**Data Type**  | Boolean|
|**Possible values**  |  false (default) <br/> true  |
|**Availability** |16.18 |
|**Comments**| Key must be set to true and forced. |


### Specify calendar first day of week 

Set the first day of week in calendar view.

|||
|:-----|:-----|
|**Domain**  | com.microsoft.Outlook |
|**Key** | CalendarFirstDayOfWeek|
|**Data Type**  | Integer |
|**Possible values**  | 1 = Sunday (default) <br/> 2 = Monday  <br/> 3= Tuesday <br/> 4= Wednesday  <br/> 5= Thursday <br/> 6 = Friday   <br/> 7 = Saturday  |
|**Availability** |16.19 |

    
## Related topics

- [Configuration Profile Reference (Apple developer documentation)](https://go.microsoft.com/fwlink/p/?linkid=852998)
- [Deploy preferences for Office for Mac](deploy-preferences-for-office-for-mac.md)
