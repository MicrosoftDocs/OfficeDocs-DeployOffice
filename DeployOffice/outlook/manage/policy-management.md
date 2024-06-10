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
Admins can provide Windows users in your organization with a standard set of policies for New Outlook that are essential for maintaining security, productivity, and data integrity within an organization by using Exchange PowerShell cmdlets and Cloud Policy. 

Most policies configure the features that are available for the mailbox accounts in their organization and help protect company data and customize the user experience. These policies affect the configuration of any Outlook app where the organization mailbox is present. 

You can manage most features with Exchange PowerShell cmdlets. However, for features that span multiple Microsoft 365 experiences, like Loop and in-product Feedback, as well as settings for Diagnostic Data and Connected Experiences, you should use Cloud Policy. 

> [!IMPORTANT]
> Several App-wide settings, including Theme, Text Size and Spacing, and Diagnostic Data and Connected Experiences are associated with the first account added in new Outlook. This account is considered as the primary account. 
>
> While policies can be applied to any organization account in new Outlook, management of app-wide settings like Theme, Diagnostic Data, and Connected Experiences requires the designated account to be set as primary. 

> [!IMPORTANT]
> Most features like Focused Inbox and Loop are specific to each account. If you disable these features, they turn off only for that account. However, in new Outlook, other features are disabled at the organization level, for example, if any account has in-product feedback disabled, the feature becomes unavailable for all accounts. 

> [!IMPORTANT]
> Most of the mailbox policies are applicable for both OWA and Monarch, so you can’t have it enabled in one client but not the other.  

The following list shows the preferences that are covered in this article: 
add list of contents

## Allow only corporate mailboxes to be added 

There are two Mailbox Policies that should be used to allow only corporate mailboxes to be added to the new Outlook: 

With the `AllowedOrganizationAccountDomains` parameter, admins can specify one or more domains which are allowed to be added in Outlook. Check the syntax at [Set-OwaMailboxPolicy - Allowed Organization Account Domains](/powershell/module/exchange/set-owamailboxpolicy#-allowedorganizationaccountdomains)

Moreover, the `PersonalAccountsEnabled` parameter specifies whether to allow users to add their personal accounts. Check the syntax at [Set-owamailboxpolicy - personalaccountsenabled](/powershell/module/exchange/set-owamailboxpolicy#-personalaccountsenabled) 

## Set Primary Account 
Users can change the primary account in Settings > Accounts > Email accounts > Manage for the account they want to designate as primary.

:::image type="content" source="../manage/media/policy-management/policy-email-accounts-settings.png" alt-text="Screenshot that shows how to change the primary account in Email accounts Settings." lightbox="../manage/media/policy-management/policy-email-accounts-settings-lb.png":::

We’re rolling out a new policy, *ChangeSettingsAccountEnabled* in the `OwaMailboxPolicy` cmdlet that allows organizations to set the organization account as primary so companies can ensure their policies will be applied. For more information about this policy, see [Set-OwaMailboxPolicy](/powershell/module/exchange/set-owamailboxpolicy#-changesettingsaccountenabled).

## Disable automatic updating of weather location
The Weather Enabled parameter specifies whether to enable or disable weather information in the calendar in Outlook on the web. Check the syntax at [Set-owamailboxpolicy - weatherEnabled](/powershell/module/exchange/set-owamailboxpolicy#-weatherEnabled)

## Disable Focused Inbox
There are two different policies - one in `set-mailboxmessageconfiguration : IsFocusedInboxEnabled` and another one in `set-organizationconfig: FocusedInboxOn`.

## Configure Junk settings
### Junk Mail Configuration
Junk Mail Configuration is another cmdlet on the organizational-level management that allows companies to foster an agile and adaptable IT infrastructure that is well-equipped to meet the diverse needs of a modern workforce.<br>
Admins should use the Microsoft Defender portal to [configure spam filter policies](/defender-office-365/anti-spam-policies-configure) adjusting bulk mail thresholds and configure safe senders and blocked lists using the junk email settings on Exchange Online mailboxes.<br> 
For more information, see [Set-MailboxJunkEmailConfiguration](/defender-office-365/configure-junk-email-settings-on-exo-mailboxes).
 
## Disable signatures
SignaturesEnabled

## Disable archive messages

## Specify calendar first day of week
### Calendar Management
`Set-MailboxCalendarConfiguration` is another cmdlet for managing various features and capabilities for Calendar, including:
- Working Hours, Work Week, Shorten appointments and meetings, etc. <br>
For more information, see [Set-MailboxCalendarConfiguration](/powershell/module/exchange/set-mailboxcalendarconfiguration) 

## Automatically configure account based on Active Directory Primary SMTP address
Add information about new Intune Policy

## Specify what attachments can be downloaded
Allowing certain file types (attachments)	
`AllowedFileTypes` and `BlockedFileTypes`

## Disable Third part online attachments
	
```AdditionalStorageProvidersAvailable```

## Disable Preview Links
## Disable Offline
(only applicable for New Outlook for Windows)	`OfflineEnabledWin	$true`

## Enable Location Suggestions
Location Suggestions	`PlacesEnabled	$true`
## Enable Themes and Dark Mode
## Disable Read Receipt Responses
##  Disable Suggested Replies
`OrganizationConfig` is a cmdlet that supports a seamless user experience, as employees can transition effortlessly between devices and platforms without encountering discrepancies in functionality or accessibility for the following features:
`Set-OrganizationConfig – Suggested Replies`.


## Disable Microsoft Loop
[Loop components in Outlook](https://support.microsoft.com/office/use-loop-components-in-outlook-9b47c279-011d-4042-bd7f-8bbfca0cb136) are portable, editable pieces of content that stay in sync across all the places they’re shared.

For more information, see [Manage Loop components in OneDrive and SharePoint](/microsoft-365/loop/loop-components-configuration).

## Disable Diagnostic Data and Connected Experiences
Organizations can control whether connected experiences or diagnostic data can be sent from the new Outlook for Windows. This capability is part of our commitment to giving you the information and controls over your privacy.

:::image type="content" source="../manage/media/policy-management/policy-privacy-settings.png" alt-text="Screenshot that shows how to turn on optional connected experiences in privacy settings." lightbox="../manage/media/policy-management/policy-privacy-settings-lb.png":::

For more information, see [Use policy settings to manage privacy controls for Microsoft 365 Apps for enterprise](/deployoffice/privacy/manage-privacy-controls).

## Disable In-product feedback
New Outlook provides [in-product feedback](/microsoft-365/admin/misc/feedback-user-control#in-product-feedback) that can be managed as part of Microsoft 365 wide settings for Feedback in Cloud Policy:

:::image type="content" source="../manage/media/policy-management/policy-feeback.png" alt-text="Screenshot that shows how to provide in-product feedback through Feedback to Microsoft." lightbox="../manage/media/policy-management/policy-feeback-lb.png":::

For more information, see [Manage Microsoft feedback for your organization](/microsoft-365/admin/manage/manage-feedback-ms-org).

## Disable toggle from classic Outlook for Windows
Some organizations could use a policy to block the toggle from appearing in the classic Outlook for Windows until they’re ready to migrate. For guidance on this policy, see [Enable or disable access to the new Outlook for Windows](/exchange/clients-and-mobile-in-exchange-online/outlook-on-the-web/enable-disable-employee-access-new-outlook#use-the-registry-to-enable-or-disable-the-new-outlook-toggle-in-outlook-desktop).

While this policy hides the toggle within the application, it doesn’t block the mailbox from being added to the new Outlook for Windows. A separate Exchange policy can be used to block organization mailboxes from being added to new Outlook. For guidance on this policy, see [Enable or disable access to the new Outlook for Windows](/exchange/clients-and-mobile-in-exchange-online/outlook-on-the-web/enable-disable-employee-access-new-outlook#enable-or-disable-the-new-outlook-for-windows-for-an-individual-mailbox).

Users can enable new Outlook via the toggle from the Mail and Calendar application that ship with Windows. To block new Outlook from these applications, organizations can block users from downloading and/or installing new Outlook using Intune or other management solutions.

Organizations can also block the user of Mail and Calendar with organization accounts via the `UniversalOutlookEnabled` parameter in CASMailbox: [Set-CASMailbox](/powershell/module/exchange/set-casmailbox).
