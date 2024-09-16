---
title: "Set preferences for Outlook for Mac"
ms.author: geokri
author: nicholasswhite
manager: dougeby
audience: ITPro
ms.topic: reference
ms.service: o365-proplus-itpro
ms.subservice: office-mac
ms.localizationpriority: medium
ms.collection: Tier3
recommendations: false
description: "Shows preferences that IT Pros can set for Outlook for Mac and Outlook 2021 for Mac."
ms.date: 09/18/2024
---

# Set preferences for Outlook for Mac

***Applies to:*** *Outlook for Mac, Outlook Long Term Service Channel (LTSC) for Mac 2024, Outlook LTSC for Mac 2021*

The following preferences can be used to simplify account setup for Microsoft 365 mailboxes, help protect company data, and support a streamlined user experience.

As an IT admin, you can provide Mac users in your organization with a standard set of preferences for Outlook in either of the following ways:

- Set a default preference, which users can change.
- Force a particular preference, which users can’t change.

Most preferences can be changed using the Terminal, or via a script. For example:

```console
defaults write com.microsoft.Outlook DefaultWeatherLocation -string 'Paris, France'
```

When you change preferences in Terminal, users can override the value in the Outlook app. To change the value and enforce it so that users can't override it, use a Configuration Profile.

All of these keys are CFPreferences-compatible, which means that they can be set by using enterprise management (MDM) software for Mac, such as Microsoft Intune and Jamf Pro.

> [!IMPORTANT]
> Preferences that are marked as Yes to 'Requires Configuration Profile' in the consecutive tables can only be set via a Configuration Profile. In these case, use of the defaults command is ineffective.

The following list shows the preferences that are covered in this article:

- [Allow only corporate mailboxes to be added](#allow-only-corporate-mailboxes-to-be-added)
- [Allow S/MIME certificates without a matching email address](#allow-smime-certificates-without-a-matching-email-address)
- [Automatically configure Microsoft 365 mailbox on first launch](#automatically-configure-microsoft-365-mailbox-on-first-launch)
- [Block access to mailboxes from unauthorized domains](#block-access-to-mailboxes-from-unauthorized-domains)
- [Disable automatic updating of weather location](#disable-automatic-updating-of-weather-location)
- [Disable calendar sharing permissions](#disable-calendar-sharing-permissions)
- [Disable "Do Not Forward"](#disable-do-not-forward)
- [Disable "Do not send a response"](#disable-do-not-send-a-response)
- [Disable "Encrypt-Only"](#disable-encrypt-only)
- [Disable export](#disable-export)
- [Disable Focused Inbox](#disable-focused-inbox)
- [Disable import](#disable-import)
- [Disable Junk settings](#disable-junk-settings)
- [Disable Pride theme](#disable-pride-theme)
- [Disable retention messages](#disable-retention-messages)
- [Disable setting someone as a delegate](#disable-setting-someone-as-a-delegate)
- [Prevent users from sharing any mail folder with other users](#disable-sharing-of-mail-folders)
- [Disable signatures](#disable-signatures)
- [Disable Skype for Business online meetings](#disable-skype-for-business-online-meetings)
- [Disable S/MIME](#disable-smime)
- [Disable Teams online meetings](#disable-teams-online-meetings)
- [Enable new Outlook](#enable-new-outlook)
- [Hide local folders](#hide-local-folders)
- [Hide text about adding noncorporate mailboxes](#hide-text-about-adding-noncorporate-mailboxes)
- [Set the order in which S/MIME certificates are considered](#set-the-order-in-which-smime-certificates-are-considered)
- [Specify calendar first day of week](#specify-calendar-first-day-of-week)
- [Specify default weather location](#specify-default-weather-location)
- [Specify Microsoft 365 mailbox to be added on first launch](#specify-microsoft-365-mailbox-to-be-added-on-first-launch)
- [Specify when pictures are downloaded for email](#specify-when-pictures-are-downloaded-for-email)
- [Trust AutoDiscover redirects](#trust-autodiscover-redirects)

## Mailbox settings

### Automatically configure Microsoft 365 mailbox on first launch

The email address used for Office activation is added during the first launch.

|Category|Details|
|:-----|:-----|
|Domain| com.microsoft.office |
|Key| OfficeAutoSignIn  |
|Data Type| Boolean |
|Possible values| false (default) <br/> true |
|Requires Configuration Profile| No |
|Availability|16.17 |
|Comments| This key also suppresses first run dialogs for other Office apps, including Word, Excel, PowerPoint, and OneNote.  |

### Specify Microsoft 365 mailbox to be added on first launch

Set the domain or full email address of Microsoft 365 mailbox to be added on first launch.

|Category|Details|
|:-----|:-----|
|Domain| com.microsoft.Outlook |
|Key| DefaultEmailAddressOrDomain|
|Data Type| String|
|Possible values| *Various (example: "contoso.com")*  |
|Requires Configuration Profile| No |
|Availability|16.18 |
|Comments| The full email address or domain specified are added in Outlook instead of the Office activation email address.  |

### Allow only corporate mailboxes to be added

Specify one or more domains users are allowed to add in Outlook.

|Category|Details|
|:-----|:-----|
|Domain| com.microsoft.Outlook |
|Key| AllowedEmailDomains|
|Data Type| Array of Strings |
|Possible values|  *Various (example: "contoso.com")*  |
|Requires Configuration Profile| No |
|Availability| 16.18|
|Comments| Doesn't remove or disconnect accounts already added in Outlook. |

### Block access to mailboxes from unauthorized domains

Specify one or more domains where mailbox access is blocked.

|Category|Details|
|:-----|:-----|
|Domain| com.microsoft.Outlook |
|Key| DisallowedEmailDomains|
|Data Type| Array of Strings |
|Possible values|  *Various (example: "yahoo.com")*  |
|Requires Configuration Profile| No |
|Availability| 16.75|
|Comments| Doesn't remove or disconnect accounts already added in Outlook. |

### Hide text about adding noncorporate mailboxes

Hide the “Did you know? Outlook supports…” text in the **Set Up Your Email** success dialog box.

|Category|Details|
|:-----|:-----|
|Domain| com.microsoft.Outlook |
|Key| HideCanAddOtherAccountTypesTipText|
|Data Type|Boolean   |
|Possible values| false (default) <br/> true  |
|Requires Configuration Profile| No |
|Availability|16.18 |
|Comments| Only hides text. Doesn't affect the ability to add noncorporate mailboxes. |

## Import/export settings

### Disable import

Prevent users from being able to import archive files (.olm and .pst) and Outlook for Mac 2011 data.

|Category|Details|
|:-----|:-----|
|Domain| com.microsoft.Outlook |
|Key|DisableImport |
|Data Type|Boolean |
|Possible values|  false (default) <br/> true  |
|Requires Configuration Profile| Yes |
|Availability|16.18 |

### Disable export

Prevent users from being able to export archive files (.olm).

|Category|Details|
|:-----|:-----|
|Domain| com.microsoft.Outlook |
|Key| DisableExport  |
|Data Type|Boolean |
|Possible values| false (default) <br/> true |
|Requires Configuration Profile| Yes |
|Availability|16.18 |

### Disable sharing of mail folders

Prevent users from sharing any mail folder with other users.

|Category|Details|
|:-----|:-----|
|Domain| com.microsoft.Outlook |
|Key| DisableFolderPermissionsSetup|
|Data Type| Boolean|
|Possible values|  false (default) <br/> true  |
|Requires Configuration Profile| Yes |
|Availability| 16.89|
|Comments|Only applies to the [new Outlook](https://support.microsoft.com/office/6283be54-e74d-434e-babb-b70cefc77439). |

## Meetings settings

### Disable "Do not send a response"

Prevent users from selecting "Do not send response" when replying to a meeting request.

|Category|Details|
|:-----|:-----|
|Domain| com.microsoft.Outlook |
|Key| DisableRespondToMeetingWithoutResponse|
|Data Type| Boolean|
|Possible values|  false (default) <br/> true  |
|Requires Configuration Profile| No |
|Availability| 16.56|

### Disable Skype for Business online meetings

Prevent users from adding Skype for Business online meeting details to events.

|Category|Details|
|:-----|:-----|
|Domain| com.microsoft.Outlook |
|Key| DisableSkypeMeeting|
|Data Type| Boolean|
|Possible values|  false (default) <br/> true  |
|Requires Configuration Profile| Yes |
|Availability| 16.19|

### Disable Teams online meetings

Prevent users from adding Teams online meeting details to events.

|Category|Details|
|:-----|:-----|
|Domain| com.microsoft.Outlook |
|Key| DisableTeamsMeeting|
|Data Type| Boolean|
|Possible values|  false (default) <br/> true  |
|Requires Configuration Profile| Yes |
|Availability| 16.20|

### Disable calendar sharing permissions

Prevent users from sharing their calendar.

|Category|Details|
|:-----|:-----|
|Domain| com.microsoft.Outlook |
|Key| DisableCalendarSharingPermissionsSetup|
|Data Type| Boolean|
|Possible values|  false (default) <br/> true  |
|Requires Configuration Profile| Yes |
|Availability| 16.48|
|Comments|Only applies to the [new Outlook](https://support.microsoft.com/office/6283be54-e74d-434e-babb-b70cefc77439). |

### Disable setting someone as a Delegate

Prevent a user from adding another user as their delegate.

|Category|Details|
|:-----|:-----|
|Domain| com.microsoft.Outlook |
|Key| DisableDelegationPermissionsSetup|
|Data Type| Boolean|
|Possible values|  false (default) <br/> true  |
|Requires Configuration Profile| Yes |
|Availability| 16.48|
|Comments|Only applies to the [new Outlook](https://support.microsoft.com/office/6283be54-e74d-434e-babb-b70cefc77439). |

## Security settings

### Disable "Encrypt-Only"

Prevent users from applying the **Encrypt-Only** option to emails when using Microsoft Purview Message Encryption.

|Category|Details|
|:-----|:-----|
|Domain| com.microsoft.Outlook |
|Key|DisableEncryptOnly |
|Data Type| Boolean |
|Possible values| false (default) <br/> true  |
|Requires Configuration Profile| No |
|Availability|16.40 |
|Comments|Only applies to the [new Outlook](https://support.microsoft.com/office/6283be54-e74d-434e-babb-b70cefc77439). |

### Disable "Do Not Forward"

Prevent users from applying the **Do Not Forward** option to emails when using Microsoft Purview Message Encryption.

|Category|Details|
|:-----|:-----|
|Domain| com.microsoft.Outlook |
|Key|DisableDoNotForward |
|Data Type|Boolean  |
|Possible values| false (default) <br/> true  |
|Requires Configuration Profile| No |
|Availability|16.40 |
|Comments|Only applies to the [new Outlook](https://support.microsoft.com/office/6283be54-e74d-434e-babb-b70cefc77439). |

### Allow S/MIME certificates without a matching email address

Allow users to decrypt and encrypt S/MIME messages when the S/MIME certificate doesn't match the email address.

|Category|Details|
|:-----|:-----|
|Domain| com.microsoft.Outlook |
|Key|AllowCertsWithoutMatchingEmailAddress|
|Data Type|Boolean  |
|Possible values| false (default) <br/> true  |
|Requires Configuration Profile| No |
|Availability|16.45 |
|Comments|Only applies to the [new Outlook](https://support.microsoft.com/office/6283be54-e74d-434e-babb-b70cefc77439). |

### Set the order in which S/MIME certificates are considered

Set the order in which certificates are used to decrypt and encrypt S/MIME messages.

|Category|Details|
|:-----|:-----|
|Domain| com.microsoft.Outlook |
|Key|SMIMECertificatesLookupOrder|
|Data Type|Array of unsigned integer  |
|Possible values| 0 (Contacts), 1 (GAL), 2 (Device), 3 (LDAP) <br/> Default is [0, 1, 2, 3] |
|Requires Configuration Profile| No |
|Availability|16.45 |
|Comments|Only applies to the [new Outlook](https://support.microsoft.com/office/6283be54-e74d-434e-babb-b70cefc77439). |

### Disable S/MIME

Prevent users from applying S/MIME option to email messages.

|Category|Details|
|:-----|:-----|
|Domain| com.microsoft.Outlook |
|Key|DisableSMIMECompose|
|Data Type|Boolean  |
|Possible values| false (default) <br/> true  |
|Requires Configuration Profile| No |
|Availability|16.57 |
|Comments|Only applies to the [new Outlook](https://support.microsoft.com/office/6283be54-e74d-434e-babb-b70cefc77439). |

### Trust AutoDiscover redirects

Automatically trust server redirects through AutoDiscover.

|Category|Details|
|:-----|:-----|
|Domain| com.microsoft.Outlook |
|Key|TrustO365AutodiscoverRedirect|
|Data Type|Boolean  |
|Possible values| false (default) <br/> true  |
|Requires Configuration Profile| No |
|Availability|15.29 |
|Comments|When set to 'true' users aren't prompted to Allow or Deny redirects from AutoDiscover. They're automatically allowed.|

## Weather location settings

### Specify default weather location

Set default location for weather in calendar view.

|Category|Details|
|:-----|:-----|
|Domain| com.microsoft.Outlook |
|Key|DefaultWeatherLocation  |
|Data Type|String  |
|Possible values| *Various (example: "Paris, France")* |
|Requires Configuration Profile| No |
|Availability|16.18 |
|Comments| Use the format returned by the weather location search within Outlook. |

### Disable automatic updating of weather location 

Prevent users from choosing **Update Location Automatically** for weather location.

|Category|Details|
|:-----|:-----|
|Domain| com.microsoft.Outlook |
|Key| Weather_update_automatically |
|Data Type|Boolean |
|Possible values| false (default) <br/> true  |
|Requires Configuration Profile| No |
|Availability|16.19 |

## Other settings

### Hide local folders

Prevent users from viewing local **On My Computer** folders in the sidebar.

|Category|Details|
|:-----|:-----|
|Domain| com.microsoft.Outlook |
|Key| HideFoldersOnMyComputerRootInFolderList|
|Data Type|Boolean |
|Possible values|  false (default) <br/> true  |
|Requires Configuration Profile| No |
|Availability| 16.17 |
|Comments| Found under **Outlook** > **Preferences** > **General** > **Sidebar**. |

### Specify when pictures are downloaded for email

Set when pictures are automatically downloaded from the internet for email.

|Category|Details|
|:-----|:-----|
|Domain| com.microsoft.Outlook |
|Key|AutomaticallyDownloadExternalContent |
|Data Type|Integer   |
|Possible values| 0 = Never <br/> 1 = In messages from my contacts  <br/> 2 = In all messages  (default) |
|Requires Configuration Profile| No |
|Availability|16.17 |
|Comments| Found under **Outlook** > **Settings** > **Email** > **Reading** > **Download external images**.  |

### Disable signatures

Prevent users from being able to create, edit, and add client-side signatures.

|Category|Details|
|:-----|:-----|
|Domain| com.microsoft.Outlook |
|Key|DisableSignatures  |
|Data Type| Boolean|
|Possible values|  false (default) <br/> true  |
|Requires Configuration Profile| Yes |
|Availability|16.18 |

### Specify calendar first day of week 

Set the first day of week in calendar view.

|Category|Details|
|:-----|:-----|
|Domain| com.microsoft.Outlook |
|Key| CalendarFirstDayOfWeek|
|Data Type| Integer |
|Possible values| 1 = Sunday (default) <br/> 2 = Monday  <br/> 3 = Tuesday <br/> 4 = Wednesday  <br/> 5 = Thursday <br/> 6 = Friday   <br/> 7 = Saturday  |
|Requires Configuration Profile| No |
|Availability|16.19 |

### Enable new Outlook

Set the availability and default position of the [New Outlook](https://support.microsoft.com/office/6283be54-e74d-434e-babb-b70cefc77439) switch.

|Category|Details|
|:-----|:-----|
|Domain| com.microsoft.Outlook |
|Key| EnableNewOutlook|
|Data Type| Integer |
|Possible values| 0 = Switch hidden <br/> 1 = Switch displayed, default off  <br/> 2 = Switch displayed, default on (default) <br/> 3 = New Outlook enabled with switch hidden |
|Requires Configuration Profile| No |
|Availability|16.38 |

### Disable Junk settings

Prevent users from applying Junk options to emails.

|Category|Details|
|:-----|:-----|
|Domain| com.microsoft.Outlook |
|Key|DisableJunkOptionsPrefKey|
|Data Type|Boolean  |
|Possible values| false (default) <br/> true  |
|Requires Configuration Profile| No |
|Availability|16.55 |
|Comments|Only applies to the [new Outlook](https://support.microsoft.com/office/6283be54-e74d-434e-babb-b70cefc77439). |

### Disable Pride theme

Prevent users from applying Pride themes to Outlook.

|Category|Details|
|:-----|:-----|
|Domain| com.microsoft.Outlook |
|Key|DisablePrideTheming|
|Data Type|Boolean  |
|Possible values| false (default) <br/> true  |
|Requires Configuration Profile| Yes |
|Availability|16.73 |
|Comments|Only applies to the [new Outlook](https://support.microsoft.com/office/6283be54-e74d-434e-babb-b70cefc77439). |

### Disable retention messages

Hide information about message retention settings when viewing message contents.

|Category|Details|
|:-----|:-----|
|Domain| com.microsoft.Outlook |
|Key|HideRetentionPolicyInfobar|
|Data Type|Boolean  |
|Possible values| false (default) <br/> true  |
|Requires Configuration Profile| No |
|Availability|16.78 |
|Comments|Only applies to the [new Outlook](https://support.microsoft.com/office/6283be54-e74d-434e-babb-b70cefc77439). |

### Disable Focused Inbox

Prevent users from viewing Focused Inbox.

|Category|Details|
|:-----|:-----|
|Domain| com.microsoft.Outlook |
|Key| DisableFocusedInbox|
|Data Type|Boolean |
|Possible values|  false (default) <br/> true  |
|Requires Configuration Profile| Yes |
|Availability| 16.66 |

## Related articles

- [Configuration Profile Reference (Apple developer documentation)](https://developer.apple.com/business/documentation/Configuration-Profile-Reference.pdf)
- [Deploy preferences for Office for Mac](deploy-preferences-for-office-for-mac.md)
