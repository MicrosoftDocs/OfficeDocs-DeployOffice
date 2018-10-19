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

- Set a default preference, which users can change
- Force a particular preference, which users can’t change

The following preferences can be used to simplify account setup for Office 365 mailboxes, help protect company data, and support a streamlined user experience.

These keys are CFPreferences-compatible, which means that it can be set by using enterprise management software for Mac, such as Jamf Pro.

## Automatically configure Office 365 mailbox on first launch

The email address used for Office activation will be added on first launch.

|||
|:-----|:-----|
|**Domain**  | com.microsoft.office |
|**Key** <br/> | |
|**Data Type**  | |
|**Possible values**  |  <br/> |
|**Availability** | |
|**Comments**|  |


## Specify Office 365 mailbox to be added on first launch

Set the domain or full email address of Office 365 mailbox to be added on first launch.

|||
|:-----|:-----|
|**Domain**  | com.microsoft.Outlook |
|**Key** <br/> | |
|**Data Type**  | |
|**Possible values**  |  <br/> |
|**Availability** | |
|**Comments**|  |


## Allow only corporate mailboxes to be added

Specify one or more domains users are allowed to add in Outlook.


|||
|:-----|:-----|
|**Domain**  | com.microsoft.Outlook |
|**Key** <br/> | |
|**Data Type**  | |
|**Possible values**  |  <br/> |
|**Availability** | |
|**Comments**|  |


## Hide text about adding non-corporate mailboxes

Hide the “Did you know? Outlook supports…” text in the **Set Up Your Email** success dialog box.


|||
|:-----|:-----|
|**Domain**  | com.microsoft.Outlook |
|**Key** <br/> | |
|**Data Type**  | |
|**Possible values**  |  <br/> |
|**Availability** | |
|**Comments**|  |

## Hide local folders

Prevent users from viewing local **On My Computer** folders in the sidebar.

|||
|:-----|:-----|
|**Domain**  | com.microsoft.Outlook |
|**Key** <br/> | |
|**Data Type**  | |
|**Possible values**  |  <br/> |
|**Availability** | |
|**Comments**|  |

## Specify when pictures are downloaded for email

Set when pictures are automatically downloaded from the Internet for email.

|||
|:-----|:-----|
|**Domain**  | com.microsoft.Outlook |
|**Key** <br/> | |
|**Data Type**  | |
|**Possible values**  |  <br/> |
|**Availability** | |
|**Comments**|  |

## Disable import

Prevent users from being able to import archive files (.olm and .pst) and Outlook 2011 for Mac data. 

|||
|:-----|:-----|
|**Domain**  | com.microsoft.Outlook |
|**Key** <br/> | |
|**Data Type**  | |
|**Possible values**  |  <br/> |
|**Availability** | |
|**Comments**|  |


## Disable export

Prevent users from being able to export archive files (.olm).


|||
|:-----|:-----|
|**Domain**  | com.microsoft.Outlook |
|**Key** <br/> | |
|**Data Type**  | |
|**Possible values**  |  <br/> |
|**Availability** | |
|**Comments**|  |


## Disable signatures

Prevent users from being able to create, edit, and add client-side signatures.

|||
|:-----|:-----|
|**Domain**  | com.microsoft.Outlook |
|**Key** <br/> | |
|**Data Type**  | |
|**Possible values**  |  <br/> |
|**Availability** | |
|**Comments**|  |


## Specify default weather location

Set default location for weather in calendar view.

|||
|:-----|:-----|
|**Domain**  | com.microsoft.Outlook |
|**Key** <br/> | |
|**Data Type**  | |
|**Possible values**  |  <br/> |
|**Availability** | |
|**Comments**|  |

## Disable automatic updating of weather location 

Prevent users from choosing **Update Location Automatically** for weather location.

|||
|:-----|:-----|
|**Domain**  | com.microsoft.Outlook |
|**Key** <br/> | |
|**Data Type**  | |
|**Possible values**  |  <br/> |
|**Availability** | |
|**Comments**|  |
    
## Specify calendar first day of week 

Set the first day of week in calendar view.

|||
|:-----|:-----|
|**Domain**  | com.microsoft.Outlook |
|**Key** <br/> | |
|**Data Type**  | |
|**Possible values**  |  <br/> |
|**Availability** | |
|**Comments**|  |


## Disable Skype for Business online meetings

Prevent users from adding Skype for Business online meeting details to events.

|||
|:-----|:-----|
|**Domain**  | com.microsoft.Outlook |
|**Key** <br/> | |
|**Data Type**  | |
|**Possible values**  |  <br/> |
|**Availability** | |
|**Comments**|  |


## Disable Microsoft Teams meetings

Prevent users from adding Microsoft Teams online meeting details to events.

|||
|:-----|:-----|
|**Domain**  | com.microsoft.Outlook |
|**Key** <br/> | |
|**Data Type**  | |
|**Possible values**  |  <br/> |
|**Availability** | |
|**Comments**|  |

    
## Related topics

- [Configuration Profile Reference (Apple developer documentation)](https://go.microsoft.com/fwlink/p/?linkid=852998)
- [Deploy preferences for Office for Mac](deploy-preferences-for-office-for-mac.md)
