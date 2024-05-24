---
title: "Policy Management"
ms.author: janellem
author: JanelleMcIntosh-MSFT
manager: triciag
audience: ITPro
ms.topic: overview
ms.service: outlook
ms.collection: Tier1
ms.localizationpriority: medium
ms.custom: intro-overview
recommendations: true
description: "Provides guidelines for configuring and managing mailbox accounts and features in Microsoft 365 using Exchange PowerShell cmdlets and Cloud Policy."
ms.date: 11/09/2023
---

# Policy Management
Admins can configure available features for mailbox accounts in their organization using Exchange PowerShell cmdlets and Cloud Policy. These features affect the configuration of any app where the organization mailbox is added. You can manage most features with Exchange PowerShell cmdlets. However, for features that span multiple Microsoft 365 experiences, like Loop and in-product Feedback, as well as settings for Diagnostic Data and Connected Experiences, you should use Cloud Policy.

## Accounts and policies
App-wide settings, including Theme, Text Size and Spacing, and Diagnostic Data and Connected Experiences are associated with the first account added in new Outlook. This account is called the primary account. 

Users can change the primary account in Settings > Accounts > Email accounts > Manage for the account they want to designate as primary.

:::image type="content" source="../manage/media/policy-management/policy-email-accounts-settings.png" alt-text="Screenshot that shows how to change the primary account in Email accounts Settings." lightbox="../manage/media/policy-management/policy-email-accounts-settings-lb.png":::

We’re rolling out a new policy, *ChangeSettingsAccountEnabled* in the `OwaMailboxPolicy` cmdlet that allows organizations to set the organization account as primary. For more information about this policy, see [Set-OwaMailboxPolicy](/powershell/module/exchange/set-owamailboxpolicy#-changesettingsaccountenabled).

> [!IMPORTANT]
> While policies can be applied to any organization account in new Outlook, management of app-wide settings like Theme, Diagnostic Data, and Connected Experiences requires the designated account to be set as primary.

Features like Focused Inbox and Loop are specific to each account. If you disable these features, they turn off only for that account. However, in new Outlook, if any account has in-product feedback disabled, the feature becomes unavailable for all accounts.

## Exchange policies
Policy management for mailboxes in the new Outlook for Windows follows the same set of Exchange PowerShell cmdlets as Outlook on the Web. To apply an Exchange cmdlet to configure an organization mailbox, you need to follow these steps documented here: [Set-OwaMailboxPolicy](/powershell/module/exchange/set-owamailboxpolicy#examples).

OwaMailboxPolicy is used to manage the following various features and capabilities:
### Accounts and Protocol Management  
- Login allowed only on Compliant Devices 
  - The Conditional Access Intune policy is about how you can ensure that users can login on only compliant devices. 
- Allowing Personal Accounts
  * The [PersonalAccountsEnabled](/powershell/module/exchange/set-owamailboxpolicy#-personalaccountsenabled) parameter specifies whether to allow users to add their personal accounts (for example, Outlook.com, Gmail, or Yahoo!) in the new Outlook for Windows.
- Enabling Active Sync 

### Data Loss Prevention and Attachments 
- Allowing certain file types (attachments)
  - The [AllowedFileTypes](/powershell/module/exchange/set-owamailboxpolicy#-allowedfiletypes) and BlockedFileTypes policies specify the attachment file types (file extensions) that can be saved locally or viewed from the new Outlook for Windows. 
- Third party online attachments Enabled 
  - The [AdditionalStorageProvidersAvailable](/powershell/module/exchange/set-owamailboxpolicy#-additionalstorageprovidersavailable) policy specifies whether to allow additional storage providers (for example, Box, Dropbox, Facebook, Google Drive, Egnyte, personal OneDrive) attachments in the new Outlook for Windows. 
- Display pictures and external content in HTML e-mail 
  - ExternalImageProxyEnabled   
- Read Only Capabilities and Prevent attachment download on Public devices 
  - If your tenant doesn't have Intune, you can still configure read-only access on using OWA Mailbox Policy – Conditional Access. 
- Junk Mail Configuration on the other hand doesn't have a specific Outlook policy, new Outlook respects the safe and blocked senders configured in Microsoft Defender. 
- Public Folders and Shared Mailboxes 
  - PublicFoldersEnabled 
- Offline Configuration
  - The [OfflineEnabledWin](/powershell/module/exchange/set-owamailboxpolicy#-offlineenabledwin) parameter specifies whether to allow the new Outlook for Windows to be used offline.       

### Calendar Management  
`Set-CalendarMailbox` is another cmdlet for managing various features and capabilities for Calendar, including:   
- Interesting Calendars
  - The `InterestingCalendarsEnabled` parameter specifies whether interesting calendars are available in Outlook on the web. [Check the parameters here.](/powershell/module/exchange/set-owamailboxpolicy#-interestingcalendarsenabled) 
  - Weather in Calendar
    - The `WeatherEnabled` parameter specifies whether to enable or disable weather information in the calendar in new Outlook for Windows. [Check the parameters here.](/powershell/module/exchange/set-owamailboxpolicy#-weatherenabled)
  - Working Hours, Work Week, Shorten appointments and meetings, and other configurations are also available on `OWA-CalendarMailbox` cmdlet. 
  - Location Suggestions
    - The `PlacesEnabled` parameter specifies whether to enable or disable Places in the new Outlook for Windows. Places lets users search, share, and map location details by using Bing.

## Specific Features 

`OrganizationConfig` is another cmdlet for managing various features and capabilities, including:
- Focused Inbox
- MailTips
- Suggested Replies

For more information, see [Set-OrganizationConfig](/powershell/module/exchange/set-organizationconfig).

## Mail Formatting 

`MailboxMessageConfiguration` is another cmdlet for managing various Mail Reading and Composing capabilities, including: 
- Preferred Font Flags, Name, Size, Colors 
- Allow Signatures 
- Focused Inbox 
- Preview Links 
- Dark Mode 
- Themes 
- Request Accessible Content 
- Read Receipt Responses 

## Microsoft Loop
[Loop components in Outlook](https://support.microsoft.com/office/use-loop-components-in-outlook-9b47c279-011d-4042-bd7f-8bbfca0cb136) are portable, editable pieces of content that stay in sync across all the places they’re shared.

For more information, see [Manage Loop components in OneDrive and SharePoint](/microsoft-365/loop/loop-components-configuration).

## Diagnostic Data and Connected Experiences
Organizations can control whether connected experiences or diagnostic data can be sent from the new Outlook for Windows. This capability is part of our commitment to provide you information and control over your privacy.

:::image type="content" source="../manage/media/policy-management/policy-privacy-settings.png" alt-text="Screenshot that shows how to turn on optional connected experiences in privacy settings." lightbox="../manage/media/policy-management/policy-privacy-settings-lb.png":::

For more information, see [Use policy settings to manage privacy controls for Microsoft 365 Apps for enterprise](/deployoffice/privacy/manage-privacy-controls).

## In-product feedback
New Outlook provides [in-product feedback](/microsoft-365/admin/misc/feedback-user-control#in-product-feedback) that can be managed as part of Microsoft 365 wide settings for Feedback in Cloud Policy:

:::image type="content" source="../manage/media/policy-management/policy-feeback.png" alt-text="Screenshot that shows how to provide in-product feedback through Feedback to Microsoft." lightbox="../manage/media/policy-management/policy-feeback-lb.png":::

For more information, see [Manage Microsoft feedback for your organization](/microsoft-365/admin/manage/manage-feedback-ms-org).

## Disable toggle from classic Outlook for Windows
Some organizations could use a policy to block the toggle from appearing in the classic Outlook for Windows until they’re ready to migrate. For guidance on this policy, see [Use the registry to enable or disable the new Outlook toggle in Outlook Desktop](/exchange/clients-and-mobile-in-exchange-online/outlook-on-the-web/enable-disable-employee-access-new-outlook#use-the-registry-to-enable-or-disable-the-new-outlook-toggle-in-outlook-desktop).

While this policy hides the toggle within the application, it doesn’t block the mailbox from being added to the new Outlook for Windows. A separate Exchange policy can be used to block organization mailboxes from being added to the new Outlook. For guidance on this policy, see [Enable or disable access to the new Outlook for Windows](/exchange/clients-and-mobile-in-exchange-online/outlook-on-the-web/enable-disable-employee-access-new-outlook#enable-or-disable-the-new-outlook-for-windows-for-an-individual-mailbox).

Users can enable new Outlook via the toggle from the Mail and Calendar application that ships with Windows. To block new Outlook from these applications, organizations can block users from downloading and/or installing new Outlook using Intune or other management solutions.

Organizations can also block the user of Mail and Calendar with organization accounts via the `UniversalOutlookEnabled` parameter in CASMailbox: [Set-CASMailbox](/powershell/module/exchange/set-casmailbox).
